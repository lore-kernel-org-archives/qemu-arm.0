Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2705096lfk;
        Fri, 4 Feb 2022 08:56:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGoRtEoiPuLXNkMb82ltmwjRCS9S6Ael6jzBwY4GpcECXa3mvs+EmxU2d72TuFLV1I9QVl
X-Received: by 2002:a81:8353:: with SMTP id t80mr3711012ywf.31.1643993783532;
        Fri, 04 Feb 2022 08:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643993783; cv=none;
        d=google.com; s=arc-20160816;
        b=Tm3E8M5n9vKy1vQX4SvlBFYA4DcUHjffJYerTBjllCifDTFu7Qt+PS4RViIBMR6KvO
         9mhUvvHXdH9wDbGLHPxdS8vAxfCpZiUooRXgKwmea0LwZbGGy4u4xYiIox5viGzpfvQl
         piPRpMd8inAZ5sQ28IrFTDcFB5Y2KLHAOCzsbDw8qnMQEVfcxw4Wz/aS9t0IK8uOCSDg
         KmKg4myetJLVtvpiY89OsaFsSOlKHuaBZaiBYfip4BLptqJr8cqxwjmY/86ES4c2w6Iz
         z5RwPJaAvgZA/KAQlfuRe6ANiJ2DykR493gidAK4pCZcKn3G73C9quSvtDjtAfZJFLA+
         AzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=C8FZdd6GqFScZ13HoeD5DiDrLHtRUZkbguZU++0Zp44=;
        b=oZ8ARNduxSC9jq8WXCLEdS1RjjPOESIo48AlKPbhDltFMuHSRaue/tmu0nysopIe75
         mfWLJpMGefUFI1yX1k/78OZqZkdk/iADEHLz/wh59KvvM/UDPl/ChUgXc/PQPSZ7RbiF
         FqdpsIgt30vQGd7TC/wkVxpvV8Cv4b4YTtDWoUDG8PRxPb9v2aKj2XLBkc7oe54JPw10
         V0VspvJYjoxWKGBw81x4fmlWNx9tr2YUqFVXmBOtLzlf1q/IPSSrBcMhdyJkhGytQUo+
         kzTnz5v5fJi1bgSCMX/0NzTUH+SlmVDgsEJfQAy7fuZY8eVqbYiIqYEZH7PvvoduwHNI
         5b7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C6m9bdzA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si1629859ywf.499.2022.02.04.08.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 08:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C6m9bdzA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1sk-0002eL-W3
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 11:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rq-0002ck-Uj
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:27 -0500
Received: from [2a00:1450:4864:20::436] (port=43683
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rk-0003BA-1V
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id r19so1684764wrg.10
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8FZdd6GqFScZ13HoeD5DiDrLHtRUZkbguZU++0Zp44=;
 b=C6m9bdzASjuFZ92VDo3tyzJCWsO7Uu4NbaXiiVyv+js6YX2KcWBkUMVKpcdE3wZWfp
 9TLJWhEv6PxxfJdTnF7YMYn9R8jxplIgfh8MVi/0tD8/Fba4SyI+OsHz4f7IzuKmqO0Q
 e8rI69GDyu69uIlvQJDkgO8UXC8Wou0VVk5s2nUQJph6c67Qr/JyuUamTCN/Ze3PSi3a
 Lz72MeNk3nokFu4yfxxMGHM2KmNgQNH/ZUlg2dG3NbHjC0OQd7sFNbFbCslbTYEv6I+m
 Vw2D9G1TIvaqPw/XYWocfMX7flhwDQLzCwfZgTnEC5xjYoAqDIbvad+WKslaWriE2ceH
 dgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8FZdd6GqFScZ13HoeD5DiDrLHtRUZkbguZU++0Zp44=;
 b=gjRKd4sbxaPOrW8mHBRDIXsT8QSkRXoffPSftPm9cJI6JRWrq6zn6RdCAJRcQtQeDw
 CFAtsxmb7D/m/P4y4L67khDklZagppV+kyy4xduYpBJ570UYL2aJRkASHQyYFpf9/xny
 mofPMwYMuRAbQM6C0DE66qGg17ht2jasaX1VNbihhQGJiA/Z1KftIh6R2GkrcdiznD85
 MD639k1J7Lxs24g3vBV3x6BktDXiz4kNfS81nrZVhZkEWbcjZ8brIkrR1lGKojFX8FT+
 +Ji7jZ13t0Cw6hhuTCLej8A2UMVCZ+o6yrae/vzyYq+axQZPDBCwmrvJ8JI3WsDejrKT
 +wvw==
X-Gm-Message-State: AOAM533bSIP9Dvo117BxOKlrOxpFMjm6349UxR3yIlIFahCQeZjd5l6H
 VDLQmwfAtsv6SZE5FABKlXUNYQ==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr3154871wrt.244.1643993708301; 
 Fri, 04 Feb 2022 08:55:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Date: Fri,  4 Feb 2022 16:55:00 +0000
Message-Id: <20220204165506.2846058-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8vRwzAufpax

This patchset fixes various minor bugs in KVM and HVF
-cpu host and -cpu max:

(1) KVM -cpu max was incorrectly adding a 'sve-max-vq' property
that wouldn't work and which doesn't exist in KVM -cpu host

(2) HVF -cpu max was using all the TCG ID fields and thus
promising the guest more than the host CPU can actually do

(3) HVF -cpu host wasn't setting up the PAuth properties, so
it defaulted to not telling the guest about PAuth support

This series fixes (1) by moving the '-cpu host' code to
cpu64.c since it's aarch64-specific anyway, which lets us
reuse it from the '-cpu max' init function. It fixes
(2) and (3) mostly by making HVF use the same bits of code
that KVM does for -cpu max and PAuth.

thanks
-- PMM

Peter Maydell (6):
  target/arm: Move '-cpu host' code to cpu64.c
  target/arm: Use aarch64_cpu_register() for 'host' CPU type
  target/arm: Make KVM -cpu max exactly like -cpu host
  target/arm: Unindent unnecessary else-clause
  target/arm: Fix '-cpu max' for HVF
  target/arm: Support PAuth extension for hvf

 target/arm/cpu.c   |  30 -----
 target/arm/cpu64.c | 330 +++++++++++++++++++++++++--------------------
 2 files changed, 181 insertions(+), 179 deletions(-)

-- 
2.25.1

