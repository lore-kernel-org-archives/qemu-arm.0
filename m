Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0767CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5CX-00032Y-WD; Thu, 04 Sep 2025 04:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5B4-00015T-GM
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:18:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5B0-0008DO-HT
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:18:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso1099100a12.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973915; x=1757578715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ompVlJELO9ntgp7NqWovDalEEm5jaDFBaNVePh2Fg+k=;
 b=eW9K3v8io8Qp0VJjwJMvpXITvma13uUezW8RJ2t3cAysjITvV7XN4E/RO+ywxm1iD7
 nFS7f9uCkLT+AhyRVb0m5JgU+TT5YNgLwHZ23zOa5nvsROc6TQRnP5MPOxlE3BCTU0Cv
 7bPqcerd+4Tk1FiiAS7/PLeBZI7FlLPqhFNhL8GAl25wwgEjOAqiDR+jSbF5/73YHUxl
 XSj2gKOqQ1to9cwpBO6siqFDBPmSfTa0yghi1N2MkR1GBe7FdgbbPkl6zs/tS8A07XBV
 c72du88eJYvBolFROxb7ZHDClN5xWkXeeyTTsgJsD4ECWbIOi/s4wZWvMBMzAsceYMFe
 tmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973915; x=1757578715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ompVlJELO9ntgp7NqWovDalEEm5jaDFBaNVePh2Fg+k=;
 b=gQ4EfxFFLvOeY203I6PjJh+hjXs6tW0NnaSDuvQ7U3K5jOiHApB98leq7cJ0d8GuPQ
 wgIrDLNGlPRT4SHvUvDo/WhodI4FqSkoaCjpp4cyJTxWwrzJBd2WryZkQ8XcpxRXxT1r
 rTVszEo/otYsETuO4Qj8HCBktcxyjMs3L75kf3t3zg+H3rLKgcAbqXKbJnktNdDMJYyZ
 XKrMsqZ2HOgCB4042Y6XW/J8NebRkXCPk+Bnl2KuScmktdHp8AOiAScUSCi6pJFKsQOG
 SkqMMG0Gq4aCOFwbeqziG9vdV8ifrQjr5Wc3I3HX4QxUU4p+3CoxpxDNn0SkWKMrUnfG
 6TYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXLObO7q3guWroFqeTB15tdq3P4+IaFaLVR+rd97jEbAkpU8jyDVKlinGFhYDFJE3UZ156Tm+LHw==@nongnu.org
X-Gm-Message-State: AOJu0Yzh6RaJBu6mDumxa1tRQjMJQBHYu0R2UYJald1F2wfSiV3D7BSu
 e7Jnf2VNv6QaAhzqI/hX0PE5BwzhjJSo5g4COz0UrTN0jPMRu0MBuYKkhWKViqUxi10=
X-Gm-Gg: ASbGncv5JjiKgfTHJO4+ZrWuUgkqv7JIhD/ShbggAqgavkG2Gj57rZeAfrP3KY3Q5Vy
 aSIXWCYim5vQ2pWnVXYYs3Gmctg1cZjHGAMeE0J8p02qxIOD/kUo/9iBrhouXvoHo+e+kseZM6U
 rHlabAKRZHeSD1MXOMkTiFmj8LatLRCjHL3Vb+vqKc1f6h7j77lei3p4Cjt8dYFCBCf6fm8kfPB
 5pNrRwiK8ugbL796mpSK0ymmG8L7qM4GHTaq8KMexZ6uNRdbmJMwhacUyWcHXZKWpZGKGPPso1E
 kb+G1koldmxxneA5kS6lBnWm8r/JwsItkgeWqtXueWOSHqUSitS1zwzl5JHPVOsI22bLJVmEilY
 EzbqHA9FTiKBpW6xLeKkTjLk=
X-Google-Smtp-Source: AGHT+IFZkDBMggGT02sBn8sK3CI2krXMAfHWd9o96Wl2UGSNd3Kompj6OUnUXYhhonmmJrvSF7qRqQ==
X-Received: by 2002:a05:6402:23c2:b0:61d:25c9:47ce with SMTP id
 4fb4d7f45d1cf-61d269a124emr14686486a12.11.1756973914940; 
 Thu, 04 Sep 2025 01:18:34 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62069b79e1asm228201a12.26.2025.09.04.01.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:18:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 58E905F9D0;
 Thu, 04 Sep 2025 09:11:29 +0100 (BST)
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [PATCH v2 010/281] tests/functional/test_aarch64_virt_gpu: Skip test
 if EGL won't initialize
Date: Thu,  4 Sep 2025 09:06:44 +0100
Message-ID: <20250904081128.1942269-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

If you are using the Nvidia drivers and have installed new versions
of those packages but have not yet rebooted the host kernel,
attempting to use the egl-headless display will cause QEMU to fail to
start with

$ qemu-system-aarch64 -M virt -display egl-headless
qemu-system-aarch64: egl: eglInitialize failed: EGL_NOT_INITIALIZED
qemu-system-aarch64: egl: render node init failed

together with this complaint in the host kernel dmesg:

[7874777.555649] NVRM: API mismatch: the client has the version 535.247.01, but
                 NVRM: this kernel module has the version 535.230.02.  Please
                 NVRM: make sure that this kernel module and all NVIDIA driver
                 NVRM: components have the same version.

This isn't a problem with QEMU itself, so reporting this as a test
failure is misleading.  Instead skip the tests, as we already do for
various other kinds of "host system can't actually run the EGL
display" situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20250826123455.2856988-1-peter.maydell@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_aarch64_virt_gpu.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
index 38447278579..4e50887c3e9 100755
--- a/tests/functional/test_aarch64_virt_gpu.py
+++ b/tests/functional/test_aarch64_virt_gpu.py
@@ -76,6 +76,8 @@ def _launch_virt_gpu(self, gpu_device):
                 self.skipTest("egl-headless support is not available")
             elif "'type' does not accept value 'dbus'" in excp.output:
                 self.skipTest("dbus display support is not available")
+            elif "eglInitialize failed: EGL_NOT_INITIALIZED" in excp.output:
+                self.skipTest("EGL failed to initialize on this host")
             else:
                 self.log.info("unhandled launch failure: %s", excp.output)
                 raise excp
-- 
2.47.2


