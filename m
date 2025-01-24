Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp929105njk;
        Fri, 24 Jan 2025 08:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsPPTLmfhONRSvDd7XurBchu5EEl0GapnDxgLXynKnjhSsKgwtERfE0M2mUEnLENBNS0MYqtG1yeAGrg==@linaro.org
X-Google-Smtp-Source: AGHT+IHoQNQiCnECz6zGV4miv8FxAiC5KLXgFeurqNWv0mhOyfpqmmBMRR+J7Uuya6tOAkOMrYuX
X-Received: by 2002:a05:6102:3f51:b0:4b1:1232:def with SMTP id ada2fe7eead31-4b690bb15fdmr27493001137.4.1737736381167;
        Fri, 24 Jan 2025 08:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736381; cv=none;
        d=google.com; s=arc-20240605;
        b=CKmMJ2JPdhlk75UX/GWkCcgiAKoDNEF4Q8MTxw4oL7TBrM41Se9c6JQoJrMwhP1Bsi
         /knmJWxBLbs9y0nN0CcdvyV4YYLTAW3mG0/qRt21s3EidLEYMndeZzdlImJghctVteyC
         n8Ed1va29lnEa1VazJ7kUfrhx08m7ke9fUTEMj7YQAXU/SVwfZw22pG/WAq4CT7R9KFH
         g7gAlPzamTtxbvJsp9zDCPIKuOAAlrBcuIoZ198K3vkhAkXBwlgwWShHNa/BR5vLrJJD
         sG1uCtO5GsTAt40Mxc2Sqnol4VcRO1HlT1ixJbu/UrOqARBH947aUeKP4HKK0I7+5rjh
         WLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OtS+w3ShI/UCJ8br92Bpn5fDuc7OgrxDrAhBJJSSdts=;
        fh=8776w9KUuNEO4oLO0EHLJKcapMHHBHpLhwVo0b0S/k8=;
        b=SvEO2rmfvS0Zloct1wrLenwpHuG0upnyAPFVxs/EddDVbKMV1XqiTM2uNwpgKrLCEc
         eeG/j/VQLu13rYEDCL6oXjRKBD5lDlPvIxGuZloTCKj0+iXDl1PPC1QdAQcrMvYPNiKy
         AKsQwcjH8DIYxysJrnEY2kFCjjwYgtKACKO09XSu7hxhbAA+t+mthQUtoxwvrMlz4I/2
         3DNuo8CE5MzIxFmYdUNkG7ZcTfpEXvlu57a1hG2JM8tyeFZwhXtj407mZcFMob02hoyH
         /zC5RxCD1oReIfQNem15AeiJD1wozvvLu+dXtM0zJJh8B12OeuhyJ7dP7SBg7PUrjuPP
         E90g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g18EzRDW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709754c60si791957137.26.2025.01.24.08.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g18EzRDW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMZf-0005xd-13; Fri, 24 Jan 2025 11:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYK-0003sD-90
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYE-0005Qm-Ru
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso24065665e9.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736135; x=1738340935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OtS+w3ShI/UCJ8br92Bpn5fDuc7OgrxDrAhBJJSSdts=;
 b=g18EzRDW/QDzbGYc/Dt+BAu3XSZ8WfH2Q5whGZ/mLqbf3kPk/8hyflV4TBxeU1r6xZ
 +RIPZHxqGoslh+HNWrUs/s5Zmr9AmU9CLjkE3K55GQu8umc4zToW7n5J2Y7fCDlpj1Il
 dfbpR/Yk1G0LkTYwD4cnl8cnLLgmNLmOcQ99i0tS7WDEs8XFKuwqWGRQtnUTRARjI/Zh
 dY6mMgwTTfDaJB94YRmTO9RdWiQg+Y7QbLMoQAOqwj1bu48OQvwI9X3dCPnEBMn8il+L
 ONJN4M4Vtdllw69KndgCWg+zwoHug8yD1rhhw8lBNMQYedouZ8RFzk5dS8dg4CuomMh2
 JIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736135; x=1738340935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OtS+w3ShI/UCJ8br92Bpn5fDuc7OgrxDrAhBJJSSdts=;
 b=l1bUHKyqy51bZsojSdRfE5PjAx79XcbMAwlWi1rD5vsnuwWB5KglQcQOglomOOKl0a
 vTzej3NCRGqy56PbuAEFPV0YBf5CzP9UL1paL1uu/HAXSflnqDf8Czc6bsoCw0vUe8Ce
 Tj/rWNkQd0etvfB8+CVkBLPJb+bJNOhtNkOHFJpF1mOZkJN82dWtFWXnE03sNrMA99Xc
 PumM7fZThjIHeVp5aGeznw1Fu2hEh5SNrz2bJP6gU1kJO9ohGCBrYSf/sL+cuEn097dp
 Ge/0pHQaWDepTi6UyUcynJRK/rEqFgMDR+A4yNafGVwxAbcpkU39Qr0KxMkdetSyda1X
 czYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/OTl4PCZinZGUAw2Qg8uosNF8t6pCjrF8FG36obWudCc59kzRHFuXs5SvgbGdUoLQbC6wrb9I402J@nongnu.org
