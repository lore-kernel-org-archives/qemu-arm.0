Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2155154njk;
        Sun, 1 Dec 2024 07:18:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0Wvtr275BE13qfnKDQBOJ28UwSsVmzywtsMgA1hv96Ki1gG0JsyOinn0ZnYTkOLu0A7woDFidAd17Nw==@linaro.org
X-Google-Smtp-Source: AGHT+IGprDkteiUckiYt2ovHLwHtg2a0OlS+kx0GkKb02oDpM1v0ESvi5xlGVilvt0tBvwhEr8xX
X-Received: by 2002:a05:6214:194d:b0:6d8:a127:e744 with SMTP id 6a1803df08f44-6d8a127e8e8mr36792586d6.20.1733066295661;
        Sun, 01 Dec 2024 07:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066295; cv=none;
        d=google.com; s=arc-20240605;
        b=bzb9XFIKs9qlEvu50fyMKIhw5Il/stOgeNXyGL2NBXrdSSq6hnrYSaL6pQ9h+GNCPH
         S0fmLzyVv0wsRcUFTvB/3/4Ka9zD4/WINCsmxGWRKGATSadlw2kZ7k9QOc8xRuTDL/un
         9/VV/sw8a/3pRrBt2RBe38j1xrp5KbUhmLaXm5t+ZcSnqlb6L+CsHInUzT7Pv1PUexbx
         G9JKgMSMDZB5UVF8ec9v/YyNkczuoAA/Prt2/3rLe/q6TNCbnIfF/exA0f+o3Qgk4gPt
         0Li12nCPNDd1dhSkztb8D6wAXdBsx5eGan/7vX7lgYJ0UJ/wzIUnKiA4p1+l1fnPkWVz
         uAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fasd9IhA2SmNuJt0njre9SauhWKB0jfxt6O24qYfxCk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=hPIl3Xsy85t12rPzKNfj9VY4G/a3W6O4EOCFT+kICF1a70I83YbdwI3EdXJYW9OKtK
         INJ5y+YahEj083q41kAr3A6HF2Mo6H3PYP6xHJQ/yZJNCF/C5HeBsch0mlMlvEaRWJ8V
         2TVmNG5zMSKZVKWb/pcjxwEVMxCy/62rlMjS/7YJxvkNF8Ifv0ZhI9P6GdSPNYi9DiA/
         h5JqbEmaR/AfV1yZ7GfxNzcEQE/Ib+fRY+mLLGLd61MJA9Y3dN/ZmP8q1QnJjgl31N3S
         9tHP2C+2/6KyM3TCLmabgyrdgM1tKcWeoy8f/jeGbfCmvrJ97w4zNYcYiefT5WmEvZUM
         FtAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHRUrkLr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d884ea6a02si67316726d6.446.2024.12.01.07.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:18:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHRUrkLr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWe-0001BR-W0; Sun, 01 Dec 2024 10:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWa-00019L-P7
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:16 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWW-00041C-BD
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:14 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-71d3e506981so1348747a34.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065570; x=1733670370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fasd9IhA2SmNuJt0njre9SauhWKB0jfxt6O24qYfxCk=;
 b=SHRUrkLrw42cBjQBul9H/jSYbf/NpecH6R4+tCpB//MB7yh38IMtD5LpE1VzP4ulUl
 9TEQrLWb/tA9WchJbVOwIyyTS9Dlwxc567eCUK8EaKHyr12GG6XUTITjY2c4it1DCXuG
 vh+o/iTp4zKIG3tu+THsYXOwYkhLHeELLqDa0W/8xUB2YAE2zEs0zOy3vI0I+OJJNT4A
 0XmMgFxiX68rMwp1ZK9anDPq0kjLPz8D6gKaE1ca44OPxbZBQff9yT7iXTOrCKQXh4uE
 GhsUvveKpqf7K8Myv/cu+gsWMwlekwA6eORC1aAEwiRHpwN+Ogdg8rtqWZhahUC4nCka
 4dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065570; x=1733670370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fasd9IhA2SmNuJt0njre9SauhWKB0jfxt6O24qYfxCk=;
 b=VNQDEd24VAB0HJwf418BTLBnJkDMtkO06tsBlkfkKPI2vh0/ck5z8Vv+nCaXuGyz/p
 XEY9Shl0WqRHUFXkaIbwON17SbpcpejWsbw1a/jgnRQM5jSmzd46FD9gUia8FPA2sXS+
 Xfq/YRB8eTlsXaeqBYAgql1nEt8XlCmCXFL4SJitEzkXNrLOlPnCt61wnxiMTV0NSSwc
 mNhjxSmMcw56/k4RFu/9VnJ0XoJ/wGAXWL/s+UF21XMuPpWwrEG9Y1bMRFRss7UsVFoV
 NoC4J4EL3WMj5mqDx9h6kqCowaQjhXi92Vnhspfhlf+C0BxO1k0IZ6K8Ix1teUsCJGLg
 TJ5w==
X-Gm-Message-State: AOJu0YzRPPyEf7gGxu99R/IUKP8W+IWCUYZ6SlL86FXyzyH+Hs48ugmP
 14hVqUxLoMkVn9c5BwGHcW+at7VJ6tWg5k1J/VMYgV4veRO9tO6GuqzvrKVogYsxg+Y1Wjd2ljk
 RF38=
X-Gm-Gg: ASbGnctfkjJm8OrXMoMz8IdmW2sprC4ah1eZhVFqzZt2T1ZxK8UjrTDjl6Qs2N5ctol
 /fGa8VRRNBo7mDUveOaKj1qgqX5nEJ1aeAmLK+WpK9fmSfq/z1ty6Qfh4nj0jRPvAauTIZY53vQ
 VEso77wIfJt6ktDM6yGd4xMzsAt5qMs2cVS5BhAYfIq/suYF917BRpwC+nn8WurKUNnmNdP63o6
 7yvmovAUYOyqhZLCv8RXD+LpEIBPU2L8CHMWdGs4OtDLbPNd6z5ZplA05lQILLApGj0TY+rSYBj
 X5esvCRzXISyTdmMTA+NJ6MgJCjjbr42xzaz
X-Received: by 2002:a05:6830:3c04:b0:71a:8048:403c with SMTP id
 46e09a7af769-71d65cfa86cmr13670562a34.19.1733065569755; 
 Sun, 01 Dec 2024 07:06:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/67] target/arm: AArch64 decodetree conversion, final part
Date: Sun,  1 Dec 2024 09:04:59 -0600
Message-ID: <20241201150607.12812-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-TUID: QMakhKevf0Yp

Finish the conversion of all aarch64 instructions to decodetree.

r~

Richard Henderson (67):
  target/arm: Use ### to separate 3rd-level sections in a64.decode
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
 target/arm/tcg/translate.h      |   29 +
 target/arm/tcg/gengvec.c        |  355 ++
 target/arm/tcg/helper-a64.c     |  104 -
 target/arm/tcg/neon_helper.c    |  106 +-
 target/arm/tcg/translate-a64.c  | 5674 ++++++++++---------------------
 target/arm/tcg/translate-neon.c |  317 +-
 target/arm/tcg/translate-vfp.c  |    6 +-
 target/arm/tcg/vec_helper.c     |   65 +-
 target/arm/vfp_helper.c         |   16 +-
 target/arm/tcg/a64.decode       |  502 ++-
 12 files changed, 2874 insertions(+), 4350 deletions(-)

-- 
2.43.0

