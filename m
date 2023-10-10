Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp431ejr;
        Tue, 10 Oct 2023 02:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6e8sbUUMgpon675B/UptdENEjiDQhHO2L9I3Eqrt/Fhfoygcw7jqEZi10Rr3VOG62/Qi0
X-Received: by 2002:a5b:e8b:0:b0:d85:ae5c:527a with SMTP id z11-20020a5b0e8b000000b00d85ae5c527amr16316377ybr.10.1696930374637;
        Tue, 10 Oct 2023 02:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930374; cv=none;
        d=google.com; s=arc-20160816;
        b=sRwQmqhro4E3vZwHI1qFFY5MRVGjtWYu7WbMFQoOsBAE8CqkOb6UOopOm1+u0Wduw2
         nEm+itpTx2Ti1UYTSQKmGWq+6YS4jW0BHEQpr6OUMRaYJm1XEu/h6B02ffRtikoHF9Kc
         HBDJvyJhyXWUCkTIsiOk0Wg7VnEFUM6ZFK7GkUyBdCvrcV2vzxMk8oBsy0Fx9d0RN0+b
         cpPb3RhOHuTvKCjjXxXv23qt8a7BZTxbX+/TFvEWNSn+BhmCG/vO5NhJbau1pr2nHRKO
         O/ZarEgsju4/zke6jRMRKCqB9iSvvUX9WwbB8nKn3bKcgzBIJ5l1wx47nj4Dqit3Hj4e
         dNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7WiHkuSW70dwreiTW00ZFUbfeyH/7vFgJnStNjqec/s=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=mxR+EeoQMG+uL1fLvLUdD5BdHccYYX4FXjS2vbBBdQSyBWj5cpL/MXsiOJO3geSnSs
         ZpFa8T8Axa+ujYbqLo6e82zHmxlvIZCJ2RplHTnIA+91fC/UCIBewWngW2pjuddbb2XR
         mwr9ZOKVbM4RDVvOkfNWKrDPSGnL8nHJzf2LPFSzG+7b+cMwqs6fRCb/t9VE/iSyvwm9
         EXIhBul3XYbMVPJYYcxm0KSV0fvM++g2mx05FsIWqvlEa9S8su3cHlUzYzhPxjsahq83
         pZICFWfz9+0eeBY1/X2uHzOOfRPZ0VJ1VhGu4JrRLYN8Ls78u2Cc8I4jR4PzOVWoL0h4
         OV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qr7H9Mw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a0ce544000000b0065b21eef93asi7346106qvm.568.2023.10.10.02.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qr7H9Mw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq95i-0004Iw-AI; Tue, 10 Oct 2023 05:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq95B-0001fV-5Y
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:31:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq957-0008ON-6V
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:31:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso8277340a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930269; x=1697535069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WiHkuSW70dwreiTW00ZFUbfeyH/7vFgJnStNjqec/s=;
 b=Qr7H9Mw2UayX2EDnksa4AT4/hbEJVgjpTtAsgFWkCcpEh93+GaNp8FLpGYdq8Vcnwf
 9Dy99nguGqzXGl/I3Zz5bjjJb6+iS2J0th5aFpWT2h45KveVaGJzMoPoSgz1iiXmkA6j
 DmR79nNwex5LM+5LkqBujWwduAUUHDy39YAj1vKWrBo1y+qPWqqIhfwHkxPiRfAWdOEx
 nYnhFxgxrB6VVSYuOFO1Dt8nQhoSAhNPax/PKzmjPMIxLZZLYMjJsmiV3SJKoAWxX8TF
 shLaFQ758toImPWBqIlJPkExajWgi8R4MbUZpwsq9QOOkQdT92jy3lUppI/upNwyy8A5
 mSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930269; x=1697535069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WiHkuSW70dwreiTW00ZFUbfeyH/7vFgJnStNjqec/s=;
 b=IfzbG2zOjBOfqf6in3DEtuw/sEckyWukatvmxfLrQHPzqUL7MAswkDGS+LWPWcTSwr
 aW8q7v9XpDhRgD1duphFLUz0lV3Mh7NbFFcSGASPUb2D4j1DyCpqOOim3N8tuFMLR2C6
 /wnaBGWK2yjIiPrmhbCoG/nZ2NXNPUTZ5w1OGbR8wSxMedCv0a8bOWbraH8/V2Mn38SH
 K2K93TOQGKU5aep224nKH6U10WNdr1xeiZ6Y9+XFmRkg7XhNI7rYzB5Pba0lGVvUHb8w
 9uArEzdvLHq9AatzerBtT7Gn3E6tI9VcATbgcwMv7TMjF173vZvUORJTfj1fYf8CpCQX
 30bg==
