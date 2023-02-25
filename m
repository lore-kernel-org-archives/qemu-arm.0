Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2641959ejc;
        Sat, 25 Feb 2023 01:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9G2/f7wHiZO7N2xBrC5FA5WcuU+sgViwRTIYfn6dEZwdmto78WHRHiVRRRbDDRePlV8Tj0
X-Received: by 2002:a05:6214:ac6:b0:570:ccb9:a4d0 with SMTP id g6-20020a0562140ac600b00570ccb9a4d0mr40391178qvi.16.1677317286501;
        Sat, 25 Feb 2023 01:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317286; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQfwcybcBKgkYbXDkC1uqlTAzKZH3eCxdr1XVACr8RX04zS6gN05gdMhmYghfzPv9Y
         io0AcSvvQdZ0PY3e6tsGacrkUuJs6j/B2HqQAD7NTPk+tiWR+oZZGGyKAONZOjdhpC0i
         QaCCAjP4Aqj/gmKRFq4EazdG8mowpdSYvFir+RBlbpJv+Ut679Xl9OeqAOADxLGlYULb
         hqiyUI02YPYVOlH7eYJItt/rL89tEqj5ExYiRmd9EFRyyj143QWmJdeatwmSm9eHfCNB
         Kbj/hMD8cRs0YlyV/Nzr/bHsovdXdvDPFCqOXKp50oY4mQrZhSmsWhqmlFR77G2aWehG
         tlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
        b=xk+N2gwOiFVYY/5/6HiJiZ897Kx2juOjIdufg+W3NqdupyP5gRaJi5IrFO+JIN5BMt
         JHDXXhq4BuWsXJR5TUpm6m8XH0waQxwsC1RiKecdXi+8V2GU24ecjaVQDUAplbHzJOq7
         dneJzBBA/7196h3Hn9z2+n9ChcFqME/Cs3ypqiIYAHAbeckVMNOmkziYlDePoXKvz9WI
         Qg4sY6IHeza1eisu3GECw2IX9sZ3+9IyuX81yluCAY3AyFYp/1czpUGxvE16qQ1VSOti
         q7b7QAtbTRiNpW5aJX5dSCy8YrMWRgFgRKOP8/J/hKMZedbW6p5pSaGTLQZNwaSUz0K5
         crFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SA6xZ6xD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a0b5c00b0073b9cead6f9si1346597qkg.76.2023.02.25.01.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SA6xZ6xD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqih-00059R-B3; Sat, 25 Feb 2023 04:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiN-00041b-M3
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:35 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiL-0002vl-3H
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:35 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l1so1440348pjt.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=SA6xZ6xDY7LrrHiX6kAU6EHasmZaRrIDcRGZtmrrS0HuSZUFwGjw7p8rG1iPT0cmjY
 OhyaZA56ypL8NS8KIZXqGXDIjEvkMS2oGdis9w547LCoqaL0QR9gSWghitNFoK2SK8VO
 G0/fxYsKrNtFWqMdOf0bPJ5DkWKw4MhlvRR+ND5yZBZOZq9+RaTa/BwtHTuC/gIP6xVD
 7WIBkJiAYUEGjE9bAS2MNh4j8MqxD9xe08D119ICiiIUuoW4yA+hh9+WkHmZgHossjZv
 I57oKjsfHCegVnHMsvJnbom/quZq62Jbx2fEenzfmZAyrQx6CINa2I17lTPH3G5w2Agw
 UrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=Q8cuFn9vUbUMDpbarm472eJkWIjbuHpYQ9wk66HTnMS2sU6wR/31kCbiQALV64xnLx
 OaA0MR1liH2SGIySUg2w3b2XW2KaazzcoswiuQbcZycuF3RehucK5e5gSMr7licOD7yr
 d0c3oyH+E5jgKCEt/zrrzacQQ3fWnUlZAdsRrh7oj0PvmgxctM/cf6PfkQq40kzD4L41
 ep/Cc2HtXvSntOwTWdfaBmIRjF0GFTyh8/9WX3FfmZcz/P1U3+82Do0gx0UX89FOoS+J
 3hrVQlobcy6W15hUM0uQsnMg4tBX0jZM5N0iIcY3fDReL6qlchVyAm0EJYBS6i/oFFN0
 8Btg==
X-Gm-Message-State: AO0yUKVXzGatbyiiA+7JMgtJh45uo/CHG9IszDrgcVY7z2+9/PdcNYgX
 ts2TtCgGDQ/TO9W4INdkE6am2grxtTElZelOm84=
X-Received: by 2002:a05:6a20:4da4:b0:cb:6f9c:166d with SMTP id
 gj36-20020a056a204da400b000cb6f9c166dmr16262190pzb.43.1677316772369; 
 Sat, 25 Feb 2023 01:19:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 46/76] target/mips: Drop tcg_temp_free from vr54xx_translate.c
Date: Fri, 24 Feb 2023 23:13:57 -1000
Message-Id: <20230225091427.1817156-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CVe/NgSfb62t

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1

