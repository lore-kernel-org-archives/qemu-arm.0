Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp162817njm;
        Fri, 28 Jun 2024 07:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5aVZAY/VLRsVHB/+d7IWbfpkGuPg00ey8NO4+tUY4tkmG4QJzs+1g0a6jOqQ+kd2pjG1fY/+FDyEGlki95iNm5IPOb+fQ
X-Google-Smtp-Source: AGHT+IFJtXUxvsPJxLuZwWn1aZYkBNzPC5Yv/fYcpJGhYxNpE6eKsEbphhHkdq2+Md16HGUThJgX
X-Received: by 2002:a05:620a:271d:b0:79c:f55:4fd4 with SMTP id af79cd13be357-79c0f55520amr1102521085a.59.1719584684206;
        Fri, 28 Jun 2024 07:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719584684; cv=none;
        d=google.com; s=arc-20160816;
        b=Md0IeSSILpmhfLgcbU4xX0vfRhiQyui+01Hf6K2FcVE1DwpLXFLHyyKbcJyJ8xbUR9
         9ND7Qp0zDu7d0On7KVvT33HUfnH4UjXrlhXXp/oIN+w0l1Uatbw0W38Sc8qu/Pl5Pzm6
         zwVh9jPXonBsjUa91l7XG4hCWiRK0OvFDX234Udbx5niH/jsg/OgJLLbe163bKTj9W0E
         9SdEw13f9CjwFNWCmKPhxdsgOLowifV4bvtyRL6T5DyMEU5qPoKbRViFpwrjzpbdkI2Q
         9TPzx9N+LDiXzU63MLy6ggLXinxuFhuLx0+uEhGH7g9XzKHSLe6DXtgMOhE1GNcuAjZa
         cLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DsjR+0RdxEM7QF1viCRug7HBVlIRYxe8thi8uv984vk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gabg29INom78psEIw/IUySzN2x3zWoIvTWqoXC761mAy8IFVIQrxr8/uKftzDrQ3GA
         Iw144/WBBpIZK6LL0VpVpU9HTlYpylWXQDcPkGJ94fNEWfJSHiAw+Fv88pLPqdX9bm1q
         THw8v5QrKrnyoRRLA6gBxPgN62XFt/4bZ11WlnQWlagefuug88Fqc+K13WSMRpbA9lJG
         0tiUBH1QyUw/NSMMINNNGCisneyvM/Yv8TvNCarG4gxhtL/iS42XVn9Yln3yWODCTAfj
         LAcNyeGTNbj1/U7hBc5Njk9fguO+VFKGSXuZvuI9V84bUTbPYgyQzhniSnKOK9RWykab
         DdBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kg5kfZXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69339b98si186342785a.589.2024.06.28.07.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kg5kfZXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNCWg-0002dj-3A; Fri, 28 Jun 2024 10:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCWW-0002ak-FQ
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:24:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCW9-0004Vc-13
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:24:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so4435455e9.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719584635; x=1720189435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DsjR+0RdxEM7QF1viCRug7HBVlIRYxe8thi8uv984vk=;
 b=Kg5kfZXwB0NCAdmBhi6t8fNXEr+W7I+JIbgo/uzzdFUA9Ynau+0BrKs8ygj7uG5ZEq
 48ZdSKMvTuOLUJ5WOJdy2Nr5IZAO/SBStVgzdPxday8s0LrzdVpBNX1kzIVcp+PzBcot
 6fyqMlfwvhb5GDa/6g1bs/JWFE0eXp6Q662FD4e9jO6sCnmWBug63AtOdF25htc/vpBi
 XYpO1SH5xrbwNdu4wviAjZDaMx3GEVjWEG3YbXzKoqmqZC6AUZf9RRq/r2uf+o9HIBrE
 pQhvty46Bv7f6heDdeJXG/yU5YJl37yzZfnUjyArc0F0CUDSp22hVQ5TtPTRbhuADde/
 J1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584635; x=1720189435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DsjR+0RdxEM7QF1viCRug7HBVlIRYxe8thi8uv984vk=;
 b=TTYlAep0UXBl0zTtwRIlDMU5qLm5x2lTUpWDCcLHj/NaIRxZmIPr6BKf+Xc3gSK1b6
 8418fk1Lgys2pqXrat6nVT8o7a/uz+3RiRy15n02ZBYFiRFm1STIB2KA+0Hs9ejwzJUf
 VjH5/bFBbh/VLoIU6okDSmpqQ3Rnt9zKjGn9V2A64Evo0Yxp1iquob1h05JSQ3SlXL+K
 pBZSEY+eTUdY4svUHMoTCbRehJKKI6srDyH1JInOU2FndNJ+qam6077yTwXjfS0SWtxn
 eP3azZuEDx8fjDhGHKvfS9WjgMncgWDdZUOdKT8q4zzBZnSSIS2AAZ4Tnbw39HudyLvq
 jNxw==
X-Gm-Message-State: AOJu0YypiaJ8L0qbAYS2jlGEIx7KbzO7wmEXd1jF7kJM+PHm/n+peAoh
 ZlU+KcvT0wIo9BHIatF2xcdKETL8pisyLdp6sWAuXx/8eueHjVyxlXXRzoiEO+uWyGfywh61fsm
 afKI=
X-Received: by 2002:a7b:c40d:0:b0:425:6055:34a4 with SMTP id
 5b1f17b1804b1-4256d557031mr15527935e9.20.1719584635214; 
 Fri, 28 Jun 2024 07:23:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55c0asm37180945e9.15.2024.06.28.07.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:23:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/arm: Implement store_cpu_field_low32() macro
Date: Fri, 28 Jun 2024 15:23:43 +0100
Message-Id: <20240628142347.1283015-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628142347.1283015-1-peter.maydell@linaro.org>
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: b0Ttv0qDc198

We already have a load_cpu_field_low32() to load the low half of a
64-bit CPU struct field to a TCGv_i32; however we haven't yet needed
the store equivalent.  We'll want that in the next patch, so
implement it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a32.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/tcg/translate-a32.h b/target/arm/tcg/translate-a32.h
index 19de6e0a1a9..0b1fa57965c 100644
--- a/target/arm/tcg/translate-a32.h
+++ b/target/arm/tcg/translate-a32.h
@@ -83,6 +83,13 @@ void store_cpu_offset(TCGv_i32 var, int offset, int size);
                          sizeof_field(CPUARMState, name));              \
     })
 
+/* Store to the low half of a 64-bit field from a TCGv_i32 */
+#define store_cpu_field_low32(val, name)                                \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, name) != 8);        \
+        store_cpu_offset(val, offsetoflow32(CPUARMState, name), 4);     \
+    })
+
 #define store_cpu_field_constant(val, name) \
     store_cpu_field(tcg_constant_i32(val), name)
 
-- 
2.34.1

