Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp749577lfb;
        Thu, 19 Nov 2020 13:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqkOX1dscc4PFCfEDLbYD4Ow/wR6YrQYvVDwEfU1Zg3J9KUAzdhXiJR8qqMZfT87XtnBE2
X-Received: by 2002:a25:d997:: with SMTP id q145mr13900584ybg.212.1605823019567;
        Thu, 19 Nov 2020 13:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823019; cv=none;
        d=google.com; s=arc-20160816;
        b=t0nqi5aaWTxJdJV4f9mIu9MgIl7iyhleEyKPRwSW7P4FU20AkD/R8fGWGNpSIyS4J0
         btxzolQRFEXBxzqRO5QAG8BMhr/e8YmjQxt8I/kphyrGL/+91UOoJVLkKuJVSZoKxhBl
         x0JVTaMCjrNPATag5KP9RSdqlHi/jFLSeKLVBaERqCJQziUJ2Oxc01zrqau32msG3uCj
         as3CWtdRIN/9LziguBCMQ/nJi1lPziqK5rRfuMjUfJ6qqe7Cl03eLS0WyvuZg2yqC/yY
         VmZAV1LjGeeDNDXVMTn8bYdAzyOiclH6vPbUDxt5lVAtbNGQ0IqEM6lDWCsSG8gfo4Sa
         LTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LBhEbdcT9XdisK3oGvthruPvAcNSwBdiCnqPKfoNIlQ=;
        b=oAsksVAwyhtjOaoDaEmk8dK42WyvR2AvpHwR2yL07YO1RbbuO2TEjNLXCi/MkWnaoP
         TFhoijS4MTfwYn1OEV0PMBGrYkKx/f93wsgQ0/4J6a02e1vHePe1qIPQWA0+L5NcnTBM
         ZJw7MHbduqoWk7Z+oYwIaUzYJQfJ8FCOs2AB+vBzQNz6fmQMq5PqJv3siAWKwVDrsl6i
         wQtekRpMwXNI9jviJMwyIk36H0XYvrgwj7oebAhy9uXqHp6Ax9va9wRwjzYE23CShiDN
         dSo5eQX0i9GbW5zET4wkg7x1UGS+O+rC7bKjeS06Xf/k8dkBNyMBNvBfwnmSlpZ0zWKX
         yK3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7CLgwrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si1040184ybi.81.2020.11.19.13.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 13:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y7CLgwrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfrvG-0000XC-Oy
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 16:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruh-0000Wo-UN
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:24 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrug-00046P-15
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id p1so7953872wrf.12
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBhEbdcT9XdisK3oGvthruPvAcNSwBdiCnqPKfoNIlQ=;
 b=Y7CLgwrDhExL0v3vo/OTtCyVIfrH7D/4GJ5w9J0mFaodley0p4OjM4x5f7EEDYXE5x
 BaHugrcYBbMjDSvYL+tYJZHL7KwC0o+G65eCYqys0yOyWnc510RLk/agjben2ze7ElDs
 5PE1zaJmIZzKsv+vkGYD8IVfmU6x33nIJ5Fzh75KRP9FTuEm2T3bNrmeBv0N+p/QwW7I
 pOV4PErFv4kRZDFhJZTBzFR2I1IETny1l9OVHID2Sxk39KoilwShaDa6/+eUTTDD33aP
 EdEEt0aHBty4XOEq1iD/HPxWa0MIBd585eAY/UHMj1eQq3abW28KNd5WVSpooWy58Iie
 eMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LBhEbdcT9XdisK3oGvthruPvAcNSwBdiCnqPKfoNIlQ=;
 b=TdCbZeHHHoQBNRyl6RQqJ6xHkrcyoRCVHUbMNT4BRV8scX5nP73ljhuzlu2AfaFhwQ
 qTduxd6pmyQNUh/dRY7Nq/YkM/GUxzLawBdipR+yGcCxzYXXHIw3eqtTkYo64DxuFNny
 7pDIhrZso+CWsPHEI66ad4oqQOrfbjZPHFzmE9bonhwTHyu1Cy7+d3VU2egk4ykD0H/K
 9/EEfbZlp3dqfEbQiBu3vetVy9n9gYtKoU2OyQNaGliRM0Q1XgsFeZz46IYScEagb5Xk
 /RcXCdRzcXIOGBTYj9JLZgSeVkOTb9zPwHEKf9u+G/C3j53nnQeURPR7vTr52CCLVK8A
 hq3g==
X-Gm-Message-State: AOAM530QuU1mcAoBDzcY/BuU+LFEruZpUsu0/uhnzkg3Zj0LQycA91ak
 +J9gQxdPdKy5RvpPC74gO0wNDixebXv6lw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr12477667wrs.100.1605822980035; 
 Thu, 19 Nov 2020 13:56:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/28] target/arm: Implement v8.1M and Cortex-M55
