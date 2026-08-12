Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F6FC5B56A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 10:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wu6B7-0004gS-3b; Wed, 12 Aug 2026 06:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6B6-0004gA-1F
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:27:20 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6B4-0002Vy-Mr
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:27:19 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6611669cd16so1136699d50.0
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 03:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786530437; cv=none;
 d=google.com; s=arc-20260327;
 b=cqEc/rCh14JdBfxy6oFdcfAFTFalp+RluCFNiCEJOh+itcA9jVrulwdDuu3tOTzEYr
 e2wfedztv8Zddz29WX3ZC79fi8VAzcPnx3tATaOlIPk9ft4lQ2Vd8UxVUxYyF/T/nhy6
 MaKVVb1yAVU30P3uefcRpiyMeGwGk7KO7WXZi2X23agIyovM7+iJP0DTKLIAZ+CKPUak
 obwN+2X2C0PPohPgugMKuiJYayLq+pklAEeWKTEpfe3GVzJoKvsvxJy5JfUqGBuWe7mV
 3XxUF6Ojk9++qZakPECI8TF5f++d128pQju+Iu6N9xhrQEGzLH0X/OXypeU4I535NiqU
 KTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6uBHImK2q22eZBBbSau2GPOmrCcmb9MHcdbO31DQD0s=;
 fh=rNHPf+1h5CTW0+chaZKKHkFSomf3wPLABERoch8b5AM=;
 b=fjZlHestl7DvJkT6m+au8Qk7Phl/XlkZRHv5eF9i1hPbAeWMn5Y0fmsfV8MuB4PkBc
 NrUXk2kOzptn946QMJY6QYjaSsijwXNXP+tHlbgY14yZEkujhgO30TcJ/NJhDQ0sKTxa
 /y20TI2w3osNZNsQoLijtgV/lnALppg7wAqyZpsdqix7zw+Y13qXyUF839HpXEp6QSlQ
 UukueZKOfUYWbp4X3olD/0CkTqPS1Qjkk6n6hGGj6COnn0BWrEj20w7bO/uHp7WrInMe
 eMOk8W1ZVXO70NPnuVM6WGpv8vnhnddKKueGR4Pm7oUGNnQp/AT46Q9GQNmlcXgkSejk
 RCnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786530437; x=1787135237; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6uBHImK2q22eZBBbSau2GPOmrCcmb9MHcdbO31DQD0s=;
 b=owS0t3Dzq5nFTCFYXkeLvatx5T8tfKudR5RyBBDMQC+neDgGO/7BnM0M/7D1v/hUIR
 oNZ0Xi2oyBuJr/1EtbkhT572VvuU2xMLrir+CnEEdVBLj5i0Ng2HOVTqIfCHMqqnPgL0
 MAEJe+Rgs5KC2jE0g3ptXb5GTclJvwe8zpgDY9KsyR4C1QLRsShzyt/MRjIUfuVDEj1t
 TQFsOg7SfMaH70v+c7H5IjV96EjqphxY/c7mFgROr+eeCwR8JVvycimzF28Hk/PaIDNx
 uIbbHTbPV3S2jVm6MFZMNS/aQyfdicGEmqoq96Cf0faW/FmNj/nb9wsXIEPscP9dai1t
 vHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786530437; x=1787135237;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6uBHImK2q22eZBBbSau2GPOmrCcmb9MHcdbO31DQD0s=;
 b=i5Vp5D8PgkoxXVEs/afrfryOVrPy4DvF/bq5bDe7syHedKMphL7iIead+oa7GIby0+
 BI7MKI2skOSIYf6xu1TUjhIorD5tic1LKsvKy2J2hMu47V8Sjac8yWOK9dKShlOOUOLj
 Z0kU/LVQIE3XRD4qt3c3cMYJ9YGyaXjMCoaBLZztiLQaUVJkWN2NLhOYtfmed2ak4j4X
 NWYvJLwNsyxmVwvX9Z3pdBMTQRiGuSFA/qqGKsYnpd2LK+Mj4XBggpFVoZt3nfu3Kcku
 S6wDFSBsCuyvdCH54Be7qowggg1b+EgjsCt7ZUzBA/TrCwcx7JAxJMer7hh+IqiUGTor
 ll1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrXAXdBr9OPl0qbNG9z+KGEyabzvjDL4TJFxB0oVA3vvsTz1Sc8BsuxpOZFyChGvWIWCUxO/IsfvQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzxCseed2rw4kV8K+RrABCqBZe3SK6VZHq5L6N0FtnNYRuqLf9
 k1cMs5M1UZ0zVFcO2syv7MlraN/SO5Bo7UIgyhymSsq8xxDIJWNPtRd6Lm5V53zOzM0GpWo0YIV
 Cb1Bou4jyAvtQFYvBqtLmtSdfLIdUif7TNNmVQy6sUA==
X-Gm-Gg: AR+sD12ynNpwlPfF3WOFiEEGdvkuMMGWQt5qyda4fSQ0HT7CTzVxcfqfoQ6cv7rW/Rz
 rj9N7cARqPYJmBNaswSalzLaVbFMc3WcrYdVrP0hIlJNTAkc5a19oMLPL2CLbP/Vgcdf7kvX9/m
 znrlO1TlhVVPKp0fKelpacYEPQyY7gSlNqwXapa8W+i0wzsxAZVzY7N7jf3P6qOceS4szWL2AT9
 Ys8vUIR9UwSD/i9HVImpYeQJJYm2wEsxfSNFNpgHE7PuZsIKYEQrfai7QX3SFFWpz15IhCYYBDr
 hj7BzSkpvB8x3oiWGW3nfkIit38sCChujxo5WXhdlxhgwpiHdGj1MXoq9kCUQmrkr/NZ2d3P6DA
 jpAbERAc8D6jbWsCg8wBJpEml1hEM
X-Received: by 2002:a05:690e:c41:b0:669:484d:52c2 with SMTP id
 956f58d0204a3-66b3435501emr1894005d50.36.1786530436579; Wed, 12 Aug 2026
 03:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260806163939.328201-1-richard.henderson@linaro.org>
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Aug 2026 11:27:05 +0100
X-Gm-Features: AUfX_my8DCGJ7Qq84Clv4Tuokm9LRf3FqNjYvMbskE7ET7s3uiakhj8pjdAGD68
Message-ID: <CAFEAcA8stJZ6JZW1un++6zj+CDwkR-zTpA4G9ksTetO-xOn01w@mail.gmail.com>
Subject: Re: [PATCH 0/7] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Thu, 6 Aug 2026 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is something that we've talked about for quite some time,
> having separate "max" cpu types for Armv{8,9}, because Armv9
> prohibits some deprecated Armv8 features.  Retaining all features
> simultaneously has the potential to cause confusion.
>
> r~
>
> Richard Henderson (7):
>   target/arm: Tidy cpu_max_initfn
>   target/arm: Pass ARMCPU to aarch64_aa32_a57_init
>   target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
>   target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn

I've taken these first four cleanup patches into target-arm.next.

thanks
-- PMM

