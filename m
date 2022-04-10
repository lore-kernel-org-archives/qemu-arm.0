Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp858578lfq;
        Sat, 9 Apr 2022 23:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuCskV8MXgyyjDxR+mksBwjOXdVsTvcwxlvn/NWMHkJAlSGJalGCtvfkvmGZ6m54YOnkM4
X-Received: by 2002:ac8:588c:0:b0:2e1:ee12:3473 with SMTP id t12-20020ac8588c000000b002e1ee123473mr22157675qta.455.1649570879353;
        Sat, 09 Apr 2022 23:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649570879; cv=none;
        d=google.com; s=arc-20160816;
        b=kYLXuYutqXW/3obZFd3qr+xkDy3mdrbVQC2TvnWCib/61lPaJu3RomWRI/3UH8U8OX
         dohE3fABwgfaxDH5aVB5F1aIAFHpa8s/PM32667bSeUlFzaQVIyBqiSGQm4UFy4N1acl
         BKE9R4SHVo+pl+APzx5oMx5KeX1YtnFf70/FDJArb4HFcxy+2VyWgoiEFOpwB2YU6+ca
         bzZrsF7mv77zvONYdzrwMo6YfpT5VWHYAxDmxJ3/lc+VIIWlwY3c7JSVbb6HT/319/Bn
         3rdYCzKsP4aTcdpCQsCZNidTB++V7si1kCIFXFcjgwWrRoQBpEhLNzPTKKKzOD0ASGbt
         RPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BroqQ5N0uu4nZwWtW7xJ22ciYDILNp0aXNIR5uju8Ao=;
        b=cBaJn3RmYZ5L8KTgBOLG1ZA/AFQZgTYUbujoAToRJ1HEc4DvfCsGlNfECUUX+kbFqb
         lZMOMySo2TdVvh47qOWUnrn+Bmh3Usxbv65IcNW/Kbgi3sEaPSRJqEt56iWr1QtXT5U6
         cIJhlmkJJSKuoIBxSAGAIRRoqryjwGJ97SlxwsBkleS/TjgaLBaxvd0rpzgIe5Ulk+lj
         klmONyfwTVwF5pItFFewzHDRzrehOwiwS/wrHt8zQntvFeL9NkGJj1eYkSi2UTYn2ZyT
         13GdXDq9KhUfvwUBK4FFKB7tvaT9YFFdzCp1Nm6+LfSk7Lvq0r8xGMzrO66VZ9FmQFqI
         x/EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uhto1k+d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a0562141d0a00b00443cfc49986si2800999qvd.81.2022.04.09.23.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 23:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uhto1k+d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndQju-0003vZ-SA
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 02:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZp-0001yK-Aq
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZn-0002zT-GE
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bx5so12272231pjb.3
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BroqQ5N0uu4nZwWtW7xJ22ciYDILNp0aXNIR5uju8Ao=;
 b=Uhto1k+dAOduyX7/+XOokKlwX1uZlDIdJNMeskp+/DoNbO8Hrv/cToki9dPW8M8mpl
 P7IAiGFBT6CoVNcB2vc25q6v/iQx4ntL10lmZTVqVobynJNoQfwrn+c7VpGj9YFOcf1H
 Gg6WmOqKKQNjAcZEGzHGXvm1bYif2J5upgwCKiMIQxXVw+wCcFPMc7SZ6Ac9vhsdK/aV
 dr4oaLEbB3xaFDqOXt65HI3rGnT1qHd5woW4UDzzaDZwVsYLx+7sRYjEo3mfZmDKprXv
 EJzoiCRxhtoSbmFWVEApDgIySS0Z8gkl7vs/J44Lgask6oyDkxQ3kJHd/WIf3JEr8VLA
 nQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BroqQ5N0uu4nZwWtW7xJ22ciYDILNp0aXNIR5uju8Ao=;
 b=Nx7JER1mb/0n7nkg7e4wYN9FLlTveMLAq9qzRpGz8ExfMa+Mz9b3i/vuN5PnZklx6Z
 uVzB/4SeaybEo1RRgt4GljsS2EDTFXXdZTMta83+fL3is+OfQR05vCjDkCcQMHqBuXOD
 yxAoKGaEL3KzFSLs6B+oJIR7mjyMMe8KP5LOaMJlvmoPOPhA1rQCnLSAwstlRrKnEluz
 OFy+FLuZa0ls6m91vc1VhNe+e/60BtMFgtGRtXSGH7WXcQcnJIvpOD04Sd8+9nvk4ECp
 ahGOimPnVW75Kkw5Na4V9Lu6ozw0cTKzCHj7B0C34j6odQJ2XpFIQVomhsw52WQK7gnD
 NSoQ==
X-Gm-Message-State: AOAM5301FsmDSDZmC2FUqSBVwEHtSb6V9RtiZwQaFhq/nhTnk+xc1I2M
 l/Tgwu6bm9rKO4RmUrJRA6jM2jxk3h8Clg==
X-Received: by 2002:a17:902:c403:b0:158:5831:4e0e with SMTP id
 k3-20020a170902c40300b0015858314e0emr986597plk.134.1649570250214; 
 Sat, 09 Apr 2022 22:57:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sat,  9 Apr 2022 22:57:22 -0700
Message-Id: <20220410055725.380246-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ybMXOEbM7Dv5

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ff08bd995..a0429538cc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -806,6 +806,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 2750cbebec..31ea5a90e0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -77,6 +77,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1

