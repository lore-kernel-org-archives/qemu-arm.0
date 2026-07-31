Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E445C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 16:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpq9v-0001Ch-HE; Fri, 31 Jul 2026 12:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpq9t-0001Bi-Mh
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 12:32:29 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpq9s-0003fV-Bq
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 12:32:29 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-667923d86a7so1608293d50.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 09:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785515547; cv=none;
 d=google.com; s=arc-20260327;
 b=Nb3uh+w6ieBXJUDTpWmtO/ZC7fNVUfMT4ymjHuVn1Sx6+kqXokyOTmpqe04ZiV3zC8
 RoRyWOyZXcQe+Pw20ee028zKAFQcB/qZ568YkWXMKAeHTYA3xKVZ4LOdZ56B4f6+nglX
 sA6mBeVApkYmD1agJ+SI60fk7K23/1vUQvCVLrQn25pgwfXEmWwITnlJK9C1maB/bd+p
 a26vh0psyZ0olHFRtalY18I0N95dx2Wy/HOmpasWIdTGzOLrjFrH12BFIZAZkXKkkiB3
 Ft38RepeGmpQKpotbHLTsHBSzyVC4oN6PJ/8OcaqkpmHECSTrtsGkW/0kQxBwr0uvfRz
 Vr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oxPZQp11HYMpU79n/cPA45m6EN8EyAfwvwDLr/JLBak=;
 fh=wWW7tUBquXr+fMYFkygBj3H+BKtAa4g5tfrmaorQpVA=;
 b=FomJF0I5SONTtg6Dl3ZvSLeNcGaaEo2Q1bDs5c4gnhBh0go1M2KQ1IpNMKWFaqZKIp
 vBuTM3Gx46FftTVfWMBuyyFn/zkkGMu6ut5Yjsht3Ib5dg/nLGVNthy4VxS/1LiymKjm
 n859j/7GdSdiDkVN9DwCJzMZDPbu2VrpfPzkKAUBxFegwmpQU74O6Xt7dITLqBX6G4WW
 TpsfQxTqZjogQqcvaaU744yCuiGsKDPDyVgDr28JAuMXiYZLQ6lEeU+dajEsmY0WDphw
 FgOKikPi94A8SB6j4wExWoSYy5muXjpNtr4QnACv2+JPeyFmm7V//itQx1SzE5++hbuV
 gqiA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785515547; x=1786120347; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oxPZQp11HYMpU79n/cPA45m6EN8EyAfwvwDLr/JLBak=;
 b=nH1optFTyLgVP0T4HkwWb6kptIiGrMgZ2GO5cXK1JtX4SLh2zcwuJzAkWve0GCQ1Wx
 uBDl3MUwxOQklrasiOI2nh95E155YWLH2s6LPyJ3EccCw3dDGFdzQzf3NavRlV4AqLJF
 7OjTQUVDOgEVhHYgfgTkaBhi6KhixqbPlel+7ZFqGnVQWCgOUzK7psTXr6cgPWalLpUt
 pU28Ml5/UJRbwQox1KBmRrPG5iGSAOsiN2jTLX7NTbeyQ24eouFHUQ80WOKSzUlvL3EI
 QrGb3Y87Pjyosycm7on34fAsyqSrrHwifhKxJqKd6jcCyY98AmF8GMt6xgzz2aETWfVF
 YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785515547; x=1786120347;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oxPZQp11HYMpU79n/cPA45m6EN8EyAfwvwDLr/JLBak=;
 b=PmJNlAS/chRdwEV92LsV5wp7titQg5gQSW9VrdyAvDlbkjpJXiBJ90+2bw+MJCAQpw
 gt7Iw0dJR3L5VKZK7erb1R4vrFyXy8u9YKvgRoR7G9WlFJvIXBYikWI/bnnqcy5ZjRyS
 /QLz70IQ/4F3xOeGtxBYuAbM0f4WKd3eH4JewDMc8A9+Vd/qhFYaLOCFa94VqUTbW6DQ
 XoTUQJgsjKvc1awH/Cag8hdDnVWDgikPu8XHj0IWWf5CRX8LRmjPVhqLATN8MLNIAlH5
 U3Jao04FAr7KtUlQG98FssksAQpD4gq4qDAiLQrs1PHNr0cJEluEUYpWwrQwJIVo4X/z
 BZ3A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrngXIgZ/ytH7nds6fQJ5zIYe873/MuYOlhSfRTdurSRLsb21k2p0C5HTofA2Wt0wKUyyMPwWhZgQ==@nongnu.org
X-Gm-Message-State: AOJu0YzO3aAUld6bPAAOvzjg54hFh4BPpHPOHX0yD+5Y1vGIeIUFCTlb
 wmRcBMQl24CfX9oFJUaMDyE4L20LdmWBkMeduwkuVoe6x0A19jOqdDS3AGrb7rGZRI0rmB4k0Zd
 8Du+6eZhJ/AEVO80GM0vHeqkuaGnwaRFvYAsHYqApBQ==
X-Gm-Gg: AR+sD10LQXT4YE2gOCReDcUaZS5w0OdKhlnIHnJU2y89r8qj6A6nwHVM5tWTK4OJpTC
 QT9BV0HWR3YZZ5PjhE7ybKI3zWVrCKBkTxCBalx73afCsEjTlVkSiinDH8rNB216SjC/FhnOTBL
 VeDJ7UlJq4BRQ/NcLK7HlH3+gcmvmYw/QRG3nO8642hHkTU/bd1A+9VMYJ5VDdVK2qCMogkHHmA
 Q+Q9nF23TPnuKz0RnRENBmY6cxoczuVhig0z4wQVLSIr2ysTaqbV8PQnumoQ6N9toh05LhfVqJv
 Ch9UtDAj9Sj9ffSMmbjep+vrk4jagG7NnaRifCqxqk6LxdeNPFYGXQ2NVaSAB2dvqgiUJYLJX6K
 QDyMbGXcdf9vklHkJF6P7bidaP/5T
X-Received: by 2002:a05:690e:43d4:b0:664:a8fa:19db with SMTP id
 956f58d0204a3-66945bdfcebmr1671098d50.5.1785515546972; Fri, 31 Jul 2026
 09:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-4-richard.henderson@linaro.org>
In-Reply-To: <20260724030616.76180-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 17:32:15 +0100
X-Gm-Features: AUfX_mzs-YayEan41WbpaN8w0LxLhYKctZ0qLARl5gbPlx-3WpfNRtLqeiCbfhQ
Message-ID: <CAFEAcA9pQJsfj=5Xt-2dBWBEKtTW2rWgQNKQVZBp0sBdR+HDXg@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/arm: Add FGWTE3 FGT bit definitions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

