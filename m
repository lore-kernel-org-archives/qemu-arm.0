Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5074222ejc;
        Thu, 31 Aug 2023 06:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHPQWXX1ovUYx/ApnLqGo4TWZmy0Ka01F2N8AAFXArLjkc5VozeBzPwYh8hO6FiaZjBmA
X-Received: by 2002:a05:6214:518e:b0:651:6c05:2c91 with SMTP id kl14-20020a056214518e00b006516c052c91mr2778047qvb.25.1693486909582;
        Thu, 31 Aug 2023 06:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486909; cv=none;
        d=google.com; s=arc-20160816;
        b=pIk+yQo2eUfifWrS7AFYkgZffTcNNpCheWUAb7jQmzUK95WV90mNBibOCMSjAaf4Cr
         r3BS8JZhe2umhQnG8jly28seaP/DhD6AVZxLqqUfVnSHDSEBYDoI954LLPBYyM3mRcdi
         9EXVJFn/lYJGusJm7AlyT1nz2Uplqc1lse+8uUgDZ41ymhVL6+YXBXCV8opeJlyZScn4
         Fcr3/+I5awZmKLyeNx9u3uNRVPjbWJVxCxHJjDYPYcXA5EpozJsRGzv2GXBwHmba6YO6
         gC1ScEZL+lYbgJH1S7NrB6U5PDYjYSpCMMvfo33DVWpoqnNIrqXZRFGaB0oJ4jA9jSon
         Zqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OEBOMsh/2YnVXzixxLDyYqxUdUQOvziVNTmEZMBX0zo=;
        fh=+j9mkJWFeBlg3tgjNCfKQ2d5Q02bvruS5zHcYwno2d8=;
        b=uR1dE8p+0dkvL4zvZFZ7ND3jIWixVIH1jGIxofrCQIMcZ/skaRpKLyzLEhdpARh2u2
         Clbqcne5VUYP43BPILli6nvUINvL3eJPVELhiOGJZsD6I8QPnB7lkGxQOS+NAe9PE/Bq
         mBrj5pdARoKiBG90ZIN96A4B3gKnJVVpsmB2KzGL09G0PZiUnsm1IrhF+nfLsieNveol
         p9sVAgrasUEriaKZSMrY54YdPYFIweP/0Q+IAnxXrzOg3bSwnzqyU6JAU7IZbnBdgAbt
         nglk6lISpHOHobQMXIAckyOuKQ4ajtZjWBAkCAG9HD2iv9bB34UxFX+kFq6QODRg7qlK
         otZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7gXQi51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a0c9d06000000b0064f49d13ff1si821864qvf.92.2023.08.31.06.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7gXQi51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhI4-00007E-Uh; Thu, 31 Aug 2023 09:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFB-0002xf-Ok
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhF2-0005L7-6s
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31c5c06e8bbso634514f8f.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486661; x=1694091461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEBOMsh/2YnVXzixxLDyYqxUdUQOvziVNTmEZMBX0zo=;
 b=q7gXQi51bkl/faqbG5DeWykzANSO+dP0F+d7XfJxrzOdVly4o1roQGyTdru02vHDEP
 2Epwcn2T6N95iwOKH96OVRpXswy4bkE+G7x9dKR1LkymX6UTaPqp0sEAJhh2s3AmlBZ+
 L4L6ubkQ1UwsC50F0h/nQzi6i61GbkJxr+crpx6Uji96IGlWb921sXTeMFnjyj9lyH/h
 aXzcbg8QH4MFhQpy2zirkHME6QpW6AMAoEVcYcHnYeBCYJsPblVJaFD6Ji7gqj6c7od7
 m7f9yGIVdrNA3Ue4FN6n/cY6xyiZWj8872G/Q5BQqc1QWq1URvgylGURo1BwwNKW5V3F
 A71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486661; x=1694091461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEBOMsh/2YnVXzixxLDyYqxUdUQOvziVNTmEZMBX0zo=;
 b=HjNczSAML1d72HVjEvVdvIXBD1val25J8BAQz4HjZjxvNUKI1SUbTnOZP04486dnAG
 uI71X+JXIMMHgLMD73Gb54PvBZaCQb97JaNfF2GZUgW05PFsdq7H+/I0DqJ1g8pvQWtC
 NmPR5SprlnJlYjQfqPhv48M/Ehzhrm/B9orCbOrBHCQjSMI3reCg/H5Hv2le4P1JdwuY
 lLtK2fiXLvRcXqC5yLmptlxFIpUSDfAdXBoHyPqByinY2Kph8cY+3x/NO8WPnvj4vK2B
 H9xKSk8Dsb6QW6Jexm8wsjpTBexhi6nowyI+ggvFcG5e76larZT+aSGF971mdXrOvv5P
 NGtQ==
X-Gm-Message-State: AOJu0YzsX2/j8OTBabSDz4OpSBktUlnWs7dYq2lTJAub4lsIEWbgp2fh
 BEBH9TJMCf0typERXjSaIBS33OwycUFm+vKeos4=
X-Received: by 2002:adf:e6ce:0:b0:319:74d5:a2d7 with SMTP id
 y14-20020adfe6ce000000b0031974d5a2d7mr4511339wrm.32.1693486661117; 
 Thu, 31 Aug 2023 05:57:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adff4d2000000b003141e629cb6sm2158792wrp.101.2023.08.31.05.57.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 09/41] target/riscv/pmu: Restrict 'qemu/log.h' include to source
Date: Thu, 31 Aug 2023 14:56:11 +0200
Message-ID: <20230831125646.67855-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: MOSt6o5xBWa3

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-3-philmd@linaro.org>
---
 target/riscv/pmu.h | 1 -
 target/riscv/pmu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 0c819ca983..d2be06a133 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index db06b3882f..36f6307d28 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
-- 
2.41.0

