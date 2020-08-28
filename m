Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1688447lfc;
        Fri, 28 Aug 2020 11:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6vSQml5CusIzFFRs1NI/Ho0w9IafVn3FG/Hv5VrC/AFvHQQESj7cKrACDbq5y2N9Ilr2r
X-Received: by 2002:a5b:78e:: with SMTP id b14mr4484517ybq.408.1598639669398;
        Fri, 28 Aug 2020 11:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639669; cv=none;
        d=google.com; s=arc-20160816;
        b=kUPGJvPf9qceZCHxxkc20bhn8ABJwNrn/pRY1hJ4Dt5E2pEqe5WnhahlyirCcOMUol
         DfigDDhYwW4jRZYXl7LykaRmKjjNVisACd5U5SZ9w1Al6KJ4/3x/VU9lss/tJsc2mUeh
         xfqIBGJsQD5IrA0eAMTtUbbPz/CjQ9WethbGph/XHlH23Ugeo6O0puUm5j+MFQ+jjSoN
         Qbuf2J7LCIW/eiYoEzyfTFx3qtsrWxPFXXC1n2rLj22nWcC/IOYXA9j6Fy9kyzQ++mi5
         nRQyesB6SmDOU/gGtmBWYoLhxvMEVyctMsRPHuL1H5ealaROxzq6OqH5+t/LzCLbCV/Y
         nbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=SMP+9dLyuBXrBOEKbSUabOjTS+nr6/zOWHkUllhu5EI=;
        b=r5fK7iP/ydDgNlPQ1LIIIv7IlCh+iKuujWJCWevuEKK5mtF8kz28yCQpXZCZn0Z2RO
         EgZ0Ej68iKLbEVA0TeYc6FhUBr+wquuzKs7hXTEaeo30lW6K/1IzZM3O/VdYi6H1f5aj
         KzGC8HruuEPeXUk5DdYWY0Ga+tA0ULycmigCZ7K6UXh/4O+uu2MP0GqL1fV7WMTkKVcN
         +PihG80LdUP76nX3vZLSUVQUp6bjBHOdB78OH07zZXOw5vNrjoZTFS6wPD5JYisluRDb
         70uVtI9FszA3OoDTA7DXD+HhsA8RL5PuhAayz/+sB6qGPUegFmxvcfYR8DQw5FbHSkvJ
         NaVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wOmQagTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si57368ybt.290.2020.08.28.11.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wOmQagTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjCm-0002AY-D8
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCT-00028k-6g
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCI-0005vB-PO
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id o21so126376wmc.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMP+9dLyuBXrBOEKbSUabOjTS+nr6/zOWHkUllhu5EI=;
 b=wOmQagTQ8vEBu159VY7CYec/TjDmr9eEi1eo1g1WHgmaHzxCBspPm3CR52awlZQ1Fg
 s/vSBtyKf9FTv/GTmhfM9EoDrFdl8uQ01U+DbepxPm7KOlOyuXKADtbtXrS848VgfC6c
 XmdRiNpjvJ8sVE2TJqJvq+k/sN9xpG1q8cGTQIurKuB6FFmsBMHRDfY1sMBOJ1NeqCqc
 VDj/4wVkIKN1BuAblmDg6jDNKzA97bRCMI5Pocef0wENQcwD2JfWtucgrdOK56h8yNTW
 92L/3dpn/mh9f8kRLZGIKSccct4geh5IV5h8QkmqZzrx+50eAaNrjTw8eOC9hHVLbaiY
 2M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMP+9dLyuBXrBOEKbSUabOjTS+nr6/zOWHkUllhu5EI=;
 b=UvW53S3YWh2r0TmtsOJdtXbwG/tZQk57AJgorbDByDLoF+0hWKEt0BYt5mCGjCJvWG
 8HTglPk6O16ZrupH6asHg/LtY5GG+k7i/r/UmfgAbIr9LM/kWHCvmMjRVcss/Fio3bwB
 Sz9PDZdNRINJG6RnsffzbGAkeSW/mHBbSWVaCyUKuWj4YLemw5O+2/ptjAVc2Z5hoSRT
 1Db/VZkpG/t2QCFMFfDdx+zEpXAz+1q45PTd7lS4q5gzK92dZcFvVy4n1ubdMbe2ZBsT
 bBUZIVPUoIO1Gr6E5QSqB6ofrXqlpTtHVYrkk4jNuS1mCJs2dp3ZbxNTXug2V4KekTH6
 QbtQ==
X-Gm-Message-State: AOAM533Lf4uibK7SxcoWix6zk2ruXmEyorQpxTocMTLsH4Mncn6N/2A6
 ZiIhDpnOmlfmDGqgGTM/xoc0O8okZi0LBgk5
