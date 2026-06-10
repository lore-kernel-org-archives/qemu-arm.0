Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A087CCD98CB
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 08:06:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXDwE-0001Ea-BQ; Wed, 10 Jun 2026 04:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wXDvu-0000yE-So
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wXDvq-0000bd-4b
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781078701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCWL+jqI2sXCH00diAUaaQFPw22mmzicnM/I4EwFjEs=;
 b=Au8dRzU9K8o7xmrC8BkI10ZVYzjQ9VI6CJ6EAUWBwwFVT0UaeiZA9jTUjKgl2/HCrEgs0t
 1JWUdB6nu5gr0SLkZqmwKOKxajIBsXI6KjdztkjHJ6h4tSvCRnlUl0Io9w0WU0y4hYwPCr
 vGCZ0KK72a45mY0DC9DoUr915/APgh8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-iv4aV4xdN3qSPwZyrYL-JQ-1; Wed,
 10 Jun 2026 04:04:57 -0400
X-MC-Unique: iv4aV4xdN3qSPwZyrYL-JQ-1
X-Mimecast-MFC-AGG-ID: iv4aV4xdN3qSPwZyrYL-JQ_1781078696
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4847E18009DC; Wed, 10 Jun 2026 08:04:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EEFC83000223; Wed, 10 Jun 2026 08:04:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D7D1C21E682C; Wed, 10 Jun 2026 10:04:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL 18/42] MAINTAINERS: Drop bad F: from "Xilinx Zynq"
Date: Wed, 10 Jun 2026 10:04:23 +0200
Message-ID: <20260610080447.1156502-19-armbru@redhat.com>
In-Reply-To: <20260610080447.1156502-1-armbru@redhat.com>
References: <20260610080447.1156502-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8AsLN4Mb91sWkrh3uy5rlbG_XFp0oiMX29aBr8fXxZc_1781078696
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

include/hw/misc/zynq_slcr.h never existed.

Fixes: 246f530cdb (adc: Move the zynq-xadc file to the adc directories, 2021-05-18)
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20260603064032.3733394-15-armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair@alistair23.me>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab83fd216d..5326ab2438 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1143,7 +1143,6 @@ F: hw/misc/xlnx-zynq-ddrc.c
 F: hw/misc/zynq_slcr.c
 F: hw/adc/zynq-xadc.c
 F: include/hw/misc/xlnx-zynq-ddrc.h
-F: include/hw/misc/zynq_slcr.h
 F: include/hw/adc/zynq-xadc.h
 X: hw/ssi/xilinx_*
 F: docs/system/arm/xlnx-zynq.rst
-- 
2.54.0


