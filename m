Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1803600njm;
        Tue, 2 Jul 2024 01:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEelGp+0EHLZdq5fjl0cIKSeNvD2XqPGeUiTC7q0ZMw6W30jArV3jOXrJSMFRNcE4W+6pJDpEuyVr9dIPVnNSLz4QA8agS
X-Google-Smtp-Source: AGHT+IEeeX7EImRgKgA0PaoBGDv/MU6bdd4HcWCssnHIMCuM6lysPb1QixY+4VsapNu2vUluEs++
X-Received: by 2002:a05:620a:4508:b0:79d:57b3:71f7 with SMTP id af79cd13be357-79d7ba973b9mr1084481085a.47.1719907380172;
        Tue, 02 Jul 2024 01:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907380; cv=none;
        d=google.com; s=arc-20160816;
        b=CbC2hev0I3O7u/35gVxGRXviGZ+JLxdQGp3YshC2LxZq7of2DDwp8i/lBKF+MBRFO/
         9sBrY+dn+fiqwm0B6Yj/Pxwp4RABTSjSLuflInmTk0+UZPvWViQzXuzKhag2kOIvg18Y
         OwtR87EQ7TcmzgBQSOJjxzunR6i8NcFW+GGM4ZdwytU3Ooo3wfEWFMWISOUcf9Kx7Rpp
         frFASJRwocd7W2S2DeZsoLqGF3Sa8hMLTnT1538B/L4CSljhiAKoThz1cIBd0bE4AYkW
         Ln5y9jvCWEwDhkiXzlB0EqDhmle5fsLNSk2NUS6U3uDfVXMV2eE35axFJMMW9/UuQiWQ
         s17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6ZDjAYdWEq9lylzH3r+bf49l7/u64ItWJffn1TpvICQ=;
        fh=B9wBZ6YFTbYhAV4q8PX0gKyZ2/M35pI1VbOzNFOQTHM=;
        b=KuaBdal8z68a5xoyEZvG2tYtpmAf/lpTYS+W5/dNp1Z4gQ9xDwWRxigs4/aJrc42RU
         nN49mK1kjShXbmAvjXA+cRGA6D8PRJjw75QSFWC3C1XC1PZvyXfg+0T4yxKbeBguRsJX
         +V4uWW59cxolTAkHms6UFglbzBrgwEKY0FpjhnxmcwfpDihO+93mwE3hlpM/T5QEtMxa
         jdBz/ROceZtqyPGUjmvOJ6hRIVtZNZcxIpKx2o3dCC3FxUa6xLRSia/FJ5tOJNLMC9RV
         c0VbEC5cERgCXfbOAcasBhE2RMaJt6hrWz037i8lmU1i14WGg66MyOrlZHcjq4J2TpHe
         WZlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FnlR5Na3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69308ac7si961972985a.506.2024.07.02.01.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FnlR5Na3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOYRx-0006OQ-V2; Tue, 02 Jul 2024 04:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRk-0006LA-CG
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRi-0005sv-61
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZDjAYdWEq9lylzH3r+bf49l7/u64ItWJffn1TpvICQ=;
 b=FnlR5Na3XYnrGqOdWdjJepg1xkHWkQF7TMNYOcYB9BeBLnDw7ZLaPCEJgh60A2BIr2KI6E
 6X1g1YEO4rAWx5xjx3DnCvgfeaP1B7Zz3/0jmW6B1f0Gsp4Tg4xYS3GrZTRvJZY0r9uNHs
 ZCrDF7pQLemZFWgSvCSseP2nJVvC86o=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-FXacV_lnNkSosm10QHw3SA-1; Tue,
 02 Jul 2024 04:00:58 -0400
X-MC-Unique: FXacV_lnNkSosm10QHw3SA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2AEBB19560B3; Tue,  2 Jul 2024 08:00:57 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 70D6C19560AA; Tue,  2 Jul 2024 08:00:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jamin_lin <jamin_lin@aspeedtech.com>
Subject: [PULL 3/6] aspeed/sdmc: Check RAM size value at realize time
Date: Tue,  2 Jul 2024 10:00:39 +0200
Message-ID: <20240702080042.464220-4-clg@redhat.com>
In-Reply-To: <20240702080042.464220-1-clg@redhat.com>
References: <20240702080042.464220-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 3NXnTQnLwGtx

The RAM size of the SDMC device is validated for the SoC and set when
the Aspeed machines are initialized and then later used by several
SoC implementations. However, the SDMC model never checks that the RAM
size has been actually set before being used. Do that at realize.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Jamin_lin < jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_sdmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 93e2e29ead87..44da085e10cb 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -271,6 +271,12 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
     AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
 
     assert(asc->max_ram_size < 4 * GiB || asc->is_bus64bit);
+
+    if (!s->ram_size) {
+        error_setg(errp, "RAM size is not set");
+        return;
+    }
+
     s->max_ram_size = asc->max_ram_size;
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
-- 
2.45.2

