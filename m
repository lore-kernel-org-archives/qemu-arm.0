Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp346494ejb;
        Tue, 5 Dec 2023 09:55:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG4lks3K1SmszkC6u/7n0oyA1exlh5Hn0k5pueBW5E4mtaoVBPZuhjjsVG/zD5IM1acF1W
X-Received: by 2002:ad4:5505:0:b0:67a:a721:b1b5 with SMTP id pz5-20020ad45505000000b0067aa721b1b5mr1571524qvb.112.1701798928375;
        Tue, 05 Dec 2023 09:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701798928; cv=none;
        d=google.com; s=arc-20160816;
        b=IBQ7jeYq22982KudMylWHME3ggMZDonDzjYAfCAERdoBOqb0T2jAbmrLqE4dMuYpEc
         4rhBW/3SiAfG0CYNpmr9pOEgRzAXGRqpp1Xe/KGIs0xs1F7Mn0n0MazaYH1kjLFCgqon
         aH4BlaRpqvjgCeX1aTrwEudBCLbwxkGZvY/HEdUU8OywPP5BQDt0n2DkqdgbQRMBJyT8
         FUjoh/6rploKVkWxQCo1AwXnNBV3Yx14SaZi5ZkVbU84aRqpBtS8tBCB8SpJI7ZdjdZz
         SozypKU1hA83kRRgbIvf8Qk71t0c6L3xKez6UzcdNHLS04yFCoXuQTOSyC28FD9QrZnl
         PCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ah8a11d2I6vEhBdY+zb9gYIMyM45JmQk4Nwqq58ChyI=;
        fh=zkFjKJ/3XgdoUc9ra22W0XodonmNO+rt1r9W96SRn70=;
        b=Kjq+/k+1iRwnBMedQpjwl6Y9CkOjlpXRQKQrqKpEnV2G070eQ2V+KxJoXfFvtObtWz
         0MclJvaDKE3jFnB+m2sNZt6wD2+p7PZQ1+MRHEJxhDmxkODEtLOCBgTKWlOtXcfRna3y
         2gFumJYOzg3u59pNi7immqP3hRAf47PGzMJI4RQ9oMCAuE8Xg1ez9J9WxkkT+a3FCOZ7
         rZwB3RxAN0HrsPsaDTu/HWSSwjt0GOxBlvE3lxWXVTzQ5nJfM1QXyP0tmnHXLJ9Q5i7l
         6MwyA0aB4BTEneFtm8whnRRWFnJBt6iqFLbqVTrUXkWJFFbWUu5afoU3hxOvA0t0db4v
         NP9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hKVf91iH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm20-20020a05622a251400b0041965efdac4si12747040qtb.395.2023.12.05.09.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 09:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hKVf91iH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAZdJ-0003R0-Ny; Tue, 05 Dec 2023 12:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1rAZdH-0003Py-Vm
 for qemu-arm@nongnu.org; Tue, 05 Dec 2023 12:54:55 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1rAZdG-0003sm-FV
 for qemu-arm@nongnu.org; Tue, 05 Dec 2023 12:54:55 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-58d5979c676so3775730eaf.1
 for <qemu-arm@nongnu.org>; Tue, 05 Dec 2023 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701798891; x=1702403691; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ah8a11d2I6vEhBdY+zb9gYIMyM45JmQk4Nwqq58ChyI=;
 b=hKVf91iHt73TQtvlv76Z6B3vAZtSvO91NK85LJ67+HHXlrvuQP9SC11TVojhrIblxc
 wP5GPkILP9uoHERM9uE+9Jx1Lul5dUYe+MhOk/UZIOGA1Ms72ujGSdR/xBXwK+Te86cD
 bdMZ66jvsP6ui+XQNezKnt3iTU/4hxTP9XtejJwGBXMhsLgD+XMPneZvyZCvXG6ZrPuq
 qps5asRZF76BEYFiePblsRClbbWPaGyQ0IohixHYcd+kJ+ZVeKG8PGy5z37KxZHS3Q14
 6RIBdp1n+Tu8rfzWT4EMrx0vpum6CDnmJUwMX2ow3E6WfIazg727kzmeutwB/TH562H6
 Nlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701798891; x=1702403691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ah8a11d2I6vEhBdY+zb9gYIMyM45JmQk4Nwqq58ChyI=;
 b=SDlDL6ngKXmHLkOFbgZvcn62tE2Gm/rU+Qeh7sLHAFyZZ0Z7tnuS8GFEgdQ7BVRqd5
 t4mcc/Ntl9GBIpqh7px3yrwHN4U7XuZJHc9JvmnvSwpT4fZeZ6A+p00+Hmv9RVCcOh4K
 ZnOc+2H3DIX+vmvaLpaIkvsa6tEA3rT7XrGh/Ux8jWjnTI0eqGvUHzKVsZ9Sy1WU4JBK
 39ye6bIbIZe6X34BvkxKYm4t5iua8aPzsHoS5/BRJ2iuCQXQa/dloNrFSJDSl6R+OC3h
 sz87ed/8z0CmWyqvYXlI7/lghXMVJdHpPILjZsHaAfKR44ReqSjoOJRE/HD2TyqqgRAO
 dAaA==
