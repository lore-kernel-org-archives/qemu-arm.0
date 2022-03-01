Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209787lfo;
        Tue, 1 Mar 2022 14:00:13 -0800 (PST)
X-Received: by 2002:a17:902:cf04:b0:14d:79fd:a2c9 with SMTP id i4-20020a170902cf0400b0014d79fda2c9mr27775675plg.104.1646172013220;
        Tue, 01 Mar 2022 14:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172013; cv=none;
        d=google.com; s=arc-20160816;
        b=m7cLASpeaMKFq+ceMkJoUAyK1hUyOwUMnVYYOmFe8daMxin0BCOnMa6LZrRBtkO6hg
         /febZ2Yn0MAFr1HEpUEuac7RZoZBx4uGsMKZFKXJp6xJFjeC6w1t5UapizW9WJqD/A6C
         tXF6HOoVRoc3+s1giOCMRcxr0/UoudDcEKiAFyU+3zon5kPApsaVMoSNBM2FrVnT1V7g
         ubIULj3oSzHqXXPamqjE5QRGRWxRz5AFKY0VedVj0QKFcrw1xvm0nQA4WY05B+1Pto6N
         hqav7I1DvSbw43Ypj37Y8SyYqL5bCBKiOX+P09+WtBCPQBAJBbGdg42+UmDP+8/g65Gx
         RHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=Am6DC+GjaTycvaCvWvT25Pj4csekMdb5vW0SJHG6N4za8X+1U3reZzPLgzaQdom3UA
         vEV/tsbzqxJJeqJC82Tbxszga/CEAgYzU5QCGpj4QZQSPKSSSET70FMj6wshOWSwvhha
         re0XgN2Fe1MVYn1jJVMDbymvmm12LyETv01kAvjgecPh22INYfiCNI/fpOHsIlRoCFCt
         JhM2062wLJAq+u8lNDGOp1VWndpvtXRhpIgmnTaGy4HbiR8JayjbstfanV5vKu4qGBif
         iz2oGEsHoRIGX3XCOy2PZXyq8rtkT5Fz0mUnf8G8yH60lDBSi3Xy6OqbIR7eOhIctjni
         9Oqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ufj/OzUb";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020a056a0016d100b004f3bc62a660sor7579164pfc.15.2022.03.01.14.00.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ufj/OzUb";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=ufj/OzUbqqQUDuTaXi3d9MgYlKLV9cHEpkT37DK9zFn+XCtbqYVLdyNow4JjEbF3Qq
         QvI5lk8sM5Gkg1wnVXxNS2KAa+rFlcrCR0x1Qr/AgFjfmwJ5k3qQ8xBtSF8TDNlDdtN8
         yxXl+BTunQiP+U0vrBVX3CUyhPGITo8PaWJxSiPQp3Lt5E19VyyZs/pBLAQgRKLYmv46
         nFjtKrh1ynLQAgmNyk3xNpKTZ4Rk9WM+644t00CrAiswWsU7YKLTiaE5LvFAe4lVK4Lr
         FKRZJEFhNhZNTSBrDg83ZycGZ00yB/5FSoStrNLXbRdsH2XBlKhSx6roiHSO3GPRW/fM
         RQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=M0nNki8i7wakiahBJJH/IUcz3S9tOn85baVXXwXleIuYgB/bVTScb1x7hnzLFcg0He
         irqST5/kdd0OaegRSRay9hlJJUiy8JzZ7zfyKFD/MS21mjHySTX2SrcZKj3bLwa2B1qE
         lUBAiLzvn9/jqMURdCzOdo8phUu/0blaBIvz9hR7aJNPxgkHt9Jy6Gu3rdLtSQKgnYhI
         ybyfq47p59nN+AoKTzZsbn73/lU+AXPVzxDp17jAM7Z18ATJ4zErqMYh11ZOhsuXBwe1
         yN2i29WHaumjIdH1QR3D01dgPvhnhkjj5zPGPQR8nzdcGJcsCkkT9YcId/0l8jBy2C+C
         bIMQ==
X-Gm-Message-State: AOAM531j/cUWIQ248DI3SOvgESiz2rFEveLX3jOjK5hrVshsmQl9kUO5
	kaLTt9BYhCMoM3+DLAwKlDP/qjaM
X-Google-Smtp-Source: ABdhPJx+/TTro2gia4SBDzgt3CLjBM2Oz0FOLhj0Dj5OMoAs5Cmz0cFRO9RGOW1v5n8ZxuLeLtuoGA==
X-Received: by 2002:a63:2c14:0:b0:373:7200:d07d with SMTP id s20-20020a632c14000000b003737200d07dmr23393129pgs.617.1646172012700;
        Tue, 01 Mar 2022 14:00:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 06/18] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Tue,  1 Mar 2022 11:59:46 -1000
Message-Id: <20220301215958.157011-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N9YFN0VJ6DYD

The macro is a bit more readable than the inlined computation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 431b0c1405..675aec4bf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11518,8 +11518,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-- 
2.25.1
