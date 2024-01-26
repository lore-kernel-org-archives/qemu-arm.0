Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1024815ejc;
        Fri, 26 Jan 2024 09:36:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFePO/fuSQmRN86cKAZkqIlz707Rw1ugLKM3yznhKjuad0rW/ryyln8d7qJJmUwP2Ky3fIL
X-Received: by 2002:a05:622a:287:b0:42a:5c53:aff9 with SMTP id z7-20020a05622a028700b0042a5c53aff9mr405570qtw.3.1706290563599;
        Fri, 26 Jan 2024 09:36:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290563; cv=none;
        d=google.com; s=arc-20160816;
        b=VxMZPc3BGzwjbcAI8TJLOeJX1aA/EzrbFOwM6fyV4zcFLC0i0pr2+BJeDNAqmnkUVB
         Zna3uxaX3Xx+cKaFSYRE3DzfM7XeAoNRwB10U1AzX5xMGXxB1icASATjQ1o52ke78Nro
         j9vB8dCj18nx8qm2bpArMcxKew0+5yZgwfQRf5GohVMbLqt3SeahCThj3Itt7p8VYhiB
         QSTgDaFqSt9+d/H5ow0gqxat1mwbAjFmdJ0MmADSC/lKFZDBcU0BwCion4al/3i46cXO
         MICyvj60H/3QAPMcUt2zyqNpfRrgPyFLOEt4i+LB1cdcb5F4/MbQjjFh20KONfq3lnUV
         Hq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l9x9HGNJH5fBiIeKzePXsIuGh5SQlI6/4CQcfviByuY=;
        fh=4aUA0JPxoVvgInBmJ96rXkS+v1RtLmlfy0HlzHtXDaI=;
        b=nnTL6Av3ru9SEKv+EhgJfk4LrY34P+F33LkyoRmk0YD5g/RbjfDgxd+LzLStw33Lgj
         DiXfV75lDbr6IE3SN08bcX/0P9kVYO/4LfIQqlxGjdqbvwXVMdtIeLPLsssrWUWWrxbp
         wnGIAElBCXrP2BoJHIzKK6Yp0QTY0SSqD7SR5Kw3ZJZAaTXrtPmK2TNWVOE78o7mfD0Z
         X66r4kHIyTnjEHrhHSIP7v0jSrDs5sOSChFVWF+KXvyTM1lZvDjTpn3LCMNEjsLckkts
         TeIgefBIqvFID1dv3LsR/8YARnPCVqHP7yXPaNhlNB/r2daa9y7C9NTSbTXxYjvQ6Iwh
         VgHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=IcyrOZNX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac87d89000000b0042a88077638si253914qtd.327.2024.01.26.09.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:36:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=IcyrOZNX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTQ4s-0007bw-BS; Fri, 26 Jan 2024 12:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ4g-0007Cp-5x; Fri, 26 Jan 2024 12:33:06 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rTQ4c-0001jN-Dw; Fri, 26 Jan 2024 12:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=l9x9HGNJH5fBiIeKzePXsIuGh5SQlI6/4CQcfviByuY=; b=IcyrOZNXHpSLCk6TAnka1I9R+t
 3vjdvrDxoj9S0mBl3ozeCJWq/HpqMLvBUMFAORv+1SBecbE0cDjMuO9aFvZON++rc1jPkHaC+ghgP
 5L8zN3gB8nHPOYYlPmvNpLlMSpTekahGSC4AOzs6+IIk9qK+fFFqtc84HLEgjDyCzQMwocC4VIUT/
 XGz64EbdU/7DMpdxI7atb/fpQg69VBiAOalydcEJ4bCCzYa2Cs/hf3UDE3MWX4+TH52Vy8uBkTNI0
 o2fSSTMwt5iZhujAmRuoamJkL+zcASmcD5odNtASTsals+MCB8T2mzCkE+4bw69w/+TPEehpiYgeY
 5a7gBiQg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4A-000000069Ui-1qun; Fri, 26 Jan 2024 17:32:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ46-00000001elG-432t;
 Fri, 26 Jan 2024 17:32:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
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
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 01/47] net: add qemu_{configure, create}_nic_device(),
 qemu_find_nic_info()
Date: Fri, 26 Jan 2024 17:24:38 +0000
Message-ID: <20240126173228.394202-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AkQ8umx/eMT3

