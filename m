Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp484918lfc;
        Thu, 28 May 2020 05:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy19o8SL7kFsWSovcts7VgudsLlyrfm+ebgbV5iXDCzQAyzU8KSyl8FhI1pQ5ee+9Bx9XO+
X-Received: by 2002:a05:6214:7e7:: with SMTP id bp7mr2876956qvb.125.1590669564538;
        Thu, 28 May 2020 05:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669564; cv=none;
        d=google.com; s=arc-20160816;
        b=qLsMI73YAB8+56D1sQxzMLzQ5/4CakLok5cq55vBZ+LPssvQNc+RdwislBms0QrS/9
         s5MslyGh35We3xt2vDOklkrcmXhmqew7LCLBryHvwcelX+WKRLFrRPjw/+KB3IfpTI4u
         Gz/g35t0GC30oe0uYXl3shVTdhmZF6sl9DAYmpFCa/4h/afm/+rgN0DetAyEOOIHBzmp
         FSjOBoIEcJVTKkwCWuIK5HfEWLF2Mn4J+G2gIYzKLM5REkJL/aFmU9OWrrEt2qIVMog3
         iEHJGRHZg1cvYsSorkM0zp8T1w3ONbik5fPyN0B4L4zeSFVYR3YCavqT8YAlrwtdKPDV
         Lg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SmcnOXujQdxKBlY0ohrOanJahBeVviXSktXX+AxdziI=;
        b=BEmx5F30PxhgDc2u3CEYBc288Mmep+w/J3F+6DvssEHLbMDg/QZAZ1dAG7FhikwTVI
         Ol66J/XFXPSmSwNR4ENic38P2cxnS+5HvToStgiWRwR5c2WBKgccc4+KwASo7zCIdKXS
         Wh5sq8flphEeyeXIdf+8uLHwYN1ampO8SMdwwDjIQYPSSNH50WWUKugOyHLCsw09kzwm
         d+0QVS7dHbTiJY3/eBilyLbvUofl6MaFmLfv65cQHJc6tMV75GeoRRqFLrVcky8nBFqi
         njMWABB4dCdHmQj15yDTgYwfqopZ1M4UbCqLn5+nm+avoa+KX7g8Cndm+eyZeXPue2ja
         vrrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dMdK1Oio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si1884786qkh.255.2020.05.28.05.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dMdK1Oio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHoh-0007Nn-SW
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlu-0001dn-64
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58559
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlp-0005B0-TD
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmcnOXujQdxKBlY0ohrOanJahBeVviXSktXX+AxdziI=;
 b=dMdK1OioVcpDwBw+MMVAlllutlv6UGQh4WF1sptmbmkVgN0WhejQRQSlryEYPPK/TwC72X
 fA5Wo2Zt52tXhSoGTWSzC0geQLdtU8nfIHpYnK6p5IUjgbAraX6OAS6m45Cc2xiqfW/fPY
 w07VGowXc1lCsKKpEBZ4zLpnaHAoKvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-pSVE4-8gPFa9fZPlJ6mYDQ-1; Thu, 28 May 2020 08:36:20 -0400
X-MC-Unique: pSVE4-8gPFa9fZPlJ6mYDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC69107ACCA;
 Thu, 28 May 2020 12:36:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 629CB7E467;
 Thu, 28 May 2020 12:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D15D59D60; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] hw/display/omap_dss: Replace fprintf() call by
 qemu_log_mask(LOG_UNIMP)
Date: Thu, 28 May 2020 14:36:01 +0200
Message-Id: <20200528123609.27362-14-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BObpvmab+DsO

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace fprintf() call by qemu_log_mask(LOG_UNIMP), which is
disabled by default. This avoid flooding the terminal when
fuzzing the device.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-14-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/omap_dss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 32dc0d6aa716..21fde58a2602 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -619,7 +619,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     if (s->rfbi.control & (1 << 1)) {				/* BYPASS */
         /* TODO: in non-Bypass mode we probably need to just assert the
          * DRQ and wait for DMA to write the pixels.  */
-        fprintf(stderr, "%s: Bypass mode unimplemented\n", __func__);
+        qemu_log_mask(LOG_UNIMP, "%s: Bypass mode unimplemented\n", __func__);
         return;
     }
 
-- 
2.18.4

