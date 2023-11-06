Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp3008938eja;
        Mon, 6 Nov 2023 12:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwdRm9amATA9YQ7TEKRClwZk/WUZ6eWqY/trGOwjzY7r3/mD64SHEuMy8bPcNmxbnJ7m6P
X-Received: by 2002:ad4:568a:0:b0:63d:8447:ddd with SMTP id bd10-20020ad4568a000000b0063d84470dddmr878652qvb.20.1699301020646;
        Mon, 06 Nov 2023 12:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699301020; cv=none;
        d=google.com; s=arc-20160816;
        b=A5qdcOR6GtWtOhC70b47hIdp5booxZ2oj1+T4/QLcP/D3exKP/eJGNByimMDEV1wjt
         l3Qegwj7eYnMmKwhxU6Db72d6rn1W8KiWKX6xP17DL4+pvhnin4wmMXqokBUVLnPRCKS
         uNZC0zf+LWjQxCJ7Bn+SEzXXU3sVwx+9SuTY7rT8UrNyl+rEsti9z54nVO7/1rPKOljt
         nK80q996yELvuFdidPsdXvAI/gRmJH+j4WsVhgXZRR10+F/ajrKRggy1gAdSdvCbyJKP
         8FKsTLad/FuAwHdV+Rx/jvWTb2X2+ddP5WygkeIWtjtqCkh82h+6gP2O3+PLjJFYlbgw
         VU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oZFrVya+rdWrf3x18ocvL/Kncj5tARqXig5ZmBeCviY=;
        fh=aO0iHn1gEkY7cXLX0OqpYrk+6ZrDWUTepWYzJsBxj6U=;
        b=cHCq+peUC+8R4hwYAi6WckCrVet6uFuKvy0gJzUMFH2WuYt+5+xHf4c1vA2AkSyehk
         eyVSrxLM0I/1rZsm9ljpTVIGpX17wVgAPFWvcJ42z/CwCWLGUwebX0lQNb5JPdB2lJs4
         Yr6iD6yUDe+WYGBOSDGPmobEK5+vfRDW1p6RyBwats4sLM83H1/E5YJeUkoJSkhp7MU6
         817W41025R34bOyv8nHqNRdKULfuq8rcT3q/A6DeZ4I3O8X362A3vYY8VFkcrJrph2FQ
         9M9dtJGvYCYVJQP2aGdJ9sUJVvwS74rEFw1v7WVXvt/RycKPUNei3ozF0DudzQqgnE8t
         5LMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=csdvWB5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er19-20020a056214191300b0065afd35c75dsi5965247qvb.70.2023.11.06.12.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 12:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=csdvWB5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r05hU-0000n0-Vq; Mon, 06 Nov 2023 14:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gt-0006Nf-4r; Mon, 06 Nov 2023 14:55:23 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1r05gm-00066p-Rq; Mon, 06 Nov 2023 14:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oZFrVya+rdWrf3x18ocvL/Kncj5tARqXig5ZmBeCviY=; b=csdvWB5TP4sQ94OEt9+XbYER05
 hbmUqcsiCNfJB5IKyQ3eSi1XtpfOiWBPJuC08a5MBE5ehHLCECUUTKMJHslVo5FzJ6hGBeqXQEGbV
 Dsol5aBk9Ua6OBUpM9OgZ6/hStstD/gRRhw/RLq7gFq6l20MKN8AfFKlm+zBpoYaPFMB43qyB9vpd
 Efm1U6RK1SRjoS9g5kfyjEvYgMqTiMGVnY3lhytvgc3Nbx1Rsq8MtH2nF3RmTUPDtFj9/jpOeia8W
 1yxmrvg1F0HPQfZRXR8/0/QxU0wW86zfYnVyWFVUWZzFuGVp7cJZrD1PLAu3UmdJun3X4tR6wsfsw
 DDtixxYA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fd-007tat-4h; Mon, 06 Nov 2023 19:54:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fd-001GPm-0x; Mon, 06 Nov 2023 19:54:01 +0000
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
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
Subject: [PATCH for-8.3 v2 43/46] net: remove qemu_check_nic_model()
Date: Mon,  6 Nov 2023 19:49:48 +0000
Message-ID: <20231106195352.301038-44-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5rlBs2S8aAnF

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  1 -
 net/net.c         | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index ce830a47d0..1512650190 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -202,7 +202,6 @@ int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
 void qemu_macaddr_default_if_unset(MACAddr *macaddr);
 int qemu_show_nic_models(const char *arg, const char *const *models);
-void qemu_check_nic_model(NICInfo *nd, const char *model);
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model);
 NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
diff --git a/net/net.c b/net/net.c
index 73621795cb..ffc722069f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -977,19 +977,6 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
     return 1;
 }
 
-void qemu_check_nic_model(NICInfo *nd, const char *model)
-{
-    const char *models[2];
-
-    models[0] = model;
-    models[1] = NULL;
-
-    if (qemu_show_nic_models(nd->model, models))
-        exit(0);
-    if (qemu_find_nic_model(nd, models, model) < 0)
-        exit(1);
-}
-
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
                         const char *default_model)
 {
-- 
2.41.0

