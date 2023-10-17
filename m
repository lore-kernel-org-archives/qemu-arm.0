Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3912255ejc;
        Tue, 17 Oct 2023 06:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHECLCpnuYuLgaD1Do7VE6+Gn2932LSRcYKmQWxAcpQJyh6pg/Y+Z0cDg7v0iIonay61Ang
X-Received: by 2002:ad4:5c65:0:b0:66d:5b50:1056 with SMTP id i5-20020ad45c65000000b0066d5b501056mr2760551qvh.18.1697548530189;
        Tue, 17 Oct 2023 06:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697548530; cv=none;
        d=google.com; s=arc-20160816;
        b=BGdlol1cNgwxerKvjfg9kmVIaabqDdWMChN6Hjb2yhqahV85OD+TyUTjl5BPACBM2Z
         CjwoEM6Fjy5po8IaiKNFElDjxKnqB4519silVeTWm2MFBRjh6kdtFIVlKwNoqlqLsL/t
         DzyKhiHatSZ4IJdU6AqvCBQIhylaN+h6fe8JduXeElPDun8cilp3s/XJvnDtH4IUJ58P
         4Ij8sGdC8ymL6wL1vaLQ7LuF8gXLa9Wa/ZAuU+kRWEl1tvVcw7S0FZdR2nkhQaI0xD4+
         Z7Va+MiiG92KaBO8ZoCqwj98c10QEtZ2k/XoNh1xy+Ywrdt6HyfnTY2c8RvlksVY1zo+
         gakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3PIWlHOQf7Ft7I/UGJCbQJoTYFAbgm10uV10vlFL3rE=;
        fh=AOfICs4TaA8i77qnwvtNtWoKQT4eE6Az6vnhzQHu/4Y=;
        b=f0gxPnzRcGaEMWdaBMxd2NtsMdi6gUwTDUE+uRPla6KQ8SzskeLtGYh/7cLot/Fbj0
         jho1U8gE6yIaZuq1NN65IbrNXzChDGVOeEvIWKeR/Ya94VOeSlab4elwMMZHvcAlpVEK
         sKZsHbtANj5ew4O+sbdw0d+iCc17yJmVFTmY/kUnvjXCSAAEshE7+CYMFBMPGWVMjQkP
         5oeZCwKnUPKQfH1UtHGFs2oaDvJFSGdKpI0huX4r0Rfel4Zw0opakIFDGaPY03DAzC09
         XPcwr50fMUzw4bSwpsqn/3tmQ2EhX98bUH2EQ2UFR6m72+TiXn0No4GVdafMJWJ/AdxE
         TwnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ppLcLrlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz6-20020a05620a36c600b007682f9ca13fsi996710qkb.608.2023.10.17.06.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ppLcLrlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjuw-0004kj-SE; Tue, 17 Oct 2023 09:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjuv-0004kQ-IW
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:15:25 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsjut-00077C-2p
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:15:25 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so9893901a12.3
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697548521; x=1698153321; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3PIWlHOQf7Ft7I/UGJCbQJoTYFAbgm10uV10vlFL3rE=;
 b=ppLcLrlA7oiIYMmLIIjY9fafUuBSGrHZswZZVL0Tw9CLhXansnErghLy0z0ljOvIvn
 RP1aehRRnmCNRZyYPxdpJ/pImVeCfA4ra0O74WIWSXUSXorUd8GCdtRTdHguBbhSg1XD
 c/J3VHpf+kFOlhAQcWatFabg1C+8S+75SfQ7XhfLSdDacu7H+NHGnjzGPycWuyZKlmTb
 sMBipWXl8dsFeIA9sxb6ruKgjyBtvY8cjQb4wQ252XOVxtYa1cIqYMHerwrAve8/rAli
 XYOdHA5TbvQDb/EF8M2t18d8FZ19MqFCiDhaWMUUUyKL84GkDAkBjXe0EZnk68CB5MK5
 DsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548521; x=1698153321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3PIWlHOQf7Ft7I/UGJCbQJoTYFAbgm10uV10vlFL3rE=;
 b=gPA6c/sYnitjEOaceszfWq9KNIih//KCwt/PUBJhHrkA9zddtRwl+tAmJ4lmh9/hRJ
 j2GDmOauc15LiMWO7E00IaCaDK4jGCE+2TxIdvSq7eZwXJkiTnt2vDxKDpoEYJFTG3Zj
 Oe0ugPVOa+ZAT6kzFFxH0+lx2kg1y40NtI93j4iUXQWvHtfqGShojQwt8+bvft5EJDx/
 3n9j1KLtlbPaxfiR6dSpp4ls2OIn2VjEFF3wKGTbksLJe3U5ED2X4OQ1T+QE5dEPW3A7
 ai9YTsl9lN3qp+Ju/Vy7j81xS9PabDNYO2ySh43hmLaPCE3J6R8N8tZI81HLRrDlSwpr
 TplA==
