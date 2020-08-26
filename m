Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp932291lfc;
        Wed, 26 Aug 2020 10:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4F0ZrNA9rWWO1GlL/q06cUfpYHimYVI/pcKP4l0NFqKjFMsFAole5PquVNxiXhbi5QyPZ
X-Received: by 2002:a25:25cc:: with SMTP id l195mr22832829ybl.383.1598461824395;
        Wed, 26 Aug 2020 10:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598461824; cv=none;
        d=google.com; s=arc-20160816;
        b=mCg/t7KrPHvrGn+/7AMoAJCXXCPjcclm1VbmldFnjg4437JIhYcwVYukMEuxhhAHZv
         lS8GdBVrH46qX0rkrwTZDlgVhlFg3gVPFP6f/SXKwBDXygxT9z5S1YjySdn+8gRMN7Vv
         9OthhDlnFJ6PyuLTWDIk72GiAzeaeOHbuoszaBRSxRpb5nwBlf64oSB5Ell3Tf51tprs
         DadYxCIsUlZ1GT3XSYpd+RLLbUXlcWvPP8aLEJ+f0YKq7XzdO8xNox9DTtg/DfPkRrY4
         Z6yeQE4h8sKca38Zef6+SxDwuaGXsAR9j4Nlk6pCoECKUTCUnVFlaHO3Ofib76JirUY8
         gY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FCOsXPEYR2aVJvi/mI6+SbgUYfGIrRkYX7xydn5IxnE=;
        b=uzpK0cWFM0aPVNPpEmqxgUJ+ml2aW+Z/M0OHAPKrzunYVZhBKVsVjakGscid7K6fOt
         6ZB0JTojwBuyB/RUiVc4kK0ZsXlv/YXHI+e8OGcoc7+sF0wKNOgQVimQCZmCNOeWEOEI
         H6+J9kwkJPgIudDji1UcipxCiXQ9Xmk9e6kz38C9jNqsDQFoiP6+ni3KVPuyYUpNPIF9
         iMJIpK2q0uYLJ77MmrDCHNz5vOX67vb2CokuuCE/ZucTkJWHRZlDh/gFCh1sjUDz4twP
         ZBYwHIwg1UYklS+h/xNASKSf3r50B1KxDYOLPgDA/IWkZjMN4GwbBSuHnjLC1HOdGtLD
         wMUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=huKP5UIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si2759381ybi.478.2020.08.26.10.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 10:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=huKP5UIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAywJ-0004tN-GV
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 13:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAywA-0004tA-I1
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 13:10:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35807
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAyw8-0005AV-8z
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 13:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598461810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCOsXPEYR2aVJvi/mI6+SbgUYfGIrRkYX7xydn5IxnE=;
 b=huKP5UIgf0806cJ57nVPZkHSf/jMNHfUBDyNa3Xv1A0YZwsKLbvTjKVC44/ChrcLicrX5A
 bPE5WBYZOyROyjhq+Sxz7op/cGBj5suCFwQiaNlDn3mAHPaefs2XY/yPYzsOUVfxt9IWW1
 nnURSVkE72XVxpJus76DPzSZU2GWWkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-y7i3AGy_Mpm4jEZfuTg2tQ-1; Wed, 26 Aug 2020 13:10:08 -0400
X-MC-Unique: y7i3AGy_Mpm4jEZfuTg2tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABD73393B5;
 Wed, 26 Aug 2020 17:10:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9925D9E4;
 Wed, 26 Aug 2020 17:10:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tosa-ssp: No need to override instance_size
Date: Wed, 26 Aug 2020 13:10:02 -0400
Message-Id: <20200826171005.4055015-2-ehabkost@redhat.com>
In-Reply-To: <20200826171005.4055015-1-ehabkost@redhat.com>
References: <20200826171005.4055015-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uLJaMpoqlGkF

TYPE_SSI_SLAVE already sets instance_size=sizeof(SSISlave),
there's no need to override it.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/tosa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index e29566f7b3..2c5a8a50a1 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -311,7 +311,6 @@ static void tosa_ssp_class_init(ObjectClass *klass, void *data)
 static const TypeInfo tosa_ssp_info = {
     .name          = "tosa-ssp",
     .parent        = TYPE_SSI_SLAVE,
-    .instance_size = sizeof(SSISlave),
     .class_init    = tosa_ssp_class_init,
 };
 
-- 
2.26.2

