Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp493118ejo;
        Mon, 11 Dec 2023 13:23:00 -0800 (PST)
X-Received: by 2002:a05:6512:b12:b0:50c:f4ab:d192 with SMTP id w18-20020a0565120b1200b0050cf4abd192mr3423228lfu.62.1702329780309;
        Mon, 11 Dec 2023 13:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329780; cv=none;
        d=google.com; s=arc-20160816;
        b=0GwvjMpnqdlWxoI1XiG/7/jzQ2fAqeCGKglQUh1DQhE3sMs0zf4Agncn47cqiJ3gMk
         j7HGlFxzg9x2464EaljYhRwzZ1CWqx8yWw34xLLkgRhKgcmBeXVwTi5YA1ZrI0NB53uB
         Uhuqrjg+NUh9ebrYgK/ndaXOHHkZ1ZskC95Mk4967oU2cfXQ0JEWgo+Ifbx9jUqejR3Z
         9N/H42T5m/qRSG3/MSnoyvcn8peUgIuoivk02EZhzyrokMd8xDUJHeAHkYibvcmhFuV0
         f6HJuOn2m3Nbq4yDfBWdjtfJ5OqpG7zJYQwyB0jEFl9pKQgC4puTM74tUcLkjjJqY3Cw
         xqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6IVD0fP181N6yKPURwFJTLnTnzSvk7D9idiGLSO6/Cw=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=gWe9rMRiylPt8gs2HbnxKYWe8O384cwZV7b/ksDh5UAeQSqlspgoth83qVSg0bjVoa
         0WVRttue9uyAW+vxSeZTYAvL3KoH+4oP5bzcXLKS7oTvGPhN5aks9aoDBXKEoD41jMpE
         ZlznKsvGZB+jN5urZfsELL4XLdB0SeXBC8SYCdjVby/Qh3Y3IPdhblsdEIhvBskdn16D
         zRLVKH/hNGM1oWiSR9h5nPWWEKbyUpt7U8QYtBoZGuETcZZiAU3uz/1m2ANiXrXVDrmR
         ELpQ1gVh83vX+regwzrka7Jv86rZjzB2gKjpYVQH7doZlPPl6ljCL/561FWLJyMCkCJR
         +DTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGicRza8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f3-20020ac24983000000b0050bf90839e2sor1948889lfl.31.2023.12.11.13.23.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGicRza8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329780; x=1702934580; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IVD0fP181N6yKPURwFJTLnTnzSvk7D9idiGLSO6/Cw=;
        b=cGicRza8n/f/7aAa9VcP82xVVvHIRwIjMilcrDds2cOWnIjIEu2f6eH4rTZjKMGW5j
         JzUL/fAnL+DUMymClGZT0Ud8n8uPMFYXWNyiF8RANYIaYR0OccaV234OmWZz40JSoq9r
         0JlcBGlt5n5yL16U9Ooa9mXu+nXaGuawMmt3QwTs5Yslzq7h1MiBvDKL0iOj9+tOnBIN
         nFh1NJDKZ2y90bmUmWxwNN04pH/thx9LyHMIT5fZbpH9nIPh/KsIFUHWO4VTK7fs98Fe
         KWmTY0uuP+2mTD+F5/j+3+u6K4SgJG0KAYd4VORjYAEZ3k0AzAbj6uBc5IrFCj9jR0x6
         +keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329780; x=1702934580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IVD0fP181N6yKPURwFJTLnTnzSvk7D9idiGLSO6/Cw=;
        b=ITl/yQWhOV7aNYKyLxuySz2kKyBOe/KPv4H6LTZuMKIy6R/DVTebJ+WGckFE6gNMb6
         Cx/LbsIHsC8TTq8bbM8dh5zfz7NTyVVOe6KzJDk5Qwo2Y9FbhTdKKVY55F1rIN+B9lJR
         ISK/DbuCWujOwv5XEQPOYRzkgBscfquMy8oZgmGi7zlt+eRutWxztXqW/3U7Pma2fhLI
         7a1wVh+MgGZY6LAZwaEqFRsKEQ1vpId7qn3gVhzPdjubPdXXYdKlDbJPAxFCl/5Gv7hM
         wN/g2msPmY6kSIHRx7CpxBukPFDTIb6aIhucmqjOxh9a+ti/UElT8ijK2dm1FHmaG0SF
         BUXg==
X-Gm-Message-State: AOJu0Yx/bM+xDgqdyVOqajNRZ0eai0MWbtuj0fVIVnfNiG2Ccm6SqhQV
	BQGN1pTkfsALCaReDJHQX4Kx2eWV
X-Google-Smtp-Source: AGHT+IGImOxVOWgtEtRNbTpMP3VyoEVtcVk7T/kTyJSDnJhEjGlDz85TYtGNSnv9pwyCRPaMJL33wQ==
X-Received: by 2002:a05:6512:610:b0:50b:fbbb:2035 with SMTP id b16-20020a056512061000b0050bfbbb2035mr2542678lfe.97.1702329779237;
        Mon, 11 Dec 2023 13:22:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b00a1d885359d6sm5283778ejc.46.2023.12.11.13.22.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:58 -0800 (PST)
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
Subject: [PATCH 21/24] exec/cpu_ldst: Avoid including 'cpu.h'
Date: Mon, 11 Dec 2023 22:19:58 +0100
Message-ID: <20231211212003.21686-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hYNVMjzBEy/l

"exec/cpu_ldst.h" doesn't need to huge "cpu.h" header,
but simply:

 - exec/cpu-defs.h
 - exec/tlb-common.h
 - exec/user/abitypes.h
 - exec/user/guest-base.h

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c69f02b699..a115553ee8 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,11 +64,15 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
-#include "cpu.h"
+#include "exec/cpu-defs.h"
+#include "exec/tlb-common.h"
 #include "tcg/abi_ptr.h"
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "exec/user/abitypes.h"
+#include "exec/user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
-- 
2.41.0
