Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1811787lfm;
        Thu, 18 Jun 2020 09:39:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypAMtvKXPOACc2v/1Hh1zo57fnFriPy4UBA2TdieU/+RaCxAI6Tl2eJKLMvvhtIxZBQJl1
X-Received: by 2002:a25:cf0d:: with SMTP id f13mr7863579ybg.108.1592498375879;
        Thu, 18 Jun 2020 09:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592498375; cv=none;
        d=google.com; s=arc-20160816;
        b=gfyI7ky/UlVTNQR+ZpwsL3t9rmkJ9PQcxQ/gWcdQ6qrjMp6ixQw3xIkGRMb9dsATGc
         1LR8F2Ki2cNxBDfUqXMOMW3npqijKBT6OMGedT4yX9BepJuzHBMxadRFTcVkZ3Cm34WC
         l5/c+fgk4a/9Gt5O16Cf7DI3uQh5YtcXnvlfYHiIJW8hFiTJNGa3VmwsJDLnWdkAsUkv
         xgzjWn+gH+tLcaW2TD6KvwNN1+8Hq4ba2/ZYeH6HqS3/iHTiZGFFYoVPKGlbMZITKdtY
         rb5cxNGSGUcQ4nCUbPSAuzH+2K7YG/hyxYm0P+7DXWIibAxspgPcVieStbc1KvAzVv6I
         D5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Qq3iHbr4Ebotr0tZQjE91j16O7ZoICe3YyZSauPGbo=;
        b=JC+p8Qa/GRFpMV+Hg9S4sjBhSjQWmbYddoJxBEcVoUX7B9Nv5u6HeoLfjtQloDYXtl
         9Dfj5rJMHZPdmY53Hhtq4tXzzk2WYVqZnV7f9ByrYAmVW/NAmiiMjfMfLwTqloJUfxWy
         s4h8Sc6G98Pl+8E6H1iEmrMBydel72ZJ1zfaopnkwR/aQo2nY+AHncO7jqc0fh0ciN+e
         ZaBWifNhVLIqYHEwFCTDkDujUcYv80NyqEDli4M6TOMcANu+Wn9S4SogMUwkYIy8h/IJ
         t43KL5rhu2kmebDSo7mIQiIXnosCH3RKMr7qVdQ6uMhHRnRGhPnDFpq5BnBN/55WlSqf
         84nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EzE7/Xz1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t45si2820204ybi.478.2020.06.18.09.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EzE7/Xz1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxZf-0005yx-9u
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxZM-0005wx-LA
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:39:16 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxZL-0003gk-9N
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:39:16 -0400
Received: by mail-ot1-x342.google.com with SMTP id s13so5029877otd.7
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Qq3iHbr4Ebotr0tZQjE91j16O7ZoICe3YyZSauPGbo=;
 b=EzE7/Xz1q1rzE985qQaw5knsIfZ1VQpcxtvTEo+X5eQQzz/FP8PSQRmFtO/f5mWZ0b
 m0hHHaHjJ0wtwt6yUmRXQvY5rRiHux1QKHt5ZNVBPBgr4+nhWawqSY+pGxuLLUu0q6qI
 Fw5zsiyBCtPryRZQZUDdGUtWMXx1pyqw6yq7j370ndfeosF/1VNd6+sXOT80AE2UJ+Cs
 S9pO81N13WBwiToYuq258RgTgz0wqrDhraO7/Q/hhZBKFTGS8pNMRzbTTRZhplLAyW44
 0yqv1DKCTO4FWh2yFPSW5r3Wcfa7Eh3av3xnetBcPRZHIR9gKX6EIgmtN9CLSF8u/yyu
 +Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Qq3iHbr4Ebotr0tZQjE91j16O7ZoICe3YyZSauPGbo=;
 b=DpP1uWqz8uKoQouoxL7/ecEhQt0ipbE+id8Avx8RzpTlghODhdkNTN+xw4YVHpLpyp
 IJ9wxe7xeacw4VqXpSrQUvbx4Q91CxkQcwgyOMKyM55fsU3Gpzh7YhOBtn38h5dntKV2
 vZNpfRdjT99Fq02MTmbom8lansxrfReI+ehlUkDgmfucOi59P8A/ximp6prYNjJZgWHy
 Gs1Lc5XQAD9ryL6IdMVUNas7pmsmV0l7KAd7w7yA9NZr1f3L1m7rMTflbpkMsE/oFveB
 1xcO6VNpql+NZfyAJY583Eyz9DCHkCSfb8DJFz9P0A9s5GEVe9uHuHcfvygu6RpHl0ke
 DJaQ==
X-Gm-Message-State: AOAM533cXOcUSk5Vlaoo5KX7XHIYjISWXqa2/gTDm29rh4c/mzV43PDM
 YlqZMMgL5ggOrAadGVkFLqUSC+Cho6a/Ln2N4NldCw==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr4112709otn.221.1592498353737; 
 Thu, 18 Jun 2020 09:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-40-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:39:02 +0100
Message-ID: <CAFEAcA83Tb0r11R6EUFPrqLWrXNx4+9Q13q0m8X-jwO49Wgysw@mail.gmail.com>
Subject: Re: [PATCH v7 39/42] target/arm: Enable MTE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sSKTBcfOSCLL

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now implement all of the components of MTE, without actually
> supporting any tagged memory.  All MTE instructions will work,
> trivially, so we can enable support.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Delay user-only cpu reset bits to the user-only patch set.
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index cbc5c3868f..e4bce55c5f 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -655,6 +655,7 @@ static void aarch64_max_initfn(Object *obj)
>
>          t = cpu->isar.id_aa64pfr1;
>          t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
>          cpu->isar.id_aa64pfr1 = t;

If we don't actually have tagged memory yet should we really
set the MTE field to 2 rather than 1 ?

thanks
-- PMM
