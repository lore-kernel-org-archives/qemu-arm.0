Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp605949lft;
        Mon, 20 Jun 2022 11:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZWTLQQmEt+0+/9FAyrabCzNkRYy1xbYecfGrvCuKAiJ5oO4u9g37nWOiqR6TMVI9xb0zH
X-Received: by 2002:ad4:4c42:0:b0:470:384f:b557 with SMTP id cs2-20020ad44c42000000b00470384fb557mr9066548qvb.39.1655748532225;
        Mon, 20 Jun 2022 11:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748532; cv=none;
        d=google.com; s=arc-20160816;
        b=yqUAM4TMER8fxTbeKYRBzHjn6/vGDAWjUi5WnFVyZ6Q7AsDAweMWNEO+9Z06Iiw0lm
         Ep3A3YmzlsQq6htFa0qabwzYTXdtxcu1UpEq6zznmKx+HAQDjw572u8e9JaNcGB1sltR
         2YpA+tFHG8KyckXvbt2XFFZX2pSFjRlhMwKNvwPIgOJ/4sS6uCItpi1qATgZsuucXnqW
         uXto+PppXHfDelgIQ5Fi5j8/HvW7A/JxWXoYOTgBXJsvpQPEA0YOIZW337qqI6Bup5dl
         bozsQmN2LH3scW78/Soeva87OkQxMWwFfl0mWssi2DNDjzB/eoYHQA+ObC4oAFSfCLdD
         hL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kt/+0I2W9Iyl7ik9o33CGdHvTPzExmpXuGF2jcQJGAs=;
        b=iz7BxPqxMi00rtXgjWjMrdml27Joy7uu6T11vLR24XzJrUz6uzvI6zz1XvL12EooJ6
         wvu0krVEwSJm+oeRSZmDvfHFMyQ6JYSbSX3/+/MkyIADxkGAfQCvhzSwfmFjerFUfnDY
         WCCg9vwTnv3loxTrrtA5m3YL9S7FSdg32ngrXTtFhs7mjIrkbrsz9WF3YtEopRdydhMM
         nfojz0eWiSlNuH42demgI0eVVW3KUOMMPJAUNCFIFXF0tUd6OsQM5K0vB7EUePRkVcOW
         ogUqnOTtARA19ooMaR0HiBzK5RnJljjP2j2q4zQPsbLoA6P7nlLdYrsmL+Io4zzwrVdl
         tfWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=krn508Go;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020ad45749000000b004633a99696asi9187958qvx.476.2022.06.20.11.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=krn508Go;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LpT-0000rS-LR
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La0-0005st-5Q
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:52 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZy-0001RQ-6L
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:51 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r66so4938311pgr.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kt/+0I2W9Iyl7ik9o33CGdHvTPzExmpXuGF2jcQJGAs=;
 b=krn508Go521nhRrHcKoZyg/WiRY3SnxWCQa7aamxv1fUnzP3G9UeC2C3uojBMNlqRY
 fCEGNtfO6MArseW/+I4OXEJ7BvAEBBpPPL+XWI74jPQ+/jJpro3KAQMnBvd3W8NSQYek
 kVWYkiJtzW2AEV8Aqj7uwcnPA4GcdzFx+nn5UEk2/SUyHdmvbFC4lHTUlb5cYt0KUTqr
 8ZYJzUM2L0IlGGmW4101br3d0UYaJSWyyEcTATEe18OjfAw3FXcrksXchURNp1hMgGu6
 AVf3Slvq1z3yGXnFhcyBDkLmsSojncw2tF4c9k8XcPqhwbqiu/IPYBKimGFOpKMH7hA4
 4VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kt/+0I2W9Iyl7ik9o33CGdHvTPzExmpXuGF2jcQJGAs=;
 b=iyxEi6Kkcpo+LTwz956HdNbCPny6Od4ynv3fpkKjfHXFbcoy1TKeIoWiC+r6GnTOID
 L4EbJ+BLmqnbUC1AXQCeZC3n0LsLdfBTfc6BMvdVEPguVqBZd9J/L9VApDn2SeSd2+L5
 26OZ/Ue70F5EFFtzNWP3mYxy/S5E6GAZnH22QC+2XzbRZo0fPT8DWV7uSmbAXj8qsYWZ
 3yPteKA5r7QT/yW1fS+vbrqHXsa6B4Tq3HI6PNG7YOpNLamzyF3Clv5WFmo+qr9JjAuQ
 CNeeyuxrTBC4acvCC06+s03jW6lRWI/cLfxAnyX/tDzzrTFlg0WMG9Se3TyUEdncfLwR
 38sA==
X-Gm-Message-State: AJIora/YUoFxkk94Mni2drJXO/5PEE3Eva4n15A3IMnrpep1QI/6Jxk0
 eACudt+JaILt0GOBEu+3mWzy/39pQg9CNw==
X-Received: by 2002:a63:34cc:0:b0:40c:a7f7:bc6 with SMTP id
 b195-20020a6334cc000000b0040ca7f70bc6mr6930892pga.617.1655747568853; 
 Mon, 20 Jun 2022 10:52:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/51] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
Date: Mon, 20 Jun 2022 10:51:58 -0700
Message-Id: <20220620175235.60881-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0lP8pLXbWXaf

Rename from cpu_arm_{get,set}_sve_default_vec_len,
and take the pointer to default_vq from opaque.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1a3cb953bf..b15a0d398a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,11 +638,11 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
 /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t *ptr_default_vq = opaque;
     int32_t default_len, default_vq, remainder;
 
     if (!visit_type_int32(v, name, &default_len, errp)) {
@@ -651,7 +651,7 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
 
     /* Undocumented, but the kernel allows -1 to indicate "maximum". */
     if (default_len == -1) {
-        cpu->sve_default_vq = ARM_MAX_VQ;
+        *ptr_default_vq = ARM_MAX_VQ;
         return;
     }
 
@@ -675,15 +675,15 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
         return;
     }
 
-    cpu->sve_default_vq = default_vq;
+    *ptr_default_vq = default_vq;
 }
 
-static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    int32_t value = cpu->sve_default_vq * 16;
+    uint32_t *ptr_default_vq = opaque;
+    int32_t value = *ptr_default_vq * 16;
 
     visit_type_int32(v, name, &value, errp);
 }
@@ -706,8 +706,9 @@ void aarch64_add_sve_properties(Object *obj)
 #ifdef CONFIG_USER_ONLY
     /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
     object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_sve_default_vec_len,
-                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sve_default_vq);
 #endif
 }
 
-- 
2.34.1

