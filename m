Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp128077wrs;
        Tue, 20 Aug 2019 16:57:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4LpONZKU62APIQK+h+ywTd41o72eL3rhCFk0oXlfRKhJw3vWaX2j85aVR37MQVT82cL+z
X-Received: by 2002:a50:f00a:: with SMTP id r10mr33452755edl.273.1566345454240;
        Tue, 20 Aug 2019 16:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566345454; cv=none;
        d=google.com; s=arc-20160816;
        b=W07CDxR6c6wGQ/xuXioc4e5Cl1CMGq4oI4ush4sf/dcqYd77NsjHA6sRmvlqCiMl+L
         /P70W263LV1x+FCpLNkk1q10tBGEhv68KRcY0yNYStYV1LrmkKLaZ18QhYKxI36Uf/pE
         uSehSl1VVgdKsLKqYjyiKNSCKf6GH1o5XOpOkFICc6H+GIgb0Pqzb4oi6Got22+/EIBI
         xpB7jJMeTLfcZ+NWC/VbbZ3vb/5rx5Dq+yFJHRNDfl8NcW4nAcual0wef9V5e0kslqY5
         KhJIZiOand2l22u4zEB9gV97PZ2FL8+OP5+t2zLbcJoaOL2B2c3BZTU1gnx7t8dBBRyU
         1B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:openpgp
         :references:to:from:dkim-signature;
        bh=bqL6VVZsmBEz56sB/yNc1xn8GU2AW+BrfR4Xoq3SXQ4=;
        b=Pd5ryVisbLX9r7V6XxiStmGfnw0IafnTrVaTS/QvPyp8UrJXGThs2y8wnsOvX000oA
         Sn9J/Z3GDVO3kBw0lXtPvm1NDOxWAnCqBS66CYqYnVa67wAg/VgQmfnv2tf8St5vWds5
         O0GjDfUgntK27ORndBMTJgkQkr3ZtJ5zTFgTwsJGYhe6gOGv5KTU/KyJQ/s53QSIvDyT
         Ob76Bj/vh6ir79tZkvHWHXMrcnnqFs3KJrdL1hLT92hUOJqS3mqbK8qS9lqtyhGE2ipv
         HKztEaNFKeh3YQK7xlGjO6eaC8lDekppzIMglbPaOoyODfHUzeGObWaSFovzYjOMu9KJ
         oLsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A4zd9NlW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si9665604ejt.348.2019.08.20.16.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 16:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A4zd9NlW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0E0L-0008WK-82
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 19:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0Dxs-0005Vf-Q7
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 19:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0Dxr-0006kD-9U
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 19:55:00 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40502)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0Dxr-0006jH-1e
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 19:54:59 -0400
Received: by mail-pl1-x644.google.com with SMTP id h3so275178pls.7
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 16:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=bqL6VVZsmBEz56sB/yNc1xn8GU2AW+BrfR4Xoq3SXQ4=;
 b=A4zd9NlWvoMEvO2uju63ZcaopUUzK27bjZ14S+sLJDWlfNu0ZjnFPj/HJI307/ON4X
 FNxbLF89jRUnzPMvsIHPY74J0h16fGiStKHDa6yHFsV16brReKv/yJwOO3yqn5QmlvwY
 Z+ESLrBHPQqVUmY7FmdynIAdJhPfXO9JKAN2J+cZi4PBQAWf1nNEhnNrmoHqw1WMs4uh
 6p0H57On6ot8++GynVEmeQpe0fgXvPwiXq2mFVqrxoUKAI+kfluFgC8r6F+sdDeIlE+1
 l82TFC6BGIbiepinSh1QR23R78xXmCUtJRRYwmgXkIBKFUJkVY//nOA8NRLNrTPgsYR2
 xpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=bqL6VVZsmBEz56sB/yNc1xn8GU2AW+BrfR4Xoq3SXQ4=;
 b=oacCiYtT0M0ow/YoXtCsWgNl1MJo3etLs1mESFOLA0KPKarol7msVqPZhqzMyPiI0L
 cxeP73PfnvzQGoa0lmWd5qSODaEI9zl4CcV6MJwPWHgvZHGub95/ytIjDbjCi1qbY7iS
 hGneMGodOM8J598iejtbwxCwHFokV2siBeVATto6Zsen2e9QyCdCJ+cyFRxDPUVOtNgS
 wcpuYDSsApz9lvQ7+VpflZHWLSnnonT3v3iuAZgj33myBnGXqTuK9ZzZjXQ8NuRmAe8Q
 4TDYqAngcGQKzixHKMlto6gc0OasuJosU2wVU6Yph79TDYH80vX+mS7dZ2lGlY/MR7Xl
 vLFQ==
