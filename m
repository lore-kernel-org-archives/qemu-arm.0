Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1995168ejb;
        Fri, 24 May 2024 16:29:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC4sHJ+ZEX9M4nD0jOxK3HTA8jz4DMVBMXHd1maM/hEROSotlTj9PZjIc9QNgpAHHnRgHF+TLSIv2D0LONiPzOEOwf2707
X-Google-Smtp-Source: AGHT+IE4SiZzyUpOKO2/Y5Fv3svATHWyknOAx5cGJR1zcc2IG8osFcw5B4yxnwVEUypny6Rl36Fc
X-Received: by 2002:aca:1b08:0:b0:3c8:4964:48da with SMTP id 5614622812f47-3d1a1c9848cmr3729523b6e.0.1716593399489;
        Fri, 24 May 2024 16:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593399; cv=none;
        d=google.com; s=arc-20160816;
        b=vDNMQanww2WF+Ry6G7wuruYV7Y7OYSwah5NFcOt1hI6OOEBbMVTwLqwb/zhfsqx/pt
         VEIdW0+C4wNSz82+w93L1xdPfOtSMG8TlawlOLvi3yZfrRb4itJqVG4qaW+1L24V5mQ8
         geJ7A1ufFXPVK5WZDEhiL2AhAe8TybEj85CZMKTwgjHWRq9FGPHTrzUVbdTu2l2dZouL
         t1C/lMFeVI7ysBUdIcWmz6fXZyCiDkoHxa/Gwbbu7IdLnsGgC8l08yUhu2QJY1LuEgL7
         DwvXruNGRVRY+dpAfvEvoDfrC5wcpcEaqbU4LUrYUg8sFiMKnE0Zbvmkb46KAYy93jUA
         /DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=MA619cNnv8OK/DXJSYZRhVkFOTGeYZTvNYTwGxLJ0oZ7wOTeKCn3qnkUMP5H/tpodz
         EzoBkaiUz8nUsgWNRNSFRweNV0nY8kJ6jjX8KyrHWwXDWHwlGhQQrK4s01jukF5s93sC
         iHCgHfMDwolfG4fPB8VbARBS2hK6DpJUXK6S4jDTwB5jBKAA6Pz2wmFsv+KA5EVSNsPy
         fQoDTKvHfRnHlp4/d87mvY16ZyAb0MOFlsnDqA6yVP8YUOoabGj2rVtfsx3lOtadOwuv
         vhGTzec3Owj1AOjX/l4BXGSpoZ2nZkOucCn89MtGAdwjUVb3Uj5K8PoniMl+LkNR14tl
         GDmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emsgS+iF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162a17f0si26606776d6.427.2024.05.24.16.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emsgS+iF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAeIZ-00016M-Fi; Fri, 24 May 2024 19:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007OX-SD
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHh-0006tZ-Af
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6f8eaa14512so1307128b3a.3
 for <qemu-devel@nongnu.org>; Fri, 24 May 2024 16:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593110; x=1717197910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
 b=emsgS+iFjgBL5HsXZJJwTe2WGH+23g0HnCDQCoIzaD7bsYBi0+IJlQVA6NvGAIyAN0
 xoN4llMYhwVILwTY0fuxSPTr6kTJJDF+J3KB2Hl9f1UjJ+DnNEPqseSvhfXksCOIL1oC
 jef15ld2Wq8ZgqkdbGZPGXVnSbkBQ/rhfmDNhJdExwQvzd043qmUFfQA7m/1lTCJayr8
 YOnrrZx/uO1/w2rUBeuieR9ETNDEP3fb7RuelbVSixhAvesLOYambWDRYnHhg4D4ovdK
 xGNEZ2m95G7T6pG/GvAHqr/qjT0HLau4Y6J4d7OFG2J+pYuiw1muuaCT3ve5Z/XOO5vm
 9mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593110; x=1717197910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
 b=Xi39AZjzz1tM/UsIbzgfTx6XiE6z+5UjoUlheJCBBBlVJdG3oxp8Rl5ZMfqaa4qCgy
 zxO43wcy6Xx58yK5GZ3DNtlvJ8R74+xaiVgu6otEHPCbBIkJmBuzsn+PPJR/mwha8roO
 7YCvwDKWps+Mh4E4LswhkLu5ITH3yUKs+eHRwNRT4qccmTzfv+mDglAtpudU6PaJbrnI
 nOvWl0G68U34WYpUEEw9Ll0jdo2FE5WRZIzp2FxvxSaQUeVxPsKYc6wgp5LJ7gabJsKg
 2V/JKtw53mTHnIikBmoPEboIGfNv/se9ct8eJuEorr+HPFBjbRAilpxYVSXWg9bSgHle
 woBw==
X-Gm-Message-State: AOJu0YyZqRgfnc+LnrvhC4OFcIWgfLeiMCSQ+oz/xAO9Eq1xd7dM+kSp
 OYhNRxVRC8anj/Jh+Tf2y7/YVZh+8McLShSbi9uffLrF5RM8pJz0HqDBRXJB7/gBoIoskAUwLGe
 Q
X-Received: by 2002:a05:6a00:4405:b0:6f3:f062:c09b with SMTP id
 d2e1a72fcca58-6f8f2c6c7b4mr4166051b3a.6.1716593109917; 
 Fri, 24 May 2024 16:25:09 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 53/67] target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec
Date: Fri, 24 May 2024 16:21:07 -0700
Message-Id: <20240524232121.284515-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tGUllCRTFF56

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 1d6bc6021d..1895c3b19f 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -943,9 +943,7 @@ void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
 {
-    tcg_gen_and_vec(vece, d, a, b);
-    tcg_gen_dupi_vec(vece, a, 0);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, d, d, a);
+    tcg_gen_cmp_vec(TCG_COND_TSTNE, vece, d, a, b);
 }
 
 void gen_gvec_cmtst(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
-- 
2.34.1

