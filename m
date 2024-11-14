Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25714njc;
        Wed, 13 Nov 2024 17:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqeSjvlVkeWAG5FlF6Ejhp46xBtmrOdvRauGPJPLv8P0N6cndZFi886secFBF6ae7UY4yydFKY5NP2Tg==@linaro.org
X-Received: by 2002:a05:600c:1c94:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-432da7cbc94mr2307745e9.21.1731546830804;
        Wed, 13 Nov 2024 17:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546830; cv=none;
        d=google.com; s=arc-20240605;
        b=TWe+/SU6QgMRFr5ifDaDflzyexJWQhwqjXt1VD2Vyq9XSLRhSRFA5qpiyhXDj1EM+7
         VigoFbfdJ5EO9kIcFmrj6nDhei1VswyA3uyjRscJutcfQ4IExxAPLvMzTDDKTr8UVAwg
         8dnf2GF332hHl7pYxYDtMVDPJaRF8wF092vAeSSRZnK0r8iSigNpN1H94xIftUK9R/MF
         eKQnCtq6U3LjIUbMRgPlFuxOK8iJP/LyfNeIbs4CQDeIwkpEYkoElYYkoeZ/+XJuli4y
         G+tZ8UAwP2DTiAbGhEOFXYGPMPgrkFAySIjryLXcvjFeIHRR4y2HEYjX4sj1IZ5I8+5D
         z4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5KW25vJBxhufCYPIMuRXQYWgykya5onuISdgtY2NESM=;
        fh=NixEclV86SJP2wX0FDvQiYxa+Rh4iENNcQXJp/WwWBY=;
        b=Q9RvEIsPrBu8Zoz3J/rTcToiAnbq+acqTkj8JM8T9kwDqbLZKPcXe3gq+xpKmP2yB/
         9XEKTLFuaXfP8mlKKy1hgI+j4xDB9WyEn8P6MOIEZkpKdqO2n2kC9DGAHsAP1JIaTN8K
         VOy2EJFZbhIZBuHbJVDtAlZUlvdEvGxUDkyXcpkRFQAoQTs3BHZXTk/qxSfoGj61GSNy
         MMOtQSq04nSe/z1ziCddceMeDuLMVdjSLChX8Gcg4tKeNJ+sUkJb3mU0BP/aWY/6rWoI
         RF3bQ3zlpyQJ5kGxqDPGV1KZcq1mAcNDV0KKxx5Mp0jgdEjWVKhz1IFmhjmA0Sxj2Vsb
         Dnag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sO+lmAGf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b27050sor81923855e9.4.2024.11.13.17.13.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sO+lmAGf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546830; x=1732151630; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KW25vJBxhufCYPIMuRXQYWgykya5onuISdgtY2NESM=;
        b=sO+lmAGfyVg3InGoVilBNLEWM5oiHz3036Y5tizmNb9a20RNOT+fypdMTbXhYmsgH6
         luXZENrY8myJxvPu3Wbqcl9H4Sab8WRUSNk9NDFpxjTgfqDe9n50hBkC5mf5Bu1wDEBN
         /OjBy06iGKPsNJ/e/6VmaA+bxfqy/NBO7gz2nsV5p0u1Dc9ex3y4EbMMGvtKEM1rQGTb
         0xIldWAAHHUha5RHvzo6VfbJjf4MzEhAujF6ekZdLSgCQ7aDVlju6/yKv3lDjYC1i5fm
         PweEBkrmLOB4SwGeD3FsvlQz4lBVAvDTrOic+CTwjlb808xNRb6355omJwXKjdHd+HDE
         t+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546830; x=1732151630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KW25vJBxhufCYPIMuRXQYWgykya5onuISdgtY2NESM=;
        b=KgWRWLCJhgYdPFdPzY68r+aiRfmhSXL+Z7PRAdJo4ech08N8DjHG664/2HXM6D9Hwo
         o8K0MagMBlEMz8TS2cqo5DHW9n41OHQAAQ4MuC7NWZJDpZCizJWR0PNN2wJiBy/pHRf1
         hHwJdfLG3VpTwZWDz3scQlxzyhicD3PZHDFW8yvYDpk8792OJt0WcZ65O5TbXniYCzgZ
         2KJO2U5LfK8nnMzTXqbKxsVOtP37d5AR3prW7FbwdTUE83UVjzA6BoalG3+1z4yNIH/H
         G7Ug/k9tjLJ9ZZJxMN9hEBIhk/QecnAWMRIoZ1nHWd4QT1NxRgrXwyXce0YghuVaHH+G
         nf2g==
X-Forwarded-Encrypted: i=1; AJvYcCWF7JoSjfX8ZTCm+n2FFzdZhZbtFTw8cNgrg4Ntu/PFuSdoaJz43MysdyoZVyj4YwHzwqONN6cRPXpaAQ==@linaro.org
X-Gm-Message-State: AOJu0YwuYFVIJZxHLc0rQmO6V8k4JVdylteYaD+uLWJ2LFh2i1DZIgx2
	H6NpazipnZV5GN7Udk0bW7DBaa8WEsoDKZTA6j4kyRUT14oRji7yQ6wZs1H1wgSZYq2qt5WbXoB
	ttwU=
X-Google-Smtp-Source: AGHT+IEC5JlJku6XdBSAUB2qj+Uz9Kq0z6gAZgWwRK2JCMYVh8ykSi7sKBQbjuLQEYGTHDnr+1RcEA==
X-Received: by 2002:a05:600c:3d16:b0:431:5c7b:e939 with SMTP id 5b1f17b1804b1-432da790770mr2673155e9.18.1731546830113;
        Wed, 13 Nov 2024 17:13:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c97sm4649995e9.40.2024.11.13.17.13.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:13:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/24] exec/translation-block: Include missing 'exec/vaddr.h' header
Date: Thu, 14 Nov 2024 02:12:48 +0100
Message-ID: <20241114011310.3615-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IWP/rJW/Aa68

'vaddr' is declared in "exec/vaddr.h".
Include it in order to avoid when refactoring:

  include/exec/translation-block.h:56:5: error: unknown type name 'vaddr'
     56 |     vaddr pc;
        |     ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/translation-block.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index a6d1af6e9b..b99afb0077 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -9,6 +9,7 @@
 
 #include "qemu/thread.h"
 #include "exec/cpu-common.h"
+#include "exec/vaddr.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu/interval-tree.h"
 #endif
-- 
2.45.2
