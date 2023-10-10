Received: by 2002:a17:906:fa85:b0:9b6:5cec:e61e with SMTP id lt5csp13672ejb;
        Tue, 10 Oct 2023 02:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2OAxk9sEZvoptuB2RX3YP1SObe0lb10QMOwkFv/06T5V2lPNWN9TqDRVLvy+/XdT6C37t
X-Received: by 2002:a05:620a:1092:b0:774:1c99:daf9 with SMTP id g18-20020a05620a109200b007741c99daf9mr17707896qkk.37.1696930278093;
        Tue, 10 Oct 2023 02:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930278; cv=none;
        d=google.com; s=arc-20160816;
        b=NC9EkPKKAXg1lt6rnoIqqY+2q9+ns9o5h6Kz+KCgCqcM/9lLsD5mqx5tq84NFNjiUS
         DMZOhR+PagX7Z2gWvIfocTU/ju0QQkSPI2qNsxuGQchpVjPNo9LYP+Cz0xq+X/RVJ8Vm
         Fp3CWFTUg1tn09K77zm8uSi04FYf9R8Gl0NBbczDFNxSubCsfowrJRSZi1EFWO6/lZFE
         QUKGlndIA2IKGp0MZYxTJjWbKO3dUSOYgrqy+IOKjOP0gaijVzXr0vdw9Kb4Wl7gP/R+
         QJZyoaVzOwVQm490MS41Okg1ua9V9YR8MlStBiYkIl0Ir97kLf7hcqV3Zp5Y67nyvCcc
         cNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1P+KsNPR279ILK4eCnAbqPNl6Wjvg7v5l/+zhWQrkdI=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=WylS80Ernu4eJMwHC0fVSumY4+XNJTUWIWkmCIjxyD3bIDI6kJQki5F0dID6FsEMVp
         DQa+bmntSw5dKc8oINHL06ej77k4MUzDS39nLaAiRP6gaHAoVmya3rvpuaD2k9F4W1me
         vFbAgpLfHV6Ibk85YZgOFokrfYZPoGoV6Kec+W9fjIXrOKixQ7oR549E+kCq/yPw88ge
         uU3GpRvqw7kCHD0+c0a/Ym8UyCW6lrXyZTQFSTQ+c/r508kB1gXfwJPsWsBdfKhIAiNF
         8fAOj182HeW0b6k7fJl8IRJq6XFpVTSQMJ5rl3TckJMILcBCKi3JiDs7BkTKVupwbtKR
         nVuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POVjFEG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd13-20020a05620a658d00b00767b0c9bcf0si7312711qkn.564.2023.10.10.02.31.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POVjFEG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq93d-0008H3-HC; Tue, 10 Oct 2023 05:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93Y-0008Cf-UT
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93U-0007gd-IV
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bdcade7fbso924848766b.1
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930170; x=1697534970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1P+KsNPR279ILK4eCnAbqPNl6Wjvg7v5l/+zhWQrkdI=;
 b=POVjFEG81Pu4SQoXX4bOJMsCHxlv9ivlP8xqs7iaMjwZtKZde9x3QQLWYfQg2uQJYz
 0dFPPeAvJF0GR2C7jZqvXC/3LmS6hgMsh10f3IUBj0L/cTgucjudxdPBh1z/9Mc0znf/
 w/LvbOKuhN4Q8CcnUaLmnfY4FD3jAzGdHbrxwD8QU04HOqkPMVd4Qe5o4DYrn7GenU5d
 BFcv8brMvXNmQCtkKsUCRft7rYvfvT4wJIHqODAsjPr6l7rK1922AXTf0+pvlLNxgE3p
 x+4uhX3L8P7Esdomwf4CMJt6VsL8oeHPzdDEMX7jbx+LYILo0Ddds0vyLgRk7OEueruL
 tB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930170; x=1697534970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1P+KsNPR279ILK4eCnAbqPNl6Wjvg7v5l/+zhWQrkdI=;
 b=id5XLDYo2dceJPaVZ261WI0fSeeyyyj70I2u/kzhH/tBBwcqEEEWKaMwtgIxqlkiaH
 p0QE2BoxOJwAxDKTYDz466mbhDX46d73OcJAGkwvPDZ9ArEUdTSjp++ka/u3NsiGzp9d
 pu5VTlC/loOt2QWC6qdF0P7hR2L00os5rzGPsobszkZRlyBsRU7D9jGNafkPL/zBUJfB
 JIiGmrJAQQM6HTfWHsqTO1tfyfr6rdvv/psMZ60DgVM2fb/EVBYNqikCUGvyCwvInqJP
 rCUXOhgOGfpTerq7vGhIkyAWbc+V46yvVAqre1xPF+IPQYIQCq7tRiat+quZxNYWOlJK
 HduA==
X-Gm-Message-State: AOJu0YxydS1w8AkD0D/ZLhNswyziw5PgAIqgJqITZ3k421gQIjvTjb8c
 0/+C5IREPcnpfJ5SCP66pcGXnQ==
X-Received: by 2002:a17:907:1dd6:b0:9ba:108b:a36c with SMTP id
 og22-20020a1709071dd600b009ba108ba36cmr6495664ejc.2.1696930170318; 
 Tue, 10 Oct 2023 02:29:30 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 s10-20020a170906354a00b0099bd1ce18fesm8321907eja.10.2023.10.10.02.29.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:29 -0700 (PDT)
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
Subject: [PATCH 03/18] target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:45 +0200
Message-ID: <20231010092901.99189-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: KJMKDcNpcly7

CPU_RESOLVING_TYPE is a per-target definition, and is
irrelevant for other targets. Move it to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu-qom.h | 1 -
 target/riscv/cpu.h     | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 04af50983e..8cb67b84a4 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -27,7 +27,6 @@
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
-#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
 
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef9cf21c0c..374b813f20 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -31,6 +31,8 @@
 #include "qapi/qapi-types-common.h"
 #include "cpu-qom.h"
 
+#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 /*
-- 
2.41.0

