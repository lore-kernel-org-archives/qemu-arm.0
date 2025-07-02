Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3739072dye;
        Wed, 2 Jul 2025 04:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9HheMPeEF/BCUL/UD/5F1VkY8iO2FLQHB/azWyyMocWnV0nuCkvJt3M67EAPfbjP0kESR6h5qDG8uPg==@linaro.org
X-Google-Smtp-Source: AGHT+IHLTdoOk2z/PW8wb/HXGSzSgeSIIJ0BXYZr8cSx57HY6UxiaVeWdyYWXWL6Wyc0m87+ytLp
X-Received: by 2002:a05:622a:260d:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a976933c58mr41730661cf.20.1751455312852;
        Wed, 02 Jul 2025 04:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455312; cv=none;
        d=google.com; s=arc-20240605;
        b=Kz3m5nuo/0WxHeeODZIOL0/YKmGB3cIzFmw+BxVejxFdjd1ghxkm5QuY4JQnXem/B+
         B1GkAqqMcdmZMZmUPYjsbhCz3X/OltU3t/Z6PK9kdHFO0+rm3XSIOTARq0nMO371C3CB
         HnsOijE8HpXIoQNQRSLddFGAyZ6ijuFGdVwSASQ6RxcPX0ldRn3l4uG+HOqmujH9JUzU
         flwtsDn2icDGAb23tpNmuMS2vIZM8aHKBI8KhDXxGfNPIJECQ3oC+YI1s3dgFydHBJPQ
         rwzEbxWKwPpzw+gxBkgDAvr7nSy+p8GroIIfmgsoDHhW1QoQTsXX0meQpgHxVStOiREg
         OVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XxWORJNR5cWeeNL6wFpxR5xESZhNAoZLn5RWItiQ610=;
        fh=ZynKCU+eBJY6ZhoXMtm8RMpIpu9mxL2iH0YOe9HG2rY=;
        b=LsHPzE6RJWbbp1AluM5tu+cHCopAfbnLkswaQ0ySOpda/bIbIbDMYKDT3rbasJeQx1
         LX/F4E9xAXqRfKmXWtQ6vEfHKSagCw3UUzhC1dB03yiVv//dAyioi9CWj39hijfwT3eX
         yJOpXEuc2Gp9YmTp4Wjr/Qo+MtCrkP5AywaDQg/JpiaG08/nOnHTRZlfMODHoO4QJXGq
         N0wfh5gSMc/sbuH70cnw4DTbRYdXix3/NLTz+qpj7FnefJfx4gGN1STUR0MuZ8Qio2IE
         4SKxWvu3M7FgTWMS7bigaOJEytV/WBhuS/ceMEuue0WjnAmbqMSIxTgtv6s2Z2+0b15f
         n5hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnqKUPDE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc576503si127608431cf.575.2025.07.02.04.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnqKUPDE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWvVn-0007Zu-HV; Wed, 02 Jul 2025 07:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVh-0007XX-U8; Wed, 02 Jul 2025 07:20:17 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVa-0002HZ-B1; Wed, 02 Jul 2025 07:20:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-235f9e87f78so43792535ad.2; 
 Wed, 02 Jul 2025 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455208; x=1752060008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxWORJNR5cWeeNL6wFpxR5xESZhNAoZLn5RWItiQ610=;
 b=OnqKUPDEu0cEUxjRuYZRUx9E4koqOvlq/ApDLfCQDifZWVBgFxwEin5dguNdMUgcn0
 9h9sWqxiq6wTbBF0U5cs8heRCBa5bYpoxKgrOZ3QIwIuMXMG90ycWAsgHh+A1w8VOWYt
 XcWG+xhK4hjQ4nQRhTZTkJT4Rf6V7grMayPalCDBW/UC0V5p61q6NcmvZg7rSGmHTkbg
 3ULj9obA4uPyhE6tZtnz/y2Ygei0tEmp1Hd75R9bByXTCK+kCIChkHZPj+87WSOji7Vj
 toDICEljHVc2SkYUdI9Br1k0/N595AO1V1roBUDMDds2l4iGpyRUJ5ZOmzOeGyFtqCcx
 0WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455208; x=1752060008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxWORJNR5cWeeNL6wFpxR5xESZhNAoZLn5RWItiQ610=;
 b=QPF1Iqd4rco84rgOeiEpgmz/XgCpFDuKGjPiQ5ToNpLjS5kkAl5efc6WNkq2UoWm4Q
 AMAEb027lTfBljjZ/uKnRUogIHAmOQjEv3ulM63foeIZiosBKb0YCzvackFCP5kNprbL
 vjb1/A7JVrKhS/jiT4QWaFM0OoPzrvAomAIgWFsqtWf77M62ED9SOC26F6Q6GFERJW8J
 3wakxF0IwgBoJuAWH2JehceTY/hvm80sSC7i9PpN9YglSdPqkWGBfvKvCBWk+BDFrbLF
 u9d58AXe2KmW6wY+pYs+E2nHG7NC3N+sLGC9vySBXVnkhASf8D8evoMccP13vLEXITuw
 GJUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQnyR8dKHjRTZaUAg+HSnOZAADDl2bBb9KDVMRdnfDegXgo/3jvsz1C1XQoyXfBSFLb3XYij9MYw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7ZXuRpzAYok/AqCOvVClTUnlesEod9caLU4AobzfWZKxCLkRw
 xIVhwQZG+T0JWy0OxiaIHJp/ahHf8phB4kmq7q2eZKBHSPKfLj0GtrnXoxjXUvGVvQQ=
