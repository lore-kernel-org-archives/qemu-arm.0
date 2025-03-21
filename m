Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178394njc;
        Fri, 21 Mar 2025 02:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXxsduf+EibWb7QXKPBuCT+nxfr4zgP+1RxsWFSH02yCBLCv9tcFJIt5XQcpbRw2t3Kr7awztLU9/E3w==@linaro.org
X-Google-Smtp-Source: AGHT+IFFTasCxfxGjzvkKT9vHWSDbmW+x84oHIaMK36o+0yN+96Ij3jKfCrp5P23zIAgL6shGot/
X-Received: by 2002:a05:622a:4009:b0:476:8cad:72d9 with SMTP id d75a77b69052e-4771de3f530mr42454511cf.33.1742549281660;
        Fri, 21 Mar 2025 02:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549281; cv=none;
        d=google.com; s=arc-20240605;
        b=XfnKyAVXtW/3Q2IoOh6V//miaNj+emxJGHJeXOZ4Gy/+mjClOHW5tFuh82BJ6v0ka4
         0wyheOUb5CjiwJoWPSvGMUZ+Q8kxwbU0AuAyu8bkXCzDI336Joc+fRbzXFniXOLyCo+G
         +2+3ZbUAE+iKR3o+3TAOTMqSXqtt0jOmLZBxb9ZG/szRNhArDkbL5atw9ByG1r+4/f9y
         RtUY2Bzcpwopc09x6Is6qii+3PE0yaFhkn68GIWjltAfKX7NXhw/SOA0fcmJAtH4Go9g
         6VgT9kK610NEV1cnia7oh9FHnXnmerqge58yF8yQU5PLeueOnQXsHavl6GmHIxv8yLGm
         l3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2DQODn4qUfAigCDs4nh4a5GTfeUtPWLZbk06ID3i28g=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=BvgCL3Y1wi+m8MdpxF46XAjJq5xPQXY/+n4rMnWJYnRWferULh+DE/YspJOnetzYsj
         hRqzQ6WRbokkGiQFV3wlyi1EGEqyLMIsd/hcyU8T9PL1hdnjluUPvNsm3bwg85qGUXyD
         5oeCuJ2cc1jY2Sbwk6mOPngsJgBmwxT224Pqe6188FXcfbBS+a+D34j7Ssu3K0UqqdH5
         JtnpNQrex8ZL/JjtNuqXfjS9jkVlSocCaHuzIwRIbQX1yherTmu71Y7a0I+Jxeg1xAIv
         qoKLSZ2eQVNkzB2dQjz0n1cu4XqsbAP2vRufJ75YNx24tfALHc8X6zvtj28BHSAEetd1
         CmJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d52ce28si15667191cf.398.2025.03.21.02.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeR-0006SG-OD; Fri, 21 Mar 2025 05:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeI-0006Hi-Ty; Fri, 21 Mar 2025 05:26:43 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeH-00056m-Ai; Fri, 21 Mar 2025 05:26:42 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:25 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 04/22] hw/misc/aspeed_hace: Update hash source address
 handling to 64-bit for AST2700
Date: Fri, 21 Mar 2025 17:26:00 +0800
Message-ID: <20250321092623.2097234-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lQZXkG1tju2G

The AST2700 CPU, based on the Cortex-A35, is a 64-bit processor, and its DRAM
address space is also 64-bit. To support future AST2700 updates, the source
hash buffer address data type is being updated to 64-bit.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 4bcf6ed074..9771d6e490 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -154,7 +154,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     uint32_t sg_addr = 0;
     uint32_t pad_offset;
     uint32_t len = 0;
-    uint32_t src = 0;
+    uint64_t src = 0;
     void *haddr;
     hwaddr plen;
     int i;
@@ -177,7 +177,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                 break;
             }
 
-            src = s->regs[R_HASH_SRC] + (i * SG_LIST_ENTRY_SIZE);
+            src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
+            src += i * SG_LIST_ENTRY_SIZE;
 
             len = address_space_ldl_le(&s->dram_as, src,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
@@ -212,8 +213,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         }
     } else {
         plen = s->regs[R_HASH_SRC_LEN];
+        src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
 
-        haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
+        haddr = address_space_map(&s->dram_as, src,
                                   &plen, false, MEMTXATTRS_UNSPECIFIED);
         if (haddr == NULL) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
-- 
2.43.0