X-Gm-Message-State: AOJu0YyyLChnxAAzBJgLVfh7W7Bgsjho9//eYBTj+z3w+dnQVyQR6W0b
 bIJQdBxklYUXe1/oqf0UbHE3j/K65zX6oSCDEatbhVLfvYTgMxJyVVy+0DaIU0wSRm4lhm7WjqV
 H
X-Gm-Gg: ASbGncusuTKy+3lQ5EW4CO8wmXAHBM0ou+WvAOEeZ4uJewzmfxGpRV3rOOdOlLSvppj
 QHO16zslY7E+hCXdAh03JZT8zzQR+u5Gjdec1kwDjc7/RygHjl1rVBIg5Asuw1+jH3k9nCBQ1fG
 dqw57w67VI7JjKBl+6NJipR/SO9y6Oq6jnoKWONIoG9sXS3Wev5H5zsK3kP7EWvQaKHkfV64fsZ
 x5QXeg9XaYWxrGU146Xfjblqpt+Acc/QMRL85lLiGUqmrPamRtjuTrCKnYwanatEVFapf6a6d3O
 WsNigaOXlcg=
X-Received: by 2002:a05:600c:a01:b0:436:ed38:5c7f with SMTP id
 5b1f17b1804b1-438913db8b0mr279746685e9.12.1737736135067; 
 Fri, 24 Jan 2025 08:28:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/76] target/arm: Use fp_status_f16_a32 in AArch32-only
 helpers
Date: Fri, 24 Jan 2025 16:27:34 +0000
Message-Id: <20250124162836.2332150-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sxo6j/X3/NXg

We directly use fp_status_f16 in a handful of helpers that
are AArch32-specific; switch to fp_status_f16_a32 for these.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vec_helper.c | 4 ++--
 target/arm/vfp_helper.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 44ee2c81fad..aaad947e506 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2060,7 +2060,7 @@ void HELPER(gvec_fmlal_a32)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
     do_fmlal(vd, vn, vm, &env->vfp.standard_fp_status, desc,
-             get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
+             get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
 void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
@@ -2122,7 +2122,7 @@ void HELPER(gvec_fmlal_idx_a32)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
     do_fmlal_idx(vd, vn, vm, &env->vfp.standard_fp_status, desc,
-                 get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
+                 get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
 void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 45f9dfc8861..f3aa80bbfb6 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -380,7 +380,7 @@ void VFP_HELPER(cmpe, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env) \
     softfloat_to_vfp_compare(env, \
         FLOATTYPE ## _compare(a, b, &env->vfp.FPST)); \
 }
-DO_VFP_cmp(h, float16, dh_ctype_f16, fp_status_f16)
+DO_VFP_cmp(h, float16, dh_ctype_f16, fp_status_f16_a32)
 DO_VFP_cmp(s, float32, float32, fp_status_a32)
 DO_VFP_cmp(d, float64, float64, fp_status_a32)
 #undef DO_VFP_cmp
-- 
2.34.1

