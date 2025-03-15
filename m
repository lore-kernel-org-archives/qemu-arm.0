Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp1212062njb;
        Sat, 15 Mar 2025 06:21:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+uUOF1tu+K8/0+da2wuycQzv/1SbcQkNCdbaJQos6IAzZ/JUzC//4F5f98oJE+io3Cvokrioo6FG2Ig==@linaro.org
X-Google-Smtp-Source: AGHT+IEOQvc+Tm+AVm3W1eNlePx9j8hcKXqEwsTBhRP6zAsBWkYFH5jK7uLvWlBe5naVFu0SJVWj
X-Received: by 2002:a05:620a:4441:b0:7c5:592c:c26 with SMTP id af79cd13be357-7c57c7d6cd5mr770909085a.19.1742044884361;
        Sat, 15 Mar 2025 06:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742044884; cv=none;
        d=google.com; s=arc-20240605;
        b=MhKTFzig5E9gRGvBVXt8laznOdxTrVHPTH1oeSLD3/iUQG/lFMrDt7BLDJykCQyGoE
         VrGfYJAKPACZ3paoYE6Fg7I4X7G8o5UZ1CIAY+yH08AZ407lsceAsqfWxDeMzEhXHHqZ
         Viy3l5McNRgwnJTscG7tE54r/uLfaBIGemLjJQjMh7bmOnbiVyF4/3EOaT4g7QWHK9xW
         DHtR8Fo2GcaSY4W1LRB6luWErtR5DjXevBhExgEKoD/58LKKcvzgIcxz/HSIIVzeZ5/r
         f34JDCTwIZXlybAMCNci6bD5cw7EkFUk2UgJzOYCTuG+10Lhmbb/mcnw+d5IGEh9bL4m
         7ydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZLm0hqAE+F8lyklA6QyeVI14fxlR7O+KswpiOB5myNs=;
        fh=jJwYnvV+Qdm92iSYr+g2pPNA17B/1qKulDEdPwhVfac=;
        b=M/GOcQRGXcFugj2e7USX2NNN4wFh8etLpqUpj8u7eUJ+u1p8906/aMavKNMpUyPTGj
         bBa0djG73U8dgUxAK7LDVzyzaUalgP09klqXVubrZd9hMEOXcxB7y623ywmr0biGBvGo
         Rzg0aNdIMX5KSH6yKq6SI8UNg8p/HvbLaAXDNs19QXYCAUZ0EsCrt3Ijw97MIMKh9pr2
         C7uOLqvCGE9OB7Dm/jFjmUP0Gy4U6nRRu1wsTPJRBeaI2G84gKQXZZiTy0/4FHp4YLlz
         tS97sWT0NZsvbSiN+SKBMCVS+1ZP3SydK2IAjQ/RmjC4JhAJbu67CKqK3UWV6WO+zYxa
         Rybw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=dok4cOlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d342c5si571936285a.635.2025.03.15.06.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Mar 2025 06:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=dok4cOlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ttRRy-0006vl-NE; Sat, 15 Mar 2025 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ttRRw-0006vP-Tz
 for qemu-arm@nongnu.org; Sat, 15 Mar 2025 09:21:12 -0400
Received: from out-176.mta1.migadu.com ([95.215.58.176])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ttRRu-00059O-EK
 for qemu-arm@nongnu.org; Sat, 15 Mar 2025 09:21:12 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1742044867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZLm0hqAE+F8lyklA6QyeVI14fxlR7O+KswpiOB5myNs=;
 b=dok4cOlSbMnYCd5b6YGllLQ82LC5+sopN4nrVdH79KwVPXp8SydbUwULMCCPMmQf2tqpvg
 kB3JJiadrWjpSbTRprNYv52BQXzztz+h6cjAAez83Yu2P25i3duFpvvt/acAdflRt/b3LZ
 XzVFbydnPrInhfrbf/knfd/RkiZeBbs=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org,
 Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] hvf: arm: Emulate ICC_RPR_EL1 accesses properly
Date: Sat, 15 Mar 2025 21:20:30 +0800
Message-Id: <20250315132030.95209-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.176; envelope-from=zenghui.yu@linux.dev;
 helo=out-176.mta1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: M0+6wI+7Iked

Commit a2260983c655 ("hvf: arm: Add support for GICv3") added GICv3 support
by implementing emulation for a few system registers. ICC_RPR_EL1 was
defined but not plugged in the sysreg handlers (for no good reason).

Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 target/arm/hvf/hvf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 87e35c1b71..650b7f4256 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1359,6 +1359,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
     case SYSREG_ICC_IGRPEN0_EL1:
     case SYSREG_ICC_IGRPEN1_EL1:
     case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_RPR_EL1:
     case SYSREG_ICC_SGI0R_EL1:
     case SYSREG_ICC_SGI1R_EL1:
     case SYSREG_ICC_SRE_EL1:
@@ -1673,6 +1674,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_ICC_IGRPEN0_EL1:
     case SYSREG_ICC_IGRPEN1_EL1:
     case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_RPR_EL1:
     case SYSREG_ICC_SGI0R_EL1:
     case SYSREG_ICC_SGI1R_EL1:
     case SYSREG_ICC_SRE_EL1:
-- 
2.34.1

