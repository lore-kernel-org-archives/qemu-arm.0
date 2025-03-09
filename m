Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp608115njc;
        Sun, 9 Mar 2025 06:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcdbdYngRut6deDgnZ3x4+Rz+aBNYr7fH4vQ1/hAExaoW0TsoubgzAUw3JAiqe4SF5EgrYyTq5k/4g5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGQnWYiyIFngT+l0ELy61CbFXIS+TiMnKfs+4Dwc0Lkos//WaW8KCX+Cnxm2x/PJDcBnSAZ
X-Received: by 2002:ac8:7fca:0:b0:474:b698:66d3 with SMTP id d75a77b69052e-47618af7672mr117329531cf.52.1741528633465;
        Sun, 09 Mar 2025 06:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528633; cv=none;
        d=google.com; s=arc-20240605;
        b=VUQQz+xGLy83GUiweNLnb+/Xgdg8HFFvTNGoeOK/IEQb6B1HL1gTHDj393wo5VUqPe
         GA59IkSJ1jocji8ZctdGqTgCS2tHaT9uMA90zteqWFblrBirXZtePJxJ+3WSf3nCZQgd
         eRT6q83Djb5gTX8X0eytVq+AVpQDV9jcW8UkongM9hg699yXJpEzLikwFXh4L9WDMsjn
         L9CfF6lrU2HqN57IKON1M6RbEDy03Zi9JAuzmxqhREXkedt86SqpKYHlwUTAgnC9Uoc9
         fGJ5cdSUAt30fxoC2HUADrFnrYT3e/s++1Rq1m/VLa+kGEj5cfyMxCTIytQAEaSzspV4
         5ksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sOhQftDZDNfv3s0xjv7CgxsqjZzoP7D7rwlNh2ARdHA=;
        fh=WA0UgYAWR9tSFFWJIHilxwu+jX6JClFBOiAuSbmq2Vo=;
        b=jEHXyaPRzbymF/PZw/H4xo69myRTJQHJj6uMI1g/IJnTol1trf1bgOXzT4usQrFpSa
         5ONmpLNG4hVpQ8BDC08OBLYD6sAXRCXHllVyRDXzC+50dyT4ULZznL2E/RVE0MHSmt+h
         veXDJUybUPifuOlW2HQUocVlagn6uZaj3yKrJDLQSO9qeU7YBmT5TwDbmU14CwK2bmYa
         aIYwmRVuRI9AMe67SVNBFMi5PVMKGnNVWendm2dY5O0nfIZPGasltkcalP/Qsd5WliIb
         Jx4xLuNLKCgH/wPuEozz5vILWO6o/QgenWToqQAaARSBrlAngC8kAFYHanEzAKFhSXW5
         xvFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hd+ugkrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47679521529si17375971cf.254.2025.03.09.06.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hd+ugkrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4j-0007mw-1N; Sun, 09 Mar 2025 09:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4h-0007mS-Om
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4g-0002Uo-A7
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOhQftDZDNfv3s0xjv7CgxsqjZzoP7D7rwlNh2ARdHA=;
 b=Hd+ugkrwoku5XiLm2eQwo+EikaStRWsu/Aqscyd1tWLJujotwxlwjEVnnODEPWAVV6Q7vH
 fkVYH87kMQ6qNdChOq7xObNawkW9emmIJCoR1aVMPu5qWcW+ONYtR9gptJBgyh81jolB9O
 XENLjWIAHwXzHmfBk6+QwGJ8jUgQj3A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-o-I3mc6yPfyhLlJMRdaEDg-1; Sun,
 09 Mar 2025 09:52:08 -0400
X-MC-Unique: o-I3mc6yPfyhLlJMRdaEDg-1
X-Mimecast-MFC-AGG-ID: o-I3mc6yPfyhLlJMRdaEDg_1741528327
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE783180035D; Sun,  9 Mar 2025 13:52:06 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 96B3B1956094; Sun,  9 Mar 2025 13:52:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>
Subject: [PULL 12/46] hw/misc/aspeed_scu: Skipping dram_init in u-boot
Date: Sun,  9 Mar 2025 14:50:56 +0100
Message-ID: <20250309135130.545764-13-clg@redhat.com>
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
X-TUID: aZ2WokDyTNI5

From: Jamin Lin <jamin_lin@aspeedtech.com>

Setting BIT6 in VGA0 SCRATCH register will indicate that the ddr traning
is done, therefore skipping the u-boot-spl dram_init() process.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Link: https://lore.kernel.org/qemu-devel/20250304064710.2128993-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index bac1441b061a..50f74fbabd6e 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -157,6 +157,7 @@
 #define AST2700_SCU_FREQ_CNTR       TO_REG(0x3b0)
 #define AST2700_SCU_CPU_SCRATCH_0   TO_REG(0x780)
 #define AST2700_SCU_CPU_SCRATCH_1   TO_REG(0x784)
+#define AST2700_SCU_VGA_SCRATCH_0   TO_REG(0x900)
 
 #define AST2700_SCUIO_CLK_STOP_CTL_1    TO_REG(0x240)
 #define AST2700_SCUIO_CLK_STOP_CLR_1    TO_REG(0x244)
@@ -930,6 +931,7 @@ static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
     [AST2700_SCU_FREQ_CNTR]         = 0x000375eb,
     [AST2700_SCU_CPU_SCRATCH_0]     = 0x00000000,
     [AST2700_SCU_CPU_SCRATCH_1]     = 0x00000004,
+    [AST2700_SCU_VGA_SCRATCH_0]     = 0x00000040,
 };
 
 static void aspeed_ast2700_scu_reset(DeviceState *dev)
-- 
2.48.1

