Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009056ejf;
        Tue, 16 Aug 2022 13:34:41 -0700 (PDT)
X-Received: by 2002:a05:6871:71e:b0:10e:cb72:3728 with SMTP id f30-20020a056871071e00b0010ecb723728mr159412oap.216.1660682081064;
        Tue, 16 Aug 2022 13:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682081; cv=none;
        d=google.com; s=arc-20160816;
        b=JOuxKsFUWKE/P0ykjfWpt/oqVY5kA+OR/tek0D6+w7YiXKcADaD0GRqqRjbizWlWUC
         5aWM41TNXwEw0Zm6bVdtwzXmFWgIsBqvIu1yrgRpEL/QpmLK5bVKLTzdnvyW/PL2OQh9
         Fn7fP5Ng/j1ump/e7UJGCvYw3h/4DDCenN7X9MSW433LMrL2atwDS8+2ktyIa1+Q+LKT
         WYK/5qglb+hxQ3X0NDc8eNpBF1oF5CsfHIx8nXWc+EFNk+Nd88InP47zeg/4MJnuFJwB
         gZ7WkakSrCyjYMEQgFF3Ho/qKFIkuQ9ZbFY1Inb4EVCpt7WXTAel/DxUO78RrnqW3bIo
         BXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
        b=PVQxOuQIBs8sZK9gJtf5fWjwbYfgG0YlSGTlFi1XMpbcW+PhvnWPvbxjSa37+ZT9Se
         Fi2fKqRO2YR8E5gEKspPY/opHSy3yVTqq16qoa33PEt5aS7V9Ir+YPlBHOENuNVGYlf3
         BEtzPnWajLxICcS7vORoRLySFWzEJQZvLeEGG1vg/kQeXb1zQNFDefMWjIf8tS+feVHz
         5q9CD90CMPQLyH0S8phwDNOtbpglcXf62lvYAFqvzbRbEg7P7JmXNi+BRQJ/d6P6yoPL
         DoJ1zHwWrxvdCuslMyfeH/tZ0nyttSC9AwVCcrtwn6bCrsHmFbC0wxydc/f6eN2FvkKQ
         NAsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X92Dz0yw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41-20020a9d04ac000000b0063707835589sor1656268otm.35.2022.08.16.13.34.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X92Dz0yw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
        b=X92Dz0ywDzYVawuTMHXDyda7X6TRtqlFqLPovKxZ9n41nVF+255bVQKGefligoePjf
         D31wpZrBOtdUxNRExGjCMxIwoz27vzmPrnp1LBkKeDWxeB0D48eY6At1R8e665gMcLoU
         VCgLjMyX2qNN6AIg3hCATLwsEGiApUrdR9xJ9cnjy6IHjqB5eLtOPdwJPAcxkR//zGrq
         UzAMaJJhCKTBIGdpfT3trc+2ZsCAE7izJSrazlVnA5a/xSz/FsnaqbXI9jRoErv5hk/b
         GW4MhjN9+rMW3RdIdC+SGgAAUN/WS7CqeRA2Sm6J8HtgIzMruWFZRtcEqxZ4iC+Pbdil
         aKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=PnxOd469lmAdC/RQB8O6SvRIgXAOuOZ1V4tulDNdRcM=;
        b=WFCg8b20bhLiumtqy8d/vU2HBOJEzU/gFCfkEOV8Pemzv3Yp2sR4IyoFMvgrO75MyS
         d/p+bzw7lq7YDwZR+arwvMkwZ5CcTVhOyRue2vYY9z70TGSLagzWL/9f8qNyMWl/ftTd
         EDSy83m0hnV4jcL8/rmw5/APtAvJb9hRkimGzm9DigBrIVB/8iJIzOtnGDtkZIPzE5g4
         yjOxbSBuLWD6pcD9jKT66XuGl8+O1E7pTz6SPaUmlGp/BaSOAqtMofqluheZGY65Zcsg
         gLwJeFjbQgGd8vGfaEG8YAYSaN7pfICj6+CHRQWINf/XHMY05XAzTywxp3VvmGmUmsgR
         9PxA==
X-Gm-Message-State: ACgBeo0CVqO0s1il5N+quq5+/jgoLpR9Y2/PPVwdPyUeWmG6zjli4CXl
	q0Qn1VEwG/pZeQp8lHyE0TzaWb9S
X-Google-Smtp-Source: AA6agR6yl7Qnimj3IyIacPNSmD9eJDnO919G+6ORJeewh7oAI0+GovcnGbCxYwcHfQmtlL9qM+54sw==
X-Received: by 2002:a05:6830:2646:b0:638:b172:92d5 with SMTP id f6-20020a056830264600b00638b17292d5mr3498326otu.75.1660682080696;
        Tue, 16 Aug 2022 13:34:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 15/33] accel/tcg: Introduce is_same_page()
Date: Tue, 16 Aug 2022 15:33:42 -0500
Message-Id: <20220816203400.161187-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RF7ilWsrng1h

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1
