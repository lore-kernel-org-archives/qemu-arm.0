Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1334543wrw;
        Sat, 10 Nov 2018 11:20:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5fb0GUw3i92b87bYq/21AkzJ88o99yyiQ5DN84AW4UsMnOi8upKMAT8wRU/gyKo7kjO5wEG
X-Received: by 2002:a0c:f392:: with SMTP id i18mr13742364qvk.30.1541877627137;
        Sat, 10 Nov 2018 11:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541877627; cv=none;
        d=google.com; s=arc-20160816;
        b=IZMcYZYdjcQfBIZHpfgNs+W5rUy+k/BpvkTWtLPM1qkiRFOvQGAghrSOOeuzEXkP2B
         NeCjM81NzE1a+AtVKFNdWw+mWVNMtip2CSmPcPiX63Yq33HLhBeubs526+nkIphm/gWM
         Cskp1Kl2TBrgixrB5e66Cosa0lFYb/gfD6MX5Or/g9mg3FzYCqabHCgfGdWFJFhVR1PD
         wM9kd+dqghBfcLEd+mXeT8DNRulLnlwk1mRohC1mPlqSDvC5R3ZR7O/ARVBHDtIClzFT
         SaRMdNL7TbQNIo/TmGoRcQMT9KkNzBrd4f8S4zvNUcc9NIfuXkckDOhD8bHIlXCFrbV4
         OXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=mRkKhs/D8FT3zE2QGQzLCESMjTRnPwAnmI9cBvK9/ts=;
        b=0w5Ddz+TxNO/cJZbUpH5JUMMuvqI1Yw6tEOKz18Z3MFEaqSQ9ZAIvYojfASWwVtMB6
         Mv7QEYOUNMFu4gpxrG1X5TMNcSHiHbae0gisYmgPqhZjnrYS7C1bycoWuUi1nVIZ/GqZ
         hrHIq49NzLzYBijBA2gTX1yC0yYo4EO6SoJSzZgpprks+UbIt/ho1Tx9abZox/KdsImq
         QeWW3cvICCA2WfnhiBQN9r/CxGtQvPgLG/uqJ2tqJRxz/aUc4Ba3pn7Dft0zwdcbM5Nq
         LDM/yLm+8UJeubCPKXUSS6izRjvHBhc6n1HNw5rGFNym1T+qVJfTtDfyZXCXs2hFlR8X
         hXKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oT8Mx0Jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si3212418qtd.327.2018.11.10.11.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 11:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oT8Mx0Jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLYny-0006c9-Iv
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 14:20:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYnl-0006aw-HK
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 14:20:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYng-0006A6-PH
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 14:20:13 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLYng-0005zQ-1Z; Sat, 10 Nov 2018 14:20:08 -0500
Received: by mail-wm1-x342.google.com with SMTP id f2-v6so4695423wme.3;
	Sat, 10 Nov 2018 11:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mRkKhs/D8FT3zE2QGQzLCESMjTRnPwAnmI9cBvK9/ts=;
	b=oT8Mx0Jm+h3D4yF8OmTYL67B5l6BodNEyxcvhuI36Frpapxt1xAFJLTyCd8SzudI5S
	ULFLfiSudWc+RdpifyG72sHBexJPqX3vpsV/iHSIgX1ZRSmfGEUkY57mB4PpfekOaGje
	Y04x8y6n31uLilm+rdxjBuz4DBXIchiC5B0n7Id55Dv1bjt2Df0eBDa24UDCEga1KZTK
	EQ3qzOkx6lNr5PgQ9j+rn2z9m7HGZMZ/VK2W1iLM9MjvWc/jKvIUKa8gYE42OyKQqdYQ
	5ng73J/NSM8/ggTAzeyAGR2XdRjUmQV1xSqApddKtZc2mQePFkpvQ+uG5XsuN+3XICMH
	cqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mRkKhs/D8FT3zE2QGQzLCESMjTRnPwAnmI9cBvK9/ts=;
	b=N6LNgKVZMUGnsrA4/LqovhBcoYu4qXmtxxg8ZtsV6fxBNYytc0vQoGVV7Bkb9CeJAV
	nc0eK5CRN9zSQmd/B5jmYAR6b5B9Ee04UiHAQBkEhKZQQh/6IUzv+eKjIcgBZdSYFOsa
	lJ9OA6LqYnNkNzjiIcs8QdjND/m5yz4o/4MchPHbvz0HNRWAnG6IDbmJUNcpQlfvyQXi
	lzpjSaM7XLOLPsowJRXqUHVFWdrnUqQ+gq/Jd8NSLnM6yE/QIBouCaSCuW5dd+3zWjmW
	ZtS993/mcP4OFqrEU4LiVbVIBYQC1qGnlOQgetuPZkAUlYN0cGzcNC1FpNgjJNInJ8uR
	tgLQ==
X-Gm-Message-State: AGRZ1gIC4kNHNaokWBO94Cl69awuf0GDaQ8dYHtPcawJTAN09LX7z6NT
	nIsu00+mJEKWPbPL/Pr0OVfAOVIQ
X-Received: by 2002:a1c:b60a:: with SMTP id
	g10-v6mr3365568wmf.138.1541877604194; 
	Sat, 10 Nov 2018 11:20:04 -0800 (PST)
Received: from [192.168.1.38] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	r72-v6sm8382671wmb.37.2018.11.10.11.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Nov 2018 11:20:03 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20181110121711.15257-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <3bc7635b-bb80-2780-ebf6-297b5914e4aa@amsat.org>
Date: Sat, 10 Nov 2018 20:20:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181110121711.15257-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [PATCH for-3.1] target/arm: Fix typo in
 tlbi_aa64_vmalle1_write
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvss79szRlR1

On 11/10/18 1:17 PM, Richard Henderson wrote:
> This would cause an infinite recursion or loop.

Hehe :)

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc..a327988c66 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3155,7 +3155,7 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      CPUState *cs = ENV_GET_CPU(env);
>  
>      if (tlb_force_broadcast(env)) {
> -        tlbi_aa64_vmalle1_write(env, NULL, value);
> +        tlbi_aa64_vmalle1is_write(env, NULL, value);
>          return;
>      }
>  
> 
