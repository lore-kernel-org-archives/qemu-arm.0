Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp4825ejs;
        Mon, 8 Jan 2024 12:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFgqlqVdQU3NBykCluSFrBM/1EIvW9EHSClRMZCZY0qo4uw6S/OMQYAsFCTkNX1fbgWh3y
X-Received: by 2002:a05:6830:2b2c:b0:6dc:6a7:8542 with SMTP id l44-20020a0568302b2c00b006dc06a78542mr7191422otv.1.1704747169056;
        Mon, 08 Jan 2024 12:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704747169; cv=none;
        d=google.com; s=arc-20160816;
        b=RNWkZvHb7AV7NFu7zkesILQ2gfeUmbtAXvTLTHjXRgixE8Vmcazw+5+G5UeZAlQuSW
         Mv9KGXgnyhiJdX1+bJWaB71ABO4t3Nk+72xG4YgP5575PlJY2Om8i+A1xB04zWALqOza
         uXwLWYsIUOQmOKYZL7030LsDh/079fv6GLQ91yMMH2v8SHPQ1sSv//pKlQN+/dPDdYSY
         roL3oTzwNfYxQ+SjX6BtFqWIOb5BlT3RPrzegzsMHyHBovZmXi4ccIbONvH5gpEPJdZj
         yYQZaYrenp7erY2Jn/EFpRlpvVkxe1kBNwScxKxTscryuW6cSaA/me6clttiPqiTfSEs
         hmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=AhJIqQ4JvGd0KYjdhY7u9mp0ZZRVDk/M4nuhh3LTnPc=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=CFl9ZtHHf84+cCe4k52fEqwKLjTWIn+BLV0ta4O+ghM5RXvjRwGM+R1/58teBqfGLI
         wxlCeAuWx0r7Br7abXlSGTO3bKaOdEaX2bSiZq24pjE1yExdv/WteQNsKRvo/X35Pr8q
         IjyYm61uStdhsthg/XOSwA4pUpzXPRuRlcyJR/NhzYLMxctHL2E9vWC5/3BRbWCi9jhK
         g6GVf9pDgSIW+HZceFqREPID97HuPTHcSMVP3B3b6/od7ZDKyQNkIbdwqUhDm5/g0qqV
         lw09LeBYUznzE/4RADXRBd8jhTIfAEtGx+WkwsfRzKLljQYOX4iLbJ9M6pwtLXfnj6Ym
         aYAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=QCk8aYCk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b007819059f7efsi529897qkp.766.2024.01.08.12.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:52:49 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=QCk8aYCk;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.663912.1033954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaY-000467-SC; Mon, 08 Jan 2024 20:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663912.1033954; Mon, 08 Jan 2024 20:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwaX-00041U-W5; Mon, 08 Jan 2024 20:51:14 +0000
Received: by outflank-mailman (input) for mailman id 663912;
 Mon, 08 Jan 2024 20:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNLN=IS=desiato.srs.infradead.org=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwaT-0000R6-9h
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:09 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4ddf61a-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:06 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYm-007wXw-0J; Mon, 08 Jan 2024 20:49:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYl-002NGm-1P; Mon, 08 Jan 2024 20:49:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: a4ddf61a-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AhJIqQ4JvGd0KYjdhY7u9mp0ZZRVDk/M4nuhh3LTnPc=; b=QCk8aYCkC346WPe06AhMAiDeaM
	wfg8iT+0fMlHnulAR9D/433Cl2gjJ8UP2O8m1cxUBdlVPBPbzyz1foyPaCRcP34NQUMYxzCTl4+db
	o50Ep9pyalIkHCiIKdizJVrKhaaZP1CYNfqOKeQroBk2uPkSpgtE6swFA9CkQpRDxOSjnbA5gNaGH
	HICKCAy8u3JV4UY7XqHoWa9Dlr/x+Dos61Oxq3k4Zktd/cY+aPkHq0KWFuVwklG/mApd9HPXC7XTu
	VCEr3nG/8ImCZTzQugIZlf+94FLPbHxRIO/1oNg4wVGc2+nsdlCBYFwrgprv1PsC1RujeJHMrHIN3
	l8QYFd/A==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v3 38/46] hw/openrisc/openrisc_sim: use qemu_create_nic_device()
Date: Mon,  8 Jan 2024 20:27:07 +0000
Message-ID: <20240108204909.564514-39-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 1XHpoj9zfyEq

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/openrisc/openrisc_sim.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 35da123aef..bffd6f721f 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -170,7 +170,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
 
 static void openrisc_sim_net_init(Or1ksimState *state, hwaddr base, hwaddr size,
                                   int num_cpus, OpenRISCCPU *cpus[],
-                                  int irq_pin, NICInfo *nd)
+                                  int irq_pin)
 {
     void *fdt = state->fdt;
     DeviceState *dev;
@@ -178,8 +178,10 @@ static void openrisc_sim_net_init(Or1ksimState *state, hwaddr base, hwaddr size,
     char *nodename;
     int i;
 
-    dev = qdev_new("open_eth");
-    qdev_set_nic_properties(dev, nd);
+    dev = qemu_create_nic_device("open_eth", true, NULL);
+    if (!dev) {
+        return;
+    }
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
@@ -313,12 +315,10 @@ static void openrisc_sim_init(MachineState *machine)
     openrisc_create_fdt(state, or1ksim_memmap, smp_cpus, machine->ram_size,
                         machine->kernel_cmdline);
 
-    if (nd_table[0].used) {
-        openrisc_sim_net_init(state, or1ksim_memmap[OR1KSIM_ETHOC].base,
-                              or1ksim_memmap[OR1KSIM_ETHOC].size,
-                              smp_cpus, cpus,
-                              OR1KSIM_ETHOC_IRQ, nd_table);
-    }
+    openrisc_sim_net_init(state, or1ksim_memmap[OR1KSIM_ETHOC].base,
+                          or1ksim_memmap[OR1KSIM_ETHOC].size,
+                          smp_cpus, cpus,
+                          OR1KSIM_ETHOC_IRQ);
 
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
-- 
2.41.0

