Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6377183lfa;
        Thu, 22 Oct 2020 01:30:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVaxX+oLVYykQO9ht8dz8vqv7wMXNcP0upkgikkpZUUuwnDaINP6fyMGZCJhDA21jJpGHa
X-Received: by 2002:a5b:792:: with SMTP id b18mr1768073ybq.338.1603355422993;
        Thu, 22 Oct 2020 01:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603355422; cv=none;
        d=google.com; s=arc-20160816;
        b=Lw4gvnv14WI1eTthrHAh33dkogzbwNz6XxqCaW1MxkL9h77YGoQgUpITRu2ytvtQT5
         Mqd397t4J/gqS29cwiwqQ6FQQRbDq7mSQfC/wSMEO9k6beF3OZ99tK1QDSzS0ZrC4QPR
         mg7LfGGA1u+uPfxxs+T/7QNiP7btxEKxNYVjtX5jmZp7J3nvr+BPkP7pPY0dIw1qpqXS
         31coSBq0svdDGjA42vSRAklX0FORstx4zJTd1QJSTjiQ+7z/ABvzSC7gYn16Ee+ne4R/
         9WNmTcUx1saAfq9oUEm0EvzoMYeaD/MLPB8n29REMO6cc5YneycWXi2HfXORlGZAC0aP
         mFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gyRZHdqvOhIxkXvMbN6+hq8Shppks6KTEdlR4q91cNw=;
        b=dUr2xHyGz34lVPFQ7VtdJ7Rx1MKHyiw3G0nC83OhimMkCH8ka70eUCDEKuTjBr50ya
         CYkpZNA7MOFCs2GcWhNNbwFJBVda6u9RcXVtpBfEWxbYLwRs1MsGSLxaY6pHxE0zz8Qc
         zYLOhUT6caKQC0vZ2TcdCdiUDnw8c4T3oJMOgkvXixytprXBssl7o8NozOJMtteCaq0y
         fI82yDdY6YeX3uq/ZxLG+wujwqQu15dctTDuf+3d5FxoGRZcxWhppH6hSuNrA30CGRur
         V8cgx7rQ3MN/yS1iZA0WD5wZOaJYCBVTJsUIkLk6UyaCNG7v8QMCUYQKHf4bEoSrX4ow
         wGqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=j6nmfxOG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si660527ybs.273.2020.10.22.01.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 01:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=j6nmfxOG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVVzK-00019Y-Bb
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 04:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVui-0004Tt-NB; Thu, 22 Oct 2020 04:25:36 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:34234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVug-0006CL-N0; Thu, 22 Oct 2020 04:25:36 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8OvKH114614;
 Thu, 22 Oct 2020 08:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=gyRZHdqvOhIxkXvMbN6+hq8Shppks6KTEdlR4q91cNw=;
 b=j6nmfxOG3a1zGYFruEuW5c94qAuS1V+1uY1PJ8nGK3SE2L3x/fK2ZXX85ZHqnUA8SXza
 9W1r7DQgkit3UQR3xLK81RfCF3Gv0lagVRnfRgpQeKyi/oI4Kn1/wM0jYSqy8P7q3K2X
 HtnVjdfNezOREEV9gysW+CPg4WZb9qClPZHTX0XsuAx0/4XDKGr/qAEfGY7AmAYWR45p
 SW+2JJJt3Gf5rVTAobERiIj4VGAg0DY3QupDJUeNRjw7rGejSJS4lrQsB2CcGpq9RHzi
 drs/05fOj9Xt5E/zD9WbRjH7TzWDaxUOyh/T/j4WdJ7L5gfRnQSdXZE3GHLCjlbbg8Qu ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 347p4b4nwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 08:25:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8G7uL094709;
 Thu, 22 Oct 2020 08:25:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 348a6qbcr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 08:25:31 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09M8PV8j020781;
 Thu, 22 Oct 2020 08:25:31 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Oct 2020 01:25:31 -0700
From: Mihai Carabas <mihai.carabas@oracle.com>
To: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com
Subject: [PATCH 6/8] hw/arm/virt: add configure interface for pvpanic-mmio
Date: Thu, 22 Oct 2020 10:42:54 +0300
Message-Id: <1603352576-21671-7-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
References: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=1 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220056
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 04:25:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, Peng Hao <peng.hao2@zte.com.cn>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvK0UGsWwo1u

From: Peng Hao <peng.hao2@zte.com.cn>

Add the option to turn on/off the pvpanic-mmio device in virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 hw/arm/virt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 63f09a6..7548977 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2161,6 +2161,20 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
     vms->mte = value;
 }
 
+static bool virt_get_pvpanic(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->pvpanic;
+}
+
+static void virt_set_pvpanic(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->pvpanic = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2594,6 +2608,14 @@ static void virt_instance_init(Object *obj)
                                     "guest CPU which implements the ARM "
                                     "Memory Tagging Extension");
 
+    /* Default disallows pvpanic-mmio instantiation */
+    vms->pvpanic = false;
+    object_property_add_bool(obj, "pvpanic", virt_get_pvpanic,
+                             virt_set_pvpanic);
+    object_property_set_description(obj, "pvpanic",
+                                    "Set on/off to enable/disable "
+                                    "PVPANIC MMIO device");
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
1.8.3.1

