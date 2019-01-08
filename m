Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4775035wrt;
        Tue, 8 Jan 2019 08:30:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN49DTM4+ure54TDZErJg5mBZD0MiPKxYYhuMrMcOQhDieYH/XDh32GyCGUICmmw1nAFjyt4
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr1968391wrd.294.1546965031318;
        Tue, 08 Jan 2019 08:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965031; cv=none;
        d=google.com; s=arc-20160816;
        b=SzEONzdFGmw1E2L/2m77PyBg+t7yCwI55qSJTHZ/3dsYYtIU95b6d0JCXjN/U7l9HW
         fzOJpjQF7/6qHiyVT2TBH98x9XA2du7TWiGbCM6o4qgqH3tj/6mw9Am2vm/1Uje/E4E1
         syBDLC7ZpA196xMpiwMsOtDaCbp8INnmmQ0Lxd1rjv4b4hLs28nU4WiCSA2apQWIopOM
         sT+XUOYIJhSQYp6x7yn5BNO/pHxTKYNSayrCzzv82GwDcyqDLjoiV756ey8HR9lhS+Kd
         Pb1g7tPFWPK+a1KUf0XZGgYrNieHoiwsMrDia/85lifp5tsrYohWJ2xtohdrsDRGtegZ
         /3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8TvLhHeHZ8C43Ib56UzJG7XSdaUbxT7qr+rCEbqz1Ng=;
        b=XMgcG0jp8wLOjTqJWTrEYdFCofxYy9INy7OnDVdZbPFh2wU6JZeixzYrSxDzMbxADy
         sWsu2Gcotj8yFhknvIFTcZa6Ahl9YIDBS7rXUsveY/cctJ0/HDzgM2Vk1Pkj7jJQUT+v
         aWmfJfnbPAu9QhKwLHaGF3IWUxCmQ6/JOso1dklwntn6FVVLKmjtZCJbcKaShqcYjVly
         y3n4vsjS/eAfMmAijn0z9NXqy5feonb8tECVKerG0mZ/zsHfhMjpv2VtQPpafNzeKiLj
         1F4kkGF0IpKuPcs+IkcHSey6Uxno/fUN7AzRq8KrTqby1AQ6UaQo8vd44VOBgzdeX3SS
         rl3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD1j2net;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k132si7220711wmd.106.2019.01.08.08.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD1j2net;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguGs-0002hl-CM
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:30:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGe-0002gA-Oo
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGb-0003gD-Qb
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:14 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gguGb-0003eX-Jn
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:13 -0500
Received: by mail-wr1-x444.google.com with SMTP id z5so4649575wrt.11
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8TvLhHeHZ8C43Ib56UzJG7XSdaUbxT7qr+rCEbqz1Ng=;
	b=OD1j2netgEyGE6MXVCLp5wTzMppg3ETryCQe6xQ8ubpj8ybsL8WJMjh9ABEEzUeW60
	F3DWwWLRHzcwrR9YDAYk9RFlqocA+R/js2DZ4pVue5Yzm53WPHsL+2EkYEGZy0podt1o
	aga6nAqdRm8AgcPLXAEbpwGoxCSKvm/DcoiMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8TvLhHeHZ8C43Ib56UzJG7XSdaUbxT7qr+rCEbqz1Ng=;
	b=O9iBIDMD6iwAQPR/iqFeHt4H8fJZedePi6Ug3uwv3cKch2TdkOPsV50VMqCmq/DOT6
	No0fA0HY9TaBri5JiC8H3HhrGDCyx8tS46XJDyMaEeUFUD80uUfPH5htvfFLG+/uUqxC
	m+CP6FbTKyK0zorlTYmDS40J2MuPt5nN7P00KMxVbM2ZM7UDC41IwNv0I9+/ouV6ef48
	7vZgrl3OTHeQFsvNKVMmNegLRc7yqHY3uC4T5U5r1vuk/+dsWA+mB+MMf1UJeK3PNcyA
	9Zx3f/LGCqYphqGeRGFnsWdGRfOjeUoNJhcI6SYaj0htCf8dEKpdZfg/yW0Wnhz3TIlf
	WpZQ==
X-Gm-Message-State: AJcUukdTtkMdcp1f40JH+xRFlc7vg0NCODVosJhkbyZmojLcJCNWeWhO
	pOuhQKUJt9yYVbmC63sD0vI5rZTuW5xRlw==
X-Received: by 2002:a05:6000:100f:: with SMTP id
	a15mr2074153wrx.298.1546965012378; 
	Tue, 08 Jan 2019 08:30:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	x81sm11278839wmg.17.2019.01.08.08.30.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 08:30:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 16:30:05 +0000
Message-Id: <20190108163008.7006-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190108163008.7006-1-peter.maydell@linaro.org>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 1/4] hw/arm/xlx-zynqmp: Realize cluster after
 putting RPUs in it
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0dXtmimNjutV

Currently the cluster implementation doesn't have any constraints
on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
with child objects. We want to impose a constraint that realize
must happen only after all the child objects are added, so move
the realize of rpu_cluster. (The apu_cluster is already
realized after child population.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c67ac2e64ac..370b0e44a38 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
                             &error_abort, NULL);
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
 
-    qdev_init_nofail(DEVICE(&s->rpu_cluster));
-
     for (i = 0; i < num_rpus; i++) {
         char *name;
 
@@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
             return;
         }
     }
+
+    qdev_init_nofail(DEVICE(&s->rpu_cluster));
 }
 
 static void xlnx_zynqmp_init(Object *obj)
-- 
2.19.2

