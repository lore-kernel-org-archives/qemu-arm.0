Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606820njc;
        Sun, 9 Mar 2025 06:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0YKn28k0hw1/fHIwuNyLqE5k2i95nHfgefC60eq6bspch4T7epQcD4oJr7IBDt9N22UumQCZGNVHbkw==@linaro.org
X-Google-Smtp-Source: AGHT+IEkNDhpU2jltMACSw9QtOcPpIOqEMI/t1JPrm53YgwouEcHDAPMRcFAtAorQD5eE4AAj2mF
X-Received: by 2002:a05:6214:aca:b0:6e6:62e0:887b with SMTP id 6a1803df08f44-6e9006ab102mr126791796d6.45.1741528437693;
        Sun, 09 Mar 2025 06:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528437; cv=none;
        d=google.com; s=arc-20240605;
        b=fEAVg7JidINRF1dx3r2OnyMz25Z1Gg+ZM6n9TBtnVAM8/B9bFCAymE7NKpXTARjY9R
         3+1ZpKtR49aXpVHP14IaoyYibgVjHTQP6PqcSfzAbIeuxLHZLRynxO2IykFIL/wZ57/m
         WWijnfw4LS1jTVAXybT6C8P19IwDCSGMm4PcUKrPt096M046g5up9ZrUcMIvxlBjWcHW
         tJeJuLpjTGpWKVlzaQjfc/SjLLRRslyd/lsjbINSFnOxAPLbOgfgEIbVWdnmMVM5p6QG
         J74mCBTQL3e8UyyTDG3HZX1UlYk5Q6onZYXqvgni1bkMvZ6taTDO61Dy3HMsGW02lLYR
         SSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mHen0mZt6kgIQhcM/Ia2JvwJ4O/cczVlrrHsaqpFQY4=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=gN3jK187lo1rQNsfbTFnOmItLUdhBAKlp4Z6udo45VAJTsdDYkdhVANghcDiCAOpOP
         +GohPL+gpyrwZZZQGpS1rF/E+AyKx0dkl8Y1t4+tA511M0mCfzssO1wuAvGwXT/GIpq3
         MYtA+Xi4RRKgm3OfQ5/zTZDFwL6r27NiQ7XC6JDfZ76a0LigmOfLPdi618HMPN/c4blF
         kJEC1nQmzorx2aPXbz57C+61pgX06pQqFbYVQASw2GuZo2F6jgKwMw6sji7pHI8eU5i6
         pMFJevNPqICPdkiiRYcn0bLgpajggeQ15kYOY/cqUmBhf0yX00tQtR0g0KZKfIJx2U1D
         MVeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4Scehh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e904fdfca8si45144826d6.283.2025.03.09.06.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4Scehh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH5x-00037S-LN; Sun, 09 Mar 2025 09:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5b-0001dB-HV
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5W-0003vZ-Q8
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHen0mZt6kgIQhcM/Ia2JvwJ4O/cczVlrrHsaqpFQY4=;
 b=f4Scehh3b2JeFULCfPr8v6VCsPjEIhPsmmd8PbPa/UoyTw3o7+Xaqp5shVr1cx9HeHdeWf
 Q36pEzO7aI+QIvoejOI8M7mWwXqLKXKTI6jXV8si0/1OMCIcekltPusGUudMgjA66rMCbw
 ncw8XsPare9bB1BNtqynvu5onJeGXDI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-hww5T7uDMXaUm4lYcn6SSw-1; Sun,
 09 Mar 2025 09:53:04 -0400
X-MC-Unique: hww5T7uDMXaUm4lYcn6SSw-1
X-Mimecast-MFC-AGG-ID: hww5T7uDMXaUm4lYcn6SSw_1741528383
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB02719560B3; Sun,  9 Mar 2025 13:53:03 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3A0351956094; Sun,  9 Mar 2025 13:53:01 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 35/46] hw/misc/aspeed_scu: Add Support for AST2700/AST2750 A1
 Silicon Revisions
Date: Sun,  9 Mar 2025 14:51:19 +0100
Message-ID: <20250309135130.545764-36-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2lrdG4hDOEkA

From: Jamin Lin <jamin_lin@aspeedtech.com>

Added new definitions for AST2700_A1_SILICON_REV and AST2750_A1_SILICON_REV to
identify the A1 silicon revisions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-19-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/misc/aspeed_scu.h | 2 ++
 hw/misc/aspeed_scu.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 356be95e4585..684b48b7222a 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -54,6 +54,8 @@ struct AspeedSCUState {
 #define AST2700_A0_SILICON_REV   0x06000103U
 #define AST2720_A0_SILICON_REV   0x06000203U
 #define AST2750_A0_SILICON_REV   0x06000003U
+#define AST2700_A1_SILICON_REV   0x06010103U
+#define AST2750_A1_SILICON_REV   0x06010003U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 0581c744f112..76cfd9167161 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -560,6 +560,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2700_A0_SILICON_REV,
     AST2720_A0_SILICON_REV,
     AST2750_A0_SILICON_REV,
+    AST2700_A1_SILICON_REV,
+    AST2750_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
-- 
2.48.1

