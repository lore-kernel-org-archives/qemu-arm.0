Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5869756njd;
        Mon, 28 Apr 2025 03:27:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRvfWDOIwVHek+c/HfSrAJwMeNKiuuEdNyLjN2tIpAEXcUTJMAROVRZlIRoGIcKfIrU1eGgnrkhq7TpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5YixcDhI+CiJ8XpPKx/MViDvdLoncUwtlNUEFRSUI4WwnT92t2KOr/X6cv07KY8nuNb53
X-Received: by 2002:a05:6214:19e1:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6f4d1efeda2mr151152506d6.16.1745836032705;
        Mon, 28 Apr 2025 03:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836032; cv=none;
        d=google.com; s=arc-20240605;
        b=lyRjUz4xuShqJOMAhp9cIx3reiuaiuLCK2h5GUV85Y/Vtok1iFy7VwAoRa34GYdIOR
         0KYaiaLZymn0mLGpm6Uqyjp7CFFIAsg1xPSiCrkn8GNUxnB5RnplRN/kf0CtGpVuLFwv
         ahqemAao33e4UVQYZmNGFoTwNSfLmCFPUul8lMWDKhzXdpqxj0LtcUOYMrvKS1nHw5V5
         g6CuymXFo6DU14SMoQtmTmEW4vdTDvKQJIZo3Ronhhy+DTyZKALmNz4VJp9vtjhfULM9
         +HGBLORU12sI/QQVh0oD4R9xmEsaBp8LLce9W2nZK+Pb9/ZrnMfTBSVz0gsCV6vITtrp
         houQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LeJXJwfY19odADe3uaP+XnIF7D9OuwkP8OljrGWEpNc=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=ZyUHVT7c6OuELmJHIm9R2pc3qlVw8rkO6JhuohBg78fD7PqPqc6Bmo9uQYpAk9AhmX
         FSTlO9QhWSKhHR92XAdh0PjtL2I3Hss3IJ/+C4rfMgLuPkPgijz1/J/aPot9oo5fq0Xt
         gL7Ry5dS3ubnO4wnT2sgQbeleDYB1ttZ99VdxZ60zhvqyKlttqLQnzvb3J97pPVRykNZ
         H8GkY4d9Wn7wu9XWsL2LI5CNTulKlWDWkeK/wApm6WIn0Gtg14lYNZZR2m8v/ejdT2s3
         sn4bfqzm5aa/YcDVoE7x9Czw+OVo9AoyCXZvz35rSTCkDzW/NFx9c1MWPtoprmQ/nNI1
         Az4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W/+J/nBG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea2bab6afsi99675771cf.662.2025.04.28.03.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W/+J/nBG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9LhX-0006fn-Qu; Mon, 28 Apr 2025 06:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhT-0006Q2-DC
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:27:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhR-0003H8-7R
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeJXJwfY19odADe3uaP+XnIF7D9OuwkP8OljrGWEpNc=;
 b=W/+J/nBGJYqenULvV8n2OEI0ryyf1n68db59hWF/yoEEcZReyIW5ccHzYqM2/YvJx70Mo2
 ViUXlMfWcKYdOjbgjH1vI0EGTj/FREXKr4vasiR5HRJRRGwoFzaLGlhNebtMipTI1/HqIf
 6lVuv8UcVy2sM8lFAyeTbhfsZCXJdWw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-K1vl_8BNMwi369vXV6Llfg-1; Mon,
 28 Apr 2025 06:26:53 -0400
X-MC-Unique: K1vl_8BNMwi369vXV6Llfg-1
X-Mimecast-MFC-AGG-ID: K1vl_8BNMwi369vXV6Llfg_1745836012
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E1D2E18004A7; Mon, 28 Apr 2025 10:26:51 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D196D180045C; Mon, 28 Apr 2025 10:26:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 03/24] hw/i386/acpi-build: Fix build_append_notfication_callback
 typo
Date: Mon, 28 Apr 2025 12:25:29 +0200
Message-ID: <20250428102628.378046-4-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ygxoL8YSpmng

Rename build_append_notfication_callback into
build_append_notification_callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/acpi-build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3fffa4a332..85c8a8566b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -589,8 +589,8 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 }
 
-static bool build_append_notfication_callback(Aml *parent_scope,
-                                              const PCIBus *bus)
+static bool build_append_notification_callback(Aml *parent_scope,
+                                               const PCIBus *bus)
 {
     Aml *method;
     PCIBus *sec;
@@ -604,7 +604,7 @@ static bool build_append_notfication_callback(Aml *parent_scope,
             continue;
         }
         nr_notifiers = nr_notifiers +
-                       build_append_notfication_callback(br_scope, sec);
+                       build_append_notification_callback(br_scope, sec);
         /*
          * add new child scope to parent
          * and keep track of bus that have PCNT,
@@ -1773,7 +1773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
-        has_pcnt = build_append_notfication_callback(scope, b);
+        has_pcnt = build_append_notification_callback(scope, b);
         if (has_pcnt) {
             aml_append(dsdt, scope);
         }
-- 
2.49.0

