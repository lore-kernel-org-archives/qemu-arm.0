Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1722187njc;
        Thu, 22 May 2025 02:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7gCYXk/I8+lERRBwVt3JYBqeTfY155sJlP61/KNJSz2Mj3d86pqHjQPcMWtnjy+g6pMKXiXRjQ91COg==@linaro.org
X-Google-Smtp-Source: AGHT+IHtNS/SeXuLUbTkV1QRyJiDcaZPdhGIAx4wFd+pvtfjlUrdinySwMtjXFZBkDH/pD22mttX
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6f8b08c007amr438002576d6.25.1747905495687;
        Thu, 22 May 2025 02:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905495; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDIaWQ0BgY3c0zerk9kez88BaT8AQ27l/OFRE2qnebO1Mm6yiJRuMu2YhAM/u4XSre
         1RoYVRH9b4aB/bfBsAOcmE47bNKZnACYqiHn9L4gbiK2nAHRV5oLfMxFKWkJIvIDPQrk
         ml8OmrNZIOP5tA0soTFi+cB4o+4WqZO/OKO+nRKaAeqYFD6HBhXuCKhnK9Ea0TlgCRkV
         ASuJjUANu0ax7XsZsfpRdAn7TbX9k4B4gaBoG7E/yl3t9USSBam30Sw978TYSVEYgOSZ
         lX6o2YKU0OILJk4Ju2QDDdIFIqnkIPyQl+yuPM19cdFKaDe7UyfpAjCPhwfbxLyT6Nj6
         f1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yqZQkF7fyoCyixWqJvPrcSXLF7zDV6t9Bf+U6Pb/AUQ=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=ZNvu4fZT4VJRgiH3NtpM9d+SYX++UjAskIJgVeTlqkzKPY638PBGbapo4RsDl8ixEH
         lZMFqrsdWfSge26iXS7PSACyIXq8dIpVIRQn5G9aFSiXWco/eO10j6runF11H1G8Nzp1
         z/vsmmNsVZGV8GVqQC/CUTp3fMypAQIPqMxKNzjOA/2EWEGNnpxG3o9DQ8PY8BD6tycG
         zzCCLAlMF++R9+eFLgjswzNrYBhiEv+KdslZScG9x/VPV+iKIyLOhiQn0llN+0Muq8h2
         fmavwiYwIwIRhXkYImXKpwJiHbxsZvUcWIMwAlU8pqpDquaTgjKQEs9XzHARgQChR2p7
         hI5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09b00a8si151289846d6.321.2025.05.22.02.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uI23N-0006e7-DV; Thu, 22 May 2025 05:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23I-0006cE-RE; Thu, 22 May 2025 05:17:26 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23G-0003Jw-MB; Thu, 22 May 2025 05:17:24 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 5/6] hw/arm/fby35: Map BMC memory into system memory
Date: Thu, 22 May 2025 17:16:59 +0800
Message-ID: <20250522091701.354185-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522091701.354185-1-steven_lee@aspeedtech.com>
References: <20250522091701.354185-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6nO/cXm6O0tg

Add the BMC memory region as a subregion of system_memory so that
modules relying on system memory can operate correctly.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/fby35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index e123fa69e1..c14fc2efe9 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -77,6 +77,7 @@ static void fby35_bmc_init(Fby35State *s)
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->bmc_memory);
     memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-- 
2.43.0

