Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp271273lfm;
        Thu, 20 May 2021 08:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNQyGuOPEp8YG/+fmfSWF4fzb23oFWsHVvup2dU8CdNBjf2gMTXVOQfOfmJVc5YiS6Nfii
X-Received: by 2002:a05:6e02:ea1:: with SMTP id u1mr5611531ilj.49.1621524537875;
        Thu, 20 May 2021 08:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621524537; cv=none;
        d=google.com; s=arc-20160816;
        b=zFBjgZXoUemtCRWb9qWvpK/e4yi/Qv6UfO6kU8aubE/DpCefA3kEepRca6NCSPmKi0
         PisvnpfPGKiCugc7igEvFGlQkk1amcQnWUdApDUveT1qI3NgWRuc7WjNK3q9fBQcoIpl
         DkL1Dmkd4ndq41XlIwqQUhSovGFzC/nyVrvoHvcAri8/t3HzH7wuO6e2D6ElFMrvT7qa
         WDtMqXeOG4rwzV8T0rUD3QDPr1Z+DNq/0++h2cPvZg3FzGzvpD1rg7ra1x6HPHyI7ZzP
         8Co5/9LpI0dKlKkz3U8O6aK8ct+j74pWKSmv62DH69yLKwqbeB029ZIQatk/ufe9TBcj
         csog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=anGLAxuF2ANNfuzvouPyHzw7PpS/Y9aRonPSrVr2uAQ=;
        b=pWaHDFPWDnutLn1nXVINmY8lpentKlP/CX4pTeWlzy9W0dm/OxFLcy3pzzCql7wsfM
         VosttE2Ul9V8oNukXcPT/AN/EVKNzo5f399kDKmGdmHbqdjO7kCFlrvwd7Y0ib1YrsH6
         D7V0PGeVEBZCebawe4stZrK+Af3uV9EX6BwCSqma/l3XR0GTNYHBlZ/+P3Njd1AVjxSY
         Nl5M3lhVK97A61bqZU86ma88sihYCr/vUGuNriUZcRv4Flhe8d6To8dZNBTFllKqORoL
         VuI43YXB6WCy53tIL7dKIST3zTX9P5jLmZ+Nxv6H2+s/bN0yh+U6CNUZZvdXCqOIOfCV
         hPdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8diMeZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si2653907ilv.5.2021.05.20.08.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8diMeZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkbZ-0007pT-6Z
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbO-0007ms-9i
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbL-0000dN-P2
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id v12so18103490wrq.6
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anGLAxuF2ANNfuzvouPyHzw7PpS/Y9aRonPSrVr2uAQ=;
 b=y8diMeZwU2Rd7PyqCZyHP6zdGzkZWeH838l9sLvuicaSsG8gUMNPdnTHeWOcJH+4p8
 L7Iabcgi+WEeCbnu8+IeTymBBnCfSHq7GbMYqOaSI8iMYozPzZQOjhHZFSA+790TjVCj
 XmKmAku2xmKYiR/CF6AVAct97GfCReE/4CQ/0bUZZvwZaGFUNJcL8eg/QFIjK5Q/P/EN
 mtXff5/g/G3ysqebYyVY9r1eoOr3OsWeehOj8NmQV0TDKcdoGEA+bBq1/RFVce0I8RPG
 HOjMGtgC7NQbs9r6uCL3Fbl6Sx8gCii/Dp0kZcMYHaPrMi4JYpFU/CtxxjmDoPPy9l0E
 RxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anGLAxuF2ANNfuzvouPyHzw7PpS/Y9aRonPSrVr2uAQ=;
 b=cl7NuZ8JUhSUd8Xrh96rjhsUlEOrRTXzV12TMLRrLQgR7TqNZXOG/jFyzhDi4HqGrs
 ygGsb62nICXhaDuZ+nJtiJSormhg1J0DA/12nF9EQC2WdiQz9DHmClBJ6fm43oyC5mAa
 87UEv5Mu/7stnaUVOuhBiu9U6MFdurs9LMrqnr/3K+vLB0K5xdZn2rEVmf9zhNY8xC/6
 TkgY0J4YR0qmxZPQVyFtlGtEHfKsjqKLo4t2kMYQTcmi4H33AbJwfcRW4rKTEJOTvSdd
 DuQ/mvzcDnH1EonQtt+FanKv4jtSocOIZb1FWWNXjAfh21QNJ8XIcBxshsS331zsJSaC
 9Dvw==
X-Gm-Message-State: AOAM533Kc1FNozAxuah0Zj4/XGkT3VpMHwBGlmYdEbzcm+BAqSgjENuh
 VYteRj7pXpuiIAW+2N1vSpcuSJ5KX1xbPgmD
X-Received: by 2002:a5d:414d:: with SMTP id c13mr4905066wrq.240.1621524522137; 
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/arm: MVE preliminaries
Date: Thu, 20 May 2021 16:28:31 +0100
Message-Id: <20210520152840.24453-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: fLji//bFdAya

This patchset is a collection of easy preliminary MVE patches, which I
send out now just to try to avoid the MVE patchset landing as one
enormous series. These patches:
 * update feature checks on existing insns that should now check
   "if FP or MVE" rather than just "if FP"
 * fixes a minor non-guest-visible issue in fp_sysreg_checks()
 * adds support for reading and writing the MVE VPR register
 * makes FPSCR.LTPSIZE writable if MVE
 * makes FPSCR.QC exist for MVE
None of this code will be "live" yet, as no CPU sets the MVE ID
register fields.

The last patch is not MVE related but I've had it kicking about in a
private branch for a while now and it would be nice to have it
upstream even though we don't have an immediate in-tree use.  It just
makes the NS VTOR configurable by the board/SoC the same way the S
VTOR already is, which then matches the hardware.

thanks
-- PMM

Peter Maydell (9):
  target/arm: Add isar feature check functions for MVE
  target/arm: Update feature checks for insns which are "MVE or FP"
  target/arm: Move fpsp/fpdp isar check into callers of do_vfp_2op_sp/dp
  target/arm: Add MVE check to VMOV_reg_sp and VMOV_reg_dp
  target/arm: Fix return values in fp_sysreg_checks()
  target/arm: Implement M-profile VPR register
  target/arm: Make FPSCR.LTPSIZE writable for MVE
  target/arm: Enable FPSCR.QC bit for MVE
  target/arm: Allow board models to specify initial NS VTOR

 include/hw/arm/armv7m.h    |   2 +
 target/arm/cpu.h           |  33 ++++++++-
 hw/arm/armv7m.c            |   7 ++
 target/arm/cpu.c           |  10 +++
 target/arm/machine.c       |  20 ++++++
 target/arm/translate-vfp.c | 140 ++++++++++++++++++++++++++-----------
 target/arm/vfp_helper.c    |  12 ++--
 7 files changed, 179 insertions(+), 45 deletions(-)

-- 
2.20.1

