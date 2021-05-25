Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4050396lfm;
        Mon, 24 May 2021 19:05:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmjUQDwraiRzdbKiHFDtCuqe2h8yA911FatjKSgaa+Sbk7z4u5HfGigswYOq/v+m1e4ip8
X-Received: by 2002:ab0:7844:: with SMTP id y4mr22753923uaq.46.1621908336343;
        Mon, 24 May 2021 19:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908336; cv=none;
        d=google.com; s=arc-20160816;
        b=WGxBaCOxZk/n/f1SKB8s2xtQBZ9WyWN45X9onBrG3U5W2IPmt9LOxY4bBe4zWLvdI5
         vDVyLe290rSIBIw2qNeOKwtp/2tSRmprOqDbtH8JjgMlsVrvgBkxoiiK9VLMYhLRNk+u
         Dq26uQALAXkkV7YZXmijxHBrbXvM8DIXqHdQwsD1cHs1WoISt/YvQrtOvzjaTsPyqc5y
         in5o+PUZwa3pMXmXzZjcc3KteRaamiNKQshO0ciT/3/6FBaJD1UDFlTXGy4R+1iE6jND
         WallqRIUNupKm1OjrEJYRsfMVgKiawywJ264dX/fMeH2NfVpeRc0nOyqNMTsfJMbTlZv
         iPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XfuBVEtxztdNyxE+FEFKor3ofjnQkROtvEMf4bpqF2k=;
        b=a7uJaj7DJTjVI+jTftxPXnTh0vCbX0zKNFb9cwojioAtQDYFBfyijyUXkuf7CN17G0
         bWijLnWxhmm6s8vDF8KA1b/RTfz7057swKq6g+ky/7TXZFfN0hR4XE5OzrT5b/Cid2bH
         xKYGVe0npRS2tfgWAKsCuN/Jyj3P52qW5eY7tl4SHkXsNlbMjaShML2NE+ScRIJf/nVE
         soV1sLsP/AUxC+i0FUOG0IC/0jsnFWwcvXUzPFEHqWHrou8bXx1jtpq+/BToVTMIuV2i
         GewRdRACMZAwfS1SFSheAnMd7XgDP5aDreYe+an1NhJYvuWxa7AXoIxGTRQlOvZp4xPC
         HS3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CepxoKyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si3033186vsl.255.2021.05.24.19.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CepxoKyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMRr-0006vS-Jf
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb6-0006Do-60
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLax-0005sz-Kg
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:03 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e22so5670721pgv.10
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfuBVEtxztdNyxE+FEFKor3ofjnQkROtvEMf4bpqF2k=;
 b=CepxoKyW+bc5yvYR605Ifa14nsZh0kF7JUKziiPrUzh2mNI3ZOzDXLx6UVXu46SU5j
 ZfQwLO0ntxd9QIprRG0V1KZThCpOOJySDnUHnjd9gOji/6d1ew3aJkaJKhJjEV6X9ATl
 B4Z5HKuVYigGfUNafIuCfwzanTYS07RD2tGIRZ9bvH7JVzz3aeSj7gjKP9q8P5rsD0CN
 3LXCLsVfRcVU5PrO4EUiiQFtcaodRQPfA34JjMLHYdX0E8HrO6/2FzEXW6ElzH820Emn
 PgXNzMZvuWJF40eUPrN/TA/V/yQKMjz6XFUdmSZbDgGgxkWwz3WVzobAKyMhYWlQuebM
 au+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfuBVEtxztdNyxE+FEFKor3ofjnQkROtvEMf4bpqF2k=;
 b=Rh7ec3R+mvSpYyJ2Jwe8FZ7BKqOxZP0WKJAkBKEfMhFLLBnW/m+jx1zxDRuCUIwmwI
 Zke460jQMxq25h2oqUzQRESR0JQM4Pzr/TECL8sH+XDNQ6YzJY1oN62gTK0F13/oJ6fQ
 dZw8cJXhpt2jHf5WEWNm5LpzT2QQbxuuQGJeoMhN1jOnLP+5Dld9LB0jcQZDRbCqlqT0
 b3/K41myGh/kP57+iPam1Jjcjl472+HcOFnTJvo7T5/pavhPmd3F43DF0Q50zqZYHdbI
 UVj1Yjp+RLHxc1gTwGM1LmtUbMmVL6Z8iCz42SDH78sbYraMb3hftaF1bEC6BfI2Urh+
 BbkQ==
X-Gm-Message-State: AOAM533Me8GK3SD0ZL8zzFf/c+SKLOpAQXqiDkSJBJqHRbPP2b6V5ecN
 GGSdK2JClPBJ+zvVR4VfowCB+w==
X-Received: by 2002:a65:67d5:: with SMTP id b21mr16149681pgs.117.1621905053154; 
 Mon, 24 May 2021 18:10:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 86/92] target/arm: Fix decode for VDOT (indexed)
Date: Mon, 24 May 2021 18:03:52 -0700
Message-Id: <20210525010358.152808-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hpJ9+fXgk4g

We were extracting the M register twice, once incorrectly
as M:vm and once correctly as rm.  Remove the incorrect
name and remove the incorrect decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode | 4 ++--
 target/arm/translate-neon.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index ca0c699072..facb621450 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -61,8 +61,8 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
-               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 14a9d0d4d3..9f7a88aab1 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -348,7 +348,7 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     opr_sz = (1 + a->q) * 8;
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->rm),
+                       vfp_reg_offset(1, a->vm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
     return true;
-- 
2.25.1

