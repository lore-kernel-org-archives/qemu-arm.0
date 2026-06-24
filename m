Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C1CDE005
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 10:29:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcKqg-0006lK-4H; Wed, 24 Jun 2026 06:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKqe-0006kq-Do
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKqd-0007A7-3T
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782296926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcreBT6yOPwaacOWLfu2u1EniV6qHpkGam79kBzQUp0=;
 b=Zl4YZ9IkO8Zog5y3Hpte0HQaxVAQHEm8w6dY18h5O5hraDJjRzUF9fVG21nlZvUGBC7vJ5
 z2d/Gf+5lixGUdFzSJ+ZwMfXKMZElO5ujh8WRFqHJ8GOadEGzuZ//pwdMxX1XOnXZtrTXU
 ra+7EDlMg0LIuzRJAN4I0N6l3hz5EBo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-qoZDtgWwN-OeiwqYvGylBg-1; Wed,
 24 Jun 2026 06:28:40 -0400
X-MC-Unique: qoZDtgWwN-OeiwqYvGylBg-1
X-Mimecast-MFC-AGG-ID: qoZDtgWwN-OeiwqYvGylBg_1782296918
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ADB841801BE0; Wed, 24 Jun 2026 10:28:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2B8BD30001A7; Wed, 24 Jun 2026 10:28:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, eauger@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 01/17] arm: sbsa_gwdt: fixup default "clock-frequency"
Date: Wed, 24 Jun 2026 12:28:14 +0200
Message-ID: <20260624102830.1355552-2-imammedo@redhat.com>
In-Reply-To: <20260624102830.1355552-1-imammedo@redhat.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: k6lWkiAHMMnbmqkFyj9JhX-tESWNxmHZZkdN_V-fg2k_1782296918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Comment about keeping legacy freq, is wrong to begin with
(should be 62.5MHz), but that value also doesn't make
sense anymore as the watchdog is used only by un-versioned
SBSA board and the later has hard-coded it to 1GHz.

Other potential user (arm/virt) also has system clock at 1GHz.

Drop misleading comment about legacy and set default to 1GHz
to match both boards. (not that it does matter, since users are
setting frequency to match CPU's one explicitly)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/watchdog/sbsa_gwdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index 7ade5c6f18..b739a3ce3c 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -264,11 +264,10 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
 static const Property wdt_sbsa_gwdt_props[] = {
     /*
      * Timer frequency in Hz. This must match the frequency used by
-     * the CPU's generic timer. Default 62.5Hz matches QEMU's legacy
-     * CPU timer frequency default.
+     * the CPU's generic timer.
      */
     DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
-                       62500000),
+                       1000000000),
 };
 
 static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
-- 
2.47.3


