Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3071199njb;
        Tue, 18 Mar 2025 10:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0oYWxjPJoftYSiJAYfI1Pd21RjlVz0cgd5Qls8qYMDtKBgYJyWKHGx6pz+b0zmj8Y3C++UFTxkj01OA==@linaro.org
X-Google-Smtp-Source: AGHT+IHbnYbhGRoCWBAug4bNiA25fbhWkwAaJd7cTU7dH5idyYTW1eA/KzoR4BvH2X9scB95tWEr
X-Received: by 2002:a05:6214:2489:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6eaeaaaa0afmr276306306d6.28.1742317210583;
        Tue, 18 Mar 2025 10:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742317210; cv=none;
        d=google.com; s=arc-20240605;
        b=FC6XtsuSI8OBKOTW/lhYvwYv081rIAag2zHEdk2toHPpkIN72NYCFOAlKHEK4hrNcz
         8qBOQ6+ziJiCUVuK6KBeeHQYRn2TmOZP7SSttZ1Ve21sdPpJ6r+oRCczGfr1Aqs29nOk
         W3KhGGT/O8ciZOUuzdrGnMLdVNVjWR2RRK+C7haS1xXTqyegBpnEflBkL/VvJEGuDbAH
         O28JKJhsdrK9uTWq3RyEHtbkgMUuxJ74g2ChZhcMEQTOjd9w95pxSB/FEt/6NHF0dPCU
         rIHrulx61chMDuAq8PIjHLhLybaVoG7j2FcI1laTLBzx6Bu7MrJUJ81Il03l7lUzObRJ
         Dpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sMT6Jk50mVoND0FsUtikB0YOobI1KlGFSg+zmDyEN4Q=;
        fh=mNpLM8Xv0A4Crr3pZr3FwStND5VBEzFH0Fc9T8e1kQo=;
        b=KkMgK+mZSLiUA7g0946iBkLdzTP6zPeVccGMRiESPd9I8L7JZncxm3yThMp/tNO8Rh
         0wo4K4SpPIkCbdhflFK1fzzYn1rwXeIh8JmN6nFqSG/mznXa7N545uZkJc8vMmUs0B9P
         bT+PnhT3Ha8X4M5fuyXuf3bQ0evFQzhXptQH8hkUhawdsWadKBcvfXuTTiDlA2iqrNaX
         bGZr23KWuVfZgHHm1Lkc2OaMJ3QLiTpRyCTez+LB1r4mwg2DqDQKX4Mo4pNrpekApi1/
         WgED+ekoJ69FUFb8rnCWLxFcNfYlwjQrVcbp8fOdEIEZeC2HB17EPsxLUA9e6qS/v9B/
         JotA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O32zzG2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade3582besi120539676d6.358.2025.03.18.10.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 10:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O32zzG2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuaII-0008Uw-Os; Tue, 18 Mar 2025 12:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuaIG-0008Uc-Kr
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:59:56 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuaIE-0003ZA-TQ
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 12:59:56 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e60aef2711fso4314244276.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742317193; x=1742921993; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sMT6Jk50mVoND0FsUtikB0YOobI1KlGFSg+zmDyEN4Q=;
 b=O32zzG2Yn9X2Y6hnamg1Znp+NfgpJVpHBHzjXaIwN85wVWunI6wDpQPZdZY3fsxqKE
 bB18giVOP2xaHxVaSSXZchERdpVVt/lB5EIdK8BjXBGI0YP5W2+FyU5mMKC2ARaNXJVI
 nSTNQe6Kp4a2jQy8qhlRXamoTY4cTGBqHMGazIq6iBS1bvvbUIuzXBygqO8tCNe3VAKV
 flVq1bEaQuHCnlqGU/lEGNNdLUfmeoIgwhflrp/tQm/XUdKA8wyPHdyxHTyt8U2U8gGe
 i9g/IGsFZiGApwRT37gvbu9U/A1x69Upj7B9itUb3QNRW3fFfMNJd0TQp72EkxRkJYiU
 Guxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742317193; x=1742921993;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMT6Jk50mVoND0FsUtikB0YOobI1KlGFSg+zmDyEN4Q=;
 b=lfHSHMgCEYkS3e9Cupw6/fjwDXFj46c7lZj6PCsz7j/4ZzvWPe3ATxUfPK8rAlM/Gd
 qBf4e1fBHI0XBeIMo6Fea6U3ObcWI9NR5UyP62oqXb7mYgpeZebD8rQhImAX+CI/qepo
 T94D36FU8DvEnzagD1x+xisOHifu9Gxurq/zC/yVv+r7jT1VvwItsHw5qWfMYyr+YS10
 qcvbCTwXd99Whi5FgxJqZylPrXcbykNu/gR7SKFmuwCyHO4u5s871RekmDjCTCYMWTW7
 IGWpAOZNv+LytHkWmLeB6wYzMIqqEVycYTQDgbloCwbl+ARHYXsFiEHNuQBf4GnL9hu0
 ELDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU75yvXX/v2Ll0VOsJ3/Kdepq4A7SbDB1S+/BY+BYsg29C2aedwIkdhkAWHRR7rHdKC8xgWI7eBKQ==@nongnu.org