X-Gm-Message-State: AOJu0YwkI3RYquEOd8vBdC41zlnTVCf9DgzUvrauH/9/02KRvjMY2dv4
 GFYqc94ze4Zs2SB8sqQ7zf7oww==
X-Received: by 2002:aa7:d1d9:0:b0:531:157d:ba2d with SMTP id
 g25-20020aa7d1d9000000b00531157dba2dmr13586266edp.4.1696930269123; 
 Tue, 10 Oct 2023 02:31:09 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 b11-20020aa7c90b000000b00536246d1eadsm7353953edt.41.2023.10.10.02.31.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:31:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 15/18] cpus: Open code OBJECT_DECLARE_TYPE() in
 OBJECT_DECLARE_CPU_TYPE()
Date: Tue, 10 Oct 2023 11:28:57 +0200
Message-ID: <20231010092901.99189-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WMaT47VPSVos

Since the OBJECT_DECLARE_CPU_TYPE() macro uses the abstract ArchCPU
type, when declaring multiple CPUs of the same ArchCPU type we get
an error related to the indirect G_DEFINE_AUTOPTR_CLEANUP_FUNC()
use within OBJECT_DECLARE_TYPE():

  target/mips/cpu-qom.h:31:1: error: redefinition of 'glib_autoptr_clear_ArchCPU'
  OBJECT_DECLARE_CPU_TYPE(MIPS64CPU, MIPSCPUClass, MIPS64_CPU)
  ^
  include/hw/core/cpu.h:82:5: note: expanded from macro 'OBJECT_DECLARE_CPU_TYPE'
      OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
      ^
  include/qom/object.h:237:5: note: expanded from macro 'OBJECT_DECLARE_TYPE'
      G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
      ^
  /usr/include/glib-2.0/glib/gmacros.h:1371:3: note: expanded from macro 'G_DEFINE_AUTOPTR_CLEANUP_FUNC'
    _GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS(TypeName, TypeName, func)
    ^
  /usr/include/glib-2.0/glib/gmacros.h:1354:36: note: expanded from macro '_GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS'
    static G_GNUC_UNUSED inline void _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) (TypeName *_ptr)                     \
                                     ^
  /usr/include/glib-2.0/glib/gmacros.h:1338:49: note: expanded from macro '_GLIB_AUTOPTR_CLEAR_FUNC_NAME'
  #define _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) glib_autoptr_clear_##TypeName
                                                  ^
  <scratch space>:54:1: note: expanded from here
  glib_autoptr_clear_ArchCPU
  ^
  target/mips/cpu-qom.h:30:1: note: previous definition is here
  OBJECT_DECLARE_CPU_TYPE(MIPS32CPU, MIPSCPUClass, MIPS32_CPU)
  ^

Avoid that problem by expanding the OBJECT_DECLARE_TYPE() macro
within OBJECT_DECLARE_CPU_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e02bc5980f..ab724fab3a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -79,7 +79,12 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
  */
 #define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
     typedef struct ArchCPU CpuInstanceType; \
-    OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
+    typedef struct CpuClassType CpuClassType; \
+    \
+    G_DEFINE_AUTOPTR_CLEANUP_FUNC(CpuInstanceType, object_unref) \
+    \
+    DECLARE_OBJ_CHECKERS(CpuInstanceType, CpuClassType, \
+                         CPU_MODULE_OBJ_NAME, TYPE_##CPU_MODULE_OBJ_NAME)
 
 typedef enum MMUAccessType {
     MMU_DATA_LOAD  = 0,
-- 
2.41.0

