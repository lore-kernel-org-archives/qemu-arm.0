Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1245222eja;
        Fri, 1 Mar 2024 10:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDBdO9ae8oHPoVf9NfdrrGAuGNoSEvqNvB3nVwahUawSDqmcAlULZmPdU0h0EYTtGfpqfdiSsiWAFl5JzhVnzWBKcyZKI3
X-Google-Smtp-Source: AGHT+IGDHIound1nmI6A1sgmMveIdHEiPKPGtg4hzd3HUWoAqTigIdVT9kqiVIEK3EVxrQVPyp+H
X-Received: by 2002:ac8:5ac2:0:b0:42e:d2f2:71f2 with SMTP id d2-20020ac85ac2000000b0042ed2f271f2mr1702998qtd.23.1709317968251;
        Fri, 01 Mar 2024 10:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709317968; cv=none;
        d=google.com; s=arc-20160816;
        b=r84i0CBBbVjgj0VUX1ArJBE6fwuW59c+6Fo49OHhX26A+kHIUKmb9sXj728m6udh6s
         YPDhvnovfSA/lFdmqgZA7FdSvNhA5PkvcbgBES9c3Ey1vYwq3l1BXRjY2EXlAhuN+pm1
         MRxdlLMub+eom7NqxSyJUIxSxkRFImU8Biue+CnNrvrHwzL6+MMIZAyjYMP9O5eJNsOg
         IxyDehUiEUot3bjj80IX3ZYwnJAjbNr1DAQNQUpWXf/YIdoXwyCPOZUE/4qgCTedQ8GG
         bFTcW/r5DizOi8Cy1IM8X5+S7G1ga7qld+F6u2ew4pGx6Zym5+fIeMxKAN+d9rsq8Dc/
         C1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nTitmqxEyjzm6yASfKKBHLFThAZ/7NzndfzWD2lD/nQ=;
        fh=x4yV6W++5EDM2T8pvDWfrYghCgb7XqbEnMjseNXnlds=;
        b=vSCNS/2a7cujnmoTHM2flDAlfJ8b9y1otpfpyNh9m3TcN3mvQZTvDmj8iaCybHRw0V
         lrVMB6y2ysFg9vP2wdZKD5ZE6NhDdmYGmxsmrw2HiqHKpFYrrcaW7qzos6QEpG4A4Gjh
         o5rwChD06L+6YDnWVdRDp39ywqRfiI6aPcRpHzSONJC4PrK3D/IfHA1BbSlHWjSpCIYz
         ig2PUU84HewzbEbFQTCMXih6swPEXj397DCxCVIM6KIyXgnLq41Xw7wM3BPle0V5r0ZS
         1JoQAzewSLh2YdHDuoCVh10eKlaFb+QTWDHRo15HEzMYJ44k73p1j9KvitJTqL8lgRdS
         aNgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUenYAa4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020ac857c3000000b0042e61833f1bsi4422154qta.20.2024.03.01.10.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 10:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUenYAa4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg7gL-0006Pa-2e; Fri, 01 Mar 2024 13:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gH-0006P8-1b
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:25 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg7gF-0008Jt-Di
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 13:32:24 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513181719easo1602334e87.3
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709317941; x=1709922741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nTitmqxEyjzm6yASfKKBHLFThAZ/7NzndfzWD2lD/nQ=;
 b=wUenYAa4cQ23rQFSB3G4TEcB36LEEWCNm+YbJCjeV1E7QKuxUhbYRWHAXZ4MQHuIfD
 NffnZOi/QSOONH3Oq/GFSNMmS1JZiPUt8A2PW3tjRcP4hX80JGWAT06gvBeSRQy7Mf9+
 AWwLiCwEPuk9pUbQjH/Fo1J9Dp/+DyzEDJgq8caT1N/x5Yjis3uCZYenO9OoCACPxc4A
 JQDQHfcas73qeOR10SRoqfp8G2Mt3YwQIlMmsr5CWRSfXdlyMwNOA0ZEfyQuHf1bLkkZ
 7KzPPMXprBQjqzJiTStMCB6m40SuxhuEeedm1erCeK+UxwgUpA1Cxu8DtqbY5j0FaC1F
 UAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709317941; x=1709922741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTitmqxEyjzm6yASfKKBHLFThAZ/7NzndfzWD2lD/nQ=;
 b=LE6vXbLkNVAxu+0JrTBLjK1552MZa+0WFBvG+6BgeF8/PjJnuMqiLmHeDgCk80Q4z7
 uJetXIHPsE06fuSRCM3sPKE7y1oyowEkZnZgo8/rDHKUh3WFAy0+oiSVND4DWgdlpAWr
 zu8Hxj3JGo5a/NWYnfZ6i5K4PMpZ87XDnaRbSab5P4OyJEakfpXbUUmJMrG4R9qc1unt
 uQ71i+jxRPTY2dK2DjzAo2jDBBSlTIo81kB4+S+LZ3mGCVhX0JUPRu1aQ8wH0CVO9fui
 8CnnvRluen0UyevL10MTyO0PiOqOOPcafVp39XEczj1/Z9x1c5nP0BvPa5q0dUPH7lYa
 O++A==
