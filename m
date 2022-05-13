Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp282948lfj;
        Fri, 13 May 2022 06:18:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjoLcYIcpmMkL1g7ntmLHPTKd6El7pDS0r0AgDW947x2N6dg0sZ00Im+UG6qdaf2hhhJyw
X-Received: by 2002:a05:620a:199f:b0:6a0:e45:e4c with SMTP id bm31-20020a05620a199f00b006a00e450e4cmr3583492qkb.327.1652447932381;
        Fri, 13 May 2022 06:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652447932; cv=none;
        d=google.com; s=arc-20160816;
        b=whXCwpyD+mbXN8FBn1NNya7cmylg0WshNQUWd7a4mUKWZwPfIRGOreg2z2pq1D/xD2
         f72r3MZBbhZqMe71gzj0V34YM9QmuWeT1d3JHtNJZq4mcTePQqVVaEPQ7LsRB/bPa5ts
         Zzx2Kj6GVMhjjKjGeKgR6JJJqjKXEAZczApEj9lE69h9j9jgyggqpW8x6haLJNIR5dyD
         gYbSPVrZZDYLDGV8i/ob0ZcNn6QJmNd9g3mAo+2ZhYbSD3/opU4cAZftQgXXkcSZENUk
         et2yFDh/ap4ueNrfnmSHSeAgbtVXvARC1QqwfUoyTQqd4GyHQE8J7JTzkkTjIFv1mdEv
         nzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=feuaJLzK8Nu4Ocx9M7NvKfkc0AdKMuwnoiZ0q+4fWpU=;
        b=xTAgUYnx0HYEkCGz4c8O49Olaey4ZlJHb8HMIYVIE1bobjmC9dyOsmkPwFeVB62GWv
         g4Q+pjufWNvaHAQQ8H4ZpIeFCOt5zF49OhoXuUtXdi1PPexQgJwax1ydNNTXvcFqUXi1
         FrLG248zi6sQ1I1IVZjlNQvC2K41fYVxcEpKYzAE16nxSfJJdCb8Z08LRXI9n9MFyQud
         NvMjNPffO/OqsAEvgvSb1m9xCgkuJ60Mg+h+bVmHMbvgFDVlQRhLtfqpsI6LZgSQwZmH
         cdS4SBFpzfSekwhiWeemK6UyLlLiVVWlqHpzKpeB7FrDYvjxhvGt83faUHHyW5L4g5SB
         cVDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfrY0RxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a0562141bc900b0045ac088d099si1524709qvc.240.2022.05.13.06.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 06:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfrY0RxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npVBz-0003R9-Sd
	for alex.bennee@linaro.org; Fri, 13 May 2022 09:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npVBL-0003PM-Co
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:18:14 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npVBF-00006a-HX
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:18:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 129so4806884wmz.0
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=feuaJLzK8Nu4Ocx9M7NvKfkc0AdKMuwnoiZ0q+4fWpU=;
 b=CfrY0RxFVyuIrsJ9H+K7xa6Bs3fzEPNVJHZUidGm5joI+rRehS9oLvEg2VDYfCA6L6
 s1ezTLVvFhjcokuOWEmPb65GbEZzf0f7p53JNYqUdHIqFNLyw5rFBg3jBpgyfnB22TCe
 0JVTLqg7KoymP+GjsTP5EBk1EbKtQ4N5A7dUlkjzJa2oSPC6gYuKE7TEuepiMEVpOPyq
 tFzLKiqoSXeMctDjrMSs1/xrEWgC246J3u813NvcoK7uKc3XiLYm1PWuKk9WOEXsPY9R
 pxfyuBld9cHHYMUB6Gq7p2F0N8NTPp1WiruIz+ZeJ1Nw/5ZuGL4aOcFQpk4KrOSmL4E7
 iJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=feuaJLzK8Nu4Ocx9M7NvKfkc0AdKMuwnoiZ0q+4fWpU=;
 b=Gtf6RJ4ApLXKGPk8AoHSV7OdHsGJuuIH1wpYgDUYR88IevcBtyKPKZH0ngafPymc1e
 r8ho4fdBiWOYa88+KJTp+AJjzo9MhRj2OoxGhFf1BEIvCJFHn1qFlsaSbwX0jISyNvML
 DGntVhSl5QZJPjrvIU7L/4kz9vEvJR5g+uRFTyESzbJT6c1k59JFpXkrvao3F46ZD84S
 QwgK0YOy+y6Pd0XTT3GmC9cKMDLwyVLNy7soLyKuaPeOgt2NNskHODEwLbOTmXDZ6pr7
 HhmOcrK9bE7bLV4IKD7F/acL0k4Kf226Np/k5hgryj9vu0v3Ic3VzBb8lB+K/+hxKrFP
 d43Q==
X-Gm-Message-State: AOAM533x6lSLs4Bq4m0gX45OZcoLGC+XYJJu5YnszDMMAt5ACoMI1rur
 5565r/1L6ZQWzyCPEbuG9u6l6ScpfgtANQ==
X-Received: by 2002:a7b:c93a:0:b0:394:2583:69fe with SMTP id
 h26-20020a7bc93a000000b00394258369femr4672716wml.29.1652447882970; 
 Fri, 13 May 2022 06:18:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfa74f000000b0020c5253d8e5sm2095914wrd.49.2022.05.13.06.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:18:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Date: Fri, 13 May 2022 14:18:01 +0100
Message-Id: <20220513131801.4082712-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: saRH2FTYZIWD

In commit 88ce6c6ee85d we switched from directly fishing the number
of breakpoints and watchpoints out of the ID register fields to
abstracting out functions to do this job, but we forgot to delete the
now-obsolete comment in define_debug_regs() about the relation
between the ID field value and the actual number of breakpoints and
watchpoints.  Delete the obsolete comment.

Reported-by: CHRIS HOWARD <cvz185@web.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd819195..3184fcb7797 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6529,7 +6529,6 @@ static void define_debug_regs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &dbgdidr);
     }
 
-    /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
     wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
-- 
2.25.1