X-Gm-Message-State: APjAAAXzzSY7G92ywupKJZif8qn7nFmeoSOIvSpPLVKdLsiNjN2EeZns
 icsWmI3OX9KjzQA9LWQVkCVzcQ==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
 w13mr30403064plp.157.1566345297474; 
 Tue, 20 Aug 2019 16:54:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y13sm13721145pfb.48.2019.08.20.16.54.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 16:54:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20190820210720.18976-1-richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dacbea19-9692-0288-9b64-8500d0cf232a@linaro.org>
Date: Tue, 20 Aug 2019 16:54:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
Content-Type: multipart/mixed; boundary="------------5233F652544173C873D1DD62"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v5 00/17] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZsJPqnF9CwA

This is a multi-part message in MIME format.
--------------5233F652544173C873D1DD62
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 8/20/19 2:07 PM, Richard Henderson wrote:
> Changes since v4:
>   * Split patch 1 into 15 smaller patches.
>   * Cache the new DEBUG_TARGET_EL field.
>   * Split out m-profile hflags separately from a-profile 32-bit.
>   * Move around non-cached tb flags as well, avoiding repetitive
>     checks for m-profile or other mutually exclusive conditions.

Just after I posted this, I started rebasing my VHE patch set on top, and I
found that the new DEBUG_TARGET_EL field has used The Last Bit, so that I could
not add the one bit that I need for VHE.

However, while working on this patch set, I noticed that we have a lot of
unnecessary overlap between A- and M- profile in the TBFLAGs.  Thus point 4
above and the completely separate rebuild_hflags_m32().

If we rearrange things like the appended, then we recover 4 bits.

Thoughts?


r~

--------------5233F652544173C873D1DD62
Content-Type: text/x-patch;
 name="m-tbflag.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="m-tbflag.patch"

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 91a54662c3..0c2803baa1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3183,38 +3183,50 @@ FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
  */
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
 
-/* Bit usage when in AArch32 state: */
-FIELD(TBFLAG_A32, THUMB, 0, 1)          /* Not cached. */
-FIELD(TBFLAG_A32, VECLEN, 1, 3)         /* Not cached. */
-FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)      /* Not cached. */
+/*
+ * Bit usage when in AArch32 state, both A- and M-profile.
+ */
+FIELD(TBFLAG_AM32, CONDEXEC, 0, 8)      /* Not cached. */
+
+/*
+ * Bit usage when in AArch32 state, for A-profile only.
+ */
+FIELD(TBFLAG_A32, THUMB, 8, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VECLEN, 9, 3)         /* Not cached. */
+FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
 /*
  * We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime. This shares the same bits as
  * VECSTRIDE, which is OK as no XScale CPU has VFP.
  * Not cached, because VECLEN+VECSTRIDE are not cached.
  */
-FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
+FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
+FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
+FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
  * the secure or nonsecure bank of banked registers; note that this is not
  * the same thing as the current security state of the processor!
  */
-FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
-FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
-/* For M profile only, set if FPCCR.LSPACT is set */
-FIELD(TBFLAG_A32, LSPACT, 18, 1)        /* Not cached. */
-/* For M profile only, set if we must create a new FP context */
-FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1) /* Not cached. */
-/* For M profile only, set if FPCCR.S does not match current security state */
-FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1) /* Not cached. */
-/* For M profile only, Handler (ie not Thread) mode */
-FIELD(TBFLAG_A32, HANDLER, 21, 1)
-/* For M profile only, whether we should generate stack-limit checks */
-FIELD(TBFLAG_A32, STACKCHECK, 22, 1)
+FIELD(TBFLAG_A32, NS, 16, 1)
 
-/* Bit usage when in AArch64 state */
+/*
+ * Bit usage when in AArch32 state, for M-profile only.
+ */
+/* Set if FPCCR.LSPACT is set */
+FIELD(TBFLAG_M32, LSPACT, 8, 1)                  /* Not cached. */
+/* Set if we must create a new FP context */
+FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 9, 1)      /* Not cached. */
+/* Set if FPCCR.S does not match current security state */
+FIELD(TBFLAG_M32, FPCCR_S_WRONG, 10, 1)          /* Not cached. */
+/* Handler (ie not Thread) mode */
+FIELD(TBFLAG_A32, HANDLER, 11, 1)
+/* Whether we should generate stack-limit checks */
+FIELD(TBFLAG_A32, STACKCHECK, 12, 1)
+
+/*
+ * Bit usage when in AArch64 state
+ */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
 FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)

--------------5233F652544173C873D1DD62--
