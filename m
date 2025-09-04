Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB10CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu54O-00061Z-ER; Thu, 04 Sep 2025 04:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54M-0005zd-Vk
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:47 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54C-0003xL-9a
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so107053166b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973494; x=1757578294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYe2srEOzuPavOLB2dyXu3UjjKzRy0khJhV96Tf8OLU=;
 b=C95RkLJayXv/k+1pq/jQDHMJgXjz7nQZhnkaaBc8b766ydU5ZntQ9F9h4iP9ymmC8v
 53MMQfrS1R8gDch4D4+gaCuit7x2s15u+8WIdILNxs15dJ/gqMjbY5iP1ty6NIqhoVux
 MZtFQuS83hBFpM8C9DTwSbdcDxbJwKMjmxxKS8ITD/PnDYTioc+pSfR4K784EkerCEKJ
 RS4EVunt4mpnMsglRTSk1tSrGAaJj6LpKusKxPNYXXPASFtUXBS8XcI6v8gorC0b2T7v
 8suWKGVF4DChWXc3TRtj6Hl0aF+KBDWj2QZ8LMCIGcdiO8SlqeWNLeBMPPF7GU1NGplK
 aNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973494; x=1757578294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYe2srEOzuPavOLB2dyXu3UjjKzRy0khJhV96Tf8OLU=;
 b=IYOPJpMOKa8iYMMQa18efs8ima6iR6DAJpiIDdUt6acIrPgUD7G1DjxpX+B2smZdhw
 b9kc0R21tPmULbb+IPGSSJqjZlrvxRpXlo5ZIz50gq4Va7FjHr7davKhRySsoS3EqFdP
 w/OjyRr0FAka8BHPGqnus1mCIqQjoEyb5si9w06EUqjaqkr5HQhNXOCC0CiKhFWOUTUy
 o22Eut2JQToh9aIzISQKwCycyU+Vn01hiBZ6RVoL2muOEl+FEOv5/NyYEWydY6eRXKD1
 sXylFb9N0D5Y+xeihJSRW0s8ImKgt6xkEdEvF7i/BiDk9PiTiVJZ/KZxGAr9q37ZC5NO
 Z41A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM+fCsRQSxnB0L+Imiz2ZxUPKKwPuuNQztI0dmOt11N2D7P5LYdt7qKhsUQfwOC/ZqBo7MRgxKYA==@nongnu.org
X-Gm-Message-State: AOJu0YwxmHEt/EtYyu1QmvBMij8Tta2/oBRW6Nyq3hiAlPSD9XpEEDqD
 cDJd36nGJTeZ8YOr5oU4fiEF7/B8PgbW55jFhs4xf+OiyLZO2UNvnWwwjffrjcWwqZQ=
X-Gm-Gg: ASbGncvUpeMbmAxfMQPlHtb8m9hBZ0HPAellmu6nHNJSrIIWfl3o7egmIjH+EhMBBfR
 4vjEqHdgvXdJXgdZY8/6os5u8nJtzbNi9alPGyxoS9mXu/Hf7XDicCGMjJwfW6dAr1vIcOIhDXO
 joULAjtnAPAiE8uBIgeNE/L+k/3Xum565mFw2cTF30s6AZMytVyttgwneP/tMCULPRn5Nqc/bE4
 z26OFn6OGw/Z2jVctZ25kH09DNTfmDoXBW3/Xw4ZuAjNX511LGXJWgHFaZWQ7yF003+uqoiJLMV
 8eogbO7fEgntOT3ic3c3KOOHQ27h/y1liV65kiJbSgUt5O/OJ60w2wAKNm0jOGnDSf/Ab1hJuJN
 eRiB30RQ8RNcl9cTVHS0/SEFtxb3mX2jseA==
X-Google-Smtp-Source: AGHT+IEQsFUBsaFrkwGW9jzRf8OvRd90g2Obpi+/sY5uxUqYg/0NjyiJQx54EndT6c+2bdrD2EtFQA==
X-Received: by 2002:a17:907:3d09:b0:af9:eace:8a52 with SMTP id
 a640c23a62f3a-b01d978f76fmr1732940466b.50.1756973494191; 
 Thu, 04 Sep 2025 01:11:34 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b02152cc1b8sm1264072766b.36.2025.09.04.01.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 807A05F92E;
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
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 003/281] scripts/minikconf.py: s/Error/KconfigParserError
Date: Thu,  4 Sep 2025 09:06:37 +0100
Message-ID: <20250904081128.1942269-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Error is not defined in this script, raise KconfigParserError instead.

Fixes: 82f5181777ebe04b550fd94a1d04c49dd3f012dc ("kconfig: introduce kconfig files")
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Link: https://lore.kernel.org/r/20250820-scripts-minikconf-fixes-v1-2-252041a9125e@linaro.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/minikconf.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index 2a4694fb6a3..4de5aeed11a 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -363,7 +363,9 @@ def parse_file(self, fp):
 
     def do_assignment(self, var, val):
         if not var.startswith("CONFIG_"):
-            raise Error('assigned variable should start with CONFIG_')
+            raise KconfigParserError(
+                self, "assigned variable should start with CONFIG_"
+            )
         var = self.data.do_var(var[7:])
         self.data.do_assignment(var, val)
 
-- 
2.47.2


