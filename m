Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2724794njd;
        Tue, 1 Apr 2025 05:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRMxfBEH6vjg1w8imAyS363k5BQpIKfcEymdbo30uV525K/m62DXTjszed/wUWn+dDOHNn63zcJq/eNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGtbOMD5R8DqMm0S5nSn8M5GjveFReY3dMi5C0ouw4STIpWln2YLcCc+rU3HxOvJtEdy3cO
X-Received: by 2002:ac8:59d0:0:b0:474:f97d:51c7 with SMTP id d75a77b69052e-478f6c778a3mr32429661cf.14.1743509695332;
        Tue, 01 Apr 2025 05:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743509695; cv=none;
        d=google.com; s=arc-20240605;
        b=ez4gfi+cC06TNb4Gw/aK8NfRiWRwhB4E9cqiUIpvlufWUjOA+WDGVV0HnGCbBoDVhq
         WCOb75UVEzjuaONwejsAjDKDFCGsttDl5T/pkLpAr+MQn9HgMOgLRElE4RJkUoe1MGH4
         iQJO6Yeu6+5PFrI7J1MblFgDmBjr5lqMnqauE0fxCGG8ecG6UNeSAMWwodc4NGmo5eqA
         4PU3+L7DR9gViEmkyQ85SUen1XuMZnVn80q2wdEFQ7bLNSd0wUTQa3NkYL49Dzu69ac5
         HPzI7imvJz11m+8VKZI222YmKnMpT9Ksn1TQ0jZ8Lk1rtlsHAlJ1QfNdZH9UVtPmCOXS
         1B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dKaWrx46T3xqbSdOVgY4n2L6yvjmlCUhAgoIRBKISKA=;
        fh=WIPCy3PQLI9DGdam15Y0bYKwx79wwx5ZlolhSR3FUtg=;
        b=K6YcvIsIRdEDU53Ck4Jv776JCqHLDLedsLbWZCzatfsLsszFJD6I9FoeolE/5P4dIk
         NgHjsIi66w+nDoP6OEG/60ixkUSMG06P1zNWlDNho2OTIUs2+tAI75rkPLANG4yl0ZWb
         OkL1K8nprmup2hoI0kTDon+r+DFAtJarSPXtVdMy3zrfVjI64RaJAUwp9q/Rw7sP+hsy
         e3Zf8tQN908EI8+fOD8beda+Si1cLS79amYZpLg7Gt1Hnirsoz+ahZ+uY47ld3COpXk8
         PcFjKoZZM8RtiuE/rcvxwT2h/whCdYYnw7nWqd/pK5+TtN5oqCldtjZ7R6vFwDG25Eoq
         Rz+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PGkcyh18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4778318ac2csi86453331cf.579.2025.04.01.05.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 05:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PGkcyh18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzaVJ-0007bx-Uy; Tue, 01 Apr 2025 08:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tzaV5-0007YQ-Lz
 for qemu-arm@nongnu.org; Tue, 01 Apr 2025 08:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tzaV1-0007rn-GP
 for qemu-arm@nongnu.org; Tue, 01 Apr 2025 08:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743509626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKaWrx46T3xqbSdOVgY4n2L6yvjmlCUhAgoIRBKISKA=;
 b=PGkcyh18pw4IxixpK82AWHUIL6a/MCnyLlcxSl2h1AtrFle5zTywwaXIclAeM4w8Pums2k
 NqNtPmyJQSl2Cl9kQDfd3ms5yFiRmODXvl+chSZOfgd5cg7kyV2w8typKteQj058izeW21
 1nVdj7pn4ePQwUOM4q9DDmP2QdrUBtI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-V8nuX2LYP0GMDGVp-zlp-w-1; Tue,
 01 Apr 2025 08:13:45 -0400
X-MC-Unique: V8nuX2LYP0GMDGVp-zlp-w-1
X-Mimecast-MFC-AGG-ID: V8nuX2LYP0GMDGVp-zlp-w_1743509624
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A66C919560BD; Tue,  1 Apr 2025 12:13:43 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.20])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8F0D6180B488; Tue,  1 Apr 2025 12:13:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 1/2] hw/misc/aspeed_scu: Set MemoryRegionOps::impl::access_size
 to 32-bit
Date: Tue,  1 Apr 2025 14:13:35 +0200
Message-ID: <20250401121336.788924-2-clg@redhat.com>
In-Reply-To: <20250401121336.788924-1-clg@redhat.com>
References: <20250401121336.788924-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: gT77w3cSOQRx

From: Philippe Mathieu-Daudé <philmd@linaro.org>

All MemoryRegionOps::read/write() handlers switch over a 32-bit
aligned value, because converted using TO_REG(), which is defined
as:

  #define TO_REG(offset) ((offset) >> 2)

So all implementations are 32-bit.
Set min/max access_size accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/qemu-devel/20250331230444.88295-2-philmd@linaro.org
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 76cfd9167161..6703f3f96914 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -427,6 +427,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops = {
     .read = aspeed_scu_read,
     .write = aspeed_ast2400_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
@@ -437,6 +441,8 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
     .read = aspeed_scu_read,
     .write = aspeed_ast2500_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
@@ -779,6 +785,8 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
     .read = aspeed_ast2600_scu_read,
     .write = aspeed_ast2600_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
     .valid.unaligned = false,
@@ -906,6 +914,8 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
     .read = aspeed_ast2700_scu_read,
     .write = aspeed_ast2700_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .valid.unaligned = false,
@@ -1028,6 +1038,8 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
     .read = aspeed_ast2700_scuio_read,
     .write = aspeed_ast2700_scuio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
     .valid.min_access_size = 1,
     .valid.max_access_size = 8,
     .valid.unaligned = false,
-- 
2.49.0

