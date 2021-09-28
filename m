Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5332916lfp;
        Tue, 28 Sep 2021 15:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0SAa0rbs1cjuOMewo8//cpeqdml8OvPHgySdeZAnDvq3HEIo31NJuRlP6e0Pgk6NnsP9
X-Received: by 2002:a67:c088:: with SMTP id x8mr8253498vsi.45.1632868846733;
        Tue, 28 Sep 2021 15:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632868846; cv=none;
        d=google.com; s=arc-20160816;
        b=Kz8s9dGoKGi/u27y0MlE/GjDaZ2LkgMtR6AE0ehCu2f1e4KZZHAXjWkybLVLiKCAan
         UmZY6lFzd1mEVPgFoqaPSX8c8OuZQ+k1O+1sdMa01BbRq34ctCMR/PMm6m2H+/nsCtp2
         BakvGeEz8P2uZqHbMHkJEuLcHne+zkQDkaS71X1kasIJcd2QIBm9wwaakwc5NSbnQV9E
         rJp6HSbe6ALv7WscyVUCZ/5jPIEbxUZ7Qyz/vtzUpnNETjAsmbWubSZCaAluFxte1Gaf
         I2ZWIXxLMXZd1xzS2HtTMo7DNaQLPMVpJtfPQYYe3HV3q0m1lDkJs1WpYz8xW5E2MpZS
         DMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:mime-version:message-id:date:dkim-signature;
        bh=USb2FvCy938gLTrHYcKZ/bU+Z5EfjY2OIMeKtLGHgQI=;
        b=op71ZgCSscQmBp9jhT2M/Pb6vVJ5TKuyX+fLcTRUrEPyPteseAT7F6Qu/Ekrzm6U6G
         oXD8wWLsN59MapKahVzZIiThDcKm077Fozsatdhr4WvNeBsqutugXlshMnBPrcIICds3
         mwSFv/7KzhmvVcW6hUre1KZNdJPp2/0Zzrh3Crs0l7Ld663e1cLxMwQMi+Ux44F5qs89
         8qCeVZWZvlnuQQAH8jSDXo1PsL0v6utXqcaUJGBVFwrKkvlmbP1+igFXBg884vJW5ZXl
         trZW0GhCLgkd9x+QPjrSuELGbifTpDnZ5kcHBjmcbxN0vId80WKQj7y0p9zGQkuhJXwg
         /ekQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ojAzy73n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si494789vsk.15.2021.09.28.15.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 15:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ojAzy73n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVLmI-0003Fq-2A
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 18:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33JlTYQYKCG8gVghfeTbbTYR.PbZdRZh-NeZabaTah.beT@flex--titusr.bounces.google.com>)
 id 1mVLm4-0003FJ-0a
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 18:40:32 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33JlTYQYKCG8gVghfeTbbTYR.PbZdRZh-NeZabaTah.beT@flex--titusr.bounces.google.com>)
 id 1mVLm2-00074o-CR
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 18:40:31 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so835950yba.11
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=USb2FvCy938gLTrHYcKZ/bU+Z5EfjY2OIMeKtLGHgQI=;
 b=ojAzy73ns44/sTzgZGUUVxRRkfSGrrMzXb6yCehSvEXGbOeMGfZnSHXRyFSWkI7IqN
 eQSAlDa+n4Ood9yZ2gxeGrWPC1/60Y0D7YbhJmdMV5xrXco7b6ty+UwLbjv9usPl+rmZ
 FDfidJEF8lYOjFoi9Uf1oTlHvi/mtLUxLrSAXmQkfyoaXo/1yblVKXU7hNGGFYFY64t/
 YRnBq8SalEla7pOFxJMBcozE+z3JqRu/pjcudhvub8m5EnFWhsNpJ87444NFc25mhsq7
 z2wytHGjKhoTcAOt9fVpMc/RuVWMHqMltNL09/qD3lZ62y1OMvWd6AD7pgqFfLLeAfIP
 Ax4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=USb2FvCy938gLTrHYcKZ/bU+Z5EfjY2OIMeKtLGHgQI=;
 b=u//DSwx8YwcTjMOBRAegPGtsohwIAC/jirOnTx1Ckzv0hiJT51AsfO0UK5VZOP6YaN
 +2cfS0iFRJlu3JW1tUQkVmmZJD0Pb/S+QFrIEP6JpwvXfz//NH0dbwuhcbZex++8CNic
 To3ZSnnvzm9Mhp5Np5Jqnxd5jgV7LmrRfkDH/fNDxYAg8Tyc6QMqh95V6CqEaM4GutEh
 FuJlWto3AjeTHEP/lR5KQC3uN3wUrcVOjowEjZTEC9sKtluvW61JXCubqRW+RWM/b4eX
 jo6YC2bHu4ww3wsLSZglmZ74cE0+DPIPu3CxUl1nGso+y6HrU4AcWgqw/1JveAFyxejV
 WljQ==
