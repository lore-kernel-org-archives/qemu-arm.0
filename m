Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1042070lfa;
        Mon, 12 Oct 2020 06:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj0uyamlIAbj5H1FK6JbMzY1ndtyehTN3u/lq3MhcW71BKkpugcMzjTQBmY1ZoMRBNEyqO
X-Received: by 2002:a25:dd03:: with SMTP id u3mr32897978ybg.497.1602508874986;
        Mon, 12 Oct 2020 06:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602508874; cv=none;
        d=google.com; s=arc-20160816;
        b=selVwA5w2syRFOunnNNYPkeRJdHgS9wCfHVSn6U8+9u608rX1V348hJi7YcHLOMweR
         ztfxzXTWwBjzSg3UZ9Crgg6l54kdQxLtFmVPscoqsn2vhdwD/gXJPf/y3n8zDZXH7+PK
         7mXl4lyRHY2DAmijWkiiQWNrjvjir8eibD2FCTL0JaeL++SWtwgZLpwE9HuB7+qBffps
         FT4N/+suxUMiOtnfctui6EuvrEcRSDLeGc/Rd/hzS/nXfzd5c6+h3CQJweaIOR5mmQvO
         /zcI2o1EO6uc1O+mb1QW7WjHtSJxF0YuwQeiPy7mDZ4EdlgcGuJK3csPVEJuQb42rx+a
         KN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l+niQmlVPcXRSqM5Ozit1idIBmWDMllkBN++LzkycMM=;
        b=oiJGA0ilYScCVlCkJRqgWz5oGuzyJ9B6UQmXZ02s2WEEtCkGlOdWegDOZogRcH/x9L
         i/2TvSAWeUqMJK5GQigiNHVQwuDw+hY5HM4tKOjoN6fsbmSrGzI6bhuCzg/FbyOdYuxQ
         y4ch/V4RWziVRIN82TIOdhVYU1ztnTDlkCo46ZwGfx/NUQgAQpsmQRq/UZndqB+nZNZ6
         bbptHXAVegU3szotK4Vn+8QD1suvWqKz9cBkPyK/qg0Raay7s6j/1xo5HSTRp1Lb8psj
         H3AGRGr+bWO5ORyyEh/QW1VNVTd4wNMtPYHRL54nk78J05yosv/gKJKGIpU0Oqpf8m9D
         if7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KquxXBaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e65si14646380ybb.119.2020.10.12.06.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KquxXBaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxlK-0005af-5F
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxko-0005Ha-J7; Mon, 12 Oct 2020 09:20:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxkm-0005O3-PY; Mon, 12 Oct 2020 09:20:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id x7so10566425wrl.3;
 Mon, 12 Oct 2020 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+niQmlVPcXRSqM5Ozit1idIBmWDMllkBN++LzkycMM=;
 b=KquxXBaZJQJsjqHeRh8a8xfg9wMBDetm89hSuTHIaLujbk5En1t8u4oVSh9nEdiDQG
 hxUYwnFsozlNAu5TsD3F4cZ1EyqF/llaHAgE8625xciRSPPAtOPJPf5AVEywKTj77cxB
 V1E2nsPJGIB59I6S1wP9PYzsIi4oXzFo07Mxz5N1Fi+jVPUpbDHi7tlm8uinscJ2A/DF
 UcYZ+A6QGwA2rM8QdT9Ox1x/SoSHVUOYl7vz8plRAswq1TIN2mSNilravqoy6/khQOrg
 aao3Zk4hKMeUCiUZr1xOg+nM6Dx1iMKIcTA1DKPmt1Jfs9coZm2V0Tsq1F//4z/p0EYn
 PAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l+niQmlVPcXRSqM5Ozit1idIBmWDMllkBN++LzkycMM=;
 b=do7e5D23YQeOrPegmRA14BUJnoJQXEg5c2ZYVE1fDcjk91EG2pUCLMeBIlSCjtaLs2
 5/q0ex/3UtLa3n43FkkZhmWJPFZlflIxzuMOqTpItKBQ5iKvTOm/4Yd/CAsOnatdMAqS
 SWGx7z/awqSw9UMGuA9Bbp5RPtxO0ufeJ7WMEHLL9noaPCJwxwF+mIsSY9rjCWsGa00w
 dW7qwEmchdRDFbTiNZmzkDFYFdkYWomeKuJD+bJcnINYzk6ByOkdudlNrH7SfX8Nz9Z/
 7awxWwPo3uCR/oZDHQAgWBRkyJi95cb3d/+CfSD77Xabfw5vpSk1N2X3Rclqv2wCwUIS
 eaow==
