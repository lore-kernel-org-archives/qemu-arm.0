Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C8BCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usN82-0001Sq-Lj; Sat, 30 Aug 2025 11:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urtFr-0001pz-Vh
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:10:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1urtFp-00068C-96
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 03:10:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so10398685e9.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756451431; x=1757056231; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3SfAhpm2rDnUQTvWWcdJPIX/eqB0cKtOdaFTIpbozSI=;
 b=WXZ6hghWMVOIi8UnegCMloI/3g07ZVuidvm1TpT1p7/2nU5/AIkMPZrwuXBxMs2W5A
 rYvibrUxvpH+sVcrGZ2Jgucb5BSa0WqxpLmkK0IZSqBTARcBRYQGViC2ee6PfDRToQZt
 GG4hJgICwyx+ksyNKW0n0P+3bHuLxQC4/11MpUTIzeMSeliWY5VtNioyDLouZhQyleFO
 dirIuySpD99xReSP8Wl9XULcJOIwpsrWai8WSZRwNqNgd+Q9m5kWSkXiYwzTd85erAkO
 9ZUnZbm2tUiKzONb3VbuF49F0p5UOdM5gdhCxhCrNaONM3qyf6A70hwVC71X+4zTMec+
 Lswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756451431; x=1757056231;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SfAhpm2rDnUQTvWWcdJPIX/eqB0cKtOdaFTIpbozSI=;
 b=pdMFtGjb9GzWVp+xg1gNfuP0/qSskHT4G5ytKgWc1iJRT96Zi8XtjDTEyVwMBZkVQc
 A1TKtiiUZa8YUgd7uOvFt7UU5hSkp5iyhxt1hEje1jqpngvgXcFIr2TcJCiUYzhjn2wy
 ezPfkCkC8jxvnTlcHk4A4Z5KJPDmuJriu+rhNtMLKVjKeeoMN45oJ0TMuYhMyewfRZlT
 hkGvVXdOuO5HvgwWQGwkvqyDjNU0ABmQxJB7qCzaZLmy/hQhatMOurdW2qzoVIyJ0EO/
 BQOvr24WjfqMQCZjiicdQpe4MxBzZUINXZt4pxl8WUz/yQ5vRPtcXkbRP05SyGVPEEBi
 pvHg==
X-Gm-Message-State: AOJu0YxQXsTaUXu0nhyoKQXu2vm4BgiJs4Ru+6JHFXGzyPS2lcKankBV
 QP1UAbkCJ1wifIeNbSNMj6/mUH/5ULEYphfjd3f0TW++7HazDrtgiv0gb9CLruPbzNg=
X-Gm-Gg: ASbGnct3t1iiR6NZ03kKgFjqTgK4DrstZO8ErXMroh9R2UnmmBcuKWAFxVdv/KthZw1
 5ATw4mZVCYGDL7QSfIWcFcIYNMujQTShjCcOeO8w3PqTHmpqmDHOhdRNhxjhhjHvW1sm5Lct9Vz
 4j2sCWUK3VJPpamoEmY6KypFZu9ejpHyhWvYi/lgqbzuoI2p2ZtQUdo0dFNmcdj/vk3fQEw3BTM
 Pj6ILlOqFN8ToQR04utyjcqKDHjbp7Dgu2u+qzGksM/9N97flSuK8ARmOYpdRbqTw6ZNmuKYYfy
 8L2xRtYArZ9qUBq84MhvcNJMbmdGslJRqlIxjkkNt4s/dG6yXLiw2KA5gtSgCVtKYpj8BNx9bxP
 +t6cjceBMpdQI4Ej7ge0XCI6bmC2tMUCUQFvyr6rglfh341h+mfoZkbr9XG4/WAYhQ+tXuyCR
X-Google-Smtp-Source: AGHT+IFK36lwlKSoEmc63X8TbS19ARyne73+PWAs0EimtbmjP48i8m8qlcPegrqKpj8chbLFIK+oOg==
X-Received: by 2002:a05:6000:2005:b0:3cd:e7de:c51e with SMTP id
 ffacd0b85a97d-3cde7dec787mr3831520f8f.61.1756451430904; 
 Fri, 29 Aug 2025 00:10:30 -0700 (PDT)
Received: from meli-email.org (athedsl-4441256.home.otenet.gr.
 [79.129.180.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c93sm105638735e9.14.2025.08.29.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:10:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:09:59 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 13/61] target/arm: Restrict the scope of CPREG_FIELD32,
 CPREG_FIELD64
User-Agent: meli/0.8.12
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
 <20250827010453.4059782-18-richard.henderson@linaro.org>
In-Reply-To: <20250827010453.4059782-18-richard.henderson@linaro.org>
Message-ID: <t1qulh.2tel69iq06l3d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 27 Aug 2025 04:04, Richard Henderson <richard.henderson@linaro.org> wrote:
>Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> target/arm/cpregs.h |  9 ---------
> target/arm/helper.c | 12 ++++++++++++
> 2 files changed, 12 insertions(+), 9 deletions(-)
>
>diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
>index b610716c24..812fb1340a 100644
>--- a/target/arm/cpregs.h
>+++ b/target/arm/cpregs.h
>@@ -991,15 +991,6 @@ struct ARMCPRegInfo {
>     CPAccessFn *orig_accessfn;
> };
> 
>-/*
>- * Macros which are lvalues for the field in CPUARMState for the
>- * ARMCPRegInfo *ri.
>- */
>-#define CPREG_FIELD32(env, ri) \
>-    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
>-#define CPREG_FIELD64(env, ri) \
>-    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
>-
> void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs);
> void define_arm_cp_regs_len(ARMCPU *cpu, const ARMCPRegInfo *regs, size_t len);
> 
>diff --git a/target/arm/helper.c b/target/arm/helper.c
>index 35a176ea3b..3a9d8f0ddc 100644
>--- a/target/arm/helper.c
>+++ b/target/arm/helper.c
>@@ -51,6 +51,15 @@ int compare_u64(const void *a, const void *b)
>     return 0;
> }
> 
>+/*
>+ * Macros which are lvalues for the field in CPUARMState for the
>+ * ARMCPRegInfo *ri.
>+ */
>+#define CPREG_FIELD32(env, ri) \
>+    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
>+#define CPREG_FIELD64(env, ri) \
>+    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
>+
> uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
> {
>     assert(ri->fieldoffset);
>@@ -71,6 +80,9 @@ void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>     }
> }
> 
>+#undef CPREG_FIELD32
>+#undef CPREG_FIELD64
>+
> static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
> {
>     return (char *)env + ri->fieldoffset;
>-- 
>2.43.0
>
>

