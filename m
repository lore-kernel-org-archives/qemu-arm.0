Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp647868lfo;
        Thu, 3 Mar 2022 03:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLJrA7WPStxWM0PJ1RQJsdWtGtkOQHhebMZa/EgV1Q5jfUUQUv5oKSOYitxgVbDtpHXe9x
X-Received: by 2002:a25:ca8d:0:b0:628:72f8:de1 with SMTP id a135-20020a25ca8d000000b0062872f80de1mr13873274ybg.38.1646307587800;
        Thu, 03 Mar 2022 03:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646307587; cv=none;
        d=google.com; s=arc-20160816;
        b=sztPU4Sdlpc9yNkQ9VkVu9Djs5c5lIyONoJooKqyHKQd4Awy2lZUfKvDWVxgOfBTfD
         9RFuIxIIzrnmTRLdknaUqT2cKcQvEV1o34EELYzjdwQG7A2B3zrzwFATvmha0icHwiqa
         X5b+wg8Dv19dt1XipY0WgRf33rr0vL4HGhsekVPKygS7IrOBo/sxsWcWrYsDsjJuGPtX
         340Kv1iqK3pcfkZjuJaksfzzCHrUuvoS9//AisVAWOmD7sVenANesASIOn5YE6Ga1Duk
         oYNZDu63NChgUULN59cYhltK8yVZiW7CkuhH3dzM0f8nnZVUvyfuo8guwfmaKxycnNb7
         snrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kzZ3UnapvP1S3VD/mo0MbUgpu+fKVMBCLOQlUz4+xMU=;
        b=N4D61ke3c+zwydZ0ZAH8wJvdzm72yXjqs4S/saS7XiF3VD2uLUpTerVXUiK6HMYMJM
         suI4gFm6NbDw7iDsjJ26f0da3+PsRn24ZZRQT/1OqcktL0UVj5psXDqzBkYvfWA/r1xy
         Jgq8OnFPsH/tvWw36XYXoMNAvCv3D3G7NGSy4Chky6E+tqJCgi2BTcboiTvrY9XH0nAB
         hPIAqljGN86+FLnkSJDCyRiEpFl1kwLxSNxumBxSqBoYXqjSnm5/9AWppAEcFyEskn99
         r5zHqsHZzIP5wiy70J/wHv0uTSqTYCLnjCL9CxSY5vnc80hxj1tc7J8tapvMiFkEINgT
         4veA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Imf4avL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135-20020a810e8d000000b002dc0b20f44csi1417591ywo.36.2022.03.03.03.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 03:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Imf4avL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPjoB-0005u9-8l
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 06:39:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmH-0002KW-EI
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: from [2a00:1450:4864:20::429] (port=44578
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmE-0006VB-Bz
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id u1so7338086wrg.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzZ3UnapvP1S3VD/mo0MbUgpu+fKVMBCLOQlUz4+xMU=;
 b=Imf4avL718XvaVUAWfQCH7UxPwAuVrpiEP53TuUo3OIl8au2RnmJI3CbT1eaFtyTna
 hNfw8itNLlWSW/82v88nYvxxjhSmFH44WZaOYU7WxtDK4uyVmxem7X5O0GasSzUbzArF
 k47SAQ2db16MTWPJ4yUSF0rLGwDjOSK4TmAYg/TSlcHphtv3cGJal1R2bGjX9TahLKB7
 veHXQN+iHyzm4pzoHPAUxh8vaOk2gZ2UH3Uz5a1dafmM6r5oGq7fc1oMBzVx+pAPriTW
 hZcoeVRYhCwJ99gSik0ZCTTYRRn7YwzaE2KKooT3/IdwvdMJrEOKNXs/ijoI4Q+q9+Qf
 7NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kzZ3UnapvP1S3VD/mo0MbUgpu+fKVMBCLOQlUz4+xMU=;
 b=cY9j3dBP2gobyfbs5wd2ehRQWiT+keCxNBDvn3hKJ+br9cuMVO9C3wbCUWJTYl+cQv
 0NxIZYIeBZUP6FvfIkAA6v9Ptd2Mf+qYtaCxB+Y1HVQVP10GsdvON1nrp03vi/yTgBmS
 GYWyN3p9kNNGEbyx7CHfsORt5CURr3KAvE1kJWOJ8rzN5aSIb8jqtrNp4l7AKcHAJxG+
 mwL1rhYb0MiZ2NBlnmzBFMjPMdv1a0dW5i17NEtzjB2kLBX8zyizPOfvvirEjqukHnUl
 YFrRbhGl5eE0bz+JT7hKpyWUTXdMgahEg/+vpk/sgDxqPjjbTvxmZc4roSZNxGwALph2
 2H8w==
X-Gm-Message-State: AOAM5315dW/4PEaEg5yR7OFpCEA28XWJAom1ya4UfPZY/EeggEzloXpD
 2eG+F5FUDl3nPgLyZcnHDBkfKQ==
X-Received: by 2002:a05:6000:16c8:b0:1ef:f880:79eb with SMTP id
 h8-20020a05600016c800b001eff88079ebmr11478319wrf.134.1646307464875; 
 Thu, 03 Mar 2022 03:37:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm10240093wmb.48.2022.03.03.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:37:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits
 are non-zero
Date: Thu,  3 Mar 2022 11:37:40 +0000
Message-Id: <20220303113741.2156877-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303113741.2156877-1-peter.maydell@linaro.org>
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oePW42aTOowa

For VLD1/VST1 (single element to one lane) we are only accessing one
register, and so the 'stride' is meaningless.  The bits that would
specify stride (insn bit [4] for size=1, bit [6] for size=2) are
specified to be zero in the encoding (which would correspond to a
stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
not.

We failed to make this check, which meant that we would incorrectly
handle some instruction patterns as loads or stores instead of
UNDEFing them. Enforce that stride == 1 for the nregs == 1 case.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/890
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 3854dd35163..072fdc1e6ee 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -657,6 +657,9 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     /* Catch the UNDEF cases. This is unavoidably a bit messy. */
     switch (nregs) {
     case 1:
+        if (a->stride != 1) {
+            return false;
+        }
         if (((a->align & (1 << a->size)) != 0) ||
             (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
-- 
2.25.1

