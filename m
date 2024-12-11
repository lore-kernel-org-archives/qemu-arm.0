Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196735njb;
        Wed, 11 Dec 2024 08:42:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUHIttTZOzw1DRB5q9UnkmjevUGexUDy9jZh815wDDJX7bXLiqu3RCeBxRuI4dpHeODKncAP6EdM9MoA==@linaro.org
X-Google-Smtp-Source: AGHT+IFS6iBsGZtUrxxG6G+G/jBR/4mapmPDBVlSB02Kz/GwOhMx6QcptMsu+8YmguCTknDzFggs
X-Received: by 2002:a05:6102:4425:b0:4af:c519:4e86 with SMTP id ada2fe7eead31-4b2477676b0mr173580137.1.1733935337601;
        Wed, 11 Dec 2024 08:42:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935337; cv=none;
        d=google.com; s=arc-20240605;
        b=PssLanqcfIEWvF4GmfSwdO1okHupduOlgl3xRUpVg/5hSLtL5csrGvrTlRB2OzmoK5
         SK+/llmxMwyna7IYb00chiUnO2MbOdntl1DyGqebowCjP9nkxHRgWUrMS/XJ8tKdRUMX
         X/RTFudj4mztb6iAEYZQdm0LHAR1B1SgYh3+oDJDVSizkBJFG2NAPnL6EOIlY+3mvjI0
         jS7ttlFeGMCfFsoUcK6Y0e6nJgSmYevc1P3uTkRQdhRFcg6TScXEV4zKyV9uG1a8U2/P
         zsCdwusa3gu2ltyV7S2hIyMuy5p/KuDTnH+HyPXg5LqVVKGXfjMMU8YirIXrC5ba12OI
         jeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pq8nZT5Gnqwy8LaCbH8GMbC7AkzzD+F/2z9SWgAl6Cs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=iu64n2YKCGxCgPBtoyVMj2M23JqICXOEiNFoYGodcd3TMccOFwrCx+gOpL46/TglEN
         51epiaR11NxnSDc9BscuElYv7Jkod39jC7HXOJu3ZtmbTFJOvs5lfm1+7LI7U5DRXu5a
         6zbEUtTdBddNG0pWSH3YmUZVnU3IaEhAPYgcgKIC9no5W00cVi25m4KMXYhn7bfjL3Vt
         KDQlRj9PJgr5k+nrlmpGC/FwuRBV1zzyln99G/w391sJs/CKeWhDNykc7T5SwipkVjPQ
         JAk2G6Vm+o46OGuHsKcza4lmjs8Zyvh7Uyr2FhIBnqSRNOGgR6wWnhGqRfk8n08oXlCa
         A2uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zp1OFZlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afe2961f10si2235610137.432.2024.12.11.08.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zp1OFZlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPcC-0003Bn-7R; Wed, 11 Dec 2024 11:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPc7-0002oM-DM
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:03 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPc5-00017u-Ee
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:03 -0500
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4674c597f2eso24695341cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934660; x=1734539460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pq8nZT5Gnqwy8LaCbH8GMbC7AkzzD+F/2z9SWgAl6Cs=;
 b=Zp1OFZlzgu1L8GqbykEwR1Fww/9jFjoLA9eFyiQJow/J3YuiIoSrrR6EaCQAU9gA4R
 RUGFmaq2oeRjR8eT4V/NVS4mmyyOwRyYKcI0z0YQpUx5o+VEzOvKhxppb0d8pmuP//nS
 Vc2wTGG4+qzuny+DKDOxzI3ULJAPYXAKiE2pcenxGFxbMNNJi9rNAm3UIBIzqPprEVwi
 4hNBE7KlrcSqHGrW2turX2Bp2mtfr2iZdSE11E1yiuszQxZpNmwiw4QeH0zgWHnHsjCj
 RB6ZnWJI3K7Bn/Fa1Gm64T3xYLBanjKiv/89+a5PNt70l63JrwHQ43GCB8tMt2vf7pRt
 tqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934660; x=1734539460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pq8nZT5Gnqwy8LaCbH8GMbC7AkzzD+F/2z9SWgAl6Cs=;
 b=OEWCrqodpZxj/K8++v10AuQ9jlfLa5jzJxhnFkTPs/d/3/6+IQnFNwl2mR1voxb4kL
 4OEB4zdYS5X13H5I6IOST1bBidObpItuSoTXoDuE+7WRK4sWbhKsbizGct8kyBxDF8ak
 x4/UVhR3VlQct4Gt59mLW7NgaKb7hbfkOZrr0WO5IjVMZ7Hbt/m0WxlkTypCcEcU1fKm
 PMUY1m1wQMZcD92NslJxjtsCSF8qqBRp69oJkMqbgZheGA6WF9XvinhybEeoUE1aI3D3
 iozTSXuK3fHXK+0uDR5rmw8xQ/2K7PvhMmlFx93LrJQOwa7xJ7rmU6YRGSCVDt+27zpL
 KuLw==
