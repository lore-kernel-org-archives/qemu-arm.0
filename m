Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5539429lfc;
        Thu, 29 Jul 2021 04:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Ve0lCgZaMZvN+DUk769Koh0WDWcilh0x0ed3As0Og4eR5rXx+3r34c2NPhgsJeHNKjZq
X-Received: by 2002:a25:6e45:: with SMTP id j66mr5966367ybc.449.1627557540066;
        Thu, 29 Jul 2021 04:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557540; cv=none;
        d=google.com; s=arc-20160816;
        b=Nbx+wqm8o052dHBzM1TxxxS9Fs0g5Dv5OLHU9vPtwBDwbWcZ51fEwp5xCAp75GKMcD
         vqJWftt3CITYhHpIysP1DjT3fruu0dseV05Gbu7OxkOpovqn9Sgxz7Y6C/ciruid/xZ/
         Tn9Dy71zo3lQyWjscYUOB8B6+1D6Ydse5Pk52ACl4QMwS3gbMex+88idPzbkvoFp1o4u
         DfBomLZEhvADP+0bxgXtoy6xNJVZBGNbdT7nOhdr2hZTHAA4f8Ebz8WQVyRIZ5hjeY/L
         iarDz7Uhz3EtTvbcWBP4hNGIYb5IS3VRHnwlupYduSHad+m/5c2poIq0KRfjzt5qY/eQ
         geXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
        b=h0X+kyT9mGpWFv1GDO8Kwmgiqh6DMH3qWtrV98oYbS4bkp9XIs69ohSi9/bX6uG4sc
         dsP1hlGr4sCZ5NPM3TPhW2U1rNh036uSTYPWt4zIASFDN5/FsecKsddoFMToQGZAKkEo
         o9ztpnz0SlkUCm/IK+H/n2v5BgZgvUBmRQzzAW0Qgy1BFYXJb1AKAGjbIq1QTHHzPoZl
         lOI5FooqH0oHywnpaGuJUK/wCak6/O9mR0sShxdRPXotes711n6Jzk05Nk76zqwxCnfV
         RJQNbRlP5zQDC05t5qqTBOHEhryuTQZU1eQSVjASvWi95KjR+TWCfWAqVjjN0KV0J0gN
         PN4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDH0Ozfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19si2295318ybb.353.2021.07.29.04.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDH0Ozfz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9443-0006fE-G1
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940b-0008Ue-36
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940T-0000tn-B6
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id u15so3475285wmj.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=hDH0OzfzKq/VoVFYYOvBUXnPy++Usa1W6fy+pMV0Imgoj78x9wg2A2Fi4GCoCSwipp
 8Vjmvpo+ph2j9j48N02yAKldrw+BsCtikUM5F4Y4oascaUMAvEmfUQgMvRXraRAVZgpw
 NQHcWbs7+EpSIs3g65sS9IpsYMypzmiBcnssFE/tBKZPEE6LhjGsWpkg2OSdZVC0SiJr
 6rhWV7psFd8iPy4/YxUwTmwtGc+mN1HnOthjWoinJk9Wvn1TfakKpO1oU5O7ptD6Pd+E
 4asIti0LvSVtlTzWDowu5Eqhcg6eR6r/uONnm46bxiiqTK3gK4RfhizhVRc3j0BRjiiZ
 NUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=NTcjUDPjDzrmFdu6YTa9Or/ln5YAAXLauDzVz6xQWJozs5ljfzb3UYm/XbTVKtR3jm
 bI0/mj7ZSM4lTiRKxVoqfh6t/agl68ID+GemKms+OwVHjl3cXAR3Ha5njKz69U2VfPsP
 NselojjDuUy8pQ+/C7qYQAzKhM/O+CsVhf2xt0/InQDq9LLPupxoe0XJFegJEZ6xAAzC
 R+kKyvtFuWmKgfBn5XXvTKY6UplvqEkpWD/RkX5RGjEUeLdtVnuHKQxDoPZSwLih4omV
 rdogxOY6l3CD3Iron8VpC6J557EsOf6kblhUOxjo3oeu999QT3nn1w6ExmOcXK5sLSS9
 FNTg==
X-Gm-Message-State: AOAM531DWwszo9XmMvfyP7aQQa0Hl7KusHGKAqkLFEYk/Kcm0XBfmo6C
 AbkwsV7ZkWZRJIJDFYibZ7VMQqGGEk2T7A==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr14015548wmc.111.1627557315734; 
 Thu, 29 Jul 2021 04:15:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/53] target/arm: Note that we handle VMOVL as a
 special case of VSHLL
Date: Thu, 29 Jul 2021 12:14:20 +0100
Message-Id: <20210729111512.16541-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OeHq/FeMIeV3

Although the architecture doesn't define it as an alias, VMOVL
(vector move long) is encoded as a VSHLL with a zero shift.
Add a comment in the decode file noting that we handle VMOVL
as part of VSHLL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 595d97568eb..fa9d921f933 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -364,6 +364,8 @@ VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
 
 # VSHLL T1 encoding; the T2 VSHLL encoding is elsewhere in this file
+# Note that VMOVL is encoded as "VSHLL with a zero shift count"; we
+# implement it that way rather than special-casing it in the decode.
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_b
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_h
 
-- 
2.20.1

