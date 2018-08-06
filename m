Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3450776wru;
        Mon, 6 Aug 2018 13:25:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeZXZlm+wyP5aho09HqlJGOCM6xPLUExHOsS/yGcO+5PZXaNXNu9/ZdmocM3HbwleBHwlOE
X-Received: by 2002:ac8:2c39:: with SMTP id d54-v6mr15015333qta.239.1533587131708;
        Mon, 06 Aug 2018 13:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587131; cv=none;
        d=google.com; s=arc-20160816;
        b=uk4H/Ra7K09euDjVdL96OcSayO0UZNQu846wWT7KGiWWkObeyitVJdOS5JaioxL4jB
         o+YjW2Y/IFcGRA+mFHOhWp58dMsdPA2pGkfHxlS/6rmgnxaiTyblXVVelK/vCx3WCyPr
         DUT2LIY/MRk9F3PPs6SKoyCeQ4eBqadOX2L5En13TnPmckYOQn36z/EWhpos/e90+vgN
         fyZzd+6SRP81WJfZ4hJrvQ+6vrceRuy91HMb55riNLe3WLxSG+iT4eMQDgwZimT7OxWA
         bPcU3XtyhpUr3zAxhy4HldF1gC4XDOY+vaB3jGL9F4nBUblzNZKWjCc5v/gFObxv0NRU
         HxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Fzy8CgT2vjdesJbhaErNH0dd7dUfhW8kslSWVqsd1Yc=;
        b=Z7JdDNQ8A3CowiM6ypKtK2QsJ6ckq5JeTxj1+6OQWV7oZ8TKTc74ldIqAp2ZwuVKMR
         jgutr71h5nzZ8HQEyd+gm+ddwU+vGOKHEVgkxJHmg6fwfgdAMGCWiNMNH5Z3ZQRD64e8
         PRhblswmbvh9vm+XngyHE3r5N/Yu49Po44ODNZW6oXeF+yMnnvnCmBlX3iXuKr5elwa3
         fHz20oEPiqBNzTBhTZVtplV3WM7wfLRA33xUSlKubhnfKZoxsis+tE8CbUmHWimNh2er
         FY008HQIgfXpME+E9dBDChIcOlsbrKS2u7yC0elDG9BsWpPlvGLi0ZQJFwD+NHLmkQns
         0ClA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5-v6si1294255qtc.134.2018.08.06.13.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm4J-0006tW-6k
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:25:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlui-0006b0-VI
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlug-00072I-Ma
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60174 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlug-00071n-HI; Mon, 06 Aug 2018 16:15:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EEFD81663FD;
	Mon,  6 Aug 2018 20:15:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7F7B2166BA0;
	Mon,  6 Aug 2018 20:15:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:41 +0200
Message-Id: <1533586484-5737-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 06 Aug 2018 20:15:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 06 Aug 2018 20:15:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 13/16] qdev: export qbus_find_recursive
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ySuubjKYZR7r

We intend to create the virtio-iommu from the virt machine
realize() code and not by passing the -device virtio-iommu-device
option. That way the instantiation of the virtio-iommu can
depend on a virt machine option, as it is currently done for
the smmuv3 iommu.

Its parent bus, the virtio-bus will need to be located and
set. We intend to locate it by using qbus_find_recursive().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/qdev-core.h | 3 +++
 qdev-monitor.c         | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f1fd0f8..f359c52 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -377,6 +377,9 @@ void qbus_reset_all_fn(void *opaque);
 /* This should go away once we get rid of the NULL bus hack */
 BusState *sysbus_get_default(void);
 
+BusState *qbus_find_recursive(BusState *bus, const char *name,
+                              const char *bus_typename);
+
 char *qdev_get_fw_dev_path(DeviceState *dev);
 char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
 
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 61e0300..666e439 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -410,8 +410,8 @@ static inline bool qbus_is_full(BusState *bus)
  * If more than one exists, prefer one that can take another device.
  * Return the bus if found, else %NULL.
  */
-static BusState *qbus_find_recursive(BusState *bus, const char *name,
-                                     const char *bus_typename)
+BusState *qbus_find_recursive(BusState *bus, const char *name,
+                              const char *bus_typename)
 {
     BusChild *kid;
     BusState *pick, *child, *ret;
@@ -567,7 +567,6 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         error_setg(errp, QERR_MISSING_PARAMETER, "driver");
         return NULL;
     }
-
     /* find driver */
     dc = qdev_get_device_class(&driver, errp);
     if (!dc) {
-- 
2.5.5

