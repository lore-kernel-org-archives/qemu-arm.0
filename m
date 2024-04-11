Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp865219ejc;
        Thu, 11 Apr 2024 03:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEMFliy6e772cwyUnaien9+cqES1VxIrHuLC5kK+fgy5LuQSDZsLbRKDT2qLFiRoboRqhqkGWfuzoc3DNPXuhY6ixqwsrp
X-Google-Smtp-Source: AGHT+IH0zb3rtjWu2HeKEnGu5FB/xYSNeOsuZ5zwkptY7+gkr7G0YI3GTN+I17rsoCRzL0sSrN1r
X-Received: by 2002:ac8:5907:0:b0:431:5078:25a2 with SMTP id 7-20020ac85907000000b00431507825a2mr5364530qty.7.1712832273894;
        Thu, 11 Apr 2024 03:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832273; cv=none;
        d=google.com; s=arc-20160816;
        b=agMKHcgnyVm0vMr/Hs/8+tltYklQDxHsbjuhSP831VmUING+qHP2KOJtXSkpAeXJkP
         EflFqT1kHAsaSEM+sGwF21KEKqiHeJ+VDCdmMIk4dXzgplgp4BLhTA0aLTQgfxhaqjwM
         YvcsKdRe6Kboh+pcPPWSnLEecQJieBszYJ1bqhlJjtnwu8DKSzHKi61iUSjckSaDyNLs
         1gyieq2XAOg2g2cJdeMW8lYXATl3RkN3yAedtcIV8UHKixLGIUk45q/WXS5gq7W61eWl
         BRNHqWsvdTurexy3F+zyLc6lcNHWpt5WP8g0jhUGzLZZgO0/IgypgVBNRNX9wtmN2Bnx
         W9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=StAg582IsYUfzw7jTeYwZAGK85x75PWnZXDo6iqC+rM=;
        fh=gNCDl6fEQiUhjF+6SqblmyovD1lG/j0WkkhVVNIRRSc=;
        b=Y/JZZPqUxZ8uV2FYM9UwVi8gA+ui3We+WKXQ8E3H8lNYjAa4nhSlcy3zzjAH1jiyvr
         sN+1HkbTKoDvWygJeSgK3YUO+dkId634KMmN4AYcJQRS+m0uNFp4sd6hXuweV5ubCJnU
         FgtyQEr2svyhqYSaglElZyNXdH52LxJgOU3bXinKKfc6Lps2l4vnTKWWEszR/oJUBxMY
         00JkhnPJrUEnsIX/t6ffwPmSMc/4tj/7m5repkmn2zQeOxLDvGceAQ4HKCJ+RKrpN2F3
         noSsnu4bIonjdoNhQdJQC5S2weJAWWkcdbrsmVaWbuXuvB6Ip5lhS2ig2cfsgbqXC22d
         Zk8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUJhgtsh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020ac857cd000000b00431826d1ac5si1198332qta.310.2024.04.11.03.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUJhgtsh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruruF-0002jM-VJ; Thu, 11 Apr 2024 06:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruE-0002j5-PQ
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:43:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruC-000489-Vo
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:43:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3454fbdd88aso4480471f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832223; x=1713437023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=StAg582IsYUfzw7jTeYwZAGK85x75PWnZXDo6iqC+rM=;
 b=jUJhgtshcfKZbJ3KL3IFB8D3BAMZNSnSbsLDimh9H2aDa+ZgUwCLa9IDHvxuRRsxoZ
 P+qpTuxPO8YhVszlq/M5kYG4oaZc4vRYNeEtoBFcF5exfwjMZKdNDmNAo9gpeU/8BO0H
 HIavHQvuzwgLg1rEFQ6+DEFioXnZ9b9gj/3g1IRGr8pmfT5rNUs0b6JRQ/XTJDnkF+31
 avEgkcdVZVpDYp/pA9NYPCUpbpkLzLsNimVAjQToUXNI2BYnQarHDEOfIn0jiovAhGsp
 Vl4NUXNbiZhqnH+zH5k4RCNobaRCj1qZwQ26OzjGEeyEZIHoHocMXgcIS9kds4xbHv0B
 Rolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832223; x=1713437023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StAg582IsYUfzw7jTeYwZAGK85x75PWnZXDo6iqC+rM=;
 b=SyFvfO2Q46xxPLhsaYeKcdoTzIMCGyUBmCGpqzgVlRhM+skuuHczbB5f2S0+gZZDNn
 HRBk1X6Gb7sY7MOj2o3qjn+EmMZK113NYtT12gj0cg3RVSU9KeePYagpfv9FXXuTFQC6
 n4zXDl/PSTCZJ4q8JSdnjcCKs14VnkQsIpuMysaYgLJwopSilRm+4srS66hJN6dhl13J
 5dypBSupJIpjphrlENHBZHWYZ4G78n8ntT61aHHExgCgyNWe2T+N6Nj05HNmjkZi8rtE
 JMoqdCXsK3ANcQJIjG9LRTBAulrOtJEZxQHo7yPkkPBUA4BOKhHI2I0a2SCYN5L4Deqc
 dVvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZOLTdDoSZfnY/bdOFT6dUwUxssMxvnJjmhg1cxOieskfsbHfs2t6kex21kofXP1yN55+RgWdXQfK4JSO7eKjNYMao