X-Gm-Message-State: AOJu0YySh+B3+qSeCgiuMSnrDfdDASphjx9YLfXIKRT1CHXRk9zV00iu
 ixa55SR1Azw0V6IfkuRlxh5wLypCAoNFFrmDAaKn46+qshFjW68WzRdHvnabGNw=
X-Gm-Gg: ASbGncuFHf+Lx6kxhaaLFubuQWFDuVpCbnjhsanx7mq3bg2vt9X8zC33UvfqSFWw8US
 1cMpx1bvYLhZ6fBRmZDMCSlU2M+3HRPVdNEhoxCfeBtaYNlPhNiUx5vKZfX9HIwkrnSXPi5Fv+7
 T9kMvsFjuJZMxL/yddrg34ezXHIW6ieSVC+7RQ44SUMz2SkggbXudMaPCIhivOToNzIHakLluSj
 9zARB00Urrw49n+draXbqay8oG71It+jq0Mkr1607tBPDIOzC7N/ynkE5eflQ==
X-Received: by 2002:ac8:58cf:0:b0:462:b36a:73b8 with SMTP id
 d75a77b69052e-467953f4614mr5201761cf.43.1733934659857; 
 Wed, 11 Dec 2024 08:30:59 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:30:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/69] target/arm: AArch64 decodetree conversion, final part
Date: Wed, 11 Dec 2024 10:29:27 -0600
Message-ID: <20241211163036.2297116-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
X-TUID: l0j/WV7Me5wp

Finish the conversion of all aarch64 instructions to decodetree.

Changes for v3:
  - Fix decode for f16 fsqrt (vector) in patch 23, prior to conversion.
    This is the only patch without R-B.


r~


