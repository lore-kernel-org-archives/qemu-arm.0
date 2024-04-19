Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2562749ejd;
        Fri, 19 Apr 2024 10:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/ojLEOgW2yMsM/dHWFzL3JT07J7LpEHoEy2dAwxeGptcDKJz2MiMbgNIDGQ7YZRcQeaji04MGRMFble3zpH2lzsxgWg00
X-Google-Smtp-Source: AGHT+IGWr2mWlrfENRY31VdLrVBYo/+QoMosDvV1gppiwBtxpkiZmCTkS5Z4dpAELUv9gC1Zoe/X
X-Received: by 2002:a0c:e791:0:b0:69b:24f2:c2eb with SMTP id x17-20020a0ce791000000b0069b24f2c2ebmr3506681qvn.59.1713548265635;
        Fri, 19 Apr 2024 10:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713548265; cv=none;
        d=google.com; s=arc-20160816;
        b=IsMT6hJE1lh10LvH3R9yisKNk2+502oHNTOldiy53D0JBo9n2d992oTqEkGtJw2Eam
         mGLMi8JX+Ltop9gva7rZqeFgzETLq/KknhIcAVAx+mpyWMs6VKGHgDLmnppYeipgjsPy
         pB0ctL8uDjTGnw/GDqXIG77fTSOZIbcfLUWatZOuN0Al33KgfBlHwvqYFiDcr7KAjXlt
         ARA1rm53wyIwM69qU+aRzgRwp5F+mKaUFpek/KqMu7/5NU1/bsePscoUDoh8joAUC/uw
         Agl0lO5QDxJwBvhYgvO09GUI62LA2RfRHeEBCSJVQbxCShngmCn1Ij9u9rRrVRuHg/D1
         G45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xI9shwFKRsiVt360abO99mGfeOn4kepQF/rcjZ6h/wI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=aXCbUUuR5st/prKv6aUPpvOiBjsAbTx1h8MeatXk6ELxa2sqLGjkuHL0tMfKJnwxwm
         ZuyujuQVK2h+8DLv+mQaf0eqai8sTKtbT0oJXSTMEG9Oe+0jXdytc2cIvKqiyIfMREFA
         LE1fQafvqmwi6J4tgy6O7nyvoh3Wp59Js3ejc03v/6cqNTgYECaV9ibF/poWZCjzeIOR
         5CHzw9rMW/4V7UXhYr/9J09xazk29xwe/HljVR/ipT3m9gGjU9wCaq93gP/GOw/k8tdz
         H5LJSXXLiEWeCU998Wj0noltFqxUdldiFKlE2tuneagR8K5MtkSiFDQWHUbmFcusxCxL
         0G5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgwGbem5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib2-20020a0562141c8200b00699403c5771si4345294qvb.291.2024.04.19.10.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 10:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgwGbem5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxsAz-0003eU-8Z; Fri, 19 Apr 2024 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxsAy-0003eB-B9
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 13:37:28 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxsAw-0003oY-Iw
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 13:37:27 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-571bddddbc2so1940968a12.1
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713548244; x=1714153044; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xI9shwFKRsiVt360abO99mGfeOn4kepQF/rcjZ6h/wI=;
 b=jgwGbem57FI8D8Hd9uh6HSM8bCQEu3OMsKFWaGdEhMBODlsMksCge75HkXipCcfqwl
 Pmr9jXPl58Ga+EoDBHoSUEqveaDj4HelnnBW4V6M4wBkBe5SrK3trMG6/iPuoPZ/GI8b
 SQvbbFcUTYftNKKcMKmpvxTzS3kfdzUstU0dhUTgQjQk45vLSdqO+M6O6lLAxyhP/j/Q
 hYLqnij+Wpy+2zX0q+3OgdXNJDG0XOKfXFzyzsKap2zK1WUgnoLgwqZrDj/ZRBFiqVB/
 Z/tOjgc9CiNzFFjRgjwn5qxRKOUJIPaq4cF9QCECooIs+z/6jqlSwkCGfO9GlemhudT+
 Fcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713548244; x=1714153044;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xI9shwFKRsiVt360abO99mGfeOn4kepQF/rcjZ6h/wI=;
 b=LxlVYtz0tBJJ7boerrjjb/W9SIhsKESx9N3K5L0OaEK9tMkA/L4H/C9kgVPW2dGaZK
 MKCA8a9Auc5OwOChndm9AqpAwiyMgmncHjFPxktc4yndXUz9x4A8z9KylouaS/9MeV8n
 hlnTFulbvzri/bt/kNsBbODxGU/HFQezI/J+NQoq596nENpwaVZsoEB/rfMYRjvLtMJV
 fdEWoN1zr2bq/aONgobZEm1wnOr2P+Fziv0H8gsDz4JjQEAh55o2njj5k8q2LiU9fqNs
 BG0kkHkds2eJEZkoc4EuJRnwHDFe+IZJPR7MrdAtxhe3iztb8sAFPOpF1G+7hgNs5afE
 jHgw==