X-Gm-Message-State: AOJu0Yz+9ATioVSfYL2E+pDffq8nV4Tdpt3YAcYLn4/BlYzbfhc1PGN+
 OSMCYMLaIbFIpsdpDreT9980ASftHsdiev1cmflS9wARw1xWAqoO+bQ3XX5quWk=
X-Received: by 2002:a5d:5885:0:b0:346:b8cf:b61d with SMTP id
 n5-20020a5d5885000000b00346b8cfb61dmr1142647wrf.43.1712832223279; 
 Thu, 11 Apr 2024 03:43:43 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a5d5046000000b00346df659e7dsm98738wrt.17.2024.04.11.03.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:43:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] misc: Replace sprintf() by snprintf() due to macOS
 deprecation
Date: Thu, 11 Apr 2024 12:43:31 +0200
Message-ID: <20240411104340.6617-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: /ihgHcCBJT6q

Continuation of:
https://lore.kernel.org/qemu-devel/20240411101550.99392-1-philmd@linaro.org/

*** BLURB HERE ***

Philippe Mathieu-Daudé (9):
  disas/m68k: Replace sprintf() by snprintf()
  disas/microblaze: Replace sprintf() by snprintf()
  disas/riscv: Replace sprintf() by snprintf()
  linux-user/flatload: Replace sprintf() by snprintf()
  hw/misc/imx: Replace sprintf() by snprintf()
  hw/net/rocker: Replace sprintf() by snprintf()
  hw/riscv/virt: Replace sprintf() by snprintf()
  target/arm: Replace sprintf() by snprintf()
  target/i386: Replace sprintf() by snprintf()

 disas/m68k.c           |  2 +-
 disas/microblaze.c     | 25 ++++++++++++++++---------
 disas/riscv.c          | 10 +++++-----
 hw/misc/imx25_ccm.c    |  2 +-
 hw/misc/imx31_ccm.c    |  2 +-
 hw/misc/imx6_ccm.c     |  4 ++--
 hw/misc/imx6_src.c     |  2 +-
 hw/misc/imx6ul_ccm.c   |  4 ++--
 hw/misc/imx7_src.c     |  2 +-
 hw/net/imx_fec.c       |  2 +-
 hw/net/rocker/rocker.c | 24 ++++++++++++------------
 hw/riscv/virt.c        |  5 +++--
 hw/ssi/imx_spi.c       |  2 +-
 linux-user/flatload.c  |  2 +-
 target/arm/cpu64.c     |  4 ++--
 target/i386/kvm/kvm.c  |  3 ++-
 16 files changed, 52 insertions(+), 43 deletions(-)

-- 
2.41.0

