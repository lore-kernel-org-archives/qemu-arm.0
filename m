Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp997557lfc;
        Wed, 26 Aug 2020 11:48:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6CxUoWwMJ+9vf31N6MGhB8Od/070NJ15Ln1q+2c9D8e8sRh4cPo5g2NKHOpV6sKupg60f
X-Received: by 2002:a5b:411:: with SMTP id m17mr23694608ybp.176.1598467713951;
        Wed, 26 Aug 2020 11:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598467713; cv=none;
        d=google.com; s=arc-20160816;
        b=khtz0WXSlwb3qeeqpnpY5dvnCe4ty98slaDVyS1x0yFnZsxZWcxSW4jBsR7uQTN0oD
         i264pcJPApeVtUzkPUfjmEfX8npUfcRgSrw42lFutz2Lyx5B11a0HO5r+H4kPAFD413F
         npFn4muSlaZFfyMGI0ZHR8yswy/+LiOt3snhNKLiWc/JKr4se4Lc7ifWj/3BBh86iewr
         mXf2CIDrchCFMnuLNq9bfD8ikFSJEbatuJvW7a20LO3rdcKmcU2gxKmv35ReTYeswSa6
         GIeiTnyG2CkulYDp5Ys7hG/dHFjdsVmmPvNATUb3Z4cKaxvjkcNhqxFMCyK1koRz9eYZ
         GHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V470hnhAV2RJsaR865TY1HCJwQHJoQ8pyLgTI/W200o=;
        b=YQliW4FQtfN1ruxNXXiud9BS4uVOyLBUSp6FzDYScMYFcz8zBDK/yjp4016B+bME3d
         KwCNmQFtkL+N4vr99EnZyyFg3/hN95Iv+X1DqA+BwVM06W3TYeTdfDZJ7M0s8w8g3dmQ
         qkQvJwyIs23oKDV7QXeZt9G/5DDRTosmQhNO4RE5nrefn4Xjen7HjNrgaCAYKlC+MHF8
         aVhtO3diHrLV/R1csOklpdfBi0GTtdnsodrLmj4Ai5bpKSad6okJWfLPiyGyypA2ZFem
         Ka5sKvZfMfY71ngt2hBjPfukXi5CVyskdXbDAnFAwA9kz8lAz2p1aqoNu6B65AaGoO16
         KTCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhXZ0TfQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si2772417ybb.168.2020.08.26.11.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 11:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhXZ0TfQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kB0TJ-00057v-Al
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 14:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0On-0007Jh-Ky
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:43:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30749
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0Ol-0001FN-M5
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 14:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598467431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V470hnhAV2RJsaR865TY1HCJwQHJoQ8pyLgTI/W200o=;
 b=RhXZ0TfQWiVgKAvSzEBCg/h8J8JwTrbvdJUciyVwSSQB7NeYsovSeK4cs4wdfhMoAin3Zx
 HinTNlh2DorWvFyQZU0KiAJxtaou4X5HdFZxL6y1j+HYma4+Sj3+w78e8T4G4yvykUjOlG
 mKaZ7ITaX2goGgSdFde3naf9wrHOP2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-SMqeKr-KOK-4RyeBcCU3zQ-1; Wed, 26 Aug 2020 14:43:49 -0400
X-MC-Unique: SMqeKr-KOK-4RyeBcCU3zQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FFA10ABDA1;
 Wed, 26 Aug 2020 18:43:48 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E356F1002D42;
 Wed, 26 Aug 2020 18:43:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tosa: Use TYPE_TOSA_MISC_GPIO constant
Date: Wed, 26 Aug 2020 14:43:32 -0400
Message-Id: <20200826184334.4120620-7-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-1-ehabkost@redhat.com>
References: <20200826184334.4120620-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-TUID: 3pbpn3MIYhb+

This will make future conversion to use OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/tosa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index e29566f7b3..90eef1f14d 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -316,7 +316,7 @@ static const TypeInfo tosa_ssp_info = {
 };
 
 static const TypeInfo tosa_misc_gpio_info = {
-    .name          = "tosa-misc-gpio",
+    .name          = TYPE_TOSA_MISC_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(TosaMiscGPIOState),
     .instance_init = tosa_misc_gpio_init,
-- 
2.26.2

