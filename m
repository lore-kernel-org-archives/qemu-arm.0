Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1765414lfo;
        Mon, 7 Mar 2022 12:08:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwToygdfDYKajeto4DZO3eTWSDZT+qQwaBhVy/8PGNKwraquZ2JBSHKmJZ8EGNnzMhUtwvC
X-Received: by 2002:a25:83c7:0:b0:629:2185:e172 with SMTP id v7-20020a2583c7000000b006292185e172mr7891702ybm.611.1646683727159;
        Mon, 07 Mar 2022 12:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683727; cv=none;
        d=google.com; s=arc-20160816;
        b=kUP/Izv3Hgz2J0VBtty+w0ubN+0HR7wPJnM39Z7uonVYa+vMy9Oh9D41PuF6N25Xe2
         gR2sOt12IUB2LrC+KyVba0p+/hMIq20gaGcBbK76NjnZykkLr6mZ5TCM/LG3E8V0lLSz
         TPSTCkZIzPG0G+oeY4e2TQFYxoJpwvi8rF+xSVBnWoiM/uYoQXPmUS+VCyc7Wot/V7/m
         PXd6nLZwl8DjQ+Rwbhq1+CJ9s+5Ot8j8Cx7vP1wIzEOc5xWXU3rTZz7KGQIAW/0N+++H
         k/JFo881Vc21RJtXRAkj9vWCN+3w7hy9wfDzejIjoZA0GWy272Bic5UENOSNQ957KKwr
         KaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=fuxeolvYtT1rUv8+RAPBHndV9yAA+6y/PMueIP2IGFk=;
        b=EZ4zwqhSGac9ypLIYY1/5bVoydOfajDb+P3RNccIL/l48MvT6L9i9L/12uMGcprx06
         CZlSwJgIi1mKiZYiv//q573DDiPiZznoDxE1aF/S9NDbNHHi/V53ob7C6KaH6drC4YGW
         KbFRmb+wfNxpPU0Rh2Hq50nsbKiBGgXO6qMUKCOAaP1zUEHoK0OZIw8POz8ZJU1wd2AR
         VpCGHNf0XvolhILa4Zu9GjoAfkcTSwRd3gz1IHqNT8EWOIuUEfO7/MdafxJcmNHVYZ4y
         HnDAtTxqUQutrGIoZ9sQuV5CnvzZVpcxgJ4pz33btEUouy5amllcPrYft6wUjYvIOt+7
         078g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=o5HMJdar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a81110c000000b002d7d76b602asi8297556ywr.330.2022.03.07.12.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:08:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=o5HMJdar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJew-0001qM-JU
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36GUmYgYKCGUWLWXVUJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--titusr.bounces.google.com>)
 id 1nRJdL-0007W9-QG
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:07 -0500
Received: from [2607:f8b0:4864:20::b49] (port=52807
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36GUmYgYKCGUWLWXVUJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--titusr.bounces.google.com>)
 id 1nRJdK-0006C7-0M
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:07 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so14499664ybp.19
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=fuxeolvYtT1rUv8+RAPBHndV9yAA+6y/PMueIP2IGFk=;
 b=o5HMJdarodHjxhR/ededmVSY4ZjLBiLSo171hePa9wj8Q+/oq42xr30UQgOmXZF0/p
 8tgv0CmCJooDPWMpmYl0mZrAEmKOt+Z019/+RkVYr+gVU1SHGWIQlXzQOQWJaoI5kery
 Cal1V6gA6I09F5p54AQUmykz4zMq4na3wWLd0lBEIldg6Txk7/GODTeEYm/kkvyLQRxx
 TbqQPsQTDDSGrSHMymVZATcSpTwIT41SYT+TpOGGUe3DUWw0FCoBT6L+YDE0+E008eLV
 uP1MFDAsCDL5cypwcrUWA6l3UYZ5xQ8MVSN57+KGxXp19oa6MCuIIWYK6ENvodyiZpM4
 22GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=fuxeolvYtT1rUv8+RAPBHndV9yAA+6y/PMueIP2IGFk=;
 b=ADwKPSkL7O6rxoCGM9QxdUWSkhdVYZC/8iNPMOPh6vpKLxC/R+o2Z6VQbjfBGddpvV
 eScaT/L1Gj/gI0KC/ia1k2v3vj4zW+QYbaWLNARGCIQFVDQ3tOYIt/R84W7/XZzwZiQf
 fbPPw49AQcAES4jNzXagQQcms4ZeISW2lvTif4tYvQ5kgqeOWi5Mf0k+uheBRjBl2ym6
 gN0NhPxCW4rY8So1QAc7uHr3uAo3qG0YIAyz2TrZZSSEk0zyGRmMJAs2mxX9CgsHNEKX
 cd8hsFlqx/0bWJ72wbWJaAZc6UZyhirAr2w2dXZBqb94EbwNmeRckwbFPky8l/RCHhS3
 N6mw==
X-Gm-Message-State: AOAM530aJjGHLyC5cI/8IPJCb+F2zfC/zoBICrinTanMsIEMEBO2tRPo
 CtwMY9N35qkzJjAsd59XzprBD/t5Jgo=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:8c8b:0:b0:627:f4a2:5a47 with SMTP id
 m11-20020a258c8b000000b00627f4a25a47mr9015905ybl.543.1646683624537; Mon, 07
 Mar 2022 12:07:04 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:04 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-9-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 8/9] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=36GUmYgYKCGUWLWXVUJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4fFIDummzMo

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/sensor/isl_pmbus_vr.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 tests/qtest/isl_pmbus_vr-test.c  |  8 ++++++++
 3 files changed, 27 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index f8cc75fc31..53187d619a 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -195,6 +195,15 @@ static void isl69260_class_init(ObjectClass *klass, vo=
id *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
=20
+static void raa229004_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->desc =3D "Renesas 229004 Digital Multiphase Voltage Regulator";
+    rc->phases.exit =3D isl_pmbus_vr_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
 static const TypeInfo isl69260_info =3D {
     .name =3D TYPE_ISL69260,
     .parent =3D TYPE_PMBUS_DEVICE,
@@ -203,9 +212,18 @@ static const TypeInfo isl69260_info =3D {
     .class_init =3D isl69260_class_init,
 };
=20
+static const TypeInfo raa229004_info =3D {
+    .name =3D TYPE_RAA229004,
+    .parent =3D TYPE_PMBUS_DEVICE,
+    .instance_size =3D sizeof(ISLState),
+    .instance_init =3D raa22xx_init,
+    .class_init =3D raa229004_class_init,
+};
+
 static void isl_pmbus_vr_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa229004_info);
 }
=20
 type_init(isl_pmbus_vr_register_types)
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus=
_vr.h
index 4e12e95efb..233916f70a 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
=20
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA229004  "raa229004"
=20
 struct ISLState {
     PMBusDevice parent;
diff --git a/tests/qtest/isl_pmbus_vr-test.c b/tests/qtest/isl_pmbus_vr-tes=
t.c
index f77732ae96..dc0ccae2aa 100644
--- a/tests/qtest/isl_pmbus_vr-test.c
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -390,5 +390,13 @@ static void isl_pmbus_vr_register_nodes(void)
     qos_add_test("test_pages_rw", "isl69260", test_pages_rw, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL)=
;
 }
 libqos_init(isl_pmbus_vr_register_nodes);
--=20
2.35.1.616.g0bdcbb4464-goog

