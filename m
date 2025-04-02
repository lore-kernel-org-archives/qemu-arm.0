Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752023njd;
        Wed, 2 Apr 2025 15:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXzShDXsHdqyUQ6XYTwS/ReZakpw3aOuNUesi+aILlnsxpAN4OyZBEHxzz/B10Pso6J7aXDDsJWbyfVw==@linaro.org
X-Google-Smtp-Source: AGHT+IEV0ieUVqRgj5MXKOQXNMl0wQ0KHcvkunSxNaOw9Dv5Da9T1qM+o4c8i35PQqIm2M3DpGo/
X-Received: by 2002:ad4:5bc8:0:b0:6e8:9dfa:d932 with SMTP id 6a1803df08f44-6ef02be9cfbmr61832576d6.15.1743632683810;
        Wed, 02 Apr 2025 15:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632683; cv=none;
        d=google.com; s=arc-20240605;
        b=j0tdrtoutbfVY+01s8HDqDslLnH2O+z5qjLmbuBQWCWFcvcbA46H96CDP6I/w8tolQ
         5GMG3YkeGnUYJ1SmboC8ZbwjvhJbOXNtyGa0HlNg6xm0C2bv1seDs6s4jthT7k1KBQfq
         v/7KU7+Dmk0oQw5H55aMeU2guApME8/wQchgUdSX2aadq3kUSh8SbvBFBNwxsSrk7hhX
         9KlM4egMs61C+omKC1dfiUmirjhbx9+dP/elJH93HiQ8NO3MqSNpkm1AQ6A3E41iLbAz
         oD+/yDXJ+K5/S+YEdjVy07XBd5WCsmegpP2xFDUKMJ4S51HtsZmFprPthqN2ysI9bYKx
         JHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=o3yDZx0SYYuYZC9VlbBBkMM4s3bJRYFJ9WPnZkWGKps=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=K3GyHvN8DTnmEg8QvWdsMg2ttwk/dyzzcKFD/sUFawtw9bbM5StJ+66pTts8A7H0V0
         fYixId9EoNLYkDZgOIUkSYDt8ljdKLf1qNxirrhkk11YF+n/EXNmv7lb1wKDZF51WTFg
         AG+RW/Xr9vtxB0gpSJJuz6rXLO5+KXf7WM5knC5/TbaCa+vgm+n3RzCbBBQJqe9uPQAV
         Xp6Ewk6YiS2Wkc1AfYaDMU69hhJSGPlqkNxOM9AZ8SQXYuaBJTe2vkPxTlT0lwxqKWOo
         86ODqnpVq6cnFo3p6kf93vhvXVn1jDRrjgw9Zb1JhnrQQR0wysYLgzclOuJV45tDKnL6
         0KWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJRu1K57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f15d426si268406d6.506.2025.04.02.15.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJRu1K57;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u06Uv-0004cr-MR; Wed, 02 Apr 2025 18:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Us-0004bp-O7
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:23:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Um-0002Lb-E0
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:23:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43948021a45so2140465e9.1
 for <qemu-devel@nongnu.org>; Wed, 02 Apr 2025 15:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632616; x=1744237416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3yDZx0SYYuYZC9VlbBBkMM4s3bJRYFJ9WPnZkWGKps=;
 b=wJRu1K57eCwbO2GxHQX4aYpu0HYpbuwH7CmGlKuCApa3jPvm7lXlal46u9Iu5d2FE4
 agtcRQmMsflNjKSihJGna845ueDnSOH6sPvRIpWFx5WY7QSub9P+Z/kPmaJvI0TuZaFd
 DUJxSXFTIb5O8w5lI6R6JW4s4tw9RV3159+7PJYZ9gutviHDfzBJzZZQA9yL4GAJzbUI
 NvekfyuGD72Cv5fni9CB2G+5vwKaQB1ihe7b5d4xhkWFAtdYDVczKLoitL5W5YbD4t+J
 LMqjtFgvzF7VsegbJMbK8KGE82ACZFZUzYF2k9cnvrHq5kGLX3sCwj1Bodat2UrTIVVC
 mwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632616; x=1744237416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3yDZx0SYYuYZC9VlbBBkMM4s3bJRYFJ9WPnZkWGKps=;
 b=YFw+RuXerPWhh26jWtGhxOK+e5ZonmNGsFnWN4gGVCUSvzCXzVGnUrVPoF70tFsKML
 nl+oKnX9LdBldZRtZNa5N3DOQXFgZeQ6fc4u+KiImHPhvnX0xqCvz3Yha68dlLrcx6u+
 CU+kSRigxomLjAbAMznmovbBJk6eY1Dyr1ZfgQrz8uvtkrp6XkGLdW19LDQ973F/LRAy
 E17VVreJyNun1qADc4Juj5mNY3jyBw+2epPpXdJKHe1aFk+vLeCKzsaWDXGezQQKaMCf
 tseUmSUuK2ipKCkLmcQtGB9sac0fNpgwh9yw+URZkZ25H+jaOReZmydUiZr7vpUplxyN
 OsUw==
