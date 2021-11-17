Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp971388lfk;
        Wed, 17 Nov 2021 08:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhsiYSOfNeZk8WCpZPBbmblX/JJSzUF005G+NNnUzoxlGXMqzKvxfZQwpEZ86n9m1vlVmt
X-Received: by 2002:a05:620a:113b:: with SMTP id p27mr14600169qkk.33.1637167268758;
        Wed, 17 Nov 2021 08:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637167268; cv=none;
        d=google.com; s=arc-20160816;
        b=FuRHluxVn0LAM7FNRsQTvACGVBfZBY+iO1HDj3KeBFhN0N9TaJagHHvCc3L1mJI2o4
         TejF/sTZZ68sTNeksJT0iSfyOjNZKzSqRGPpMVUkAPRMYy2cRKqCqjDklPE1sGp5fXef
         VlL9kPfXLNz/LE+s1XB+8wein5Nuw+4JhYAGqpAXcq0WZDFDdxieJeffcpZkasNpT5lb
         wVG8TZm6WijnFqmTyKWnVtzlsv6SlT5ViUz5Iuo2R5elJSqI2/jKd00oSSIz/cu/AbDN
         vgboUP/leWLeqjvkAzeqVsEzohDU5s1sxTez6M/OmfgC53OaeRH9s7tq9ilGyF+oRor7
         LgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/hCNF90n88ZaOSveBM5R6+mc+3MVPday5x+7l3fC5ok=;
        b=btfJTxOjFEjqj8P08ClxUVinFfp/DExCLmM4L0fFloG1uMu0v8ATEF3YdASPy0QbUl
         golSbqV0ISqg6PH8g11aipumU5eyAic0QSuWPf2Y6gQzt4FXlmkZ6KIlGQRO6iwA7lMc
         havxD6K544GOmBMYdCOuYyzxmErQmCsaDGt7eSY9BiXuH8KHx1YEtn7i5sdC+KWFkrNm
         p3yZowwr6YhH4fllwfpz7nMpOhZnbjr/MFnu8oql1lcQqMDBRuvDUkUGOX5aw2ZghUkD
         aMDFymWeGWyuPVNyY7y6EghNZeQhapZwgPl5j+jQayMXtuVabTn7x+IGPHBiCBlmDZnD
         SSqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A6PQcIaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si404397qtx.47.2021.11.17.08.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A6PQcIaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnNzg-0001JF-3S
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtL-0003Wx-Ap
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtD-0008AZ-LC
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hCNF90n88ZaOSveBM5R6+mc+3MVPday5x+7l3fC5ok=;
 b=A6PQcIaHyeyrshbgGVTPM9eYvVtkOTeYZHMiBcgDKVqcniSbc+DqKyS0RGr6PgF7RHPYoQ
 cq9R4O82zsucAW+BGUG89xy1cxN7aAkmCMKFTuP+ty7bpfsgF8elgi71FcgzzGgIVpZfWi
 ymd4t8BgQ7e96em2fXXxe7RWi7C8+vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-FTlBO-prP3uP3vAS5izApA-1; Wed, 17 Nov 2021 11:34:21 -0500
X-MC-Unique: FTlBO-prP3uP3vAS5izApA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA221006AA1;
 Wed, 17 Nov 2021 16:34:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2685F4E0;
 Wed, 17 Nov 2021 16:34:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9011D11380D7; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] hw/arm/xlnx-versal-virt: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:04 +0100
Message-Id: <20211117163409.3587705-9-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLBrh3/ZZgbM

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "xlnx-versal-virt" connects backends with drive_get_next() in
a counting loop.  Change it to use drive_get() directly.  This makes
the unit numbers explicit in the code.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/xlnx-versal-virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d2f55e29b6..0c5edc898e 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -669,7 +669,8 @@ static void versal_virt_init(MachineState *machine)
 
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
+        sd_plugin_card(&s->soc.pmc.iou.sd[i],
+                       drive_get(IF_SD, 0, i));
     }
 
     s->binfo.ram_size = machine->ram_size;
-- 
2.31.1

