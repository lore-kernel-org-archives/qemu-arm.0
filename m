Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3196674lfp;
        Tue, 21 Sep 2021 09:29:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaHZOjH6+FdFVUDJKKYkmmtMopid63zAgpXl0ptwVgn9e5Mb2YQ7nCNTdDbtp+UVYm9Enf
X-Received: by 2002:ac8:5c96:: with SMTP id r22mr28991561qta.267.1632241779434;
        Tue, 21 Sep 2021 09:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632241779; cv=none;
        d=google.com; s=arc-20160816;
        b=fqTRqVNTK/j4ZUKjSMRr76tx9IrrdAvnad3O3op5KuBw8mqLhYhmNve5Whg7IO1vzL
         vHcIKqpRxbIl1tReWqDLBO8/h303vV/nVV5G+F7ujSEWT2TrZxjzjLBzv1N20ZPvcQuF
         deJ5yrSXKamSdB8wG2lKg4o0mHyPCFcxH/acTgZjmzt9f9EYK1VWUg7CvlQBeN4FOubP
         VCCuqAr40Eir2yapGpBVdWNRwW5B5h3i6gp/X0wVgPFDL141ALCP1axYy55UNOgu/SDB
         kSckNoo4jqvdjHXw5VqX2jjk/IT066yivAQ28ZzUdQelv14nN7Au6nxpyE6LyM9fdBNO
         ygUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=anYZWD/qRzaU2uLmQ5ODwyA34rNw2sBFKIUWhqd0x0U=;
        b=hIqBOPyuMiabtFeeo0cogrTN1rIRA0t3m+sto+8hVJ4GqD7cFOeQnD+G3KbZzhC2a1
         IXe8B6APUcUwGIAGaveA+hw5mRD2X5X7nd1QGi/kGKV3d59Z7pXlZk/QzfdmuDkFCq4U
         WNv9/tk0ruv7J9raN4TlCcRd2iNuqiimhu12ibM8C9oXxjpiNcjVTay4I8vU+IAbCKXv
         nkfCFVvLBVSj5KGU2ysdIrsNzHG9VMqMZRGtbEHZuTeLN8l1iq+3RBdgjYykF1OlbNDY
         Y5qhkRyC3wMKxusx1J2nGkyCvZUNxCq0kHNasBYdncv2e+l1UbBBTvUm0+ejxpQzUxfp
         L0kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FaH8az2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si405179qtr.186.2021.09.21.09.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 09:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FaH8az2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSieI-0008MQ-S8
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 12:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidn-0008LU-He
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 12:29:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidl-000299-Ki
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 12:29:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id w17so32881684wrv.10
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anYZWD/qRzaU2uLmQ5ODwyA34rNw2sBFKIUWhqd0x0U=;
 b=FaH8az2mhPt1B/EKyriHYV5Ofilnjv7m6lzgcM1GSEsz8SW0Dby9lOGEfdRmABxp3O
 Fz4hbot72bWQX0zSLmsFSt83vjd1Qb3//N4MSTOPUYxjijT2mhB2Oc/4gI2QxjejHVMd
 2hdc9SFqfCJlRec2XY2jBEpfJuW4bTWCk+zXYMzCAjcspEsdKAQOn4RVv16s+e+NkDjZ
 piFfu6ckCIacx6lunYy8pre9UmO4plvXfPq5E9XXOJ5sgt3G7aj2RZnUqULR9Acwhjje
 BlUB0SR2mheCT6um1cx5SC9KMcr86/YYKlzCUHgqVPlJAhnhea2pPgFlH8QOkYGhtVmg
 DsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anYZWD/qRzaU2uLmQ5ODwyA34rNw2sBFKIUWhqd0x0U=;
 b=k3Yvz94Hg4vcYMhXEih0Ydzmoy3uc4+kWchkNGhmL4UhPW7MPs+bWdR7wqkUD2kaj7
 diMifjxekOnmtbwgW4xFjHKtxxhXKjVg5ZFhk/woAp+sN7bX903gh3fd5dBuJqg5QzSd
 BPoI95D8L0tOjrB5TC6CluiVOqtw6w26h8OjgQB/SvKHAUpgASeBiRL7gq8NFzTLJUPn
 pc72YXNdgSJpb6gTbInCyA7dzaOCOaXDVWoxmY9N92bJNe7BtjkE6S25seW5DOCDxdOA
 f9KOobmCfP23aAiIGM9/iFaOxccCNEIYLP0d79MZuV8ZIbMPfxZ4yn6BpW1iC84cJqNX
 7d+Q==
X-Gm-Message-State: AOAM532IHTfurhbRPt2Fl90uHW0b70K5DDa1PK0iGfAPSQQO7lesJ/xF
 C9G7mkmKNpHcuS97p2dc7xYFWnQk25iFOg==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr5698503wmj.121.1632241743626; 
 Tue, 21 Sep 2021 09:29:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Support MVE in gdbstub
Date: Tue, 21 Sep 2021 17:28:56 +0100
Message-Id: <20210921162901.17508-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovd5tyrWhpep

This patchset's aim is to report MVE to gdb via the gdbstub.
That is done by the final patch, which is an RFC because the
gdb patches to support it are not yet upstream and so the XML
format isn't final. (Sending the XML works fine with a GDB
without the MVE support; you just don't get the auto-generated
pseudo-registers that display the Q-regs, so all you see is the
S and D reg versions of the data.)

Patches 1 through 4 are cleanup of the arm gdbstub related code of
various kinds; this part of the series should be OK to go into QEMU
as soon as it's reviewed.

Luis: you'll find that with this entire patchset a GDB built with
your patches doesn't crash, because in patch 4 I stopped QEMU
reporting FPSID and FPEXC in the org.gnu.gdb.arm.vfp XML feature.

thanks
-- PMM

Peter Maydell (5):
  configs: Don't include 32-bit-only GDB XML in aarch64 linux configs
  target/arm: Fix coding style issues in gdbstub code in helper.c
  target/arm: Move gdbstub related code out of helper.c
  target/arm: Don't put FPEXC and FPSID in org.gnu.gdb.arm.vfp XML
  [RFC] target/arm: Advertise MVE to gdb when present

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 configs/targets/arm-linux-user.mak        |   2 +-
 configs/targets/arm-softmmu.mak           |   2 +-
 configs/targets/armeb-linux-user.mak      |   2 +-
 target/arm/internals.h                    |   7 +
 target/arm/gdbstub.c                      | 179 +++++++++++++++
 target/arm/gdbstub64.c                    | 140 ++++++++++++
 target/arm/helper.c                       | 262 ----------------------
 gdb-xml/arm-m-profile-mve.xml             |  19 ++
 gdb-xml/arm-neon.xml                      |   2 -
 gdb-xml/arm-vfp-sysregs.xml               |  17 ++
 gdb-xml/arm-vfp.xml                       |   2 -
 gdb-xml/arm-vfp3.xml                      |   2 -
 15 files changed, 368 insertions(+), 274 deletions(-)
 create mode 100644 gdb-xml/arm-m-profile-mve.xml
 create mode 100644 gdb-xml/arm-vfp-sysregs.xml

-- 
2.20.1

