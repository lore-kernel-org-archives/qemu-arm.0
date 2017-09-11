Received: by 10.100.151.138 with SMTP id q10csp6009738pja;
        Mon, 11 Sep 2017 08:39:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD/VTR+FgMywjaapXfmWnb/VUVBmfi9IN265PvxbedGaJ0hZ59XgRzHztFBrs+FY1v/G8H3
X-Received: by 10.55.127.7 with SMTP id a7mr15097145qkd.329.1505144361004;
        Mon, 11 Sep 2017 08:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505144360; cv=none;
        d=google.com; s=arc-20160816;
        b=U7qOHcsyX1s6mZrH7Hy1L/bpiLLaR0ZwWfzjrA+EzadSz1tF2H7C07DBggWTC/R4RS
         jkQTRCdMkWzjkmo+A8lnM+A+nRNFo/k0AunzA8+3hsgIGZJpvBRY3lbz3sMH7B0G79J8
         Aa5ZiwE8ppDVvTnHlm8+/oCTazpimiqiwjsldXxYPD5N5JV7u5B8LfL/iDPWt8tW1tFN
         DWjLjqKMoSF7YDHl3//uNaGjg3MSb4q9FsEfEzojDri/oG3b9LyzMzp1qqkkAfL9v1LB
         BYUoovzgCnD2RC4NiXCojqP6RYnezguHZb9Qn443CVwr4at+6ecyu3r3JuAGEAD4RqB8
         xJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=GNks+qsugJPTHDy5xTBhbnVKBFzwz/JJ9vGRhlFDZ5s=;
        b=mNrro00FGkMnhgKLW/9fdeETSV8wyESM5U6Gfyka9jiIuEfUNjm+cyqvR/oHqhyCqO
         J/DEiroEIiRaAvTnZ/GJc+e+aJY4VgyJchM9IarnVNqDHxUZ9umoGcjHn2oUBCilE7t2
         PPqRR1kgfiiJtosXi6LxDoRsubxUwaUm3g+4vnHpZnppjZNI6AKMtIgYILOJLHY/Kq/9
         NcQiORGLDOYLnRDEOgf2tVBG489ynhSDtehsltMqL/QLOmioVHMUb8ZB6Alt+DsxALmn
         ktGcePNOTI+HKOt1/58NnqVYscfEK1rPjAV3P/dP1/FoReqZIKm3+xnau2NlBWXlt5IN
         hkdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g123si9238667qkd.167.2017.09.11.08.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 08:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQnu-0002HQ-Qo
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 11:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drQnq-0002G7-Is
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drQnp-0005TT-Nf
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:39:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drQnp-0005Sh-H8; Mon, 11 Sep 2017 11:39:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62DB5C0587D9;
	Mon, 11 Sep 2017 15:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 62DB5C0587D9
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2D4F60A98;
	Mon, 11 Sep 2017 15:39:09 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-4-lvivier@redhat.com>
	<1299bf0c-f887-bcfe-2e97-3c7103d407a1@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <ea5d741f-0a47-2000-93f8-aa78efcc5b9b@redhat.com>
Date: Mon, 11 Sep 2017 17:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1299bf0c-f887-bcfe-2e97-3c7103d407a1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 11 Sep 2017 15:39:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 3/3] tests/hmp: test "none" machine with
 memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UF/raOFzZvWJ

On 11/09/2017 16:51, Thomas Huth wrote:
> On 11.09.2017 16:20, Laurent Vivier wrote:
>> and add a test case of dump-guest-memory without
>> "[begin length]" parameters.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  tests/test-hmp.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
>> index 729c0339f7..90693c0ce2 100644
>> --- a/tests/test-hmp.c
>> +++ b/tests/test-hmp.c
>> @@ -35,6 +35,7 @@ static const char *hmp_cmds[] = {
>>      "mouse_button 0",
>>      "device_del mouse1",
>>      "dump-guest-memory /dev/null 0 4096",
>> +    "dump-guest-memory /dev/null",
>>      "gdbserver",
>>      "host_net_add user id=net0",
>>      "hostfwd_add tcp::43210-:43210",
>> @@ -159,5 +160,9 @@ int main(int argc, char **argv)
>>  
>>      qtest_cb_for_every_machine(add_machine_test_case);
>>  
>> +    /* as none machine has no memory, add a test case with memory */
>> +
> 
> Maybe remove the empty line after the comment?

Bad habit. If I respin the series, I'll update this, otherwise I would
appreciate the committer does.

>> +    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
>> +
>>      return g_test_run();
>>  }
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Thanks,
Laurent
