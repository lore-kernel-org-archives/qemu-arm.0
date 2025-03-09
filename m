Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607234njc;
        Sun, 9 Mar 2025 06:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf4oIsFa/TJXlDFt5erwOoAt8rHEZ7uLrOzZhsA+uXkKgWIEhuGmGEDfMkfaz+XZDBMqT5fWFuNBGmGA==@linaro.org
X-Google-Smtp-Source: AGHT+IErFTy2su33gsSG9F461OWqNzzs1iB4t/TZK+IZ/sFZCBmNSuD6DoYiYN5cmBxVk1X5FbyX
X-Received: by 2002:a05:620a:601a:b0:7c0:b523:e1ad with SMTP id af79cd13be357-7c4e61ed4acmr1685179985a.47.1741528502304;
        Sun, 09 Mar 2025 06:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528502; cv=none;
        d=google.com; s=arc-20240605;
        b=Fa5OBoGGH11q891byaSdc3JULj65Tkm7T859GTehyOTQmskwrzrjasaUkGB0/Rywi/
         tQYAxv2Rs6UMdD/5UvMa8eCR9fbvvUWUghqxIvcMJOSi2KkuLOSkRsGQXo3rPApTciSl
         amWqcindLoWogTM8BkXSJtIP4FvI5ZcgWIX1FcDiTjWNrZ/9HWLs5Hy5fCAJZp3iXOiZ
         2nrLIwtJcQUIqm6KAm0XmZ/zusn97YQByMl7NNcVATLskeIu6NU9gOnrTeoBjRxcwL1S
         RbcKI01zdkxkObRUqghLAopqFvoYo+S9wzjUGMBADdbCy3dz35FA47xCCAGyncUgZwXJ
         d17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d22SKMQAfsOax7qEySvaP7nhHPhAwkw3ekcleRPbr5Q=;
        fh=gIu7G1JN70NCpiHAwj66qqryR8wRCqauvqmhj52y0eQ=;
        b=a2WF+Nn95gUegSa7JmMCEGD5f6bZu/KampruwVo6xKMYIwrncaO3rZjFeu8ktjqr8b
         bn2zbjx/9Cbzx/aZSQacRHbFPF+fuKk0txYPG2PqNzl9rmHlW/YCWpqgl2RtI1zeyqAZ
         MhB7iqbS0Pi1BJacu38HWrqtapKD8fkEajesh/oq9R+H7wJe12iCjeKh0VRoXB7om/Ie
         /ASi7Xo7OAusOw7+iCfierTBDsGsaVOUq1eIFql3Qjemf5Guin+v83P4O6u3hqUZmloo
         vUEBwcTJwh6t7IyrQ44ax29Sk63R8E+//5SZQ5Ja6DXekyKhhlLE1Xci3qS/8kSleVcJ
         kihA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EJ2AagjW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53b1539f3si399048285a.217.2025.03.09.06.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EJ2AagjW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH4o-00088e-Pa; Sun, 09 Mar 2025 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4m-0007yh-HI
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4k-0002c9-Ve
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d22SKMQAfsOax7qEySvaP7nhHPhAwkw3ekcleRPbr5Q=;
 b=EJ2AagjWIdUSND6zQBsxe7xoHKd/MaFdiui9vRCDdkk3qfUuh2g09xr+MSDB1AW1hcnbMz
 mCPo2uVExC3LFA4SrouUZSqjSvoVfPUV/pgs8DVkczdVo9jBkc4shSrHlFqbn8wMtgcNIP
 aeABwYWWc5+QtSJPa3qwU1yKUZOFzwM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-GOALUu9CNsyl2R1PS7fQQw-1; Sun,
 09 Mar 2025 09:52:15 -0400
X-MC-Unique: GOALUu9CNsyl2R1PS7fQQw-1
X-Mimecast-MFC-AGG-ID: GOALUu9CNsyl2R1PS7fQQw_1741528335
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E3D3619560B0; Sun,  9 Mar 2025 13:52:14 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 043BD1956094; Sun,  9 Mar 2025 13:52:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>
Subject: [PULL 15/46] hw/misc/aspeed_scu: Fix the hw-strap1 cannot be set in
 the SOC layer for AST2700
Date: Sun,  9 Mar 2025 14:50:59 +0100
Message-ID: <20250309135130.545764-16-clg@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LsbfYmGi7gec

From: Jamin Lin <jamin_lin@aspeedtech.com>

There is one hw_strap1 register in the SCU (CPU DIE) and another hw_strap1
register in the SCUIO (IO DIE).

In the "ast2700_a0_resets" function, the hardcoded value "0x00000800" is set in
SCU hw-strap1 (CPU DIE), and in "ast2700_a0_resets_io" the hardcoded value
"0x00000504" is set in SCUIO hw-strap1 (IO DIE). Both values cannot be set via
the SOC layer.

The value of "s->hw_strap1" is set by the SOC layer via the "hw-strap1" property.
Update the "aspeed_ast2700_scu_reset" function to set the value of "s->hw_strap1"
in both the SCU and SCUIO hw-strap1 registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Link: https://lore.kernel.org/qemu-devel/20250304064710.2128993-5-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 545d00474968..0581c744f112 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
 };
 
 static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]             = 0x00000800,
     [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]        = 0x000000FF,
@@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
     s->regs[AST2700_SILICON_REV] = s->silicon_rev;
+    s->regs[AST2700_HW_STRAP1] = s->hw_strap1;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
@@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
 };
 
 static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]                 = 0x00000504,
     [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]            = 0x000000FF,
-- 
2.48.1

