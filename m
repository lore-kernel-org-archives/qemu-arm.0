Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4983ejs;
        Mon, 8 Jan 2024 12:53:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn1r/tZSf7zxm5t3M0+nbVZ7zNts5n41/Qnee/G0ceTIPHTLqeDqiAPxBxfd7f5WCfccUH
X-Received: by 2002:a05:6871:811:b0:204:5aa9:b1b8 with SMTP id q17-20020a056871081100b002045aa9b1b8mr5767144oap.88.1704747190635;
        Mon, 08 Jan 2024 12:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747190; cv=none;
        d=google.com; s=arc-20160816;
        b=C9e//zi5HRJ+YfYOPB3f6lIlUDS/OxGKb5BHV4oclq+4e1rxYKiJz4z3oPbRa+vy68
         DwfbbywoY12kZZ1lNuTSOhaXTm48alTM4Cn365NPy48khHoLO13zpUBcLVSgfwao1bs1
         4mbytqdvi+OkzlFl9LUH3Yd40JOoClU7rTDixSPFEjfXZ1h6T5NdLioJ5h40Wrz3icxZ
         1wZYQC2cLq9YtqUGv42mkdT3NRsxxJxaT6FX4564oTa6hmYkZnT4HZHuIPgLWTcAaZ8j
         nmkAn7097R8cyWrsBLGZVaQ79GKfjULOAuoaFq8ATA3t+MqE46E9YYxV+3QDukpKkYkB
         0vVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jjA+mKm/KR8ygCw36R3MvCf4i1b5Zw/aOnxUi6/7roc=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=wrrFq79mP0UdmdRNdMezPjIG0HX3P1jqok9+0b5OH0tA5Zd82/kEvVt3C+2PT3iy/7
         t0znPIcUQt3fB+1JdXxTjz53b8Rx9ZycEsVlgcVQ2uJz0ydQW9/cJbKBPteiNHhSFMFr
         FcNA0CJPEjxeJd83X0trCOhKW0zW91Z/f7fVbhHFpJxRBiSpV5/Yx9ULZ4aJ3mPiZ8jx
         ajQ+erBoUZuUgWBsSUR/kFPJz1X1UoBwWjQ2in/xYXq7cW5PvA8WZajTFvLh1+dSyd4g
         KATpV7jj8cT5ptt9HQjVjROpxIYjc/fLXUCdkQwq8VAV4tEZ5tweatKJfWxy2ueNALAs
         +4sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=ayaN3phb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl14-20020a05620a1a8e00b00781c4f7c73bsi576071qkb.288.2024.01.08.12.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 12:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=desiato.20200630 header.b=ayaN3phb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMwZy-00045K-7N; Mon, 08 Jan 2024 15:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZY-0003o8-NU; Mon, 08 Jan 2024 15:50:13 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1rMwZF-00010T-8L; Mon, 08 Jan 2024 15:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=jjA+mKm/KR8ygCw36R3MvCf4i1b5Zw/aOnxUi6/7roc=; b=ayaN3phb+ckS8ROU9AY1SGuUTM
 ooSaOlRggGQVW9JWqJ+ibLgkjfCrdQKFACmIKNhsgzsvpneprXtirDm+QCqwpT1xljM/hGtQpHtWo
 nlIdMQueQhwP72M1QvdFWZShiYMP4hg2hlJQaaQ9uRW12q0D8ri/WO71OtJa/or3G4h9k5QShJSCj
 SI9lhYJ0PjPLqufG6HVzDbjbpT1yYv9p6pszsLVo9X4MdIkUslz8q+Ts+LVakHg/4zPYHCFhIhuh6
 miSZ4JJxO5mXWNpXPRBGPoRhCPXENfBznpyBU2IipG9GD85xVTsAmNeud8DZPp+pFdt4lcbjPtLmy
 nIFMhOHg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYm-007wXn-0I; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGG-05; Mon, 08 Jan 2024 20:49:23 +0000
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 32/46] hw/m68k/mcf5208: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:27:01 +0000
Message-ID: <20240108204909.564514-33-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
X-TUID: 3NjDw4qhDOpP

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/m68k/mcf5208.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index d22d8536db..0cfb806c20 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -206,16 +206,16 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     }
 }
 
-static void mcf_fec_init(MemoryRegion *sysmem, NICInfo *nd, hwaddr base,
-                         qemu_irq *irqs)
+static void mcf_fec_init(MemoryRegion *sysmem, hwaddr base, qemu_irq *irqs)
 {
     DeviceState *dev;
     SysBusDevice *s;
     int i;
 
-    qemu_check_nic_model(nd, TYPE_MCF_FEC_NET);
-    dev = qdev_new(TYPE_MCF_FEC_NET);
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device(TYPE_MCF_FEC_NET, true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -267,14 +267,7 @@ static void mcf5208evb_init(MachineState *machine)
 
     mcf5208_sys_init(address_space_mem, pic);
 
-    if (nb_nics > 1) {
-        error_report("Too many NICs");
-        exit(1);
-    }
-    if (nd_table[0].used) {
-        mcf_fec_init(address_space_mem, &nd_table[0],
-                     0xfc030000, pic + 36);
-    }
+    mcf_fec_init(address_space_mem, 0xfc030000, pic + 36);
 
     g_free(pic);
 
-- 
2.41.0

