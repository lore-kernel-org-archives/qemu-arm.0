Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1320049wrq;
        Fri, 8 Feb 2019 09:17:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZrOgMt9BHD6xRjoQnBSIMlBES3ZJ9+CsU3pshKDP+yd56wLt/NG308DSb6DIAVq0goweRG
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr16392345wrs.192.1549646237960;
        Fri, 08 Feb 2019 09:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549646237; cv=none;
        d=google.com; s=arc-20160816;
        b=mbZXXJ+3xhCVc9SKrxxi4jMCQRExWsUSMwtievCfx0WiSAmmhQvw1t4pghH5nM1WQJ
         QXVrUrhe+SfbMC2mMsyjO8utYR6EkNXto7drbAIn7+qeBbNQt7PLxjnI+juUZVf88eQO
         /L7Lq3wbbqOpVv55WzM0SApUugsoDH3qlnJdG0CF53AbfOfRS5Bp22etxwg4ptvI13qY
         PZ6bCC2JBvXFY4AV0UlfVftOETMNRACnV63TpHbs8noMc9s4bajsq30ZeWXoP8lOKEAc
         5FtM96+6S2X3y1G7rwTxlzKM7QfyQaAOvjgj9xqs4LqKJW/ePTE7sRX/eEJjaWQIGMGV
         +CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=kXGaks+t04XXLSYqkDDck6MqDIW1+q4RETT3vH8krQ8=;
        b=Emn/Bk2f8JQw/83RVe0/odNblmrPFriuE38RWs46EgaAUyWCRxVZbGwg9qD9Qiqkfp
         Zy7ulu4BaMSLH6mUsuL2Q4awqmMzH9IpcUwNPF7KoKEhejyeFcPA1A0pUukldZxGAMpN
         IjSbfgco36yEgYafeaO3ie+L2sHpxC5RUkkgk8X2n0AlK7hVny4AlvfDpn8ih9gqmKS9
         BIu46sSMBhVus3f1f0h7IiB/SLTmVpvsODbEwKBzhSBBJOmnoU41uEGfDkos2OBWZsQB
         cxTQymroejJOyXQpBudAxsdbt5RQKK5/w+Yq88z08z2T5JPthYlsWOy91ycpAZnB5be3
         W54Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qy9K7Ay3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si1898439wru.379.2019.02.08.09.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 09:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qy9K7Ay3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gs9m8-0006p3-RS
	for alex.bennee@linaro.org; Fri, 08 Feb 2019 12:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gs9lo-0006nW-0L
	for qemu-arm@nongnu.org; Fri, 08 Feb 2019 12:16:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gs9ln-0006BP-D4
	for qemu-arm@nongnu.org; Fri, 08 Feb 2019 12:16:55 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gs9lm-000696-TP
	for qemu-arm@nongnu.org; Fri, 08 Feb 2019 12:16:55 -0500
Received: by mail-pl1-x644.google.com with SMTP id b5so1987121plr.4
	for <qemu-arm@nongnu.org>; Fri, 08 Feb 2019 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kXGaks+t04XXLSYqkDDck6MqDIW1+q4RETT3vH8krQ8=;
	b=qy9K7Ay38vukeQQ8FoOq4BcmRXL5VWIyhO9f1mFy/7lY4GZyCv/xNFRyw7Slu+fp+/
	23AJEyJnyScrxkG2msc+6bhDn2EsKnAl9hRbSb/sVkKuKgWhHxhOlKt0HV/i6K5vH+XS
	GDUQeZctJSkUE1vG80CZ4a3FZC2F+R0JrsCcDdGbvES01wYs1eMxs87ckHru2oWeao7W
	Xv/xoS17TUMvAw8lxK3qtVAmP60/EziL6slbRDySKfKCC2SVKLyWVAgsLfWxblOiuMY/
	tUU8qTnhT8i+n9IEV9NCSvqQ5vg0Nxb4V2+MIcc3UW0yBoXFikIk3mqTkTHjJYfzp5bI
	pK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kXGaks+t04XXLSYqkDDck6MqDIW1+q4RETT3vH8krQ8=;
	b=rXx7HDcBWNutCI2T7Ubx9rZwPe2OqK10sKm/erKMOkjAa9mv/GOK2tEQZlbvO+wShh
	Nd6FsGBH9DLZDLus4eiMUURf2GQ6gn4L1G+QPQhFZCmMqkVswny4aAN70YJD/q8SJdEi
	knwNHSLBvVLjE0CTUiqlLfm4Bb7c6+Wok4owGhTwlvYM+n2acDueFyELy41PbbljNzty
	LmTRbj5AvvP1MNF28U4cZPu5yERAuQAKRWE2bLq3Old+N9HkLPFGYM0FFKzSkCWKWJiF
	vhVVnueicjenB+EeMT8JE7Dqd3uOjq9aNFgxq5xEx2/x83fZRcekzIsCv5tXgPmW8XtG
	NXJA==
X-Gm-Message-State: AHQUAuank5rAF/xBX/naU2+aiFd92UUVUhcX/ncyCCKjtanpZG+AqN2y
	D6tmbMTlxMi6drFiLTptg6Q17PQLIvw=
X-Received: by 2002:a17:902:780c:: with SMTP id
	p12mr23359705pll.197.1549646213445; 
	Fri, 08 Feb 2019 09:16:53 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	a17sm2968527pgm.26.2019.02.08.09.16.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 09:16:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-14-richard.henderson@linaro.org>
	<CAFEAcA9c_Fw1YNjV9Gnat6ymHSBVvcfH8xZDgoC2ENAuzCqrTg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7cd85d25-3706-e75f-6d29-4a5716d4c516@linaro.org>
Date: Fri, 8 Feb 2019 09:16:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9c_Fw1YNjV9Gnat6ymHSBVvcfH8xZDgoC2ENAuzCqrTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [PATCH 13/17] target/arm: Set PSTATE.TCO on
 exception entry
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yuYF6gen0+yQ

On 2/7/19 9:44 AM, Peter Maydell wrote:
> On Mon, 14 Jan 2019 at 01:12, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> R0085 specifies that exception handlers begin with tag checks overridden.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index df43deb0f8..1e9ccf0b2e 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -8830,7 +8830,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>      qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
>>                    env->elr_el[new_el]);
>>
>> -    pstate_write(env, PSTATE_DAIF | new_mode);
>> +    pstate_write(env, PSTATE_DAIF | PSTATE_TCO | new_mode);
>>      env->aarch64 = 1;
>>      aarch64_restore_sp(env, new_el);
> 
> PSTATE_TCO being set doesn't affect codegen for non-MTE CPUs,
> right?

TCO does not exist before MTE.  I shouldn't set it without MTE, I think, as
it's visible to the guest.

r~
