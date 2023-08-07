Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1642121ejb;
        Mon, 7 Aug 2023 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5DF8SGtVuRLUux2qWBkyimhSlQ6fO7TXv8aAEY7/ZyPmYjaPqDxATHFNVM16g8646e6jY
X-Received: by 2002:a05:622a:190a:b0:40d:6ce7:7692 with SMTP id w10-20020a05622a190a00b0040d6ce77692mr14374406qtc.52.1691432692507;
        Mon, 07 Aug 2023 11:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691432692; cv=none;
        d=google.com; s=arc-20160816;
        b=Qg+u+nkczBgB7JHqEEd/qG+ltVETpODQeGCYGhQyMJeUcdSicP9Yc5Fz7y1P6leuU5
         IqLcKCMhFLfqkoqpDGmSpkRzXJAbKtJLjwKHLnIAkEjP+Npv8zoPkwtDyXMW/lcjObF5
         dgvf+HJytvkyvNdxJIyXxqvcQHwu726WjoD0gicziVXIx9+z9P7cQX3R4ppUz3gOi7+p
         o8++m8n07uaLqwlC5EhsOYbEnJ+5mDE8U3+vSccXw9YbacO8Srk9sIvdb1FYTA9vT8UA
         hAgv41Jf0OU5lvbeDj5rE+iQRAM42EZU5EhCSNbpTiFk6bARaY/vCfH6JSJz/hAQPcMJ
         3+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=nYC+oAsG1o1E1C3M6snsqM8INrkC1a5IjUxeineQKZY=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=Z++cmFDqyeluOHrzSdVVlb/Uw78njinq+2weSTmAuzyx+jGm8Bfpqh6zx/yeg2Kz3n
         3k6DryzfvN+fTxu9Dtzo/kskobiN9l8Rtero3XdpIKe4AxOpwD+7NUvQrjxW85EO1VdY
         D/ETUit9ErkohVPQURxERQKWsrcIHYCS1Hebqp0BcrwHjIXNhqkCQepwpGctY0qgSxFC
         3ZRmLRvHEK/kj/XqMyow1sXUSvG87z+JrO11Ed5FP2RKfDnfteNeMVqHit0wLszgNOow
         GqWj1oo3Z9JVYDyMPetXEtT+SgPbEQKC8DPNdl6PinxZkHJOYJnYAqhzzhru9YWcumnT
         +Rmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibBtP5y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020ac85781000000b0040c34202141si5192380qta.504.2023.08.07.11.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 11:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibBtP5y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT4uK-0007fs-HT; Mon, 07 Aug 2023 14:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT4uJ-0007fX-2j
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 14:24:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT4uH-0003SA-6g
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 14:24:42 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bb7b8390e8so30328895ad.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691432679; x=1692037479;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYC+oAsG1o1E1C3M6snsqM8INrkC1a5IjUxeineQKZY=;
 b=ibBtP5y1fER9CoAL3cMMgdjeLicsBaxcNJYdnOEu/58IkGY/fjw1iPE8f4Hz4ZELIS
 iXRxnmxAVXkGBKBckD8R8nAddRVSOVoxsPqeL84SaykU9+46OoAIRuqwFPTBn8meT+ft
 lno8kDS/x62dwUZ/CcKal5cRb5QtAuNEXRym0R2KTpDmfl4JpBb+gkPbAZT/vOI1yD4/
 lcPpCz2z6Q8gcVBKV5wcwnEjfpCVPZPgsknYtgdzEa/MIX4zic2r3hv1ohQnROykmgRr
 mViXT17Lx5nXk762uRRQHb83uWWz6n1yAIORbW5Jfpibm6nt9pj0LrO0JqqGaWVWjLK7
 1Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691432679; x=1692037479;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYC+oAsG1o1E1C3M6snsqM8INrkC1a5IjUxeineQKZY=;
 b=NQ83PUctdk2CNOw1bHvYHGJVFxBpPHemCVCm8tjZdce6sBkBzrtlASaoBBv/M/jykS
 Rmsksw8zkXBj5AXrzwZMBt4GOqpAaujd0Tgx364I5fwtf0qw/oTDjn9gsfeqQ8LusTMQ
 B/wdNWeTKzwqVtPUJcxSE3SnX6iYs7VKBTIwzyPfGYJqD74Rw1XwcL7cWLL8C1NKvbrg
 d31hn8G4Utpj8SLSK7VTHKxiTvtWKgnHSW05OAKi1BldMw2DrUXydhppOjfIXhetG8Lz
 ZJKT4QiDOPx104AHSLz0gnhtiH3TMUyqTJS8jrifEGvNEKJLeAY9kUUnWrSzDCRWjIQF
 ZUKA==
X-Gm-Message-State: AOJu0YynNC8En2rNHPTyQzQKaFjCg0huVLDhii8Xivbt4kbn/Ewu3aKZ
 ik3XFl5dGUqLACcq0EbKNi7491hn3Ks3rYFkBds=
X-Received: by 2002:a17:902:ab88:b0:1bb:9bc8:d230 with SMTP id
 f8-20020a170902ab8800b001bb9bc8d230mr7374862plr.23.1691432679235; 
 Mon, 07 Aug 2023 11:24:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:e306:567a:e0a1:341?
 ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170902bd0700b001bc2831e1a8sm7222705pls.80.2023.08.07.11.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 11:24:38 -0700 (PDT)
Message-ID: <f5e8c9ce-6943-1f36-d450-e9905df826e0@linaro.org>
Date: Mon, 7 Aug 2023 11:24:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/15] target/arm/ptw: Pass an ARMSecuritySpace to
 arm_hcr_el2_eff_secstate()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230807141514.19075-1-peter.maydell@linaro.org>
 <20230807141514.19075-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230807141514.19075-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9e82BPh2Qhlm

On 8/7/23 07:15, Peter Maydell wrote:
> arm_hcr_el2_eff_secstate() takes a bool secure, which it uses to
> determine whether EL2 is enabled in the current security state.
> With the advent of FEAT_RME this is no longer sufficient, because
> EL2 can be enabled for Secure state but not for Root, and both
> of those will pass 'secure == true' in the callsites in ptw.c.
> 
> As it happens in all of our callsites in ptw.c we either avoid making
> the call or else avoid using the returned value if we're doing a
> translation for Root, so this is not a behaviour change even if the
> experimental FEAT_RME is enabled.  But it is less confusing in the
> ptw.c code if we avoid the use of a bool secure that duplicates some
> of the information in the ArmSecuritySpace argument.
> 
> Make arm_hcr_el2_eff_secstate() take an ARMSecuritySpace argument
> instead. Because we always want to know the HCR_EL2 for the
> security state defined by the current effective value of
> SCR_EL3.{NSE,NS}, it makes no sense to pass ARMSS_Root here,
> and we assert that callers don't do that.
> 
> To avoid the assert(), we thus push the call to
> arm_hcr_el2_eff_secstate() down into the cases in
> regime_translation_disabled() that need it, rather than calling the
> function and ignoring the result for the Root space translations.
> All other calls to this function in ptw.c are already in places
> where we have confirmed that the mmu_idx is a stage 2 translation
> or that the regime EL is not 3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v1->v2: instead of having arm_hcr_el2_eff_secstate()
> accept space == ARMSS_Root and return 0, have it assert that
> Root is not passed, and adjust regime_translation_disabled()
> accordingly.
> ---
>   target/arm/cpu.h    |  2 +-
>   target/arm/helper.c |  8 +++++---
>   target/arm/ptw.c    | 15 +++++++--------
>   3 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