X-Received: by 2002:a1c:f207:: with SMTP id s7mr52743wmc.22.1598639636503;
 Fri, 28 Aug 2020 11:33:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:33:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/45] target/arm: Implement fp16 for AArch32 VFP and Neon
Date: Fri, 28 Aug 2020 19:33:09 +0100
Message-Id: <20200828183354.27913-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: C8D0ia/wmz5v

This patchset implements fp16 support for AArch32, both VFP and Neon.

Patches 1-21 and 45 are the same as from the v1 vfp-only series,
and have all been reviewed. (I've included the minor fixups to
use 'f16' and the 'dh_ctype_f16' type.) Patches 22-44 are new and
cover Neon.

thanks
-- PMM

Peter Maydell (45):
  target/arm: Remove local definitions of float constants
  target/arm: Use correct ID register check for aa32_fp16_arith
  target/arm: Implement VFP fp16 for VFP_BINOP operations
  target/arm: Implement VFP fp16 VMLA, VMLS, VNMLS, VNMLA, VNMUL
  target/arm: Macroify trans functions for VFMA, VFMS, VFNMA, VFNMS
  target/arm: Implement VFP fp16 for fused-multiply-add
  target/arm: Macroify uses of do_vfp_2op_sp() and do_vfp_2op_dp()
  target/arm: Implement VFP fp16 for VABS, VNEG, VSQRT
  target/arm: Implement VFP fp16 for VMOV immediate
  target/arm: Implement VFP fp16 VCMP
  target/arm: Implement VFP fp16 VLDR and VSTR
  target/arm: Implement VFP fp16 VCVT between float and integer
  target/arm: Make VFP_CONV_FIX macros take separate float type and
    float size
  target/arm: Use macros instead of open-coding fp16 conversion helpers
  target/arm: Implement VFP fp16 VCVT between float and fixed-point
  target/arm: Implement VFP vp16 VCVT-with-specified-rounding-mode
  target/arm: Implement VFP fp16 VSEL
  target/arm: Implement VFP fp16 VRINT*
  target/arm: Implement new VFP fp16 insn VINS
  target/arm: Implement new VFP fp16 insn VMOVX
  target/arm: Implement VFP fp16 VMOV between gp and halfprec registers
  fpu: Add float16 comparison functions
  target/arm: Implement FP16 for Neon VADD, VSUB, VABD, VMUL
  target/arm: Implement fp16 for Neon VRECPE, VRSQRTE using gvec
  target/arm: Implement fp16 for Neon VABS, VNEG of floats
  target/arm: Implement fp16 for VCEQ, VCGE, VCGT comparisons
  target/arm: Implement fp16 for VACGE, VACGT
  target/arm: Implement fp16 for Neon VMAX, VMIN
  target/arm: Implement fp16 for Neon VMAXNM, VMINNM
  target/arm: Implement fp16 for Neon VMLA, VMLS operations
  target/arm: Implement fp16 for Neon VFMA, VMFS
  target/arm: Implement fp16 for Neon fp compare-vs-0
  target/arm: Implement fp16 for Neon VRECPS
  target/arm: Implement fp16 for Neon VRSQRTS
  target/arm: Implement fp16 for Neon pairwise fp ops
  target/arm: Implement fp16 for Neon float-integer VCVT
  target/arm: Convert Neon VCVT fixed-point to gvec
  target/arm: Implement fp16 for Neon VCVT fixed-point
  target/arm: Implement fp16 for Neon VCVT with rounding modes
  target/arm: Implement fp16 for Neon VRINT-with-specified-rounding-mode
  target/arm: Implement fp16 for Neon VRINTX
  target/arm/vec_helper: Handle oprsz less than 16 bytes in indexed
    operations
  target/arm/vec_helper: Add gvec fp indexed multiply-and-add operations
  target/arm: Implement fp16 for Neon VMUL, VMLA, VMLS
  target/arm: Enable FP16 in '-cpu max'

 include/fpu/softfloat.h         |  41 ++
 target/arm/cpu.h                |   7 +-
 target/arm/helper.h             | 133 +++++-
 target/arm/neon-dp.decode       |   8 +-
 target/arm/vfp-uncond.decode    |  27 +-
 target/arm/vfp.decode           |  34 +-
 target/arm/cpu.c                |   3 +-
 target/arm/cpu64.c              |  10 +-
 target/arm/helper-a64.c         |  11 -
 target/arm/translate-sve.c      |   4 -
 target/arm/vec_helper.c         | 431 ++++++++++++++++-
 target/arm/vfp_helper.c         | 244 ++++------
 target/arm/translate-neon.c.inc | 751 ++++++++++-------------------
 target/arm/translate-vfp.c.inc  | 810 ++++++++++++++++++++++++++++----
 14 files changed, 1719 insertions(+), 795 deletions(-)

-- 
2.20.1

