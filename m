Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492763ejo;
        Mon, 11 Dec 2023 13:22:13 -0800 (PST)
X-Received: by 2002:ac2:455c:0:b0:50b:f486:88b8 with SMTP id j28-20020ac2455c000000b0050bf48688b8mr2138901lfm.76.1702329732865;
        Mon, 11 Dec 2023 13:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329732; cv=none;
        d=google.com; s=arc-20160816;
        b=hSW14rkhhW6XzR40TH8i7paaHA7m4g59opvzcVadmkUhGJbIWUnEaAtl4R3DjSbHXe
         Z3UrPt5r/2U6H7Jx6+O1HScRnkov8NnXUf2kMBsBlSGd8VR1LRAqLbVGGPxUafrR1w2d
         22O5XW5lgV2KqggV4KEC44usIPhwdyshYz7AtQNb2AC/iPa9NzfPgWUcAyMz5c2wwqkg
         H7HbL2WScDqVEp7IXWXEokwG6zDCcLnc2cLVRbgDyQK6UIuf4yWRjYjR+iDjfpTnjek1
         zYT4NG/aiwqJgc9HikW2V4tfvEhuXk5SxVwD6mae/G/XZoeah92ifo6HGPNDlFln7Tn1
         wklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L7TvOpmG5rK7v745EjgOtFzUovndqFqHJ7siX/q7POg=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=qXfmKZuSPvJZI1eHBDmlqKOQtkRGNtdoy2pCqa1dr7K0NDfhO5Slj1ZaysblPWg0NK
         Qp1rjWAUvplcsMt7drzUclZ9NeBrTQ2S+gPvGXtgcST5yQ2JtLPJE+8hP2EfTGIH2KL6
         qzF4iP5crGGJICmE+QJG4ryadTz1BdNBtYHGoRysgm62G/0tOKKYEVF0s96vHmjlaP7H
         VLu1+N/Z0YJgQvFZCxS09ekyN+jpJnUvf7FSgnKOg9+cjPTQ/JogSLWVCNzPpPnadhD7
         FkcPsJfqWfaWuKb61kippV/yf5+K5EqnVtFeWDly5tNzH/c1ujqoXberprFzcf/6oQon
         PYvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlkvcMu4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u29-20020a50951d000000b00548de4ebd9csor1843350eda.7.2023.12.11.13.22.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlkvcMu4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329732; x=1702934532; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7TvOpmG5rK7v745EjgOtFzUovndqFqHJ7siX/q7POg=;
        b=zlkvcMu4RBFYTPZs/aYnyBAyQ10RXBmTIyNoadf8WeA95b/6ijPJinpA3wpppVLBWK
         g//C73HgZGfkp+izvaE4cixgeNheRdnvViLhL4L6foDQFfRt/d5AeBCvC5UF7poy4crj
         173CgBLU2636ZZ+wJ8iArpLC4QOwUSpeH6Xed7Ks3MRBq3/PuhUEp0/lNGrMMJxJz1EA
         YIb40RCAtpKf3Uo7edDorFUzyYQt/uYOv4yzubzgMIwfFDJ1+wJdl+qAeKaFigC94gO4
         3f4uQZM1lb4U+vUUwflqgdbB1olDCmbyyDj2NcA6y0Zd767bWrCoHhlAMcA6HLJXRrsW
         dWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329732; x=1702934532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7TvOpmG5rK7v745EjgOtFzUovndqFqHJ7siX/q7POg=;
        b=XeKBzptXr7FsMuTC1V7VKdFrwb3P4IggsP+DGoXDYOv1221louCu3DNNeFt1fKih8Y
         1tdVpGYrL9LSfbpcOwNpVz8+Qch1yIJlfDmoBRXvCioxHWVfD/V/DRF1Czi4jjBl1QXt
         VyqYCybCFSmEFBjKXxfxDprPPDAQbJzbpcTclilNX8P6Zw2Pges6bDC2l6QistwxlOjI
         KOJGOv+g565wYWD66Bj/sMFDdPeiew2UA6ogYn7N0IWUjBJuhQBHrDc/F7uXFXzxsg15
         TXJuW4Ez/pz54BNHJMqjjgsrGAiYp4qt/lVDXq7hyNH58+M/Ci6JOjicfxWZz7WgEl3B
         Wg7g==
X-Gm-Message-State: AOJu0YzHFFtZiP2iztuzq/8ZMGxtXtE8gSGNB/3UNk+T5Edp7ZLh5OJu
	hsB/9cAvn9psdPQmFMPbfjBhLIki
X-Google-Smtp-Source: AGHT+IEirH0rnV+3IGN0xpftLFBW4PiAjAsuBq2ngsAqGUtyYJ6TUXvHpTZu4rTks7zjOTQhAO1Agw==
X-Received: by 2002:a50:9999:0:b0:54b:1a4c:8709 with SMTP id m25-20020a509999000000b0054b1a4c8709mr2882786edb.2.1702329732623;
        Mon, 11 Dec 2023 13:22:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402090600b0054c9211021csm3952454edz.69.2023.12.11.13.22.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/24] exec/cpu-all: Remove unused headers
Date: Mon, 11 Dec 2023 22:19:52 +0100
Message-ID: <20231211212003.21686-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zEiTliVRGU7P

Nothing is required from the "qemu/thread.h" and
"hw/core/cpu.h" headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a7b5737d3..b1e293a08f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,8 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/thread.h"
-#include "hw/core/cpu.h"
 #include "qemu/rcu.h"
 
 /* some important defines:
-- 
2.41.0
