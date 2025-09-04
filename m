Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EEACA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu54K-0005xP-Vh; Thu, 04 Sep 2025 04:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54J-0005vy-Gg
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:43 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54A-0003wW-Jc
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:43 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afeec747e60so137315666b.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973492; x=1757578292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfipyU6Vd8H7OBNmQiaCitsZISqNnzAeEnNiRJw+yKE=;
 b=dlQbIFG5/qKWxw/fXIBP8mzIIzb544P7rW/2ndztKyciy9bA6Hite74T1YOdGGazOf
 lY71eKPzjTDjUXgzLvdenW3iBluYz7RVqvmz+mbsXnsbjDG0mj09jFAd+3kPSxfLz9Bq
 mPx512whS7++sqXWbmyRCeiB2UoD5ueboLbAIySiedzStYgGqzPpLeb8xrP/QFu3jIw/
 kzeHSZAbbjp/x3CwrVZUUFS3U7S9Rv/xBZvE9ZUWpZWV0SJTcAM/7YW2RvyWxYqrHXv5
 yXjyBKk1rcZrSgArsVYKtlIqFXsb/Lnaf5TIn63KFpMmUhpnYCNnxD4p74RkOUOz4Phw
 Haeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973492; x=1757578292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfipyU6Vd8H7OBNmQiaCitsZISqNnzAeEnNiRJw+yKE=;
 b=cMfIWSua8O/dT6NirqwD3cHjScqEQ/GRC8SG+otcs4rHBm9R9UuhHMVku8G0Rq0Plw
 mgbtCTjGHYgb+16B3Rq9GtL7nhB2ynwBdla8kbinGqJ0F7CD/H46EGiTkOd8tffAsm3F
 o1rQuuKv4yVqziQ4csdfk28fOTSvHtC3Hubvh/ToS5FeWulXn144iwGjN+2VattJHy91
 grkoftPmgEdvaNWv4/tiBr1Igh+o4TOozGzB6zWhoRvMA089xCunPzRrdUOynwXqft0b
 p3H5bBCwl/Y8wPoNrjxkfGBtTKl5pFRSgm7bw7yCKn0n8QGMkWHoijRLH542A1I1OLCX
 IWoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr0VDNpvIH1467i0Urse2rzCHBu+n+u9RmAM9eQyn78pbbKbasrkz6zxYF3R16Hbz0bUZKvLDoaA==@nongnu.org
X-Gm-Message-State: AOJu0Yx4tee1/UTF0cfHgZaVM8H+nIEGDCEe5Sd/jHUf9+qWvxkaO7/2
 SCLNh6wW2E3tBlf+/hq/sm+kTR/npFV1iKFnRv7nJhXZGG7ewSqQVA2VsBd2B/b8muE=
X-Gm-Gg: ASbGnct/7rDSOk1ACtQwhPn1HKswlB9VrFyxf3Z4QZYhXq6EtCvVv+lupQGts8xFQpJ
 YN6ONGqbZsYS8UG2uXpNiC0+5xlm02FOywQpxu0a1egx5/7YFb85HhlrnVvlbDNqFTz62Fi6McF
 Ivz6oq2jcJpNjZdRsTzF5nhdaOi2Iuuy8+FkbQC7qWd6QIRkS5aFe3FdPW6jeCmp2GVMSjDt+g8
 IDJwXLMALkV3ykXKAMxsYqXKOEE56GkntLxpKNfz/Ye/4WRZ1qYP/o6iOkPFlUhzYc4jMh2TpC4
 WHqStBJgZjJYGr0Wn0phsCSRVv6XtQN3tIP31hPnilY4CMOWalQ2eKPl+8QsSq7kArr8DYzpGJD
 lY4yW4kJjPDrwp9grhkdd25lut9lhckQpAQ==
X-Google-Smtp-Source: AGHT+IFjczJHEVrliDdkN8vtWVVQWwK/1wnn/orDs4OuNOiIHgytoVYA6b0lvt1yt3hQ6A6pduudqw==
X-Received: by 2002:a17:907:1c19:b0:b04:522c:e113 with SMTP id
 a640c23a62f3a-b04522d1ce2mr811509666b.53.1756973492290; 
 Thu, 04 Sep 2025 01:11:32 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0466a962c4sm392430866b.71.2025.09.04.01.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 674E15F913;
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
Subject: [PATCH v2 002/281] scripts/minikconf.py: fix invalid attribute access
Date: Thu,  4 Sep 2025 09:06:36 +0100
Message-ID: <20250904081128.1942269-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Fix parse method to use `defconfig` global variable instead of the
non-existent KconfigParser class attribute

Fixes: f349474920d80838ecea3d421531fdb0660b8740 ("minikconfig: implement allnoconfig and defconfig modes")
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Link: https://lore.kernel.org/r/20250820-scripts-minikconf-fixes-v1-1-252041a9125e@linaro.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/minikconf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index 6f7f43b2918..2a4694fb6a3 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -340,7 +340,7 @@ class KconfigParser:
 
     @classmethod
     def parse(self, fp, mode=None):
-        data = KconfigData(mode or KconfigParser.defconfig)
+        data = KconfigData(mode or defconfig)
         parser = KconfigParser(data)
         parser.parse_file(fp)
         return data
-- 
2.47.2