X-Gm-Gg: ASbGncvODxZht45UJ5QigCzjNxR0DT4SmR6IT/yHfGeFfgiC+zpXWySehPuytnskXio
 hCIzGf2h1vx8IGzilrrzlvcb5D8mObzHUf7VKpEV4lpJhXioHzqYdRbqbYX8BI+4l7Ob91duKZ0
 liIlFJgr4T8BT9qlWFO3mxMzphm+ELCddDA1CULfPE47zJJYzvjfmcZlkvWxDIlM/JjtgMl85Hz
 NFh5UYWhoCAdZYsb9Z3/lPMPCYpWstx5qfEJwzSK2CJxiMJj0Ah8WVnociAN+RkMhoiXzy7kVUy
 cG8uOOiSJ2EfOhIFNg6LqSrXjhIQEPfOCBHXvUHBzRNuAkH9AfDOC0f7urS5JwF6thmgTCtL0GD
 PbnM4j4tTPA7Af4l2eMRjrw5NXAAS2aNhXYgxC573/EU=
X-Received: by 2002:a17:903:1ae3:b0:234:d292:be95 with SMTP id
 d9443c01a7336-23c6e56f58bmr34420655ad.42.1751455207675; 
 Wed, 02 Jul 2025 04:20:07 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23acb3b9344sm133618575ad.192.2025.07.02.04.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:07 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 02/12] target/arm: Fix BLXNS helper store alignment checks
Date: Wed,  2 Jul 2025 20:49:44 +0930
Message-ID: <20250702111954.128563-3-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 8Gjarh0ZdHrT

This patch adds alignment checks in the store operations (when stacking the
return pc and psr) in the BLXNS instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/m_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 251e12edf9..f342d93489 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -632,8 +632,11 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     }
 
     /* Note that these stores can throw exceptions on MPU faults */
-    cpu_stl_data_ra(env, sp, nextinst, GETPC());
-    cpu_stl_data_ra(env, sp + 4, saved_psr, GETPC());
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN,
+                                 arm_to_core_mmu_idx(mmu_idx));
+    cpu_stl_mmu(env, sp, nextinst, oi, GETPC());
+    cpu_stl_mmu(env, sp + 4, saved_psr, oi, GETPC());
 
     env->regs[13] = sp;
     env->regs[14] = 0xfeffffff;
-- 
2.48.1

