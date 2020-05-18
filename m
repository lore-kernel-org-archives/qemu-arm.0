Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2703049lfb;
        Sun, 17 May 2020 22:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPSF48EUt5UA7yecm9bf1SWdeiLSH3zNWOcMj6m4NfXUKjXyIzYD8KKRIdVSOwWJaWDSTh
X-Received: by 2002:aed:2ba7:: with SMTP id e36mr14212188qtd.370.1589778312371;
        Sun, 17 May 2020 22:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589778312; cv=none;
        d=google.com; s=arc-20160816;
        b=VmBMexw1AxKKb6cARvNdQw0pJKLPxs884cceVv1alzctlUmQ3wwWpuK6msH76VLDms
         10793n7UzpJ/kaCFRoWqtEQH6xZ26+JjnXX2Pnq0FeoOHI7040KeNimv57wxEhGQsdAC
         RtQxHTwvgeezwQhz4uEsUJOc6w0wlVpMSAfYlE1qqzQaC/W3uiJihjWwqayNWRQ7m/YF
         py/D0va8sdTCLTdtye7Dh9cfzPO/KrDkzdJXRG8lY5sQI1r2TOlTXCQQxjhnRRylqHaE
         HRM1nZdpkxV/Z6Oeq9T7E3xGl6t9WCBvRshApJoQWPpO3P41Yjh0eu5bTIrMWQ3OlDDk
         l1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dTynOku05k030QBAXzjtmPBoO1zSrlKNW32vohlg27w=;
        b=o09W4MVgwalRNRvybVDeDwMweEE3NtyzgsYUK4BYlZxLNkSQFnK/eCFEnDrrA5bxqp
         FT4DbVgwy385XTn2itbYRn4On43OIyOultEbeRRI1pHoACESWY17ZehGwO3ISGU83x2n
         8uRT1f8TOnqovLSh1z9DSmtFapQMCfqC0exz6LzYgG3ZlQNN6mZh41Of30HDIAZZQMWL
         DuefiTkjqcUDK4LKNGq87DOdaKK8qeyw358VdSbw5Rmv4eZopiVWP96ZEzhHimhbN3W3
         iWbwH4BMMHAXRc2L2GuccowiaW1yqXT9uiVPNw/bbp5QkGP4VWAIvNDzUAyWPpmJmJML
         Atyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U4Q4mCxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t195si59403qka.226.2020.05.17.22.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 May 2020 22:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U4Q4mCxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaXxf-0001Av-Ma
	for alex.bennee@linaro.org; Mon, 18 May 2020 01:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwq-0008RT-9v
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48446
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwn-0004MD-24
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTynOku05k030QBAXzjtmPBoO1zSrlKNW32vohlg27w=;
 b=U4Q4mCxDOc3Irr1zT+7HVcRWCEU6dU/2rTyYyM+VpMLnOhq4Rgk12iLo0c+YFP1phNJPDD
 1wNftClyNqMPUtdh4pz0cf+ACqg3LWCec4fUEAvNE2rZUGeu5RAo9GQp25xcpo4Yh75CCv
 1Lf29IMRXU0UQNIdMPARLKuVYOfWoEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-ESUCu2i9PI2aTMHpNAz1oQ-1; Mon, 18 May 2020 01:04:11 -0400
X-MC-Unique: ESUCu2i9PI2aTMHpNAz1oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE9F1800706;
 Mon, 18 May 2020 05:04:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 984958208F;
 Mon, 18 May 2020 05:04:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B52F11358BE; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
Date: Mon, 18 May 2020 07:03:46 +0200
Message-Id: <20200518050408.4579-3-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, pbonzini@redhat.com,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WXM245bVc+Hd

xlnx_dp_init() creates these two devices, but they're never realized.
Affects machine xlnx-zcu102.

I wonder how this ever worked.  If the "device becomes real only on
realize" thing actually works, then we've always been missing these
two devices, yet nobody noticed.

Fix by realizing them in xlnx_dp_realize().

Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
Cc: KONRAD Frederic <fred.konrad@greensocs.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/display/xlnx_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 3e5fb44e06..bdc229a51e 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1264,9 +1264,13 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     DisplaySurface *surface;
     struct audsettings as;
 
+    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
+
     qdev_init_nofail(DEVICE(s->dpcd));
     aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
 
+    qdev_init_nofail(DEVICE(s->edid));
+
     s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
     surface = qemu_console_surface(s->console);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
-- 
2.21.1