X-Gm-Message-State: AOJu0YxBHi2sxPfWZZXlNn5HpGL1Ls4+cMBc1m4YFw/aWh3WDwAZC7nl
 spIjFfTGJAlxMc5ATmaEu9gSKKY4MInbqYs3bKRPYQ==
X-Received: by 2002:a05:6870:ed95:b0:1fb:75a:de75 with SMTP id
 fz21-20020a056870ed9500b001fb075ade75mr8710445oab.99.1701798891531; Tue, 05
 Dec 2023 09:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
In-Reply-To: <20231027175532.3601297-1-nabihestefan@google.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Tue, 5 Dec 2023 09:54:40 -0800
Message-ID: <CA+QoejW--t61WoJm8-gz2WV25owoKHg4dbOm2+_+Zrdu1DuFnA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Implementation of NPI Mailbox and GMAC
 Networking Module
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=nabihestefan@google.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Z0vxhgi+XBaK

Hello,

Since all patches for this change have been reviewed, is it possible
to apply it to the current branch so it can be fully upstreamed?

Thank you!
Nabih Estefan (he/him) |  Software Engineer |
nabihestefan@google.com |  857-308-9574

Nabih Estefan (he/him) |  Software Engineer |
nabihestefan@google.com |  857-308-9574



On Fri, Oct 27, 2023 at 10:55=E2=80=AFAM Nabih Estefan <nabihestefan@google=
.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> [Changes since v4]
> Added Signed-off-by tag and fixed patch 4 commit message as suggested by
> Peter Maydell (peter.maydell@linaro.org)
>
> [Changes since v3]
> Fixed comments from Hao Wu (wuhaotsh@google.com)
>
> [Changes since v2]
> Fixed bugs related to the RC functionality of the GMAC. Added and
> squashed patches related to that.
>
> [Changes since v1]
> Fixed some errors in formatting.
> Fixed a merge error that I didn't see in v1.
> Removed Nuvoton 8xx references since that is a separate patch set.
>
> [Original Cover]
> Creates NPI Mailbox Module with data verification for read and write (int=
ernal and external),
> wiring to the Nuvoton SoC, and QTests.
>
> Also creates the GMAC Networking Module. Implements read and write functi=
onalities with cooresponding descriptors
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
>   tests/qtest: Creating qtest for GMAC Module
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
>  hw/net/npcm_gmac.c                  | 942 ++++++++++++++++++++++++++++
>  hw/net/trace-events                 |  19 +
>  include/hw/arm/npcm7xx.h            |   4 +
>  include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
>  include/hw/net/npcm_gmac.h          | 340 ++++++++++
>  tests/qtest/meson.build             |   8 +-
>  tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
>  tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
>  14 files changed, 2351 insertions(+), 9 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_pci_mbox.c
>  create mode 100644 hw/net/npcm_gmac.c
>  create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
>  create mode 100644 include/hw/net/npcm_gmac.h
>  create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
>  create mode 100644 tests/qtest/npcm_gmac-test.c
>
> --
> 2.42.0.820.g83a721a137-goog
>
