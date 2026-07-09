Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A09C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 16:42:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whroM-00038q-H8; Thu, 09 Jul 2026 12:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroL-000384-Ht
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroJ-0003bF-L5
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:17 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669GQ85D2319665
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 16:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2guKjLLIh6Yke0jP3jv0CWfwxa2kqm9ufX7O6VOiGc=; b=XHvzB/KzA1f7RJaI
 ofMa5MieFSjYdS3/9GWgVd5NQ36neZIYXRSICVoSHW/n2B+zZ7EHItNLmie55IGX
 XMbUqjj8M95sD6vvxABxZEgf/GDoBOAPlTAzNXmhWLgvOKyyXZk5y6Ona79Iaeot
 fEKrNNf4WeM72blzcSIv16VZB86QI4Ot5M7FVgYFEjfUEp6n22INScppzvWhYdOj
 qLZ0MetBcWT0RiPBt60LaEhN8fS7V1oFLgCpm3seffBJBEAJyXoZfBly3saQkACQ
 LcJz5O5+kG7kPFyo5ebmElyncCNu6mSCnV7elWcXqIVBL9L3KKBQ8EfOPJX4ABOt
 5wXPwA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mr3dw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:41:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f113592bf3so1382586d6.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783615274; x=1784220074; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2guKjLLIh6Yke0jP3jv0CWfwxa2kqm9ufX7O6VOiGc=;
 b=WMK80AlYDXk9zHkY3Dl7USDZla3bYXow5c6UDx6w3mT6gS642kemGVyoSp0cg3/4AH
 zkcAzTXa4KTmviVM+hmDzm1vhLRJ8URtumU2cUjzTKwbg1BBcHidUqE1ykykCAsvFzX+
 lj/85VAlfEgEi2DBTTFtl4V/RL2hMdoGdyVibUvQkai2fNe8hQ7sSViP3+ENFzK4Hywz
 Oit1SXEKcMMLSj1ZXYNj6NeGJKi7DS/coPvoo0LZliHghICJAXEbSdE++h1bRZtw2wsF
 YnQrS7gtQ+88kKmaIFCvhtg5vcZPEUJodinBN/6+zVgXQhEgHahf1eSFuaZTj/Y8egh9
 wqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783615274; x=1784220074;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2guKjLLIh6Yke0jP3jv0CWfwxa2kqm9ufX7O6VOiGc=;
 b=RA5Gb5+nuB7o68lskGOj8i7HCck1IYMPSZOV1rJtEYEhi6Cfrq98WOsvuQDxd91LZ+
 HJTsk8MXBeH8yErgz24+fKLhM5hbwB5hi8kVRKewhZ6823/Pbz3PQrXtpgSaCkdgNSOh
 erauZ2CillcHE2HJe0BBXuGB/YOWL1AOKX4obvmAWcbWTNgtCE0poUvn527r6YynqdQj
 Ib9Dd4xLaDOnxYL6PvovcptrbgavOu0b9k+Igv1VHthXt2LIra/4sej7+VrQHeIRs5Cj
 UkS2pnPUy5JqLiRIqBbaBKwJxADPR0TLFuV5nq0k+F4iIKOPm4Y0Jo3Iad1nClyTjAjZ
 xKpw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp66OicL+6q9MKm9tOf3nnsotALNSxdiTmYg0fuWDEGmvEh+h52Dgm+/7zTQt/d/UgNfvVhXz+eFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw8vjd4MKSQ9Za93mmV9/XEZLujCqFSYfd7KRKQOYEBYqck6AJ3
 /AE/WxDI3z4y19uldA83DavCpdWqNVhdDd7wqfuavE8jEC/v1yA2PswVh+x8QCj4fw+5V4Oqhw6
 XPrc63abaRYU2rrZwLvfYlk/qr92Txgle3BdPluXhZCPw95cSqQdcSow=
X-Gm-Gg: AfdE7cn3Pz1yNzeeY0MJxxh8/qILZuoTHBvNj4BxYRTz2pupcA0FO0VlYIqZF/mnmNM
 Alh0O3KpG/9Gn+LD0HT+dLKmzVWGyoHB0UAcwUUXojUhY49SUpsA6AWzX9Q561yWO2otjsJ2267
 qpS5IBq8U6j6qcUpJ4ywGRqU3PNkjH+qW5laQUkUSngQ/ge3482QVCNRZOhRzJaCW6uHAXEldrF
 /0kIVW6A08IiEJFeoWMYjz4rajFN0ZkkAVDCNmP2dDcF11NvBAfmVJDjyR39svWHpzB4Y8UNPQo
 R8iuExpqYxCVO6fjEqqfuFY8/pIy9qL4J/5WvHzzd7JdE9te5VUL9IUBQZn/zJSnjQZKVlBaEtu
 11fINCjgEPqM1/wyDYmWgLHumNbMry9ISTD0sDXUuA6MACGK96hD82nxSZiRiESWVoeEX