Date: Thu, 19 Nov 2020 21:55:49 +0000
Message-Id: <20201119215617.29887-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbnZPk9Jkcb/

This is a v2 because it's a respin of "target/arm: More v8.1M
features".  The bad news is it's nearly doubled in length.  The good
news is that this is because the new patches on the end are enough to
implement all the remaining missing v8.1M specifics to the point
where we can provide a Cortex-M55 CPU.  (There is as yet no board
model that uses the Cortex-M55, though; that's next on my todo list.)

As before, the series is a mix of bugfixes and new features:

In the bugfix category:
 * RAZWI (or BusFault for unprivileged accesses) the whole of the
   system PPB address range, not just the SCS
 * Don't clobber ID_PFR1.Security on M-profile
 * Don't allow VMRS/VMSR to fp sysregs that don't exist on M-profile
 * CCR.BFHFNMIGN should RAZ/WI for Nonsecure if AIRCR.BFHFNMINS == 0
 * The change in commit 077d7449100d824a4 to handle "bad returns from
   NMI/HardFault forcibly deactivate those exceptions" wasn't quite
   right; we would deactivate those exceptions but generally not
   trigger the illegal exception return that we ought to
 * fix a typo in the name we give the NVIC object when we create it

In the features category:
 * v8.1M PXN extension
 * VSCCLRM and CLRM insns
 * VLDR/VSTR (sysreg) insns
 * new M-profile fp sysregs: FPSCR_nzcvqc, FPCXT_S, FPCXT_NS
 * update FPDSCR masking to allow new-in-v8.1M bits in that register
 * v8.1M has a new REVIDR register
 * v8.1M does not set HFSR.FORCED on vector table fetch failure
 * v8.1M always clears R0-R3, R12, APSR, EPSR on exception entry
   (the behaviour is tightened up compared to v8.0M)
 * v8.1M has a new check on exception return which might trigger
   a NOCP UsageFault
 * v8.1M has new VLLDM and VLSTM encodings
 * v8.1M's new CCR.TRD bit that enables an extra integrity check
   when executing an SG instruction
 * v8.1M "minimal RAS" (the architecturally minimum permitted
   do-nothing implementation, essentially)
  
Already reviewed: patches 1-6, 8, 11, 12.

thanks
-- PMM

Peter Maydell (28):
  hw/intc/armv7m_nvic: Make all of system PPB range be RAZWI/BusFault
  target/arm: Implement v8.1M PXN extension
  target/arm: Don't clobber ID_PFR1.Security on M-profile cores
  target/arm: Implement VSCCLRM insn
  target/arm: Implement CLRM instruction
  target/arm: Enforce M-profile VMRS/VMSR register restrictions
  target/arm: Refactor M-profile VMSR/VMRS handling
  target/arm: Move general-use constant expanders up in translate.c
  target/arm: Implement VLDR/VSTR system register
  target/arm: Implement M-profile FPSCR_nzcvqc
  target/arm: Use new FPCR_NZCV_MASK constant
  target/arm: Factor out preserve-fp-state from full_vfp_access_check()
  target/arm: Implement FPCXT_S fp system register
  target/arm: Implement FPCXT_NS fp system register
  hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M
  target/arm: For v8.1M, always clear R0-R3, R12, APSR, EPSR on
    exception entry
  target/arm: In v8.1M, don't set HFSR.FORCED on vector table fetch
    failures
  target/arm: Implement v8.1M REVIDR register
  target/arm: Implement new v8.1M NOCP check for exception return
  target/arm: Implement new v8.1M VLLDM and VLSTM encodings
  hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
  hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
  target/arm: Implement CCR_S.TRD behaviour for SG insns
  hw/intc/armv7m_nvic: Fix "return from inactive handler" check
  target/arm: Implement M-profile "minimal RAS implementation"
  hw/intc/armv7m_nvic: Implement read/write for RAS register block
  hw/arm/armv7m: Correct typo in QOM object name
  target/arm: Implement Cortex-M55 model

 include/hw/intc/armv7m_nvic.h  |   2 +
 target/arm/cpu.h               |  46 +++
 target/arm/m-nocp.decode       |  10 +-
 target/arm/t32.decode          |  10 +-
 target/arm/vfp.decode          |  14 +
 hw/arm/armv7m.c                |   4 +-
 hw/intc/armv7m_nvic.c          | 257 +++++++++++---
 target/arm/cpu.c               |   5 +-
 target/arm/cpu_tcg.c           |  42 +++
 target/arm/helper.c            |   7 +-
 target/arm/m_helper.c          | 130 ++++++-
 target/arm/translate.c         | 105 ++++--
 target/arm/translate-vfp.c.inc | 604 +++++++++++++++++++++++++++++++--
 13 files changed, 1115 insertions(+), 121 deletions(-)

-- 
2.20.1

