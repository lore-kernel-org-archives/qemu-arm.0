Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp864939ejb;
        Sun, 22 Oct 2023 08:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/MEqPMGm9ZvO3A2qWyRBaAMsH3YioP42eKd3m+f1hWlcDPR8e47CjT+WWc302N8+gKKDY
X-Received: by 2002:ac8:7d96:0:b0:417:9c40:c5fb with SMTP id c22-20020ac87d96000000b004179c40c5fbmr8273327qtd.44.1697990098675;
        Sun, 22 Oct 2023 08:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697990098; cv=none;
        d=google.com; s=arc-20160816;
        b=phpFmg4+eokRHbWhscNAHrd/14WOR7OT722QUz+yieLi+dX9zMeg3iRVbXhf+/iibD
         yT64j0Ue6HryCmls+UWlATGjH0gJKD+4evSfSZGP1x44lPuO3r11KE2o7bHFqLd87Uw+
         IHL7tWDhtT3GKlI1KB3EEiexFl/jD2jQy6JsqGvRWK5iBUvRm8JwwtEF6HLsU0B4wiT0
         XB2ID+dW4Qwcf3hfJMqidIS61+pRtcOF4XOMWLf/tjtBgx3RGExGUKtnCiI1/mRZGd/W
         kmXUw2deCl/hmjXIw1S4bQCuOgEeU6ssEa1AsdWy5ywzEHlwXrlzulzAUBZKYaAYJ1ec
         LK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gAqi4IHvyxyTJg+N0Ik5PY/rM2q46ZCGuyPvahYwG5k=;
        fh=fR25DIKCexhPQAp6aUdYi3uFJxEhZaxhhcNQofNVQl0=;
        b=ZDmULWtp1gtKwhHtoPTb9KVTt2LxwqroZ0Vtz5Fl6IenNKQJVS8FQfq/ANc1B+83O/
         ke/Y9Ju1l8c79LxZyg5soneHOlQbUWQJvYew/AAtr8azHPStvyCo1v5Bb01um5tau54a
         /IosKK5yA2FBEB15IzSTyBSjJfuCfTs07uRuzdPBkI1c+7rRKBz6uIu6xYxFHjHuRVKz
         Krq3lHcrv09TVWonQPGSGSSKxVJM63FDi55tJKsEhFvQwtUyG2m1wcWc6xL5ZWCFPq4h
         ISHzE9FVf67s/3PSmf65v15h8HMN+dpPI6/juOZZdGzan9y39iQZ4mEO34Ycqg9bPxK1
         UPvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=cRbRpczY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05622a190e00b0041989dab884si4067271qtc.77.2023.10.22.08.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 08:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=cRbRpczY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quam9-0007TH-Ka; Sun, 22 Oct 2023 11:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1quam8-0007QS-2W; Sun, 22 Oct 2023 11:54:00 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fd6248c3715d1825373b+7364+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1quam6-0000Lw-6b; Sun, 22 Oct 2023 11:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=gAqi4IHvyxyTJg+N0Ik5PY/rM2q46ZCGuyPvahYwG5k=; b=cRbRpczYlxtrJ0EMdutYGeIBIl
 3V4CpMaDhfBqINOapf2F/gKHf+PgU3iwVQeTm5lVX9xNdGoH8TYMteH/nQcGNcNI3BcKh+CWUiWpL
 LbtNiAJsgwEHdMVmuNmfyuyVAP7f0W7JkbsxhMiWqH4q+bbsarvrWtE9jVRGnI/EHRbx/G70Etxbw
 CZ30nG0gPXyVMUtzmvYFCv0b3+Z/+jCGDk7YmUkeRkcus/I/rRzABdQ4ucyfQQTqz6/rNkXeSHqbM
 Nlndu5rdkCTQv6mErcA0WRVLKeTqjLVQkMDovzpLxKNVo2R0CpNPRyZH7ke5ogJ7cesaOLN3L/iWq
 6Ar0Y1oA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1quakI-00DCmh-0V; Sun, 22 Oct 2023 15:52:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1quakG-001qYN-2W; Sun, 22 Oct 2023 16:52:04 +0100
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
Subject: [PATCH 03/45] net: add qemu_create_nic_bus_devices()
Date: Sun, 22 Oct 2023 16:51:18 +0100
Message-Id: <20231022155200.436340-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231022155200.436340-1-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: 09VEEVEMQmm/

From: David Woodhouse <dwmw@amazon.co.uk>

This will instantiate any NICs which live on a given bus type. Each bus
is allowed *one* substitution (for PCI it's virtio → virtio-net-pci, for
Xen it's xen → xen-net-device; no point in overengineering it unless we
actually want more).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  3 +++
 net/net.c         | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 56be694c75..ce830a47d0 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -211,6 +211,9 @@ bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
                                const char *alias);
 DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
                                     const char *alias);
+void qemu_create_nic_bus_devices(BusState *bus, const char *parent_type,
+                                 const char *default_model,
+                                 const char *alias, const char *alias_target);
 void print_net_client(Monitor *mon, NetClientState *nc);
 void net_socket_rs_init(SocketReadState *rs,
                         SocketReadStateFinalize *finalize,
diff --git a/net/net.c b/net/net.c
index 6e20f9d2e9..23fd716b98 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1207,6 +1207,59 @@ DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
     return dev;
 }
 
+void qemu_create_nic_bus_devices(BusState *bus, const char *parent_type,
+                                 const char *default_model,
+                                 const char *alias, const char *alias_target)
+{
+    GPtrArray *nic_models = qemu_get_nic_models(parent_type);
+    const char *model;
+    DeviceState *dev;
+    NICInfo *nd;
+    int i;
+
+    if (nic_model_help) {
+        if (alias_target) {
+            add_nic_model_help(alias_target, alias);
+        }
+        for (i = 0; i < nic_models->len - 1; i++) {
+            add_nic_model_help(nic_models->pdata[i], NULL);
+        }
+    }
+
+    /* Drop the NULL terminator which would make g_str_equal() unhappy */
+    nic_models->len--;
+
+    for (i = 0; i < nb_nics; i++) {
+        nd = &nd_table[i];
+
+        if (!nd->used || nd->instantiated) {
+            continue;
+        }
+
+        model = nd->model ? nd->model : default_model;
+        if (!model) {
+            continue;
+        }
+
+        /* Each bus type is allowed *one* substitution */
+        if (g_str_equal(model, alias)) {
+            model = alias_target;
+        }
+
+        if (!g_ptr_array_find_with_equal_func(nic_models, model,
+                                              g_str_equal, NULL)) {
+            /* This NIC does not live on this bus. */
+            continue;
+        }
+
+        dev = qdev_new(model);
+        qdev_set_nic_properties(dev, nd);
+        qdev_realize_and_unref(dev, bus, &error_fatal);
+    }
+
+    g_ptr_array_free(nic_models, true);
+}
+
 static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
     const Netdev *netdev,
     const char *name,
-- 
2.40.1

