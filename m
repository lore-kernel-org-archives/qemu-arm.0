Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3442485lfq;
        Tue, 12 Jan 2021 02:59:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpK0u2a5Oikgqhxyb2fUmGcBAJU2aaq/I9IyvoZaZWTBfpDarstWJBB/63BNrPq9RR06KR
X-Received: by 2002:a25:4984:: with SMTP id w126mr5754122yba.391.1610449174260;
        Tue, 12 Jan 2021 02:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449174; cv=none;
        d=google.com; s=arc-20160816;
        b=c8N/UridvFr7i9wX2ABfVR4zR8OvM5NScYQa4E1nRthCJcDhfHY7ZRbNempeopPx6j
         mrGvuPtpxKUNgvr9OXywbYQt6cpAEHtZEznmxGSWMRygeHucrEYUaTgRpl2oizoc+IeL
         DBJ8yHuaBB5lVfu950go8hEeuYqCf/EwylTKLyuE5qG4kBu1IFELeGI6COh8nWmv8zhS
         yztK15oALon4+n32wxE+dcNPx56F/I+roMD0wtZ6qHqdauLxfj4GnoHz+9v416DeA3Bd
         fUjsBqldKWEpfN+X7xe0c69zIYbmD3AQjjdgpk/+f4uoeGALNCr+9zKFwlO1BNWFYTRm
         U5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=zkc4XNbldW1V4hQhEHaIixPTKgkRx6JJPmYSoF2Y7u8=;
        b=YN8V6y9BniFrJnwALMhPVFQZ82NUaPPn4weEIRB5yP+JuPJj2XksXfvw8ZQqyZi9/4
         5uGCTOsP5M5ECgtb9lH8TxJHYVJaJ06yEcFPnTkmqapqokDhW4E2gp+4ghDTNLf1ffDA
         puK0qP49DjQNfeN8+x57nPFrBIgLcHYkBU7mIwlg0wi/ZRwsqp9Ql3ADo16KOmayzZjn
         XXCPnI7uc4RN1BgfZbTUWBFpppsRvgpGjp5zy6TjjLfO712m4kvQmYe9XULUBXd5QmwU
         iyMINBD+MkeveOr7dEoweyZKxLpaTMxa/AJdkm7jMjotD4vWf1BkTPzf1mGvfemAG8g3
         KEgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h131si2323283ybh.239.2021.01.12.02.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 02:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHOf-0002us-Ku
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 05:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHAN-0002tO-73; Tue, 12 Jan 2021 05:44:47 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56696
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHAL-0003Az-1Q; Tue, 12 Jan 2021 05:44:46 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id C06225FCEF;
 Tue, 12 Jan 2021 11:44:41 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv5 00/19] ARMv8.4-A Secure EL2
Date: Tue, 12 Jan 2021 12:44:39 +0200
Message-ID: <12681824.uLZWGnKmhe@basile.remlab.net>
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
X-TUID: pNL0paqejE6I

	Hi,

This adds Secure  EL2.

Changes since version 4:
=2D Fix NS unitialised in secure state stage 2 translation.
=2D Remove EEL2 translation block flag in 32-bit mode.
=2D Clarify comments on arm_is_el2_enabled().

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (19):
      target/arm: remove redundant tests
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: declare new AA64PFR0 bit-fields
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: handle VMID change in secure state
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: translate NS bit in page-walks
      target/arm: generalize 2-stage page-walk condition
      target/arm: secure stage 2 translation regime
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: revector to run-time pick target EL
      target/arm: add ARMv8.4-SEL2 extension
      target/arm: enable Secure EL2 in max CPU
      target/arm: refactor vae1_tlbmask()

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.c           |  10 +-
 target/arm/cpu.h           |  90 ++++++++--
 target/arm/cpu64.c         |   1 +
 target/arm/helper-a64.c    |   8 +-
 target/arm/helper.c        | 414 ++++++++++++++++++++++++++++++-----------=
=2D---
 target/arm/internals.h     |  36 ++++
 target/arm/op_helper.c     |   4 +-
 target/arm/tlb_helper.c    |   3 +
 target/arm/translate-a64.c |   4 +
 target/arm/translate.c     |  35 +++-
 11 files changed, 430 insertions(+), 177 deletions(-)

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99
http://www.remlab.net/



