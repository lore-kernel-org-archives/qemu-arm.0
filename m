Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064316dyc;
        Fri, 4 Jul 2025 01:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlLvHgjQN2yUszxurIvKtat6BxdomY9ffo2RCJY5ZNfeax4FUGp2MMJw6GwNOUh8J8iJKXlsyd0nefoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH+4lm4QEZiDdujmHwC4vLrN+RJOvgGcpbYaF2Or58si4wrTEUBi58n8r0zNtzvyig6TZ+f
X-Received: by 2002:a05:6214:6108:b0:700:c45d:f88c with SMTP id 6a1803df08f44-702c4e20e78mr27790376d6.6.1751618321761;
        Fri, 04 Jul 2025 01:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618321; cv=none;
        d=google.com; s=arc-20240605;
        b=WofVCKLvbd86aWQZaaD6C/HxxcVKKXNy8hq8VtpXE0/FtPfEv82OhF1mfcjdXHGFLD
         jmw4OjiRl6NeArSINhYq+zDdvkgw1Bq87/bK7VygpXdUEsvTOE/GSmJrJ2AH3soQULUo
         2lPskhn10DgqKVvUq+ebieQshyzDlKJWe6d8Bjiz3ckQ6R5PImny1NmZBbXekht4G4Sp
         wU6aeR2RpfrhTX1tywXDR0jg9h+v+IEbETWAokJxItc6bRzYEPDfxBT3eI1VFNPf/dWt
         TtUUUjWVeGdk4MbdxgSGMuqNqKWhO9uC1HAN2UUoSzYziOvKZq/8JoYnJzFsdpN4q1Ha
         kwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LDx2m2jSEIYmvII7OglgnRLwRDtp3j0JRhj53e5bOqA=;
        fh=KUqLEpV2qFcL/x8A2sv8RTwwq7nHu0Pg/A6vHRn1XHs=;
        b=YgX6VdKmjzb9Uo7DuaE/b8SLvbyFHPsGB+0UkonouQF9Z+mXbNfnWq2KTYxKWLyXlG
         bE880mZYEaYY7XYmQ6B1dDZewNPn7VlWnNowYGMegOD5N0pwhD991gxiw2OxdR6wO8jo
         P9EENCt87u7t1HJiHeDMbEwZqNxgwGw3/3YV10JW1098Z4Zbw/QpP8TSk/RQSA5UGPko
         Wt9HyRHnIoF/GBzgon7Cq1T18R5tYnbYOk5cRMckK+qp+q5wpFdN9h/kVbq3/EYefoZo
         ckFBnNg1S6K8k8ybaVr/HRrzpFsF9nW3rJnGPWNgjy1XIzxyC5IAropVO6XEK8XuwpNT
         ykoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Do7NQ0MF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d568a1si15590056d6.297.2025.07.04.01.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Do7NQ0MF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvY-0006ap-Qz; Fri, 04 Jul 2025 04:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvW-0006ZM-TL
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvU-0004NE-PA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDx2m2jSEIYmvII7OglgnRLwRDtp3j0JRhj53e5bOqA=;
 b=Do7NQ0MFsAK5M5WbQVFuX4rijA9Ekl3frAnHNtogZj4v9QQb7W0oxBtGqUuuEO3jGh5GkW
 eSgBPhlu1omM8N4EDLF0X35hViy1ZmhzgQDqpUKB8zHazrpNT0s+4h1Kk1nIGROQNXY8bc
 R5ZrEzFfosNMLbZ+EZBI0OuEk1RP8oY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-d4Ho866YPYyWUEPW9IJP9w-1; Fri,
 04 Jul 2025 04:37:42 -0400
X-MC-Unique: d4Ho866YPYyWUEPW9IJP9w-1
X-Mimecast-MFC-AGG-ID: d4Ho866YPYyWUEPW9IJP9w_1751618261
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FA181944A82; Fri,  4 Jul 2025 08:37:41 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D96DD180045B; Fri,  4 Jul 2025 08:37:38 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tan Siewert <tan@siewert.io>, Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 05/11] hw/misc/aspeed_scu: Handle AST2600 protection key
 registers correctly
Date: Fri,  4 Jul 2025 10:37:17 +0200
Message-ID: <20250704083723.1410455-6-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 0CFKbK3sYKec

From: Tan Siewert <tan@siewert.io>

The AST2600 SCU has two protection key registers (0x00 and 0x10) that
both need to be unlocked. (Un-)locking 0x00 modifies both protection key
registers, while modifying 0x10 only modifies itself.

This commit updates the SCU write logic to reject writes unless both
protection key registers are unlocked, matching the behaviour of
real hardware.

Signed-off-by: Tan Siewert <tan@siewert.io>
Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Link: https://lore.kernel.org/qemu-devel/20250619085329.42125-1-tan@siewert.io
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 11d073910882..a0ab5eed8f17 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -91,6 +91,7 @@
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
 #define AST2600_PROT_KEY          TO_REG(0x00)
+#define AST2600_PROT_KEY2         TO_REG(0x10)
 #define AST2600_SILICON_REV       TO_REG(0x04)
 #define AST2600_SILICON_REV2      TO_REG(0x14)
 #define AST2600_SYS_RST_CTRL      TO_REG(0x40)
@@ -723,6 +724,8 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,
     int reg = TO_REG(offset);
     /* Truncate here so bitwise operations below behave as expected */
     uint32_t data = data64;
+    bool prot_data_state = data == ASPEED_SCU_PROT_KEY;
+    bool unlocked = s->regs[AST2600_PROT_KEY] && s->regs[AST2600_PROT_KEY2];
 
     if (reg >= ASPEED_AST2600_SCU_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -731,15 +734,24 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,
         return;
     }
 
-    if (reg > PROT_KEY && !s->regs[PROT_KEY]) {
+    if ((reg != AST2600_PROT_KEY && reg != AST2600_PROT_KEY2) && !unlocked) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
+        return;
     }
 
     trace_aspeed_scu_write(offset, size, data);
 
     switch (reg) {
     case AST2600_PROT_KEY:
-        s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
+        /*
+         * Writing a value to SCU000 will modify both protection
+         * registers to each protection register individually.
+         */
+        s->regs[AST2600_PROT_KEY] = prot_data_state;
+        s->regs[AST2600_PROT_KEY2] = prot_data_state;
+        return;
+    case AST2600_PROT_KEY2:
+        s->regs[AST2600_PROT_KEY2] = prot_data_state;
         return;
     case AST2600_HW_STRAP1:
     case AST2600_HW_STRAP2:
-- 
2.50.0

