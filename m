Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp93247ejb;
        Fri, 14 Jun 2024 00:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7QfR4ohGRUE3BFwmn7FvJvoTP93oY0aODfK75u7YxReEybtIpd6iR1q5LPmdg510EASFTX9xDpZ+1XCfnIB6MRr3Op8Ip
X-Google-Smtp-Source: AGHT+IEI7QjCPYMKKtFvJjRHDVeiV9NqapaWAsT0pRTdZEDSzfOvDhxKSK09bHxgoAvIkuvVXHvN
X-Received: by 2002:a05:620a:1727:b0:795:5996:131 with SMTP id af79cd13be357-798d258dd2bmr221687985a.52.1718350191003;
        Fri, 14 Jun 2024 00:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350190; cv=none;
        d=google.com; s=arc-20160816;
        b=0ioy3bZMdR+ydUrSqXGBOsLi22+Amp2Qi0BIMUyYo9tjio0yi9NPHFvAoqgIM/chKo
         2E0qfY9S0WsB+SGt3A294HdwkKx00N6kxI6A1dk1HiYHx77nw8uNMXFYiER1yJXAyz4w
         3Lzo1rSn85ThTcHxO7uqquayi1HJmqQZQmKcfG0shHWGhHBiY67ez/+PjR7iyQuqLpYl
         +Vp5qgiIeVSnV14F2vWcZ9EuEUnc3PYbk4lku/Za18l6ALgmRZ6aFqzmmMHbsIHjrFwM
         1QYjiA4GwzlKkPP5C8lh+E+Wwl2k55kghV1US5qOUwac08q47Tzwy4fnWguiOpvhY4hf
         uSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GG/7nIx9q8EFSXqOPcSvBh4zIHq/fXW6byZ08I1yz/Y=;
        fh=AcWSTBBcQtYb7MKLFQz0jAErn8oNU1WklmI8CXNUViI=;
        b=HiTO9+s6DCtKVi3FDwjMr6Wrf+/WDOhqpltJ6vQIqlWWOmBDv7k2MpgfggAV+LwYO2
         YRLxvLUsgizX9LT8z5+ueSaa7sFVy+JEbAiGhOohLOFpp133bZ7X0K8EQfkXmNLfEfNy
         RzZX+vDXsiVs+deZZN2C3gLUsXZTimj+GYVtNMqrHhAevgfGNUNrnPzf6xl22nKKLsvA
         lF6fXIhgp7hcwRZzmmz2oKcAlUN++WNNc5mm1CM+3Fyp5f7293+JcGggk+r+OMMpebdQ
         WfjLSFsWn4V9BV7/Bf7L8KFwsOtQOFQff0nzALWRfJjZqOp2qMUdbji+daef7I2ri9H2
         Tp3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqiVRdbB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aac9da1fsi351350585a.110.2024.06.14.00.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqiVRdbB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sI1Li-0003IA-0f; Fri, 14 Jun 2024 03:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Lg-0003HN-IO
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 03:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1Le-0000ll-VR
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 03:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG/7nIx9q8EFSXqOPcSvBh4zIHq/fXW6byZ08I1yz/Y=;
 b=bqiVRdbBrTuD5pMDHwBQ0FE0BBRBOgKRgEFFdc8iryCu7ISVGQ5Q3v+XYmoGmaR9Q9ytNQ
 NiN/nP+H3V8C7mdSMnCzzOHAGeUgzbKvxxHGGayu3XCt+BNYG4Th/NIP5nFA25vamf3AXe
 Zm9R5H6ayq4VzIFC79P8O0OIlI1vi+4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-LzW7ZURgPWeI16W83EmJXg-1; Fri,
 14 Jun 2024 03:27:37 -0400
X-MC-Unique: LzW7ZURgPWeI16W83EmJXg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 146D5195609D; Fri, 14 Jun 2024 07:27:36 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 37FC73000219; Fri, 14 Jun 2024 07:27:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 05/19] aspeed/sdmc: fix coding style
Date: Fri, 14 Jun 2024 09:26:06 +0200
Message-ID: <20240614072620.1262053-6-clg@redhat.com>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
References: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: V0SthbQZt+fV

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Test command:
scripts/checkpatch.pl --no-tree -f hw/misc/aspeed_sdmc.c

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 74279bbe8ee7..873d67c592d8 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -296,7 +296,8 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -354,7 +355,8 @@ static void aspeed_2500_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -434,8 +436,9 @@ static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     }
 
     if (s->regs[R_PROT] == PROT_HARDLOCKED) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
-                __func__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SDMC is locked until system reset!\n",
+                      __func__);
         return;
     }
 
-- 
2.45.2

