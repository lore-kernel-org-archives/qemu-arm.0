Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp108344wrt;
        Fri, 5 Oct 2018 01:08:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62hID3Bex2wZ731RgoyXN/ry4Hq/mqUlCsQaNqXVGSbWcOeubcB/dv6auWxmM+39/vgLOP4
X-Received: by 2002:aed:3eac:: with SMTP id n41-v6mr8132455qtf.196.1538726930394;
        Fri, 05 Oct 2018 01:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538726930; cv=none;
        d=google.com; s=arc-20160816;
        b=U+OSAIeoDWtP8TCm0JV+9nnghDr82VtNH9r8ZzcAlm8DcPBeWrpcCLpt4toTKnWype
         VNuaDamg7iJMeAmPbQtsKaHEGqvltfceO9k3pE1/gXimixj187iuUDRgwNhoezC9sj5e
         5tr3zjkjMBmngI88xRz2FjuRjmOWFhe7AO542B7AWblX8EVyIwYxKqqygCLEdJXtBqyo
         iHUWZZoS7IC8Tr5uHNmGMeYaP/3CcOGXle/JYGgzXPUSza75BJkdPNB+GzCznk1prHRU
         vswh4ZPRgWepLgvGbjkhrXiCsu+Tp1e5+y+tjrCIaO3qR1d0aTTETYkxxInrQHXSx7K9
         igbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=f9H1MqcL2M/+UMnNnIPQZjNEMDpYSQtL7Dw8PkSKPAQ=;
        b=0YKhFZp+y3NkEufUL0WVKk2DPERd5Rc4cKZFm29l0/cA3jS2irQWQ7Fu3LB2MoJFop
         paik3I8NZ7ofk7FywlEboStp7ppV8MEt98Xhd/vTuZa7MQ8tFStzQSGh8SqoBy7MAl9U
         h5jxXkrF+L5/+0gIIMdyjRxdvYCh/Fw7SHfkpiwuAyPadBCFUqJEXgUofuOJx+wuj/HU
         RFOJSGXYhmDYAsP1pN+tICFmQE2MCspERfx//sqhwU7+GasOdx/BWYbatfDlPJWyrVBV
         qchCWBHIBTVzDmk0O/kY7PSaGricNapDa8fRX2GIis4y9fpiiB9ouiQuVGiAI/LMha9z
         Z+MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y32Ns4D9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j68-v6si775110qke.173.2018.10.05.01.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 01:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y32Ns4D9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8LAH-0003d3-SY
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 04:08:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1g8L9Z-0003c4-Rq
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 04:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1g8L9W-0005v1-NZ
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 04:08:05 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55864)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerome.forissier@linaro.org>)
	id 1g8L9W-0005uN-2S
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 04:08:02 -0400
Received: by mail-wm1-x342.google.com with SMTP id 206-v6so959794wmb.5
	for <qemu-devel@nongnu.org>; Fri, 05 Oct 2018 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=f9H1MqcL2M/+UMnNnIPQZjNEMDpYSQtL7Dw8PkSKPAQ=;
	b=Y32Ns4D9dznayfRuOnetMp0O0ao1UDq6EpEI/xUKpJscAKFmM96GKbvT/L5JojODJ9
	lBLjsR0ObPG+Idc3BTODZrcPKpN7n2bMd7myByurd55+RmF6SZp2vnomFjQktu9/9HvX
	AT5FdrPvo9Bl96xPYdaF2ZN8Eope40/SENSrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f9H1MqcL2M/+UMnNnIPQZjNEMDpYSQtL7Dw8PkSKPAQ=;
	b=tupVK2Ke/8h+GnYXIN1RbRQrmVVzUV+gK6g0z+EkGr8GoRN2u0SjAbg0ic02FnEeOA
	xQ9ya2NEKBLJbWFJNPcXSwSHe7nAZmLtreLyjJUmhclPaMxiv0Unoem82WkNXgL87+IE
	aU6dp4lrncZ7qCgPW0wXVT77mUyKd9brEqEd+CGE+qJnDPxjnBAuMHJGRp52uVNB1YVR
	/eMfuCtfaKz53cfqfWFWOPBuLosLw1GkHFQXgP/T2rVFO4lEM2qwul+t8vnwWP+VVoA8
	Hn2OMMSN/XE9Rkp8O/SvD4znmQJdA8myoPwHILxk9NaG707JpkRoGKMwguwmm7o7xli4
	SgJw==
X-Gm-Message-State: ABuFfohmLtl2uH7lwQJ4oBJoQuzZWwtgjPgqUlWdDfyTiaU64dn+4/IN
	pcy2lDGmvVFC+KXaW1uXRREdFg==
X-Received: by 2002:a1c:1d6:: with SMTP id 205-v6mr7268692wmb.0.1538726880717; 
	Fri, 05 Oct 2018 01:08:00 -0700 (PDT)
Received: from localhost.localdomain
	(static-qvn-qvu-167076.business.bouyguestelecom.com. [89.81.167.76])
	by smtp.gmail.com with ESMTPSA id
	g76-v6sm1320836wmd.25.2018.10.05.01.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 01:07:59 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  5 Oct 2018 10:07:29 +0200
Message-Id: <20181005080729.6480-1-jerome.forissier@linaro.org>
X-Mailer: git-send-email 2.15.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] hw/arm/virt: add DT property
 /secure-chosen/sdtout-path being secure UART
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
Cc: tee-dev@lists.linaro.org, Etienne Carriere <etienne.carriere@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82Fdbvm2Qiku

Bindings for /secure-chosen and /secure-chosen/stdout-path have been
proposed 1.5 years ago [1] and implemented in OP-TEE at the same time [2].

This patch creates the property when the machine is secure.

[1] https://patchwork.kernel.org/patch/9602401/
[2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b57f87abc..a0faa40d64 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -712,6 +712,10 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
         /* Mark as not usable by the normal world */
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+
+        qemu_fdt_add_subnode(vms->fdt, "/secure-chosen");
+        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
+                                nodename);
     }
 
     g_free(nodename);
-- 
2.15.1

