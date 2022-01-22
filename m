Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732438qvl;
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
X-Received: by 2002:a05:6000:2cc:: with SMTP id o12mr1369626wry.41.1642875894400;
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875894; cv=none;
        d=google.com; s=arc-20160816;
        b=TPWn3p6dyEF1dIe/mjn7ENyq/MDxjOOfikQlD1+r7rO219+7k4WVhKgs1xXdAd2EgB
         pZ9T0RH5DewJvXlgEbLlrsFY8erKQC+cVOR9wqSpmMrBoFC3rK13i1hxoE7Hxn5cAb4A
         PwKH3tM4UQTq7s8tenech/K4JZ1h6qMm9Y0z7bIZZ5Pjun3tdpHo0W0zBlgzjUTwmGmA
         ToedegXlS4khCblFrrE+itrStapz4rQAhh/VvSKGASr4HSdOEV3uzEGn2xUWDg3AwrzW
         tAZ8AJ7uW1Vhrtzjes4OX5zq+aAijfKJXkrDGjkSQgdIJYwySRrSKymA2B9Fhz9tZqnv
         wjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=43IFxuU/YGBMpyeQtij+KdO9QDh+O+m1Z7AVC7ByFvI=;
        b=GuxFe75OWBRasHs+l6oKgs/2IjoPdJTmt45bKXLntOulPJVg31PiOGKhSNYrnSbg36
         osymT/Rw02EZQdaqtr/84PGd4xBjCOYRCVMmcAjWg+yOA5u6a+AnBIpCl1lSBTuoA8QE
         4jNZIAGRIE5iWP50wFM4ZxUpq2n3ThyEkhk73Dii8Gm3KSZV9pDnrKkxLLo/8rJ5KvzS
         xHl5V3WcJ/A3RJJeLaxktEX6d/KcL5SSRK8RbQgmiyxoYhy70VOdKBJmDICTwgRLVEDI
         ZoGxtKRBRfNTlQguaSHwSvkCi4RdY7I6ziBKNk7mLDABSoQmMY/MlxpYZeOonxMSuCJg
         wT8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F676+Ro+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n32sor6357281wmr.17.2022.01.22.10.24.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F676+Ro+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=43IFxuU/YGBMpyeQtij+KdO9QDh+O+m1Z7AVC7ByFvI=;
        b=F676+Ro+KqESj+RvAEUztwiT0ZOh+NPLC29tSx0aYAElia9/8fUcbN9erhEyNtLpLy
         oaMQK9bvwt6+b3vhl+XkZbHEtN4IpEncdUeVzfrq9R4UOKOlWwzw3Y8uG7gbCeJjfL3l
         4Eg/Nbqr6dSSaZlxozaHyn+Q/GYSAYPifuTdcDF3o4iPq946Q5G7aSHsWH7SvnpnRjjl
         n2X+KhgHfq+jTy2GbfLWcuzUuH8ZWOpoUWqGejA9fpeEfgOQNO/uZOLf4B0XOmR43KdB
         ppVAqwVpYi1zfOEgi96l/IHS9+rgGLnB+/oylGmo1T2rc7SgbsUQOqcr2UPo3Z1C+/On
         kAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43IFxuU/YGBMpyeQtij+KdO9QDh+O+m1Z7AVC7ByFvI=;
        b=lNj1xjit7vLQ2VCm/spbGKzhHxVvUx3Hg7z4WyOPN2bkHgU/uhBYPvr8P6oMwoa6Mg
         GP2QWN2/c51CpgfHyp2Rp/9n5JrDekq3eG91fOO+yLdBN1ipBJFd0YxNoG771dZ6YLPQ
         XDR7wUqVtqYQKKuDh5pjbUAjxe7kCuMdxI+G2iznKyZy9iEs6VjA3VnLdKI60TmM5DS0
         pxeQkkpU39ERf0I4Xs5zZwHmij7cPgYgh4gNR/fPv0g3THHodPkEHxZSQA1GAQdSRB6J
         wa/dTKijLFNUy0d6DgJprNynB6JMHrYdb9NNitDncxwD2QkK4MadNf47tEOenGjaQrwn
         Lqeg==
X-Gm-Message-State: AOAM5305xZA18FdltfW/9VouboHQ+1ZKwCB5Mjhq6v11M0DA44BrEHLJ
	Qf8lMcykGtUezTvAJVxI6NP+VqtT
X-Google-Smtp-Source: ABdhPJzOeBuh4M+E89YNgUfkjiGjIKUfxbu28J1vwIt+EdWbDUiAFuQKDAf4XFeBVrjDxvVgbhuZuQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr5445178wmk.114.1642875894073;
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 11/14] hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for unimplemented registers
Date: Sat, 22 Jan 2022 18:24:41 +0000
Message-Id: <20220122182444.724087-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: x3fZuekXG6sz

The ITS has a bank of 8 GITS_BASER<n> registers, which allow the
guest to specify the base address of various data tables.  Each
register has a read-only type field indicating which table it is for
and a read-write field where the guest can write in the base address
(among other things).  We currently allow the guest to write the
writeable fields for all eight registers, even if the type field is 0
indicating "Unimplemented".  This means the guest can provoke QEMU
into asserting by writing an address into one of these unimplemented
base registers, which bypasses the "if (!value) continue" check in
extract_table_params() and lets us hit the assertion that the type
field is one of the permitted table types.

Prevent the assertion by not allowing the guest to write to the
unimplemented base registers. This means their value will remain 0
and extract_table_params() will ignore them.


Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b17f2631269..237198845d7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -929,6 +929,10 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
 
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             if (offset & 7) {
                 value <<= 32;
                 value &= ~GITS_BASER_RO_MASK;
@@ -1025,6 +1029,10 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          */
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             s->baser[index] &= GITS_BASER_RO_MASK;
             s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
         }
-- 
2.25.1