X-Gm-Message-State: AOJu0Yyv4gwBERAfKTcavhpwHzkkAtocIxv7XX/xDxnDhKhxi9mRMKbp
 CqAZkTMg8kJKZHIkwHGClVYFDHqzIJX+FTgD0Dr06ZN3aeJxRGCVgpvG+ByNF3Mn9VQ7Tst5H+T
 L
X-Gm-Gg: ASbGncv0/Bhbn9qtcVQl9/MEeYIUkBGWo8ibT3Gm08TuRHJHMFRCUN5URUZoTzHNsW+
 34HA3YlSTzjGkaMBhkqa34ueeLyjzH7fIdS9gdunfXIjPmfcQuvT0+v82uG1qnvu9xM6BtYrBqN
 CmdlILBziV69ZLAT5yICqy6YmAhENe0p5jZKs1HSE5lrqvq7rLzjHcnPexcjSqhEieqjU5RLuff
 BaNZfz3JVQc4yr9tEYIrJLFBCvieRmfvGul1kiKLkPad+8xPVqHAnLsSLJQqSCLZZpKJnO0fwGr
 8aiDoZ04fcinLn99TnhJlfye0rjfGfao2HnxToI6biE81bjYDnxxY9vhfc5zgLQwy1twKM25GQk
 xmreRQj7UgP46EjCW1L4=
X-Received: by 2002:a05:600c:45c8:b0:43c:f513:9585 with SMTP id
 5b1f17b1804b1-43db6247b2cmr169912365e9.13.1743632616610; 
 Wed, 02 Apr 2025 15:23:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec342a1fesm444175e9.3.2025.04.02.15.23.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 00/13] arm: Spring header cleanups
Date: Thu,  3 Apr 2025 00:23:20 +0200
Message-ID: <20250402222334.66511-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Etprq4PoTFSP

This series is more useful for heterogeneous emulation preparation
than single binary, because it allows non-ARM hw/ code to configure
ARM cores, so not using target-specific APIs. I figured some
patches could be useful to Pierrick "build hw/arm once" series (in
particular arm_cpu_has_feature).

Philippe Mathieu-Daudé (13):
  target/arm/cpu-features: Include missing 'cpu.h' header
  target/arm/qmp: Include missing 'cpu.h' header
  target/arm/kvm: Include missing 'cpu-qom.h' header
  target/arm/hvf: Include missing 'cpu-qom.h' header
  hw/arm: Remove unnecessary 'cpu.h' header
  target/arm: Restrict inclusion of 'multiprocessing.h'
  target/arm: Move some definitions from 'cpu.h' to 'multiprocessing.h'
  hw/arm: Include missing 'target/arm/gtimer.h' header
  target/arm: Extract PSCI definitions to 'psci.h'
  target/arm: Extract feature definitions to 'cpu_has_feature.h' header
  target/arm: Add arm_cpu_has_feature() helper
  hw/arm/realview: Replace arm_feature() -> arm_cpu_has_feature()
  hw/arm/virt-acpi: Replace arm_feature() -> arm_cpu_has_feature()

 include/hw/arm/boot.h        |  3 +-
 target/arm/cpu-features.h    |  1 +
 target/arm/cpu.h             | 78 +-----------------------------------
 target/arm/cpu_has_feature.h | 67 +++++++++++++++++++++++++++++++
 target/arm/hvf_arm.h         |  2 +-
 target/arm/kvm_arm.h         |  1 +
 target/arm/multiprocessing.h | 18 +++++++++
 target/arm/psci.h            | 18 +++++++++
 hw/arm/aspeed_ast2600.c      |  1 +
 hw/arm/aspeed_ast27x0.c      |  2 +
 hw/arm/bananapi_m2u.c        |  1 +
 hw/arm/bcm2838.c             |  1 +
 hw/arm/boot.c                |  1 +
 hw/arm/exynos4210.c          |  3 +-
 hw/arm/fsl-imx8mp.c          |  1 +
 hw/arm/highbank.c            |  2 +-
 hw/arm/imx8mp-evk.c          |  1 +
 hw/arm/mcimx6ul-evk.c        |  1 +
 hw/arm/mcimx7d-sabre.c       |  1 +
 hw/arm/mps3r.c               |  2 +-
 hw/arm/npcm8xx.c             |  2 +
 hw/arm/orangepi.c            |  1 +
 hw/arm/realview.c            | 10 ++---
 hw/arm/sbsa-ref.c            |  2 +
 hw/arm/smmuv3.c              |  1 -
 hw/arm/virt-acpi-build.c     |  4 +-
 hw/arm/virt.c                |  1 +
 hw/arm/xlnx-versal-virt.c    |  1 +
 hw/arm/xlnx-zcu102.c         |  1 +
 hw/vmapple/vmapple.c         |  3 ++
 target/arm/arm-qmp-cmds.c    |  1 +
 target/arm/cpu.c             |  8 ++++
 target/arm/helper.c          |  1 +
 target/arm/hvf/hvf.c         |  1 +
 target/arm/kvm.c             |  1 +
 target/arm/tcg/op_helper.c   |  2 +
 target/arm/tcg/psci.c        |  1 +
 37 files changed, 156 insertions(+), 90 deletions(-)
 create mode 100644 target/arm/cpu_has_feature.h
 create mode 100644 target/arm/psci.h

-- 
2.47.1