From: David Woodhouse <dwmw@amazon.co.uk>

Most code which directly accesses nd_table[] and nb_nics uses them for
one of two things. Either "I have created a NIC device and I'd like a
configuration for it", or "I will create a NIC device *if* there is a
configuration for it".  With some variants on the theme around whether
they actually *check* if the model specified in the configuration is
the right one.

Provide functions which perform both of those, allowing platforms to
be a little more consistent and as a step towards making nd_table[]
and nb_nics private to the net code.

One might argue that platforms ought to be consistent about whether
they create the unconfigured devices or not, but making significant
user-visible changes is explicitly *not* the intent right now.

The new functions leave the 'model' field of the NICInfo as NULL after
using it for the default NIC model, unlike the qemu_check_nic_model()
function which does set nd->model to match default_model explicitly.
This is acceptable because there is no code which consumes nd->model
except this NIC-matching code in net/net.c, and no reasonable excuse
for any code wanting to use nd->model in future.

Also export the qemu_find_nic_info() helper, as some platforms have
special cases they need to handle.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/net/net.h | 40 +++++++++++++++++++++++++++++++++++++
 net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index ffbd2c8d56..dff1872b4d 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -207,7 +207,47 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
 void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
+/**
+ * qemu_find_nic_info: Obtain NIC configuration information
+ * @typename: Name of device object type
+ * @match_default: Match NIC configurations with no model specified
+ * @alias: Additional model string to match (for user convenience and
+ *         backward compatibility).
+ *
+ * Search for a NIC configuration matching the NIC model constraints.
+ */
+NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
+                            const char *alias);
+/**
+ * qemu_configure_nic_device: Apply NIC configuration to a given device
+ * @dev: Network device to be configured
+ * @match_default: Match NIC configurations with no model specified
+ * @alias: Additional model string to match
+ *
+ * Search for a NIC configuration for the provided device, using the
+ * additionally specified matching constraints. If found, apply the
+ * configuration using qdev_set_nic_properties() and return %true.
+ *
+ * This is used by platform code which creates the device anyway,
+ * regardless of whether there is a configuration for it. This tends
+ * to be platforms which ignore `--nodefaults` and create net devices
+ * anyway, for example because the Ethernet device on that board is
+ * always physically present.
+ */
+bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
+                               const char *alias);
 
+/**
+ * qemu_create_nic_device: Create a NIC device if a configuration exists for it
+ * @typename: Object typename of network device
+ * @match_default: Match NIC configurations with no model specified
+ * @alias: Additional model string to match
+ *
+ * Search for a NIC configuration for the provided device type. If found,
+ * create an object of the corresponding type and return it.
+ */
+DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
+                                    const char *alias);
 void print_net_client(Monitor *mon, NetClientState *nc);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
diff --git a/net/net.c b/net/net.c
index 0520bc1681..aeb7f573fc 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1087,6 +1087,57 @@ static int net_init_nic(const Netdev *netdev, const char *name,
     return idx;
 }
 
+NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
+                            const char *alias)
+{
+    NICInfo *nd;
+    int i;
+
+    for (i = 0; i < nb_nics; i++) {
+        nd = &nd_table[i];
+
+        if (!nd->used || nd->instantiated) {
+            continue;
+        }
+
+        if ((match_default && !nd->model) || !g_strcmp0(nd->model, typename)
+            || (alias && !g_strcmp0(nd->model, alias))) {
+            return nd;
+        }
+    }
+    return NULL;
+}
+
+
+/* "I have created a device. Please configure it if you can" */
+bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
+                               const char *alias)
+{
+    NICInfo *nd = qemu_find_nic_info(object_get_typename(OBJECT(dev)),
+                                     match_default, alias);
+
+    if (nd) {
+        qdev_set_nic_properties(dev, nd);
+        return true;
+    }
+    return false;
+}
+
+/* "Please create a device, if you have a configuration for it" */
+DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
+                                    const char *alias)
+{
+    NICInfo *nd = qemu_find_nic_info(typename, match_default, alias);
+    DeviceState *dev;
+
+    if (!nd) {
+        return NULL;
+    }
+
+    dev = qdev_new(typename);
+    qdev_set_nic_properties(dev, nd);
+    return dev;
+}
 
 static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
     const Netdev *netdev,
-- 
2.43.0

