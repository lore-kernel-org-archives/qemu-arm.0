Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1696170lfr;
        Tue, 6 Apr 2021 10:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx3SERGvV3E1FCt3J9AYbbOK0ZrYEH7+B+tunMwam1w0YVguvjoQX8vLPCV+jcb36OZK+Z
X-Received: by 2002:a02:230d:: with SMTP id u13mr30669934jau.53.1617731636699;
        Tue, 06 Apr 2021 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731636; cv=none;
        d=google.com; s=arc-20160816;
        b=PrcGEvgdWNo8/HLP0ms49nkSpq7eRyV/XHrj5MMWAWD5o1ShYnYa4r8wJMoYqtZgTI
         MbnYziHPz8es/XUsJhypc9RJI1TtymfXeQrgsJjSkyrEnFLxNNFKZN1nTYpK7ZfS6hlC
         AhRqzJtBGOOB5gIq/ATaHkmoYvsZmUT7P3VPWd65vJkIXzJIE0vBkMDm6Skpwvbu7Fsx
         bT/PUQTuDbn8womlydSwn4Ig5L6I28qyLsA3PXacafnhG9qT+Mobeudn0NJQz6CyqY0z
         HF4AhM2zDQQ5E+paDL+5q41ro8w/L12ZEZUHzxIc5wIB2QDizRb0Jjyfrrg1psKT6elj
         f/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KoBTGUZmyMctY5haXIfN8TiPwOcc2SyNXLP6NLjWLR4=;
        b=v2AxxmebL9zQCvX7BglxH5dK8m1KXUHKF/Pfht5OO3fjrhKMkNQzbTtdXRvHEA2O/t
         sHPs9oH88AjCVPGIYW9lHMA4kjIa0vE6bFRIgTCg6G3bPCUzBNNKg8v4Y9wJbk5hrpP0
         WjDdro4KBgAnYW5GgDS3HEmfej238/zcIYvBaBuc5XgTF3IMGduWmCDETE8kYf/M1Ve6
         1JKwmuexZxB5g6Sc0Fad6wDLWNqAzHnu7LhKvAUy3/dRcY3NVwKkEb7QFVjCuqqSpNsj
         fvYjcrgM4tPbG0tUCtlD7MVOVtcT/PUb23Xi3nZ8bWfAs+nEWNNyFV4E0O/b8TRNM2NX
         dXew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ca6yD3Kd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si18318784ioc.83.2021.04.06.10.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ca6yD3Kd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTptj-00006y-VI
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph5-00023b-Kj
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph0-0006Rg-RM
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id t23so5093636pjy.3
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoBTGUZmyMctY5haXIfN8TiPwOcc2SyNXLP6NLjWLR4=;
 b=ca6yD3KdlP5KFU0u/1D3iFM2QN7G3MjvEwrFRF8iha8PtBfAge2O/p93CLrpXj0eZk
 egGV14FHEq/Mkd4A8xss3iig3FBbSS+PURlN5U2fPFgUq6XzlVjhNZlwHlnARPhZURyG
 w3lDdmjnzIxS1Y39bPn0ILIqE7PXpmIyh6RISEgMJ1CHijW91Su/UxLAoY/Ij6pp7qRe
 HQ7eyEqa018XdG8x1fLe/nN2qlZ00zAJQMQguEfwit65bbW3bN5CyY4h8PKXGAwTK5ul
 yUqQ5LKIuNkYFQPjXF7uzBC2AwtYTUcMbcgoYhlMs2g9oJ8GRRv9Df027x95BpTzGPkR
 YLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoBTGUZmyMctY5haXIfN8TiPwOcc2SyNXLP6NLjWLR4=;
 b=BCg2Wa73jfLJdN83P5EgkCTnG8Iy0y8efajcqlhdXZHVeegqshqa6AFcvd0Zk3Qv0A
 p1apaULj+MUxUYWkr6x2Syhc8jJd8/UQeyXUVlz5ZpRlOPODBS9Avdi25yMyEKOed11S
 7P3x9uC7Ae5uzUskIZkcANhlnTerwmDgfNyXG2G6M0aURfBpryB5r17BXdy5YyahnMnL
 AEMQXK8Yo3Yvd1XgxqUyORsdfWi+uMaydi+R6tHazNA65lISl3MMK3oYK2x6tNi4W5iA
 MvOqTKugDwVcx+qSo59kgIe6uryFr8A5g6qxhiPZls46/4SiQ1sGZ5xjYcJijOtLOXCk
 Q4jQ==
X-Gm-Message-State: AOAM533mLILhRXfLu3E6VPqVxH84VRUXq0/Qdi9YmcFMRSmJ6T32a6JL
 Uk6Hu8rTUf0a/WRJW+EyoNY3LdGH0xTN9w==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id
 d6-20020a1709032306b02900e71c8d63fcmr30115307plh.35.1617730845171; 
 Tue, 06 Apr 2021 10:40:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
Date: Tue,  6 Apr 2021 10:40:31 -0700
Message-Id: <20210406174031.64299-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AiK6vFSKdqen

Unfortuately, the elements of PAGE_* were not in numerical
order and so PAGE_ANON was added to an "unused" bit.
As an arbitrary choice, move PAGE_TARGET_{1,2} together.

Cc: Laurent Vivier <laurent@vivier.eu>
Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
Buglink: https://bugs.launchpad.net/bugs/1922617
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d76b0b9e02..32cfb634c6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_RESERVED  0x0100
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
-#define PAGE_TARGET_1  0x0080
-#define PAGE_TARGET_2  0x0200
+#define PAGE_TARGET_1  0x0200
+#define PAGE_TARGET_2  0x0400
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
-- 
2.25.1

