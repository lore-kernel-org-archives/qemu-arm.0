Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93C7CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu54W-0006B1-8j; Thu, 04 Sep 2025 04:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54T-000677-UN
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:54 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54H-0003zw-0r
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:53 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b04770a25f2so102690566b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973498; x=1757578298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNutAIaXOMQtmCL/HAblUioHloxc8S7R+7KvtZJ66hg=;
 b=tbGtUvECqcgmBlJMGT5vriHLsy1P9p+TUpSamSU453bITIbxkfoX0tK1Cgt64tIoIr
 VoGwLL9q3d3bo7j8OgxRqPhK8Jh5KvivQR3mDcqQGIFin3gA97GxBrIJ2gf+MDLgar9U
 XqtTpb2EjI68/86GAgvtEcQAyXBkuDiqBwaKUY0pKbMxdzov0Q2qvEace33wLw16qvSA
 OagVYejBYLRMi4KWUITNy9sYD+V8PURVNP0Pz8MMTWRPN1Fbm8i/DzoMWldxC3hEgLV/
 rJuyYmTs9J58F7DVNb56idEPAkkgUoMdwrGnTmYGrIr/JdSNpbShKcgtuLwZ2iIcd8G7
 m6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973498; x=1757578298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNutAIaXOMQtmCL/HAblUioHloxc8S7R+7KvtZJ66hg=;
 b=O6FGKU/Kc5r4jR3D44H8e4ef98yAJHVPwdjaab92bkSzRVaa5wmCT127IFYF2kDzee
 G97oMGTb24izxhfBffei+M2BjMU02qF67TgqFiG0DnpUvkL9NMRLaHxc0Mm9sKpm6Qv2
 4olM7MIuPhPd7VzrrZQiCmyIQ97dR7vAQNOHrpRFbQ6pWzqRzmBRGnrQlqnATB2Tk4ds
 kAs6pw1iap8iL48mbSvbMyAOcrMl0FQgwZB3waw2Zg1MlZgyeizvymFILk0WlFFlYC97
 X+Qnyxr2ez/v6EWIBZ7xejypmhACZF0lMs6UMFqQNdUiBCfJ6MPs4UuYxRdrcg+olnVd
 wp0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZUad1ZhRhvpYB7Z+RXgzgRrW9bxE0fgMXnpCTAZpRuvfF8S71UasLt3QzYtlaIaM4G2Ma2iXuFw==@nongnu.org
X-Gm-Message-State: AOJu0YxngT8+XQVu2mGDsSZI73GcqoN5aSgDosZ42B4ubyvpiTRASHbQ
 mnKO7tMdwJ/O0cIZuP1a4ZYcaAe9srE8Eefwu7LdO1nB8n7PPzAm/X8NAb/ckYBzO/s=
X-Gm-Gg: ASbGncvyXXDp08W8VAoEwp/m6+lD+4uGZvnw+gt3JB6VkhacMzWWAfZmz66eRBG1QOK
 dsOw2fYFgY8tFhFtnvevHDNOnxU8+htSJ4TS6fV1gYoNTDozMeeS2SEAX5AiN0/NTnVhrP1Kx/t
 C6Uo8ZKUPrVEafusp/LgtysfKD8WBhpHTqSI6McSrHSf+Zm1/sFDdzSGCx2HdYZLQgA485/8oYU
 gNTE4BuDAzLc4WjJTVN7TRet/uzTv+GP+f8HOMwDL3qje+tnJ1huinaqYLjkwWwy/gDXq1B8Ubl
 DwM5Lb56l9mQULIqDClTEpDrUA6PYS+UiW7sMj7ohSaEF5Cdv00mMFUE87P7f/dmpcZOVldONmy
 jIPfd7k2sgihlYXF1qhNEqVs=
X-Google-Smtp-Source: AGHT+IGCnzgac6vT7YI6lW9Re7nuugDVS0yxqvBIi4yDWtnRMnHUE/Y/1DNdNjVG/Ij9oU033/T7Mw==
X-Received: by 2002:a17:907:a09:b0:afe:db34:d769 with SMTP id
 a640c23a62f3a-b01d8a70dd1mr2060362166b.18.1756973498255; 
 Thu, 04 Sep 2025 01:11:38 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0ed6ffebsm1422316766b.32.2025.09.04.01.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:37 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA7D95F93B;
 Thu, 04 Sep 2025 09:11:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 007/281] Open 10.2 development tree
Date: Thu,  4 Sep 2025 09:06:41 +0100
Message-ID: <20250904081128.1942269-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 VERSION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/VERSION b/VERSION
index 4149c39eec6..9856be5dd98 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-10.1.0
+10.1.50
-- 
2.47.2


