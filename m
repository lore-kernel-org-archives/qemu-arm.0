Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp995991lfc;
        Wed, 26 Aug 2020 11:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE6SS8LbwoT8GbnZVH8pnBJf9G9c5PIf6l8GpxgNC2RAIL7sFNyZO91RdpQMsJ/XlFUNi1
X-Received: by 2002:a25:d946:: with SMTP id q67mr20958331ybg.517.1598467573996;
        Wed, 26 Aug 2020 11:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598467573; cv=none;
        d=google.com; s=arc-20160816;
        b=dWhqNLVQKkq5g2AMse65jCkaz2Bv7iAugzyF7Dkdbi9Yn/JLgEHVHz579Wvey3cjf5
         0LvU7XJ5gYBYZpMlaUKJ/OsFqbbE0L3kHef34LNiQNhIRdhklsSHJe1pbbY+IR3KcyGT
         zDPF+AJBI7rnJE1RgUH3dRqThCIFZdVL7j37JPtKp7I/vC2UQl7tdKx4r344OsjnXCHN
         ULKS0jyrwQJvGxrhU7dVaBZfw2QSr9gOjADKxO35DgBK0tyZs/DnOahW8cS5F67e/rui
         7MiiqRkZuRK50he+pCpIKFYaFvjLoW0MqeiXHBwXh2FsNGHgDbENxBLq1Xfw6XN9WxJE
         FrXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y0AtWIo8alYJiY/FLZwzYZl0OrbSPCX7EXsnnh5DKcE=;
        b=EXLZ+4dRsfizk/l4W+/7KacA9K+zlNHFZ9vwjNoxMxnCvG5sUnrWH1dmuNUMPMfcdV
         OFRbdcLcwKi4Ln8K6xnklQS36kSNDU5XsTnc4t2BLjWsRdlfYfZ9kDue1Ug/onCG4mjv
         M3ExYx5W7EEXBuMZQHgiIT/Xl713wdpoEhiHzWh6eE1iGR9nBxJSsuMQMDOPLCWhenvD
         n6JwzRHIYpu2NsgqWe4WOCTba8+nuql8nYFE9Pw7M4CvUbybeS458HOqAvG8z6fWVNck
         27jR3X4Rgyaha/eUAJc9DiGEhI3PyA9e9zPaZ+oa5fzxvZbzU3BSg8cAejHlXbPENsyC
         Kb0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vyotej88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si2716584ybk.54.2020.08.26.11.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 11:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vyotej88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kB0R3-0002Bj-BS
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 14:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0On-0007IT-0a
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0Ol-0001F9-BY
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598467430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0AtWIo8alYJiY/FLZwzYZl0OrbSPCX7EXsnnh5DKcE=;
 b=Vyotej88EVf6GD0gyApdfBfPCZaEBCCwnJd77nV0+5tCybdQOHylyzJAvBELcDhWreZgHz
 n1fCFAgCQs8z1nQtAXWNaVxjrzQ0AtlolOYcrG8sTfNh1oY4R1GSlVnqlZqC5WYLm2P49A
 7N8IRlrqy/EcNyquXUgO1TdS8scHA5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-n02tqyIyNXCnn7e-76trxA-1; Wed, 26 Aug 2020 14:43:48 -0400
X-MC-Unique: n02tqyIyNXCnn7e-76trxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278D310ABDC3;
 Wed, 26 Aug 2020 18:43:47 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A323360C13;
 Wed, 26 Aug 2020 18:43:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] xlnx-zcu102: Use TYPE_ZCU102_MACHINE constant
Date: Wed, 26 Aug 2020 14:43:31 -0400
Message-Id: <20200826184334.4120620-6-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-1-ehabkost@redhat.com>
References: <20200826184334.4120620-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 14:05:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZdSLNScOJ03L

This will make future conversion to use OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/xlnx-zcu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 5997262459..672d9d4bd1 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -238,7 +238,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("xlnx-zcu102"),
+    .name       = TYPE_ZCU102_MACHINE,
     .parent     = TYPE_MACHINE,
     .class_init = xlnx_zcu102_machine_class_init,
     .instance_init = xlnx_zcu102_machine_instance_init,
-- 
2.26.2

