Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1015569lfa;
        Mon, 12 Oct 2020 05:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTUqkj6QMbtkrfIIJ+8ufYqWAIREr4bz4e40c0z3NxcOPjSvQNHS+blMdsPFu0el/w/+OD
X-Received: by 2002:a25:168a:: with SMTP id 132mr31462443ybw.299.1602506973038;
        Mon, 12 Oct 2020 05:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602506973; cv=none;
        d=google.com; s=arc-20160816;
        b=hnLPPqcC6aHBOHxWeeBzbZr6ckaB+RXBJ5/s7Dt6ekm9d0j4Kzk2gbO/cpMrE0/VuQ
         qfVP8duI/Rqchbbik3mO0I9SKKf3NIE+bJgszygKgh9LYWcuS7uzlhFeA/cQnZUg5vK5
         MOv2pr8vzgUjSfIyKhPxV+QH421wKJPav/sXf2A8nEnjwd4mc8y2scJIC/ohJ5whVzf/
         j7VPcYIeS4BAzxAOXp9MFU2U9pe+Jvh7fec0HDd+z1hX1DWMC5YgP7ax4Ueg+s+PzGAR
         G3i1PoaLSIuvFljwcDF8ZTHI+mpPMRG+XjNDXuMU93Iv5e41I/UkQi94nXYuSbFrsvo3
         ZY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
        b=NGSZlP8+kvG7wenROQ/2I2x44g6jPhMXo8V7L7SlhoMiCEDzgPflvFl15OkZVTzjID
         xmRcZ4NGSQz9Z/5SKXYQCwVOyvJAyBqp/zj2QAADW2INfvTb8ruekckDruzAuT/qmg1a
         uV9y8GyPv2k/KMXO1fdg1F1lhdt10myA5HH5+sEbxg1BdHHIxlQTvaRMrk8PxNpiuxD3
         e2+fa0T0oNIbjfT5PzMd8rkB1iHGZIR+j9u1olx1EWmbxwSkADa6wrUy5tqK/QXmo9Rb
         Iw9VcfWld2lc7oyFwgrhqiRvkJ+DQetWfyYp2t5Cuh9yoLl+/fH6c5nw6XLks2aRfdDF
         9v0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LoZqtaFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p184si13685688yba.367.2020.10.12.05.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 05:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LoZqtaFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxGe-0000xd-DJ
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 08:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCb-0004x5-4A
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCZ-0008TK-8d
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
 b=LoZqtaFZ14PMiVG5YwWZDLriI0xjyU7gGSiWQDnxzOKLHb3cwadDmXh61qzcP0A40ySUE2
 MdBHKQ2YyjyqH2/HvUpEO+g/Lj8MJVewGgFov7OAbbgBhTP9E7hVojhpHOr9/MiNsDaQfr
 5mQmXpW3qfQOevb7Xa+m/mWEKiM/jJg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-OKKd7mzjN6y5V2dJ9LTKFg-1; Mon, 12 Oct 2020 08:45:16 -0400
X-MC-Unique: OKKd7mzjN6y5V2dJ9LTKFg-1
Received: by mail-wr1-f71.google.com with SMTP id b11so5458805wrm.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 05:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
 b=aA3SAze6Fwti8GmhasHtqgIciVKL4cpch40Yex/HnLaVsjPjEyO0awW6kGpiFIBS8j
 HiC7WB63mvFSnQy10gGQgYNIOMKdFqPcCkkBK3OsETakYsQkna5A6c/8No10y7WK7Iw/
 QODSgNHZJCzdGPUMy3WuJGH8wFVBaLdb3i77klEQLCinBX1oN6PGrf9MBhHiQgo0jEpl
 F/Y+XFgLcurBwXpb2/3v+Rx7VAFzqGZWkm0MuBTFDnA3C5PEdXv3pJuEhGEAr1jBfGcr
 HHvOp6/cn7JSLKW5tc9o1ZU0RgVWCtrOdXPXKr9gh8oTwvwEnTInkdczVvnTMTXeFCtL
 v/6Q==
X-Gm-Message-State: AOAM533SuGpjz6VQu/QoSP2RnVx8UspUfVV5NmW5Zymf9aGKfYCKI8uk
 VqYtA5f/ZQ2LOh7iDLZbszdN+4uMdU8QHh8cpfxt+OLSuFlC5Q9Nf8zA8Yyp9oN7Mb6lzfsVeOe
 Hfi9sxZ7pDHne
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753230wrm.295.1602506715237; 
 Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753217wrm.295.1602506715091; 
 Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11016383wru.50.2020.10.12.05.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more readable
Date: Mon, 12 Oct 2020 14:45:02 +0200
Message-Id: <20201012124506.3406909-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MoSsgZLSrqHm

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
Rewrite it extracting the shift operation one layer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..abb3ee86769 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
-    (((funno) << 8) & 0x700) + (regno))
+    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
+    (((funno) & 0x7) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
-- 
2.26.2

