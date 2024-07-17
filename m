Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp697124dlb;
        Tue, 16 Jul 2024 23:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkuxoN+ZoTxcM6TDQfxAtp76gNUEYTnZw+0sh/s4nhpTxXq3kn32Nwe58E3mdOM+GsELI/q17qMNAn+Z6vuVOqd9VUK+t0
X-Received: by 2002:a17:902:c943:b0:1fb:5a78:f76d with SMTP id d9443c01a7336-1fc4e6b8ec2mr4557965ad.63.1721196126588;
        Tue, 16 Jul 2024 23:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196126; cv=none;
        d=google.com; s=arc-20160816;
        b=e3gO09QI+NNgh9C5x1YsSIQmG94+z7AevhOzo5/gAaBoGV1irB7upt1mXM5vU1Dpp0
         yvrA1v7/Z0WxbdoQ8Xwru6JuuW14UC+244I70Be2NUBnztDPL4GFZ911AkzImn58mvBM
         CtkYXaDvSsJ+eAcToYzMRpV7wfXKmB61hyOJ8czgFiFvFmVidE8UMZEpA00WJkWA619A
         DfDI1HR4JbUBbvFDPMCZe9VJTXdZmIQSIfem8FOBRyfjlB/NTxA9sb4SxxOGxsAMtn7f
         th/aelAhUIm9Qs8yVdHNDzt1OumbOT5WmGJ63GEcQNOf6kWj6W99qu7weqbWJnC9injH
         4IWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+fHVJ4bchQHH074Xsji85kfYExDlNqpEjXJOFYCoInA=;
        fh=CQynw3nstxBRi9uzzNkTSeZKAnrSzmdTldTRwAJjcj0=;
        b=UzzI0r9cvj/FtYjIQpiAhfFLK/FIayM262ujDF/Xg1dCz68Z1mkvuyq7Hhzj49g8N0
         KvNL39k71uUDJnII3hmL1vMKIYYl0RY6O7li/qL8iFyU/P7ZQqQhJPSqK2gfGMLeTVRg
         oc8qFP942hf3fJjWCxy0v7AhPFUy/T36ZZw6kMiiFEI5oX0gkCYJUwFF+6nW5tSHi6nE
         hMEWKcBIxQxeTEmFy0Rn43NSkuyjq935gTN2yNaXF0McmnZ06mfIuNukjf4mJjpeLTZx
         TYzQvv13iq7QBc0iQHYTR23BOF6K0spDkX5ShXTWi2M6xt/1PHtw4quGcrSfcYoCMncM
         AatQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHQIVu3b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fc0ec4e151sor32032585ad.16.2024.07.16.23.02.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 23:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHQIVu3b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721196126; x=1721800926; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fHVJ4bchQHH074Xsji85kfYExDlNqpEjXJOFYCoInA=;
        b=VHQIVu3biMvfKEjNR/i5v7bPbWY9+jP/NJJxvVwAViUsblduTnP8Lx2Ym5Fxifer4X
         4PQcBBIu7fNVQioFtRZfqIEkG3kp9TB2xumAFPTebanXwPzfKy7Up9C/tSwOZV17/J4S
         kXY+33KHbXUqbfnUSHfTruYJ5Xgx8KSOSc4h43LSL/ae5DY9ZFG26TazH/DUMieiduJT
         D5Wo1BADq2SQcW/S/3FfbTzDdRcMzdqkmESoM0n3qS+uRZE47k500QOtH07eWzjyyFoj
         ktFn8yRUEGZPWdZcNlTLTmz5aDPFKaENhMB2QU17ICJldQgHUkAWFnB8pz8fgl+7+XMZ
         pchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196126; x=1721800926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fHVJ4bchQHH074Xsji85kfYExDlNqpEjXJOFYCoInA=;
        b=GxIrrLh2U8qnBA//hLAW10VqTm9yya6W10zj+sMUMgwxj3dgMIbL5pSdP+i+NYLg0d
         Lj353B3wYxH2t0zwfM1PMuUvO6KiF3q74p8tYZictrtGXAHnNf0Z6QNAv/4u/LcboFh7
         L1lsG8k2hp2X1kb/t3SRm9JmdA99c8Ue29U8M5hhq8rdqQroVoYhfIBS0ik/HpSUQnO0
         74ZqXIJqLK/0eb6JLgl3uwkFUgs8kcJ7eKLnVyv0xbY6kgWyTKsQP92mlm3insmw+xE3
         XSyB0ZzHD90aWKW+cYtg24yEUoDVhNFTn53O5KoEh8XNc0OGcDjGLpP5Izb4x2HeyoV+
         TWvw==
X-Forwarded-Encrypted: i=1; AJvYcCWtrFtWscs3oU6xh6Py52e0K53UCaCXImZMcSD9voIAi+oyntPUbYEM6KZKqkveeWa7wqPT5rwRJd66TfaAQPmrBvAqJ/zf
X-Gm-Message-State: AOJu0Ywdv1x8D997LJ3DjhBjSMed6lXwUgjnlgmfUq9k4yIV5qWgmZtJ
	9xrI4/s6vwZAgDMHsSo3ZvTg6WJczxharsh5W46lssaiXeBtxfYQM507iYaLgVJQ9A==
X-Google-Smtp-Source: AGHT+IHloEcoHmPyJTxsEy5PdELtfT0z9Q14b0Ns4Sth6QMQ8m/gEBxlZ+J1zx3QeyhT+X0/aZySeA==
X-Received: by 2002:a17:902:ec8a:b0:1fa:fc74:4c04 with SMTP id d9443c01a7336-1fc4e16d778mr5882285ad.35.1721196125858;
        Tue, 16 Jul 2024 23:02:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([203.56.128.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc27383sm68131575ad.140.2024.07.16.23.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:02:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org,
	Daniyal Khan <danikhan632@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/3] target/arm: Use FPST_F16 for SME FMOPA (widening)
Date: Wed, 17 Jul 2024 16:01:48 +1000
Message-ID: <20240717060149.204788-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060149.204788-1-richard.henderson@linaro.org>
References: <20240717060149.204788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NtUvHLK03K4A

This operation has float16 inputs and thus must use
the FZ16 control not the FZ control.

Cc: qemu-stable@nongnu.org
Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")
Reported-by: Daniyal Khan <danikhan632@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2374
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/translate-sme.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 46c7fce8b4..185a8a917b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -304,6 +304,7 @@ static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
 }
 
 static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            ARMFPStatusFlavour e_fpst,
                             gen_helper_gvec_5_ptr *fn)
 {
     int svl = streaming_vec_reg_size(s);
@@ -319,15 +320,18 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     zm = vec_full_reg_ptr(s, a->zm);
     pn = pred_full_reg_ptr(s, a->pn);
     pm = pred_full_reg_ptr(s, a->pm);
-    fpst = fpstatus_ptr(FPST_FPCR);
+    fpst = fpstatus_ptr(e_fpst);
 
     fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
     return true;
 }
 
-TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
-TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
-TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a,
+           MO_32, FPST_FPCR_F16, gen_helper_sme_fmopa_h)
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a,
+           MO_32, FPST_FPCR, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
+           MO_64, FPST_FPCR, gen_helper_sme_fmopa_d)
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.43.0
