Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1273462lfg;
        Mon, 25 Jul 2022 22:03:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uc7NG2/BBUAvz6YHRwL3wsa18fTMmrzphm6RsKXp40KG/V/gUhdVacnI1mh3HXMmdunYwi
X-Received: by 2002:ac8:5f90:0:b0:31e:ec02:66c8 with SMTP id j16-20020ac85f90000000b0031eec0266c8mr12870302qta.535.1658811784804;
        Mon, 25 Jul 2022 22:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658811784; cv=none;
        d=google.com; s=arc-20160816;
        b=pYVaLGmdxDmq5PsV9w3KAseIodLkNzP8gBBeWsKu3na3JAav7bfHs7EF5vPElZTXMr
         FvPNOngJMOZqFm8Tzn/zAADUWqz38iFYKTwh3bR0NctDdHB0uRF61380bpdRUXps1mbO
         Qnvs9x7h80ZU2iQaPFSfKMJ/7MVgRPBw/+dNL538hEfSX0RE0Qpn3f/jXDWunmVSuxn1
         I633oQZ42wCTESu/9+/2y7LXvHK6ZlkhCWWkVe67JfH6W0f6iYjdndgYVXUCZkC+fqHL
         CxHAsIrWO1APQ6bM13W15BUvugHeJpqeVJ4Nj4sIKqxWR2vXsvHXhCPEBUMNQRyFXqbr
         2oRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OatbDfb8OZiVS/EC6Pruvn8YMZBaDKiiOdbOgCM6y6k=;
        b=YLW02ExYbGHnzdEwWdIyWmizE67p+o34oQICZ/o7oAA2Dx4Gf9G/Lp7jPQsKwueGRS
         /MVKoPsVeNqTSKjITO2Vv/tdXgIb2+IfINAaHXecR+vtPK1cYiX9W52C5gYtoL1fIeLC
         xIaz2yMc64g9N0HbJS2rRT8zGVDBCZL14TR05zR2rkw8u1vg+fcejuTTR8HMDaYY/cXB
         bUJ6FXoIJj5tk89bPromMXLhulIx6xtzeJ8q+vhbO4eWFNipneh098dcdXVCIX6WwJEA
         AHfH5l+4x6NLWer0DlvDRWpe4eHUETlIwnDBLBcVRE9eUUGtaMiNy19QpgIN2XhUPMJG
         fTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HCdqrgch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf14-20020a05622a400e00b0031f370cc5f3si3057020qtb.417.2022.07.25.22.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 22:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HCdqrgch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGCim-0000UK-Au
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 01:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeT-0006FS-HY
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeP-0002bG-1a
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:37 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gn8so508926pjb.0
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OatbDfb8OZiVS/EC6Pruvn8YMZBaDKiiOdbOgCM6y6k=;
 b=HCdqrgchgUOd3g2pbUDnDpfs2ZYFMf904EaV2rlbbNF7OOHQXcBER/snqvf8ZB2mru
 e/vwpoVMRqp5uc0z/HPogTL3D2C8/Z8XE1Os8N61sc0egVjkZ0x7VNp9nCmGrfOUCUMC
 fcoKS0nqXF0ylCrnpHjN6cjTc3aBRZ7+kqtXixx2XLHNXW+2+UqTd3qOmJvoL6WcJVmR
 HPnBxnyipp/VRtvqeGsUF8xjCtwl5p6FWLLyvfhlx8es3N/qEB332HhWMEqnSypC10JZ
 ySt65aeWkK/MPhtqRyQeXhY4PeA7Qxfnm63EuTSEmtg9YoPxMuijbwFeYEMg+2Ypo569
 tWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OatbDfb8OZiVS/EC6Pruvn8YMZBaDKiiOdbOgCM6y6k=;
 b=D9bgAqmwLDoGoXp7ciL5Tiba0ATe13tLOcijd4nGXbAjg0258MmXEcSwCbj1j5IyAU
 gzMBZlqINwBhw1zxL+2nUaO1cP2h5whP+KzsJe3pben4Ga7O4E01Vtv0J1d5fUdLukMK
 4l4lMfdDGsidhzRdhuP8Y1itpjtC4nZ7cH+kAvN4w1RgWoa8VmMz8G+ZzkAHx09+Te1a
 jScq2Gaecsrv2RUgJEYdCi5jrrHTz+99ZF1TMZrn8tjAODQMPQqgNyfGHB15zt6acEMS
 ctYBn0wjp5q59EQgShdrE2O6KBIj+fN08wHFbTbLpLE6sVOeB/GWOXjGBG4ZYUtcondD
 qOqg==
X-Gm-Message-State: AJIora/liYzb7QzTpamIPkd8q3Cka8uM3tsAtO32wQnWs2v38wAowQzO
 oanAKEQE9O5Haw6lVeeauespVQ==
X-Received: by 2002:a17:90a:2f25:b0:1f2:2bbd:f1c0 with SMTP id
 s34-20020a17090a2f2500b001f22bbdf1c0mr17684430pjd.71.1658811510543; 
 Mon, 25 Jul 2022 21:58:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Fix kvm probe of ID_AA64ZFR0
Date: Mon, 25 Jul 2022 21:58:25 -0700
Message-Id: <20220726045828.53697-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNrH2PydNxhq

Our probing of this SVE register was done within an incorrect
vCPU environment, so that the id register was always RAZ.

Changes for v2:
  * Include the commit text I forgot.
  * Fix svm thinko.


r~


Richard Henderson (3):
  target/arm: Use kvm_arm_sve_supported in kvm_arm_get_host_cpu_features
  target/arm: Set KVM_ARM_VCPU_SVE while probing the host
  target/arm: Move sve probe inside kvm >= 4.15 branch

 target/arm/kvm64.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

-- 
2.34.1

