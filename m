Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp418386lfc;
        Thu, 28 May 2020 04:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD86TXAOKXwHDjnp7qkxpqnzvoBFx9xiEcz+d5VZ7a2dCDYAodsjHo1J7iqX0d2jRiJVQO
X-Received: by 2002:a37:4897:: with SMTP id v145mr2161942qka.26.1590664000014;
        Thu, 28 May 2020 04:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590664000; cv=none;
        d=google.com; s=arc-20160816;
        b=NwhMimp2wPUdpJbrp9KEstXibjfKToX/QPbO7+oqyGOusuAgNScDyNLoANAyN87Tjh
         P9mTdWzQ/b4ANv5xFRMi8O1Hk7uQ93N2aCAUetsAg4drxXUw4gMoizrXQRA6vXlXtfVa
         1ETEFPJwG060/RWf2+TejFQAjfYBjpcsZ1pCE+UWdWM8tNSgSpFWNWX3Ib239yAKTinw
         558jNMcsJWl2mdJDL/ahM5gLmRfJx436RPCmrVltY5XraSt6XeRbe1XjgP9MK+HYGAPV
         N9zGvuGVA5vFFeVHqbeJrJNCWBzBzKAwRfbC0GwSNl0jlPZtqHy+GkUUEk3iNHBiK/T/
         I03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pF5xuhSu7N48wGad8zUSYAG+GWm/0fg9fso5kGdrpCg=;
        b=KsPrsodehS8sKR0QlCSP/pcrZcoU2GDHtKOdaAEcCGFAZG2xMyqxh/lKwFA54Tq0wh
         guowTE1mYAuSjzYdct5GzR3t7URfp03OpflvglCpI1fln4gh/dwz1qjVbgmilpEFJxGr
         L56Hhf+Txr09+YgVclF5UEyoaO/Ra+eaOTNM+1uIv+NU47e0rBi2MWuWIAJ0MUncop+D
         iFjch5exXVdafQSa+QBDGf9yAevwT05GY9tH2GuK7nhgAyaOipq3laSM/uUWDv78+gL5
         H97SYMCQgFjT5Vr0gd2v03MFSUVHOBaD/YgMgQC/AY/709SNMHvwVkihMLYhhcN2SvuT
         ruOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g8gOSdU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29si3424833qkg.195.2020.05.28.04.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 04:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g8gOSdU3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeGMx-0007tI-Bx
	for alex.bennee@linaro.org; Thu, 28 May 2020 07:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLE-0005fo-LY
 for qemu-devel@nongnu.org; Thu, 28 May 2020 07:04:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28200
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLC-0006cA-BN
 for qemu-devel@nongnu.org; Thu, 28 May 2020 07:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590663889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF5xuhSu7N48wGad8zUSYAG+GWm/0fg9fso5kGdrpCg=;
 b=g8gOSdU3gFeHSH/W3byE236MRlX4B29FfkpRRjkFUcNIglr9DIj30pCoEZDV/qfvkyTmHh
 S887uZpRx9oGqcMFWBNo34dDtSUDHqy3h3S7JAamKyzQ+TeMHkiLzfcVoxLzu2UW/RnxTJ
 KWUdC7gTQRBVZ8Jh8A6kNfa4UfJcm/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-w1YPp1TZOt2UySDzdCjE_A-1; Thu, 28 May 2020 07:04:48 -0400
X-MC-Unique: w1YPp1TZOt2UySDzdCjE_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6AB835B41;
 Thu, 28 May 2020 11:04:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392AF7A8AA;
 Thu, 28 May 2020 11:04:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB61B11386A3; Thu, 28 May 2020 13:04:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
Date: Thu, 28 May 2020 13:04:22 +0200
Message-Id: <20200528110444.20456-3-armbru@redhat.com>
In-Reply-To: <20200528110444.20456-1-armbru@redhat.com>
References: <20200528110444.20456-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 02:50:32
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 pbonzini@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bAHkqAqIv6dj

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
2.21.3

