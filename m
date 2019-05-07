Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357827wrh;
        Tue, 7 May 2019 01:21:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzFoEpxrmEiD9r473p1kui52YuVS98O6aVALUPiqmLl8YQ3diguAG3LC0DJJo6S6yT9GfA
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr17356430wmb.23.1557217276175;
        Tue, 07 May 2019 01:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217276; cv=none;
        d=google.com; s=arc-20160816;
        b=KK8xe8qRydFP7+2blp1TbOQKIBdrYPglDFHWwIqNoqgPttIcp+A6WBRHY+5f/6pYE9
         yCxPbJqKBxspBi775NbD+eqD0dViJqfTBHK2xxQWYfRVVDXm4YO6LvsgiaUaQutOfgqy
         GnXAM4ZvU4fywbPbRuePSzCFELGpl3aq7dcZSOp6HokNK3Pv5UNIoqh/ta10apnnprgu
         ia5uAaeyyS5HBn6DNxVm7MyXolzEEczARGkU5gY80+gJNdxqgF81z6K+NaxWzF964dxj
         PI107RG8XbMv2Voy6xRceqmjoJcNaX2Z5K1eHDTBkd1gFYIJwqeXILagx9DOFnWrf/Tq
         6T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=sF4g5YBTChoqXzlCzbAgoz6oX5cWHotMAiuOzE1YM2c=;
        b=EazKnMoTozYASNcbUlqwXQwEA+8O/9Po3xbVemL1nZEZR5iWeTUkq9hMd/3DNrQ6rJ
         sfV/UF2XHkRU/1O68aByKxHS/N6+Gyyi7tyCNGjRSQoqQ1mxzCdna+vkjRt4oJH7Y6ll
         /zfZxMly3Pk9iHR4q9nsRqdU5/1FbNGHZ3kmL80fEfvZMyJbdBbpOVoOnkdaqlZu/kfI
         RriBd1LEKTr6SwEKsT0mcT7ZI5cPz7NcyWAPsgmyN35tsls0WgH97rySpHRJeZW9EOQV
         cxM+Cw4F2JuiXqLXh4ogqM9Gl1o46ZDQ/q7JdnPVCCgStwbhrwEG52ruxT3jEt+qyWzT
         PzxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si4224563wrw.101.2019.05.07.01.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvLf-0001wl-4D
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:21:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKN-0000fb-HI
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKM-0008Ah-Jb
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKM-0008A7-DX; Tue, 07 May 2019 04:19:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A18843082134;
	Tue,  7 May 2019 08:19:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDD39614D6;
	Tue,  7 May 2019 08:19:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B1C8AA1E9; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:45 +0200
Message-Id: <20190507081946.19264-8-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 07 May 2019 08:19:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 7/8] ati-vga: Fix check for blt outside vram
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HavAweoScEh1

From: BALATON Zoltan <balaton@eik.bme.hu>

Fix the check preventing calling pixman functions that would access
memory outside allocated vram. The r128 X driver sometimes seem to try
blits that span outside vram, this check prevents crashing QEMU in
that case. (The r128 X driver may have problems even on real hardware
so I'm not sure if it's a client bug or emulation problem but at least
QEMU should survive.)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Andrew Randrianasulu <randrianasulu@gmail.com>
Message-Id: <20190409110732.5C5FF7465DB@zero.eik.bme.hu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati_2d.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index bc98ba6eebf6..fe3ae148647b 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -79,10 +79,10 @@ void ati_2d_blt(ATIVGAState *s)
                 s->regs.dst_width, s->regs.dst_height);
         end = s->vga.vram_ptr + s->vga.vram_size;
         if (src_bits >= end || dst_bits >= end ||
-            src_bits + (s->regs.src_y + s->regs.dst_height) * src_stride +
-            s->regs.src_x >= end ||
-            dst_bits + (s->regs.dst_y + s->regs.dst_height) * dst_stride +
-            s->regs.dst_x >= end) {
+            src_bits + s->regs.src_x + (s->regs.src_y + s->regs.dst_height) *
+            src_stride * sizeof(uint32_t) >= end ||
+            dst_bits + s->regs.dst_x + (s->regs.dst_y + s->regs.dst_height) *
+            dst_stride * sizeof(uint32_t) >= end) {
             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
             return;
         }
@@ -140,8 +140,8 @@ void ati_2d_blt(ATIVGAState *s)
                 filler);
         end = s->vga.vram_ptr + s->vga.vram_size;
         if (dst_bits >= end ||
-            dst_bits + (s->regs.dst_y + s->regs.dst_height) * dst_stride +
-            s->regs.dst_x >= end) {
+            dst_bits + s->regs.dst_x + (s->regs.dst_y + s->regs.dst_height) *
+            dst_stride * sizeof(uint32_t) >= end) {
             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
             return;
         }
-- 
2.18.1

