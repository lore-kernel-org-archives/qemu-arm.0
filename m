Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp557829njb;
        Fri, 4 Oct 2024 09:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGM8X4yzH2oOCZq8d712X/qSxvdOUrMNmVTvsfYryeYp9IwOufwStqnmuMID+b3ngGkNHXNfJGz62VwA==@linaro.org
X-Google-Smtp-Source: AGHT+IE2WnuycP2s+S/WKRt+J5AgLOJkgmTBnQcqNPGg5gYjAJ3UyULXre62ySXpgiQEaFiyuevU
X-Received: by 2002:a05:620a:25c7:b0:7a9:db7d:11f5 with SMTP id af79cd13be357-7ae6f4463dfmr582427685a.25.1728059006705;
        Fri, 04 Oct 2024 09:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728059006; cv=none;
        d=google.com; s=arc-20240605;
        b=NsXau0W8+FNa3qtYZC0QBsoqKG0esvtPOQTeDVsxRpV2jCxr8raAxDZLdBt/3kxncl
         JkShgzhhcy9gIGdk4WSflzBsmX2Tw+tcrLsbLRPIuXWYNn3YdlGr245AlA3y3CNjmH+c
         Al2m0fE8Jqdcwe2aPuaLl4FIuttp+cPFeTVO+qVHCXc2v9IAJtHdO/yrkrXc334+LIA4
         LOWZeZITeDbobh4yuGScmAgzApodtv1sHmLc84x0ExgS4byQFVt0LKFWeuNvbNoCJX+A
         bJATUI8TDLEXVoRg+idGwUKjpVW4MS+zub68CubXsq3mP0vBa+E6tPGXLHKQfDedUO/t
         J2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8EXxbN9xNIe/fch86Xk2ysVTGoSQLunGFBZDl5pFX4s=;
        fh=C9SoAe1S59kFknvNKiu8nedDlI9JzrcR9j+Es/BlAws=;
        b=MYO7C3GKJs+QgaDUykypa8403yj8sNtf5hAvIhUWwzoM82z99RFAkfs0ZFpUNFp51x
         IOrymiMBnvbgXCyW1hrZkMvC/TpgxlB6td8JRfVn/9omCyVuh2j7IkVIEYVLWiWX6BK/
         SRv700hKODSEEquy1rdtEFvikBzhWb7A2mqEcHfO9Y+O34nVkVygJ7Fq63rrKCV2r++K
         l0pyNHnv/mh9gT38BkeU++AkSdygb1y4Ex2+UJJ0nxOAtQH0oFiP1CyZSEl/TGTua0RU
         Q2sXzr3W7dcMrJ3KXpdp9Wvf/w2sVIywaTt5869xlFs8231JSK+0ESNJvEHje6dmchjz
         OkLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zABwxirR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b74f530si402981885a.55.2024.10.04.09.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zABwxirR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swl5P-0006wB-BQ; Fri, 04 Oct 2024 12:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl5N-0006i6-2K
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:23:21 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl5L-0004TF-9K
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:23:20 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2facf481587so22059851fa.1
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728058998; x=1728663798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8EXxbN9xNIe/fch86Xk2ysVTGoSQLunGFBZDl5pFX4s=;
 b=zABwxirR9zGdwUzNB/qmkeoWOcE3czRgqCE2MIUHprD3ravoGKBCjx5giPQ7RvDxH/
 +7IKAzXLZi9pJ16MT3lXH0KcsqZmApWb6U/CdnCiZ9Den5F9HK+MwtGAY1YQxAlUK4H1
 yt4UTmbdT4JNXlIZHHaIJquoiwaSg+yiHTDEh9Gy+P3ypCnYKA5aR7s98HvmNrz94UIw
 PUiz8xkyDZoFnnbBUpR4aq2/15PQOLmo5Ufhcr2zT5OMg4GYln1FPf2VDlpWYYwgsGl/
 aMTwBLPaexHCXtwpDRakeYteYFjU1oqV8G4H/2A+MuFOM9oJIxnHclxJ/L02DL1pZYKA
 Ul8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728058998; x=1728663798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EXxbN9xNIe/fch86Xk2ysVTGoSQLunGFBZDl5pFX4s=;
 b=GcreL01Rtj/i/MiydGQ2JE7lz271b8i1BYbR71wRLTenMYQNAF2H70LWdu9Ta21+rR
 P+Eo8SI011Pv1O86jtkmyKWEBGCcT4mKfopseG10qIMgXVPUdc9mLy7zrlFlb4T6Tpwv
 9UBMlBA+X9/37/T7/vipxC+di69TPM4giK5MdOpNBzhLA2Qm2hmVX5pRJQjHjdXMruRf
 RG9IvoxU2GQtgIiAaTtD0QzDDvnmolvXnlcNnXI9PSyHGGSZWgp4rBHEjtBL0pznI6Uq
 veqNxBHDXbFN2U///KRFXklMxOeki0/5zqt6w833AAZ62qu1HWHMBwzrJZBcV1lBvECI
 GB5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOGPBV/njolfbyPsdtRgyt+1mKU5lh6pEtCxC021U2+hHUAQRYIbJ59j4M9um9AEr8+KRX86BgRw==@nongnu.org
X-Gm-Message-State: AOJu0YxsTe6a2tD5X4+7Z099EmVoQpjF2SSyvGCRNSsfyTJrFBd3+Uas
 WPVABSmRPMPBPTulFUAtm/pyGYXLmmwLoEkA/CcQ2c7wwv2KlEbaAEbn8FlVTkgDEX28BUCpCH2
 0rulPfA==
X-Received: by 2002:a05:6512:33d0:b0:533:cf5a:eb32 with SMTP id
 2adb3069b0e04-539ab8741c0mr2171775e87.19.1728058997637; 
 Fri, 04 Oct 2024 09:23:17 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.208])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82a4f83sm458713e87.236.2024.10.04.09.23.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:23:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/8] target/mips: Implement CPUClass::is_big_endian
Date: Fri,  4 Oct 2024 13:21:16 -0300
Message-ID: <20241004162118.84570-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004162118.84570-1-philmd@linaro.org>
References: <20241004162118.84570-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pdbB4GgBVg6P

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 89655b1900f..ad70ad802a7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -132,6 +132,11 @@ static vaddr mips_cpu_get_pc(CPUState *cs)
     return cpu->env.active_tc.PC;
 }
 
+static bool mips_cpu_is_big_endian(CPUState *cs)
+{
+    return mips_env_is_bigendian(cpu_env(cs));
+}
+
 static bool mips_cpu_has_work(CPUState *cs)
 {
     CPUMIPSState *env = cpu_env(cs);
@@ -577,6 +582,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
+    cc->is_big_endian = mips_cpu_is_big_endian;
     cc->has_work = mips_cpu_has_work;
     cc->mmu_index = mips_cpu_mmu_index;
     cc->dump_state = mips_cpu_dump_state;
-- 
2.45.2