X-Gm-Message-State: AOJu0Yw4WO4MYfkkh585SIgShlnYME6BBghXgo7SRnkx23FWjlFX1Izl
 Kf8zgRP7IeihpDjO1OgLvnovfFcJlBxoseSRQh/QkfVYw5Ebms9o5+XCmKwrrHXAtujh5dPEgS7
 iL8YWPiUNpspNw31C6beNtuydWvho+DUIqP/8NCNope000d6X
X-Received: by 2002:a50:bb48:0:b0:56e:238e:372c with SMTP id
 y66-20020a50bb48000000b0056e238e372cmr1764521ede.26.1713548244277; Fri, 19
 Apr 2024 10:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
 <20240418152004.2106516-2-peter.maydell@linaro.org>
In-Reply-To: <20240418152004.2106516-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Apr 2024 18:37:13 +0100
Message-ID: <CAFEAcA92B8C1tRpm53kjnrskbuSyJa7ss9BEKZ+uNsMiAAbeGA@mail.gmail.com>
Subject: Re: [PATCH 1/5] docs/system/arm/emulation.rst: Add missing
 implemented features
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sNevD55bF+D6

On Thu, 18 Apr 2024 at 16:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> As of version DDI0487K.a of the Arm ARM, some architectural features
> which previously didn't have official names have been named.  Add
> these to the list of features which QEMU's TCG emulation supports.
> Mostly these are features which we thought of as part of baseline 8.0
> support.  For SVE and SVE2, the names have been brought into line
> with the FEAT_* naming convention of other extensions, and some
> sub-components split into separate FEAT_ items.  In a few cases (eg
> FEAT_CCIDX, FEAT_DPB2) the omission from our list was just an oversight.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/emulation.rst | 37 +++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 2a7bbb82dc4..9388c7dd553 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -8,13 +8,25 @@ Armv8 versions of the A-profile architecture. It also has support for
>  the following architecture extensions:
>
>  - FEAT_AA32BF16 (AArch32 BFloat16 instructions)
> +- FEAT_AA32EL0 (Support for AArch32 at EL0)
> +- FEAT_AA32EL1 (Support for AArch32 at EL1)
> +- FEAT_AA32EL2 (Support for AArch32 at EL2)
> +- FEAT_AA32EL3 (Support for AArch32 at EL3)
>  - FEAT_AA32HPD (AArch32 hierarchical permission disables)
>  - FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
> +- FEAT_AA64EL0 (Support for AArch64 at EL0)
> +- FEAT_AA64EL1 (Support for AArch64 at EL1)
> +- FEAT_AA64EL2 (Support for AArch64 at EL2)
> +- FEAT_AA64EL3 (Support for AArch64 at EL3)
> +- FEAT_AdvSIMD (Advanced SIMD Extension)
>  - FEAT_AES (AESD and AESE instructions)
> +- FEAT_ASID16 (16 bit ASID)
>  - FEAT_BBM at level 2 (Translation table break-before-make levels)
>  - FEAT_BF16 (AArch64 BFloat16 instructions)
>  - FEAT_BTI (Branch Target Identification)
> +- FEAT_CCIDX (Extended cache index)
>  - FEAT_CRC32 (CRC32 instructions)
> +- FEAT_Crypto (Cryptographic Extension)

I missed one here: we can also add
FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)

(Like FEAT_Crypto, this is an "umbrella" feature naming the
combination of various other crypto related features, all of which
we already implement.)

-- PMM
