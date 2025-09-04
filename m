Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E5CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu59z-0006lF-FM; Thu, 04 Sep 2025 04:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55J-0006k4-Lq
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:49 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54e-0004FB-7I
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:44 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b02c719a117so132895466b.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973523; x=1757578323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXt3diCSsuzNh/VyOnThLYez8MNmwqahq33wrVvYaCc=;
 b=PjRmmSoOPJ7lUOCK8iz9jbK4VS/cblILH0GL9ZylrPH3vF9yNzFqB7B8BA2tVj7Qvl
 P7xbHEIXiLVNo0gIWLOobgIJeaOpVnSUL8IVqghZr49UTvweI778realm9mOKSdA3d5k
 fZ/Z9snge1GvqlsNigUsL+MLNtyfz6WqqAX/8ykRjUmamfAlL4BtB7m8VWnZzY7MVZby
 Wfn9Q1ZX7socdOfcvTuwsfwiyl/7/xXsi0KhOpskWSqeqlYEIoPctX8YICZ8zJJ9Flnu
 mDgoS8fPmUV8gMtLa2UEmm+LrfcNulNahGsCPYvW4B3xwa/8xHaQhzw0rVxFkF08xAJa
 hmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973523; x=1757578323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXt3diCSsuzNh/VyOnThLYez8MNmwqahq33wrVvYaCc=;
 b=ZtGh9lokaMVPyTsETOeJ0uVYZ3y5dlLIOsW2xQoemO9PIt5DwDiL+tnOKbHidCNdAE
 h9Bqkmo/9sxLIJ4wmglnpOw914TlcU2zKzEyYaSLAO+JnFcd0tYEtrg4vNIAyVVLBOuO
 7nFQf+lX4iLMAHYXIqSAIdR80Glm63UbYT67s0hbimmCcSNqBs6cSedMg6hHG22l2Iei
 GyDWTVjAgYq9pSco4Cg/bsN7QPj+kUkzHo7n5M4dQ54YKAPw7uuj6wPyzS5H4KlnCNJn
 hLleePHwfSoyliYZMahr3evBBlcUgZnAm0wcCNgm40r7Lq3LtEM0QhYfYA0FDrqrCzbO
 GPlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhqKpPM/Z8KSVx2rChObS0T4KTvzGfQf3AL5QdEfe2zdw0bDMilzBK3PtWPR9OpcP2su3fx4Lwmg==@nongnu.org
X-Gm-Message-State: AOJu0YzumZrI/5Lp1epnSIdrTXFdEW9f8WeQ5Z6Ubc/tJxBuuPC6PLid
 wACVXX0vkf75F8q2AxbHtaMgg+OWIOdXERA72vzW8G7nheAC3nkCdX6KplyuVsQXb6I=
X-Gm-Gg: ASbGncvJFKsiJ9Bue6NEhg5zM3+KJVYZDvqfRPiR4DYtYcBw6znBzMki3QiHWMEyEnF
 V1dHGHTknz/urTTSjbe6LhcE8QBsxCheB4mDhc4XEBdeqtsyoNFj/7udYO6o1HXU8mCF/9fjvDG
 c+r/mvgl+vFJdMW5wpTSf7KzIphxAvW3wYeq4jISqZmQC1ofuhpSfrLmw1vQy09IdXrAtr4KbnG
 pGEWXnBs2VuJ6Qw7tNFI1ZS3TJrUu7XgzBkYnv6m+6H7FnpemN7pXFkKcTA50CjBrVyVB2g0cxJ
 XdkMdxGSaHT8A9Q07j/t6R+vqM0bLtp8sjlI4LvIeqEwI69+aNnZTUMXyVs9Tp+wjxuT21GIccO
 Asgc46jdjleguMjX1AslOnuyxa4nP3tS3iQ==
X-Google-Smtp-Source: AGHT+IEHOM1sp3Ru1NOMvYbJ51bjR67YJYy53JNtyxJ5vTGZgMdkiJNntJ7L7ebKp9Qdh6X5/23G7Q==
X-Received: by 2002:a17:907:7205:b0:b04:250d:ee7 with SMTP id
 a640c23a62f3a-b04250d448amr1532567166b.31.1756973514479; 
 Thu, 04 Sep 2025 01:11:54 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04190700a4sm1095058566b.63.2025.09.04.01.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 324556017C;
 Thu, 04 Sep 2025 09:11:33 +0100 (BST)
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
Subject: [PATCH v2 041/281] kvm/kvm-all: make kvm_park/unpark_vcpu local to
 kvm-all.c
Date: Thu,  4 Sep 2025 09:07:15 +0100
Message-ID: <20250904081128.1942269-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

From: Ani Sinha <anisinha@redhat.com>

kvm_park_vcpu() and kvm_unpark_vcpu() is only used in kvm-all.c. Declare it
static, remove it from common header file and make it local to kvm-all.c

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Link: https://lore.kernel.org/r/20250815065445.8978-1-anisinha@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/system/kvm.h | 17 -----------------
 accel/kvm/kvm-all.c  |  4 ++--
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 3c7d3147366..4fc09e38910 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -317,23 +317,6 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test);
  */
 bool kvm_device_supported(int vmfd, uint64_t type);
 
-/**
- * kvm_park_vcpu - Park QEMU KVM vCPU context
- * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be parked.
- *
- * @returns: none
- */
-void kvm_park_vcpu(CPUState *cpu);
-
-/**
- * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
- * @s: KVM State
- * @vcpu_id: Architecture vCPU ID of the parked vCPU
- *
- * @returns: KVM fd
- */
-int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
-
 /**
  * kvm_create_and_park_vcpu - Create and park a KVM vCPU
  * @cpu: QOM CPUState object for which KVM vCPU has to be created and parked.
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 890d5ea9f86..f36dfe33492 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -414,7 +414,7 @@ err:
     return ret;
 }
 
-void kvm_park_vcpu(CPUState *cpu)
+static void kvm_park_vcpu(CPUState *cpu)
 {
     struct KVMParkedVcpu *vcpu;
 
@@ -426,7 +426,7 @@ void kvm_park_vcpu(CPUState *cpu)
     QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
 }
 
-int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
+static int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
 {
     struct KVMParkedVcpu *cpu;
     int kvm_fd = -ENOENT;
-- 
2.47.2


