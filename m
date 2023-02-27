Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5052571ejc;
        Mon, 27 Feb 2023 13:33:53 -0800 (PST)
X-Google-Smtp-Source: AK7set82ia7H/A3Gw0NXrwTgt6qC17r8JY0F0QA/TZJN3PyCFgcDCiURK8A3ICX+0CRJRjI6jD68
X-Received: by 2002:a05:622a:180a:b0:3b8:67af:cfdd with SMTP id t10-20020a05622a180a00b003b867afcfddmr1400432qtc.36.1677533632930;
        Mon, 27 Feb 2023 13:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533632; cv=none;
        d=google.com; s=arc-20160816;
        b=cA6fwiBNeD4FeIjHevv6cIQEorYu+yLTRqS18V7A2H5nRd4R8tKc7RQM6CHXTRwDCY
         xs8DtgpLnNeiOjF+46GzA3GKsCJgFJMGhzyH2kIVLkW94Na1SBgNWPHar918d4f2b+zR
         7NP2b+Kn8PJBWaUzF/jPI3OgRh9BnF+6W3kSSyquL3BZIyeDyNITlBBUstfvrmiustGK
         xSNjMwdLegSAsjy/5d6V0okhRzjMFs6jCakb/UmqVRV/hm0u0q5W41W8TNHxMRMRLV8+
         /+CPIZafq4/ibSlno6u35+gSPJ2elrpZgfg4wNOxthI/RUTTPYOVRD8m/SuJ0EQd6dm1
         F2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VXRCA+PjO/uaA5aTfL5Vr2LtBhamB7EK3d38CQkfsHk=;
        b=GyqeyAMR3dNEjUdg6M53TL8Zv74kMASVWlsYilNNTIUiHiY6mQ389H5MJlZ6YZokm3
         U25baPN+0otLzJjAjqm09ocUtJcyaTWa2UtF2DYsNY3An4CwMRfc+WcufP+Y6PBjK/qp
         lJXYfZW45doWzyJws3nrUplArbdZG9rG3XcDUgIzMTUmZo9Tvqz5qUnW0U7+g9jc7hwt
         dGqF8Q/AjiSLOT11/VWPozB0H7rVn+o/Ek59rOhGOSvVxRG9p+qJcpl5md9IuUTGX5Wq
         Eh941BZTQqJK7zetWJh3+++smZqNzvATj51N5MNRaG7/msW6pUyDL9jmYYqFeItyQBMV
         iBkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IofhOBPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05620a255100b0071ab9598fd0si8441091qko.330.2023.02.27.13.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IofhOBPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7o-00075b-7y; Mon, 27 Feb 2023 16:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7n-00075S-K7
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:35 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7l-0004Fz-U3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:35 -0500
Received: by mail-pl1-x632.google.com with SMTP id u5so4860185plq.7
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VXRCA+PjO/uaA5aTfL5Vr2LtBhamB7EK3d38CQkfsHk=;
 b=IofhOBPzhm6Sx8AaXG4YhqNORPHhhH605zM0YqAMm6C9OpsHiyyPp+xCQSI+xnWsUh
 +BdOrQECodHLWeoKFbxuKMAFhUeT+6H6lt/6OEV2nqTc4s/flInJLiepjwigoNfZeYKj
 r8LMeEDyhAFHyVmgQ/1Ge43q/2COZFiWV6YfzmPxFy977qAj242L+/lX4wL0suKGKQ9J
 g7tL+7hKC8eJnZJ6P4qPM5mc7HvAmjCgMqfOEvsggDZXHXjOo7FKhFQVJXg9ai3If+8K
 fJEsLVepKt+ZsdSBhJfnHo1kaEKjLwkdmebQYgh/KF5KIf2EtTrvR5sQuzEXgcKddBN1
 9WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXRCA+PjO/uaA5aTfL5Vr2LtBhamB7EK3d38CQkfsHk=;
 b=dwdY4gANGVpPoqJ4c0dJ9C+zN4AeC96yn2AXvMle/m8lYP2rJL+FcvZU4QcuROXea4
 dfoUGMKsK0VjIA2aYktN3XjFq+LDWhTfXfXAF9vSwUtYPkAPb/p+1l03BMv541E1PfB0
 Q1mqhotk/xPaF53QJtsBCt/jyomAS/P840OiJhb2vANohRPDoPv9e7tDKuvzOcZF6lHZ
 CvlZpswsRMMCaI8nGrF+xzzMm31WO7SM69yZ1s9dnJnJmAzstjzivG2k278/Af82P3s7
 Mv/HNT4hCrO9cg/EaL3nIre6jxGGYqmOA2isL2U3GCFfHrtM4J7SZ19EbjkeUN9vzJGX
 2ekQ==
X-Gm-Message-State: AO0yUKVJ7FoSCOG8fhHOfdthkyMkrJThDxrOBfxH5U9vN3AC5Fcc5Ffz
 /bTw71aD0tYi8UyMdk4YD5/QxXpOE/EBW7ssgTE=
X-Received: by 2002:a05:6a20:6986:b0:cc:cb28:382f with SMTP id
 t6-20020a056a20698600b000cccb28382fmr1046919pzk.26.1677533612037; 
 Mon, 27 Feb 2023 13:33:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/14] target/arm: gdbstub cleanups and additions
Date: Mon, 27 Feb 2023 11:33:15 -1000
Message-Id: <20230227213329.793795-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: n4KKOQFFShKM

This is my pauth enhancements from last year, the corresponding gdb
patches for which are nearing merge.  If lore and patchew are to be
believed, I never posted this to the list, only pushed a branch so
that issue #1105 could see it.

Since the cleanups there conflict with the recent m-profile gdbstub
patch set, I set about to resolve those.  In the process, I merged
the secure extension code with the sysregs, since they're simply
presenting different views of the same registers.

Changes for v3:
  * Drop write paths; there's quite a lot to reorg in v7m_msr, and
    it's not clear what should even happen on the exception paths.

Changes for v2:
  * Incorporate feedback for pauth.
  * Rewrite m-profile systemreg and secext xml.
    - Since these are Known to gdb, do not merge the two xml.
    - Upstream gdb only knows about {M,P}SP, but David's extension
      to include the other registers makes sense and Luis confirms
      that it's ok to have extra registers in the two features.
    - Continue to share code between the two xml, but separate
      out the mapping from gdbstub regno to internal enumeration.

r~

David Reiss (2):
  target/arm: Export arm_v7m_mrs_control
  target/arm: Export arm_v7m_get_sp_ptr

Richard Henderson (12):
  target/arm: Normalize aarch64 gdbstub get/set function names
  target/arm: Unexport arm_gen_dynamic_sysreg_xml
  target/arm: Move arm_gen_dynamic_svereg_xml to gdbstub64.c
  target/arm: Split out output_vector_union_type
  target/arm: Simplify register counting in arm_gen_dynamic_svereg_xml
  target/arm: Hoist pred_width in arm_gen_dynamic_svereg_xml
  target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
  target/arm: Add name argument to output_vector_union_type
  target/arm: Simplify iteration over bit widths
  target/arm: Create pauth_ptr_mask
  target/arm: Implement gdbstub pauth extension
  target/arm: Implement gdbstub m-profile systemreg and secext

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   9 +-
 target/arm/internals.h                    |  34 ++-
 target/arm/gdbstub.c                      | 278 +++++++++++++---------
 target/arm/gdbstub64.c                    | 175 +++++++++++++-
 target/arm/tcg/m_helper.c                 |  90 ++++---
 target/arm/tcg/pauth_helper.c             |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 458 insertions(+), 175 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1

