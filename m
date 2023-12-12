Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865562ejo;
        Tue, 12 Dec 2023 04:36:20 -0800 (PST)
X-Received: by 2002:a17:906:957:b0:a1d:8d09:d07d with SMTP id j23-20020a170906095700b00a1d8d09d07dmr5745799ejd.47.1702384580103;
        Tue, 12 Dec 2023 04:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384580; cv=none;
        d=google.com; s=arc-20160816;
        b=vlokwcy/k4wc+/NQL8VRKwRqz8EpACUn9jugjOmpX443Jc7K2zaKWgfGfrwIUFAVz3
         zIJLSxaiWo2XEj0xmHYmyKPh2aZIWSOGu+iSaaEp3C7JsgBPQcJuWbGy9c/IIdec4RC5
         +kecoSi2dcqcqXpHeZwRBBgYQ7Go9BiHS5NXPRNOHdvf8lfuAHMNn/vI3U0qMFFY22c+
         dOdEmQUYJwstNhznNDXbnvvNQA+kmJJw4sQe+ieAzVgQ+sjpxBa5XlzdBDGD26Jj/SPX
         qFklGTRRelpw/DcF751MkILXsx8PZidwbliS7NqAiJCuT0lt36roPXz/nxvoXs9RyW5v
         7qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EgOgJWBHHDbLNzyjR5V9GijCj9jUXCNUrJoD+ikNXAY=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=pufAMkqImKryc2WeiK9STgcYjGsk8QAlM262WJ2HPgzURojcNFoIOZgD03lb18vIlT
         LfLjmx4CAaeI+xThXhaA5LGJi9bA7Lmiaj/V1yyxf9z+ClKQbvl8Cav2Ggg3Zf0bxTMt
         Fr68hGg4myrg1W8t5m2sa2EOOIjcleY3iQ2enNOktK+HtJln7YlJqVFMDI+iuiIn0zsw
         a3jkdjJe63bwuUqomI0Gt0+rPThIMIY7Nj/TAvcAaJ7cntf3fsdywWw8M8Z5fd9OLoPk
         JcFimkpz5m0hqPWqTuvfFpQI8I8yDoqYO7uq/TWDHDOjfVlcqaE51UDymjcYyrxpB1B0
         DJxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zCgbqNCm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w10-20020a170907270a00b00a1908ecc5e6sor232056ejk.0.2023.12.12.04.36.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zCgbqNCm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384580; x=1702989380; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgOgJWBHHDbLNzyjR5V9GijCj9jUXCNUrJoD+ikNXAY=;
        b=zCgbqNCm12p1A0nk85nE6JqG01eqrl6OhK7OM4vpylJjQ0mexdQymNzO0hsqjICY1g
         7CzaPqMMWSktN4hGTTpZ1KvwQiaa6g1W01bovZD3ga7Dzj1pSPKbpAy2fzmaso7AGDpe
         5Uw77RxbZRjY0x/t+pug8z56oJHgIoee+NQjNmuBIFTmD4vPeJoU2YvYJffJLN8MDoLe
         WOoM/5YZ8Mt0PBzKcNVEQm34dAx03Cjhvc0HifubrfzRul/DepcQ54nGEP++JkNYZTAZ
         guh1ekvBUv6r6DKb0lMd7v4yO/2xsLrb2m+oAUcUW9nEPPEWLcS5qhnLE7hSmouHCb3x
         CY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384580; x=1702989380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgOgJWBHHDbLNzyjR5V9GijCj9jUXCNUrJoD+ikNXAY=;
        b=pH9PPW5kh8Flwvo0aNyzY4fHZkk7DT+tihFxMjqBkSRdQ/hXUz2jefBfUzrlpCwJVW
         jT9M2UBPsKU/XW306nqSijNhrVrq0xXLB241XIMOmaoiqr4ctMcpXO65THnt5f1u3OFG
         JC5fdqu3Ng5rzplVNtC77WZw+DRfrqfD2s1O1jKQCjRI0GqDhXWfbkGnPyb0ATa9OkEw
         fkNd8AoVNMkaviROinML49+5itavoBM6Z8WdBIQ2bfn5LhL9YoSoRYSQWcBVh7Yb7AEn
         m8/FgDvVyn2atPqiQWUEaYXJrHf9iUasVz1DbNJhOiODZ3KQb/9MyiC21XfCJk14Ca7n
         KCag==
X-Gm-Message-State: AOJu0Ywrv+2eIBCI9s+uD0AM8H1Xf5vicPbPCLfdwRf231Gf8br4n2Hd
	hv1Nj5tsasX5MCFTWcgaXtmlgM9J
X-Google-Smtp-Source: AGHT+IFSlK8zlLL9+s+RxG7rRJsvN3NU7AOmbuINOJQ/1pFD/8QvhHBSZ6sriXNGzhXOnLahHlG0/A==
X-Received: by 2002:a17:906:6a27:b0:a1f:6551:6405 with SMTP id qw39-20020a1709066a2700b00a1f65516405mr7283292ejc.37.1702384579791;
        Tue, 12 Dec 2023 04:36:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a1caa50feb3sm6146677ejc.40.2023.12.12.04.36.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 19/23] exec/user: Do not include 'cpu.h' in 'abitypes.h'
Date: Tue, 12 Dec 2023 13:33:55 +0100
Message-ID: <20231212123401.37493-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Oea+I4WfFBm4

"exec/user/abitypes.h" requires:

 - "exec/cpu-defs.h"           (TARGET_LONG_BITS)
 - "exec/tswap.h"              (tswap32)

In order to avoid "cpu.h", pick the minimum required headers.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/user/abitypes.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
index ed10d5fe7e..fbb55684d3 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -1,7 +1,12 @@
 #ifndef EXEC_USER_ABITYPES_H
 #define EXEC_USER_ABITYPES_H
 
-#include "cpu.h"
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+#include "exec/cpu-defs.h"
+#include "exec/tswap.h"
 #include "exec/user/tswap-target.h"
 
 #ifdef TARGET_ABI32
-- 
2.41.0
