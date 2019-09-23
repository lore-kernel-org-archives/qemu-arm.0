Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o19sm16812013wro.50.2019.09.23.16.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 16:00:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 802911FF87;
	Tue, 24 Sep 2019 00:00:12 +0100 (BST)
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-5-alex.bennee@linaro.org>
 <20190923205115.GE6528@dhcp-17-179.bos.redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: Re: [PATCH v2 04/16] tests/docker: reduce scary warnings from
 failed inspect
In-reply-to: <20190923205115.GE6528@dhcp-17-179.bos.redhat.com>
Date: Tue, 24 Sep 2019 00:00:12 +0100
Message-ID: <87h852boub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: U0GmJwDyQd/V


Cleber Rosa <crosa@redhat.com> writes:

> On Thu, Sep 19, 2019 at 06:10:03PM +0100, Alex Benn=C3=A9e wrote:
>> There is a race here in the clean-up code so lets just accept that
>> sometimes the active task we just looked up might have finished before
>> we got to inspect it.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/docker.py | 32 ++++++++++++++++++--------------
>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
>> index 29613afd489..4dca6006d2f 100755
>> --- a/tests/docker/docker.py
>> +++ b/tests/docker/docker.py
>> @@ -235,20 +235,24 @@ class Docker(object):
>>          if not only_active:
>>              cmd.append("-a")
>>          for i in self._output(cmd).split():
>> -            resp =3D self._output(["inspect", i])
>> -            labels =3D json.loads(resp)[0]["Config"]["Labels"]
>> -            active =3D json.loads(resp)[0]["State"]["Running"]
>> -            if not labels:
>> -                continue
>> -            instance_uuid =3D labels.get("com.qemu.instance.uuid", None)
>> -            if not instance_uuid:
>> -                continue
>> -            if only_known and instance_uuid not in self._instances:
>> -                continue
>> -            print("Terminating", i)
>> -            if active:
>> -                self._do(["kill", i])
>> -            self._do(["rm", i])
>> +            try:
>> +                resp =3D self._output(["inspect", i])
>> +                labels =3D json.loads(resp)[0]["Config"]["Labels"]
>> +                active =3D json.loads(resp)[0]["State"]["Running"]
>> +                if not labels:
>> +                    continue
>> +                instance_uuid =3D labels.get("com.qemu.instance.uuid", =
None)
>> +                if not instance_uuid:
>> +                    continue
>> +                if only_known and instance_uuid not in self._instances:
>> +                    continue
>> +                print("Terminating", i)
>> +                if active:
>> +                    self._do(["kill", i])
>> +                    self._do(["rm", i])
>
> Both podman and docker seem to handle "rm -f $INSTANCE" well, which
> would by itself consolidate the two commands in one and minimize the
> race condition.

It's the self.__output which is the real race condition because
check_output complains if the command doesn't succeed with 0. What we
really need is to find somewhat of filtering the ps just for qemu
instances and then just rm -f them as you suggest.

>
> For unexisting containers, and no other errors, podman will return "1
> if one of the specified containers did not exist, and no other
> failure", as per its man page.  I couldn't find any guarantee that
> docker will also return 1 on a similar situation, but that's what
> I've experienced too:
>
>  $ docker rm -f CONTAINER_IS_NOW_FONE
>  Error response from daemon: No such container: CONTAINER_IS_NOW_GONE
>  $ echo $?
>  1
>
> Maybe waiving exit status 1 and nothing else would do the trick here
> and not hide other real problems?
>
> - Cleber.
>
>> +            except subprocess.CalledProcessError:
>> +                # i likely finished running before we got here
>> +                pass
>>
>>      def clean(self):
>>          self._do_kill_instances(False, False)
>> --
>> 2.20.1
>>
>>


--
Alex Benn=C3=A9e
