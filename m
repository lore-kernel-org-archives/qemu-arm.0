Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp482889lfc;
        Thu, 28 May 2020 05:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsBapJiAiNTEtItBCsT3b6ATx4VoNlXTnoOq+EaDUJfglYr/6cWE+6TlgVL/1vsJ/wJSUs
X-Received: by 2002:a05:620a:ecf:: with SMTP id x15mr2399290qkm.465.1590669396942;
        Thu, 28 May 2020 05:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669396; cv=none;
        d=google.com; s=arc-20160816;
        b=zUOP3eznyACcgo5rK725q4s5PaE2oLETMTZa4dF5tTN3XeT/qWc/dynV39XLEQoE0+
         cYyHfS1yl4NLPPtRusruqzyryTrIAXZB0p5Alj+p1kdHaX+Qc+EiqspOyML0FpGN6hXq
         5mq3eiLOXDmY47sorDCr/rRiw3Lsd33q/xV3/4U912gO+6pXjOofJXl1rCKIyORguaGC
         FmNy8xNqeWmS0R1yaoK5SKE8ZY44YEYFcsXrCkduX0trFlfDlxB0GJsNhUPWD6QEEfO1
         s6FrzC9l/DthscTd0o7QRQYuHuPUcWr7bsSiI2EjxNSRvNsjPxgKwmPmlE4Q/L661tKz
         8F1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NQraKQ1whxiMPOPRulSbwT/9AZGl8U9QqvXdcnOFJ2M=;
        b=x5UwPfV/nTeyXNbUPkXgXIBHASx76tMBOkD3ZgVTO6Y5HNnR5Eo6YETk3CegGl08UG
         59mj47KLQltZXt/T/jfTvwzAKprQHmLOqBno8zRJHMzJX14CoNMhwNTvRQ1pNhuIFRDo
         MIevYxfCbY1dOvFzpWNqSRNIGaUVM4JX+mu8gU/uHpkdl7ZKyGxYru1GihwsNc2RHN62
         PU6IU3WsWHNOGZM3K2DjMf+St6s1i+qkF/fW1TDOOJLBCOhRgtxWITjbW+5sFSPAYtX/
         bgIxUSvBXL0WozpYXIKTK3PN783rS0BwqRbQwXsk9KJYN0bWEdOjCwdZvsHyUX5M4S1F
         n+GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEcuxlHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z82si3368772qkb.9.2020.05.28.05.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEcuxlHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHm0-0001U3-2e
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlo-0001SJ-Bo
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46680
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlm-00058p-Tp
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQraKQ1whxiMPOPRulSbwT/9AZGl8U9QqvXdcnOFJ2M=;
 b=YEcuxlHtp1oi5IVguYKAr5QillPwD189ysFCe+GxMQYL3X+kkORU/Wtbdq4EFL2EDDn7SL
 2tU1VOJ7+VLNNhOdlfilhZaf1liWzPCaEuxcXZN9c9XjUBF21mB4U/snwNIFqRinv2QYfq
 SvJ29O8M0pwxWLNAX5yPKVWa9JNNiWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-y3HQRic6Nl69h3rhBn_Ahw-1; Thu, 28 May 2020 08:36:18 -0400
X-MC-Unique: y3HQRic6Nl69h3rhBn_Ahw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 387301005510;
 Thu, 28 May 2020 12:36:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2743A7A8B4;
 Thu, 28 May 2020 12:36:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7505C9DAF; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] hw/display/cirrus_vga: Convert debug printf() to trace
 event
Date: Thu, 28 May 2020 14:35:51 +0200
Message-Id: <20200528123609.27362-4-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: m/rw2EeWCw+O

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-4-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 4 +---
 hw/display/trace-events | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 1f29731ffe11..33ccdde00061 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -1512,9 +1512,7 @@ static int cirrus_vga_read_gr(CirrusVGAState * s, unsigned reg_index)
 static void
 cirrus_vga_write_gr(CirrusVGAState * s, unsigned reg_index, int reg_value)
 {
-#if defined(DEBUG_BITBLT) && 0
-    printf("gr%02x: %02x\n", reg_index, reg_value);
-#endif
+    trace_vga_cirrus_write_gr(reg_index, reg_value);
     switch (reg_index) {
     case 0x00:			// Standard VGA, BGCOLOR 0x000000ff
 	s->vga.gr[reg_index] = reg_value & gr_mask[reg_index];
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 47b2b168ae15..c3043e4ced19 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -133,6 +133,7 @@ vga_vbe_write(uint32_t index, uint32_t val) "index 0x%x, val 0x%x"
 vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%x"
+vga_cirrus_write_gr(uint8_t index, uint8_t val) "GR addr 0x%02x, val 0x%02x"
 
 # sii9022.c
 sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
-- 
2.18.4

