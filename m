Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp428032wrq;
        Fri, 13 Jul 2018 01:31:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpePeeP2GZgX2ESBpRMWr8OVWzFx2CHo2nPSZDMHnWip1DEx375bnGzY+sEDHxn/+k/lsfji
X-Received: by 2002:a37:a24f:: with SMTP id l76-v6mr4447278qke.406.1531470716124;
        Fri, 13 Jul 2018 01:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470716; cv=none;
        d=google.com; s=arc-20160816;
        b=oepNUsbNt0TNThNgs2Sr9qQd6qseIBWRkp7IJdH1OOsjBwkQBRXLDCPw1qPI4YCTXX
         yZOvLbX/rzjuIyqBRdjxfB9XlNiYHqKNgprWa+P1g2qZvCJwq/Tzm9xvfWsC+rsKheau
         crEYsVZ3oaeAoKjHitudVzBjVyZtm1TckjMPO04dWXn92a4MSIPA4SQrthHUN38RtPG7
         +QpeswfUPj3qMVGErQluHCYpRA0OArzTaR4pl1Rb/33IA7CgkmuMozJ/z5OUF0wSj5BM
         RVYaXTgmu2hXHE32yBl0xFamvClnilieaesluPVtjlvu4muW9H3DWPbwSkJiB3daQ5ff
         PTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gJToRWf4f5+pBbF0zgfmJsxFiFz9aGHOBeXln2AMZ3U=;
        b=mZ7QbNICYeqRwv0IyhDoJNU5TAx8eaNa5pEKPdt/Y0yJWumLoH27TWRS1bvc0aFrPE
         zh4hYQNbRlRxN3GG/rU7JnrZqv6ks4GYwrj5KfXS7OrQf/z9qHVDsVSZqcmUZ35qUt04
         /rRAMgIU1mfPO7U/PMilC72MB7rp4EP5Lg5OZbW7DeBYPTtlAJ1MVWc9CPyDqq6Y4LRt
         rWbugsZrRYbuR+jA9X3otm6yqjg+nZ5nwRD+ARCbYd9u0SEOm8/IyqbKK1kvyhe94jvB
         nEMRky1tEQPtAQvdPSv4Sm3VXkVOTpDhM/pMhFy2CLJ4TcEG49TSg+rDg+DYCAzft49Y
         B6BA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30-v6si15136505qtf.283.2018.07.13.01.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtUZ-0005H1-Jh
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQx-0002PK-Nl
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQw-0004bh-QK
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 04:28:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54416 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQs-0004Vs-Eq; Fri, 13 Jul 2018 04:28:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04EFB4075742;
	Fri, 13 Jul 2018 08:28:06 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51E3E2026D6B;
	Fri, 13 Jul 2018 08:28:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:34 +0200
Message-Id: <1531470464-21522-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 08:28:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 08:28:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 06/16] hw/display/xlnx_dp: Move problematic
 code from instance_init to realize
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F4MuFg0I7d0V

aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
the corresponding object. Thus this most not be called from an
instance_init function. Move the code to the realize function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/xlnx_dp.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 5130122..c7542d8 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1225,28 +1225,23 @@ static void xlnx_dp_init(Object *obj)
                              xlnx_dp_set_dpdma,
                              OBJ_PROP_LINK_STRONG,
                              &error_abort);
+}
 
-    /*
-     * Initialize AUX Bus.
-     */
-    s->aux_bus = aux_init_bus(DEVICE(obj), "aux");
+static void xlnx_dp_realize(DeviceState *dev, Error **errp)
+{
+    XlnxDPState *s = XLNX_DP(dev);
+    DisplaySurface *surface;
+    struct audsettings as;
 
-    /*
-     * Initialize DPCD and EDID..
-     */
+    s->aux_bus = aux_init_bus(dev, "aux");
+
+    /* Initialize DPCD and EDID */
     s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd", 0x00000));
     s->edid = I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "i2c-ddc"));
     i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
 
     fifo8_create(&s->rx_fifo, 16);
     fifo8_create(&s->tx_fifo, 16);
-}
-
-static void xlnx_dp_realize(DeviceState *dev, Error **errp)
-{
-    XlnxDPState *s = XLNX_DP(dev);
-    DisplaySurface *surface;
-    struct audsettings as;
 
     s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
     surface = qemu_console_surface(s->console);
-- 
1.8.3.1