X-Gm-Message-State: AOJu0Yw0imwv3IKhQDSxPg5wlE78+lWvJmfp+yp+2mOkDiVbaqwWjT2Z
 tu/L+SQI1hVOAVHDdFM3z6PoI4bJWuxuWYtkTMpzM2loL0Q5J5Ga21E/znVZWeSnWNxy1ciwSnb
 /
X-Received: by 2002:a19:5518:0:b0:513:1cf5:bcb0 with SMTP id
 n24-20020a195518000000b005131cf5bcb0mr1968631lfe.27.1709317941155; 
 Fri, 01 Mar 2024 10:32:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfeb42000000b0033b483d1abcsm5158934wrn.53.2024.03.01.10.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:32:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 0/8] target/arm: Implement FEAT_ECV (Enhanced Counter
 Virtualization)
Date: Fri,  1 Mar 2024 18:32:11 +0000
Message-Id: <20240301183219.2424889-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NBARE8DfSdek

This patchset implements the Arm FEAT_ECV architectural feature, which provides:
 * some new trap bits for hypervisors to trap accesses to various
   counter and timer registers
 * support for scaling of the event stream for the guest (which we don't
   need to implement because our events are always nops)
 * new registers CNTPCTSS_EL0 and NCTVCTSS_EL0 which are
   "self-sychronizing" views of the CNTPCT_EL0 and CNTVCT_EL0, meaning
   that no barriers are needed around their accesses. For us these
   are just the same as the normal views, because all our sysregs are
   inherently self-sychronizing.
 * a new register CNTPOFF_EL2, which allows the hypervisor to set
   an adjustable offset for what the guest sees in the physical
   timer and counter (similar to the existing CNTVOFF_EL2 for the
   virtual timer and counter)

These patchsets implement support for this and enable them in the 'max' CPU.
At the start of the series there's one patch doing some "move things to a
better header file" and one bugfix for a "no sensible guest should ever
do this" corner case.

I'm hoping we can get these reviewed in time to get them in before
softfreeze.

thanks
-- PMM

Peter Maydell (8):
  target/arm: Move some register related defines to internals.h
  target/arm: Timer _EL02 registers UNDEF for E2H == 0
  target/arm: use FIELD macro for CNTHCTL bit definitions
  target/arm: Don't allow RES0 CNTHCTL_EL2 bits to be written
  target/arm: Implement new FEAT_ECV trap bits
  target/arm: Define CNTPCTSS_EL0 and CNTVCTSS_EL0
  target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling
  target/arm: Enable FEAT_ECV for 'max' CPU

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu-features.h     |  10 ++
 target/arm/cpu.h              | 129 +----------------------
 target/arm/internals.h        | 143 +++++++++++++++++++++++++
 target/arm/helper.c           | 189 +++++++++++++++++++++++++++++++---
 target/arm/tcg/cpu64.c        |   1 +
 target/arm/trace-events       |   1 +
 7 files changed, 334 insertions(+), 140 deletions(-)

-- 
2.34.1

