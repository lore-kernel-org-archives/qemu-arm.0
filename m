Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp131509lfc;
        Tue, 25 Aug 2020 12:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8zJzAoKrEYNfbPUzU3Te4tEP2w5oB5yJH8gAGpNGX06tRsYiOlKI1ymfmj0tmbm7E9SnK
X-Received: by 2002:a25:348c:: with SMTP id b134mr16209373yba.494.1598384467671;
        Tue, 25 Aug 2020 12:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598384467; cv=none;
        d=google.com; s=arc-20160816;
        b=CX9WOFEEwV37OZUAu73E1vIwnsVLL9D05HX/Q/WeIqk3rQy02eFGchABALzM8jkHnZ
         kSb8ROQsfh0n3WzFWW5aH803Dwgva1znSvj6oN72yxib9BHc3ra1txo7/2xccqQT1uvX
         aTJzaGEn/bfcY2RpS8DSksI7txTp6M52eBpb5e3IA8I8sbzyyCfdTjgVBTm7slqeTWIs
         73qzJHW9Dnthb7IEM3bu4n6XxgQRR40iQZMHKKAWq0RbWm7oN5dJT9OQZZia3rnvxe9f
         ZdpjAYVT0Ondrtgy4F7kvnTSj5YEVyirFv/IqSp7uHJ4h1PEZzPkUo6v0OP/lfYcKfcA
         E0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UbwByfgjkAlI66puvl1t93XFLm462cmXMGwuy5iz4Gw=;
        b=Zp7I4a9BhzO06Kpjgenu0HB5nbP8l+iIjHLEsoLZlQchVGOalGFia51mkGXTdw0yWz
         Sfaw/0ZDTPK+6N3JLeN/yvGua1RpTgaOeVuH/5SyK9gt7au8OABxMKFKy5Hdz/BBHcOG
         yCaW7cYNRxMw+MF8Ju9LYzGTH6qFUBgMveHBu0Jg9Lw0rG6KHAeFeqIdX8PnacrsVL5R
         VTmbYsuAKOElHdf/aI5CSigK0YLRtgZYfP6KgQMARPm8XrbsS29rJj9MoFbn8Sn2/lCM
         aLfgiok7+tgmwiZLA0KUbUu9jHXiOz2mMFeWJf+zSbqQshxl5Uz2XTzOe29iIA13HixX
         9EdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F1LOhReE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c126si15133141yba.27.2020.08.25.12.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F1LOhReE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAeod-0005uB-58
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeX2-0001gH-CJ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:22:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53558
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeX0-0006Ii-SN
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbwByfgjkAlI66puvl1t93XFLm462cmXMGwuy5iz4Gw=;
 b=F1LOhReE0UtrE7B6KmogkvAvYsxiQx1FZ1X3CQ54aKFfo6l3JrxM3m5uWTYzpkbk7k6JtP
 ZL7d6xef/BSnho4wDXpJ8jcAwQkeOFC/UUeU07U1b/UW2/o0RLgW7/0jmoWJCg8WEU4Akh
 cCFmw6Et54hFquI/RlDooT/ZVxIQ6bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-kizZn4sUO322dAYZ0AT8gA-1; Tue, 25 Aug 2020 15:22:50 -0400
X-MC-Unique: kizZn4sUO322dAYZ0AT8gA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442521074640;
 Tue, 25 Aug 2020 19:22:49 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BA419C4F;
 Tue, 25 Aug 2020 19:22:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 44/74] imx_ccm: Rename IMX_GET_CLASS macro
Date: Tue, 25 Aug 2020 15:20:40 -0400
Message-Id: <20200825192110.3528606-45-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 10:39:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xOOymV3JYh56

Rename it to IMX_CCM_GET_CLASS to be consistent with the existing
IMX_CCM and IXM_CCM_CLASS macro.

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v2 -> v3: new patch added to series v3

---
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/misc/imx_ccm.h | 2 +-
 hw/misc/imx_ccm.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index 33cbc09952..efdc451eb0 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -31,7 +31,7 @@
      OBJECT_CHECK(IMXCCMState, (obj), TYPE_IMX_CCM)
 #define IMX_CCM_CLASS(klass) \
      OBJECT_CLASS_CHECK(IMXCCMClass, (klass), TYPE_IMX_CCM)
-#define IMX_GET_CLASS(obj) \
+#define IMX_CCM_GET_CLASS(obj) \
      OBJECT_GET_CLASS(IMXCCMClass, (obj), TYPE_IMX_CCM)
 
 typedef struct IMXCCMState {
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 2f81b0ad73..52882071d3 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -32,7 +32,7 @@
 uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     uint32_t freq = 0;
-    IMXCCMClass *klass = IMX_GET_CLASS(dev);
+    IMXCCMClass *klass = IMX_CCM_GET_CLASS(dev);
 
     if (klass->get_clock_frequency) {
         freq = klass->get_clock_frequency(dev, clock);
-- 
2.26.2

