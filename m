Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1023860ejc;
        Fri, 26 Jan 2024 09:34:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5/bDk8gx0eS3K0wPrRFVVrI/TsYNvAXvX6WU1xF4lVY8B3rrZ//PnumuWzW2HFzLd4ngB
X-Received: by 2002:ac8:4e53:0:b0:42a:68fd:d9e3 with SMTP id e19-20020ac84e53000000b0042a68fdd9e3mr244819qtw.12.1706290454390;
        Fri, 26 Jan 2024 09:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290454; cv=none;
        d=google.com; s=arc-20160816;
        b=i7DPfSufp17qujj0pdnPKBo4N8LcE8vXKOrD2kWBpRVZdhQfZUYyhirrgs4+2Cv285
         nQO2mjvzin1zP08fTs3bU7TjXaPvSyEGCSNs5E9JQ+zqmB/sVmTiZkm9iWt2/CM0yhCr
         3NNMkzDKOaPdACFbOkLRct3JdO2OejMqtDtVWbUynsj/iKd+opwzzuORwJ/4LpQkoGN2
         d9tBBV9hBt0Q/RVt7nCUEVwm3qZm2eQMHVpsnDIYa4artpdM8qFtAfCBLIB4sdFkKm42
         vi0Mn0uId2kwSBeA/1ukq+644hceuDNrufBtpjaO5ujn8THtEsNABJWjTCemTlXInuhq
         28/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=afu5SeBMsL4uhfrFSeYnQUM9L+/AYnp0sc/n0TEsd5I=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=SMHEwsplB6fhWYmN54mAoRPh7dnUA65sUvlF8gV7yDpe92hKFJw1VawhIN28J2IqvD
         VgNQru3CwWWsOHylk5aDh77g66/FcucvUrFHbH0Sqbr9cnCrVqga8R2NspWaBgptMs1b
         t4iFjkK4/guUcRdyVEN0BUCPQ4CLpJho0qIl49wewSo7E8zR3GAztZ99Lmno12aw0eWf
         BBhMV3aA+cGFXIWv3VxOtDjkIq52fPoeHr6bxDiwRpBnuw7EeSLz1YqgTDgZ9VKazb1y
         DTG9piKZPeyHvt290Itosf/rPz4s36+KxqTTXosLNHaiuVlBgftp6Gk5PBDgmmov8EQ5
         9amw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=JPPoM4+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020ac85d06000000b0042a1f1e126bsi1666637qtx.673.2024.01.26.09.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=JPPoM4+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTQ5A-0008AU-Pg; Fri, 26 Jan 2024 12:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ59-00089B-NM; Fri, 26 Jan 2024 12:33:35 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ57-0001cW-So; Fri, 26 Jan 2024 12:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=afu5SeBMsL4uhfrFSeYnQUM9L+/AYnp0sc/n0TEsd5I=; b=JPPoM4+wmZbFx4D6QsefgVWDEE
 iX1pYleRxR+m/h7DfP2kkR4qT+di7aQ3livFRQOSqXrKtpvIxfjsKEje4W73LpCXtmX01BzTpK2sU
 /GeWdwBH3OFFv6Z7QnjEzUuHeYqS8xZHORx0bb9LeoMRG7Wd/COOm+4cg6+6+/LEQt/SKV55dvyz+
 XqY9UNEjm/QuL5olYH/9USfl6oyIP/bt/G0k0r8vzYMlTG2IBqZxPQeWX8Jsh/hwQDlvJyHSKL9gK
 fOmRa2pOigXXOYjNJmt8NQudyjEbnVY2sjw3ebx79HiJfaMN9BJfy0pB2Z5vqvF6zx/9/XOVw2271
 kvrJRxQQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ48-0000000EKUF-0ioQ; Fri, 26 Jan 2024 17:32:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ47-00000001elk-3gRW;
 Fri, 26 Jan 2024 17:32:31 +0000
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
Subject: [PATCH v4 11/47] hw/loongarch: use pci_init_nic_devices()
Date: Fri, 26 Jan 2024 17:24:48 +0000
Message-ID: <20240126173228.394202-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org;
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
X-TUID: hbY4v+OjtK3E

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index c9a680e61a..0ad7d8c887 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -504,9 +504,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     fdt_add_uart_node(lams);
 
     /* Network init */
-    for (i = 0; i < nb_nics; i++) {
-        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
-    }
+    pci_init_nic_devices(pci_bus, mc->default_nic);
 
     /*
      * There are some invalid guest memory access.
-- 
2.43.0

