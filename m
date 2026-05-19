Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC20CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 11:49:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPIwH-0008NV-Ed; Tue, 19 May 2026 07:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPIw4-0008LN-DV
 for qemu-arm@nongnu.org; Tue, 19 May 2026 07:48:34 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPIw2-0003Il-Qf
 for qemu-arm@nongnu.org; Tue, 19 May 2026 07:48:32 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65e170f1ca5so3485593d50.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 04:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779191307; cv=none;
 d=google.com; s=arc-20240605;
 b=X1bJYFHi7nVVxuuH45s9/C6La3aWPfSF6xeEWQ4b4qGZgWAS9vhkofJuev3Eu7W0dX
 InauzaJUZLrYSvpbMmfC+29PhSw3z9EX7zAlbAMY+RVShT9tdeRNA3r4lDG2SV+YKBu/
 sz8Yh6J7Y3I1Zef47OLACs/FxxYwJj+s3lFqWWQSHg1dSBC8xQhJhJQGjboKxhcGWiro
 LbMdh9Cci3a/90sEG+a8eXyT0Afl0d3hfUZIaQw+t161BPRL84SlFC47qjQ3kOmzXdad
 f2O0t6cg0/Rj07L8mrT08JnXb2KzM7N/hgMXpXpcTdnGoIHEWwUssAd6LVSR8GCitG2R
 r5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ro2CqTwsznCgwhHdriIsTvxbARkqkKEYYmfW8L+elBk=;
 fh=8K1KyfHzId9ietgZeBPhEFhttopdyZgu3NehuPk53bQ=;
 b=Ewlz7p9QTtMC0V3sICg1Sd+d0EYZOZGpDIOFLTi0FxVZFa2UTBPK8n2NeBuzK0eosU
 bBF+om/OBfU+iCStlhMK8VvORP+s06Jo4/Y/m2MqlnpubYDDO7UE8JdVC4LR3eEysxze
 /HSiZejfvu+20FXz211GhEQ05t/MhikwPRpzoUtY4rpOqL00XpWJqDgv3SmCNlf9O0y3
 W1Nt1MsJkNKjzn+q5WqHRUbQcTLnnbI7CLXCLo1y849ABudxjksEJdQPHUZIFO1kE7ME
 LPY12gEkEeLmJCluHWAtzSDJnEZ3cquZstrwg1spyBxbyfCokSEmvS17X/TwADJ5ecJx
 YpuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779191307; x=1779796107; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ro2CqTwsznCgwhHdriIsTvxbARkqkKEYYmfW8L+elBk=;
 b=UjDK3ToAr/4dBpAjCu84tVyjpmL1IZBq+rzbp7rDiE63VhpeLWHLgVMwK2NpkAS2so
 sMqU4UniSnmvfnNr1xkrBvhkGLjf1lYsF6F370+xXkqvFR9VPUcTzRJtuyp/9lUqBjKd
 0HE0zE5AeCoZRHkxNonVSgDktyVfIluK9NQao4f6hyrQB2vVillompRDDy4kWi0Je1gz
 EE2bGKeZklOAQr5PAIM4EawtEYKrjZNwAV0LTmo3eVriJl6X9s1jqMmrqHB7DD+QPLqA
 cHWDtj7Hds6rIMDafjJDjUxV0zzouBKH82lAOYntfIUmWZFPoe5o6p/wxUPD0o8qguLW
 GoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779191307; x=1779796107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ro2CqTwsznCgwhHdriIsTvxbARkqkKEYYmfW8L+elBk=;
 b=NEDGIu52ohn6WG9EfkZU0BkZqcAwYdzagc0JgNuU3k2QZ8I+lYBh40yVyAby07uhrs
 NWYVH/Lqs5TYBpRGTjsp10g+YF40ek8FCPt5Cv3gY8AdXEpWVkZn49UhDQZ0N2dDInrt
 6NtLllPgIIfPk3FnU7r9htw/aQ5oeBcmP/zR+hqP2OnZdSHVnkfvRhgfxdCn/DL92UgJ
 wpMOpghcPUVxq5kI3MLk7XWKiHPErV+bZ/UWN+Pf7YAzcOUR5eVLSSY4ImEK0VaTKoAp
 a56HaJodBMS3c3G9ziTRrXrknkfTS2BI/V61qT83Mk82j9AUNNN8sn1lgtdOvGm7fz5G
 AZEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UXXvxVQxpJFJ2eRivU+Y5NZRoulYPHvVmyFLs2Yvi88sMV6Ni0TOsiJOnIKqt2wGrTFiwZbqiBA==@nongnu.org
X-Gm-Message-State: AOJu0YwdzCHc81eZkGlRGbOUiZlkM4UVC44qFJw9oyqL6zXRQ0lvDl83
 IWf9qeHxF0XYYn/x4uEsMWv+TXHs4CxNYnpY78PncSC4WoBcggJh+Km8lACJrX2jTNnQj+l1eUU
 yddVkgw7HrdK0w6GHPVSbzSclpmrVP5fwcl3zclxqyw==
X-Gm-Gg: Acq92OEmV/d2lZdJ6SWhxvNGkFMKSOcAuuXnC7jUPYwSBQ+twfTyHpgbu9uazncSMLF
 pSSZmoc5MfrrASVKhCNOVcS6Bwv/KyC2QqzJjMCsLejAgGO89sQj07PzVFIsVRiOu4wtMlJAnHj
 cPmn/ARU1948gWaErcJRJgyYT7enDcyoXvTcq2a6VB1ryni7xhoL9LbN37fmzotwbYCl9TjpllY
 n3MVgMn9lloukCgSQMz4VQbOnkhA+r6cOUK77X8xLJrnAzVKIf32q0UXEzd0ySIQSgaw5TYPrj+
 FNrG7i4miFutOMssd32Iwp4JvR3GzK4uWO6a0e1LgZSwU6mD3kuqrI4lMTj6LhZuUn+VbOzNLBR
 eXg==
X-Received: by 2002:a05:690e:158b:20b0:65b:123:1b00 with SMTP id
 956f58d0204a3-65e2272305emr15774851d50.26.1779191307469; Tue, 19 May 2026
 04:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-10-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 12:48:15 +0100
X-Gm-Features: AVHnY4LqTiVpC8bZlw9hx-XTLJ_ABMok0OvLfdSmRzO_gS0vMdD95NTStJsS4pA
Message-ID: <CAFEAcA8C446_o=NnvX874JWKf4XGVdfoEOkhJaz6jgqxxwPDxA@mail.gmail.com>
Subject: Re: [PATCH v5 09/63] target/arm: Introduce FPMR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Sun, 17 May 2026 at 01:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce the special register FPMR and its fields.
> Migrate it when present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Is it worth printing FPMR with FPSR and FPCR in
aarch64_cpu_dump_state() ? It would have been helpful
to me for debugging this series but maybe it's a bit niche
to include in the stock debug output.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

