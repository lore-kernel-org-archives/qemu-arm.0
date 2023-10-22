Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp865754ejb;
        Sun, 22 Oct 2023 08:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH6wEuUKjs3+Ag7olZmF0iUo6IosZPLJrOR9kNYNOWQnmVkPdL6cqcBMO3CiGMsOWFbxsp
X-Received: by 2002:a05:622a:15cc:b0:41b:7786:f657 with SMTP id d12-20020a05622a15cc00b0041b7786f657mr10653430qty.33.1697990226673;
        Sun, 22 Oct 2023 08:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990226; cv=none;
        d=google.com; s=arc-20160816;
        b=eLTimFRoD61vbqLT4LfUrxeB6PWTRw8pWH40rxejYox3hopZUnNlnF4VJ9252knQYE
         uUWcGttScAtQC9IfiaShF+A4CuAvcpTUMh1YIzqqE6iqCpFrs35Yg0qtMFU6/qSOrWOa
         KedJsQVz+rX+nUHwehb6Q6GiBHQzFlOza/vK0tpiAaHq4d+Kq/vl77r0Bc9+7H0+Er1t
         R3MbeOThUggWa07PNmxVdmklBatGdDMlneeZJMr1GzdqgVI/1e6TzQ7M4v4IeUAxBLFn
         2snd62sSphKoz6CDo0tF8M3JsUzUUi/1rlDZzicF+8TllFsZWnOk51FSJ7HZEKG2lQlQ
         N5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yNOslSLwNSZBz1nMauOOhKrz2V+jkfbo6C3leUlOjxc=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=e+8otGAAAyfuGF0taisBZwHy9UmUlCI8pMeU+fPZWNPfZrQCfxxletTjGykJMm5kBE
         HCngqSScpYLbdlf9zoo5FnGvT5aso01auPsO5TEnOKessy8KvoZE8QtGxnG1RJQpPsxq
         o472D+5l26lWGb0PuhhD7Kp+X8lpKZ3LQeA78D+lUV5PRlrYpnlp+uPo5YzP2cfTdPPq
         +/EOGpVC2PJLc2waJ4WM/rz7huQ5DsUSWfCR3e0ei0Zq4S00QQa6OsGT00tiParYGXUr
         016IhLwHD6Es59iZjd0rwcW4fpYwPc2L9rI/hCVqdQnLEmjAHFNALZdH0FxNXSbaFC2o
         r8sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qCMQkmcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bz23-20020a05622a1e9700b0041807b58d25si4243894qtb.615.2023.10.22.08.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=qCMQkmcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qualj-0005kB-7V; Sun, 22 Oct 2023 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual6-0004sH-Q5; Sun, 22 Oct 2023 11:52:56 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1qual0-0000Ak-20; Sun, 22 Oct 2023 11:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yNOslSLwNSZBz1nMauOOhKrz2V+jkfbo6C3leUlOjxc=; b=qCMQkmcTP7rb3M8bOB3UFupqpN
 tRwB+ghhJpyaQEmzOaJeQ1dP79XOqNqfg0huvnM7ow26NKfUXmic5uKS+/YvO1tMolo5yzgObmLCe
 VSAxjdAx6YUb1w+luQhfAGo52Qa30yqlc/KjeDetNpVw7yDkMLkTnPPGGqA+dNakoE0/p0tl5guOj
 sEHBTY1HtLImAXCpdZes3hwZufPdxn/8j/L/aNB473sTCrZ8PsusFl6VzzPK18uP40liO0Vz/bLSM
 47MDpU1FqJMgoKghkaCkt79j62+opUuK6BHsyvJDBldhDjBzU6XdYrg3OvhQAsIERmrgeXFMw6oSx
 i+qkp3/Q==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCmj-0W; Sun, 22 Oct 2023 15:52:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakH-001qYZ-0P; Sun, 22 Oct 2023 16:52:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 06/45] hw/xen: use qemu_create_nic_bus_devices() to
 instantiate Xen NICs
Date: Sun, 22 Oct 2023 16:51:21 +0100
Message-Id: <20231022155200.436340-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mLy3jj8CgU4b

From: David Woodhouse <dwmw@amazon.co.uk>

When instantiating XenBus itself, for each NIC which is configured with
either the model unspecified, or set to to "xen" or "xen-net-device",
create a corresponding xen-net-device for it.

Now we can launch emulated Xen guests with '-nic user', and this fixes
the setup for Xen PV guests, which was previously broken in various
ways and never actually managed to peer with the netdev.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-bus.c                    |  4 ++++
 hw/xen/xen_devconfig.c              | 25 -------------------------
 hw/xenpv/xen_machine_pv.c           |  9 ---------
 include/hw/xen/xen-legacy-backend.h |  1 -
 4 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 0da2aa219a..194c1b7311 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "sysemu/sysemu.h"
+#include "net/net.h"
 #include "trace.h"
 
 static char *xen_device_get_backend_path(XenDevice *xendev)
@@ -1134,4 +1135,7 @@ void xen_bus_init(void)
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     qbus_set_bus_hotplug_handler(bus);
+
+    qemu_create_nic_bus_devices(bus, TYPE_XEN_DEVICE, "xen-net-device",
+                                "xen", "xen-net-device");
 }
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 3f77c675c6..2150869f60 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -46,31 +46,6 @@ static int xen_config_dev_all(char *fe, char *be)
 
 /* ------------------------------------------------------------- */
 
-int xen_config_dev_nic(NICInfo *nic)
-{
-    char fe[256], be[256];
-    char mac[20];
-    int vlan_id = -1;
-
-    net_hub_id_for_client(nic->netdev, &vlan_id);
-    snprintf(mac, sizeof(mac), "%02x:%02x:%02x:%02x:%02x:%02x",
-             nic->macaddr.a[0], nic->macaddr.a[1], nic->macaddr.a[2],
-             nic->macaddr.a[3], nic->macaddr.a[4], nic->macaddr.a[5]);
-    xen_pv_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", vlan_id, mac);
-    xen_config_dev_dirs("vif", "qnic", vlan_id, fe, be, sizeof(fe));
-
-    /* frontend */
-    xenstore_write_int(fe, "handle",     vlan_id);
-    xenstore_write_str(fe, "mac",        mac);
-
-    /* backend */
-    xenstore_write_int(be, "handle",     vlan_id);
-    xenstore_write_str(be, "mac",        mac);
-
-    /* common stuff */
-    return xen_config_dev_all(fe, be);
-}
-
 int xen_config_dev_vfb(int vdev, const char *type)
 {
     char fe[256], be[256];
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 9f9f137f99..1130d1a147 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -32,8 +32,6 @@
 
 static void xen_init_pv(MachineState *machine)
 {
-    int i;
-
     setup_xen_backend_ops();
 
     /* Initialize backend core & drivers */
@@ -62,13 +60,6 @@ static void xen_init_pv(MachineState *machine)
         vga_interface_created = true;
     }
 
-    /* configure nics */
-    for (i = 0; i < nb_nics; i++) {
-        if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
-            continue;
-        xen_config_dev_nic(nd_table + i);
-    }
-
     xen_bus_init();
 
     /* config cleanup hook */
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index fc42146bc2..2cca174778 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -81,7 +81,6 @@ extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
-int xen_config_dev_nic(NICInfo *nic);
 int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
 int xen_config_dev_console(int vdev);
-- 
2.40.1

