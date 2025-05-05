Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2305156njj;
        Mon, 5 May 2025 02:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGGh3yzaciS0n3YBLo+dqPPV9t/qtcV5eSnvxmO4JJYRSLPw8CeIlgnJT4U1rEkfo91pBGy2JY6nXueA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZXF7+42OgJbK/Ua5LHZS8pwj05iQA5iOdw8m8EfUVO9M3ezkIiyYUy/MRDPrTIpzvULE7
X-Received: by 2002:a05:6000:40cc:b0:3a0:7f85:1905 with SMTP id ffacd0b85a97d-3a099a84a2fmr8184357f8f.0.1746436092807;
        Mon, 05 May 2025 02:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436092; cv=none;
        d=google.com; s=arc-20240605;
        b=KjR3qQt8wMBcYGv6WWc9REI0KaFzm2hPpFeLc/fp3WXmeTHAKqfqw/LGR8WyCcH0fy
         BCb4TeYfpOMbORpl9CVu3TGLT/9aQbeM/y97t9rUD+NA7po3SdP1BZI0ne8Z5uhwQx8U
         4rwYBZcdQzzF+gxPTXsrIrc4MTm/+rxb812jnp+ytQjwimozmGq9+VqA94gVKpYcC7UI
         9u/46wTqwsmz1H2YICxhOV5k/zs+UCJ5TeKC6UrXmHOu8FSvYIU1HJWGVEaQvY7S6KAG
         roLS9aLMLr9wczRjZah4zCDXrzCoW5VIpLMr3DCE7OJPOPRqezDEeSv5caP4hdk18dVf
         dUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ndy2Ykgwa4f2bXKuASZKwwvf683tvWgDwjTRq87uv3o=;
        fh=S3gdPAiuQofc6XuyuicOEHGaui07T1HuRcG/zIvJM8Y=;
        b=LN4lH8XPomU23f4meUHcK/+QzGbyEUkbSBnfhhM0IP8KNK598rPLEbn3VcHHT0GQn5
         p85FD5DPytskKPRTjQWyo2hgKSjL75VFfa6UqJpnvO8J8b7o5rDpPSRo/pEse5UwnL6I
         8M6wiUdwhR9mcpKmEs3FWI9bonUVkzUWiFk7Mlo04QpKBeJsm8Y4nuXYa69JN2IqCoD+
         TJjbNleDKxDSir2uunvFShSFowtDS5rVth9cL3tcb++ZgYPVDMYrtSN1k9Izc3XCGOTC
         k/Ks72CvO7QUZA7gXxzn7C5NT7I+5I8kaMLdngpfEWzUhnpKT0UmDJVozP7aQEFp2OX7
         Oq0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eq5HqGnV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099afbdd2si4867779f8f.355.2025.05.05.02.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eq5HqGnV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrnb-0008N7-Hm; Mon, 05 May 2025 05:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmn-00060A-2x
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmi-0006Bu-Dc
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ndy2Ykgwa4f2bXKuASZKwwvf683tvWgDwjTRq87uv3o=;
 b=Eq5HqGnVM/51n5Iwbc0JNSVJhguUg0nbLGLt7rOQMugg/nyzkrtGZMLWMcyJKm8L/SGekt
 3jemvQs019gWSjekyDHeU+9Old5tjOpjC2K2f1OaC6dITwWJ4UxuwnFSRO9CzqhiETtWJq
 zinjIvyyN0q82Z1ACXSUYbV/jbpZTtI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-R-vhWU1nPcuKWhFV0UejSg-1; Mon,
 05 May 2025 05:06:46 -0400
X-MC-Unique: R-vhWU1nPcuKWhFV0UejSg-1
X-Mimecast-MFC-AGG-ID: R-vhWU1nPcuKWhFV0UejSg_1746436005
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4DFF31800873; Mon,  5 May 2025 09:06:45 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 20E3B30002C5; Mon,  5 May 2025 09:06:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joe Komlodi <komlodi@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/23] hw/ssi/aspeed_smc: Allow 64-bit wide flash accesses
Date: Mon,  5 May 2025 11:06:14 +0200
Message-ID: <20250505090635.778785-3-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: TCD8Y3p5UZmR

From: Joe Komlodi <komlodi@google.com>

cde3247651dc998da5dc1005148302a90d72f21f fixed atomicity for LDRD, which
ends up making accesses 64-bits wide. However, the AST2600 bootloader
can sometimes compile with LDRD instructions, which causes the acceses
to fail when accessing the memory-mapped SPI flash.

To fix this, increase the MMIO region valid access size to allow for
64-bit accesses.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250422002747.2593465-1-komlodi@google.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 0d38f95c7a39..614528b8ef65 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -359,7 +359,7 @@ static const MemoryRegionOps aspeed_smc_flash_default_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4,
+        .max_access_size = 8,
     },
 };
 
@@ -670,7 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4,
+        .max_access_size = 8,
     },
 };
 
-- 
2.49.0