X-Received: by 2002:a05:622a:1f89:b0:51c:c29:d4c7 with SMTP id
 d75a77b69052e-51c8b4bacd7mr87241141cf.62.1783615273733; 
 Thu, 09 Jul 2026 09:41:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1f89:b0:51c:c29:d4c7 with SMTP id
 d75a77b69052e-51c8b4bacd7mr87240751cf.62.1783615273349; 
 Thu, 09 Jul 2026 09:41:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d8410sm53890854f8f.15.2026.07.09.09.41.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Jul 2026 09:41:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kane Chen <kane_chen@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-stable@nongnu.org
Subject: [PATCH 1/3] hw/arm/aspeed: Add missing PCI_EXPRESS -> PCIE_PORT
 Kconfig dependency
Date: Thu,  9 Jul 2026 18:41:00 +0200
Message-ID: <20260709164103.37614-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709164103.37614-1-philmd@oss.qualcomm.com>
References: <20260709164103.37614-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Cd4niuoPnyjXdxuJDfiUNK-9KdeIDLZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfXxtlNfmEsTvkw
 ji/lyb5uQkBo/H8v6pnjXvyPH6p32utbHSRLE/1wmJ7MTDIdoKyr5sff3iBAy4k1DjyKUMPwGpG
 Hjspd7w02IksM4s6ATFSgZ+dj+NQyLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX5mmP3dABxcx4
 mOgBgwZXcSliYGjFioWB378aOmWmflMqdw1ULYP1PmfgDfymW7evGQlPwaATm0KGXv/aKPn1tkf
 r2LD9B5gWN1nzKvq0ndxk01IpN0xp6JiymprhE4rXTyan1UdP7jaeb7hNPgaVpY5flzk+r8pGPv
 V4bdN3cg0n1SVC2ZnLmV1G4eTdB882JvQaiDFZh4NMCjpm/ONOYbXFznlpwuXUimd1JmsxUH3xA
 vbhMlbA1O1ipVGHiWxmoBjhwM0P6PLhgl2R7svO3wAmJ9zEdl0Eb3qqBJE9nSIMVb3PdxxyL2Wu
 z907z+oHgwYICtdHuAS8k0FGw5EJDDAxjYf6fu2sEGgvlqx3ZJ4yT39tZCoROTJWrlq3vX1eGIg
 KHyhzIDA4oDUQ2S1f/uqiXHcCNuY0Y2/O/TuabVblSRO+3PS7LLRNspP3GlfCpKvqeffzo0x58x
 RtI1cp9J7TwYEu+vS8A==
X-Proofpoint-GUID: Cd4niuoPnyjXdxuJDfiUNK-9KdeIDLZ8
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4fcf2a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=5Fcm2OjPWWNMJlL2lxwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090163
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the missing Kconfig dependency on PCIE_PORT to avoid the
following runtime error:

  Type 'aspeed.pcie-root-port' is missing its parent 'pcie-root-port-base'

No need to have ASPEED_SOC select PCI_EXPRESS since it is
already selected by PCI_EXPRESS_ASPEED.

Cc: qemu-stable@nongnu.org
Fixes: 2af56518fa9 ("hw/pci-host/aspeed: Add AST2600 PCIe Root Port and make address configurable")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/Kconfig      | 1 -
 hw/pci-host/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 82e0bc2e700..00e2d938033 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -557,7 +557,6 @@ config ASPEED_SOC
     select MAX31785
     select FSI_APB2OPB_ASPEED
     select AT24C
-    select PCI_EXPRESS
     select PCI_EXPRESS_ASPEED
 
 config MPS2
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 8cbb8304a3f..bda6e161f1c 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -49,6 +49,7 @@ config PCI_I440FX
 config PCI_EXPRESS_ASPEED
     bool
     select PCI_EXPRESS
+    select PCIE_PORT
 
 config PCI_EXPRESS_Q35
     bool
-- 
2.53.0


