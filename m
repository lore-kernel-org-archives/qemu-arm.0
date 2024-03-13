Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2655297ejc;
        Wed, 13 Mar 2024 11:51:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYPpNkm7kW3w3PuxT51w+fC0gFi91rvcE9QPI8qMKEFIXzAeR/DpVKajKgQZ9JSEgUVd7rxVWyd7301YH2XzrxqdoZBwj7
X-Google-Smtp-Source: AGHT+IH9E/knDfvqRBfmSwt7E8GVf7lVE5ZQWMvcwGGsIC0cLz88v537vBfPPjOIGvzYXiqMaQtz
X-Received: by 2002:a25:b323:0:b0:dcc:8f97:9744 with SMTP id l35-20020a25b323000000b00dcc8f979744mr3349589ybj.43.1710355888982;
        Wed, 13 Mar 2024 11:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710355888; cv=none;
        d=google.com; s=arc-20160816;
        b=zekGYXargVYjRattyIPOb6EnPW3nfPhjibD9m7zfBjA2YI88tNh0UKLFW/2mcCcFAI
         QOy2uIIW8tBXZjA4GnRWVUB8SWV9pzEaqkFI/h/WvrGwCXkIItjR9KoA6xRuAPkF8MK0
         BOEY3ogBACwqnV4Nnd5+L34tU+gId23WyJV4HowNxKHcehyh1nxYtr2uNDqSmy/4BGvb
         Bd591ZFpXqW+eyEuKoKPE+dvpPhJ0lMH1WzlkzvMV8oemGR9BVxh93d+VuvUjG2XrlnJ
         9rF2La3e7oZedpr9Dud0l2/uL3KADpRBSyC/oA+sGW4Eui9d6zrC/ml7/hRwIO/8T5bc
         s3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cA2TT9vWbQLNZEplCJtFv+ktuA7SvmljLFLbMp9Tj4w=;
        fh=w8rLDJ3R0iDkpcUJthj7wPm4yYwtiIh1f3iib73z2gM=;
        b=aZUTNgLHgKGAxM9ny4IBVt4S/EHsZlmxVI3rgaYiX5ZISxa+Qp3QDYlhSjqChC9QnY
         h/j1s7hl81VyCrYaPWge/SYbPZJXW1aespdOJju6IjXlrbQktLB5dTUafmLzRKElTRVK
         QrKCSp9DKT65AJzeX6uWjQjV/RFNdzDkwVi4s1xQvo5L1ADttc1s36lCxttihgg9EnI9
         xr5h8PjYl6Grk9F3GqzCpgYjLPMdlpmDEv0OnPmmF7I+AAP6S9K2kVM/qHsi/PIvsFIC
         IMzcFuRqEV5nghxu4FPk7Eick4Z3k4aLWwPFfzL350Qspdx8w0J1PBmXqXr3V+ZVjvNO
         63mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9XA2JeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05622a018200b0042f51534179si5281524qtw.37.2024.03.13.11.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 11:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9XA2JeY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkTgL-0001b5-PW; Wed, 13 Mar 2024 14:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgD-0001ZX-6D
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:21 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgA-000488-QE
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:20 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-513c1434283so226738e87.3
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710355812; x=1710960612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cA2TT9vWbQLNZEplCJtFv+ktuA7SvmljLFLbMp9Tj4w=;
 b=D9XA2JeYuliooNtIgl5agwclxJ73pP6GWAj7N62L51Y83gjC+XJuMl9aaTG/zH9dpA
 2mJqkh+EybJEjtF3/ZGYuOs75lSjMDuRMZAUqnKnd4+BvtkstOOm/fUQP5X6C4BEfylc
 6iSFn1fmTayyFiiP3GEluxtxSkssp1W70gV9Fijvqdu++3BxTKTJ77giMSJrFwmBHwf+
 fIQomMs+kifyc4hyRVBGCM++NtSL9D2wt+nsCkQds2/nttIuRPfIdUoObD1vJPdqvkOo
 KYF4JdcBhohz0Yx/ZszIqOnJ3PbtMfjBPlr2fpa0YrE1YBpa0+mDz2wnB1AMkxYKi9zq
 2L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710355812; x=1710960612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cA2TT9vWbQLNZEplCJtFv+ktuA7SvmljLFLbMp9Tj4w=;
 b=hbOzsojeGRBzR4Ze9B3RL72QOV5LUeubOJIvoTfsHyHEDgE6NH3FTK80wGfKCgWhga
 Dr04sa+Mdcmt6q5GaZhvkJjsqdacashscmrEf26KDsQHFpdgBQVQwlexQXVqCMQOwq7h
 mcHmk42GYIS1036dC04+QrMZhzN12w4EQa02n2bUdGq9ddQGVyP0Pb8xtj/Ba068y8r1
 EeC2koqaDhuJn08w018Fnpv88J2AQzOoydBVd5dDDMk1jjvr80jDu88ZHGoCT+/HrFxZ
 gycQ1NLLWdIeHwxsztklUKtTrxUcGUIlyaKyg6HVGNKU9caSptuevBv2P5KXCLLyrDFk
 ZwlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWTfp2CCdlvXZ8d3zkW3UAGLVeYMDQnnNO0IvnPQSicokTP+n2dYtwJpDT7U3cANPzQiusYeonvdUFkViN47m4l21P
X-Gm-Message-State: AOJu0YzvakwUfHqZjbpvFsOvHFKlOsRN6e3nbb/nK/c7msOHjZAlaHyq
 muqR1QceVXtr6WlYxQ6IPeDYCO/EJKrkhg0nmUNUqJf6espwzy49nRMLt2dpC8U=
X-Received: by 2002:a05:6512:3b12:b0:513:2329:4308 with SMTP id
 f18-20020a0565123b1200b0051323294308mr6796012lfv.14.1710355811959; 
 Wed, 13 Mar 2024 11:50:11 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b004130378fb77sm3129692wmq.6.2024.03.13.11.50.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Mar 2024 11:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 1/4] hw/arm/smmu: Avoid using inlined functions with
 external linkage again
Date: Wed, 13 Mar 2024 19:49:51 +0100
Message-ID: <20240313184954.42513-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240313184954.42513-1-philmd@linaro.org>
References: <20240313184954.42513-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PLUVI65QJKrQ

Similarly to commit 9de9fa5cf2 ("hw/arm/smmu-common: Avoid using
inlined functions with external linkage"):

  None of our code base require / use inlined functions with external
  linkage. Some places use internal inlining in the hot path. These
  two functions are certainly not in any hot path and don't justify
  any inlining, so these are likely oversights rather than intentional.

Fix:

  C compiler for the host machine: clang (clang 15.0.0 "Apple clang version 15.0.0 (clang-1500.3.9.4)")
  ...
  hw/arm/smmu-common.c:203:43: error: static function 'smmu_hash_remove_by_vmid' is
  used in an inline function with external linkage [-Werror,-Wstatic-in-inline]
      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
                                            ^
  include/hw/arm/smmu-common.h:197:1: note: use 'static' to give inline function 'smmu_iotlb_inv_vmid' internal linkage
  void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
  ^
  static
  hw/arm/smmu-common.c:139:17: note: 'smmu_hash_remove_by_vmid' declared here
  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
                ^

Fixes: ccc3ee3871 ("hw/arm/smmuv3: Add CMDs related to stage-2")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 4caedb4998..c4b540656c 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -197,7 +197,7 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
 }
 
-inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
 {
     trace_smmu_iotlb_inv_vmid(vmid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
-- 
2.41.0

