Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2807445njc;
        Tue, 5 Nov 2024 05:07:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU79lQpalc+sb8SymBUjeqPsUnSuCpfxxMXWzS/YApnt6AaWxwaMrLdInt59HnnHPQhyN0K9v9+l6w3Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IGMqNwzY9sIrFKPqgS2LjSzGdZcJU8sMfJDFu87ShPO/vLctKxST4mQ9AK9p/2XfgSaXR2O
X-Received: by 2002:a05:622a:11cc:b0:461:2a3f:a0ca with SMTP id d75a77b69052e-4613c197fc8mr542806351cf.59.1730812049769;
        Tue, 05 Nov 2024 05:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730812049; cv=none;
        d=google.com; s=arc-20240605;
        b=Ib0agGlpCfXIvW3PDeIX2i6blD7XbF9EPkm5GQKhlCov9YPSWemvPaOG6JLZuRn/Ce
         xKq5g1zP6aoRxPu5sp61A1YvtUluZ2hshm4eKVZkDpRw/QH9H4qU9kKiy+pfqFo240l/
         cgmEEQRSQcCbI7aba4QpxQUBbckiZ6cXeh0tvnjFz2aGmjFLr5aBFglTZb+m9Z7u8RDC
         R+BWQRie7Qbz/ikEaxDgOfk99bw6D2FGjPyJDjEACebZIDli4WdQcqGY5H1ncn1BzqC/
         +2PKiYPx/kYJEMmGFxfnutRkNknsx/X6nJLZT/0Fh70lunUQ40Kr0SQIFyxjfhHrMpIr
         tudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kbb2EbjAWyPRswDzNr8J6AfAT+vMH4Ts659xVE0GgBY=;
        fh=5RTreV2FJKUlTpgU1MOH25M9luQpnjc1cvxvb//HIwQ=;
        b=A5uXbssUA8GZyjtXfOfCWrZ5Gq3tH5mK/seXhhCBD0Haoxac57NIIi1L0yBZKaPtsO
         UkPULsaaci/zC51Bj/U/JccMdx+kRDJ4dmjeMiGtK+q3EojUAom4GI5jxgd2x6I1YjiB
         uvy+jO9tKQ61HzhRMaPcKX6A0HHRwEV+YfYWvwrBRRuQotYE5Z8ilEpx+q9Tw1bkxRRZ
         HD6+H6mG23JmmfuPo3wcZs+MXCAEDrP1YlVcuJ0nFqJHVrO4aV0eQYV+toV0E6Mh79KE
         NkayfnTvw5M3jVoUq5Tjb0QIm8AZ0Kjsbml7AK2HwMlOUWBZOwMwbmEH9L9FFxu9xU7r
         t+mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NMS/MpdH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b343fsi128470491cf.56.2024.11.05.05.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:07:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NMS/MpdH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JHH-0007Jh-VU; Tue, 05 Nov 2024 08:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JH4-0006c2-9c
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:07:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JH0-0002gH-BG
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:07:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so42922985e9.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730812024; x=1731416824; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kbb2EbjAWyPRswDzNr8J6AfAT+vMH4Ts659xVE0GgBY=;
 b=NMS/MpdHv0mL+xXX4MDKMtHhCQD8tUoLFhAHOWTYVdzr25FdS5FjZuabDfzOLGrYTm
 a7bLb1/DQAfa6SN8YoSaJkhjlM2Hqd1XoF6qPaFjTbpVosaNYxnjYZo3b3tbk4ZR0Mrc
 u2sat5CPvv3ypxBGsvgr5PmeGHrHpY9jM/FBnWTC0et/Dp9kxqch+mmicDmAfXbLDa5d
 783kZgl7DNu7FV5g411uE1MB9RK0hh08hjYF8Li1neIxLmroTy491X8bbqAKkpufpkn5
 PhzyZ0UwBuPzNWxkQ9VXcGZJj8+xfA8HhQDzUuIHmsRedQ1PtFOfCuApSPWTGDikV7LV
 Vl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730812024; x=1731416824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kbb2EbjAWyPRswDzNr8J6AfAT+vMH4Ts659xVE0GgBY=;
 b=GlECCP8WTlvQ/owT14bQPzzpfNwUJ5bdIE7DklN3liCFUo5p9EPf2FvLsXDvNOxJaG
 QRA1Aw9eP7hL3K+g+FUa8+DQfdDYV25QtxbPn0Vq58xzzF6ZqYhayhwk6C72i43J/zsR
 ekBKIqJnIFIXicXTbUDmE+XBcE8lLS1FMsURh+yEU4XpayRmJxEhz85moCP85dgNMWy7
 uWZDjzBTyhmslUr1WPONwvByfqGjPC1h0TlO/lOYBPNJAAZp9AogBiElPQPhemlZWEEW
 7H6bMke4PAN28CcUoXr6e1lv7lH1s9YRLg0YdZKm3ryT/5LVUjW8SdJ22f3bvq0iOJzO
 SrOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxNPe78nzSBzsbM1Mti+a2HIn65sA+kRYaYBeFGSkxwIqcMG05fxUbgthkPRLLtGwPoGm/ZsCRNw==@nongnu.org
X-Gm-Message-State: AOJu0YwxP1RoeHlyPHaujzXYDyacN1iMm2SGP4shc5cucZlclRyaXljG
 AIX3fiM0WYTG3GaQriMTiKlPKSikxrjxR8UFWqIXGiPz0If5Tctsrbf7/ESZ230=
X-Received: by 2002:a5d:5d09:0:b0:381:dff2:cf08 with SMTP id
 ffacd0b85a97d-381dff2cff8mr3069929f8f.2.1730812024322; 
 Tue, 05 Nov 2024 05:07:04 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e073sm16114234f8f.66.2024.11.05.05.07.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:07:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/19] target/microblaze: Introduce mo_endian() helper
Date: Tue,  5 Nov 2024 14:04:27 +0100
Message-ID: <20241105130431.22564-16-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: F3ka+hVt3LdT

mo_endian() returns the target endianness, currently static.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/translate.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 86f3c196189..0b466db694c 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -707,12 +707,17 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 }
 #endif
 
+static inline MemOp mo_endian(DisasContext *dc)
+{
+    return MO_TE;
+}
+
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -847,7 +852,8 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
     /* lwx does not throw unaligned access errors, so force alignment */
     tcg_gen_andi_tl(addr, addr, ~3);
 
-    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TE | MO_UL);
+    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index,
+                        mo_endian(dc) | MO_UL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
 
     if (arg->rd) {
@@ -864,7 +870,7 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -1018,7 +1024,7 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_atomic_cmpxchg_i32(tval, cpu_res_addr, cpu_res_val,
                                reg_for_write(dc, arg->rd),
-                               dc->mem_index, MO_TE | MO_UL);
+                               dc->mem_index, mo_endian(dc) | MO_UL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
 
-- 
2.45.2

