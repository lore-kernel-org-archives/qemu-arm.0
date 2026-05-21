Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDB0CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:25:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4Ky-00044f-Ts; Thu, 21 May 2026 10:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Kq-0003v0-M3
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:25:17 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Kf-0007SP-Mw
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:25:07 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65318dafbcbso6187826d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373501; cv=none;
 d=google.com; s=arc-20240605;
 b=i05FxyQyfT3h3DXR0IQwPJIuSVVvlrrMyVbe757lttIAnmM/KZZTb4yyBCbvGO3VqI
 aMNjVVwtvnTmiTMWxFoMgIRyona/SgKV49aDLwaEv+cvgDLBmHy48Vlur3kY+BT5lPKc
 qQfrJ0GLEE4wDlfi54hUMTDCCPCDVL+jdpKLg/P7PIoqO4wtnEReqvDGbhWkmK0H2JVv
 27hJesXUQz5Zug6Amvbk1JO5tNFz9KfteSXc1HXZBaaNlz/ivTnp8ysWkKCRZ5mZReSV
 8qL7Sh0hF7YSRJZx+MuKzNQEJ2XJYdys6tPPr9Qv9vzQN2dMCNVSZLmnHv1MmzeFUVO6
 OedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IMV2VojKM9YiIg5cUWJK1+VmYrgz8Yp4qTbDppJE9p4=;
 fh=qGRbdIsdVZVSDk9o+3euYZQmQsGi8YpaD66e78QsGCE=;
 b=b3Ds2S5X16iUy49jSicAD2mYLxqO8JUaESalkq4gdWjVNuA2eI8P32CqjNdI0emvTr
 AsUHMJrCZYIpSyczplW/Ftz30Z5K6f7UPSbn5wctBR7CwU8P+Mp+RmrSl8NVz7R7lGa2
 5CrTNaddLtgGE34ci+unuA2G5GE0b3b4zQfz+iKIqN5/DkeI3iXqql+n1aMorlJOY+Yw
 ShPwy3zfx3fadWQwxUMm3+f8wZ665mEeDj3G1HI0TGWFwiXvcTWYdNXYmJVWzm8GAnUl
 F3AuY6wk/mauxaVcAW3wP0CbtF3jDjsPVo+OVlXyf0sf1fwhZLeb4SJ+cysgp5HzWK+n
 jHyw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779373501; x=1779978301; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IMV2VojKM9YiIg5cUWJK1+VmYrgz8Yp4qTbDppJE9p4=;
 b=tZb15mzYTapuq7Nf1Wuvd5t2C8576MFWJJm8vbrYxKq7YFCCqRPBRWZl69pFX4+6ip
 G2+ieiTbSr7ldjiQpJSEZubIZ/LFxxVqjadXVhgUzn7k62/dDx9cPXfDqcwTFXp6Vdek
 obVZlcoUKDEGNddWxxz/vhMoqIdxgQ/KkINi6MR7IhEvkpV2kwq6BM3nyfPLxnl9DGpk
 +e271Ji3L3ANAD5tpoM7DGav5yvgy4z7TG+O+d3GeVgnigAL2T2VTrhX1olLlZlF7aZq
 FI6OqGv0z70+afm9hdE/mCHVBsWrmtSs92mUfe/gdx8pCYPA+MiRNP0g7+ohzrgIo83P
 rtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779373501; x=1779978301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMV2VojKM9YiIg5cUWJK1+VmYrgz8Yp4qTbDppJE9p4=;
 b=cNh7eACPmE7by9G0LfT4xf/OolMXOQKCj8L2rngGqHqTM1+2hTvaDasjKUhJ7WhAgn
 9Nz5eeeqkV28bfxBL+YmzyZ4ONCnqNC8GPfV9aLsWWR2sA1J/Pj+lkREz4X+paj2AdPt
 3xxLme+gjNWDe9V7otYtHpTEw6+pqxvzc8zUOYW9vPzegpXCcmUTyzvmqkxcRlGPmg6t
 Ylb7iKr9RfD7CS8iKWoEc8tZOVqdeIQIaLOMDz9fYVCZU61/ngQFsyJmeGIRblUlx9g2
 BVoLh1XuCqJ5QwNJIJyYpm9sdsOLR0MVFze5SbAgNvJoKGikKhrWLoqs92y38abwnIsj
 s8uA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9QZrK5d7jalgNkaEyC8bVW9AyCipJScV4gWdYn6i60Sgt1QYs3S1w1b9Zu/Rtt7vB4KJNIIQ/nUw==@nongnu.org
X-Gm-Message-State: AOJu0Yy01Nrkk+nLPyMrU+uStlj9DMfKY3AWqzRNZq59e0IcROqiwElH
 G82vApc6GpyYc0/QdKxTynN0dQJxo+7eKuxWkxTyuU7t2P+8SwaoskQFo/UQkh14C5v6HK3A02a
 Ud9A3qDKiAsdNGT3YWPrpTp7vOnReFKlZonyIeNk5ow==
X-Gm-Gg: Acq92OFm2zHoJ1anKtuRQJtsBVwzlTGO24vzRaKDXdqaQTqR0yrnCrxfN5+FO07M4oC
 vAVEjo+1d8k/ERu042rcgV3bMmfLWdemGHVPdnqMiNnYoUuPNhOJsuZp5A0eZdEqZ/3pfZdxunH
 KTTnhFbGBSR+FsMTttNXMvRxXoDTTVCJVCZ9LgCaTVPxzPwEjhV2ffl/z950/Vg9uAvbOMMs9KY
 /BYBeLQA2AWqEZ6UUb6p9HbS9pq9BivalMimtFJ2cM5OCdMtYYRPsJn5uyb6e8QynJT+p2QFugQ
 uh8bE2HH5wLFQN89kDYhcu/LGeb1Ntcahev6h+uF3QeKdrfiKhL1muOiwFYmZ6psMX1IoZERb24
 jEA==
X-Received: by 2002:a05:690e:140d:b0:65c:2ac8:ec3a with SMTP id
 956f58d0204a3-65eadfc9228mr2604010d50.21.1779373501074; Thu, 21 May 2026
 07:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-17-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:24:49 +0100
X-Gm-Features: AVHnY4LMy91g4wBRaAIznalaSncZHAyZGwPatmGhi0mRbciHyujRbqPY6i4iAyU
Message-ID: <CAFEAcA9bEO6QrchkPg-XRxi0i1ijaw0z2Wmc8QxJZuGAxhBs_g@mail.gmail.com>
Subject: Re: [PATCH v6 16/64] target/arm: Enable FEAT_FPMR for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c        | 4 ++++
>  docs/system/arm/emulation.rst | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index ff0c2b1c47..a377f67b9c 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1297,6 +1297,10 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
>      SET_IDREG(isar, ID_AA64PFR1, t);
>
> +    t = GET_IDREG(isar, ID_AA64PFR2);
> +    t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
> +    SET_IDREG(isar, ID_AA64PFR2, t);
> +
>      t = GET_IDREG(isar, ID_AA64MMFR0);
>      t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
>      t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index da5f7efce2..44c7196d09 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -77,6 +77,7 @@ the following architecture extensions:
>  - FEAT_FPAC (Faulting on AUT* instructions)
>  - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
>  - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
> +- FEAT_FPMR (Floating-point mode register)

I generally keep to the capitalization the Arm ARM uses in
the section where it describes each feature, which in this
case is "Floating-point Mode Register".

>  - FEAT_FRINTTS (Floating-point to integer instructions)
>  - FEAT_FlagM (Flag manipulation instructions v2)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

