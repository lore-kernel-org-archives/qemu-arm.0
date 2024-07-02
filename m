Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1803336njm;
        Tue, 2 Jul 2024 01:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW74Q6GiWFQQd7dfXr/pxvw8WmBaUFq3GULE2rK8W4IVHwYcTGuSZP6BwotsxbEtcjAb9ErZPD5VtT2RWt/ZNOGIKhLD0vr
X-Google-Smtp-Source: AGHT+IF50ytkwg3JWY2O3NTgnBqu2fTZmPHcBM7/IxnhUTc8BFV3YLoP429WF+SNKQU4DUlNBpnf
X-Received: by 2002:a81:9286:0:b0:63b:c16e:a457 with SMTP id 00721157ae682-64c71802fe7mr82971987b3.13.1719907353847;
        Tue, 02 Jul 2024 01:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907353; cv=none;
        d=google.com; s=arc-20160816;
        b=lkJy+zz1mtYWOsU10ImrPXnD/fPe2x7fQVSrQ++qsv2QxsPLPB9crCHfLw2mNDMTmz
         IzY0tgDBUrUrADzSz392t1gFhkoDmfCRHAsijlIqVlWzmkFcd/ggq0DzGYUwFFHR41Da
         J3KBrTQmzXNV605uZyDs5XKHtbC6tsv7e1ozlIz1wAxOypkLujsmQJQY5nu3tUZgV2V+
         2mqBeg+ZfxaZuP19sY3g0xC03iZaaI4VBBPBqf8Nk84MNk2vzgKFVxcxKLQ3s3aUz3C9
         2EY7ZaBZQs2PHSGjm0/kpf4dmwGFG9nuoVq9J+7kTaXycJBgoGhFm2tC4NYcN8xFAJ+y
         HEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z5tqltcXsgUG44t78KWWfCoFY96TbP+/6a15niwYQlM=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=LyHP2ufHl0SIsvfR1/gchoWFT8m2wA1u1f/LQGfzCVMny3zIQoB/3CRS8e3Fd8Ib55
         D46S02b+UKgGWz2393swY2OXMpzBNqX0UCUKzPklbOEHg5xAyLa3hLjfSjo6AhxfUZCa
         sdmah6FxbyldW7/e/6TrzRHrpfSkpQu5tUnPu91RaG7EYw8rsEYg1X4sgNeFIhaWH3fo
         kXJoTvhdJQ4uMTsfow+Y9z9PXruL07Nke/gy/W3jq0iiSFAqBXpU6MTwBpt+QDNtyl7S
         pfUrCdJMQdHaFX/UrPrpexjWbnVDfy1oPcb8vA4y+CeKg28NcxNum1YsLj12USyzNJjc
         2rwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nb5y0g5g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514c0f37si95187651cf.539.2024.07.02.01.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nb5y0g5g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOYS1-0006Q5-TL; Tue, 02 Jul 2024 04:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYS0-0006Pc-8C
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 04:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRy-0006f7-LC
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 04:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5tqltcXsgUG44t78KWWfCoFY96TbP+/6a15niwYQlM=;
 b=Nb5y0g5g+y4B8yrZqXcUKsdFDA9t79caOG2Ov73XzPtjT6XzZVMIV9569EFv83/LTI9gCv
 P2l8M2gyjc+YrHTNqt6Qh25z1R9UWrg2FU3BTyNYn84sdvsDcYGTG6inXj6DNLjGlUTCbI
 uQ6tNl62ImphL6tdApV9LTpewn72jgQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-3LJXy6tiNvCeZrk2nI3LqQ-1; Tue,
 02 Jul 2024 04:01:11 -0400
X-MC-Unique: 3LJXy6tiNvCeZrk2nI3LqQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FAF91955E75; Tue,  2 Jul 2024 08:01:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 12B2C1955D82; Tue,  2 Jul 2024 08:01:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 6/6] hw/net:ftgmac100: fix coding style
Date: Tue,  2 Jul 2024 10:00:42 +0200
Message-ID: <20240702080042.464220-7-clg@redhat.com>
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
X-TUID: g4tLpksUne+4

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Test command:
./scripts/checkpatch.pl --no-tree -f hw/net/ftgmac100.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/net/ftgmac100.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 74b6c3d9a75b..25e4c0cd5bfe 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -238,7 +238,8 @@ typedef struct {
  */
 #define FTGMAC100_MAX_FRAME_SIZE    9220
 
-/* Limits depending on the type of the frame
+/*
+ * Limits depending on the type of the frame
  *
  *   9216 for Jumbo frames (+ 4 for VLAN)
  *   1518 for other frames (+ 4 for VLAN)
@@ -533,8 +534,10 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             break;
         }
 
-        /* record transmit flags as they are valid only on the first
-         * segment */
+        /*
+         * record transmit flags as they are valid only on the first
+         * segment
+         */
         if (bd.des0 & FTGMAC100_TXDES0_FTS) {
             flags = bd.des1;
         }
@@ -639,7 +642,8 @@ static bool ftgmac100_can_receive(NetClientState *nc)
  */
 static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
 {
-    /* Polling times :
+    /*
+     * Polling times :
      *
      * Speed      TIME_SEL=0    TIME_SEL=1
      *
-- 
2.45.2

