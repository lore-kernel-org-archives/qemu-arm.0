Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp657109lfr;
        Fri, 16 Apr 2021 12:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwegHIp3W9E2+FziiQujE7BPbK+b7EzcIIHC+tk08FhSgPIjSMCciztFQV8EeeTaLWQYCi2
X-Received: by 2002:a05:6830:2105:: with SMTP id i5mr4917741otc.215.1618600332539;
        Fri, 16 Apr 2021 12:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600332; cv=none;
        d=google.com; s=arc-20160816;
        b=g43um/XtMKytIog72XNdF6yi+/x6OeaKZGUADqS0tVNRqJJ1dwuo9T/+H8lp8ggr+m
         KmFGTrv5OxJLpwarofTJeWlQ/FJt7O21HAx4bAgohn7qwiXeZE+S3UWtOodeSoPSQlj5
         Tqen26y9eBUlUcNIBKHKa4Ho9sc9l7X5ONS6LZYJ5AR74IAl5e7bBKaQrtOWkXxcbCux
         tg0+tkuaKPROsDATRNnvv+bzQIha8XRDLYYFJGxLpyQySY3C7SNCcsE9d7YegYBI9bao
         C47L1i0zYJFV3+3lFI37WvSCtdq5Evt6gLajbMEgg5IT2y7dKnoVGTk6I+icqRALfTIU
         fh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ltuTQwf3YJkQ09A/ilMOxMZEVgxXZ+bcwwZi4bHmuUg=;
        b=K4Leq6kPQjvp35P+9QZvLToM1NxNwsORbvGxFFfmMtarEsK5y2RdCCXol5Sms4CXL8
         utQq79iXRYsLYIpgnwwLHh45ybm1yNo1jtRIjhW77ev0aldCOwLE8ShH5pE1vEQdNvlh
         t4CMDjMrFk6x4BHX/FrEW4cGt4lyi8jWkvNXLNs1J4e/WE0ZNAoFBFXjNNzHdyn6ugfP
         oSeCUYR6XmmygtqjDTEmoGVTKpkDvLvXF0ZV5IjEIW0v8KGwV7+ETjY3IRXwt9ERsqin
         wUxT+sU/N0lVJRmkc0BTJw5XgZXJ4ANxCAEfnyfeXMsedlVBIfvlofKu9p3nGmYg38cb
         umAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnH5fpaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25si6657508oic.69.2021.04.16.12.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dnH5fpaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTsx-0000yn-Mz
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThl-0003pE-Ia
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0004NV-GI
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:37 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j7so10398437pgi.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltuTQwf3YJkQ09A/ilMOxMZEVgxXZ+bcwwZi4bHmuUg=;
 b=dnH5fpajtitNw3WFYD9LEBeUWDBw8hlrnvfVWArNxaQxStXftkCJLUzelaU2ufZziT
 t7VncRQ6Ps1wblUbqeaJnnw9oqkpCgJ3PeGqyYIo+IRp7C+xV0VMDjl0U49Arnogxl5f
 9Y+WcG7gdpVGMPJL0bhJ2P4x2VOQ/VApaJBh+HyuXQBK/GCuTjFGerUBYSfLC7WTelRF
 ofMXhwc9Eg/twkaF3l7eYF0bL8oUTTfKk4jP9P/8tb9DO1pmTPtYpRJTiqR8mze6asbR
 3QzeYi3Eg/4aiNyo2KEyQyyfJNkHt24YkFxPXxDbPANJuqpW+ymvf1j9ljAa95K5i2rm
 cPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltuTQwf3YJkQ09A/ilMOxMZEVgxXZ+bcwwZi4bHmuUg=;
 b=gbo+YnSt0X6JWvIGNtKdI0GSQEjnPi8Dlg3iYfp5x/Dz20/1pcDzLN6Z5ynJTsUISW
 bdMKxlE/P+fVQEVActTXctBGFW0n1GOH22EwWEgDcR/oYrVyfzwupa0Fpq7rkC+Y/OYx
 +tK8LV6AlbyPkAo6Yi/xCPbsooIdm1nqHfpvf6g2IHRx3H9VmEHpkT+cI9BPV+WHsRkF
 bFTX/1bzX3CTWOV1jBfEVFWGo4eVaC1islOBo+iP5n9Qi7kn7ypqaxL2WYo/f1pijeyv
 wZjjFySuGQWp2G0fVdyZtKJN4u5G/7wGu4kZ0XNxznf8GTrgPhCyWWbVeyaZicbjHxSD
 s1uQ==
X-Gm-Message-State: AOAM533knVjT+OY5chncEt0+vlkgORu86iZp5Q3Zfhv7ZMuySMFNM0MR
 vMtxPmvbW+lycRUhaT81I+/AVA==
X-Received: by 2002:aa7:989c:0:b029:253:a2c7:9b29 with SMTP id
 r28-20020aa7989c0000b0290253a2c79b29mr8994857pfl.39.1618599616406; 
 Fri, 16 Apr 2021 12:00:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/30] target/arm: Enforce alignment for LDM/STM
Date: Fri, 16 Apr 2021 11:59:45 -0700
Message-Id: <20210416185959.1520974-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRKFAQkhtChB

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 270b10f83a..1ddfce9dfe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1

