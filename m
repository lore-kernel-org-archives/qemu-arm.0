Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15199CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu54N-0005zz-3h; Thu, 04 Sep 2025 04:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54I-0005vI-GE
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu549-0003wE-Md
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:11:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0475ce7f41so144430966b.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973492; x=1757578292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNEGVA0a3lSomvk/RYtnyV9U8MhQRFndjMqEzv6fEMo=;
 b=rKqRc3MpMeZFXoPdDUyr9TMAHnqSO2boCtLoJlfBNK4ciEPxpxkBUw1OcIBQHleV70
 AZ7x3ZeFHwU9EUtxSbQRc4NwK/7uIcVL7qYTnNfdaRnpD4dy9fRD83IAo2MMSV7emPJz
 5M5xeek/TbnCNrTZJvOuvPsTF5Cjy4hAqEcxsv8a+Ayd5MJLwb9MtQWE4tFI+L1p7N14
 yRkdx3g0K7ToE258ysXDxU4Oq9AJ76YBIvgHCSO4DQAkAoF5zgf6jFJoH5Gcnc2jFng5
 N9pqsnPmqTOPb5UywFwiETlmPlcb4Mb0OBEryq17m6ZG1ToQGVgk5LahKEN6+wwZgM3z
 rZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973492; x=1757578292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNEGVA0a3lSomvk/RYtnyV9U8MhQRFndjMqEzv6fEMo=;
 b=HVSP/b6kN2+Qt3RcksR3IywLbBTA1O+sizM+8EtOoRg5GoryLYMd1NUmwxq7jlKs6t
 ceh9XaNqZiCmcQ8iKlBDgUl3yeksoAzMq3bb7o9z5c2a/3Yq43GCA8J560ri+CF7IbDv
 YocdwgzfuQeoZKNfRUyBHV4KkHyHRNKmlDVbKpcyZFupiIaG+b10ihtCGHwxm274TmZJ
 al3CWwffxtHg1JZLbXVHyAiGE8RxMqvj2St4km/njqd7N/ZRFM80xqdPCPSBQyVN2Yty
 DPvZ5cVkUvFdoi4L5KfGuMK8Ioip6q51HrGZUerAF3EaZlYXphZsyBhEZdcaiiNwzQWA
 uO4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyPC1F849AK8EpLMoKVclJZyDpaRUP4+dARMlBUpvykq6Pyjs/1PuMPYkdi1dEq+WdqGrkKctO1w==@nongnu.org
X-Gm-Message-State: AOJu0YwNaPYq6NZNV3pH/K7iiXwRPwe38TXhHHnI6IGlbZrGuafi5MEe
 9z33q6EaoF8ipp+hWcX5r6SNu7dNQ2+6pAORKZCVE91GzCTzzxHyLR1oyPRWhPPV/k8=
X-Gm-Gg: ASbGncs3fO65etg1vjf/2cdXYSXeD7eUtv/4u8/brv57d391l+sDP8LymcfrU9RjtEN
 mOlurEpXdZAAr4mHV90/JD5/ZFP3wfSCXDKdFU/OyAS7xTWrO7rs0XhVAWnvyM0Tna9NNf+FBrn
 ONwxRkso/UuFT3P0YZoQTZ+exFKaTnbamKE9ej5HtiJ2BpKvbfc21G21x7q/ZHdC13ekKdFJMfK
 TXK37hEes0EtpdvILPDxY9RuCphkiU/l9shP7JMlEHSAWgFPfBmATH/lzneiO7yvmKI3o2JFfzv
 AwnyOt618yJRu3NlHBJtQJ260JZrvVF231sV8vjXcfSvlyWOWhDfYMrSJiCvbNuBTtC9Wlg/h36
 TC3QUTtxwXTwEg9gzZPU5XD52NJ0D0c6gHQ==
X-Google-Smtp-Source: AGHT+IFdx3300pXgTQYVfyijukm5mevr/UA8RYXsWS4tvgREr1LW2h9o1kllZwMwMLv7al4YIwPuEg==
X-Received: by 2002:a17:906:f59f:b0:b04:72bd:2080 with SMTP id
 a640c23a62f3a-b0472bd2168mr346031866b.60.1756973491624; 
 Thu, 04 Sep 2025 01:11:31 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0426516668sm972088866b.46.2025.09.04.01.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4CE8D5F900;
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
 Xin Wang <wangxinxin.wang@huawei.com>
Subject: [PATCH v2 001/281] target/i386: Add support for save/load of
 exception error code
Date: Thu,  4 Sep 2025 09:06:35 +0100
Message-ID: <20250904081128.1942269-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

From: Xin Wang <wangxinxin.wang@huawei.com>

For now, qemu save/load CPU exception info(such as exception_nr and
has_error_code), while the exception error_code is ignored. This will
cause the dest hypervisor reinject a vCPU exception with error_code(0),
potentially causing a guest kernel panic.

For instance, if src VM stopped with an user-mode write #PF (error_code 6),
the dest hypervisor will reinject an #PF with error_code(0) when vCPU resume,
then guest kernel panic as:
  BUG: unable to handle page fault for address: 00007f80319cb010
  #PF: supervisor read access in user mode
  #PF: error_code(0x0000) - not-present page
  RIP: 0033:0x40115d

To fix it, support save/load exception error_code.

Signed-off-by: Xin Wang <wangxinxin.wang@huawei.com>
Link: https://lore.kernel.org/r/20250819145834.3998-1-wangxinxin.wang@huawei.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/machine.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index dd2dac1d443..45b7cea80aa 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -462,6 +462,24 @@ static const VMStateDescription vmstate_exception_info = {
     }
 };
 
+static bool cpu_errcode_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+
+    return cpu->env.has_error_code != 0;
+}
+
+static const VMStateDescription vmstate_error_code = {
+    .name = "cpu/error_code",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_errcode_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT32(env.error_code, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 /* Poll control MSR enabled by default */
 static bool poll_control_msr_needed(void *opaque)
 {
@@ -1746,6 +1764,7 @@ const VMStateDescription vmstate_x86_cpu = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_exception_info,
+        &vmstate_error_code,
         &vmstate_async_pf_msr,
         &vmstate_async_pf_int_msr,
         &vmstate_pv_eoi_msr,
-- 
2.47.2


