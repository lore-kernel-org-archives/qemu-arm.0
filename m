Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp193456lfj;
        Wed, 15 Dec 2021 06:13:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx+ak9UDtwwN2S131tnS6lO9HtY69B2hOC/l95tRlMrMz0waF0RqRH8Av14KSZKUHQTM8t
X-Received: by 2002:a02:ba07:: with SMTP id z7mr5811250jan.84.1639577638851;
        Wed, 15 Dec 2021 06:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639577638; cv=none;
        d=google.com; s=arc-20160816;
        b=Oj+yeEcO1z+jHEEbq66uDbPH0qNOJqlYZIZFZqNI73y2HkurDudfoYC7Wq4g15qHKR
         Ham/C3bOIi7Yr8gXMcvX6/AmCuLYe7y3ISzGj2sAy7icxztxZOPropUlKjFm5frbQzoR
         8OKs4BH+/Nrv0Fg6jlqT7KTEYkO2gv2mMiYe0N2L4kbOga3vtYKE/y2svFu47cZv/Y7g
         54z7JDy8e1ztlx6hg18BrdGZe4YIFfnxEVLU4IjhPa2a7LdAeBavP+eGWWT0zfamvhxN
         Sc8wX46fG9suOKimjvcEwuv1FNWp06wL6exiCvnRhjDgagCw4mLkbBvtkXUXMSDicGqN
         et/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UnPh/3wAa4ouUSgLcDdWkTSjjrRjvY4u8YpDvM7Hwds=;
        b=VF0EweC2/3xF5W74eFFJpBAKkxqqgCs0IxjpLQB9S7fxeJRzRLPzkRDORB/yg5qs2t
         TqBrVyj7dE3QD0w/T7KPh78QSZgwqiTqB4nJR7DDb8uXSRc6JOlzvG52p1rkcS0kL0ck
         Q1WHivyd6QJmrjlMpAW3OL5kFNyPp7ENBGlj1nxtBmN6FUrAXmnY1vkPwGmrQS4SjQ+j
         i/ba+Ub3C4+IFKoR6vFwFE5uQP45puC9Lbn/1Yx5NtNqQL8zDRJeg4pI44VzrvAx4JTp
         oPvrTy5gCHcHqDRPb3mZORAJMV/6WRx9/XBR23mk/RPmHNNy7jzD+nhvpmndD1qrhobL
         Wjcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SWsOWKPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si885119jav.137.2021.12.15.06.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SWsOWKPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxV2c-0006wr-75
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:13:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUri-0000xq-9P
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001S7-St
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 09:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnPh/3wAa4ouUSgLcDdWkTSjjrRjvY4u8YpDvM7Hwds=;
 b=SWsOWKPfLA7vWFD3PcXQ9C7gdXY/a1w+/EQzorDkDsAwgeUe4ixZ64bSm+82u5+FKIG6NC
 ycf2oGBviNUImPRsbskEWFvTk7ldN9DyJrBnQIrIuJ1yjpHjFoeIO1VBUhj2n9qQu0wJfb
 +UTGUdOpIX1Lx36NwZyO8TTKbT76zY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-oNSV8EgrNC-i9eh0ajAVtQ-1; Wed, 15 Dec 2021 09:02:27 -0500
X-MC-Unique: oNSV8EgrNC-i9eh0ajAVtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0471934134;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6082E4E2AD;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A5C511385BF; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] hw/arm/imx25_pdk: Replace drive_get_next() by drive_get()
Date: Wed, 15 Dec 2021 15:02:14 +0100
Message-Id: <20211215140222.769652-6-armbru@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kIwkx7rt0sE9

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "imx25-pdk" connects backends with drive_get_next() in a
counting loop.  Change it to use drive_get() directly.  This makes the
unit numbers explicit in the code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-6-armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/imx25_pdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index bd16acd4d9..6dff000163 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -123,7 +123,7 @@ static void imx25_pdk_init(MachineState *machine)
         DriveInfo *di;
         BlockBackend *blk;
 
-        di = drive_get_next(IF_SD);
+        di = drive_get(IF_SD, 0, i);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         bus = qdev_get_child_bus(DEVICE(&s->soc.esdhc[i]), "sd-bus");
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.31.1