X-Gm-Message-State: AOAM531AYGJW0xbugLllveEoqF1bG6JBDV+K8Cl9IzkxKR2gvPNXqUR1
 5oxwVYiVXOyX5jrpWHL1vKYe8p92Cs4=
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr29257193wrm.375.1602508838768; 
 Mon, 12 Oct 2020 06:20:38 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i9sm23447543wma.47.2020.10.12.06.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:20:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/pci-host/versatile: Add the PCI_BAR_COUNT definition
Date: Mon, 12 Oct 2020 15:20:15 +0200
Message-Id: <20201012132017.3423954-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012132017.3423954-1-f4bug@amsat.org>
References: <20201012132017.3423954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1WsP3XF0TRdR

Note from Peter Maydell:

 The versatile/realview PCI controller has:
   * three PCI BARs which represent memory windows on the
       PCI bus which bus-master PCI devices can use to
       write back into the system address space
     - the device SMAPn registers allow the guest to configure
       the mapping from "a bus-master access to an address
       on the PCI bus wherever the guest mapped BAR n"
       to "a system address", and the smap[] array holds
       those register values

Use self-explicit PCI_BAR_COUNT definition instead of a magic
value, and rename some misnamed variables indexing the smap[]
array from 'win' to 'bar'.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/versatile.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 61465bbbb65..f5846b803c0 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -73,6 +73,7 @@ enum {
 };
 
 #define MEMORY_WINDOW_COUNT 3
+#define PCI_BAR_COUNT 3
 
 struct PCIVPBState {
     PCIHostState parent_obj;
@@ -99,7 +100,7 @@ struct PCIVPBState {
 
     /* Variable state: */
     uint32_t imap[MEMORY_WINDOW_COUNT];
-    uint32_t smap[3];
+    uint32_t smap[PCI_BAR_COUNT];
     uint32_t selfid;
     uint32_t flags;
     uint8_t irq_mapping;
@@ -151,7 +152,7 @@ static const VMStateDescription pci_vpb_vmstate = {
     .post_load = pci_vpb_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(imap, PCIVPBState, MEMORY_WINDOW_COUNT),
-        VMSTATE_UINT32_ARRAY(smap, PCIVPBState, 3),
+        VMSTATE_UINT32_ARRAY(smap, PCIVPBState, PCI_BAR_COUNT),
         VMSTATE_UINT32(selfid, PCIVPBState),
         VMSTATE_UINT32(flags, PCIVPBState),
         VMSTATE_UINT8(irq_mapping, PCIVPBState),
@@ -203,8 +204,8 @@ static void pci_vpb_reg_write(void *opaque, hwaddr addr,
     case PCI_SMAP1:
     case PCI_SMAP2:
     {
-        int win = (addr - PCI_SMAP0) >> 2;
-        s->smap[win] = val;
+        int bar = (addr - PCI_SMAP0) >> 2;
+        s->smap[bar] = val;
         break;
     }
     default:
@@ -235,8 +236,8 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr addr,
     case PCI_SMAP1:
     case PCI_SMAP2:
     {
-        int win = (addr - PCI_SMAP0) >> 2;
-        return s->smap[win];
+        int bar = (addr - PCI_SMAP0) >> 2;
+        return s->smap[bar];
     }
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -377,9 +378,9 @@ static void pci_vpb_reset(DeviceState *d)
     for (i = 0; i < MEMORY_WINDOW_COUNT; i++) {
         s->imap[i] = 0;
     }
-    s->smap[0] = 0;
-    s->smap[1] = 0;
-    s->smap[2] = 0;
+    for (i = 0; i < PCI_BAR_COUNT; i++) {
+        s->smap[i] = 0;
+    }
     s->selfid = 0;
     s->flags = 0;
     s->irq_mapping = s->irq_mapping_prop;
-- 
2.26.2

