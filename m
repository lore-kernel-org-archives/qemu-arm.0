Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp434636lfc;
        Tue, 9 Jun 2020 05:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvLBwM/QrQPN2LVgFzSlMsg0AsO7Tc/4aQntTSyEneEg605P4gfmGRXgxWx3QAp4FOvKqI
X-Received: by 2002:a25:1045:: with SMTP id 66mr6266888ybq.314.1591705479802;
        Tue, 09 Jun 2020 05:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591705479; cv=none;
        d=google.com; s=arc-20160816;
        b=OOtIJPszRy+Lh0VAcveQE69MGYNxHmp1YgCy94Y1+0pRDVfe2boCrImU6gkOE0UagO
         9hooWeLmOcMlf+cu0w8pxu9HkJ8l1IA4sl3oOlEAWOxSlJxufIERU80wS7CoVFCJNHVG
         iruE7IoNtZ3CVX9sqxm+EGUFPXP4oMch5OzLkqj/Y4EMb9vhgQihILVegvFUcDe46f6z
         dAJJV5jS7TPQ9/pbwxVe+wUeihwR9jcmE+sBBEdndW8Srn6Gd2nD75JvkUYimlpuxuY+
         Ty8b8KHtOHMKldU3vZK/cGKwbsvxMd3OT3DkoSgD/9w7+FZsEI/4rHYusyJ+xqnjZyZb
         ZIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K59/hKf6qe51n1zVZOxDMNYZ4UOlmMA/Z8EC0nq3+ng=;
        b=Bi2J/EaA7KBDYa1nB4lHhEqKTlAmOqZzGdcnRGRYjnQYlvmd9jWqpLmG6v1Vo7eIXD
         Uw8uZUSXwF5Qz4Wfz3llhdfz4TjDcb5ic/YejcIkx269NvZWa4AYGWldt4elcdEBZwq4
         Lq4nNmxnVuguaSi9EaYZ4/3f2jLfgYmq2OOodhynahi4VAvMySGZvDLgou3hWNCVotRD
         raz6PbS3JzD+i4gvARTtbOzRFkqwVpXzgADvpKI2ObcspKcqQ2pYinBrV8zl7Z7/yeI4
         CUMqjS2TQXB5NFDpRiRcmkqBQacbxmco5KwqY4x5QH4zsIdI57u5h/Ym8OZPMXk5oPDK
         3s4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="R9/BQw5j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si2420616ybp.34.2020.06.09.05.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="R9/BQw5j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidJ1-0003r6-45
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidIG-0003Eq-Sd
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:23:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35230
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidIA-0005PG-CC
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K59/hKf6qe51n1zVZOxDMNYZ4UOlmMA/Z8EC0nq3+ng=;
 b=R9/BQw5jrLXLoyW5Iq0+mPvba/dAXnX3HpvWS0ViWyZ57f6NKdkr3OrEgWt9ONrAy/73MQ
 pHHR3TjM896Lcio/OS0qbqmBZ5oz4cKZxIZub4TXa/k8743n2DfEgVvWqkfFAVjl5wV7jg
 OKmOFo/hJdgXkj/OYFt73g4RtDVFriA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-FKLaniFzPrq5YBho0i4Uxw-1; Tue, 09 Jun 2020 08:23:44 -0400
X-MC-Unique: FKLaniFzPrq5YBho0i4Uxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F2C107ACF6;
 Tue,  9 Jun 2020 12:23:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6167560CD0;
 Tue,  9 Jun 2020 12:23:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E014211385C4; Tue,  9 Jun 2020 14:23:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
Date: Tue,  9 Jun 2020 14:23:17 +0200
Message-Id: <20200609122339.937862-3-armbru@redhat.com>
In-Reply-To: <20200609122339.937862-1-armbru@redhat.com>
References: <20200609122339.937862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 pbonzini@redhat.com, KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJBlCCtnozhT

xlnx_dp_init() creates these two devices, but they're never realized.
Affects machine xlnx-zcu102.

In theory, a device becomes real only on realize.  In practice, the
transition from unreal to real is a fuzzy one.  The work to make a
device real can be spread between realize methods (fine),
instance_init methods (wrong), and board code wiring up the device
(fine as long as it effectively happens on realize).  Depending on
what exactly is done where, a device can work even when we neglect to
realize it.

These two appear to work.  Nevertheless, it's a clear misuse of the
interface.  Even when it works today (more or less by chance), it can
break tomorrow.

Fix by realizing them in xlnx_dp_realize().

Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
Cc: KONRAD Frederic <fred.konrad@greensocs.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/display/xlnx_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 8d940cd8d1..5210412e55 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1266,9 +1266,13 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
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
2.26.2

