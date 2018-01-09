Received: by 10.28.173.206 with SMTP id w197csp3162249wme;
        Mon, 8 Jan 2018 18:06:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBouaMgioPKhYR+7JBI+e1UMc0YjLA4Lv5bXde+nb46rKE7kF3i9kVUE3xXQo+fghEy/qpAhr
X-Received: by 10.37.183.142 with SMTP id n14mr12745737ybh.214.1515463584716;
        Mon, 08 Jan 2018 18:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463584; cv=none;
        d=google.com; s=arc-20160816;
        b=JsZAZ4aBuRzyAc/iZnPswCOgL7Xt3o+CjX3oihP7Ug87XRELmvnxURwpvytALibUf1
         YL1RysI601DKS4Tzg7RJivca31k5K1f3Uep5GMI6v6F04DT8zbqJFvJv+u67Ly2TcFpp
         1xIgHu0dcDtD/3I4k3KZ6ei2G2ypnQd6pQkvnhrS/FFCSlrYXGrAb3ywttS2JeFsMHil
         cCR4he0LER+mH9nRPxv7bs2IO4XedjPbttT9KQK2jj2BEeRS6W4Gv2g/i9zfihwqsRRM
         HyKmSbu5orCUtLAO/r0ZTdnad0Pb8UQg9a7wf4yAKC+8d/GKVkKKGsDyEXhnAZYD2uAL
         QXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FnqIkEXzSSVUCO0dSIqLye+TaXBnwHcWmstl57m89KI=;
        b=MU909V1ENYUuL0DH8B8+egKjCXVf4AbeZc153SAnBHghonrwnNZoCEGwUD4+yPTKEt
         uge01M0TbwmiX3GB2e3lKLUcXEV/U6uLE87R5ewT2dTjGf4wU0dAdPPMl9H7rF5EToNQ
         tT7ZdpLahecbVmRntKvqBe/jFWsfFwwh7zwzKAFqE9mxIw5MIV/Y3QOeCFJpezTnmkHu
         T1RG9heHSzbaQrv+uWoDJH2cDPKTazegUPFCPmzKQRHMJkX67Zv5+2HHzmacm9rvYRyp
         muXnsvkVk/1rrHAy0wZrcCevtqRjvk+rPw2lzJKeiyVVmVupMyFyn8v/AiW7diMcgOrf
         puLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xz09lOla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128si655142ywg.798.2018.01.08.18.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xz09lOla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjJ2-0005QR-7I
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:06:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEM-0001yW-Nb
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEM-0002LS-1X
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:34 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEL-0002KE-QW; Mon, 08 Jan 2018 21:01:33 -0500
Received: by mail-qk0-x241.google.com with SMTP id w1so128163qka.2;
	Mon, 08 Jan 2018 18:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FnqIkEXzSSVUCO0dSIqLye+TaXBnwHcWmstl57m89KI=;
	b=Xz09lOlaSwZ+7B06Wu05DKL8GQ3nF43JPBsUTcFY9oHtkYpTAeZ66SSAVi+bQkWWtE
	kz9SR3eI6d9ic98mYjobSmCEW4ld5SjKzB0zZmkqeeUyOc6tkpCt63i1ZTbdprJOr/gK
	Nago1+mBrPRKyaxutntVEkzImJcazVtWaatyyz1Pixem8NBVHUNCK8gkfPLmVR8ml58w
	+cJUVDZtHrELasyJSbm1fonyG/QHl93TMxeGweJ9QLLLVy1MLKHDJzkUh5wCNagtBaLq
	4mDzXdhv2hPwOGAgYtxjkTqnVWgy3dNES9ab81/7/WHAGmvnywmx12pNGY+2xtUJ7Dqq
	FIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FnqIkEXzSSVUCO0dSIqLye+TaXBnwHcWmstl57m89KI=;
	b=i9N2P4lZ2fq0BLvjw1wtxA5Y9/30ArNj39SIaMgRb+6oAqVMR316gcUgU74eshmqy0
	BaOQpHQUpFbwHQ6NZehFlknNgO6Cw9X/elUihu1EE/xU6TeAPko5VrkEJKgophCVOkD4
	txbyfttR7K0PAVQn4h8KvgnJb/fGlvz0Apwi6Wf+tH76qglsMHGaACYrK87sV3lcvrje
	lvP3k74LTcGFJj2jI+ecW3z635TA7KB2q0m3fReQL01w88R6K4XDCA6kvxb1SdkQgbqF
	Nhzj+UL7Jg6cLcZhiPXFrHaEQLOgP2MypRCSuiZL+zqoMVK5i0iTmC0cWm0RMdkI8Tyr
	WMUg==
X-Gm-Message-State: AKwxytewwG8z5bfjjAuE7klqM45HpPVGoRmpssel41Lj1b8gWaFKiA+m
	l3BO3ujzS9evLC2HI1YjfUeD4whME+0=
X-Received: by 10.55.179.131 with SMTP id c125mr18913727qkf.186.1515463293206; 
	Mon, 08 Jan 2018 18:01:33 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:50 -0300
Message-Id: <20180109020054.32553-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [RFC PATCH v2 5/9] hw/dma/axidma: add 'xlnx,
 eth-dma' FDT alias
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMtIpK/7Zbng

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/xilinx_axidma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 9b48103574..2359d5c114 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/sysbus-fdt.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
@@ -648,6 +649,7 @@ static const TypeInfo xilinx_axidma_control_stream_info = {
 
 static void xilinx_axidma_register_types(void)
 {
+    type_register_fdt_alias(TYPE_XILINX_AXI_DMA, "xlnx,eth-dma");
     type_register_static(&axidma_info);
     type_register_static(&xilinx_axidma_data_stream_info);
     type_register_static(&xilinx_axidma_control_stream_info);
-- 
2.15.1

