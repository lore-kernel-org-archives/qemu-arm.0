Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3107069wrp;
        Mon, 23 Sep 2019 13:51:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBv+25yQtF9Sn+5IgiznC5KuU0X1pqFO7FRyyesA0NUhGwLO+gTXom8yuTssS4T0lpG+je
X-Received: by 2002:a5d:91da:: with SMTP id k26mr1416815ior.90.1569271878512;
        Mon, 23 Sep 2019 13:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569271878; cv=none;
        d=google.com; s=arc-20160816;
        b=qp4cLSnPHl/5UXcEwlQMFE21IIi+/z9Yt2LoFgeaVJI6WUy51iC/fkGGZQfmlkGZds
         9gD0OgIBw0IoV+R9arYqJs3JT//327O9b0Pfzlk/+fhGEQgHfSoPif5G4oVB7Ypd+TYx
         FFhMurNQa1YvJnbI+eSEkRvRICJTUGYRmeyrGAxN0OsspPUQeaVSA2ClJ1WqAXniAZEI
         xJhkKzyFCbcY1pS1v1uUHI/Hh4PtNrl1H1a3JqWfbOpxjhiy8jTbbt6BrhPCuN73oJzG
         3tLz/HSRqQD6ZyqSCFhaxUx/0MgaswWvTbaFkM8464ImFiA9hiNi0D7JzmyxqZKzGEW2
         u1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=c9BBV8nE96jpk7EclrA9j9Oz4D6NGl9KUj6J31cgXDQ=;
        b=DrebwbR7PgNKPzbGhrO4Z6OJDja4BH+59VY7qbThwjDqlAfBaR7TvYojL6DQcYvZ4G
         /adeM68sgqFYDIeJ/ut4rNzdRQL3z9ZkxcIlsIk6OH6StJZaJr3vDKRqYi5LwZnNgWVj
         tLk/jCLeO8rNRWUuKAdJhMZUxW4SgpdDN+o0v2wowa77ztWDdWZsusPBjNXzI2RrDZLt
         0u5r+CCWRWsD1++gSZOMvB7RFxqUyHRLKMU6ICbmt/JxF4vWwCIUA0YJBZIEF5c5I+UM
         yTPrfdFdWUBXiKS3kDRfoiEgMr7vMry0Pi0trOTGSYg8KudEBmtdMvK/WRTdzI1oyL38
         c/mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 193si4263046jaz.102.2019.09.23.13.51.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 13:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EA7A3064FD1;
	Mon, 23 Sep 2019 20:51:17 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com [10.18.17.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B505D721;
	Mon, 23 Sep 2019 20:51:16 +0000 (UTC)
Date: Mon, 23 Sep 2019 16:51:15 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 04/16] tests/docker: reduce scary warnings from failed
 inspect
Message-ID: <20190923205115.GE6528@dhcp-17-179.bos.redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190919171015.12681-5-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 20:51:17 +0000 (UTC)
X-TUID: RO5t9ykk6gBk

On Thu, Sep 19, 2019 at 06:10:03PM +0100, Alex Bennée wrote:
> There is a race here in the clean-up code so lets just accept that
> sometimes the active task we just looked up might have finished before
> we got to inspect it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 29613afd489..4dca6006d2f 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -235,20 +235,24 @@ class Docker(object):
>          if not only_active:
>              cmd.append("-a")
>          for i in self._output(cmd).split():
> -            resp = self._output(["inspect", i])
> -            labels = json.loads(resp)[0]["Config"]["Labels"]
> -            active = json.loads(resp)[0]["State"]["Running"]
> -            if not labels:
> -                continue
> -            instance_uuid = labels.get("com.qemu.instance.uuid", None)
> -            if not instance_uuid:
> -                continue
> -            if only_known and instance_uuid not in self._instances:
> -                continue
> -            print("Terminating", i)
> -            if active:
> -                self._do(["kill", i])
> -            self._do(["rm", i])
> +            try:
> +                resp = self._output(["inspect", i])
> +                labels = json.loads(resp)[0]["Config"]["Labels"]
> +                active = json.loads(resp)[0]["State"]["Running"]
> +                if not labels:
> +                    continue
> +                instance_uuid = labels.get("com.qemu.instance.uuid", None)
> +                if not instance_uuid:
> +                    continue
> +                if only_known and instance_uuid not in self._instances:
> +                    continue
> +                print("Terminating", i)
> +                if active:
> +                    self._do(["kill", i])
> +                    self._do(["rm", i])

Both podman and docker seem to handle "rm -f $INSTANCE" well, which
would by itself consolidate the two commands in one and minimize the
race condition.

For unexisting containers, and no other errors, podman will return "1
if one of the specified containers did not exist, and no other
failure", as per its man page.  I couldn't find any guarantee that
docker will also return 1 on a similar situation, but that's what
I've experienced too:

 $ docker rm -f CONTAINER_IS_NOW_FONE
 Error response from daemon: No such container: CONTAINER_IS_NOW_GONE
 $ echo $?
 1

Maybe waiving exit status 1 and nothing else would do the trick here
and not hide other real problems?

- Cleber.

> +            except subprocess.CalledProcessError:
> +                # i likely finished running before we got here
> +                pass
>  
>      def clean(self):
>          self._do_kill_instances(False, False)
> -- 
> 2.20.1
> 
> 
