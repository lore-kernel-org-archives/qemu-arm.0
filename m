Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2886737qvw;
        Tue, 1 Dec 2020 07:59:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyjb8I31N/POt0kqvwdDkKAkbpYE4+AWnGM8T91WEydsmSkEoUUJiXTYMphZLNgTW6n2ow
X-Received: by 2002:a25:a4ca:: with SMTP id g68mr4193937ybi.359.1606838359144;
        Tue, 01 Dec 2020 07:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606838359; cv=none;
        d=google.com; s=arc-20160816;
        b=uk9ciPkpU1UrCHdTJmxwhxWQgcxckehfn8on0CU68OeIgnMeW2CsHGjJlloQa00Pw3
         BGrclZnnchqwvIn/sBcRQHWZejlIiIp+XSpsGxBcsiZAaBJyjV4UKdGEeRy/XT2n/6re
         xnEqXbbU9UwhUMXQHV6ipCpVniFsBs72o+01m02mjgPnz40qVUuFsRtdAO7fPxm6aBlp
         JWk2Ca/C893E9F8k5W59jEejofNOIQcHgBgYXoKn1HpnGA9OQTNTx+cjvz/NkeSWzlCQ
         7lYmhugmUo1+s4anzVYfiLmSaQcVBfEf9+Ehph36NR2avEep57dK7SeexIy8qk8gH6uK
         G/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kT4blV82+ZRTD4Or5hWLVKblOjgz3AusGOV/ZjlB7tE=;
        b=KQOXQukPnY7HRTmT2dqdLSON7/h1/9kn7gbPfudsTHuX1KUZVLgGKf36sJSTt+aO0x
         MYdb10XD/jpjANLPgFuAM4ttXJ9wzPx8l/Dqrcdkor3V+FPtb2ZePs8X6Gr/MZ5sY2Wk
         PAp1F12BIkxuzeXGK8qOKopPihyzQdfDVzICBRrIy/nmX5uDkmlRufEb4jd0IK54bu4o
         tHdb1NhrAR6Iv0YqaM5HV8fgqoILl9ppeBWH/HmCPvIYABiqbPrZmgd41lPs93Euqlte
         MXMEgoKkvw5FAQDiKnMtuXJ3kZTjqUbS4HwD8jAGYQ5WGufnVI/4n+cj8DoQka6DkHxa
         wf3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPYmBQjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a65si127423yba.294.2020.12.01.07.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPYmBQjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk83i-0004EP-Ia
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk83S-0004D8-NU
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:59:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk83N-0008MG-S8
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:59:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id z23so2074704oti.13
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kT4blV82+ZRTD4Or5hWLVKblOjgz3AusGOV/ZjlB7tE=;
 b=xPYmBQjAGmv55b1pI4ptH1KRkBgqrcN13czBKo7CRByhIdrSkXfDRnV2fv7SlM7494
 3QL6Im8wOthjf/Xcj/l42SvFJkflPf+OEY44ndIChJHkfwLKSaQ8y5MHaQv5QaoQdUVD
 mqkdpdDqsuvLJXZpIo8VjCdN3/BRkGl8PND14Ahems4F+Tui0A+hJI9NpzG+tK3FS/CJ
 TqhkFCnziy9RJ1nqZb+n/igKzPdkLHUcxJcMyLV7GuZUWFx43+z3GFW2TVAphxqINiSQ
 dxAN1Ue5sxjBwDZExvqBWY19jcNGSkLXzWqdOCQ4JvkO+5f41BPSKV/bI1H3gnrk/VZ1
 FGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kT4blV82+ZRTD4Or5hWLVKblOjgz3AusGOV/ZjlB7tE=;
 b=jMXxcQIzUq00zeNmVGY0gYGwNW4XkJOmEdp2xcpNDSgSKVc3f9+9DVyrxG5Z8pRCfD
 nSLhD0Dmamqq74d+t+yjLVSzUBEz8m1xCNXPv83LAgiRLQwUkszXYGmf+nbWOyQFighl
 32DRIM4Efhrlxq86+MEBSmAn4MQ8LKP579mtrUZz0NSaj9af07FRpMvTHrYBkrTXwyFE
 J3ixPDCBrcLSEdhxPHY+2A+7Q23EiT0XwuuFDNQjQGhcoAlD1WprEGWemSz5tKlK4INw
 YsR3+nMORAzvqvugncd6gSNxWnUyYGfUVUjNZTqauZfCKgGUtlmfvcjNMp9sRwMXp8ou
 Aocw==
X-Gm-Message-State: AOAM531fUDj14ZFRPZqw1zCykPCCDm91hrMisJFNrEuEZlqaCIuSo8fB
 SdqM8yegL82FOmkirMdE08zRKg==
X-Received: by 2002:a9d:2d84:: with SMTP id g4mr2276647otb.212.1606838336594; 
 Tue, 01 Dec 2020 07:58:56 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r4sm21631otd.66.2020.12.01.07.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:58:55 -0800 (PST)
Subject: Re: [PATCH v2 24/28] hw/intc/armv7m_nvic: Fix "return from inactive
 handler" check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30bcef40-a260-91c3-0693-f017446f4916@linaro.org>
Date: Tue, 1 Dec 2020 09:58:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0w9miMU5C2Ti

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In commit 077d7449100d824a4 we added code to handle the v8M
> requirement that returns from NMI or HardFault forcibly deactivate
> those exceptions regardless of what interrupt the guest is trying to
> deactivate.  Unfortunately this broke the handling of the "illegal
> exception return because the returning exception number is not
> active" check for those cases.  In the pseudocode this test is done
> on the exception the guest asks to return from, but because our
> implementation was doing this in armv7m_nvic_complete_irq() after the
> new "deactivate NMI/HardFault regardless" code we ended up doing the
> test on the VecInfo for that exception instead, which usually meant
> failing to raise the illegal exception return fault.
> 
> In the case for "configurable exception targeting the opposite
> security state" we detected the illegal-return case but went ahead
> and deactivated the VecInfo anyway, which is wrong because that is
> the VecInfo for the other security state.
> 
> Rearrange the code so that we first identify the illegal return
> cases, then see if we really need to deactivate NMI or HardFault
> instead, and finally do the deactivation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 59 +++++++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


