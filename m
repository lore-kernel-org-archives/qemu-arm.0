Received: by 10.223.197.9 with SMTP id q9csp1036011wrf;
        Fri, 29 Sep 2017 14:06:24 -0700 (PDT)
X-Received: by 10.200.40.104 with SMTP id 37mr8211004qtr.284.1506719184292;
        Fri, 29 Sep 2017 14:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506719184; cv=none;
        d=google.com; s=arc-20160816;
        b=t0SYDO1v4dPAkFe0ahhulMr7MM7aKnh51GI64PGZFcsAS06z8zNZiM+DBQ3cAizty/
         VVZwYAt8azXjNTQrwr+Cw2rJQlaOYXqXkTL3+aTgLD4Dnt1uab7tNyao5MJL8V2k09mj
         oIqnn1aPZGdE4CZVy1/GZojFQPLn7+lu0z+N8HL+gNts0t0guxO/bCRZT6J4rcYYWHd/
         w6s/HD85QeWR0sHmyRkJBE1w6oUTJ6/Pd/eHC4mtSmSUz21UrN3ORV0kySPM0YWcBxcJ
         adZ321sbklLzG2/79EHhgm8tszDAKhLih7tA2tGBs4BYYcG+vI3/MlGTH6ntf6tsobKT
         qKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7/T8YqMEO5TX5bhC5A8KVk98B0cJmMn67cFa1u2xPac=;
        b=MphukVm7C6gDkzI2EEFm2byDsGjMILXWSfb5aiEYY2VFpL0Jz29fYQtsyIa4O5Z1aE
         a9bd2puo9ekcMftckXukk6irKygsdAtdUrhAabmA+mg6ZtmpphedOcTdGJqIPiDffJo0
         jG3et0bQte94shivlpcL4X5Wl2oepXRTJw763FBcIu451bGplS8MU7ollY2cof/SH+3i
         lIYPE2HeqHnd0WLkcEbSMGyL46dge7+94Fk+1VRV1oSiZcolXW6lT0FbkqU2cP6CifPU
         Xvr7QXiW7Uy8BeEdN6KVdLh9MTYTu1lOgUABMPrO2MZEJiCBJ+KuNIBDwFF2hz0RTaJ3
         OeMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MdP352fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si3394816qkd.525.2017.09.29.14.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 14:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MdP352fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy2UI-0003x9-3H
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 17:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2TS-0003cZ-4X
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 17:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2TP-0002Gt-0k
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 17:05:30 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2TO-0002GA-SF; Fri, 29 Sep 2017 17:05:26 -0400
Received: by mail-pg0-x243.google.com with SMTP id j16so486665pga.2;
	Fri, 29 Sep 2017 14:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7/T8YqMEO5TX5bhC5A8KVk98B0cJmMn67cFa1u2xPac=;
	b=MdP352fimgrLYrJb7iqsZ1NpLLn4pNjcYPvp28GlNXngXOQqHnOzpxkyoBtoq18B5G
	G/eAt4jA8lyyZ5cew6PMgq8z0dpIIC5SNykUz7hVc2cIpTOQsAqHcEXmHGY/kaH+rxML
	7HcqL6hFt28hQlJXY58mFbKISQGUyGwOSl48aWqBgrCopIvFu2sOxAbrVtl8j6fhd2j0
	KE9os9bjuucPBHumgoI3lpED4ZYaNhW8qR2guyH49OsxGWNHozbyHIZczieUJa1oQTIF
	GA4XM6I8QbLQwudiELakEn8MUsOrpHUfhzzuSoUYaowu4CLWxPPwgVzdb9Anzdb7Vfr0
	oqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7/T8YqMEO5TX5bhC5A8KVk98B0cJmMn67cFa1u2xPac=;
	b=j9cZJcPNrHWg9SkP+l5/PfDfaxKCxg+xa18/ODC5ckZ0IdZIcw7nqLxziYJiN7MVDG
	bNS9mXqaymfmzkchY7btVlXuhGqjolPytGdwyq5+ULSmv8720BpTiRTWcficdxhCVezP
	adfS8eQZEBVL7l+wBG/p6qOHeKcbCeGu73CPhlBl7zBd6KJzqpaFqn65/a38HERelmPT
	saseLsd3+psbS1O5lTeIVpASkEa2egmSE3CXHYwcC1C7CBjvm3Jh5IQn/YAaOFmM1Pv6
	EtBVIIUnPePQGoxea5mzrQN0rBe8B4Ynk8uDPDJRDJg41jrWfAShc1R7eJQZ+ttcGJ/W
	OV+w==
X-Gm-Message-State: AHPjjUjfL/5kK1HqmdJzLxwZep5dFIdquN2Z9JJDdW3hFdtytUVmRg1E
	aRk5ICpyJczXY2WHPCdkoZ4=
X-Google-Smtp-Source: AOwi7QDnjBufaF8Z9KabpPLCxh5XgPbB65cAph/ipRKrkYpDDkV0g/gPZXuB8WwoG5+C1M2ZKMQw6Q==
X-Received: by 10.98.39.71 with SMTP id n68mr9144135pfn.323.1506719125928;
	Fri, 29 Sep 2017 14:05:25 -0700 (PDT)
Received: from [172.31.205.142] ([216.9.110.12])
	by smtp.gmail.com with ESMTPSA id
	c82sm8006465pfe.172.2017.09.29.14.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 14:05:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1b0c978f-2cf1-da68-3ee9-4282a0cb93cc@amsat.org>
Date: Fri, 29 Sep 2017 18:05:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 07/20] target/arm: Warn about
 restoring to unaligned stack
X-BeenThere: qemu-devel@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@gnu.org>
List-Help: <mailto:qemu-devel-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: 3ZrG6o2PtVZX

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> Attempting to do an exception return with an exception frame that
> is not 8-aligned is UNPREDICTABLE in v8M; warn about this.
> (It is not UNPREDICTABLE in v7M, and our implementation can
> handle the merely-4-aligned case fine, so we don't need to
> do anything except warn.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a2e46fb..979129e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6403,6 +6403,13 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>                                                 return_to_sp_process);
>           uint32_t frameptr = *frame_sp_p;
>   
> +        if (!QEMU_IS_ALIGNED(frameptr, 8) &&
> +            arm_feature(env, ARM_FEATURE_V8)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M profile exception return with non-8-aligned SP "
> +                          "for destination state is UNPREDICTABLE\n");
> +        }
> +
>           /* Pop registers. TODO: make these accesses use the correct
>            * attributes and address space (S/NS, priv/unpriv) and handle
>            * memory transaction failures.
> 
