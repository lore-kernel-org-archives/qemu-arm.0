Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp349411ejb;
        Thu, 16 Feb 2023 02:23:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/j3HC9QBr8YhcaFS+Y8HWKHMfP70ezs0NXuE5REGyxLmzccFTge4VpPia148zzrjC2ap7H
X-Received: by 2002:a05:622a:1888:b0:3ba:265d:6793 with SMTP id v8-20020a05622a188800b003ba265d6793mr8852784qtc.42.1676543022621;
        Thu, 16 Feb 2023 02:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676543022; cv=none;
        d=google.com; s=arc-20160816;
        b=wslD3EFCy1F+rYLuSKryOvKd57YN5FFt6dFbY7ujK9eqfjXTH11T9EZjSbBRknDSLP
         slxRcmctM1yCSHIIFIlxRz7mHtvv5LiPMOf5N71koV4SW1ThODZJZZPeIldRUjbjBA3y
         sJemECX21tTf6ectGs7SIqxGAJKBAwzHIJoR6j9P6daVdjXxYiiAf9Y3RMTUoyEYVXdK
         R5IMpJIDBc2ZQsAIZCPMoKNso4/Gc7WqVs5BdfNqBwnSySVCfnQ+KetOiQPZ9QOEuq7M
         9of7GZMmBdZGzI4AMBu72VtiMZo6q1dUhKIjRllWU+te+wqQhV1hBFW/ytP1Pb+RIjMP
         zstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qF4xFLnMHBKEml2AutB7MUFOJuO3omVk9yCB0KBkUV0=;
        b=MJpZyERah0hjVc3divXqCEmFw/mZsxG4DshqA2pdjwaA0Cx/USa6YvvHtw/8PbJKdf
         T5UHjb5SrzGKGgkGKFBitrPi9O08tHo5ErLU+OMZzmqFxv8Kdb7AuJcpsneonNJpL9+j
         GeKcE6AP2as1qCMoP5uIvvlE8Zq8+izUlbNBhRkQ3ZufyVVH5Ya9wP6mtJCejYS8gLW8
         596QUUearIs0OJIp4zyVl3XewNhlSmDh5W4SZ1kn60uvpni6jUo+IVH5O4cf8LJjQOf7
         791Na+Lijqr0dFVowMiSlMjtZDU0sSLTekqE/BLY2qLQ2v1fASpI9MrogxdeRpUQQVe6
         cbTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4CGNwBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a05620a28ca00b006fc7553fa6asi1364837qkp.216.2023.02.16.02.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 02:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4CGNwBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSbQJ-00067R-N6; Thu, 16 Feb 2023 05:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbQI-00064C-Qg
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 05:23:30 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbQH-0001a5-0f
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 05:23:30 -0500
Received: by mail-pf1-x435.google.com with SMTP id x13so912795pfu.7
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 02:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676543007;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qF4xFLnMHBKEml2AutB7MUFOJuO3omVk9yCB0KBkUV0=;
 b=Q4CGNwBigZMMKyqn/yw8bVPrau63aRCYI7COHya4oVnXQujAb56TeKUfX/FkfAR0br
 7OwyYY4eq2CXi6qY3DUSmzbpZEkN3FpJ85Yhqy5f8akNj5lupww7muuGuk/58+oyGjMn
 m/EsZKB1BKdiwgZWJGvuRfn3fSOBp4vkKJ/7S+o6OqtfazrFO4bLMEQjAr2TEQjPj1UW
 NKdo6jKmnQ4yQzPFZq8vtwV76aMQhA7yp7Sp2dZeglNaCLb/+E+vgzMtnvUKACI4Dlo2
 TLq7H75dsRuJoMVPSVr2+n+DRgYLnEF6784GkX+FCegfl6tm5WUvx0pbiHKdh5QFCv0I
 IxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676543007;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qF4xFLnMHBKEml2AutB7MUFOJuO3omVk9yCB0KBkUV0=;
 b=pVHs/X6yeWluvbXjVKH+WjaE0+KftudgEFn+fXE+jAKyQuMSwKaPgqamIDgoQcXpse
 mVc1tUB1gyTyBgzh4Yq2aP1YMM35phOTvueTf5+S2vnlWptBsh7CPo/da0XsfWQO3wPW
 f4PiiPzMYqddjvZEIeKJr20ScMJClg/931JyBizlGS2iAJprulrTGg3eu3TNDRlobHpS
 n8+sG2mu7EgFX53bdXc5nmpo6O0orAOCHkK1hu4m7s5tieEQNIYhk/rOy2UMlft7kBEG
 2tZ9mRgeHGqd8aKuYkzlZPwKcPVPnYpbpXw6gznxr3WHIp0Et8ZZVtPQ+1ExlYq0uX9d
 TKqw==
X-Gm-Message-State: AO0yUKWw0ifReCL6yHArJgraLSk6F8FLLCHV4joK+N+SDAzxlOFkCysO
 bF39MZtw20yRfMWbJCz61s+LxwF8cr7s5MGe8wA1uYfIcyw1Ug==
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr13867pfd.48.1676543007244; Thu, 16 Feb
 2023 02:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20230215234846.GJ95670@funkthat.com>
In-Reply-To: <20230215234846.GJ95670@funkthat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 10:23:16 +0000
Message-ID: <CAFEAcA8UDrzWQjutAwWQE2kzP7-RgjbFCnWb2j4ve+UARnHh7A@mail.gmail.com>
Subject: Re: Detecting qemu from guest on arm/hvf (apple arm)
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: iupYNj5r6lpi

On Thu, 16 Feb 2023 at 02:05, John-Mark Gurney <jmg@funkthat.com> wrote:
>
> Hello,
>
> I was wondering what the best way to detect that FreeBSD is running
> under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
> so I'm wondering if keying off of something like the QEMU0002 device
> in ACPI is the best way?  Or is there another option?

I guess the question is, why do you want to know? Typically
the guest OS shouldn't care about whether it's running
on bare metal, under a hypervisor, or under emulated QEMU,
except to the extent that it wants to use specific features,
in which case the question is more "how do I query for the
existence of feature X?".

thanks
-- PMM