Richard Henderson (69):
  target/arm: Add section labels for "Data Processing (register)"
  target/arm: Convert UDIV, SDIV to decodetree
  target/arm: Convert LSLV, LSRV, ASRV, RORV to decodetree
  target/arm: Convert CRC32, CRC32C to decodetree
  target/arm: Convert SUBP, IRG, GMI to decodetree
  target/arm: Convert PACGA to decodetree
  target/arm: Convert RBIT, REV16, REV32, REV64 to decodetree
  target/arm: Convert CLZ, CLS to decodetree
  target/arm: Convert PAC[ID]*, AUT[ID]* to decodetree
  target/arm: Convert XPAC[ID] to decodetree
  target/arm: Convert disas_logic_reg to decodetree
  target/arm: Convert disas_add_sub_ext_reg to decodetree
  target/arm: Convert disas_add_sub_reg to decodetree
  target/arm: Convert disas_data_proc_3src to decodetree
  target/arm: Convert disas_adc_sbc to decodetree
  target/arm: Convert RMIF to decodetree
  target/arm: Convert SETF8, SETF16 to decodetree
  target/arm: Convert CCMP, CCMN to decodetree
  target/arm: Convert disas_cond_select to decodetree
  target/arm: Introduce fp_access_check_scalar_hsd
  target/arm: Introduce fp_access_check_vector_hsd
  target/arm: Convert FCMP, FCMPE, FCCMP, FCCMPE to decodetree
  target/arm: Fix decode of fp16 vector fabs, fneg, fsqrt
  target/arm: Convert FMOV, FABS, FNEG (scalar) to decodetree
  target/arm: Pass fpstatus to vfp_sqrt*
  target/arm: Remove helper_sqrt_f16
  target/arm: Convert FSQRT (scalar) to decodetree
  target/arm: Convert FRINT[NPMSAXI] (scalar) to decodetree
  target/arm: Convert BFCVT to decodetree
  target/arm: Convert FRINT{32,64}[ZX] (scalar) to decodetree
  target/arm: Convert FCVT (scalar) to decodetree
  target/arm: Convert handle_fpfpcvt to decodetree
  target/arm: Convert FJCVTZS to decodetree
  target/arm: Convert handle_fmov to decodetree
  target/arm: Convert SQABS, SQNEG to decodetree
  target/arm: Convert ABS, NEG to decodetree
  target/arm: Introduce gen_gvec_cls, gen_gvec_clz
  target/arm: Convert CLS, CLZ (vector) to decodetree
  target/arm: Introduce gen_gvec_cnt, gen_gvec_rbit
  target/arm: Convert CNT, NOT, RBIT (vector) to decodetree
  target/arm: Convert CMGT, CMGE, GMLT, GMLE, CMEQ (zero) to decodetree
  target/arm: Introduce gen_gvec_rev{16,32,64}
  target/arm: Convert handle_rev to decodetree
  target/arm: Move helper_neon_addlp_{s8,s16} to neon_helper.c
  target/arm: Introduce gen_gvec_{s,u}{add,ada}lp
  target/arm: Convert handle_2misc_pairwise to decodetree
  target/arm: Remove helper_neon_{add,sub}l_u{16,32}
  target/arm: Introduce clear_vec
  target/arm: Convert XTN, SQXTUN, SQXTN, UQXTN to decodetree
  target/arm: Convert FCVTN, BFCVTN to decodetree
  target/arm: Convert FCVTXN to decodetree
  target/arm: Convert SHLL to decodetree
  target/arm: Implement gen_gvec_fabs, gen_gvec_fneg
  target/arm: Convert FABS, FNEG (vector) to decodetree
  target/arm: Convert FSQRT (vector) to decodetree
  target/arm: Convert FRINT* (vector) to decodetree
  target/arm: Convert FCVT* (vector, integer) scalar to decodetree
  target/arm: Convert FCVT* (vector, fixed-point) scalar to decodetree
  target/arm: Convert [US]CVTF (vector, integer) scalar to decodetree
  target/arm: Convert [US]CVTF (vector, fixed-point) scalar to
    decodetree
  target/arm: Rename helper_gvec_vcvt_[hf][su] with _rz
  target/arm: Convert [US]CVTF (vector) to decodetree
  target/arm: Convert FCVTZ[SU] (vector, fixed-point) to decodetree
  target/arm: Convert FCVT* (vector, integer) to decodetree
  target/arm: Convert handle_2misc_fcmp_zero to decodetree
  target/arm: Convert FRECPE, FRECPX, FRSQRTE to decodetree
  target/arm: Introduce gen_gvec_urecpe, gen_gvec_ursqrte
  target/arm: Convert URECPE and URSQRTE to decodetree
  target/arm: Convert FCVTL to decodetree

 target/arm/helper.h             |   43 +-
 target/arm/tcg/helper-a64.h     |    7 -
 target/arm/tcg/translate.h      |   35 +
 target/arm/tcg/gengvec.c        |  369 ++
 target/arm/tcg/helper-a64.c     |  104 -
 target/arm/tcg/neon_helper.c    |  106 +-
 target/arm/tcg/translate-a64.c  | 5670 ++++++++++---------------------
 target/arm/tcg/translate-neon.c |  337 +-
 target/arm/tcg/translate-vfp.c  |    6 +-
 target/arm/tcg/vec_helper.c     |   65 +-
 target/arm/vfp_helper.c         |   16 +-
 target/arm/tcg/a64.decode       |  502 ++-
 12 files changed, 2888 insertions(+), 4372 deletions(-)

-- 
2.43.0

