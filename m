Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4189962lfk;
        Thu, 27 Jan 2022 07:57:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtPQBfu4mYX87PRsLrE0wHSQpKyt7m34mAmA1P3PO05hwlhveUQROu3RfMgEHSLyRIkwoD
X-Received: by 2002:a25:103:: with SMTP id 3mr6319427ybb.121.1643299020382;
        Thu, 27 Jan 2022 07:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643299020; cv=none;
        d=google.com; s=arc-20160816;
        b=rD+9mr8kRlWau/dzUrLQ1ld7FSlxbfoXcZODM8HL88rMLVHoeqiPbNmc4AWDySInGy
         KoPlDdO1B99Hc6VRY31XGWxg4hWpyBNuygkHmQ5zumcnM9+ZRid8Yk+lHUtRrvz9g0hH
         zvBNvhrJ1xFKL9fEYby5qPWw7RlFev1BTBtju2gYSiHW/fIRXqsXgU/VEsgIw0oRyu+k
         WOWBLP9if/IFMAMh9lkKS1n6mFODuPAscReWDa5zxgpu/KQcZvbiBRzU5dnD8evV6uAI
         WkdgHDX9KjOndhd4i3xeRSYv/gKaUxp8KMDgBhCWENDcZyrr8q51EGN/4YoSv8m/tEn7
         Jwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LLAQ1nW4YKEPm7wnZ619dRUESUtm/F93UK4qE9q7iAc=;
        b=D6HS59YL71acVtzoAWH1DZasiNn2H8LgJxXmSidJsDbgRMTyvlbG1PB4BNSTeoI3n5
         iMNJnsf1I9Puv7mV04H0k9Y6jAfITuLefvZvGn2eyMgC4fFrDR81tPyHqpds0Zoh6TPj
         SAPQsqrM/63CEY/t4bNt9v+4Xl/4COueL6rEoGwZNJGz3KTUhHDgPaOr8jCWXwX088c0
         rsset4AeRw0+hSXGgPYSLd1omlCYcp5CM5Dbd3nXZDOB3EGQon8P4QGTJUqhUAJPQubL
         uGGXyVDkzi6bEuB4ugY4P26zQnJtjo09wZadU5+K5JlLS/ne6tzdrarqsJJAksHKOG8b
         eyeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UY/4+6tB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si23344716ybi.748.2022.01.27.07.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:57:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UY/4+6tB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD78t-0004ds-Pk
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6VB-0007bP-3v
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6V6-0003BZ-IX
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLAQ1nW4YKEPm7wnZ619dRUESUtm/F93UK4qE9q7iAc=;
 b=UY/4+6tB5vLK2AvWLYPDejp5i/167liX+JMA2L1V3sX4ZRUnLbO02ZEiSslZ4FSBUxTCp0
 DldR1aPWCT45XFiq0fslEElOkpZsPutByFrGUFnDskL0V/Pd0aEvmhLvGuxb8FMu55hr5r
 TGaXBBdqkec5vVFEhWboxcQCQHkFYuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-SiWLrOQ-Nc-_A7DGhoOn1A-1; Thu, 27 Jan 2022 10:15:46 -0500
X-MC-Unique: SiWLrOQ-Nc-_A7DGhoOn1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A0D92505;
 Thu, 27 Jan 2022 15:15:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D1D070D2D;
 Thu, 27 Jan 2022 15:15:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/38] migration/ram: clean up unused comment.
Date: Thu, 27 Jan 2022 16:05:35 +0100
Message-Id: <20220127150548.20595-26-quintela@redhat.com>
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
 Xu Zheng <xuzheng@cmss.chinamobile.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
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
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XA+BnHiru7Nl

From: Xu Zheng <xuzheng@cmss.chinamobile.com>

Just a removal of an unused comment.
a0a8aa147aa did many fixes and removed the parameter named "ms", but forget to remove the corresponding comment in function named "ram_save_host_page".

Signed-off-by: Xu Zheng <xuzheng@cmss.chinamobile.com>
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index e9dcd3ca4e..b4477b8ee0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2179,7 +2179,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
  * Returns the number of pages written or negative on error
  *
  * @rs: current RAM state
- * @ms: current migration state
  * @pss: data about the page we want to send
  */
 static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
-- 
2.34.1

