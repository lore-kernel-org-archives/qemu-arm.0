Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3085893lfq;
        Mon, 11 Jan 2021 16:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLoL2p6Ls72I1uo5LpnpJXZE9VhtLayCn7CqZ0jCW/2jyNNQz49FXowanoprgp0AleITdj
X-Received: by 2002:a25:1f87:: with SMTP id f129mr3209069ybf.142.1610409603337;
        Mon, 11 Jan 2021 16:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409603; cv=none;
        d=google.com; s=arc-20160816;
        b=07ULk+P1peXrvS7KfAXVxYFa+bx35IprV8/BAx5LpjNiyZFv02yhEyoKihFqg5sOQf
         FPGoceSL5YcX1Q9fke9gyNDp5xpsFtWWW5Mplzn/1Ah9UGnk5bgWBdkusE/s5qRvMFqN
         1uvfRW4jllCXBdgr1uKN+DlFBZrPmThbe5+d1PiLVippKyR/Z8SX0CFGZ2QaFklc7PDx
         9gvW43gXdnKVT/Jp1ZRL2pqHWcs+sK6t1M7FIMVdpTNw2ATImkT/sF1ZRHrYX3mYZXtn
         AecSRzFIulEYrFw1AZ1L1IUnSSlFbdZEpQJLKtRy6uZlZWK86wfO+1hg8nAPDlaK1cCo
         S4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zatfyXOxSXAm72pAS+OrSbicSsn0LfrDrs51sewnb54=;
        b=xSDbLdV1Gotwi0Ei9NzA01DyEuZaAyBG7gFNBbsVCCOQs61HPLrzigOVByLz+wVXX/
         5lTBSbf2g90E9nOG9knaTrA0WEj5vm3inm4fR9ShEDMdwKk2JgVNH9NT37STACAIFqxd
         mZ8pPb/UAp+tttZxyeItiCiq9uoHCohRgSopbx8kxf6VoULpacmWN47QDozRC78045l1
         BPv8Tz1pd7s4xV9mCGbAUhd9n9/fk6KwPulVeHDC8EsYmbrDU9KXMtsNgGFIw+ywfmG8
         RUjGrcxXbDdyXxf8AEb+6USnC3TbKL1+fLpVfK+9qRP7oXn4hastlfn0FFkYp/U4niw9
         4Zbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Frk1CPUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1130075yba.386.2021.01.11.16.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Frk1CPUu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz76Q-00005s-MG
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74E-0005Pn-OU
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:46 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74D-0003Uv-2L
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:46 -0500
Received: by mail-pg1-x533.google.com with SMTP id n25so238995pgb.0
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zatfyXOxSXAm72pAS+OrSbicSsn0LfrDrs51sewnb54=;
 b=Frk1CPUujx4N30J9g24nO3Nim0kcrYUFCfyGK12O+bxMTwKx99ZWIkbJq3SkajgOgS
 N4Noo0C50FhowCOK4ZMaFhzP+HRmUhrRIlCenQKNiNx1r9wEZJjKw33V1gQusgs17iGD
 DLTOu7uSEG4P/jDS7zH3drazljXe7fGNfKkI2ypzfx4paxfedkIgUGfgOo9C3rgx6X5l
 kY9X3fEVHs84ZK+D3G5J3c0Qa989loUgErBc2CPs+hM0pH9HbMMk7kd+iNBwpjugyI3f
 W1SCKOmn8gJrNvai/JmPnHFlGvhHY4EHKIXkNLTg3rXJhKzzw5pL6ZojjrmNLJNVfdYg
 lN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zatfyXOxSXAm72pAS+OrSbicSsn0LfrDrs51sewnb54=;
 b=BMgIh0n5Mhv/JL3O/IqdJsiVlEHIJ/GRyFGyab4Ysr5ds1xnuKhRqosvRhKrbYkAar
 uVJk269i20vBDOS1VcPyyA5ULu41O/X5LSn4UgdYVkkZ/SrEq+7hG277e+3JwmmtyOgy
 wv2InzXi/MW8EE2MzRwG43vM53TyGd/sXue7UgZUeHHe9C4o4FQcQ7hePb5gvI+sImdG
 nJ0vAh/4vv/K3F9xrZC5IHvFMsEIhT7Ak4/RgaAvP6jVVJ8eXh7Nn2COyS9lq+Oqb5pD
 dsNwyQJgmxCCvJXQQmyPtdc8NpBpGnH0lYwdRpNL2nTl3/0FkGcVaBOt1UF0RqTFZRJw
 rL2w==
X-Gm-Message-State: AOAM533gXS0oAy6UYDOK0sKmz1b3UIsOi5QNyfr6n6EAjHtjEcmeb2cV
 zexBnL1hdScAFF/3vqSMV/HDsA==
X-Received: by 2002:a63:d246:: with SMTP id t6mr1844270pgi.283.1610409463690; 
 Mon, 11 Jan 2021 15:57:43 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s67sm872220pgb.60.2021.01.11.15.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:57:37 -1000
Message-Id: <20210111235740.462469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SrTH+8i+7BH8

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.
  
Version 7 changes:
  * Fix rebase error (drjones).

Version 6 changes:
  * Rearrange xxhash64 (pmm).
  * Add documentation (pmm).
 
 
r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 docs/system/arm/cpu-features.rst | 21 +++++++
 include/qemu/xxhash.h            | 98 ++++++++++++++++++++++++++++++++
 target/arm/cpu.h                 | 25 ++++++--
 target/arm/cpu.c                 | 13 +++++
 target/arm/cpu64.c               | 64 +++++++++++++++------
 target/arm/monitor.c             |  1 +
 target/arm/pauth_helper.c        | 27 +++++++--
 tests/qtest/arm-cpu-features.c   | 13 +++++
 8 files changed, 235 insertions(+), 27 deletions(-)

-- 
2.25.1