X-Gm-Message-State: AOJu0YxcohvbegpkOnufIx1r6TH7xD7V8IHVG8OUb40NDqKh7miliOaa
 zPjJQ5coycD744loNg17HHiZgX4iYh/VVsDl2adSvEVDLf7ybDgNFPoU5wBxjspnwtbMGzYs330
 vGEFU7ckibpYDnXMa083xEENYlH55iEzcTUDU4Q==
X-Gm-Gg: ASbGncvu4837SlyA18T2VVc182He2s3wu+FtqzcY2HeeeKpeWpl8AnsbzSxkUJrMfGj
 Mxat8L28Mjmik1XB2YTnCCZkFnbg8Z2KhN6J2+rpaYXYKcNGcsKIcyCqub7TlhIZpePxDfm3K6w
 68MMUfqHVWXDq166uC5KhgRhALwY8=
X-Received: by 2002:a05:6902:723:b0:e5b:420b:8dc2 with SMTP id
 3f1490d57ef6-e63f64ec939mr23149287276.18.1742317193635; Tue, 18 Mar 2025
 09:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250315142050.3642741-1-linux@roeck-us.net>
In-Reply-To: <20250315142050.3642741-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 16:59:41 +0000
X-Gm-Features: AQ5f1JqIlD8ykM5M9CeqTV_4wmI9kZyi6aqmFVrhnLJr9HTlxu13djKw47PEY5E
Message-ID: <CAFEAcA-zPwJrq3oQk3MRp9ZCyTzDOg2-Je00v20pVzrKe8he6w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add missing psci_conduit to NPCM8XX SoC boot info
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: xn+bcfi2OniT

On Sat, 15 Mar 2025 at 14:20, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Without psci_conduit, the Linux kernel crashes almost immediately.
>
>     psci: probing for conduit method from DT.
>     Internal error: Oops - Undefined instruction: 0000000002000000 [#1] PREEMPT SMP
>
> Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/npcm8xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
> index f182accc47..e5a1929ed7 100644
> --- a/hw/arm/npcm8xx.c
> +++ b/hw/arm/npcm8xx.c
> @@ -346,6 +346,7 @@ static struct arm_boot_info npcm8xx_binfo = {
>      .secure_boot            = false,
>      .board_id               = -1,
>      .board_setup_addr       = NPCM8XX_BOARD_SETUP_ADDR,
> +    .psci_conduit           = QEMU_PSCI_CONDUIT_SMC,
>  };

Why do we need this for npcm8xx when we don't need it
for npcm7xx? Or is it also broken on 7xx?

thanks
-- PMM
