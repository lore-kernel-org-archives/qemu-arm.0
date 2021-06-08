Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4269169lfa;
        Tue, 8 Jun 2021 03:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyobEI2VInD6YSFkeFy+hOE6VqeJYsDSHevcLW8o0Qs79w+EVQs598lWTD1GDs10dMuEJX2
X-Received: by 2002:a25:8185:: with SMTP id p5mr28773960ybk.54.1623146483798;
        Tue, 08 Jun 2021 03:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623146483; cv=none;
        d=google.com; s=arc-20160816;
        b=1BL8lUQ8CZi1W2tR4V9XK4TIGYzGDXapdU2uCKkaQfjPJwY2dnugmuAexnLyHcjK0s
         NjdiD8e9map2oxqWQRQOXMSVCns+x6fU8Z0z51AA/0HKsBRufhIgWheTOwfDP7e432RY
         Q2FRZnQvDEkeSA1DIik0Z/2tguFWeiQOf7abKecxd1KQLieiUh34IngZKuNCojjn+fht
         73x4CG7LBLkKzcAe7kzxcve+xqbSFtGkGLhbzrloYGONkzSDnQ0fhlqhkbVfKDoiPR/3
         cYsiot5GjdiG/37NtoRxMvi/ewwa2iUSaMwiPSKIujSmAozEVxBImCiLTEFyBYsc2Xsl
         a6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ubzMnTxIMvfIXo//3ITMrgf9s5cme1eyCAS1oiWmEdE=;
        b=jg+1mUPV2PMnd+QAGTKK+Bl0m5J5Gm3WAsDecARgYsWaFOkXX7fa3dvw9gEj8WCVjx
         NfZvG+wA1xrkgz3+vCgJj09Jm/TsOwA+6rQ0ko7NEoiioWGSGRDo4Dr0cbbIwhrFQIIG
         gmIVM/fyv30qb7BMR1MTQfJrhBb8NLjfStiSdQn9f6oB41aNmCHsvo8KMSLwot5vDanY
         pNigAgASTd7O5EaNOHw4Ia0wupdwN5d155xuBx9VOclYLT7LDs/j6uYrF6HwW18i+SxC
         tce9gi0U6+BbXg8FtteLHFkN0E8rMuPpBoYtEbxWC3OqLAFUlhCW8DWsy9GV3OvBp5sW
         7J5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q0ZW/jO0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si10455064ybf.4.2021.06.08.03.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q0ZW/jO0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqYXz-0006kD-51
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYXg-0006hr-9K
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:01:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYXa-0006IO-Eq
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:01:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id u24so23813653edy.11
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ubzMnTxIMvfIXo//3ITMrgf9s5cme1eyCAS1oiWmEdE=;
 b=Q0ZW/jO0DXlo04YQtyB3Q+XooiKFMKW0OIM/O7TJ63CVMCm4DYoA1d8ScdMfJpVW4g
 +iWNJULhcHC6hbmWtLSx7lral/Hm9xOof5dJFgeuxmzz8Hx+6zT0stdOEwIrPrLlvgmH
 Y7AkH4yi85TuKuFTVxo1v/yyqKqTQxqvGcM2vn5JfQBP61nIpSAWOrZpqCCtQrQZzr1U
 8oCA4MRGf5tIniGLhJNLRjjrG3jKWSW/fxBmOtW+kJZS89cgmDGPmA+i2si37A1/cmL9
 /Zfq7Rbev6E3a4hsfcPhIzMWlxIVMV08918sIgdnAe+/JC0j296gUKto3vewE24ilo01
 HyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ubzMnTxIMvfIXo//3ITMrgf9s5cme1eyCAS1oiWmEdE=;
 b=BqdHr3iRErt1EQC6i5BB017LbPt/2Yuyzr+u4014wXa6nOJVLWLK1atm86ioD1hQQw
 bMThykrTwPoZoSe2fxbYi/CoiPm+Q+R7OOQww/EUBU99F/N+DiFjsos9ZU2hOXahRzBD
 YrPQx2wXuskx/7CVRpfco+Bwi1fetR1e6sbQruUiW+3c0SzgYrXF1tsPgQewy6fksPGi
 QLWrHBJNoejzNiLXQIlHNpoPos/Mte2V4BMJ9n3vlvqKxl/NYZ2hMeS/zGb0iLM051Gh
 mvHe+WXX/5y/I+Lbse4kqQAMiFdCaSCpAkd/IHtSNUlFL7X4lfWDZU3Nn2to9qpEEJCR
 6F3g==
X-Gm-Message-State: AOAM531C0wqhyLREqNnQhwGMp4c9NdnGvQ6OjD+0DYjJ3gHrAn/5a3kU
 a40stmd/2wGUk8Me5l2NtbVaERt/9rwVq6CBtiVdDQ==
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr24442606edw.36.1623146455888; 
 Tue, 08 Jun 2021 03:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:00:22 +0100
Message-ID: <CAFEAcA9eLkv2u+qV9409ThLFQgLvZ2Nz+OPygPkRCp62rQ3ytw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sXfz0OPtXPlI

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v4:
>  - review comments addressed
>  - redesigned the lpi pending priority determination logic to scan
>    LPI pending table and config table right after lpi pending
>    statechanges(SET/RESET) through gicv3_redist_update_lpi() call to
>    determinethe highest priority lpi among the active lpis and save
>    the details.The high priority interrupt determination logic in
>    redistributor now usesthe saved high priority lpi details
>    (alongside other interrupt types) instead of calling
>    gicv3_redist_update_lpi() everytime(as in v3).This
>    significantly reduces the call overhead associated with
>    address_space_read of lpi config and pending tables.
>    Testing with this new design showed no boot delays.
>  - profiled execution of gicv3_redist_update_lpi() using perf and
>    framegraph to confirm execution is within normal limits.
>    Also,specifically measured execution time to be an average of 175us
>    with linux distro testing.
>  - All kvm_unit_tests PASS

This still fails to build with clang, in the same way as v3 failed.
Also (as noted in my other email, you need to integrate the updates
to the ACPI table test data into this series; 'make' and 'make check'
should work at every step in the patch series.

thanks
-- PMM
