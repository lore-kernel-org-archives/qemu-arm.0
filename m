X-Received: by 2002:a63:ff23:0:b0:373:c359:4ac with SMTP id k35-20020a63ff23000000b00373c35904acmr1367356pgi.23.1645655511497;
        Wed, 23 Feb 2022 14:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655511; cv=none;
        d=google.com; s=arc-20160816;
        b=aivC8NvVoF9kIm6iXkmUBMVNIIFeV9q0fFq3tdDrCS1Y/yveLszoSAmPyULWsG9vJ0
         Uuo7sduTY2zu5ZdZL+qmlJfhKM9lOELSrFPAQYMyVkhBGnliN6o75DZ/L0WNo49EeqCC
         hbI5GjDTVcnQD+AyvHXWEVbxw/AiFnQ+uW46vhAQzqoJrjvYT+vFOlF/vKapX33tX7SY
         XukGNvFAcWQiRv0/s3hLsBTsZ3Exb5iNs38+P4eOYU8v3D/pAZD0sbidGG8e871YbrKT
         H9nRZpn7tbtWdOaAWXtdtPyzxtueea5oPNpR5aPF0HEd40o/NB4d8rVGjiaCew0ecGYo
         RIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=ZSl+Ykr1s5RVS5Bql0h3FpZhmtwMilLkiDrd1M+/R8O6TBrV2Q4Mfed9RHmroLOwkP
         Ia7GlCgLkUVKWBSLoUy4MpWIHKZDBI2SF60S+u2/YrYanKzxC15LKjqbe7ONDOqIHRMA
         DHrkXo09hx7BluNDOWQ6PjINlJAnw2MGAOxj5TGpUolBDy2ymgZmEcf0WwgUCWLp3OlL
         lzx4uO5Fb0xipxlzEz5UN6RxvSjuB82359T5kMhvPPjNNgeljyDrQSpTKkUvirxePbWH
         /kXo4Wy/5UcyJ8qeuU+H3hB2IGHJ2b4LEFSZy/AI/ot3+94h5IFt2oqqQV/Gs7eFgayI
         FZ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLvusCfo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mi1-20020a17090b4b4100b001bc9266799esor1878424pjb.7.2022.02.23.14.31.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLvusCfo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=sLvusCfoq1Ah8GlJxy/j847In4z7s480NBBmtn6FLR+nkSOJTIu7ge+QcHIZc8vM2D
         9m6NiuvGwWaZ2SHOdY3QD+uQieG2uXqwmmvqP7KtTQZEbMPbo5azEwEVFOcukCuc/U5G
         eGH+dMPna0/06OKXrLkupNB7Yni0aAt0ZQbn3KtAo0eFulsbbloCRlAkZyC199o7DmfF
         m/c7T8jYNAaqbjKMpUxNnmxm6ivncOkzg4p0LwuXUAPSvRSaw1UFk4P1lkvLJgzVimvb
         HTFjMjv/A6dq05gndNCYm9U9q71xSeAKIZaJNkrUBuFYSo/IMyeMDaBb3JIIROTHnzms
         sP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
        b=Q/q64U/rcu0gID+W+FVl8vBZqxupClyEGT/wvTVlDv8NyDBiGsUiwo/TjGrnNshZsJ
         xZz50MBZKzIoGpQV8sr2nHVmSZ9vKZVGxpcOzbKHXR8gcGsemWN1y9SFevyLkQLHr4B5
         i2e4yx+baj2jBGZtGu+PCGqqyMTUU3lpclP32aByYOeUfJLJ0ktr4P5B30GAdF2DOHpa
         14n9NscblFFW2sQ9aAl5MTcbUrDAEVgtQueYgUv6i7ZPvUuYikwbhWFYzJcUXtgKz7mr
         47ustzARfIDHhoIfGo00Cw0ch9MfKMRAwlv4kpKSQS2vOAcKLXYPDlkXy4kDYyQRyB2i
         kboA==
X-Gm-Message-State: AOAM530TW9+EiQaXiMTRvtho9712pWToGdwN4/ZN7QMJ5tNIKQfq16LL
	sdQEbbTzNyshtP7rOS1TFltD4ddM
X-Google-Smtp-Source: ABdhPJxzc71wMMXpch037H4YvReloP6NmGZxGxsBDwK2iXJuifDQMb5dyzuC4bvuwglBR3Uv7JE5zA==
X-Received: by 2002:a17:90b:2251:b0:1b8:c4cc:2057 with SMTP id hk17-20020a17090b225100b001b8c4cc2057mr11364176pjb.193.1645655511021;
        Wed, 23 Feb 2022 14:31:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 06/17] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Wed, 23 Feb 2022 12:31:26 -1000
Message-Id: <20220223223137.114264-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O55eBUfKqotN

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
