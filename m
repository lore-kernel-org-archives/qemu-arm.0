Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2448280ejc;
        Mon, 9 Jan 2023 09:27:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXA8TQOeswhZxGptNd3z9+GGEb3OdWt9k6zoZPi/ld8ic5WD+/s6rCChCdQGbal7n7W8uF
X-Received: by 2002:a05:6102:f92:b0:3b5:1dd3:b92a with SMTP id e18-20020a0561020f9200b003b51dd3b92amr35631545vsv.31.1673285226642;
        Mon, 09 Jan 2023 09:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285226; cv=none;
        d=google.com; s=arc-20160816;
        b=k40e/H3Q4Vn6k0xpgRL7b8UWXiqNafjtaGHPdT3MWYutXyDngM8RDohJBlYi2ucyB8
         66/FQxG/upwABP08Dij/qUIR9zLixt9spiWbq/kFR0NdoHY6R1NhMPObNNSK7dmJOz9J
         EAwYcnzX0IrkDkZ5XHB2X/34pFIYoesjOWNT6xypG93FgWLYxu/rkWa3xuSPELVmceZN
         yoe7ZUzDSsD/vOrEl75cJrb0MSPRJIy+F0GGYo1MJsNmBLrAT8qG4EM9n2QSp9ncNZXy
         TicjGVAV2CFXX3eN3j73M2XQgHd4Io505owDh2cqqDh99ZfVe3vOskqcYgWn1NSgGf+N
         uMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Md1ht9BenAS9gT+l4PHU2nQxwV72/gQGjTwkecQpBFU=;
        b=r68Dv/ZjXDZCer8qBQhUXwXV6WEsuNSr8Tm1OqjSI6plE4YdjIKBkAxXyP+0HfOkYj
         UQXi2kI1uICPwU5bC5k7grGaX6JtjBsb9qSjVD/p+B3KgB00rCqRaO4X0nQ5BvjO1oq6
         2PnnB2MLS0RU5NhFsSW24+Xdj1ljq1lgwrDN2YRqVKZM5atLTCuF8z4M0vZM0e2AuB7s
         C0rou6q6Po8NvbuFhaUmlWM7UB/nlfivGX3Nw5JoD3e6quREeHD22yyPDtuXBYyFpQOA
         bbbjGYMtny1uf7lHdgcUPvtycDQmmqHY6V/r31O1tv5fmk8nYwODFdD4KaVLgTdgMHZV
         zB7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AW9bdWLq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c80-20020ae9ed53000000b006fca80f0fd9si4437446qkg.724.2023.01.09.09.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:27:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AW9bdWLq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtL-0002Q5-8C; Mon, 09 Jan 2023 12:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtJ-0002OQ-Kx; Mon, 09 Jan 2023 12:24:57 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtH-0000yc-7v; Mon, 09 Jan 2023 12:24:57 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jo4so21928431ejb.7;
 Mon, 09 Jan 2023 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Md1ht9BenAS9gT+l4PHU2nQxwV72/gQGjTwkecQpBFU=;
 b=AW9bdWLqcZnbcIrxb0E5y6wx61MwiQ6ykdZSreG9dW6EfVUjDbTv89yH1Bt8ndq2a/
 VZogJs3SI4IxDPQ+l7Mjz+ojU/nM1wZpeI6kTc3B6F5P6dJbbVs3x7wk2QV+waxT2Y0I
 eXXKMHV9ca0MXxTtQC1G8m9b8roJt+ywi+NQfgOcfsXitina+lZBnTr1NBxIv4w57YsX
 9qa3PATPDjFYKBha977mEzEJNld0TkMnx39K1+Lkk5+LMQfUHMWQONeC7juiwxJinXmg
 LsKyMABRv/Sf5Twl4L9O39ysnu7UzHSwdjbF0y+o2WAWJhw4nU2lkZk6oFetCS2RiUd/
 R/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Md1ht9BenAS9gT+l4PHU2nQxwV72/gQGjTwkecQpBFU=;
 b=inI9052/Q8ZdSsqogwT5RE9kwcg482P19e9IVZW7pcTxLg06eGcEl/+QUDQixXLBf9
 KYky0tz2Qw+lVR6iXUgfj/Q0Gbk4b7qMoYBwT589b4QeNlimZNGFPgjlqbQodafvE72H
 Ebg/1f9PdDUCqnEjC2V9tdMlsTXb+g1mHL/6CYO3vDXjsjZj2Iyiom0DUlq8Nx1r6HDO
 SfaL9aCCUsAgEJ+51OEuM1oylx6kgGhaHzQMEIpUVUUoUtCWAyExH/UjSTetWPPPBrjn
 U0yZRW8EFFQ27P8BBeQ0Xf5F+TYA7ArOUO0UYWyrwspL+dVvkbKJBrAiIu9bLkD2pMqz
 z8aA==
X-Gm-Message-State: AFqh2kqbdNKAc1zwVZgzZ6wiHZUzyd+Ojr5XBa4ltYoH9nAaxNw+Uvr4
 7Z/QcFHOSReA2zgyOdaYgUb7eGpjW0MUZg==
X-Received: by 2002:a17:907:c70c:b0:81e:9027:dedc with SMTP id
 ty12-20020a170907c70c00b0081e9027dedcmr56100887ejc.39.1673285092522; 
 Mon, 09 Jan 2023 09:24:52 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v6 01/33] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Mon,  9 Jan 2023 18:23:14 +0100
Message-Id: <20230109172347.1830-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2mCX+NTuAmfv

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-2-philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..9bffa1b128 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -71,6 +71,8 @@
 
 #define FLASH_SIZE          0x400000
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1401,7 +1403,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.39.0

