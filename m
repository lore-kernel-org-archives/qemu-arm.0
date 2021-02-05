Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2215000lfo;
        Fri, 5 Feb 2021 09:46:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHXotZGiHSxUjqw+604MKLXmAQXTJavtlDYQbojx0FrkdyAkTGWxBHZnFa8v9RfnVGV5EO
X-Received: by 2002:a25:bf90:: with SMTP id l16mr8244594ybk.373.1612547173368;
        Fri, 05 Feb 2021 09:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547173; cv=none;
        d=google.com; s=arc-20160816;
        b=YC0QKUeAbfRdD7V+/P6y7UKx4hf0Z4kdlC/QVWHiIemf3ujbU4pK3YXqCRNcto0dML
         bO5d1h9a3slvJ/tRbc/l3Y4cgC5I8LO+DAvzw67DmDEXLrA3z8e1MFehqhGsbHSE8I/O
         Xv3Axz+oE2pR2EqFSHZJrgLp0CYOEQLROJRHPi2YYO6m3oQ/J2DUBCH2ju8/Z4arWZtQ
         WThmogy0N5hY1xeBwIssReYsnqSHBL6Wj/WyYXl/Y+s9Ctt2s/K4cGm9gDX7Z/ZsuPOt
         3aFCJSrubgV9iVFrqqbTUju187H5y2OsOzjPAa74JCQyLmMUIm+Ee0UTv9EVn6pMHdVL
         /4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=saCU3fNa93sGe02vfYgHjxSHpcdvDyRLS+pyj+1uZRs=;
        b=yXJfbWMlviAFkE3RH3Bhbv4qijC3mMUIvSWTtLX4yRyYiEyl2UspQBTdBQwi35HTJ3
         c0vojm76ho77sbstFBeVwVWtQ3dfKqpELF86qpTEW+DXjIzG6bLnMK6GepunxQM4WoRn
         MgcL99njnlIastaCbO08CKMA0SODCxTQ+v3Sh4if02uNb3Dv/xNZTmYk8ZFvW4tEnt7M
         m3qfouenfffq/yPcQA7LCtGM5tBpbfdB4XdhOqCB6eRKmHmeiFqFGQfFGbT1LJz1ChR2
         RtLY0RvQ6aTjexbmde2A/uAc6A149m9Qf+Lf8eRUkaRxqDS/zZZw1itSUYKd29Nv8U7I
         gbrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vqi0kulH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b64si8961290ybh.32.2021.02.05.09.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vqi0kulH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85BM-0000k6-Nb
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tt-000727-ED
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:01:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TQ-00047T-Un
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:01:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so8439263wrc.7
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=saCU3fNa93sGe02vfYgHjxSHpcdvDyRLS+pyj+1uZRs=;
 b=Vqi0kulHOqCCVtlemY34va18uaiYFHQQR5y+nmjaIJT5o7eW4bn/r7gMBzWWgofvYV
 hW1+i67RTEeQAqhivgNzte/6UqMhoJSh5MeEC1Ta0znzvTyNUSd8QGW8jP8DVjvaOVIu
 gTHKOPGZ5/vE1Ds2nYOR3ahc+1eSnLH1yKjuEOMSlVXKHgxQt9UFvtAn//8fVYSNEBlf
 b8/4nbRoR6EOJRmFDG5NW9cmoKtNDIq/S6GhfY9qzLaBroLdv3Juz9kNQYs8DLdpMs0R
 e5AZX0SUakA7IrRp/B4OYg6+XlA6SOTjoe3lQp7D5xuDed9pAf+8lDpl6DmTeVtTkYMJ
 GSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saCU3fNa93sGe02vfYgHjxSHpcdvDyRLS+pyj+1uZRs=;
 b=X27TluzZ0HzIqQkMEf6/5WCpuv1qgdbjIo0ujfNtCQJwZlm5KZ2UEZhac11A80AFcy
 2eXOzCMhTxcxcdj1RibLN1G3feoeOAVeWoBXCIkK6yP8o2OQJ2l/lWWt1IxACzlE04Xy
 KokhuVHbh5RQaegd+EQmPolDxncLGx6dihC/qmzz5L+9x30664GQbCiead89LQTJuYNS
 qf+05APhrQoXV/cgOB+LZums/oE3+SwN2OP8Q40hfKWHPdrOjFVy8Td6D6o0y3C9nLpz
 58/ltnEfbNyXPRmy2XqYa2h6yee3AE6PB/cb43IpeMH/uP94CBFsQLbX9JTy9TP/ByiW
 wQHQ==
X-Gm-Message-State: AOAM531AsCmbtBE7y+rjJKwvJfSjdjYiAu3xEIJM68+E8Ws74/lwhu3f
 I9rlluHggmQtXopsm/Ji70MmgnALtHC0gA==
X-Received: by 2002:adf:decf:: with SMTP id i15mr6010264wrn.405.1612544440245; 
 Fri, 05 Feb 2021 09:00:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/24] docs/system/arm/mps2.rst: Document the new mps3-an524
 board
Date: Fri,  5 Feb 2021 17:00:18 +0000
Message-Id: <20210205170019.25319-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQOjD5ry6moY

Add brief documentation of the new mps3-an524 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 8c5b5f1fe07..601ccea15cb 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,12 +1,15 @@
-Arm MPS2 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
-================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
+=========================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
-The Arm MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
-FPGA but is otherwise the same as the 2). Since the CPU itself
-and most of the devices are in the FPGA, the details of the board
-as seen by the guest depend significantly on the FPGA image.
+The Arm MPS2, MPS2+ and MPS3 dev boards are FPGA based (the 2+ has a
+bigger FPGA but is otherwise the same as the 2; the 3 has a bigger
+FPGA again, can handle 4GB of RAM and has a USB controller and QSPI flash).
+
+Since the CPU itself and most of the devices are in the FPGA, the
+details of the board as seen by the guest depend significantly on the
+FPGA image.
 
 QEMU models the following FPGA images:
 
@@ -22,12 +25,21 @@ QEMU models the following FPGA images:
   Cortex-M3 'DesignStart' as documented in Arm Application Note AN511
 ``mps2-an521``
   Dual Cortex-M33 as documented in Arm Application Note AN521
+``mps3-an524``
+  Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
 
 Differences between QEMU and real hardware:
 
 - AN385/AN386 remapping of low 16K of memory to either ZBT SSRAM1 or to
   block RAM is unimplemented (QEMU always maps this to ZBT SSRAM1, as
   if zbt_boot_ctrl is always zero)
+- AN524 remapping of low memory to either BRAM or to QSPI flash is
+  unimplemented (QEMU always maps this to BRAM, ignoring the
+  SCC CFG_REG0 memory-remap bit)
 - QEMU provides a LAN9118 ethernet rather than LAN9220; the only guest
   visible difference is that the LAN9118 doesn't support checksum
   offloading
+- QEMU does not model the QSPI flash in MPS3 boards as real QSPI
+  flash, but only as simple ROM, so attempting to rewrite the flash
+  from the guest will fail
+- QEMU does not model the USB controller in MPS3 boards
-- 
2.20.1

