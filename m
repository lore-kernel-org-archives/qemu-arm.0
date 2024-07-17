Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp621794njk;
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8ysvgj41T84LaFNKiSuef2Z/QWIrRTPE4en5xiY1K88DYO8rzO3iwgR0XzLS6gPhjrIxlDInZ4v9/U3J3e9bkXamTZI/q
X-Google-Smtp-Source: AGHT+IGLfGapLvrStmqzhbn76Ib7Ux/YLokf1ckldWNpzWB+8kqzR7cTGTfFiRgmM7g+SUJnI6BE
X-Received: by 2002:a05:6214:768:b0:6b1:e371:99d9 with SMTP id 6a1803df08f44-6b78c9fa0c5mr9432856d6.8.1721197909131;
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721197909; cv=none;
        d=google.com; s=arc-20160816;
        b=c9EFMSwYabdUl+1m9wdHzKuxIwrcD6OtJGVjz23Dp7cmUgfGKngzR0HdVYqJKiPt+V
         EiGysTmHs/DjUR4lS7jDQt8rkCzMdfjUDD54cpchTuamnYRGSHTp4QvZdu/LL33gAkzR
         W3nXYj3K6UUI+eN1P+f0VRcGO+TN0h7942XnK+5QnS/EkDR51B8kVTzhAK1mDqqW0rNk
         oLgWurvtuJw1IsQaM0SsbyWZw/F/mh0Rg3duRZs0ccP/eX11JPaqgnYxKHjdlfoT4HjA
         Ev4dQz5VHrIzGqX9vyE996RWWgveLxSymMP6rrOncWRvlcOCDmpi1oLiFZK64w/UPag+
         Ynfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WV5KxT7XX3IKOEI3W8/ZDwlY05sqrwN2WarQtnyg3WQ=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=lHmclAf6BWXmgVLJC8TNwfvgqug5PeNSIuoEAxhrI1iXBIXwY8Zl54n/tZuEN5OwEP
         eVBfInxuFw9wHrCTEhyxqJyEC+Pnhfrn4O4eCLYqI4SBWiaGXAgMCgbMr22QWHaCU/Di
         JyOIlIfKNAfWNHSVwTAxuZvyFNiR4FJej5WArz2oEDUFfYh49h/zfDxRCh8085POMqKd
         6T/u14VUS5WFj7YhDn5wLZRThOb7wOx2YaQdMUWv9fYUh3BZbiGL0ZAyWirD/Mns5hzO
         xq1+rBBLT+z0ddrfikNQ6wv6+PIj11xfJ78Fyj0PotmOlVBHOZDNPTdL/IjG/qCCycXh
         fAFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WEnd+JBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b790171d91si4485066d6.249.2024.07.16.23.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WEnd+JBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTyBj-0005mT-VS; Wed, 17 Jul 2024 02:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBg-0005c3-5B
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBd-0002wx-Ll
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721197848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WV5KxT7XX3IKOEI3W8/ZDwlY05sqrwN2WarQtnyg3WQ=;
 b=WEnd+JBElUN3EuPoBWjMDggQc52jSpuVjCqIesSJuWfxn8I5KcyKxhs3viOa07biMCWBu3
 kvblCiewI1hHpafcfhbL4Ramvz27ortohb0CHS2wPKBARwSXuCeoH2WZ5R+dHg4OKISRbf
 g/nuzKEooCs4CLjknnDVWJxxWTh4ow4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-Qe6eEInzNJG30ypD0hiPbg-1; Wed,
 17 Jul 2024 02:30:42 -0400
X-MC-Unique: Qe6eEInzNJG30ypD0hiPbg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ECCD8195608B; Wed, 17 Jul 2024 06:30:39 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0C32B19560B2; Wed, 17 Jul 2024 06:30:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/8] aspeed: Change type of eMMC device
Date: Wed, 17 Jul 2024 08:30:15 +0200
Message-ID: <20240717063022.549849-2-clg@redhat.com>
In-Reply-To: <20240717063022.549849-1-clg@redhat.com>
References: <20240717063022.549849-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: U6TOAxObRkYX

From: Cédric Le Goater <clg@kaod.org>

The QEMU device model representing the eMMC device of the machine is
currently created with type SD_CARD. Change the type to EMMC now that
it is available.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 53a4f665d0d0..105b990233fa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,14 +327,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
+static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
 {
         DeviceState *card;
 
         if (!dinfo) {
             return;
         }
-        card = qdev_new(TYPE_SD_CARD);
+        card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
         qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
                                 &error_fatal);
         qdev_realize_and_unref(card,
@@ -436,12 +436,13 @@ static void aspeed_machine_init(MachineState *machine)
 
     for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
         sdhci_attach_drive(&bmc->soc->sdhci.slots[i],
-                           drive_get(IF_SD, 0, i));
+                           drive_get(IF_SD, 0, i), false);
     }
 
     if (bmc->soc->emmc.num_slots) {
         sdhci_attach_drive(&bmc->soc->emmc.slots[0],
-                           drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots));
+                           drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots),
+                           true);
     }
 
     if (!bmc->mmio_exec) {
-- 
2.45.2

