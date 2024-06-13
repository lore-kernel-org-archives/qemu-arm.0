Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp31830ejb;
        Wed, 12 Jun 2024 18:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6CVOVHs7XINaUOpFS1eWbVNCpyAjwtIUcQCGX3RaN8xYcx8aT0D8yjNHq3VMt5MURQH3b3PX0sZz9Yz3aHDW08aOlR+xc
X-Google-Smtp-Source: AGHT+IHm3FaPPkXoQB7Af6Px4xpi5TgSBeJbAC2GTpWXz6CEg3DdS9RahJP5wLJGnzaokExuHCWF
X-Received: by 2002:a05:6214:5682:b0:6b0:7fa6:c004 with SMTP id 6a1803df08f44-6b1ae4ca1c8mr44460916d6.59.1718242245871;
        Wed, 12 Jun 2024 18:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718242245; cv=none;
        d=google.com; s=arc-20160816;
        b=p2qQMOtiytMXPTtsxm45KLpVUobwhQaJiCKzEInuY6eC9BdbLUSQ8s3IL9MOD2ttD6
         QoHnPjrQET0EPG04dNWjwHobsEN8IySvWVm6zHZDGZcmBY/93JcF30+bRHbxe0WvluD4
         BL/UHHehIZ9RTJ1Imd1IZldquOzvcjC5oFdy0fx6My6n+YZ35oYRHDRV13D3NBHYecJd
         nnmUx7zrjDUdtb57xlZjP3Ns3mmwSc2YpNjBY6RlXCGasdS1EahaFtAkxqN6E95jyHZl
         bBW1K2vgZSpCgS6zY0T/j1wo/2UxMB6BDpF2RbP+xHF6Gyj08iQ/JFGKJIekPW6ECbyq
         qRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wMVIvPPDyIsXb0IIrUQL6wLJN2o+AMmh9m6vpVCxHFY=;
        fh=yuMLVi0Yidvm4kTYwUr3uqcKFJIjVlpkbJdu+i39Kag=;
        b=KuZf9MHrdcB7nbeQ3AeLO8cZQI6TZFKhx3mB8YQeJecwZFo+D9QFoP4unEJ2mOsHgp
         mE5ntwfK/E2mGvKOtCEcPRc+qMbAJU/RccX+x99D8j7t6HQZCgLwA8Un6ne1+3NYbliB
         t1OQWIxnnRIHxlelA1S3BkYcbns9lXmSHPP8pKvqk4iqCh2hUt9On7vICNY0C2jzlFpK
         vSawiL979f9hSQWtuPppF8m+oJwSH6MWSR3etGKB+q9DytIhkTA6VwkQLSFPQoKiy6HO
         gsz7wQVur5PvXKhDBQfHicCvaV1ZorJs10yDtzsb5OG7mY0OtX6hECfaUiRfHp7hvpM9
         7Wog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Rov1rsbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afdb34si4147696d6.191.2024.06.12.18.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 18:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Rov1rsbJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHZI4-0001zs-A0; Wed, 12 Jun 2024 21:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHy-0001wG-28
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:30:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHv-0008E1-N0
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:30:05 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-6bfd4b88608so358005a12.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 18:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242202; x=1718847002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMVIvPPDyIsXb0IIrUQL6wLJN2o+AMmh9m6vpVCxHFY=;
 b=Rov1rsbJdg0OSKfC8G/xvxY1dLR7g3pddeG/OKTLoeZrOGHC28wxYRCBaTzLtJZqXi
 zKS2DILs3rAfBU74LnYz75RKTMTgG3TcWqf64kMmmdoAy38brmrk89m2cOduLeGoPHma
 D4dCRRJUjYsnqAn6X/bxzpWEFg/BCSqET8qpwOfy93m3H0KIKa51lhXtCo0w0xqHFqXB
 u/SzIYajWA0M3sz+6wAzdsVH3tgO8qN5bLJz3zX1FP3XNO0Yk2AgvRPmSAObRM7VDTIo
 C0tDblw1BKho738oZePPEgLmLno5otUqbYYAo5k4Q6fc5Z7h2XHSKX1Ge9e/0O14rFq3
 3OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242202; x=1718847002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMVIvPPDyIsXb0IIrUQL6wLJN2o+AMmh9m6vpVCxHFY=;
 b=gWI6vOZjzQyDsAkaatc6hFm67HagFegLgQiU/Vr7u5+GmqumEWPC9vxIdLVDpP7ias
 hmJpxQDlsCiZByeOXT0yrhY7Fr+QisSnb8s7GFygy//mGZapayO+GnODfNCkPHbOjhyX
 c0liXg7z6DfwAEskxxurDHMRgKt4+lVNu4j7uVpaqgxqWtJXAQ30TinI4iP+TSeI1/NY
 +gToC57Um/BFB3xsiFYIi4RKGUa/LR0mi8d0Gsqn+wcrkDe8aImjPk5B2hiz7JT/R5Eq
 CQcdcH+XUzkVXPsxFbsaShDKDaehbO5nkG5E6ITyrvZ2l2dKgLmWddAacL0Uhx69lMRL
 zYbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+dJeeil6ZtaaP/R1813kRmOJJJE+6f39EXor51j6zGQYTw0tROck5ub1z6D6Qt7RajZR42AHFmCogENdhPJqJEf9J
X-Gm-Message-State: AOJu0YykXd27hhLLL20aX61nU+iWwmWb04QDcPeVtK2x+DBd7OZTGuYz
 1AXL1zaO5nUP0bevXsdaqETscSyqKP3tWDLQvJAcunxZqr0e67WkZXjAwsBVcss=
X-Received: by 2002:a05:6a20:43a3:b0:1af:939b:d477 with SMTP id
 adf61e73a8af0-1b8a9b8dfbamr4030446637.36.1718242202296; 
 Wed, 12 Jun 2024 18:30:02 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:30:02 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 3/3] hw/net: Fix the transmission return size
Date: Thu, 13 Jun 2024 09:35:01 +0800
Message-Id: <20240613013501.426905-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613013501.426905-1-fea.wang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qXH3xJtqTq75

Fix the transmission return size because not all bytes could be
transmitted successfully. So, return a successful length instead of a
constant value.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/net/xilinx_axienet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 7d1fd37b4a..05d41bd548 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -847,7 +847,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     axienet_eth_rx_notify(s);
 
     enet_update_irq(s);
-    return size;
+    return s->rxpos;
 }
 
 static size_t
-- 
2.34.1

