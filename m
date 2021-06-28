Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4027670lfg;
        Mon, 28 Jun 2021 07:00:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYWPO7EUmi2YAnR92PA40SjI7W53FjJ4D7j11Z5BWjniRDnjbKKJPQ3LykSUA1eyDes5rL
X-Received: by 2002:a02:cd39:: with SMTP id h25mr22710377jaq.133.1624888801431;
        Mon, 28 Jun 2021 07:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624888801; cv=none;
        d=google.com; s=arc-20160816;
        b=A4eLkTafMZ4NuMYgKoT1HmI78yadICN/tE+lnQqidrV18Ob9iQa2fee2afOY5x480c
         UpgpgjNc5nobfFjKKWcB/OMoaFSqLRQsBlA/ZnWdE6aOiiV4rgmwn0jFL9YtorHJ3SdY
         pYalBPEuGZNRukzfZTGb478yR2KHScxgtsw7M+PeGmM5AK/7ZgOcmg3WWc2apZ+sAc4n
         SwLFu+5i837ZQ2QFbAN8oYPOReeV1ZTcaOldVuXUIVRbHs478ZS8cDts+9uXSng8kea5
         VJdj/hbM5BicgYsfqzQe+MgfHer6eCNvnY8GZxxMIDn1Ol8oAeMbU/eVNgLU+VA/q9M2
         gp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=po4Y+YPkHZGykvWsq45tycJkH3zonFVdu3AV4jkF1yg=;
        b=wItO162EEqKS2Aolp4HRpiANeXyZRqULXmlIZOEGd6C6KbixgdOvbszScWd0tvi09V
         l5muraHeH2eL88PNG59p3PFJbzzo9u9paHLjbOiCf3CgqoXv4hX5c/isK+xP+Y7Ok0PZ
         gfBFPEe6bHAT1yXvzcNcZ/zoiaPveoiVdABX6mOKsfl6YO8hz4qHrr2oN1YklbASAYTU
         c4/L1Fm2Z7WAcZVNs3ExV3vtAtU4ve3TCE+LbjEaUsg8cL0wbnYu7UXKatn4HBrYUWTu
         AAQcfMGEeS2NmB/G8hPbUP3GpiylMuu381GLYZeYjwhifsiIK8kxvhzVKwAJWLUbim/l
         9qeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0WRlX6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si16706922ioj.5.2021.06.28.07.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0WRlX6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrns-0003nZ-LW
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmc-0002br-AZ
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmZ-0005zh-ME
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u11so21376123wrw.11
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=po4Y+YPkHZGykvWsq45tycJkH3zonFVdu3AV4jkF1yg=;
 b=b0WRlX6wDnXEP1W6epAMnPSNnWWx3vm+uidclm4EKz4WmInz5h9TumvIZXY+HKh0T0
 2AEQzSHg5LXI27xLSLa9cQ3LCfx3V8Bx/uRFbCndzeXf9VG23Yg3pUoJEm9zDJ4WBn14
 pmNkouuosdVxXgEC5/J62M6duLL40/c6B+iTlDMFwFe4TuoZWNUH6ldEhSOBHrEA+gVE
 L2e2sSFNFYLpsf1ArhYVpz8IsCUlwWb9A8vNCoSnVwQ9enVEP54mzt+a8BeYtSElaiRq
 MhcgFkWHjvSWW3IyGj2evbImF7YIY5HDKScezL7KaOFgscLXHescpfrtzbVsppymSdOh
 2GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=po4Y+YPkHZGykvWsq45tycJkH3zonFVdu3AV4jkF1yg=;
 b=pFJE2iCd+cReiSPVksGT4Rl3A1ifNnWbK0BHUBdwAddvbRrFNws8FRiYgrDxpZVTY+
 dy0U4VN3RbadDGfnxICui+2sUBp39FH+ihF/3vvTtuzoPsYRVBIlo4qjQ9fFfJXmlN1j
 0CUXGXRnren2NaaqpLBFheVD6VMa50fujWt9S9++0gdb4rEjDFUVek1MuLLR9+KhDkrv
 UyznZ29E7NMrf60WYuKLfaagISYNrA71jGoEx107/O3tHMy2u9EVkEcgEWb0I42lIzSx
 SNtvJWuEhuXrKs2UC4JWj2E7KU0sYh3orlSl/uZ/0zc5512f+sIDb7yQAPXhWi6oxDQS
 mBFA==
X-Gm-Message-State: AOAM531qJI5Sf+Ozk4hPR41AgGM+7D7ykK+RyZ7O3JTH5hPkiWwsrfL0
 EyW+/cZ3RdRHNNzNsje0cofQWg5i03Iu93Oq
X-Received: by 2002:a05:6000:246:: with SMTP id
 m6mr27273009wrz.116.1624888717652; 
 Mon, 28 Jun 2021 06:58:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/18] target/arm: Second slice of MVE implementation
Date: Mon, 28 Jun 2021 14:58:17 +0100
Message-Id: <20210628135835.6690-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: 18s3M0PL5WcB

This patchseries provides the second slice of the MVE implementation.
In this series:
 * fixes for bugs in a couple of the insns committed to upstream
   as part of the first slice
 * the logical immediate insns (including a preliminary refactoring
   to share the asimd_imm_const() decode between Neon, A64 and MVE)
 * some vector shifts
 * all the new MVE shift instructions which sit entirely within the
   non-coprocessor part of the encoding space and operate only on
   general purpose registers (either 32-bit shifts of one register,
   or 64-bit shifts of a register pair). These insns are not
   predicable and not subject to beatwise execution.
 * VADDLV (add long across vector)
 * VSHLC (shift left entire vector with carry in and out)

(I haven't yet got to the shift-vector-by-scalar-in-register
shift insns yet; those will be in some future patchset.)

This is a bit smaller than the first slice patchseries was, but
softfreeze is approaching and I wanted to give this the best chance of
getting through code review before then. (Not that it matters much if
it doesn't, it just means I would be carrying more patches locally
until we reopen for 6.2.)

thanks
-- PMM

Peter Maydell (18):
  target/arm: Fix MVE widening/narrowing VLDR/VSTR offset calculation
  target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
  target/arm: Make asimd_imm_const() public
  target/arm: Use asimd_imm_const for A64 decode
  target/arm: Use dup_const() instead of bitfield_replicate()
  target/arm: Implement MVE logical immediate insns
  target/arm: Implement MVE vector shift left by immediate insns
  target/arm: Implement MVE vector shift right by immediate insns
  target/arm: Implement MVE VSHLL
  target/arm: Implement MVE VSRI, VSLI
  target/arm: Implement MVE VSHRN, VRSHRN
  target/arm: Implement MVE saturating narrowing shifts
  target/arm: Implement MVE VSHLC
  target/arm: Implement MVE VADDLV
  target/arm: Implement MVE long shifts by immediate
  target/arm: Implement MVE long shifts by register
  target/arm: Implement MVE shifts by immediate
  target/arm: Implement MVE shifts by register

 target/arm/helper-mve.h     | 108 ++++++++
 target/arm/translate.h      |  41 +++
 target/arm/mve.decode       | 177 +++++++++++-
 target/arm/t32.decode       |  55 +++-
 target/arm/mve_helper.c     | 524 ++++++++++++++++++++++++++++++++++--
 target/arm/translate-a64.c  |  86 +-----
 target/arm/translate-mve.c  | 261 +++++++++++++++++-
 target/arm/translate-neon.c |  81 ------
 target/arm/translate.c      | 327 +++++++++++++++++++++-
 9 files changed, 1465 insertions(+), 195 deletions(-)

-- 
2.20.1

