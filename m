Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2000301njc;
        Wed, 11 Jun 2025 11:31:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbqjcyMsqlF1GKVmcOzze79dYmk6KTMyk3eYf0CWo6+7e2kbmrL9McjPTSMK7NqB+MXy6L5tQks0fVbg==@linaro.org
X-Google-Smtp-Source: AGHT+IGRcDgkwtFao5Zf5EQRUMwlck2fw7UURdzaHey8chu8Ec+A9N69/Dvsu8CvQ3VYSlRd9S5i
X-Received: by 2002:a05:620a:1a86:b0:7ce:f14b:d7d9 with SMTP id af79cd13be357-7d3a88441b7mr626814185a.22.1749666692044;
        Wed, 11 Jun 2025 11:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749666692; cv=none;
        d=google.com; s=arc-20240605;
        b=IUGXRPx2njkMxH5hxem+HCAygf/8NxpVx6fuJ0ichHUFhvPhBZlKGmuClXXvDHyeqJ
         cPdxpqczXY54YiGnJ4wcrdZqEUGHR87NemP7zyfTlba+SbLiPiA6SAyC7R1mLYvWl3He
         rBkU6fL5jfdBAVQz7MghXhsQtGuad3otw5XS4O8LwoftA8wunStaIs9yCWvZ4r2GQ/Jf
         msETHs8CfoQDJ+jZiEc0Wfjb/EW7WMfve3SJOtTkxfbD0ABHwDzkN70onPVXOWyk5Bvv
         tU6LztI4JsRHYAcZotYeYIVPeed8OKSZRDeQbVzts1M2oEy/c9chT8834f4vIOC1KuYJ
         xnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1P7ALdUgUH3egQpJpZZh+seXhAmubgaRIgDOiJvBoJg=;
        fh=loh9k9y3S2mImjFs3v08l0zZWu2zKrkh48k9P3fQXm8=;
        b=DuyAc72wblM0xZJeDMAiGPDDZtBxAg39T3MYeB1vmqvN+imZxYA4/sz1X6FynKBi5Y
         /R7D+WHQ07XsqI0/qIDbofRFUe/zLI+yM9imnTfa9Cw3cNDAOHbcHYLF8J5NbKVM+Ggx
         z+xyuAGOyoDveIb347dId5aMRVpvS+dWfWLh8NXk1sbdjMfZrP5MRcCn98/jg+HCxeI5
         9Msyj97yt9RYTDyUtG82hjn9VU42+rAJD5dZ08R9dweE3ya30r6o8ef5amL9csF3YsMl
         l7OX6KtG9aJ3V8hPegrVLp8YVxKjZ/Mx5msVcx8GLk8OiNOGN/Bv9s0fe2I7sVOyBFuD
         Kv3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gCuC4MET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d38e77a2aasi921939485a.363.2025.06.11.11.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 11:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gCuC4MET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPQDB-0007c0-3f; Wed, 11 Jun 2025 14:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAJ-0001xj-RM
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uPQAB-0001Zm-Ht
 for qemu-devel@nongnu.org; Wed, 11 Jun 2025 14:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749666422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1P7ALdUgUH3egQpJpZZh+seXhAmubgaRIgDOiJvBoJg=;
 b=gCuC4METErBbRToif6dxPUVXA9XwDgDDsBQ6DGwuDQIm60A5m5j63L6McPWQ2XQpNnDc0f
 SBocvd1kxQZ2GvPoJSmD+kTAea6SHObkbmfdCZwHsSS0ZV2xulMSEl/7xgwKaSbN4kHAC1
 iOSmF2h70XgTkfcusncos7reDhEGcnI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-Rbp6d6JYMo-D6lC9mV6ANw-1; Wed,
 11 Jun 2025 14:26:59 -0400
X-MC-Unique: Rbp6d6JYMo-D6lC9mV6ANw-1
X-Mimecast-MFC-AGG-ID: Rbp6d6JYMo-D6lC9mV6ANw_1749666414
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 697621801BD8; Wed, 11 Jun 2025 18:26:54 +0000 (UTC)
Received: from localhost (unknown [10.2.16.122])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DBDD630002C3; Wed, 11 Jun 2025 18:26:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-block@nongnu.org, Jesper Devantier <foss@defmacro.it>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>, Sven Schnelle <svens@stackframe.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Hannes Reinecke <hare@suse.com>, Klaus Jensen <its@irrelevant.dk>,
 Jeuk Kim <jeuk20.kim@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Rob Herring <robh@kernel.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 18/31] hw/misc/aspeed_hace: skip automatic zero-init of large
 array
Date: Wed, 11 Jun 2025 14:25:20 -0400
Message-ID: <20250611182533.200590-19-stefanha@redhat.com>
In-Reply-To: <20250611182533.200590-1-stefanha@redhat.com>
References: <20250611182533.200590-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: nfgUGYMWPKOK

From: Daniel P. Berrangé <berrange@redhat.com>

The 'do_hash_operation' method has a 256 element iovec array used for
holding pointers to data that is to be hashed. Skip the automatic
zero-init of this array to eliminate the performance overhead in the
I/O hot path.

The 'iovec' array will be selectively initialized based on data that
needs to be hashed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20250610123709.835102-19-berrange@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/misc/aspeed_hace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 8924a30eff..726368fbbc 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -419,7 +419,7 @@ static void hash_execute_acc_mode(AspeedHACEState *s, int algo,
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
-    struct iovec iov[ASPEED_HACE_MAX_SG];
+    QEMU_UNINITIALIZED struct iovec iov[ASPEED_HACE_MAX_SG];
     bool acc_final_request = false;
     int iov_idx = -1;
 
-- 
2.49.0