X-Gm-Message-State: AOAM533O8AUp1cscmo/X8r5UG00Ivl6vHudMNBXgPg7dr9XxlWvtdSC0
 XfPq0N7WZcT5LX8zRCBdZFzgC/mr4G8=
X-Received: from localhost ([2620:15c:2c5:13:bb4a:748d:1e5f:4de8])
 (user=titusr job=sendgmr) by 2002:a25:8b8b:: with SMTP id
 j11mr10076305ybl.160.1632868828567; 
 Tue, 28 Sep 2021 15:40:28 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:39:41 -0700
Message-Id: <20210928223942.244860-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [RFC 0/1] hw/ipmi: add an aspeed IPMI iBT device model
From: Titus Rwantare <titusr@google.com>
To: clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 andrew@aj.id.au, wuhaotsh@google.com, minyard@acm.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=33JlTYQYKCG8gVghfeTbbTYR.PbZdRZh-NeZabaTah.beT@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V2gcOoV9Kvul

This patch follows the Handing IPMI for emulating BMC patch set by Hao Wu.
Building on top of the work in [PATCH] hw/misc: Add an iBT device model pos=
ted
by C=C3=A9dric Le Goater, this iBT model works as a backend to ipmi-host-ex=
tern.

Needed to run:
- [PATCH 4/8] hw/ipmi: Refactor IPMI interface, Hao Wu
- [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c, Hao Wu
- [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass, Hao Wu
- [PATCH 7/8] hw/ipmi: Add an IPMI external host device, Hao Wu

Host commandline
    -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconnect=3D=
10 \
    -device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
    -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC commandline
    -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,=
wait=3Doff \
    -device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/i=
bt"

Currently, IRQs are not functional, but it is able to connect.
The following printout is from the host:

[    6.869742] ipmi_si IPI0001:00: IPMI message handler: Found new BMC (man=
_id:
 0x002b79, prod_id: 0x0000, dev_id: 0x00)
[   12.393281] ipmi_si IPI0001:00: IPMI bt interface initialized

This patch is an RFC because of the missing IRQs and the need for other pat=
ches
to get merged.

Thank you all.

Titus Rwantare (1):
  hw/ipmi: add an aspeed ipmi iBT device model

 hw/ipmi/ipmi_extern.h        |   1 +
 include/hw/arm/aspeed_soc.h  |   2 +
 include/hw/ipmi/aspeed_ibt.h |  77 +++++++++
 hw/arm/aspeed_ast2600.c      |  12 ++
 hw/arm/aspeed_soc.c          |  12 ++
 hw/ipmi/aspeed_ibt.c         | 311 +++++++++++++++++++++++++++++++++++
 hw/ipmi/meson.build          |   1 +
 hw/ipmi/trace-events         |   7 +
 8 files changed, 423 insertions(+)
 create mode 100644 include/hw/ipmi/aspeed_ibt.h
 create mode 100644 hw/ipmi/aspeed_ibt.c

--=20
2.33.0.800.g4c38ced690-goog

