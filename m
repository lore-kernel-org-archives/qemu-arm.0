Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp486044lfc;
        Thu, 28 May 2020 05:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG0fvFWQ15CAWCAhHLRUYesmx2LRoMN6PU8HKhF4cBpVwvxKTfN3ivjjfjgF1SaCbQAJoD
X-Received: by 2002:a5b:ed1:: with SMTP id a17mr4747884ybs.41.1590669657491;
        Thu, 28 May 2020 05:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669657; cv=none;
        d=google.com; s=arc-20160816;
        b=qN5kbnVi/lLgFjvyM/5sWRP4lCXfg3GQnawaq/Nj2l1oCQvj6ICPrtBldDdjAgmY1I
         mT6A9YgE5zDQwGnKC3NKUKC/Wu+HC3HmKY87by5ea0a0mMrl04mholILgZMb0qPDjiwK
         6ud2BxU22Eo3tNlpdi7sZFfb0Nx35OCfYYBNZJdw2BsVcQnx9sWPc0KKyAdau+XCOOHS
         KD+oNemQuL1PlU7Rw6jGSjkNUGaWabY8NLYt1sz25V+M8uoqJa8/rLXcPYb9psgZk/Bu
         uvIZjgGa6cKQ4FtT2wVQhayxvN7nvEPkteewYww0xDjGk2Rj6Nhjxkdc/Tah2edFoSbX
         D9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=278g4ageQCy0goiXt62DoB6ekK6wxlvccTR7+duFaRY=;
        b=fv4hA2a/efMJchTMXQQAP0DzuI4i8bh7G/9ppVKKXkKRGjm4kDjjckuur4OZWvivcs
         H5xFwuOsZzBdP/hrAUdmXWuUwJSR01QJ+PQVywmMEeQ9auXXoaRYUesD7HTpitK78bN0
         Tsc6tLPylux1RvZNQ3BGYJ4ylI59FMzV6dYvgvT87r+qlYFJ/4h3OlL7dpGCTBZDKm0p
         Fgs9tAX7NYGOLXcNAsphH8l4kGe6hpvKA8swfVyHRfQ5Sv7r6kpF2h97xCsXDVQoc25d
         KhgZ7KoUrzczKw1KFp+JLqGfMkWiCp3ED5m7f6Vl3/H01pW5SFkh06XLiopHpWxGWzbO
         bn3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KL+i3BcF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v141si3431480ybv.165.2020.05.28.05.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KL+i3BcF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHqC-0002Pv-QB
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlw-0001k0-4N
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38833
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlp-0005BG-VX
 for qemu-devel@nongnu.org; Thu, 28 May 2020 08:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=278g4ageQCy0goiXt62DoB6ekK6wxlvccTR7+duFaRY=;
 b=KL+i3BcFWWhDCgks15xo3SE5VYy6pQAJq3QegCpX12eoO2kFcxnassR+hsG/qhP5XmtyAL
 ei2VPju5UI9rd9lZ65v5/jDYF8J4q8FwRDhA+lho71PaeIOFI2ETB4Z7+rFRroYEg8i4IQ
 c+AfKxxJIDv+Q1gwddYOYuRs6WKPGCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-tJKDLwrJMbWsZWSK5g48YA-1; Thu, 28 May 2020 08:36:21 -0400
X-MC-Unique: tJKDLwrJMbWsZWSK5g48YA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08DE3EC1A3;
 Thu, 28 May 2020 12:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B16F97A8B7;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 012AB9D69; Thu, 28 May 2020 14:36:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] sm501: Use BIT(x) macro to shorten constant
Date: Thu, 28 May 2020 14:36:05 +0200
Message-Id: <20200528123609.27362-18-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eyMB+yzzE8a0

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 124bf5de8d7cf503b32b377d0445029a76bfbd49.1590089984.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/sm501.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f42d05e1e4b2..97660090bb20 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -701,7 +701,7 @@ static void sm501_2d_operation(SM501State *s)
 {
     /* obtain operation parameters */
     int cmd = (s->twoD_control >> 16) & 0x1F;
-    int rtl = s->twoD_control & 0x8000000;
+    int rtl = s->twoD_control & BIT(27);
     int src_x = (s->twoD_source >> 16) & 0x01FFF;
     int src_y = s->twoD_source & 0xFFFF;
     int dst_x = (s->twoD_destination >> 16) & 0x01FFF;
@@ -751,8 +751,7 @@ static void sm501_2d_operation(SM501State *s)
         }
     }
 
-    if ((s->twoD_source_base & 0x08000000) ||
-        (s->twoD_destination_base & 0x08000000)) {
+    if (s->twoD_source_base & BIT(27) || s->twoD_destination_base & BIT(27)) {
         qemu_log_mask(LOG_UNIMP, "sm501: only local memory is supported.\n");
         return;
     }
-- 
2.18.4

