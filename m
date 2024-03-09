Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369246ejc;
        Sat, 9 Mar 2024 11:27:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVY7dpleUA/wb5rQFjQw9fOUC3MjssL/7iek8D6H5INEns78yRplAQ+VmeLZPW51AkoGmcMTu0qd3dsR+xKrnKsi/5UuPwv
X-Google-Smtp-Source: AGHT+IExflOxl/tZnohHSbhZ6CFrrtx5N+itC7Sm26aeqRbun6tEicbmDmDyEhzrivbxKD2vRw3r
X-Received: by 2002:a05:622a:252:b0:42e:f451:6b21 with SMTP id c18-20020a05622a025200b0042ef4516b21mr3576871qtx.36.1710012463225;
        Sat, 09 Mar 2024 11:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012463; cv=none;
        d=google.com; s=arc-20160816;
        b=teeV5pOxwPL8eTshZNdyXFzLYiGrB0hip+ggvE1hs0Xyvg06kH5srpAKzHwcQbdeDR
         WuZ++Ka2HiI8IgA44YunXJ7mNdWgfpuwVrZ9KxBmhvWYOiXnmZfg0K4ju1SrWKx23i25
         7qP9gv+D/R3XQRU2vPmPqjf6kZVYlVl/y7lT+w9rlwT7/gNaa0enVUd4CkAkQLJaawjB
         gu0bppum/5O3mLbJNZZ1neX4HafMO1ZDuIVUfUnQ5eibVSpVHHxNhCWkTAxnnHnEdED4
         diyvBHBDqW4jIutGBCWkD3FRI3g46XQckCdY+K0D2I74Tlql4Oha/kRd9p3i500VtA8w
         A+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8wT84tp5Ct3Koz7/1+DQ3KNhe44GTMwlt4WEbo2CyY=;
        fh=MRpuvAMiIDngljO/1ktWIu7Kho7sXmLGHrYdpgFbLRA=;
        b=rPH5V0YDWC/mycK1qHEo4HyFmlYbBwn95gK8PM1vRFi+YJv5mt9tNsxkW7a8jNp+7w
         j2G4OR+lpVLuoOiLde+NZSVI35G7JZChtIoqvliJUNYiYs4ubVKi6KfoysXV9a9h/Fcp
         gNiOFdjMNXzTG8GyCLHbMl4sGI0lwFJ7tHoQnbr5c6gamrMAfVs6P26qRa7pMU5fSil9
         usOVITV+Vw11f7PiEUVU97Mn30GdJS4Hf+uKFQ/7QdvsEHOIkAuI2SeIoVjWmmqvXlIB
         hQmsKGV/3mh18jQl8cVBC6sRTIpwzywNl9bcvnAuFSVv/nxpSNrrPJCTZAdO0IuI7Be/
         reLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTAGvnU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05620a205500b0078853fadae0si2065539qka.144.2024.03.09.11.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTAGvnU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2Lk-0001HA-Hq; Sat, 09 Mar 2024 14:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KL-0007NQ-T5
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:54 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KJ-0003NW-BF
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:49 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso112896a12.2
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012345; x=1710617145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8wT84tp5Ct3Koz7/1+DQ3KNhe44GTMwlt4WEbo2CyY=;
 b=wTAGvnU7iv8knhIc9QM/CApgXDYdur06A/RIpA3EnwHXT30pnBduKbE8jxFdDLpkm8
 lKPVdEEVsYEY5Ffp4AlujOMQq4YC4QQVT/iuaCOPX0n8s2Ti8SjVReIMFqqifIiYakXn
 LxLwPTh9Rn6zVNmvt/pPFx4LX+iSOnj6XTHgkt60EiI6Jr5g7/4DB4ozzN3m3FWi0eNY
 5lkT1xHtK6mNb3K/1ZOdONNWx0ZKZj2VFrNjISN+UAmNAkMczQ5sIBou6XRYZT/BQFhU
 0PeDplfTF1n2shOSLdJkXfGgPI/MVDEjRkDCvUSB73NyfGw6ERPFJa0De+o32dxfJAM2
 rZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012345; x=1710617145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8wT84tp5Ct3Koz7/1+DQ3KNhe44GTMwlt4WEbo2CyY=;
 b=T9sqak3maeybx/l8eGdgvHUfpD/fOwH7jSNriT7gtd5LCGMShp//ZJiMu+z+F0vBfw
 GoojSQkpvZWtcUeHVpdZVQcsOdu9pQmmpbXFKSrklcMdC1kzhMHAKhf+AsiLZ3YduhNC
 dpcx/zs5Zd4baCjXtHHktPKfHWpvs0LP92wvm4gQh1v6m4/D28h0tKcVHWYzYry2r7rt
 2o5nChgAdk83k3tfW9H5Q+mNGWC0/1Se6WBJLfInKe3Xosmx/AstrHbmTcJ5TOu8v7ar
 b8+VTVCcFcRs2JHPpxZPyORj755VzhMEm1z9j+b5NVA8xj+9H0sUkKZoi++S7U2KPAsQ
 h9Ow==
