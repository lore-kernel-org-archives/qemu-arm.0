Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA04CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu54V-0006Aj-QY; Thu, 04 Sep 2025 04:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54S-00066F-QZ
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:53 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54G-0003zL-9e
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61cf0901a72so1237296a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973497; x=1757578297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHrtANvKFxNzkcAR0b6AvL2FoL97RQya7kVY684YbqM=;
 b=ilV1/w4AaXXyr2OLU50flKNk+eYnnRFEgKcqQdtycHO7h/brzNXQeLlYYyOcgk4iMp
 zDYkBXxq6ez5kUZ2tHFNBYlPiuMXGt6VOzFgS6U6uLfwIxQc9cpmWqCe7n2A46OERpTw
 w7w9Hj5NBiLminKr0qzhA2en0McXzEqzjTFJdrKjSBy4eApxKUgw0BBko111fi4IV8Uk
 mAlymUSDijDXRUooahoqpsh1ppZ0oJ3k03jlD5lboF4mqaazbdXBC8BegmN6Eh6ZxWTp
 BQdPPpNibCS4+XWjlzQ4p8zh+wLc9+TKFOAxsRJaYFUnroKEQP7xOGoFqBk+c5z8IN6L
 ZlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973497; x=1757578297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHrtANvKFxNzkcAR0b6AvL2FoL97RQya7kVY684YbqM=;
 b=AiXGGJRX8U9AVJl588Dv8xBml1Yi9RfRkodVBlrj+JPw2+oeVPAfQHq/uVLUhGk351
 nKuPCDfW5z3t5+2uWtzYgstRKMEL0vLe4fEuZW7cKBi/zrIctllD4RJiRYhEYvWXRBj6
 1Bu/3ZGGhdQk2REs5EI4JBnahaPfa5/dNYpR/zpJbw68pu6fZSs7/l413gNKkXP4MA88
 hBfaClz+RKBSgpWPPmpRIUmdtuRroQdinomDYqOqEWryRGiTAfoaq2vWlTueMsaBuruk
 OpOTMyglm29LZqHRQPMCKyUu/wrNZs2dCLg+LKyLy4vTLrKE3rPA7iN56l9bFpeaQNk2
 QblQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGAP2vl6H9nLRElXG5QM90VP1apTcDMxBHsTH8rXUFF6tWsl15cvjpzxSwLSvrkdztSy4moIBjg==@nongnu.org
X-Gm-Message-State: AOJu0YxvkvhvE/lf7/z1MXggl1ptDNv1rXPvkI2ouU0aMgQ0OGp6YDZL
 k/Eb0AMJavM0VtfAI2WVfoK6EjkyPYdl4CUvA0mS+TBgLfPvQPV5WzPxN1KdqVH+Fnw=
X-Gm-Gg: ASbGnctvmR//8hd4WwMuLjvu5oMJ1Ho6ZQmC0vJOj325YWh5P+TxIvmF5x7QAoluPEK
 aPRBnkwkjIMTLpymv9HzYBei7GpvzPyIIDzWdEV0exllGdMEsM2HUTFzZeJMNTdc5CtyDN0w0qF
 yol3Ifm84+QpfNDsHYOclo8HudBrDBwIbnwdTIyyUvdrkUR3c4/W/OyoVwpEdWReQ2I6Ff1vymy
 RILaFX3qY5b5epamq60WQDxtNyrYIeiDTJangwPNNEM8e0BmIbZ56hoxCTY5dN/wDn/Sw2E4nrI
 OAGwJ2aFryAhHvGuyujzQozaTmkCGLgE7LnXSmoh9uV7gkUfLTT9b6BpeHpLxhIJMt1lDGiG9JS
 EV4RLOHu0n+bxphVfEBInCSBDkS1TpyYpsA==
X-Google-Smtp-Source: AGHT+IE50bO+WNB7PMlFTG8eHGh7lccIiWFKBJI8DGsC+fWHFDbHDEStJcLiriTfrAkwiwE6IWbViQ==
X-Received: by 2002:a05:6402:5110:b0:61a:9385:c789 with SMTP id
 4fb4d7f45d1cf-61d26ec5eb0mr16023613a12.36.1756973497421; 
 Thu, 04 Sep 2025 01:11:37 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7dfesm13908866a12.7.2025.09.04.01.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1C1B5F93A;
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
Subject: [PATCH v2 006/281] Update version for the v10.1.0 release
Date: Thu,  4 Sep 2025 09:06:40 +0100
Message-ID: <20250904081128.1942269-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
index dadcbd47d3c..4149c39eec6 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-10.0.94
+10.1.0
-- 
2.47.2


