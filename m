Received: by 10.223.150.237 with SMTP id u100csp123807wrb;
        Tue, 7 Nov 2017 06:55:16 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SbGGiITUyieLcHb+cWmTcmTAVoOSYpwenqIFK0EW0IRt581H9tlqXFQrX45MUa/m2psAwS
X-Received: by 10.129.115.139 with SMTP id o133mr11949973ywc.113.1510066516192;
        Tue, 07 Nov 2017 06:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510066516; cv=none;
        d=google.com; s=arc-20160816;
        b=eHzYy4C4Y03EQ6UyiV9jSZih+GomBqZiSUH5AG97ljpfNHCUf4DI/kxR63jufwZy58
         5YRipKzdbg0pf4Y/y24N6hVE0U8B8/70hv69/6x8dEn709tfyyC5c4xxIq+7Tj8Z8NwL
         wF+PkhEWCMYJCmoIEo6yL7CMliWLiwVILTAe6ISI1/pcNPOLq6ReF+WnpkBtcq+4nzWY
         jOlW6tuH6v3uxU4GOS8FjoXK+G7s9o7vnXqVxu2juawmIDUI20GwcXMmCxWI10MtkMfx
         F+A0tJ19QO/knlp+OoDpYyXG0N1u1oDqD8aauA9MsBwOzcng3JaUlUCmQ9GEXDs0wP3i
         dW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4BgvdkC9+I35BAgJrERGm8VaAmCKUEA9es979SDPRgU=;
        b=rdY7JvXbOTMeK6nffl7e9x1+lVnp8puuOm8VztEn445OzvePR579ggcH+YZIhNNZWL
         FklYqnLAKbnpLjaDR0YFrU1HelstwCfSXhGCxMOTa93tl1Du5W4niVH14CM+3QV3hy/C
         8jxD4Oi/9BgmDVIKqPDZpCTKvMq98mlulIhTYLCwhMb2NCAoP3uXcIxAbqV7YSoSv/VJ
         TNCubPtg3/eyxw2m4IKmtK2HezXGbjRuESY/91pecqTwUG+ujdURkENpNW4VcAToyCo1
         5O+0QHZ41Op4gr1MHNHIWyUPDJ37XEbpYiIJBp5FprZH1CwSgdl/vB7i8GXmHCHUMWmX
         hXMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uIlKv/Ji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j20si310271ywa.75.2017.11.07.06.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 06:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uIlKv/Ji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC5HX-00017c-MH
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 09:55:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5HP-00015Z-Ok
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:55:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5HK-00029M-5v
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:55:07 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5HK-00029F-0u; Tue, 07 Nov 2017 09:55:02 -0500
Received: by mail-qt0-x241.google.com with SMTP id 8so15528341qtv.1;
	Tue, 07 Nov 2017 06:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4BgvdkC9+I35BAgJrERGm8VaAmCKUEA9es979SDPRgU=;
	b=uIlKv/JiD7oqBlGiJgjkRgaIML2Kaxfur8cwz16FXLcqp3l4lABI4eLEnX3EuqbrV+
	llyCiykeGJD9covEJ4nSWOYVZXHa+h8i190tuSQrDKeelgU6WXIplq8EQOtnsHlmSjTX
	ozem4ChiDwv6a1ejgyKZm+cCd3TKhJumB+3eQkgmJBt554W2uJaYn/7fFVzMH9DThzkU
	xAVCRLt/q1zYriYwOym2VXmB9Nhpnf039XGCWbcYIjJW3SCiqboyUL13DbPzBEZJk+LT
	uUDH4yiWTnkOGfhI54GjVv/mrFOR+iulT489wC95KlT2fOMc1JIkE287ovqHAZGy3qfM
	YZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4BgvdkC9+I35BAgJrERGm8VaAmCKUEA9es979SDPRgU=;
	b=sSpq843EmdEuGkiTiYOwpv1CSUDw+WUL5ra06y266JEpeRnDkCy8Ybwj9vTTrrK2Y1
	99EBnG4VT8dYEI5Fhko2U0z+5rG/4jJXzzdsE9Thyu7kYJOcg5hZYpdQgRDNXsVWQN2j
	gNMGgqSK8Gr71vrbzjwBK/ENSDevRLkoDJqz63Jj6CZEJaO0RaBMxpw955nz/aKwkr76
	/v46hbWKDWOhNB5ZLtDIIPAgLYJ1XBD6hLhKOWo2cXbCQHfDHVLfTar19vtq0J38gvXP
	t4Fi6vw0F31xUb5BiCsz4UCdFKo7sCk9fqVywQA5yakki5MebLpu4RCdoeCDhQ1XE994
	l9kw==
X-Gm-Message-State: AMCzsaVnGoPs2bGV1m/3/K2qDjslbYgJnVUrnyoRCaY0x+RjOWz//ybq
	zAeiEq/Dc0cGpMcgPIEJvGk=
X-Received: by 10.200.50.230 with SMTP id a35mr26654136qtb.226.1510066501427; 
	Tue, 07 Nov 2017 06:55:01 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z7sm984639qtz.40.2017.11.07.06.54.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:55:00 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-2-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <68dc78bb-3a86-b200-1c45-b60d0a2a2578@amsat.org>
Date: Tue, 7 Nov 2017 11:54:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103202624.5956-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 1/4] arm: fix float64 helper definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
	qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1e0yXvi2EF5F

Hi Laurent,

On 11/03/2017 05:26 PM, Laurent Vivier wrote:
> neon_ceq_f64(), neon_cge_f64() and neon_cgt_f64()
> take float64 as parameter, fix the definition in
> helper-a64.h
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/arm/helper-a64.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index 85d86741db..b5e9ba03c0 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -26,9 +26,9 @@ DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, ptr)
>  DEF_HELPER_FLAGS_5(simd_tbl, TCG_CALL_NO_RWG_SE, i64, env, i64, i64, i32, i32)
>  DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
>  DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
> -DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
> -DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
> -DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
> +DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
> +DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
> +DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, f64, f64, ptr)
>  DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
>  DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
>  DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)

As commented replying to your series cover, this patch seems missing:

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
@@ -159,8 +159,8 @@ uint64_t HELPER(simd_tbl)(CPUARMState *env, uint64_t
result, uint64_t indices,
              */
             int elt = (rn * 2 + (index >> 3)) % 64;
             int bitidx = (index & 7) * 8;
-            uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
-
+            uint64_t val = extract64(float64_val(env->vfp.regs[elt]),
+                                     bitidx, 8);
             result = deposit64(result, shift, 8, val);
         }
     }

Regards,

Phil.
