Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3437375njb;
        Tue, 10 Dec 2024 08:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVo/34vy8jm1ELdwe/rZHQiXXy2fn4ifa6Vks6j2ZtNMhAg8CEG0mv9muZLtqCbBlH7l/mpA7nvR9sRvw==@linaro.org
X-Google-Smtp-Source: AGHT+IHui9eaxcVgDa3KVA9bP+YtRgtqUD0kuvPKA8NuX6+zeR1ylkVzLM0WwSlEtoJwn5BUC2Za
X-Received: by 2002:a05:620a:2b93:b0:7b6:df08:3674 with SMTP id af79cd13be357-7b6df083708mr501380085a.59.1733847499542;
        Tue, 10 Dec 2024 08:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847499; cv=none;
        d=google.com; s=arc-20240605;
        b=OTp/19dhvBNtrHFwS4KUda/KgXwK+Rn/x4tsT91TAd7zTTEcrCxLuQ3ebZWeZ+Tk0J
         1uTlgYq/OkI3/oJc2Pado7sCTmw9ynJmGA0n89sp7iAk+vDXgIXER37Dp4Ydz3gA0Khk
         +/Dy5jnn+t2Ms1WNoc34Afi02BYTn0EtMezv6YkNxMJ0URX3vjbQskUqLCoH2NW7OEd0
         kOYwitMIbdhxm7KauwKbjmI/Wti6uCHiQGsewqA4rJUCD/HjpME5AJd3uKYoauamWEXv
         QvG40xwVleo5COWz9EuLxMUWQEQJU08Gox4HkAUkbyhVFORhGoKocfLbYylGGN6ff6fl
         XpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PyLVQvN/SswxDvNgDRjPnWQqQm43Ri2JxpixcdvW9EI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=USm7Nd03Ctbabva8Xc5nmxQjUprQJkI4tbIG5lMllZ3prD+16pxuGoStpgu9a7Bq6L
         +wlunFeHjU97Cfx8yQmCXp73H6+dSs3PkiDNt50Pf8suprOG1E09mTfNSQIU8HEkNCdN
         PH6tzJ6bwGIjtR83dbGBYM502P+BFoIsrnJWrU0Brm7GnvMkx8LY4p00iYrnU5PwJ6Gp
         ncaNb8xrSgiuiRfXUhID4TGOCbjFmLq0JyBplc+sYk55F9wX01PilT0m4/DaXza8AM2K
         aR1nB50NO+CuwjtGXqLlGpBHsG/mkHn0SY8eWt7mVq85Xgq5rsNMtvm5ma1a4zsWUZCS
         L7jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf0Fgzlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6db9b825bsi308355685a.642.2024.12.10.08.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf0Fgzlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2vt-0002OM-El; Tue, 10 Dec 2024 11:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vj-0002Nf-U0
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:49 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vg-0006Eu-Dw
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:47 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso5536283e87.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847462; x=1734452262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PyLVQvN/SswxDvNgDRjPnWQqQm43Ri2JxpixcdvW9EI=;
 b=kf0FgzlcqCfh/hcZxNQldAlJrUDkFqZ7Q9QyXAlh6BFZ1FkFfxWrLdmPqbdzigUDbd
 8thKVOjbbavCOxRdDfeAuKERaBFR85WnGXFVZZbMoWe/WZFyAP8BqtiJQ/QThol6QM5x
 mtyp5JrCa/PxlgnIZNB+VTN5lCsWjmfF/1MT8bG8OqNrORkAFpEZRY2MrOJJFy6DTOEw
 EFgyEq5KyKb3JMEIja7g60ec46YrdzVhXi6sK1WamYv2U0TMAd/Od9AyomyeIiSoizkS
 gTZmUy6aFtPz0CcywoLNDJO4pY0r1vT0kgzX/lVtNicxlsZNWdimbDelcqZcP/QXNoPa
 FtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847462; x=1734452262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PyLVQvN/SswxDvNgDRjPnWQqQm43Ri2JxpixcdvW9EI=;
 b=by+bGqjme9E1bLeT24iXkCG/DjbC9RCWqhlnkyOdZzMEEoUwHUWlcG8BdDiJm/RA76
 FYjVgSKnPxh8rg+M9yqEpxWLgx63eIeQatiNvDKycn6etKzdBca4+/i3RwAmqw20rrQ8
 gXNBMbON3BKuKqrtRdXTtjBp7t+gTtg91439vAJBVgE18gzeIUgeFyL5+QgTOjJPxa83
 DyxOua7Bp21v/F2EIGMfRJSelw6t0ifpgXxrXCwtksXStQkJRtn/8oi89nNwzvNlLpWk
 SLgSgSXArpaTq67aBJx2aX2ePIe+bIwDp7RtXOaeKgOD3uIlZIU6OJ1Ng82wPOPEnTRG
 0XLQ==
