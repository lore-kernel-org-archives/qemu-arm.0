Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2049619njd;
        Mon, 21 Apr 2025 17:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULqmkTYY4b25ttVyIyXtlIKsAk2wBuMgXpX/ONcvzz5wIfj/cslEhuL/bro1M3GbxwZ2p8LC7AEQdRPA==@linaro.org
X-Google-Smtp-Source: AGHT+IEzKAIOcV6y6/5NnG3oUddAuC4uvIS7aqkp+Vr0dxVkSiAh6Wl0V3ASAfQZHaCFntDuBNpy
X-Received: by 2002:ac8:5811:0:b0:477:1ee0:50ea with SMTP id d75a77b69052e-47aec4d0598mr269119851cf.44.1745281682748;
        Mon, 21 Apr 2025 17:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745281682; cv=none;
        d=google.com; s=arc-20240605;
        b=Gy0NiqHsiLJ0SIutgoiShYwesvP8NpqUoQJOcZrobK0iqOaK7mmZXB8B/Jl35bsP/D
         qF4L6DC+AIFIFVf3KRk2pnglY3v8imJ7VouxyRQjHl3Z/+v4o02CEnOsk1TCA9rlvX/+
         ZoaC444huwcKpia/qwlnhEajZLXP3N86NiTnB3b4k7ZJK9Wa+MGBcuXngDrwc7msQiJw
         g1bL7zCbOwcOGuwmxUHtL9QRePlgPOuJYbqGblcwk2ojiR2XKOorPnstuS+uv0buKHqx
         KSU/Xx6hVxcYgUCTWMj5wgCoepzFnEwgqq/TPLUiQSRgQzJ9phAnE/5Jr+egWUUW0Lcv
         91NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Y1HRcHba6vPIZ8wnLJIBIEwxueY0n8SHHkbks1hX/oI=;
        fh=gJjwe5sQ8rj7+u050X0eGoLasTTvSd3t9TaSLB7bOas=;
        b=VAHagWRL6v57qKevrCVxakO+ViKlGauPpJjiOigpbA6Cr2cWllg2Ru0FusZjAMTzIj
         iqYgQ1omgjMeA8IByYjVZDvpJiAPPM0Vl6q8eiNjDzJZ3tzJBd8uGaWi7HB0plg+XoBN
         nJHMT+QtT/HWFkoAw20P1T7a1cpe6f52+jr7mI8zLz9G+H9gPWHYgoUNI4/FOMl67zBZ
         96b5bzwO1h7JO7ap4McXDAzk+qnFDFYZXZRxtt0jodD02ZpQV6hq5bOwCfrPenRlF5Ct
         ey+lrlvLmMupvFddxc+3m+3F2PuHTZ7wjQM9Gk2AHqHMSfsXLASiS75yebxMEnqFJzEQ
         V6mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KbFhf3hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c2bc53si100743551cf.192.2025.04.21.17.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Apr 2025 17:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KbFhf3hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u71UR-0001eE-P5; Mon, 21 Apr 2025 20:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3heIGaAcKCKwWaYXaPUSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--komlodi.bounces.google.com>)
 id 1u71UP-0001dn-Md
 for qemu-arm@nongnu.org; Mon, 21 Apr 2025 20:27:53 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3heIGaAcKCKwWaYXaPUSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--komlodi.bounces.google.com>)
 id 1u71UN-0003Lk-Vq
 for qemu-arm@nongnu.org; Mon, 21 Apr 2025 20:27:53 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-7398d70abbfso5953199b3a.2
 for <qemu-arm@nongnu.org>; Mon, 21 Apr 2025 17:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745281669; x=1745886469; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y1HRcHba6vPIZ8wnLJIBIEwxueY0n8SHHkbks1hX/oI=;
 b=KbFhf3hJ+RkiKRTmJ9U2EkzhsW4qEylNBtSWTR2lNULryuFsoIcgy6gb8PXf3sGsgS
 yFfdEsyi7sWFNTOgqjZw9oKRVe2B3l/0Ab0FZoqMGCXUP7xw8HjcpZG3W8624zDw7vPd
 B74tkoox/gPrNspUgjcjhVS8YdRolTd8Q0LzTUljbxzMqcUFAUQivsFUTa0wpK8Pa+DH
 dmOaPnZ8vwCzQ+r1VEr89C0g7LPqH8ZzC0y3Mn1IFQxrUKWNrUn8p98mtMnKelywu3mT
 viJ8kUK8EfR0+IbgNwUR2fy9Cl73+gYz+X30mYs9ui2mQmg81FdyBxChC3NR/CGua+UF
 TJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745281669; x=1745886469;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y1HRcHba6vPIZ8wnLJIBIEwxueY0n8SHHkbks1hX/oI=;
 b=rJGfqFCGNqykR50QPHvPvIlii35UBiIqr8CBLIvRHfNBYrN91BKAzoPc+kZWlKssay
 PQhTu/wjep5nyTIrSmpy7GlV6JnWawoLXyRaXRg9Ak+X5IP9iC3lJtnra8yQ+WUoL4H7
 aY633qIeMSlDzUSohJdtDECE+U3Mf6nfadH4DlcIGrlHHfJDnCUlfp9eTV4bB+fdtPpc
 bLnKhGhLykDRvi8CCPvoZAduPWDWZ8EwmxLZjZh5Idg7hXsbUTf30ycpgkcOACejscXD
 8nEMhz5kQt4qSxFL9hBhNhcxeovjkUC68HaXceydLfYLbbT6PbbB/5fv6MQ+ETuKt12L
 l6LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXOe+V4o44jdNYha1Cnxf8SkaVjAvx9/F9LKiVgLA5jcF2Ck0GlIEpoddy5IbiTf593863blrHtg==@nongnu.org
X-Gm-Message-State: AOJu0YyE16sk3/yGfsVHAAyDs8vXSo+fITb1aiyhLKEnqdNuzo3SyvMT
 JSPBq+sYP8HLrjsimel/va6aj8zYf3TUFsaI08s72E0xdGjaFa5BlwC2b/XAliCr+CbQYoTaSu0
 5CR7DFg==
X-Received: from pfnd9.prod.google.com ([2002:aa7:8149:0:b0:730:7c03:35e1])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1645:b0:1f5:769a:a4b2
 with SMTP id adf61e73a8af0-203cbc28d1dmr20886588637.17.1745281669401; Mon, 21
 Apr 2025 17:27:49 -0700 (PDT)
Date: Tue, 22 Apr 2025 00:27:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422002747.2593465-1-komlodi@google.com>
Subject: [PATCH] hw/ssi/aspeed_smc: Allow 64-bit wide flash accesses
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, alistair@alistair23.me, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, joel@jms.id.au, andrew@codeconstruct.com.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3heIGaAcKCKwWaYXaPUSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: nlAxceAJQKjr

cde3247651dc998da5dc1005148302a90d72f21f fixed atomicity for LDRD, which
ends up making accesses 64-bits wide. However, the AST2600 bootloader
can sometimes compile with LDRD instructions, which causes the acceses
to fail when accessing the memory-mapped SPI flash.

To fix this, increase the MMIO region valid access size to allow for
64-bit accesses.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index faef1a8e5b..a1160187a4 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -359,7 +359,7 @@ static const MemoryRegionOps aspeed_smc_flash_default_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4,
+        .max_access_size = 8,
     },
 };
 
@@ -670,7 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4,
+        .max_access_size = 8,
     },
 };
 
-- 
2.49.0.805.g082f7c87e0-goog

