Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3386282lfb;
        Mon, 23 Nov 2020 00:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaZiF6q513N0tM8ad6Xz8PJtbixe9GSD5oEebx0JlZtk31FAReImWoQNt+1b4FkmfY2cvJ
X-Received: by 2002:a25:748a:: with SMTP id p132mr35202046ybc.430.1606118535116;
        Mon, 23 Nov 2020 00:02:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118535; cv=none;
        d=google.com; s=arc-20160816;
        b=jxFEpdudEagYVNPy9xXzBytoecjTIz7KAhTvqeQ0b6vn4pcpd2Dqemrc3UJcOZQxIO
         nPRriF3LbnjVK6jIqE69jnBAKcKHYID8WnGB7D785QeeqJlcXpz405A1uPZHK2OnKKEF
         MH2HVdVUDcNlH7QrEodchuVU3IH/h417YR+ovIB1a91JvkXvWPO27taOVOhyMeBmiOCd
         3pMbOBiX8zf4zdFb7dE+CM2Li881QRI/hZkBLh1TUyQPgeiWl0aqYUokeyRHGZTez//q
         SXx9FdVucovzzVp0WjQDKqH/Szym5ijJ9G4Q/XvUh05D//GLI2jOnlGVfVKhc/wSpQRX
         24bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=w7XSyjLyze+TFCGqittgCZh2ZfWvdQj6jkxGLIkVWRg=;
        b=YvvbpUN+Xu8gmPwXribcomQV5UyrWZLtjmYgW1/brZNZ2JMiTh5F6eIG5O9LfuV2t6
         rQLAgzyu8XzhHuOkgrQ7vh4lLm5k/EwREgH4OYljh3clEH5QC1ai9dk0AxWcRX2GAt1P
         JZT9CmKy1XNPKa8AQ/7vm4dHJxngLPk3E9igU7EdXyhMt8bEN8kvgwb545iVvYx2NTn9
         IhIDIktM7xmj3aLZXgwouR/MN4SgIkEOOrAK7d5nQabGuo1m8jTQPkI++1wy0i0cOVuc
         NHRg5NtDgf6pSUewtsz7fJ2U950ALmN8fyfTR3cSneELjzlinPF/wk1cdqu5MxtLhPR+
         uxog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si9726392yba.97.2020.11.23.00.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:02:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6ne-0005F8-Fv
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6nS-0005Eq-5L; Mon, 23 Nov 2020 03:02:02 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54604
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6nP-0004PD-KG; Mon, 23 Nov 2020 03:02:01 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id E7D065FC79;
 Mon, 23 Nov 2020 09:01:50 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Mon, 23 Nov 2020 10:01:50 +0200
Message-ID: <3333301.iIbC2pHGDl@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTXvuCeN6puy

The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' =
into staging (2020-11-22 15:02:52 +0000)

follow.

Changes since version 2:
=2D Don't set HPFAR.NS in AT instruction in NS state.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (17):
      target/arm: remove redundant tests
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: declare new AA64PFR0 bit-fields
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: return the stage 2 index for stage 1
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: secure stage 2 translation regime
      target/arm: handle VMID change in secure state
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: add ARMv8.4-SEL2 extension
      target/arm: enable Secure EL2 in max CPU
      target/arm: refactor vae1_tlbmask()

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.c           |  10 +-
 target/arm/cpu.h           |  93 ++++++++--
 target/arm/cpu64.c         |   1 +
 target/arm/helper-a64.c    |   8 +-
 target/arm/helper.c        | 423 ++++++++++++++++++++++++++++++-----------=
=2D---
 target/arm/internals.h     |  56 +++++-
 target/arm/op_helper.c     |   4 +-
 target/arm/tlb_helper.c    |   3 +
 target/arm/translate-a64.c |   4 +
 target/arm/translate.c     |   6 +-
 target/arm/translate.h     |   1 +
 12 files changed, 431 insertions(+), 180 deletions(-)

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99



