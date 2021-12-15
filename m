Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp210842lfj;
        Wed, 15 Dec 2021 06:35:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGUvjHNSFXYd98+LxFTGDpBwDw4YgjqKqGduNJudVx4Avi9b29E3xvLqeCxfQJQEF1/xZh
X-Received: by 2002:a92:4b12:: with SMTP id m18mr2491431ilg.231.1639578925998;
        Wed, 15 Dec 2021 06:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639578925; cv=none;
        d=google.com; s=arc-20160816;
        b=Fjx1U8H+8ckfahRwBIUITrpuYpRBELfAhzF/cDZl/3JGYVTfzHV/eNIws3csWgu7yw
         vTfRJvGab8382gp+KLTed9J5Xk8oizrhk+t9uTyuDECOm8OPvsRv3qUhZAha5619XonK
         ZrjARSac/dVP0u5RruyoRgLl9yCo8shg8nxo8ujcF3rnke6p2zl3YwCv0qMcLlQhnBiK
         LIGLIdbFvXpJnSlKmh6eJMGg5Qi1wARoatmFtkWV0GqYAyuXGwZq7SeXM9DRdkXpB77C
         knHbFcUDXs4pX5rUeHAjTrXQQ8m7uThJcBexG4szN/mnGpAjZNe1cavYyP45cAlMiahj
         DU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gAQEt9+Dfa0WrC+c7/Gzq0GLmwwy7ytFvEzS80wMnOY=;
        b=Ie3LdZBgIWWLp9FeQfIs3zq4iXyAFXmJauHTYq+b7yM+t0VHeQO02XnyZZfYXIauHX
         23YIrCw97vShOAAhIEUREdqDDS30Bu3an2JN+unbx298yz5BSENv+T9BWaqql7sdBAJB
         2b7vxOz4CfmPdM3H5d6L2GKpjz0R4hAQasn4YM7DquBqmRL6WWahXhIxhSxE14gzHxGm
         R1wQeuojnxHF2ROzjJXJwIKPzGRpXtl80aysn7ttN6zgJdU9MGBGBs4OQqnRHzh+RVU+
         MynXf5dhSqZjrXS8SWG8QAnYInU0dxb2d/WblC/Cz8FkE1jH9zFvq0zpDqueG5yX8y/n
         Yobg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=haQAcCj0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30si1152962ila.169.2021.12.15.06.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 06:35:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=haQAcCj0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxVNN-0007dW-AG
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 09:35:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrl-0000zk-QS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001Se-Vj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAQEt9+Dfa0WrC+c7/Gzq0GLmwwy7ytFvEzS80wMnOY=;
 b=haQAcCj0BbWw68xLnBIm70VIAt7oWNQobWmC+5VNGFNFBFKs/VPE77yRyArJW8iirM8MEh
 3WkpopMMvARYjP1u6yT6mfT+It6HOZSEftpqZGXBNVU3Qp7iWNq5IjiRXuXi/qXjM62A8/
 n/72O5rqR0dGAiuSsQL1FcyszvxWv/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-m8DOqHlYOn6LmsSuRP2MaQ-1; Wed, 15 Dec 2021 09:02:27 -0500
X-MC-Unique: m8DOqHlYOn6LmsSuRP2MaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58621934111;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D8F15E485;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 647C51138221; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] hw/arm/xlnx-versal-virt: Replace drive_get_next() by
 drive_get()
Date: Wed, 15 Dec 2021 15:02:17 +0100
Message-Id: <20211215140222.769652-9-armbru@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HmZSAOB0lZRg

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
Message-Id: <20211117163409.3587705-9-armbru@redhat.com>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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

