Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp395209dyc;
        Thu, 3 Jul 2025 01:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW61v4zy62njFp7AE7wxtOA/f4TbxXPNjHeqTovvqpo00zdravVKMff8CPsqJ9BXSw5wIzsePic8/1PGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFuJpev0bxbn++ZhYIpC9Uh2EeE7kMQEm+rn+McxSmlvT6iOqcQHzhOciMKpBsSigK0OzG9
X-Received: by 2002:a05:622a:5888:b0:4a3:96b7:2a73 with SMTP id d75a77b69052e-4a97692528cmr107578451cf.16.1751533032225;
        Thu, 03 Jul 2025 01:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751533032; cv=none;
        d=google.com; s=arc-20240605;
        b=LTfwDUfiYqyCXYHP500GK4JbgpX8m4iN1zy/S7YbhMakENLadsQb1sdCG7qg8FCs6E
         R9xu4CVU/zLTcS/2YF7mAubU4qppz8l5AiS6YJ+dYGjzC+rdPGsKmILebRkfzw9zFzeC
         5oAoDRhgjV6u9KKTtZSIs0pnTb/seAA72UYnhmm9HN5S6+kAvogwp2i4NbyzKN6GkeOq
         8XQp3nRopo5TyOPsmtswB6xgrSEdNdk8XnEZZiI2HeLZkW9UXwVKHyDjMyms1pcrdi9F
         fnzncavNdabE7mHDslQDXQjlhHMIfZqWdxiOOZxf5WGxzs3ujtZHIkNqttdiEVME+YVC
         3M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dsn0anIP4CK0jEvYeRaGC/cLz2Rpi7NuxiCgDFOKI2w=;
        fh=G80iXSczOXw6skpZlRD+2tyQwf3goh639sm3j6fmwhs=;
        b=cbz2YUOZ1QJhYYTB3Vp7VGA+GX9ca55BhL4/YHz0UfUpbp3mSW9es3IlGEeYw1NJ23
         oKg/QLDtsok8GKl3gDMNM9M4D3xpz26UlyLq2/smyT0eVBmnEHqngeNFrT0Ju9cK0C10
         FsS3EACSeWlZUS+vu4jz8ABB3ZRAs30We/mwwWI4Fob2KdPu2mC+dXK3GxK1rvpzUfcO
         TLi1WgpfVyH/K9KjYJ689GchmN6Byf7dY2D3zMfQRE5VrgAcWtTH7bj5X0HMARTe9fHs
         ab8xC7lBoaZHCKu1cGMsroQoxbPLPxF7QeTUV++hDjfy2K+Z1RFY8uVTqIN2FGO6OEFt
         k65g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOpPt0v9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57dbaesi149639801cf.650.2025.07.03.01.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 01:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOpPt0v9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXFk9-0002T7-8u; Thu, 03 Jul 2025 04:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uXFk7-0002Sc-Nl; Thu, 03 Jul 2025 04:56:31 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uXFk2-0007xP-Vc; Thu, 03 Jul 2025 04:56:31 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-23633a6ac50so97744395ad.2; 
 Thu, 03 Jul 2025 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751532982; x=1752137782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dsn0anIP4CK0jEvYeRaGC/cLz2Rpi7NuxiCgDFOKI2w=;
 b=JOpPt0v9phndBGr6AFabHDcZ3qXPhL7OuoK+wTRIxnxCn2+Acyk3kjfFM0S5jUwOgx
 9Wftg+dFH7kGQ7sgIabpYCNetYRHLtkqI3Yi+s+azb2KNcv8Dl0RFlKxL0UGtZm4Ae+l
 LmxVpCXzun32wchgcLQRZFyYHmIRcyNX7RYIZISwq1Q2xo49iwCJHSBLZKTJJ74AO9EZ
 4peBJIaDmhcr2nymomaFQqlCggLFAUbXcSeHbzpUUB6h0SUor3cBsHX974fpABinHVT1
 0z2oSIo2ZB6oMP126THYFuOJDRlRDuKU2Cj5v3OmTSl/6+XDd+5Rrfiuy7oTXhX+BlA1
 6jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751532982; x=1752137782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dsn0anIP4CK0jEvYeRaGC/cLz2Rpi7NuxiCgDFOKI2w=;
 b=lsQ1jNV22S1tl9BngzSbulKu19TqZIk8bb0iuQSwggpvoIZJWOBSDDD+qzX0uK7S76
 yTn3gvJ1sgFX8mvBYlYwok7V4QFl9oiGVxaXiUDUlVmIzvjt7wADOugN+f8V1vjP1F4k
 oTSx2bL7AEbrUFtWHkHgTw9qGGF6kLruI3PqKuv4yALexZiZC+Yf07I7JNaHzJaorZjl
 c4O0IkUvmZL9gz6WBcG1x+VE6sBnsnVJ3iBG2GdlmgIo5RadD+QEletkrdh561toStc2
 m7Sbjtzs5QrUiNUD4CTlNrUNNW95bi8jyUORSllxGAduyMt/LTVGTmow7FDZPyySBcWK
 /erA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAfodxCQjBj1NKU9Q3zDcCCg8QFUDgLl5BMy2vjPEZDl9Fd4fJCFjA2icgebedZiwGW8dUG8E+zw==@nongnu.org
X-Gm-Message-State: AOJu0YwVm1DcSXEs/squVfMeB+T10Qo+NaVWL2TB/Il3k3RrFFuirJn7
 1TFasJGeYXrOu4ssrGV7IaWUW61zAZlIklEdqrBOZFPFnjECk4p6lAUNTJ/5NaRKttY=
X-Gm-Gg: ASbGncuNO3OAzRi23fBr5BISVuSyBCoybk2ZkFL22Pepe6GZw3dGLceaFMDN+Y6EmEK
 oVQkq+sJVrOzP8QFOpCazx1xMrk0zG/Pm5d3eyWizQcuONDxc4KcLiVnLi89fnOdLXtdkzWUsq5
 aZAujCHFD1AxiD0kbHZCZ6yQDz7S/lKAObsP2Br9Y5KqRX5Gbl5VLlVYzDApjKevE39S5dyKG3k
 IAxmr4i1Q9bNX8wNNU2+Jjgegl1n+g9U7iOWNVMqG9baYxpgqo1oZUb2trM00FV+HrdRDzbW4mn
 2A6hM0vE277CVthZikPJGr/Jb+iL0jmuePsesg8sJlo/ONboOvW1KZRdK4j1hB4DA6fZi/MC4kD
 e3mJQ9MxjuzD4RfwWhvMzLrYH6nuS5pZcsjlWjrTVfgzRBhl8Zz8WYA==
X-Received: by 2002:a17:903:11c4:b0:234:c5c1:9b84 with SMTP id
 d9443c01a7336-23c6e5b73ffmr82226135ad.37.1751532982011; 
 Thu, 03 Jul 2025 01:56:22 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23acb2e32d3sm144358075ad.8.2025.07.03.01.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 01:56:21 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v4 02/11] target/arm: Fix BLXNS helper store alignment checks
Date: Thu,  3 Jul 2025 18:25:55 +0930
Message-ID: <20250703085604.154449-3-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703085604.154449-1-kosasihwilliam4@gmail.com>
References: <20250703085604.154449-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: x124cC4dU8Xw

This patch adds alignment checks in the store operations (when stacking the
return pc and psr) in the BLXNS instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