X-Gm-Message-State: AOJu0YxO+PaIlVWTlu2K0gzhLaHEOZHeM2cC/b0MRy+N5wZnWnEhDiQT
 Tcyqlww54NBhXQ9AMDE8+K0yA/LSGbRM9I7lGt5pK4RjRSj2G9s6rPaEvE/AHDw=
X-Gm-Gg: ASbGncuAzQfWfRpz0xDjYlBu4xurkqVsQsr0y1IZHZhWUG5hI47pX1a/cCmbasrRg0p
 hn2/FlgdxsBtWxnBKuyThtivY0yOOC2nKBY/jfdZ5U2Q8dNPyB8bvge2I3KYvbreuj8DT6naHqS
 Jl2tNOYQra+E+QN1AbZRKIvYyh+nv7LQKof/GR1oeUIrX90KsRB2Pm06vNze4LJUjUKBgjrEv9F
 pRTdiA71hPd8HR5h5yBbVpvJVChk8UeidcI5+Ln6cOHw4hMvPAzi2jHGA4=
X-Received: by 2002:a05:6512:39ca:b0:540:228d:b8e3 with SMTP id
 2adb3069b0e04-5402410f377mr2099162e87.44.1733847462335; 
 Tue, 10 Dec 2024 08:17:42 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:17:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/69] target/arm: AArch64 decodetree conversion, final part
Date: Tue, 10 Dec 2024 10:16:24 -0600
Message-ID: <20241210161733.1830573-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: kqhM1APsPsf3

Finish the conversion of all aarch64 instructions to decodetree.

Changes for v2:
  - Apply review nits as appropriate.
  - Split out gen_gvec_fabs, gen_gvec_fneg and share with a32 neon.

Patches lacking review:
  23-target-arm-Fix-decode-of-fp16-vector-fabs-fneg.patch
  24-target-arm-Convert-FMOV-FABS-FNEG-scalar-to-decod.patch
  29-target-arm-Convert-BFCVT-to-decodetree.patch
  43-target-arm-Convert-handle_rev-to-decodetree.patch
  53-target-arm-Implement-gen_gvec_fabs-gen_gvec_fneg.patch
  57-target-arm-Convert-FCVT-vector-integer-scalar-to-.patch
  58-target-arm-Convert-FCVT-vector-fixed-point-scalar.patch
  60-target-arm-Convert-US-CVTF-vector-fixed-point-sca.patch
  62-target-arm-Convert-US-CVTF-vector-to-decodetree.patch
  63-target-arm-Convert-FCVTZ-SU-vector-fixed-point-to.patch
  64-target-arm-Convert-FCVT-vector-integer-to-decodet.patch
  67-target-arm-Introduce-gen_gvec_urecpe-gen_gvec_urs.patch
  68-target-arm-Convert-URECPE-and-URSQRTE-to-decodetr.patch


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
  target/arm: Fix decode of fp16 vector fabs, fneg
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

