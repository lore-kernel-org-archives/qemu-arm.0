Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955129lfg;
        Tue, 9 Mar 2021 08:21:08 -0800 (PST)
X-Received: by 2002:a05:6830:1bed:: with SMTP id k13mr8802704otb.265.1615306868143;
        Tue, 09 Mar 2021 08:21:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306868; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz1hUELYxG6awWpmdxIbW/WtvjHmur9tw1HqMpymdec4Uwhkr8naiECbrGW6kFMS88
         d2ZI4+O5rSJv/iOo2fkbwk30BmGvDTPLAFCjdyfpm8DyVyonLNLZzy77dEfbBOWvuYUj
         vfLQqc3IVbShbm3n8mYHriG3vPLgE7LSHQ2F/Jb3hcUJh7PGDoXvRKUgELCZnMsw71qn
         Hx8mhq3Eb5i674uVkib73oJGMoATZXKKPKG2/PYF/IjmqM67eOni5Lhpf4GeHQ4/J8d+
         GPCtFLv9rHvG4nYWWQ0FHxcSbn10FtrlQgX6e0gQqg7SJUETSC3Qv2bdetyBSg88Lezq
         HXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K7rOIpXmUiahZQykYscgkQbVm3sAJxgER+idBTOFlEo=;
        b=xuhO+OMufrqdItOmnDl41WjtoPDXXWUenEigWtrDEl4FvW84CuBBdC6R0vrO7Bq8c6
         WD5yiifNMnfKStLAzLSprh292a0MfAdsTn2DEWu8CKL4ijf9aq5YfCSt2rr5hA2VGdi2
         MEfnlO/WUQ17GNaBV048IwAx3G2YzuCIyfdnuKvjGq6aO1rtCdKLVFr3MX0lyvRpeYBe
         TW7yRJ/KdxiGmGJ3ZWn5bjPn2UF4hXMv51T/TpoFXwFcliLUiYSLyJ3EwlQF257wmZFv
         cEuFoFao5sF6zdDtCSGVRxn/H3A0Dtk7JsTWqiedF6MooAQczr2Wm6uOtHLj6PtIOuEQ
         rgMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kG0Ezhpv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a3sor4120390oie.90.2021.03.09.08.21.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kG0Ezhpv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K7rOIpXmUiahZQykYscgkQbVm3sAJxgER+idBTOFlEo=;
        b=kG0EzhpvRl6o9MWf329J/+5Xvf9lP3t/hnpnNbQA3goQxSgTY1KWTyxbGLwqeLFB5f
         f0lCBW+v+3lF/N+8lF6uJv3+IwO5dZ/BaBF1Sifpfl6xLxz4DWdKkmhzYYEQkwBEsPEN
         VLwCwl1ocvbrKgo8TzL3bz2IWi79VBOrKnVJLpgSAMCgUmnARQk+1VXOReR/frKoWZZP
         dRD3SKJiU5iUfHHdoU0nnvI7240XyXuBzylsHAiTLNu9ZZ4YCy0G48lhq0KYlX2rpBXt
         A1Bu3N+lvQG/L20dd4zPdjYomWRpDtiy5+B0YlB86JJwVRJ5OPsmO/aUGFkJOCajWFup
         rfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K7rOIpXmUiahZQykYscgkQbVm3sAJxgER+idBTOFlEo=;
        b=Npj4ssmx7vvc5gXvtQiSjl0lhZDpw9ryKUS+6VLfYMHOR6eUWWrvCmmLbGz7Fhr2Xp
         g6KvThIbzNlMotMi/GNQZRVaVt75A2P9eoumCbH8RDyW+5AwmXtdv+RukgzCkS7BAQ+S
         8oW0PdXGwGIKfomC3mAJGeRJs7QstFoablpn877yWrw1kU63kdgKcByXFn23p9/sP5h2
         zjSHu+5RzNzwxn+gWI13pNpM9Cjy8Q5PA1oWhL5dUfKZQYSdM/rwmGNrOZ+z0q5bxnmB
         ln849HYzkCwYHyxWULVuqvvUB3O815kXczP/B/TwxCQy/umugE9mn7otqTCU6YYNS+VX
         +YMg==
X-Gm-Message-State: AOAM532h9+pR5N7Xjpo4FJR7tKoa1U6WsbhN9jhxUClQd2ul8zNFV1rb
	Y/29ahIdyVtaR2nGm1/L+5hf2kiJBNjpyGIL4mo=
X-Google-Smtp-Source: ABdhPJyw+58Ib2Fe//ZnzrkDF/LLE+925+0fpKxmTByDNNN9lqoa9fWX1nRxXML1DTkTaTGrjJTibg==
X-Received: by 2002:aca:5bd7:: with SMTP id p206mr3460021oib.66.1615306867820;
        Tue, 09 Mar 2021 08:21:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 22/78] target/arm: Implement SVE2 bitwise shift and insert
Date: Tue,  9 Mar 2021 08:19:45 -0800
Message-Id: <20210309162041.23124-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ej8FmCGv/LrH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bd4d6f1a69..d41fbd9697 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6429,3 +6429,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1
