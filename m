Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603235njc;
        Tue, 21 Jan 2025 23:10:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNtIcONsCwFd4ROPaKJtMZSxA0/u8FiHdGSx0bi+oh990mum9+HXnzLkfiWVVv89t6DaBWSAgTvBRbCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEJtOCiBVDBehkG7kpUQsjMkY3ydLdQm5Z5YfchNDKC5NKKORWc3rftRfE/8Di/JGK+nBnr
X-Received: by 2002:a05:620a:261c:b0:7b6:d327:cc47 with SMTP id af79cd13be357-7be63219ac8mr3739440385a.8.1737529840136;
        Tue, 21 Jan 2025 23:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529840; cv=none;
        d=google.com; s=arc-20240605;
        b=E4tL85lgL+qLk+rjlFNXJKkMYGIQPajkmkPagyq9gChTT+xIZ1mrEWDbJ934TZ8bVW
         tX6ujUHIvsyd5F+bDuQEjoVIXz18SfqGb2fJFwAA/IlvsCFrEtJ4P0tzBftgRHPRbO5I
         ahLFLPg/uahf8z3PgVAQzkM7JYlKutMZvkg2acVmt33QRkvWuMvaqG6Ucy/EevtbK1Y6
         R3+PfPYAif5ukiITtQHnBiAooLztGDS3tFSrZvf3Foz4l2VcnojGl1qsJbBM8YmNF/9F
         BUD0GQWj2eVtUQIxqtYaDIn33edKktpa593Tifp0LQXStu2aDyM15JTrizYHBJnC1/Np
         Jteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7t8xLV1oAxbTo2485dr0ahXFjfD7BJskv2TEDI49Ohs=;
        fh=CQ3JhhEpLx6WUtQxwLyuUdUASVLLkjylcjrkyER1RTM=;
        b=OmCmmLgftBjWEdsP7MmiP4cul+W/Yyq4BnlOlphkllz/SXb76cFni9FZkz9BW/eeC6
         mddkjDJSV7vjBwCYl4dvjHIob9r+qappc9IINobN9cXcCEcNMLAZEgcWTDi028GJNp2B
         cR6TlPrCVWkY1lN5wcx4VZnsPGpNyIrvCfSEGhscfbRkzhMgfErQVp7cY5FmIzxIP+Zb
         4i4EZI9u15RMUc8ePw6UtfWedfDyKNBhaUoB13y3YLXjfxKPsfeduRA5ZQ0ejcowoGi8
         4l7fgUvFuNjzfdoh2tk6kUr5uffwR85SrXRZoxYHr6u/WOe0p07p6pLbz9POjNTF7Pgm
         DnOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R7kjZizR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614e0ca4si1404746485a.507.2025.01.21.23.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R7kjZizR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taUs6-0005Lc-D9; Wed, 22 Jan 2025 02:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUs3-0005JU-E7
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUs1-0008RA-Uv
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 02:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7t8xLV1oAxbTo2485dr0ahXFjfD7BJskv2TEDI49Ohs=;
 b=R7kjZizRG8ISu6rZCiAOjHPgs3ZcJ47Hfw0x+/fSRhiV6FvPH8t+UPXVyqlWFM5Y5X8OlU
 pKKlpgO4SIeedkmK1E81BvcXCvW56iL4Qb+BYs54gJdLLGF2NtEZALPJVuUxvu7tsQ035Q
 rzFtOPhNV465TFWeRMkSvHlW8BNVrDU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-EaxTZQRuMymnzKaOw4H5zQ-1; Wed,
 22 Jan 2025 02:09:45 -0500
X-MC-Unique: EaxTZQRuMymnzKaOw4H5zQ-1
X-Mimecast-MFC-AGG-ID: EaxTZQRuMymnzKaOw4H5zQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3A5F21956070; Wed, 22 Jan 2025 07:09:44 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1F0613003E7F; Wed, 22 Jan 2025 07:09:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 9/9] aspeed: Create sd devices only when defaults are enabled
Date: Wed, 22 Jan 2025 08:09:09 +0100
Message-ID: <20250122070909.1138598-10-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +9tB7iyRyfQb

When the -nodefaults option is set, sd devices should not be
automatically created by the machine. Instead they should be defined
on the command line.

Note that it is not currently possible to define which bus an
"sd-card" device is attached to:

  -blockdev node-name=drive0,driver=file,filename=/path/to/file.img \
  -device sd-card,drive=drive0,id=sd0

and the first bus named "sd-bus" will be used.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 53a859a6e4aa..d9418e2b9f2c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -456,14 +456,14 @@ static void aspeed_machine_init(MachineState *machine)
         amc->i2c_init(bmc);
     }
 
-    for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
+    for (i = 0; i < bmc->soc->sdhci.num_slots && defaults_enabled(); i++) {
         sdhci_attach_drive(&bmc->soc->sdhci.slots[i],
                            drive_get(IF_SD, 0, i), false, false);
     }
 
     boot_emmc = sc->boot_from_emmc(bmc->soc);
 
-    if (bmc->soc->emmc.num_slots) {
+    if (bmc->soc->emmc.num_slots && defaults_enabled()) {
         emmc0 = drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots);
         sdhci_attach_drive(&bmc->soc->emmc.slots[0], emmc0, true, boot_emmc);
     }
-- 
2.48.1

