Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp219132lfj;
        Wed, 15 Dec 2021 06:46:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx92XXULepatWFAor76kKBDGssyng9PzBVpHSkolY0vvtISVZ0mdbub6RmiG56gK1J+Z3O8
X-Received: by 2002:a05:622a:28b:: with SMTP id z11mr12202441qtw.242.1639579598539;
        Wed, 15 Dec 2021 06:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639579598; cv=none;
        d=google.com; s=arc-20160816;
        b=zaM7AFDEnXoxRjzPasXls0E+tysuybFcouK+P3+RGFJt7sLieA1TdB0T/DM5nT5Em2
         p9eAbpRWS5dAQTR+BAZNq8Qof9ugThneh1FTS7kLVFf/HLzYXSGRxYRAoiE0GfMoet8G
         mawCq8PlVO1Ew9di9it1k8P2PbbTgpXADQJv6qAK3lcyaLJuqfCwI94IHAjOvNx4TpT5
         0Z3bRxqpOCNZRHcI1Ypt1uAilWDmfBO5gG+z+taXZPJpDruC3iltC/BoseFopaaZLh9S
         7YaT2bD+OfuVmbIBaj4OXAeblNaANKhwdA1l5pmBd9oQOeG4HToSRDk/FfKdCyQ7T2b3
         9vAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TKJvwrbQwRZMbI1XBsNDH7ArYF32UukWB8lQX6aZC5A=;
        b=NUwpirLfROc5aE7aBxPKUrNGtLM1L2240XMiJdLwG4GFzmtDrRd3jIyj6uCJwMMk+q
         dFQ4GowU3x/uQhIDyHNA61rq+2HKlSjQwapW6NhlsWs3c2ENY6pub6QBNTGU5JCxyqMb
         dPQTj6rOWZH49i7VKj/kTrSGvooTPHJlpd2Y1xkuH0LyCZhRSfs8Z2FqLCdKlGDItWax
         aDtVg/4BpOPpRAJFm2q08Hgq8KESZ1DhnrbwQ4h6VTjCjo5Xi3YZ3Sc2k6B3OoTbG2ae
         HM3HeHlka8KrjJrO5kFOavCWgpt7vOjkm2RZ3mzEinuiruCSDHjpI4DHtlYo4RmuqAF2
         VMzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=arrBfX7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq3si1221648qvb.446.2021.12.15.06.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=arrBfX7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxVYC-0000Gt-LQ
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUri-0000xp-8V
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001Rt-Ms
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKJvwrbQwRZMbI1XBsNDH7ArYF32UukWB8lQX6aZC5A=;
 b=arrBfX7vGMhKAeXHmx1w494iKE0nIr9aGTxj4DL1xDV1GMFUKsrFt2kk1SiRq/zkilLcIu
 Mh/PSLoBh0LhhmuYPCnfyqtLQaB0asKFFMoqBES2sDfi+Xng3b7FujFHxv04pv3SQylA7Y
 hBjkmb+I09rwbiuSeFbsKSXPqZnDzDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-i7u6ubpJPpiVkGyVsnvJ1g-1; Wed, 15 Dec 2021 09:02:26 -0500
X-MC-Unique: i7u6ubpJPpiVkGyVsnvJ1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9081E100C697;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 609055E482;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DABB11384A5; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] hw/arm/mcimx6ul-evk: Replace drive_get_next() by
 drive_get()
Date: Wed, 15 Dec 2021 15:02:15 +0100
Message-Id: <20211215140222.769652-7-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xd/Fw/U9XS/K

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
Message-Id: <20211117163409.3587705-7-armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

