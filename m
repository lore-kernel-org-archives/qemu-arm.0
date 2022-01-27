Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4183663lfk;
        Thu, 27 Jan 2022 07:45:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIrCMZG0PiSZZMrV4u1Wa1aedmnHOJSzoggrB12+kU0ZsRMR6o/sGlTMUl8ToPh/Tk8MnW
X-Received: by 2002:a02:7754:: with SMTP id g81mr1981521jac.153.1643298321351;
        Thu, 27 Jan 2022 07:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298321; cv=none;
        d=google.com; s=arc-20160816;
        b=SSPleT3MEz2j55BE7gt3u3rB3RvK9q3dw8uWvUS/bgrRV1HAxYSRVxLG4TCOgcf9IS
         ZgfpyLsU2qrY023caa4X4OlfAqhZ/xsst6TiMTFvZVv6eLrsa+llwlr2WexYDa2y2Is8
         mqFj5IsN7AGLEJ3zdxSqJEmEmbRssbf8i+JHOBgw3TblkvbdPdReCiOa5rWOl43uCjuj
         aAgxPzKR67xqLi0VIYTgzEOX31IS7TfF/HYne6PtBChk0TVKQ9rQyOn+qvFL7lgB1AYR
         fsEbiH1+K8m+Vy2M9DPNgZCR1MHipeLa7rvwGiGitGxS2lxG+iU3l71e5zDcK+Frs2zq
         kosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pz99tNvL7SD24ZVrXlUQbIGHejdSEY2Mt5qK9/NKCeE=;
        b=h7VQUW0BXYn7zO2ylcfgmB6R0IUiGeIZRmmXI6afP9IrQXqSw92KngfZXq9Z+73bFP
         w9rUiLlYZM1nIp9hFfMBQFzISjqLDvXwz6wDNm5+QY7e9tDCukP2vIznvrTk6ghLC7VG
         8757BQbPenzkYM2eaUxxydnTXo7l5iDBxtExU5bux/0rXRBBHeKlcXLVxfEcsGhE4Quz
         NumvznKVX+Wph1FgnqzwZ0Mzhs0EwO7xcTyPy+bWkLHKvLenWh5Vt6DCKADew3TEqLJ2
         DGdiDhAbpmh+hlQWNFTrUWh7lRXfHu0FC8hMoQJdBWky7HkrWbaqeKlHjFF3xO491Qwt
         Y4tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JXQEhkRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24si1666247jaq.121.2022.01.27.07.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JXQEhkRh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6xc-0002iN-JQ
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6OY-0001z1-3j
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6OW-0001wQ-0Q
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pz99tNvL7SD24ZVrXlUQbIGHejdSEY2Mt5qK9/NKCeE=;
 b=JXQEhkRhK4eQsLo06la/hng2l0dOZM3g6tgXemE/CT/+cogDpmfJVz6SNy+DaicFGYKpe2
 1gKlJrxm4fBX85W0GncIzo8jsvYXB+BMIE+dLVMzlPFcT+Tuq2X1qBnlE9ds62VMaGIeVx
 rWZYGnGljM8ilwo45DTeLIn6BmVC4FY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-gPYmO_RMOseMGJUkQiv2Pg-1; Thu, 27 Jan 2022 10:08:59 -0500
X-MC-Unique: gPYmO_RMOseMGJUkQiv2Pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05BC84DA40;
 Thu, 27 Jan 2022 15:08:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376AB70D57;
 Thu, 27 Jan 2022 15:08:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/38] multifd: Use proper maximum compression values
Date: Thu, 27 Jan 2022 16:05:17 +0100
Message-Id: <20220127150548.20595-8-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: diqay4nRZFTQ

It happens that there are functions to calculate the worst possible
compression size for a packet.  Use them.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 4 ++--
 migration/multifd-zstd.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 9f6ebf1076..a2fec4d01d 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -54,8 +54,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %u: deflate init failed", p->id);
         return -1;
     }
-    /* To be safe, we reserve twice the size of the packet */
-    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
+    /* This is the maxium size of the compressed buffer */
+    z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         deflateEnd(&z->zs);
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index cc4e991724..97c08367d0 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -67,8 +67,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
-    /* To be safe, we reserve twice the size of the packet */
-    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
+    /* This is the maxium size of the compressed buffer */
+    z->zbuff_len = ZSTD_compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
-- 
2.34.1

