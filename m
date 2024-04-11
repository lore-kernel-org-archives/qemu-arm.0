Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp854234ejc;
        Thu, 11 Apr 2024 03:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI2Mmb/J02OijcsidAdB9Fhdy/pGpQkcaquAg39MI+tZ0awHYR0HLkAJ8ZDjffYS0I8o267aTKBawGB/e3H1wAvLm7rX9q
X-Google-Smtp-Source: AGHT+IFmgB7Nqi6mDjbhhaddpaZvyYeLLfbFQcNBch1h8NbxAYWMy6gBvgQmwBCqM0g9Dn1S2KLx
X-Received: by 2002:a81:a1c3:0:b0:618:198f:aedb with SMTP id y186-20020a81a1c3000000b00618198faedbmr4818031ywg.5.1712830671284;
        Thu, 11 Apr 2024 03:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830671; cv=none;
        d=google.com; s=arc-20160816;
        b=DR5mnTblLpc6iPbYmr2UHPnHJ2aGp1SlvjK11TJ8IghgfZK1z1+FIweAGcGoiTKWHq
         yOUCI6kJmUmdALXWs2k1ulRkNLhymtNMYPKKfUq02S78qzBjMaUvIbXpaX/W+vX16rQV
         noHrGiL1sfKXQfRJdburTwEnGjUtcmt45ysehOYmoxqL//aPzd3505wxFW1Y5QlkOJRA
         nQ1Z9HfjzllSMrRVfBjMW4iuzeJRmlw13j1q74/AyJDPWtnl25x4JfYeRjmlLqx7awya
         n3aFNEo+oD7StBSSJPtFiKPFvd8d04OkkE+7b6hAQWjxp/CQHoAqT/+P1HFk8pJs6DBZ
         /fyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QTZuvbhwa5X7Gp0Pq7iX7voFgVp72I/Sgdu/HzqQ/kE=;
        fh=wcZhdQTQDei7o5frrq1qhU7sXHgTSgo1R5cwECyWQsc=;
        b=U5SnZMMTDhB/8jff3BN4iGltEFkqnh6XuWz57FaeHJEr9Us7FZNC9SMlrVjtLnZcYc
         IC+lyYYwlG0SD3oI4nAE5xDfGsxCfo1QdqlrkeGp3rG/l3G16yXQI6EQHWKXemkWenO5
         iSpO1gxGwiTHK7J3+nSa1CbKadmLCzGdrZrsCK9+km4IyGuANkpmtsu1JrFeicABhsCN
         7S549gPk74bKUWLrkyPwGvDD24pmh0u/cG7N2JfObfo70r7FSMB9W1ii95yJNckMl/bC
         F8DRsV96RyX1SE3Wad8+5FrruCXOTwBMkZbNwSgNNvt9nBLLN16/390T8QWywircIsMG
         53CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SyxAlnpc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os40-20020a05620a812800b0078a45b958ffsi1158841qkn.606.2024.04.11.03.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SyxAlnpc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rurUp-0005mk-QX; Thu, 11 Apr 2024 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTr-0005BY-2N
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:16:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTZ-0007Th-PT
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:16:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343cfa6faf0so5804443f8f.0
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830571; x=1713435371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTZuvbhwa5X7Gp0Pq7iX7voFgVp72I/Sgdu/HzqQ/kE=;
 b=SyxAlnpcHcmxHRlyMKPfeDAkI7unqlP9K9hr3Dq/s7++WcvWO6HwFqNjkTpoHNoyca
 sea9ZyywPJvBbLgg+NdsyKec/R0TjcRjgBzfjUKpoDpiCV8Ljc18fPDtnTClDTEpjOxD
 fKij8LwKT77i3LiIWh87hXQvFsIASOJLZJkWGjsWNHurNstiF/D0E63l6iDz0/oZLGEX
 NXKSJPHE0HIvu/pemHuJ7TTWBtZgsGY+ygWj6FgwUKokHvNQUnhMxrg0hGd9T1Xw/cnn
 Z6u9w1580PUk2S/Aq9eN7NXrJajekSXTJ3pwInNXdNcwaRpxTq2Owba94VLUa/Sk16gW
 D/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830571; x=1713435371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTZuvbhwa5X7Gp0Pq7iX7voFgVp72I/Sgdu/HzqQ/kE=;
 b=Examy/6egY86+8sgql39r1ovjDBrzp4ocUhBdBnGPsCixul+lzdYUMOepiHuhAQfPa
 IlkK4CSJjNBFhykaReYGX95suCkKudXzLqVP6TTNTKvu+BCCJvZhgXJ+jXA4VeeggO7V
 x2EJCQnWFLqhnbGkkPiGsittu0509Mwtzejl+ss6cJNyupAHjGLwRoJe0AjZ+ur83sfm
 n5AgXr0kYOTJ6lmj2TMSkOT4L0LeohNyAR6lo6gdzQqiqGnn0v97iVby5P65i7Ab6i+q
 p+duo7Vaeurl++OgcYhruS7LFc7NKZtqVhvJ63gtFZ/dWO9wYiatoAtPIkEOZuKl5m6W
 ar/w==
X-Gm-Message-State: AOJu0YwyRsako0kgx0DFDToiTWpBAJUrJrs63H+XHise6MOgFlveQNkW
 C1Yha7oPCrf3uxVL9ylP/X9dW4hgiiY/SMzZOxItUOJLPUdde3+0QQnVQ7O6eiVAVTiAQ2zaaRK
 7LaA=
X-Received: by 2002:a5d:518b:0:b0:346:354b:b5b3 with SMTP id
 k11-20020a5d518b000000b00346354bb5b3mr4284657wrv.23.1712830571087; 
 Thu, 11 Apr 2024 03:16:11 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b00346cdf48262sm658460wrs.2.2024.04.11.03.16.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH v2 03/13] hw/ppc/spapr: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:15:39 +0200
Message-ID: <20240411101550.99392-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: dFaarNRBMJPA

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by snprintf() in order to avoid:

  hw/ppc/spapr.c:385:5: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
      sprintf(mem_name, "memory@%" HWADDR_PRIx, start);
      ^
  1 warning generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9bc97fee0..9e97992c79 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -382,7 +382,7 @@ static int spapr_dt_memory_node(SpaprMachineState *spapr, void *fdt, int nodeid,
     mem_reg_property[0] = cpu_to_be64(start);
     mem_reg_property[1] = cpu_to_be64(size);
 
-    sprintf(mem_name, "memory@%" HWADDR_PRIx, start);
+    snprintf(mem_name, sizeof(mem_name), "memory@%" HWADDR_PRIx, start);
     off = fdt_add_subnode(fdt, 0, mem_name);
     _FDT(off);
     _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));
-- 
2.41.0

