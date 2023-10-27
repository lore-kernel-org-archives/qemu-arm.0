Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp159344ejc;
        Fri, 27 Oct 2023 05:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGSBLNKAFE4Eg0sUbJKjpigQUP2oxP7inUkCLnec7d8gMl90bPGFdMRsbt/w7CY+AGkTeK
X-Received: by 2002:a05:6870:1202:b0:1e9:a5f2:aab3 with SMTP id 2-20020a056870120200b001e9a5f2aab3mr2279424oan.57.1698409966481;
        Fri, 27 Oct 2023 05:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698409966; cv=none;
        d=google.com; s=arc-20160816;
        b=T+aAger+fXFM0q8BApxuDZOew0eTLY2qVbJPEOaWiRicExdXitziltrfXVTD4BVW0F
         jyhlnm33Qd162YxOnO8zIUYUNPFjWoGUsCP1hsp5lJGGjVLjzklRSW/kcOkob8Hu6LD5
         lTZPhzoKTPyuiYulIuodyr0RNp9fH8Zc3xJ4tVseB0kxUFxwH8EJwc5tBDYMKllucgEO
         f76sCwA9XtJH9X2hddYNTNL7vj9K4YXHr7TqOZ41rezCvMCN5f9VKDz6VWu5KWE1QQFh
         6xDUpH53Misl1uWcJTDVykNa7oBu4EobHtjciFbxkTpPuDj0YZ2m/EgXvfpT7fTbi2Gw
         lbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date;
        bh=LX40q+acxXgYLj9mGy7oJfhNRBxwFExGm+2hTHPmt34=;
        fh=Yayz+XiKk88dJys6SuiG2nTZdd5iIq/RRT2BUIKx1Mg=;
        b=KaXYen7UQ9EL0MgJzFxHOQTUvYQCMx3lmeHBvcffv/TujxTrlfjpmoBATs2b87CCOG
         ih+kdm8BOlLLAB6kFUywB+u3ibb2k2tGhkmu+14lvGVnXF0bLp4kUFNwejYwu1VIb/uY
         VTbrnGnHITgXTkDEhYeWEU3qOjhXxtnWOlvAfV170RrGrO+ew2sQzaFVFsG+ue6M5OG+
         MNm+1F/f7V0HCZJoivi4/qJej4O2dCRwMaxQBkacoXCUF5ROCdJ4MTRpQmYUw/y/7Gy8
         n86v9BJ/CY4cN6osbod97RRQ5lPXHVLMhfs81FggkikefZAd0ikX2vwDz+aL44zBV62F
         au/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020ac85a0c000000b0041962bf168esi662444qta.418.2023.10.27.05.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 05:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwM0e-0001qI-QY; Fri, 27 Oct 2023 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1qwM0W-0001jh-BH
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 08:32:12 -0400
Received: from hsmtpd-def.xspmail.jp ([202.238.198.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1qwM0O-0003l9-1m
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 08:32:06 -0400
X-Country-Code: JP
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by hsmtpd-out-0.asahinet.cluster.xspmail.jp (Halon) with ESMTPA
 id cf9071da-cfc2-430a-aae8-d12cacb28888;
 Fri, 27 Oct 2023 21:31:54 +0900 (JST)
Received: from SIOS1075.ysato.ml (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 755761C0037;
 Fri, 27 Oct 2023 21:31:45 +0900 (JST)
Date: Fri, 27 Oct 2023 21:31:44 +0900
Message-ID: <87sf5wi6vj.wl-ysato@users.sourceforge.jp>
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org,	Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,	Peter Maydell
 <peter.maydell@linaro.org>,	Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>,	Niek Linnenbank
 <nieklinnenbank@gmail.com>,	=?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>,	Andrew Jeffery <andrew@aj.id.au>,	Joel Stanley
 <joel@jms.id.au>,	Igor Mitsyanko <i.mitsyanko@gmail.com>,	Jean-Christophe
 Dubois <jcd@tribudubois.net>,	Andrey Smirnov <andrew.smirnov@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,	Rob Herring
 <robh@kernel.org>,	Subbaraya Sundeep <sundeep.lkml@gmail.com>,	Jan Kiszka
 <jan.kiszka@web.de>,	Tyrone Ting <kfting@nuvoton.com>,	Hao Wu
 <wuhaotsh@google.com>,	Radoslaw Biernacki <rad@semihalf.com>,	Leif Lindholm
 <quic_llindhol@quicinc.com>,	Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,	"Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,	Alistair Francis <alistair@alistair23.me>,
 Helge Deller <deller@gmx.de>,	Paolo Bonzini <pbonzini@redhat.com>,	Eduardo
 Habkost <eduardo@habkost.net>,	"Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,	Song Gao
 <gaosong@loongson.cn>,	Thomas Huth <huth@tuxfamily.org>,	Laurent Vivier
 <laurent@vivier.eu>,	Huacai Chen <chenhuacai@kernel.org>,	Jiaxun Yang
 <jiaxun.yang@flygoat.com>,	=?ISO-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>,	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,	Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>,	Stafford Horne <shorne@gmail.com>,	Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,	Nicholas Piggin
 <npiggin@gmail.com>,	Daniel Henrique Barboza <danielhb413@gmail.com>,	David
 Gibson <david@gibson.dropbear.id.au>,	Harsh Prateek Bora
 <harshpb@linux.ibm.com>,	Bin Meng <bin.meng@windriver.com>,	Palmer Dabbelt
 <palmer@dabbelt.com>,	Weiwei Li <liweiwei@iscas.ac.cn>,	Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,	David Hildenbrand <david@redhat.com>,	Ilya
 Leoshkevich <iii@linux.ibm.com>,	Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,	Eric Farman
 <farman@linux.ibm.com>,	Magnus Damm <magnus.damm@gmail.com>,	Artyom
 Tarasenko <atar4qemu@gmail.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Anthony Perard <anthony.perard@citrix.com>,	Paul
 Durrant <paul@xen.org>,	Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org,	qemu-ppc@nongnu.org,	qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 18/45] hw/sh4/r2d: use pci_init_nic_devices()
In-Reply-To: <20231022155200.436340-19-dwmw2@infradead.org>
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-19-dwmw2@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Received-SPF: softfail client-ip=202.238.198.238;
 envelope-from=ysato@users.sourceforge.jp; helo=hsmtpd-def.xspmail.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: 6Jfrqop9f+b7

On Mon, 23 Oct 2023 00:51:33 +0900,
David Woodhouse wrote:
> 
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, the first PCI NIC would be assigned to slot 2 even if the
> user override the model and made it something other than an rtl8139
> which is the default. Everything else would be dynamically assigned.
> 
> Now, the first rtl8139 gets slot 2 and everything else is dynamic.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> ---
>  hw/sh4/r2d.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 4944994e9c..e9f316a6ce 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -240,7 +240,6 @@ static void r2d_init(MachineState *machine)
>      MemoryRegion *sdram = g_new(MemoryRegion, 1);
>      qemu_irq *irq;
>      DriveInfo *dinfo;
> -    int i;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      MemoryRegion *address_space_mem = get_system_memory();
> @@ -309,9 +308,8 @@ static void r2d_init(MachineState *machine)
>                            0x555, 0x2aa, 0);
>  
>      /* NIC: rtl8139 on-board, and 2 slots. */
> -    for (i = 0; i < nb_nics; i++)
> -        pci_nic_init_nofail(&nd_table[i], pci_bus,
> -                            mc->default_nic, i == 0 ? "2" : NULL);
> +    pci_init_nic_in_slot(pci_bus, mc->default_nic, NULL, "2");
> +    pci_init_nic_devices(pci_bus, mc->default_nic);
>  
>      /* USB keyboard */
>      usb_create_simple(usb_bus_find(-1), "usb-kbd");
> -- 
> 2.40.1
> 

-- 
Yosinori Sato
