Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp310755ejb;
        Thu, 22 Dec 2022 04:09:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu73CQRdMv0RYo4ZGgSau0je+VdDUBKZbKnwnLuVxQPkiA/rHkCVe9jXSi8kkfDoZjc6/zQ
X-Received: by 2002:a05:6214:440a:b0:4c6:f7a1:dc03 with SMTP id oj10-20020a056214440a00b004c6f7a1dc03mr6593409qvb.37.1671710973604;
        Thu, 22 Dec 2022 04:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671710973; cv=none;
        d=google.com; s=arc-20160816;
        b=eMZPM1hk9ESwqTDWsmo+sHywQOhoT8KiGX3k3IsEYrt/mPFi6ZBNN21PKcPdkVStqo
         CKPPcFsrBJSXQfIjqK1eF3dNckTfW6B7l0sVoIfQApaXK5o1t5jBFngrn+FwyDs9xLWj
         FlLecoNHAOeLWbb/RNyr9hCTmLBrBgCP0oYZBFEOjJ24ASo3ZruY3ETba3MMTDJifdcj
         edI8PSHDrJnhcwXRewnLUPNAm5cIi40Pa0dtVBcJbJHP2XSMmfavBaAJAfHpfHvelaTg
         y+6p3AT310HYBa09gmoN+GoLR15loSjfZeLJGhjOYxdG5Xz4OSN6wGap4UtwB47xJ4/r
         M1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DtlmAGI4tYrX1qCtGmQnW9EFq9Qipk3gRJ1ke0PpJ/0=;
        b=op8DeEtmQMv+y0c9wqGnpGrnkUYCERsAlHAp4YUXU5H2eh+jtLg0HHlx0sHqmQ4Liu
         TKDXuJYhiQoh+qsF+ZQMgH1Xb5i4vhu3tUKGp86pr+11My6EB39DC55JQd98O5dO8OcD
         AkhXFPZFC+96fkG3bGIrh9YlWh6hA2rDS14p6I8J07o/avsM3o8Pux3t9VMq6q/L/1df
         bPc+1Ucu5Ys1o4957yc6DjwthbDRjQLd812J+M2pCRE1G6s8hmiMJadPCAXqwTlGdJHG
         SFChG2aWVRrGk0btHqheQ66cVyYMtBoG1lkMdCDd6n9Ovo4gH4oSbjrKwf7CeFOSqTYD
         EuIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cOMrrheq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw12-20020a056214238c00b004bbf2926fdasi154242qvb.391.2022.12.22.04.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 04:09:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cOMrrheq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8KNw-0007j8-VJ; Thu, 22 Dec 2022 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KNt-0007gp-RG
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 07:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KNs-0004eu-CX
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 07:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671710951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtlmAGI4tYrX1qCtGmQnW9EFq9Qipk3gRJ1ke0PpJ/0=;
 b=cOMrrheqHwipjpZA+Wov/UNYakNYjysIFDXWxz4P/kijhxhMoQE4wHH9FNy1YUuenHONsg
 xmWl7Ap98YX+wAGFONuEyOEJHmqS5J3DfIjvAeNqchnF0lhPd7ythNgdRU9zDHmO1LmdGN
 zMOB2kN33R3rrShtqAqw2SyyNf1ybmk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-hBt_20iEPaeh8n8l9jXqyA-1; Thu, 22 Dec 2022 07:08:16 -0500
X-MC-Unique: hBt_20iEPaeh8n8l9jXqyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E2E885A588;
 Thu, 22 Dec 2022 12:08:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67646C16028;
 Thu, 22 Dec 2022 12:08:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 43C3421E691E; Thu, 22 Dec 2022 13:08:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
Date: Thu, 22 Dec 2022 13:08:10 +0100
Message-Id: <20221222120813.727830-2-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pMX0fyvhyJny

hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
former doesn't actually need the latter, so drop that inclusion to
break the loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/virtio/virtio.h | 1 -
 hw/virtio/virtio-qmp.c     | 1 +
 hw/virtio/virtio.c         | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 24561e933a..48ab2117b5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,7 +22,6 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
-#include "hw/virtio/vhost.h"
 
 /*
  * A guest should never accept this. It implies negotiation is broken
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index 8e7282658f..3d4497da99 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 #include "virtio-qmp.h"
 
 #include "standard-headers/linux/virtio_ids.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 289eb71045..0ec6ff9ae4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -25,6 +25,7 @@
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
 #include "hw/virtio/virtio-bus.h"
-- 
2.38.1

