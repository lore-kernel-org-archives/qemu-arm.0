Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA7DCCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2U-0001ZK-6b; Tue, 14 Oct 2025 15:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2T-0001Yk-17
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2Q-0003Pk-Kh
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-791c287c10dso4879402b3a.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471423; x=1761076223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YeiwxiUvqRGSS/dH8aPGA6TRw5Wq+/Vm3e+77xD1954=;
 b=Y5xQATKgsuX4jZDOeYZYwNJm6jdu3iKGiq4rd0dgOHroE2GsDFtScZxlmIL0/c3EJF
 /fehpSlRjq24/3Qj3PhksPID3C+8FEdbzKC6RlkcqwaHgu/x1D/n8frCUjOZIJtfnnxP
 UcjJL4K6kWteX2JC5dTZbMNICa4ENNGdXQYf3a8ulBR+q0FZVS61fb3QHxEX3JQj/LAU
 +vS2YaSUVu9mPVs0HtfIdbRGHN0vf7oje6JUivYWpSy3syy9cbCLM6nEf/z7XkWGuLnE
 7/IJ/CAn5ZSZpqL8C9YEcp1IcS4Ymv+jBN+1BTFytG40uQPXfJaZwj6r5SFUYX/tVypi
 Xlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471423; x=1761076223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeiwxiUvqRGSS/dH8aPGA6TRw5Wq+/Vm3e+77xD1954=;
 b=bsqwMKFTbV1aoO+L7hId9t1quxJoTkkeDtj6tZVCQTfMTJIQDVxhwKvJWBH7idQbTB
 uMCyYtibEejLtlVQJwuCKvnEby4L9USIOKEixsGWNc5+P7uPAepN36gS7Nm5OqkOSDeH
 9eGLBylgyokPXopBq4UhBYkkb9cywh9dDzRVjYW6vkcuHy+rcWqXwp1iYsctJOM9I483
 7hftoVPprbyIHHdIynjFOWWbMiKNF5wjqwCRE0b6MbxGrTJyb3MAkFL7gETXauWm+2vY
 sLfoQmf02O8cgY7GLNK89oSNjeogvdAxSMuZu3UoBAC3oNFvqI81wNqn9QjdOwConXB4
 DdKA==
X-Gm-Message-State: AOJu0YzdS6FNNBBIFBxQ4jUo1IqLVJqzI422dRqhWaVrNNLpsQ/bfvm7
 iTikDu/tnNJ6hPfgrCPMYgO9dGo/8y3FtTGJVg2APk5pBtYZN1QBPJOXOCRv37lHiv4=
X-Gm-Gg: ASbGncvSxeM32ApaOrJK9WarAPQCu/187GSc4V8LEebIO4cmfL1c1tItYsVmJ1N5Uk6
 Qe1RoMoWClYdvFlASnh/cMV8A7xQMyc7gNWof9L0JV6pr4lx+wuzYf0RQn9Aw31yy8hznz0Lvry
 VK/LjHhbS+zvnc8rP9Y6UE3PDMMOoADXrExrvoeL5tW+WiGvx+LNpdvFQe79cSa46jn5N3QHVe4
 OZ/s+uX5XEyP4gUXa3tjT0sddlIiEe56Gbby44/0dvqxjDBqoTS6x+EIVo1Fbh8Jmbl/UR4JRzT
 uwT4kFaS38mOsSHH28L/gjN0OrENj9WOVbmBMUG4Ajg3wwotoeKjOCuxdniFkmirb8vf04W4RTo
 N8xGkTQTP3dIVeMaRE1z3yIl2IdAyK7jHKZ1LL1LdbCYjzZajIgXFJ1AC2i9+kg==
X-Google-Smtp-Source: AGHT+IGMt05uYlqnkiw+8u1XhFFkjfrOirM8wSU2bcTQZGp5rgX88XTJXBcCZA7K5K8jq1i151CiPA==
X-Received: by 2002:a05:6a21:3291:b0:2ee:afa3:deb3 with SMTP id
 adf61e73a8af0-32da83e686dmr35355003637.46.1760471423331; 
 Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/7] target/arm: Drop trivial assert vs attrindx
Date: Tue, 14 Oct 2025 12:50:14 -0700
Message-ID: <20251014195017.421681-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We just extracted 3 bits; the <= 7 test is trivially true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d4386ede73..54c45fc9fe 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2320,7 +2320,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /* Index into MAIR registers for cache attributes */
         attrindx = extract32(attrs, 2, 3);
         mair = env->cp15.mair_el[regime_el(mmu_idx)];
-        assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
 
-- 
2.43.0


