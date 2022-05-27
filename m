Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1249343lfh;
        Fri, 27 May 2022 12:45:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFsT/5AQyLAyAeCKlhmf8BfTF6U/Y7qci/U7O/JlCQwuhTGDq47nVt4MdJlDHzW6CbJkX8
X-Received: by 2002:ad4:5b85:0:b0:461:f4ee:4663 with SMTP id 5-20020ad45b85000000b00461f4ee4663mr36218535qvp.21.1653680727719;
        Fri, 27 May 2022 12:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680727; cv=none;
        d=google.com; s=arc-20160816;
        b=Owf4RMs+NZph63AtKyVGTpAND4mNOTcGY09Su4lOmJvAfB+yyaMx/7ki6SMCJuZmgC
         27YUN+Y7znR9tkcXDDkiDJjfR0+IVzFgMKkgHufCXTW0W2sNFVsGvJcyysxODLj8Qqo7
         JOZMikvLXyBb1Q7e5EmT9McrzkG90leELk6eh0//QKdsYjJS7dh9X3mRP6HeNDuNuDad
         lo/pEVq3WgsyLWioHaLJlSPlyPoCI82p0/yMG4a2nMEDI5dbAUpiJl4g/nB89coffF9A
         IVWXxvhF0aKVQ1ee0jK98QldFh94VB531UygjfC5LyW04jOeBuqcT1e/3vC+74UnOt4y
         +xMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EiogioAB3TjwchGB3KXofSrjeGdMHkYpRSGaufEwY50=;
        b=g36bhiGjUtDiJhXKJNjbbNg8rBP8fyXkyxLVh7ADar+8gaDuHRaO7SDk9YaeEqhos0
         Omn0hOSwt2IhUYvCLHbTtRvqCu3Q139iR65P0cj/FZtSmT2aarv0WIGwIx6TL47cF0MF
         uoUc/Wr6FcbiflTJVPkXISlKnzg0DKK2kbv04it2YnuV4Jdvmu/CJEK/hcdoKdaiJtla
         k6z6usWPJvmbNeJZvV7S4+52FQgNVH81x6Bn0rl0uy2pjyW8sTbigczuXagJU3bnPGtT
         gqcbztYJL6tiJjM45DZ8lYPIt+nQuU2cm0NMOQFkM0eVdpFDVM3qEfeorhuA4529kdVa
         /mhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C9AZ/rfB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020aed2789000000b002f53104ea7esi2815512qtd.577.2022.05.27.12.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C9AZ/rfB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuftn-0007Ci-6A
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecN-0003eF-7P
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004LO-Ix
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id z11so5276760pjc.3
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EiogioAB3TjwchGB3KXofSrjeGdMHkYpRSGaufEwY50=;
 b=C9AZ/rfBlYqU/9Z+ODxIOi7+DYIuzhTPfEZK3mvTaaxQr1yV2NEP6tJrUmj9zyZvoI
 dulOKLhhyGiTCJqIsQMmg3L6vLvib9Wt3/oY79LUAkRs2H4zZO5FZsqCZaL50CGqL3+k
 tXNmnz5irG+udWX8fCiF2+Fb/IzB84n2v6Jp8+ZADxQFstATUqhP8Ca/HwSDqBlqKFEY
 hZ3tbAXvc8UcBCc4H6WZ5XPgeTfsiBva7ENNAyNCJvEJWrufWuEWgIu08ZqwFjx+qkNy
 9m/XsydvTH3oIcKG6TWudElH1gkVBm8DptSbuoKj3QvkEUtT0eqjdyPViCH0K/hTMkbp
 gCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiogioAB3TjwchGB3KXofSrjeGdMHkYpRSGaufEwY50=;
 b=S1kfgkcxQ/a1foQYXVq/bzgSEMujwRtxjdi2a7/yZV2l1e3xeZ6lLaWks0HXHL+5NO
 Ut5AF13ow5OX7sbNaYX3ocowtAwWJMItSDCNZUB8T6552aQm30rCn+wtOMQVjZK6RBEA
 qpCxfgDVyk0zKHg2e7JM4uy8sjiozN4t6HAw/Y594A6GyAQc7Fu6ZqTMTFNcxLpAp3zz
 i8b6UZYa2YdK+uIfQpRYNTCI8FzLpcbAynJLMSl3uvt2lZzdTyzGJKF675o0KjKYwCpj
 CdF1aBjUgU6XyyxdrK+EYgcA+FGED6zqkgS3rFmyg4g//jQnxs12PBp5KqZiNXntPxAL
 qtEA==
X-Gm-Message-State: AOAM530OejgkJfl6GRz46V4y1rynmoKhDzBAOyu0Ab/CIJwHhzz4K9+O
 6alJruPfqn9ZF21En8qWjnS23Ezzhd5hFA==
X-Received: by 2002:a17:903:240c:b0:153:c452:f282 with SMTP id
 e12-20020a170903240c00b00153c452f282mr42936042plo.88.1653675786241; 
 Fri, 27 May 2022 11:23:06 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 062/114] target/arm: Use TRANS_FEAT for do_clast_general
Date: Fri, 27 May 2022 11:18:15 -0700
Message-Id: <20220527181907.189259-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 5v8b5WFROYh3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21c2bd099d..f5453e99e1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2575,15 +2575,8 @@ static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, false);
-}
-
-static bool trans_CLASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_general(s, a, true);
-}
+TRANS_FEAT(CLASTA_r, aa64_sve, do_clast_general, a, false)
+TRANS_FEAT(CLASTB_r, aa64_sve, do_clast_general, a, true)
 
 /* Compute LAST for a scalar.  */
 static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
-- 
2.34.1

