Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1439894ejy;
        Mon, 19 Sep 2022 16:19:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xGzISF0Z3BZ0x72Ju2mGm6GHzYzJyCbIgMOO0gUlbSDqkESkEjmQGOCPvL1fyVmvlYeyq
X-Received: by 2002:ac8:7d92:0:b0:35c:be77:5e2b with SMTP id c18-20020ac87d92000000b0035cbe775e2bmr16685173qtd.505.1663629542044;
        Mon, 19 Sep 2022 16:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663629542; cv=none;
        d=google.com; s=arc-20160816;
        b=K1y2wVTj9mk/SVf4UdWC5q5wAIgTOBFQ0OOgjQ7rIXmT6XARXbe+wkpO4o/hzgMx7M
         MIw85Iw1lNIiiQt7l97cq88l/cTSfJmZY0cUb1xNdbAFLNUCdpyghgpWPgOVH8Fl1+/B
         XG1/LAI+SizvjKWgE7XQiRuF+3O8aKW8JtpAe9NKwfqdEN9WzDfRdBIYdDJKp3/3pGTN
         82OhhAlfLVJmszorVPjg1w6wZ6ueY+DGPvkOZ1/bIiFU5zTG6tgHwD5nDMDGpbnKvOiw
         ekomtDxOwMX4xQjB5VPYNjU1h3yVhlg1oPWN3OaEj+kTKytj968BI21ErO9xjSzs/zSi
         3Iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Fjo518UYX1pucjz3VPXRbua9nNVIHRhAk9ua0pzX1XA=;
        b=ojSKzzqIqUJMRfUbhGN0phWQEVJb4D+1pz9OhSPTm+C86elwiNOvbyRY5++UuTzPco
         qwp4YBZVvRU1AcqGeT5ZWEh1XQLABmUH8Epfwy4lm8HgLS2FLF4FcoxNd8QtP0+q10Hg
         g71i+N10wxA96uuou0mC+2XbwD+KcFRMuJvN9kveqbzrRBgxjxoOccGVR6w/ze/WVKaY
         UUXwtUMK+ZgBjvvZPK9Lox+0pe2+1PkVkXv6Ghsq4HKdi0dLIl51aMbSnXrofpjOc/Cz
         gHMNVAFlgjtacWfDxQbd3e18Wbrnl7Hkrame3JbcDVz1b/kmpQ3TLXFIs2EW94sr5UvG
         4E/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lbugUhiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05622a00cb00b0035bb7451ce9si11677233qtw.107.2022.09.19.16.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 16:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lbugUhiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaQ2X-0006lF-Gt
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 19:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ20-00068P-AR; Mon, 19 Sep 2022 19:18:28 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ1x-0001oC-RG; Mon, 19 Sep 2022 19:18:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id f20so1373446edf.6;
 Mon, 19 Sep 2022 16:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Fjo518UYX1pucjz3VPXRbua9nNVIHRhAk9ua0pzX1XA=;
 b=lbugUhiXpcHvVHxmNQCd7XhVHqDDxchx16Djox3J75B7ePDdncyCGse6eZA2NqPqFh
 hr1ilTebkO5lbr+2+TZ5mEGLS4PtyKRFbfCqqAv12AEVAMkQWO0zrazSj3q2ZqeRKBT/
 NbDJbiJXOnw+DznNgyjbvAx0+B4DavYnJ8efSi50qdYGRhMcVApJ9LYs+43cIJnPnFH9
 p7WTSOkQVMZ/TBIgKfij+g6XFoQIUWCHughrTftkcd/1hY2CNeeMm/CAqplFQVur0kCT
 P6Vi6hDAGyycMZR5ghfx4ycMPoY3eP4zAl+AtKcz4IBZGYhSpX7tdpCvm4nrUNQHxaPV
 fQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Fjo518UYX1pucjz3VPXRbua9nNVIHRhAk9ua0pzX1XA=;
 b=BK7OPXdgUD/4Z00ntWjt9KdoTd56i5RtUsGvqM1w+NBAQBQnAIWJzfRpq2lvpoIaV9
 top029FoSXnAIK4Cg475xPZkzz2f8P5iZq/3nRiO/eH/t2GaOFlryqJow27H9W990Iua
 c9SmXoAjGJFDL0vlSZlhgmJiTzm+jGMAEbNaDx0HZrv9Tmf9LrQnr5PbNeWTfntiCsNR
 P9X2SmAJAS1I7cOn94rSBQCIba2dutuAelrdSpaznF2VU/hNwi8wqzPEZ5PSNowThuz4
 oANzqtg5Dbs+LnULoaXBHYI9oW3hJWgqDABnKTQwGIFsop06r4DA1kYJZatVjJUtKRPI
 1xfA==
X-Gm-Message-State: ACrzQf1roh4iF/FxCLVrCqPwUTkCOw8AE+xF94RzgvCgul6Zp6O1w3HL
 H95m+Ze8SqbOS21xpap17/IA7Ms89qI4Ug==
X-Received: by 2002:a50:fc9a:0:b0:454:6a56:7d27 with SMTP id
 f26-20020a50fc9a000000b004546a567d27mr470765edq.73.1663629502405; 
 Mon, 19 Sep 2022 16:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
Date: Tue, 20 Sep 2022 01:17:12 +0200
Message-Id: <20220919231720.163121-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oTXnzdSkKrhE

SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
inherit from TYPE_MACHINE. This is an inconsistency which can cause
undefined behavior such as memory corruption.

Change SiFiveEState to inherit from MachineState since it is registered
as a machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/riscv/sifive_e.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..d738745925 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/boards.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 #define RISCV_E_SOC(obj) \
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
 
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
-- 
2.37.3

