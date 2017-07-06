Received: by 10.25.44.15 with SMTP id s15csp1516167lfs;
        Wed, 5 Jul 2017 20:33:25 -0700 (PDT)
X-Received: by 10.200.51.172 with SMTP id c41mr56536600qtb.71.1499312005061;
        Wed, 05 Jul 2017 20:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499312005; cv=none;
        d=google.com; s=arc-20160816;
        b=qdNdhGociGgY0hGSTKIRyg6SWlIVzSzAF0h8TCwOzcTDzIl+161vTbAXEn9gp7PWX4
         WDoTjqdQJX+FK3DmYvD/vANbp3jcXGpLZ8F0j9t/WoOa/1K699TvfL6qInmV6yAXhWKq
         XFWIohi9DeDuGUNMqjcY/YA14uHPRu9jW6vOVZZE8cMz0UHpyXNiS1aCihzKLoUqClml
         0sNDsuZtPETLpDIWYxOq2sWHkG2lnwLTy3R2X9YUZlK9dnDQD+RuP8xo3LzpiV/r6TFp
         MwvvJbIQyDUWMAXAdCkGhA3CCA4VYX0oX9wp3KBUmTLflCfgnJdNB1zIvxpjrvujQRtw
         gZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=bXoh1vJKzb7FUMyOssNUpJDyAqWcf3ZFBijQItN2TZA=;
        b=nDCIs/7aiwtO+tfCC9LhKxjmfEkLjwcqPK1lfqW1d/YO90Gpn3CXHd8bGFBWoSfP7v
         HrjEyJ2a7G63ANe1sfSC1NkC2NRcckdgzDhTie+NKLYsDtc6UTJscMyHpoDpX1oUjeqJ
         MtSTsQc6HUVQI4Y5TmNyNxAW7nKpuwoyMP2Bl+1wwVQdnGiULF2WsJbNISY0J+dSbZvn
         uKw3BM9pgIn69IrkMwmwTRH1qQzhnCes5jxHRPmJCiMFjSypUjYkbqaN++Mb/UAjWIFz
         RIfS2IlHgf6NHRT/l4RvmntlJaCKKF1M71LEKlRH0uG6VMRy2mBDxUMIVpNVRUBShgCF
         gdLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=A+ZAcfRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a39si856193qtb.176.2017.07.05.20.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 20:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=A+ZAcfRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSxXe-0000KF-8K
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 23:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSxXW-0000HT-Cs
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 23:33:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSxXV-0007bC-Ka
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 23:33:14 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSxXP-0007Zp-Ks; Wed, 05 Jul 2017 23:33:07 -0400
Received: by mail-qt0-x242.google.com with SMTP id w12so1025203qta.2;
	Wed, 05 Jul 2017 20:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bXoh1vJKzb7FUMyOssNUpJDyAqWcf3ZFBijQItN2TZA=;
	b=A+ZAcfRCMurlh6mCt7mXyaRwKAPFR6rJQR2+xmr0U2AlpO4MLS1x4k5Gj8TlVsp0Qh
	1a3873MzfQE88crLimoUNW6ZhoHl+u3MiYCbZvEWoE0SGaHSer1aej+1GiW+gZvUJ5Us
	4HVyrkytv4hUTbakonkSzMB6GrD198RUCgqwOZ5vZqVOOsHr3nqBKENa3pwMzf51ob10
	qIoFewg5iLoGiEAmIZ8CzzjLlaIGzgFihY5Tw9OTbQ4BQXQTB2KxApXcxmyBnF4lGH60
	AYZL4RQj4t7OM3ofh8haWHTsJEx3Px8d+KW8dOnF+VYbrly8S+h2Vwygd2DchjNGED5t
	AWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bXoh1vJKzb7FUMyOssNUpJDyAqWcf3ZFBijQItN2TZA=;
	b=JFMhexLxVkfE7pfkwIuHS8xQ+tlj7bGtnfQH+azCbwI3tiyXS5Sag/04XDvc8Z8JJj
	0jKP8rO0AX2duRpYMixtEKtU86oERI1ahYwwWCHtG/I2Y2UPtM1XMt5tUfjZoyx6BEgP
	Whjk7XShdglY8z/GRent8JRPS10JxVdDyxiuCzkKEuwTLPEpjhxdj7ih0ca+5An5hdOJ
	mrK9H2QPMXFCQI5ZXPOkV6HXWAl97povGbEIdperFqgkoZeBJEIStBMVDcRuyxliBhgd
	Jt9DAoElyysQRvUUc/BNx6+oa5XiIszSxcyeuPyvlrNXEQioNf0gtzOtUE27vML2fTVY
	MxZA==
X-Gm-Message-State: AKS2vOxMn6sCV79mrAGxSfz6oFrn7u+8fP9Ga3jlYz+OcGLdTZh1xftT
	2WNGTAxEojSklA==
X-Received: by 10.200.58.161 with SMTP id x30mr56450038qte.69.1499311986988;
	Wed, 05 Jul 2017 20:33:06 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 79sm685622qky.50.2017.07.05.20.33.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 20:33:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1498820791-8130-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dcf0bab4-8bf1-a21f-c4b6-05ac081d37f7@amsat.org>
Date: Thu, 6 Jul 2017 00:33:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498820791-8130-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH] target-arm: v7M: ignore writes to
 CONTROL.SPSEL from Thread mode
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cSOoHKKrXANr

Hi Peter,

On 06/30/2017 08:06 AM, Peter Maydell wrote:
> For v7M, writes to the CONTROL register are only permitted for
> privileged code. However even if the code is privileged, the
> write must not affect the SPSEL bit in the CONTROL register
> if the CPU is in Thread mode (as documented in the pseudocode
> for the MSR instruction). Implement this, instead of permitting
> SPSEL to be written in all cases.
> 
> This was causing mbed applications not to run, because the
> RTX RTOS they use relies on this behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org> > ---
>   target/arm/helper.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2594faa..4ed32c5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8768,9 +8768,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>           }
>           break;
>       case 20: /* CONTROL */
> -        switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
> -        env->v7m.control = val & (R_V7M_CONTROL_SPSEL_MASK |
> -                                  R_V7M_CONTROL_NPRIV_MASK);
> +        /* Writing to the SPSEL bit only has an effect if we are in
> +         * thread mode; other bits can be updated by any privileged code.
> +         * switch_v7m_sp() deals with updating the SPSEL bit in
> +         * env->v7m.control, so we only need update the others.
> +         */

I'v been thinking about adding some function like v7m_is_privileged() 
v7m_is_thread_mode() !v7m_exception_pending() to ease code readability, 
like armv7m_nvic_can_take_pending_exception() or is_singlestepping().
Not much inspired yet :(

> +        if (env->v7m.exception == 0) {
> +            switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
> +        }
> +        env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
> +        env->v7m.control |= val & R_V7M_CONTROL_NPRIV_MASK;
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
