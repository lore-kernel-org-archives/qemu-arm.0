Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319169njk;
        Mon, 27 Jan 2025 01:44:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9/4zbw1Dlcpor8B7nAbvjRP8SpbYTAM+vPEVJyEXQOkMlr5JccXC6gxybn5ZRhODsRgA30dcHlCiPVA==@linaro.org
X-Google-Smtp-Source: AGHT+IGW8b4Ab/2U53XXLapXw/snmGR9nnhiMn7Tu2H83JBMWawjHlfKjhuiz9KAuHqGEuAz92kD
X-Received: by 2002:a05:622a:1496:b0:467:6375:6884 with SMTP id d75a77b69052e-46e12bb3e97mr483357471cf.48.1737971052077;
        Mon, 27 Jan 2025 01:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971052; cv=none;
        d=google.com; s=arc-20240605;
        b=Ng5vYjuKZvbhVr6RvKj63PnxDjgzmhwNdf4I/gaZ7SG22vf7cniR6yD0+0a5JTm+QH
         BFLD72/8lrhnXrSeSmZ4GgenmNwxI0ZvW1mUuENxy+N8eJ9WNte3+2GeiUeNIxKVEp+h
         fTdSm/fhTe3vHHDJoMTqHBrTMSsGyOAHIha5GVE/EpHknNGJrVswZklZ6hni3tlDeKlA
         IIVmRJWTdGmtTNhRY3r1Km3isI2VYcCe6mjKVPTRdWpPQ9Pd/C8FB5R1Ph3R2ZJr/jiO
         2Xie+Qnabd/XWHULBOyqL/aLuq+4331umYb6yFsWz49nAy2kLVXPvHfOSRBWoWqtiJaA
         nvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ld4QsWPuB3Hp8e8mg+d87KCgmjd8JfHeB5cd+waxL7g=;
        fh=FQrS4v4bgLRaZq8+ytNm/QU65PSoAG+Wycly6qiSP2k=;
        b=XMgOVL9ppeP+gLDSs+tRPRGTWDZsXiYHKDPhXOK8x5DCHBfBKcHzhljB64Voc0uLYq
         s+DIugpqdGgBwXyjO2XMClbeAdpZ/hNsoEDhFpcu46wxSbEsVP0zemVc99j4gdGsan5x
         HW1mHvANGKwWFnwLqMvldC2+H6a0U2tu0RzhWjl5jkAivQbDPDitLTD6LYMTUEIa+Oim
         SHvtOCXPtK1QCfZOJn8PwZcU0STd+7nDE7z9l696V5WIiXlRk03Ja8zwYSURn01VvvAx
         UgQrNEfMDEbveY2NiDt+yb0Y+fQJIQWROli6xYc6aL9T1agVEBPxt9zJfOlsKd7tlvgF
         bF4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8vctc0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b84da1si91413041cf.367.2025.01.27.01.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8vctc0n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcLeq-0006hq-NH; Mon, 27 Jan 2025 04:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeN-0006SS-Es
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:43:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeL-0005Sn-7I
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ld4QsWPuB3Hp8e8mg+d87KCgmjd8JfHeB5cd+waxL7g=;
 b=L8vctc0nlqFx8qHSY3JTy083RqGC/3Pab4/vkEDzl5fsVNs45yorQyvCy4ZwEGWaHEps08
 TPok8kCeiA/UE7n5qdSqC2sj8raRylah8OY6zSdckDaTUUDBx/GylWh3eU+Fcnyi7Vj6Ma
 qP1XfY5UZfWIAqnsmZPp6YZ6fa40EF0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-46qHC0x3MIaQZrEiucZMVA-1; Mon,
 27 Jan 2025 04:43:15 -0500
X-MC-Unique: 46qHC0x3MIaQZrEiucZMVA-1
X-Mimecast-MFC-AGG-ID: 46qHC0x3MIaQZrEiucZMVA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7701B18009B7; Mon, 27 Jan 2025 09:43:14 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ABF6D18008C8; Mon, 27 Jan 2025 09:43:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/12] aspeed: Create sd devices only when defaults are enabled
Date: Mon, 27 Jan 2025 10:42:36 +0100
Message-ID: <20250127094239.636526-10-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kvnrUHdSq32k

When the -nodefaults option is set, sd devices should not be
automatically created by the machine. Instead they should be defined
on the command line.

Note that it is not currently possible to define which bus an
"sd-card" device is attached to:

  -blockdev node-name=drive0,driver=file,filename=/path/to/file.img \
  -device sd-card,drive=drive0,id=sd0

and the first bus named "sd-bus" will be used.

Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/qemu-devel/20250122070909.1138598-10-clg@redhat.com
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

