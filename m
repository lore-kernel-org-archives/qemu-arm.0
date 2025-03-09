Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606349njc;
        Sun, 9 Mar 2025 06:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZyLuPMCNP5c1wf8mGR8bBzkp8Ec9y6Kjyi68sbJkqgS4Ryy5X69Ya3ZK3oOQmljX35ooz9AU7g4Hv0w==@linaro.org
X-Google-Smtp-Source: AGHT+IE6dadq81J7BQJA0AQrBdDadaK6C8cjVXQIandmGBLD9sB3SMovGiAYz+NNSo3VFWHtRiVM
X-Received: by 2002:a05:6214:21eb:b0:6e8:feff:b69b with SMTP id 6a1803df08f44-6e90062ca95mr114449266d6.24.1741528372704;
        Sun, 09 Mar 2025 06:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528372; cv=none;
        d=google.com; s=arc-20240605;
        b=aKX6Q0XrBPFS738+JoJ08nlVVh9ZYshUykY2jW0HLCmDm6qNHzBAwwUQUP6kNG7Yz/
         lZQqRtZJpgbeAsJL6MbTtspx6vjiz2SqAKbTTLjj9DxLyUdsqF/tUCGjszIMy2YpB/U0
         DioppEpfJYhW4UrVmik32ib0y3bkPxlaaQeBaUg9tqViWHn+YH0503CdFtUUJPK0390C
         spo2822ZfQocSyVC5z5W9HA1/0MDoESGB8N6AYlF/mRDJsNDBkhuhOdU9DTqGtT0UFl8
         F2CT66iSP2u9VkkMxFxqkeeBHACMBhxwkkO4h8xslrnmVnJKI8SYlnQIpuBq7I0cmZ/R
         jsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JNPAU5k1s0L03xvqrFVQx6ossP+Jgo9X576iOaJVLOw=;
        fh=T0srg4NBQRu22oFjMK4XHQySpCI66Qi9dZIWpS9x1iM=;
        b=gI7I4mYHVWBQ4PXM3BPTgQonYymD4bLuF05UGJZAmR8Y+oBpQsAXZmvsoWj/ISaxKj
         0V7R6tPbZ7fxmXLIkRtSsd+FY/b/1+QHpqoGYi6+HWChf/xYjyBz2U16Wt87Z4yx+pMk
         CyMdWa4cvX/tJOfoEHKtNULj22Fwq7p4ElbeEjHOplGERzhcvn6gg7YLFx2hwdcwmTvK
         vn3eA1lJBV2MCCQpl5vh7nJcnfH8YDxbOaxg1RqvPMNqSMO9hl66qGQBaoXUd3jEcyx/
         XQYs7EwR4ag3XG7T6hebHlRBmi1xE/YnrCMtpQYT5GoO2W1ZyJqbUrmMiWKL/zlT0pO+
         YyGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hQs7c45u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e90f5198a0si23970746d6.422.2025.03.09.06.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hQs7c45u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH4m-0007zO-Tt; Sun, 09 Mar 2025 09:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4k-0007vl-VI
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4j-0002ZF-6O
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNPAU5k1s0L03xvqrFVQx6ossP+Jgo9X576iOaJVLOw=;
 b=hQs7c45uj72fkodH+StBFNqMLCXXz8Zg5nCFQHaoQwSSo0TjTYyIlYjF70LFivY6d6cYXF
 d6xQHBiQe81aMQ1Jrrv3rV/xnmh1wGPDFzqba8aXhd4XybAoB3oVYPQTl6oq0aRAhgUvA7
 ab6Yy+DOjFmKjISbnxE+eLHa61YXStI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-B_p-CwjXNkG5xbiORtfHNg-1; Sun,
 09 Mar 2025 09:52:11 -0400
X-MC-Unique: B_p-CwjXNkG5xbiORtfHNg-1
X-Mimecast-MFC-AGG-ID: B_p-CwjXNkG5xbiORtfHNg_1741528330
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1FACA180049D; Sun,  9 Mar 2025 13:52:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 634A41956094; Sun,  9 Mar 2025 13:52:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Nabih Estefan <nabihestefan@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 13/46] hw/misc/aspeed_scu: Fix the revision ID cannot be set in
 the SOC layer for AST2700
Date: Sun,  9 Mar 2025 14:50:57 +0100
Message-ID: <20250309135130.545764-14-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QOrgbohjsfBP

From: Jamin Lin <jamin_lin@aspeedtech.com>

According to the design of the AST2600, it has a Silicon Revision ID Register,
specifically SCU004 and SCU014, to set the Revision ID for the AST2600.
For the AST2600 A3, SCU004 is set to 0x05030303 and SCU014 is set to 0x05030303.
In the "aspeed_ast2600_scu_reset" function, the hardcoded value
"AST2600_A3_SILICON_REV" is set in SCU004, and "s->silicon_rev" is set in
SCU014. The value of "s->silicon_rev" is set by the SOC layer via the
"silicon-rev" property.

However, the design of the AST2700 is different. There are two SCU controllers:
SCU0 (CPU Die) and SCU1 (IO Die). In the AST2700, the firmware reads the SCU
Silicon Revision ID register (SCU0_000) and the SCUIO Silicon Revision ID
register (SCU1_000), combining them into a single 64-bit value.

The upper 32 bits represent the SCUIO, while the lower 32 bits correspond to the
SCU. For example, the AST2700-A1 revision is represented as 0x0601010306010103.
SCUIO_000 occupies bits [63:32] with a value of 0x06010103 and SCU_000 occupies
bits [31:0] with a value of 0x06010103.

Reference:
https://github.com/AspeedTech-BMC/u-boot/blob/aspeed-master-v2023.10/arch/arm/mach-aspeed/ast2700/cpu-info.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250304064710.2128993-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 50f74fbabd6e..545d00474968 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
 };
 
 static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_SILICON_REV]           = AST2700_A0_SILICON_REV,
     [AST2700_HW_STRAP1]             = 0x00000800,
     [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
@@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
+    s->regs[AST2700_SILICON_REV] = s->silicon_rev;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
@@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
 };
 
 static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_SILICON_REV]               = 0x06000003,
     [AST2700_HW_STRAP1]                 = 0x00000504,
     [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
-- 
2.48.1

