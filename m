Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319160njk;
        Mon, 27 Jan 2025 01:44:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9QCk9DXjf/g/UOrR8vHGAlxr1mbmDcGUO8shC7nmBUsDEnDNY3BG3zJ6bVPejqjIRjVHoBMKnpJDOKw==@linaro.org
X-Google-Smtp-Source: AGHT+IF37tRSIDOc8TUvt0681jRhKGNgvapPJPkg8/cNCUzgSiywcf1azth2S+XAKSX0E3GVVGDm
X-Received: by 2002:a05:6214:21aa:b0:6d8:9cbf:d191 with SMTP id 6a1803df08f44-6e1b21413a2mr505645806d6.12.1737971051525;
        Mon, 27 Jan 2025 01:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971051; cv=none;
        d=google.com; s=arc-20240605;
        b=jGJ1KWIT8rSCiVtp2teA2ZJPSB8gbHWDQo7qlqhDTJiIEZ0+15bPNmbZMaSsDawgAR
         MgUFmJP06nJN8NiGvGkfPhP15leObit8rlgCbI/PTe5uXUC4eWe8+Btau7ZEGuaelEh4
         HvS1psAkDIfXCZBl7fJPekSUmUOkRNUbzckkTe/bhnoHAmmRzipH7Rb6xW5h1jL9eLIJ
         qcxltZD3njrKMjl35Xny/irYK5Nk13/7lzqJRKCYD/yGQAEVX9kvd2ZisnqRrFENO4wa
         IxkWuPsox+rghD7ImUCy7fVMrYjJrzqWPPcmY5W1iEDNFA3kE+aSKwW1PkalilEdG5kN
         nKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GyUuEd+mQAYgtLNlBd/uEG9AWCHY4JYbVKG1xXpW/Ho=;
        fh=CMrOiHL0MH8GTp4jomjfrdKK7faOikX/8lYNf/oV+7M=;
        b=CehkTDEOkjPAuLyTuUqms4efAXzC2GGDtj6d2AA+zb1iusKAlWZZd5QudS5JiiV0kc
         NtgNmXwcHuDXMoSeuqXOQjcSmXGLBMciosvuzQP0Xswf+qnZVN8jQUb1hvlMeHAQPefp
         CjV4b1JjsrTYPL0Z9uUkyYXf4WdSMJLLNFTpIO4ym7zFQJ2UrfWXkNA8bDaoykCPFW3A
         /Ik5suK0TkXf+QtnodylZUKyXp928j8dIKFWcwQbbIAoDTTdBrSzpXhXMqvGfh/jR99U
         uFaDgYmXMs+/FH3K+jM+p9aaviBvhKH1aGVblGGaRU544r6I9K5k09hFQzTvkCKiUyhc
         Eafw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvWI2sGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20602143csi94132186d6.427.2025.01.27.01.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BvWI2sGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLdz-0006B7-AS; Mon, 27 Jan 2025 04:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLdy-0006Am-Bh
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLdw-0005Pz-S4
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyUuEd+mQAYgtLNlBd/uEG9AWCHY4JYbVKG1xXpW/Ho=;
 b=BvWI2sGrcOI+EmBw0FZOBfzRdofUDEjPHvpG/zLt1m4PlFuZjggKf35ooOXercEnKVJ+mn
 EdtwsRSEEOQrPEx8VGPGdza2TQQlCTnmen/5ul8CipqtOFzkOkeNLK/LOjgz1DOllzEBEU
 5Q7GEX8AUFJNsc+qp9w1GS/tk35J2aI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-07ednxMwNX6jwhpcBdPikQ-1; Mon,
 27 Jan 2025 04:42:54 -0500
X-MC-Unique: 07ednxMwNX6jwhpcBdPikQ-1
X-Mimecast-MFC-AGG-ID: 07ednxMwNX6jwhpcBdPikQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EDC2C19560B7; Mon, 27 Jan 2025 09:42:51 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D52A1800365; Mon, 27 Jan 2025 09:42:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/12] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
Date: Mon, 27 Jan 2025 10:42:29 +0100
Message-ID: <20250127094239.636526-3-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: V71zQ6akWFKD

From: Jamin Lin <jamin_lin@aspeedtech.com>

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24). However, some boards are
design Write Protected pin active high. In other words, write enable the bit 19
should be 0 and write protected the bit 19 should be 1 at the
Present State Register (0x24). To support it, introduces a new "wp-inverted"
property and set it false by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Acked-by: Cédric Le Goater <clg@redhat.com>
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/r/20241114094839.4128404-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/sd/sdhci.h | 5 +++++
 hw/sd/sdhci.c         | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6cd2822f1d13..38c08e285980 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -100,6 +100,11 @@ struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
+    /*
+     * Write Protect pin default active low for detecting SD card
+     * to be protected. Set wp_inverted to invert the signal.
+     */
+    bool wp_inverted;
 };
 typedef struct SDHCIState SDHCIState;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 318587ff57ca..99dd4a4e9528 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -274,6 +274,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
+    if (s->wp_inverted) {
+        level = !level;
+    }
+
     if (level) {
         s->prnsts &= ~SDHC_WRITE_PROTECT;
     } else {
@@ -1555,6 +1559,8 @@ static const Property sdhci_sysbus_properties[] = {
                      false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
+                     wp_inverted, false),
 };
 
 static void sdhci_sysbus_init(Object *obj)
-- 
2.48.1

