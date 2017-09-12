Received: by 10.223.172.38 with SMTP id v35csp6947545wrc;
        Tue, 12 Sep 2017 05:15:44 -0700 (PDT)
X-Received: by 10.200.24.65 with SMTP id n1mr17587790qtk.323.1505218544504;
        Tue, 12 Sep 2017 05:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505218544; cv=none;
        d=google.com; s=arc-20160816;
        b=AMVHF8L90wTY1ns4TmeqGLsHEO4A1kDZYBTaRp6UykgQ1zRlZq6pkY/t8Km6thW9yI
         wSV7CLohcBgZHoFJehWcHvwYw7wwPeZ7VAkWvacKi0XHf7tSXNMNUtj5PDumd/4iG51d
         8mPmaX7WQX2xuZBhzDZ5fV+PGiI1QojbUm+OtZTZ8fXzxwr1jMQnWSITkXqs/SdLAEOs
         Oz+wRJinzEkzUXfkYe8JWzLevSJD2ofCxXskidEFWlohhfPoghoKamOMtGT4zVtWLNVE
         jQLmObpGYkAx+BptKwjx11rLClWMNpQkvlMB+Nkybjw9Ua0c9EhbJkyzF0vZXDu/4Rt8
         AeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=WgxxTNFulw9Fw2oOFT9wjXPXnXqcOMH4k8pxR3Q9VTA=;
        b=SPPfEUMk95lwjVA+nALfzK3Wl6MwoK8r/eHrygBdoA5INm7lzF4eRJmWVB26e9RbgB
         wh1uCwVuPAwUm+jvfigWuje2zn3hhSmmF9Gt3cI3JGLPq9nu0ssNCFGG/eOFAtGRBI3d
         BVqAJSSntRIgBvqzyB8ijs0bVU/A8Lv2gfvPGR8llLEczCRL/qFFrgr17serGSqxq4p6
         Ereg/a4XhcZ7PE7ZsQMK78T0LPecTDl64qMJurM4cI7Wk+z3nR7FA2CtHhZdDSYNtMJK
         4dM4WyaSHciiAPGTs0wVjkRDhX5Ci+k8j5yM8n3Fu9bvBLj/szHzu2ONxrdH6VGAaWMn
         qzLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SOeqDKKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c83si11984186qkb.39.2017.09.12.05.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 05:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SOeqDKKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drk6Q-00014k-6t
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 08:15:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drk6G-00011s-Gt
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drk6C-0002UJ-I6
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 08:15:32 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:36867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drk60-0002IQ-Qg; Tue, 12 Sep 2017 08:15:16 -0400
Received: by mail-qt0-x232.google.com with SMTP id b1so15311080qtc.4;
	Tue, 12 Sep 2017 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WgxxTNFulw9Fw2oOFT9wjXPXnXqcOMH4k8pxR3Q9VTA=;
	b=SOeqDKKVRKSrnAz+gPOWZ0Z5NhySz4Hh0HrAnFx8UQ7a0SUFqWAlOUnpAAHVxczuqv
	45715KIqJWO8qcAPWO01iYNfjwfqijZ5FtToQnCyBYY1tcgsruWFdhH6bkpvv1mzZlAp
	Pvky5VDGV67OjtmV7wjVU3jofq3slbh2Gr94t2h3Hzu0FKBDyYCoc4JEaBx9fUTOJ4Qq
	b66+SCcmh+nSP8FxXOjVMmzLtlH6KYMjSnf5So4sJrXD6JjeO9WJULXgrqk17DQYpYRz
	eVRe9fDSYHQnSGhAQ/9YmWDPtU4Br5cysDZ6Lgozw8INL5B41tZsGyl3BIBLRl7e6T/d
	CT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WgxxTNFulw9Fw2oOFT9wjXPXnXqcOMH4k8pxR3Q9VTA=;
	b=mdjLRpxF8xSdXOnDdnhICKbjahxbrD8sPlreDDhUrC6LLTAgQe4ky31YoeyvzVA6jE
	bXuPDg49UqM/B9mEa/U4OZwsOI7/paPmpe0sCe49pHGf1Rxjp4kbt6EBKu+iclAyTN7e
	ygc10RTXaDV8N1Xltzqisok7jZC/LuRbsWIMvnrW/0CLDwUvQdaWIylBqpIS1SG6zhpQ
	/Mei9DI0C26wVoVyHRf1mCUOlkko6LKAv4Zfhp4M3lCUxVJPpOQoHiBymevKoYy5ZYZF
	sQPm4EbJZ/9n7UnMOxwqWlBqbh0+TA3L3oXjq64or+E4KobjRRYnmNpAdZVBm9mO58FG
	OQ8A==
X-Gm-Message-State: AHPjjUjSyCn/I92v6KG0ZBzO3ipGdUjKpoigzLmIA6zGZzYPsYiSfRaS
	82QsaVH0LeJ/8A==
X-Google-Smtp-Source: AOwi7QBMlNt1EhryqCALVfmioeOF66fugj4qjjCWuX7xyVVNmvVlHSHOGsMUqRi3tXpdWb93fPNNxQ==
X-Received: by 10.237.42.85 with SMTP id k21mr20559973qtf.289.1505218516299;
	Tue, 12 Sep 2017 05:15:16 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 48sm7910487qty.29.2017.09.12.05.15.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 05:15:15 -0700 (PDT)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-4-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bdb63706-f9b5-fcec-3508-1a0807e44f0a@amsat.org>
Date: Tue, 12 Sep 2017 09:15:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170911142056.15643-4-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NT03n9rLCix5

On 09/11/2017 11:20 AM, Laurent Vivier wrote:
> and add a test case of dump-guest-memory without
> "[begin length]" parameters.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/test-hmp.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
> index 729c0339f7..90693c0ce2 100644
> --- a/tests/test-hmp.c
> +++ b/tests/test-hmp.c
> @@ -35,6 +35,7 @@ static const char *hmp_cmds[] = {
>       "mouse_button 0",
>       "device_del mouse1",
>       "dump-guest-memory /dev/null 0 4096",
> +    "dump-guest-memory /dev/null",
>       "gdbserver",
>       "host_net_add user id=net0",
>       "hostfwd_add tcp::43210-:43210",
> @@ -159,5 +160,9 @@ int main(int argc, char **argv)
>   
>       qtest_cb_for_every_machine(add_machine_test_case);
>   
> +    /* as none machine has no memory, add a test case with memory */
> +
> +    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);

TIL:

"-m 0",
"none" machine is implemented in "null-machine.c",
"none" machine default maps memory at 0x0.

> +
>       return g_test_run();
>   }
> 
