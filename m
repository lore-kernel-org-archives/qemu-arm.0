Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp963845lfk;
        Wed, 17 Nov 2021 08:35:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMdk5bJN0AnJJGpFw7pGMrOF+NdNzhcKRNTz5BA2AytENqXi8S/vuQKMeD47avK9O5/UQb
X-Received: by 2002:a67:c11a:: with SMTP id d26mr70997119vsj.29.1637166942252;
        Wed, 17 Nov 2021 08:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637166942; cv=none;
        d=google.com; s=arc-20160816;
        b=GAQSqfWEsUGnTpA+n6LKcq62FEQf0CbGNqIqzdk12SgXQLM5Qi5xDmwqlYYIo3FpyR
         QWCFYKtV7Dck9AysGCGRgR1hvsI7FKxpMRbnm7v8bsDADqbktzottTqPia5oRJkzdELr
         k14P5QfbyZ9tFKBiuZCIHJXNuGcq9GeGXHDv93/QYI6yTB33bvSUaAL2NlolLDj8SDA/
         kInGI7SvjxunzswNcW3vjr/GcyD9S6Vv/EHAMGn/GE2TsuS3SqKm+Fm8ggplZIGElfdT
         qaH9TDaO1yct1Umo1TIJQB3efmmi3OUT15OUxNWxiMb6U56uvbE9QBcm9H8uoR4LFupD
         dYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lpC7s2V46IdA7XTvAi97Rc2I1PaB7uDNF371b2rv/so=;
        b=D8cLq55sZAJg6S9f2FvHPxr0P+enFRV1Bxg9JzSxGpH/QuA17Z6QfBr5pzKEIPbfFO
         JpAhGaq+sQBOg38+ytYruAhPOB49m0e1f4eC5oGlAFs0x0pdOLUA+iYIJVsE24FU/6dz
         /1q0MHxQ01NR11DW7Ql1+fHICPxYfzMXzM8oaKQ+KyvEPMznrTDU8+FaSstx/YfZ88Me
         ulf3UK3ZzqUtQx2TFjiV0t5TPb1SsL/ueIEeiuhKPpc7uTN6t0Z1zry8S1a6Kx9Pzrx1
         rA+EuiMmkiONcTBQqt25l8gtBqKCsZ0KwoNbBFZ1DcopFWLgKaN5Fe+5Lc7CMq5J+AXL
         T7Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="OQ/Dyuk5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si353065vsf.372.2021.11.17.08.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="OQ/Dyuk5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnNuP-0004Sk-JX
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtE-0003M4-0m
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt7-00088D-DF
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpC7s2V46IdA7XTvAi97Rc2I1PaB7uDNF371b2rv/so=;
 b=OQ/Dyuk5z2USGOd6d6CkAYDft3ye1dlBSXiPL9Xz/LaljI0tOc/Xc11TRosRbQz6uY9wUs
 G88zN/BTpwoAa5DZ//hc7/Gmr0maudZR2QdzcMdlQY1onZON/1v3r1zbnjO7QVeM5YWYIq
 Ujejb2HzU1lAskmNQP4jEfejR/0FIkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-ArWkdGdkNiCFrHW72Ts7Lg-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: ArWkdGdkNiCFrHW72Ts7Lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD5B1006AA1;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD77B5C1BB;
 Wed, 17 Nov 2021 16:34:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8972711380CD; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] hw/arm/mcimx6ul-evk: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:02 +0100
Message-Id: <20211117163409.3587705-7-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vS7KPf0eL1Q

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "mcimx6ul-evk" connects backends with drive_get_next() in a
counting loop.  Change it to use drive_get() directly.  This makes the
unit numbers explicit in the code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/mcimx6ul-evk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 77fae874b1..28b4886f48 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -52,7 +52,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.31.1