X-Gm-Message-State: AOJu0YyC6inb2g9IMx8z8I5shx05j7ZId2AeKZ+/d2D92Onf3q1Qkcc8
 KaxMiXYypolXTnzEv8BnWj1CTWfhEOo/suzUJWOvFQ7DEjlrvLmPHEDvXAgACI9t5KGqquN50zd
 o
X-Received: by 2002:a50:ccd6:0:b0:566:d274:a41d with SMTP id
 b22-20020a50ccd6000000b00566d274a41dmr1546436edj.42.1710012345670; 
 Sat, 09 Mar 2024 11:25:45 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402359200b005648d0eebdbsm1143695edc.96.2024.03.09.11.25.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoling Song <xiaoling.song@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 35/43] tests/unit/test-smp-parse: Bump max_cpus to 4096
Date: Sat,  9 Mar 2024 20:22:02 +0100
Message-ID: <20240309192213.23420-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C5x2bI7ERE5m

From: Zhao Liu <zhao1.liu@intel.com>

The q35 machine is trying to support up to 4096 vCPUs [1], so it's
necessary to bump max_cpus in test-smp-parse to 4096 to cover the
topological needs of future machines.

[1]: https://lore.kernel.org/qemu-devel/20240228143351.3967-1-anisinha@redhat.com/

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Xiaoling Song <xiaoling.song@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-7-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 84e3422774..2eb9533bc5 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -20,8 +20,8 @@
 #define T true
 #define F false
 
-#define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
-#define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
+#define MIN_CPUS 1    /* set the min CPUs supported by the machine as 1 */
+#define MAX_CPUS 4096 /* set the max CPUs supported by the machine as 4096 */
 
 #define SMP_MACHINE_NAME "TEST-SMP"
 
@@ -333,13 +333,13 @@ static const struct SMPTestData data_generic_invalid[] = {
                         "by machine '" SMP_MACHINE_NAME "' is 2",
     }, {
         /*
-         * config: -smp 512
+         * config: -smp 4096
          * The test machine should tweak the supported max CPUs to
-         * 511 (MAX_CPUS - 1) for testing.
+         * 4095 (MAX_CPUS - 1) for testing.
          */
-        .config = SMP_CONFIG_GENERIC(T, MAX_CPUS, F, 0, F, 0, F, 0, F, 0),
-        .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
-                        "by machine '" SMP_MACHINE_NAME "' is 511",
+        .config = SMP_CONFIG_GENERIC(T, 4096, F, 0, F, 0, F, 0, F, 0),
+        .expect_error = "Invalid SMP CPUs 4096. The max CPUs supported "
+                        "by machine '" SMP_MACHINE_NAME "' is 4095",
     },
 };
 
-- 
2.41.0

