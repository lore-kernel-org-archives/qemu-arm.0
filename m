Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1283710dlb;
        Tue, 18 Feb 2025 23:20:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVigtP4nvUAVwUfaXJDRfe3tzaaTGS3j2La3xT8i0hnIiLZVx/uIEZGxcP2o1eSlh044n9sQs2W4rYDFA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhkcT6HFszDwM5nIentmo6WtF2cEDtHJ/73WoLcXIyEumCq/xKcVnzMz5OgJfaCS6V7HNY
X-Received: by 2002:a05:622a:588e:b0:472:744:e273 with SMTP id d75a77b69052e-4720744e63dmr39046031cf.42.1739949640761;
        Tue, 18 Feb 2025 23:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949640; cv=none;
        d=google.com; s=arc-20240605;
        b=WkioMBh9E+6F/gKNn4pHBs5kr/uT64ttec+ziW9hMChreWUGuVSYrZF7Nbhq10HGrY
         9YjW1xkKlGbLnSLTmxSHbAQKdg1vNEcGUILYoONN5wlLhcFxlqIU6quGf3fY2vCkYPMW
         So/QDBeLK5GYvYQfUpiBCS/jmqcwJ7GRFKBwNsZyannQ5dDe+4YkjfzrBwAszDnjpMM0
         /NOfckARnBMJW3GWfIP3VyG5u1plpewtE6IqSOePWUuJKNhw+SDloBxG3QBq5REpejk6
         ECUwopgjfWmzUv1J4GcBO/dPVEjiTlVH0wJacSkHSDeH/8xlzZCa695e4A6WO6YdmEk9
         r9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=j74KkKfsiXWe9RmX/G+DeA7EG7geeCM0qMvOSE7b7e7ppDLEne4zsun0K2FkTugVrG
         g8qx96SWzJTcXPX9hfiMR5m/H8Y6dBpMIv0lqd/Y5ZMD6K0T2swWXcmQXoI2PkbNp4dR
         3T20bdIBPPz33Isl4jd7afYIzl0XKWeKmbO13I3AgZU8Zs09WijpCc6UEOWO6dWVO5zA
         8WEWVSOGPstXqPgzorDVPrrYMprfbvwHe5VExQAXM9XGZaFv5d4HNG5s2itBG/+AfHOm
         7CpyHNb9HHDXwDsbCveMBwOPZOGJkVVvGYBFgmmyxGAmS+FUIuCRQV24uh8/5GxpFoBa
         /QWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c+7oRsFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471ffa83c85si31936171cf.248.2025.02.18.23.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c+7oRsFs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeJb-0003bw-4V; Wed, 19 Feb 2025 02:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIV-0002Mb-9t
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIS-00054k-BE
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
 b=c+7oRsFsdC4+RrIOQT4z3/8NEsOC8Gv66cC65/STrJOsEEhdW6rxMstnaLr1tt4KsGhFXS
 FcIX+3CbMpnV4hqDdQDT/n/t/UUIWUTn94UVOVAVJlPMdLhAXI0O2gLZBrGAdyOKsAvHzY
 HNQcMxGuvgCv0LnOH/3399CQNA+dBow=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-E1UGmBc6P9eLCO3xP2U38g-1; Wed,
 19 Feb 2025 02:14:59 -0500
X-MC-Unique: E1UGmBc6P9eLCO3xP2U38g-1
X-Mimecast-MFC-AGG-ID: E1UGmBc6P9eLCO3xP2U38g_1739949297
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B249A1801A17; Wed, 19 Feb 2025 07:14:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A0C3A1800362; Wed, 19 Feb 2025 07:14:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA0E61801A9A; Wed, 19 Feb 2025 08:14:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 12/24] hw/uefi: add var-service-pkcs7-stub.c
Date: Wed, 19 Feb 2025 08:14:14 +0100
Message-ID: <20250219071431.50626-13-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
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
X-TUID: 2s/NluZhk1bf

pkcs7 stub which is used in case gnutls is not available.

It throws EFI_WRITE_PROTECTED errors unconditionally, so all
authenticated variables are readonly for the guest.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-pkcs7-stub.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 hw/uefi/var-service-pkcs7-stub.c

diff --git a/hw/uefi/var-service-pkcs7-stub.c b/hw/uefi/var-service-pkcs7-stub.c
new file mode 100644
index 000000000000..118cba446d4b
--- /dev/null
+++ b/hw/uefi/var-service-pkcs7-stub.c
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - pkcs7 stubs
+ */
+#include "qemu/osdep.h"
+#include "system/dma.h"
+
+#include "hw/uefi/var-service.h"
+
+efi_status uefi_vars_check_pkcs7_2(uefi_variable *siglist,
+                                   void **digest, uint32_t *digest_size,
+                                   mm_variable_access *va, void *data)
+{
+    return EFI_WRITE_PROTECTED;
+}
-- 
2.48.1

