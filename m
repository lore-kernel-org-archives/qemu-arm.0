Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp125688njx;
        Wed, 23 Oct 2024 23:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVv9d/JtAdELHonGBAzrcm8FuNGZHWWeVjwWM8UeYFeo9EQIoIQZoep9MxdftoicGbbq59DSzHMwG+FgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmf5euWaFo2Rhg93tkD9pngCM5ESbSheFaP1wVl8bTioe7NOWxLMxe9htgPr4NNPb8VUAq
X-Received: by 2002:a05:622a:1184:b0:460:42f7:fa44 with SMTP id d75a77b69052e-461258c90b8mr8243401cf.9.1729751795561;
        Wed, 23 Oct 2024 23:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751795; cv=none;
        d=google.com; s=arc-20240605;
        b=LhvXXcEIxwK4HiKcZ540egJjB9Yu787ou221WzfyVv1HX4rqS0KpQvgqX0TdFFxQz3
         5BaNGHzxddzFfmbjJvbqu2AKBCAd0UUhSKYwbg6d2INOnUcV5vWQHhecpYeP+7+OEj5Z
         4lZfZJBSTjwIFkqnNjonVpBjL/W8RmexL0dRQB0OH8BMNGG6TW/2p4Dtm3SxdKKFE0RM
         To6x5x6sfPsKGAgXLrWLrN/qwIyptGjjpffcTHiB9fz0jPIQeLjjzrqOl6jJHyDK2Y13
         PIfPdIelzTysAh9JcwvFi6JE7/FBSf+1WT4MiZ6/ZrwyHmAwUTqV0puh4/eBjkHYayPF
         B0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dz9eus43YaOTbFmpnNZYCZrYtJzVxK/RebpUmJSWDcQ=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=gNOX3ITrgu8805QKbGgl3eJxjitkjuvmPQTVvHcJo03zA7Tg40ia3XSfvfa4BOyEtU
         BsjeVeEU1nHq4CaijYhBmLIxHPcvglE3PgYNO3gLlZBNATiaorsZRfrG9zDw67X16S2W
         WzB9rCJFDTNfN3dhd78HZLWcPG6SbZBmsU0KbwcJ8up+EFyGsamnREbYD/mXyP01yat2
         THHvpkgM48/6U4lDUD1bbn0/3R97ZmukGKco6gIOMdXZa1Z/9AnvMS4YPam+NR1PlE+0
         5P0VVwetO5fnXg9HA46rOMdmJF5Bqp3JVwepyTdyLvDN68txKFsf3gEEVFof6g7ff07i
         7mOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWTvkMnz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b37370si114112181cf.102.2024.10.23.23.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWTvkMnz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3rRs-0002Me-HU; Thu, 24 Oct 2024 02:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRq-0002Lr-UJ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRp-0003TB-I1
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 02:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dz9eus43YaOTbFmpnNZYCZrYtJzVxK/RebpUmJSWDcQ=;
 b=LWTvkMnz3t1wOWdkLcHHoWfHzcY3Bcgl/F9mdV/x1M4egp8V2IDQ0sugg8hGegYoBqYtPm
 cc9ALwvpC2wMTExjFHLDadqF2rlYuQ/dBvpPm5Vz60phan9qztX4DBRbXoSj0p8rFbWq3V
 2MxxQImGKdWqnIdhYqg43onPjmG+At0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-omnxaOOhMx2akwpPscsQpg-1; Thu,
 24 Oct 2024 02:35:51 -0400
X-MC-Unique: omnxaOOhMx2akwpPscsQpg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3062919560B7; Thu, 24 Oct 2024 06:35:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C566D1956056; Thu, 24 Oct 2024 06:35:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 15/17] hw/arm/aspeed: Correct spi_model w25q256 for ast1030-a1
 EVB.
Date: Thu, 24 Oct 2024 08:35:05 +0200
Message-ID: <20241024063507.1585765-16-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.697,
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
X-TUID: 0jZxtcpKOuMd

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, the default spi_model was "sst25vf032b" whose size was 4MB for
ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
ASPEED shipped default flash of spi1 and spi2 were w25q256 whose size
was 32MB.

Correct spi_model default flash to w25q256 for ast1030-a1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cf0c6c580b2a..bf68224295f8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1643,7 +1643,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     amc->fmc_model = "sst25vf032b";
-    amc->spi_model = "sst25vf032b";
+    amc->spi_model = "w25q256";
     amc->num_cs = 2;
     amc->macs_mask = 0;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.47.0

