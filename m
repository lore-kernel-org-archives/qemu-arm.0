Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A142DCA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5AL-0007LU-Nq; Thu, 04 Sep 2025 04:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55P-0006n4-7R
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:58 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54o-0004JW-J9
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:49 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so120646566b.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973531; x=1757578331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq4jK7JyS+/2cx/rmZ7dvVhdqmYk2tLcWfYVXq+eSkE=;
 b=zItefpo/H8CruWN5c8CQA1QWwGIWYtSwIvJMCEbxBZjsOXHYf3tb2bN+Hbk6KONN8F
 K2y2RrwcArH5TRmGj2zy1CJxZ3zXojKcqlrlPa63kGwyUN3g/IjfwtHopMCJ9y7xFEjt
 GuFr51fCgKrUqoJXIGsvMwokjFuVkOrC+YcYdTYL0NU1kkySsfF+mtCczOvSqtJrN4pW
 PzVq15bRTpV4TIwti1bCX995mjd8qXobmi1PHABBzspElC+wboX0y3faP8YXrAL6XEaX
 +XTnZwAdDijVYckBvbnYdX0SkmPboeN0jyNcganrx3DXrjxcJMsfRKtEfYlD06NOCVP2
 X2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973531; x=1757578331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq4jK7JyS+/2cx/rmZ7dvVhdqmYk2tLcWfYVXq+eSkE=;
 b=GkcNSVvAS9TN1j6LR595cJ5T22/bEtjxaYc2AyLZKQfU3cVj7OdDMoLIFJ1o+GdSyz
 OhPXtAb+xdi2tj2t0nZEz8EYGPq6xIPZNQkF88j9ABo9FUwy7xKoRtsPvpMbqRCRUABy
 Erx7q5us0rM+jICRADHziBYvfEXshdGde3JspMt/TK2tY1uApvznszRaY3c6RQK9OlyG
 7drXrjZkc4LUF9swbtlka9cKZE/QH3dVhh72fbwwIZAzQsZr1Y7H4EQ+qB/qn7ZY05ze
 0agxT3WsYws2Y9aS6u4zNjMv5+wVHqoy6vj2FI6ltaRdfFT074rJW+1R3414HqFcdQLV
 5flw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf3fXAhRl5Ih+8adkqCd26LfAcB3B4Cm9VMnV0r5GMutvI1EZiL+yKBMIlDvmjH46M+OmVhF4eXw==@nongnu.org
X-Gm-Message-State: AOJu0YwOV5Cq0y4NynXXeJHQUsAA2BGJf2u4geP1G2qLnLHJO/L65rwv
 IrW2RuW5zUJ2Zt7kjyoJXQUAzMdQkUxdQ5GjlfvDdZwSMzPs3bXus7+hiw3S5faB5JY=
X-Gm-Gg: ASbGncvTHnWw7ty5AH8TSJeJ8AW3IvagbjqQMRWmKWuD+2MARDNNBCPRx6S3e5AOQTG
 YTXQ4OE6qb4vl/v8lZ63st9FLn+VCvrtLCCj2BEznJysNaMoOXlL8as2RHQXU1I8EuKJy3D1SYc
 Mc0vM7ZGScKc0mJnWClFn0dGI9qOdLK+QufFpXYFBXgBWa8vDUNdIqIb9+b/Bxu4nkapmZEejby
 Q14Ii0z82+ZfvKdq8BviSDwnaKp9DMOYdj71N/MHRqcxD7gbeUtgP5643xAPSzcg6I26lamqKOi
 MuSNX98zmdYlbVsuLosYe3Vr+ciO16we6IuxE1DZ/CmWoaFhNhZrvaz0ZIqaBFduTayTUtnN7QO
 RnUYQ3a50uM/aVZ6zO5+SmH9/g6Y+nZHorw==
X-Google-Smtp-Source: AGHT+IHEegKTSH2dj+kErdLgT2BUz+XlYWzGAucQyCki9XsiZ7p70s0IRG0McB2d6SDRhqzr7Dm4CA==
X-Received: by 2002:a17:907:7241:b0:b04:38f2:9060 with SMTP id
 a640c23a62f3a-b0438f29593mr1159351166b.18.1756973530618; 
 Thu, 04 Sep 2025 01:12:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04129eccbfsm1161161766b.7.2025.09.04.01.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 102EA60957;
 Thu, 04 Sep 2025 09:11:37 +0100 (BST)
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
Subject: [PATCH v2 068/281] linux-user/hppa: Create get_elf_platform
Date: Thu,  4 Sep 2025 09:07:42 +0100
Message-ID: <20250904081128.1942269-69-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Move the string literal to a new function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_elf.h | 2 ++
 linux-user/elfload.c         | 2 +-
 linux-user/hppa/elfload.c    | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/target_elf.h b/linux-user/hppa/target_elf.h
index 5826ca2cd22..85be00584d8 100644
--- a/linux-user/hppa/target_elf.h
+++ b/linux-user/hppa/target_elf.h
@@ -8,4 +8,6 @@
 #ifndef HPPA_TARGET_ELF_H
 #define HPPA_TARGET_ELF_H
 
+#define HAVE_ELF_PLATFORM       1
+
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9d61feae301..83cb6731ec8 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1046,7 +1046,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_CLASS       ELFCLASS32
 #define ELF_ARCH        EM_PARISC
-#define ELF_PLATFORM    "PARISC"
+#define ELF_PLATFORM    get_elf_platform(thread_cpu)
 #define STACK_GROWS_DOWN 0
 #define STACK_ALIGNMENT  64
 
diff --git a/linux-user/hppa/elfload.c b/linux-user/hppa/elfload.c
index 2274fcbde43..9dd3fe092a8 100644
--- a/linux-user/hppa/elfload.c
+++ b/linux-user/hppa/elfload.c
@@ -9,3 +9,8 @@ const char *get_elf_cpu_model(uint32_t eflags)
 {
     return "hppa";
 }
+
+const char *get_elf_platform(CPUState *cs)
+{
+    return "PARISC";
+}
-- 
2.47.2


