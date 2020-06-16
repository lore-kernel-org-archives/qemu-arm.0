Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2650411lfm;
        Tue, 16 Jun 2020 07:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp5nJHl1we+aQ4ojOXynSCwi7F4KYO//Xmg2Dfo6Zu4Hd+t1y4s+Anz0EvS7lwnFdMRgHE
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr4309757ybb.346.1592316503651;
        Tue, 16 Jun 2020 07:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592316503; cv=none;
        d=google.com; s=arc-20160816;
        b=hi40g06/bz0H7e/BADhFs585O6UyvZqV+WBkTwWdalkYtLKpcbl22S25dspC2qzQ2L
         hZ/unvafKGDaJcvTuVPdxrqZKvaUcZ90rIo60kptj8/zfK/iLVC/4ZJFiVFyq+rDNA/K
         lNuB6LgeIEQTT8IR192Gfl25pmoWNhZ8OXom23BUp73rscLwlQEFCgrbvtOt21pxC6co
         HB5535CN941ymH0opnal9lYqPCxRvxcOfMtFjX9vafh3nJQRPl5A/woWI9eQfqFxiu6q
         GIzuQ/MwslROc68ONxhu4jc8sVoP+zfEsTsmKYVqfS63QAI8u4X/IfPn0LASzICrt+IX
         6+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=w/f/zwWBS5CtxjP7fhHNoREDIz1hrANaOOzw1sI/oRM=;
        b=uGKyg7bRHRqusICUaF1bEd3WbuK0beJe5LHiHvW6eXdsJzlF4C6fCLPXnMOMN7N4jr
         2zAJ81RyyFpBhX1Pgz0gFCNqyL7OJUkchNdDD3D73grfq205EOGKEx0fP28pbaxTrWT3
         Ubw36NKXB2ZfafAHGn0tdwEsZMiB97Jt+/vUJC0z0UyyHcTgz2DTCSjnjGVfy5WIehfk
         Ug4BTSKenillOdAQyamSYaT1j62IM/7qjUFjSLv8+TrCoQvJCNaYI5gBzgP/D0nUGjuN
         R9sw4WdqqSDp/eZLby0Qr5gUcofvaV+tg7SPFuJKlpP29OnZSIg8GBqo2v/Vxm4bLs1t
         f3Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMmmv10u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si16121497yba.182.2020.06.16.07.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 07:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMmmv10u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlCGF-0004MQ-1M
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlCG4-0004M9-Al
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 10:08:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlCG2-0004xQ-Qr
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 10:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592316489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w/f/zwWBS5CtxjP7fhHNoREDIz1hrANaOOzw1sI/oRM=;
 b=fMmmv10uILFKu/muthJ+9DMKvJ04oJcLRsNa3TTDFulIaEaOCNgA8OqKZhpOyq0aGuqu8F
 XGgNPy3hEDVjcstBtyCWrdNwwjNWTGlkzTG6Q1RR6KyXnFyjB3BZCAJRDsvm5zdtiivFeE
 sLALBHNVSjRvJnkKilVDwD3khU9fR1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-PXbZXG4yPPSujZ4iNbruYQ-1; Tue, 16 Jun 2020 10:08:07 -0400
X-MC-Unique: PXbZXG4yPPSujZ4iNbruYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57E6872FF8;
 Tue, 16 Jun 2020 14:08:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8407CAA7;
 Tue, 16 Jun 2020 14:08:05 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Add 5.0 HW compat props
Date: Tue, 16 Jun 2020 16:08:03 +0200
Message-Id: <20200616140803.25515-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ztwi2/U5mQS

Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index caceb1e4a05f..8b6e6aa7b138 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2375,6 +2375,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
 static void virt_machine_5_0_options(MachineClass *mc)
 {
     virt_machine_5_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
 }
 DEFINE_VIRT_MACHINE(5, 0)
 
-- 
2.25.4