X-Gm-Message-State: AOJu0YyS7ni55i4N3LE7DZWVhSYJixobzeUXJUKSXF5AQ1Sxld/L8p+M
 5M/RausPBs0xhBRXGKGVTkaGSvJwlKtA5kq778sZFw==
X-Received: by 2002:a50:ab16:0:b0:53d:9f84:3882 with SMTP id
 s22-20020a50ab16000000b0053d9f843882mr1582919edc.1.1697548521278; Tue, 17 Oct
 2023 06:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230920221819.1106029-1-nabihestefan@google.com>
In-Reply-To: <20230920221819.1106029-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 14:15:09 +0100
Message-ID: <CAFEAcA8wcEr0+7VUZA6FRCvvGBmhQ=BtGQ43Cu+r7vd9DSqpJA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: tJl3idiUA5OK

Hi; just a note that I am assuming that some of the other
Google or Nuvoton folks on cc will be reviewing this patchset.

thanks
-- PMM

On Wed, 20 Sept 2023 at 23:18, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> [Changes since v1]
> Fixed some errors in formatting.
> Fixed a merge error that I didn't see in v1.
> Removed Nuvoton 8xx references since that is a separate patch set.
>
> [Original Cover]
> Creates NPI Mailbox Module with data verification for read and write (internal and external),
> wiring to the Nuvoton SoC, and QTests.
>
> Also creates the GMAC Networking Module. Implements read and write functionalities with cooresponding descriptors
> and registers. Also includes QTests for the different functionalities.
>
> Hao Wu (5):
>   hw/misc: Add Nuvoton's PCI Mailbox Module
>   hw/arm: Add PCI mailbox module to Nuvoton SoC
>   hw/misc: Add qtest for NPCM7xx PCI Mailbox
>   hw/net: Add NPCMXXX GMAC device
>   hw/arm: Add GMAC devices to NPCM7XX SoC
>
> Nabih Estefan Diaz (6):
>   \tests/qtest: Creating qtest for GMAC Module
>   include/hw/net: Implemented Classes and Masks for GMAC Descriptors
>   hw/net: General GMAC Implementation
>   hw/net: GMAC Rx Implementation
>   hw/net: GMAC Tx Implementation
>   tests/qtest: Adding PCS Module test to GMAC Qtest
>
>  docs/system/arm/nuvoton.rst         |   2 +
>  hw/arm/npcm7xx.c                    |  53 +-
>  hw/misc/meson.build                 |   1 +
>  hw/misc/npcm7xx_pci_mbox.c          | 324 ++++++++++
>  hw/misc/trace-events                |   5 +
>  hw/net/meson.build                  |   2 +-
>  hw/net/npcm_gmac.c                  | 939 ++++++++++++++++++++++++++++
>  hw/net/trace-events                 |  20 +
>  include/hw/arm/npcm7xx.h            |   4 +
>  include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
>  include/hw/net/npcm_gmac.h          | 340 ++++++++++
>  tests/qtest/meson.build             |  12 +-
>  tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
>  tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
>  14 files changed, 2353 insertions(+), 9 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_pci_mbox.c
>  create mode 100644 hw/net/npcm_gmac.c
>  create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
>  create mode 100644 include/hw/net/npcm_gmac.h
>  create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
>  create mode 100644 tests/qtest/npcm_gmac-test.c
>
> --
> 2.42.0.459.ge4e396fd5e-goog
