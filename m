Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865114ejo;
        Tue, 12 Dec 2023 04:35:31 -0800 (PST)
X-Received: by 2002:a05:6512:3996:b0:50b:f2f1:9787 with SMTP id j22-20020a056512399600b0050bf2f19787mr3442183lfu.20.1702384530885;
        Tue, 12 Dec 2023 04:35:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384530; cv=none;
        d=google.com; s=arc-20160816;
        b=RC7a9WFMNsFbVi/qQ5zpisY3eOzUArOB4SP+YLa4w68GXDcsgCM8xMwV9GD8L6NFIt
         hQovVZVsl0lBUQzbnt+pnKTgzX2HaW0Vo+fxBVL00gjSJQ4FCBlpaGSZ/4u1zw+QbLeX
         PR0QjvsqCcOpBQjDEXOGMrkzdoifUMfYWNQboIqetomk5V3ttFLVPVKhjIcWxgYOPIy2
         2FGgZi/Goc+QqfO/2p1xg3htL/ATbDi8mW6D7zStshzfATBUDJcwAVlewS1S/AOTTTwR
         MtLoAe8lRqMIu7NiVFRi0Yv+UwOrpREvQUMqA+LnTMdavuh6UwA/CuIf9WnV+yELCVCA
         5KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PWTWSX0YuZXSOblIfpck8oXRK7z4+HrveIQtpqWVbLc=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=NteIBTbtYsu9GFn/lXmtsBfm4PPNOzTYJJtsEu84pgYB39XTgZqA4Rv2XACbytbp8C
         nhNCle2zZO7F9sELSLDX5carBNmsQpg0ym0gZVfxbNgpmQCFp0gV6nwjmCeoR75FjBVP
         5m4tcXuxfO4n/2/UCvKdnNYL25Lk6DLtTPN32xVxT2q/vRwOfpLH+4hzbY31FTBZEh+O
         aoYLspK+YqVXV1qYwh5Hwvk8fsXryNEsrhBBI8PtK7d9ygOkuY1dcSnvW2RkABogmPoi
         FFBbDd8XuIwJzElUJIHCj56bGZbpg+KtMJ8BDefclOeRQgNf7jIwGUjLSrbjq8PnXz0V
         23EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acrIkLMl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g2-20020a19e042000000b0050bfd5c02a9sor2196132lfj.7.2023.12.12.04.35.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acrIkLMl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384530; x=1702989330; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWTWSX0YuZXSOblIfpck8oXRK7z4+HrveIQtpqWVbLc=;
        b=acrIkLMl+GSs79jiPcqwb8/+APgPRI/h+JWd/hI4zOx7pMdXxEf8DkgpERqy4/vHNo
         OoWhZJzjERbMZtSBw+IAJFsnANo7UAUyL1R28MWc6YcXj3tmP4Nr1d0D5iadZ+t8cEVh
         2UcjYfeE9NlNOOd9JpmbTCcB9FSx7MXY/jzKA2ZZDdFDHNMPW2Tg+GkMtOYg3yYngS4r
         qi+DffMzLMUEhjSPIiCAjjLujdfPKR9vec0uZqpF0y0Y+GchIJiWSA2Ub8ebilLZn6kb
         UiJbvskjFMpdM0IWNG64omd4aB5poKyDTnF7JUxwgpfWbbNkOdYhDmjhhyY04kyRCOpa
         y2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384530; x=1702989330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWTWSX0YuZXSOblIfpck8oXRK7z4+HrveIQtpqWVbLc=;
        b=IP8Mku4B74ruvuefS5RESpudi49oA9BF1jUaUvz3IyTZ2htloAENpMEaaW9+LYbI9p
         fZ59u7x6nVmmruxASikrkAGlG9GjCBG4dsFiVwuEECt6F1C8p9wi1gTP2SH2jVbZ7+Vc
         KxW1fOo8ymbay1KTzDEZv9yQvIvW9JLGC/QzRC1Af/eHaf7jvopR2M0RwqYDYCzG4HM4
         xXqwoES4jG4dqc/MPzfos7FzLfZAj6+boWOqMWtA8bnh+JQgMKCAj6pSIwXEci84uZmc
         yZedSkriu34Uf97Wv4lsLW9hYMHDKC7qN5EDeyYOJ0hQKod0KnDOSZdsB2OeUZtLJ2Sg
         LKcw==
X-Gm-Message-State: AOJu0Yz7hLdrOCerhBMNsQMYZjW+iYvmrv8sTfS+bZnF9D2jMyzh/XtS
	rNdf5aRvyyAd2/8p5hfqIM5IbPoM
X-Google-Smtp-Source: AGHT+IEhYJrFKPlMafPspSJiUftn6/m/li7QS7vjKyB+2LKFfs8JwApwiBh+ARJeGKVQyAF+ouWHZw==
X-Received: by 2002:a05:6512:2810:b0:50c:e19:b65d with SMTP id cf16-20020a056512281000b0050c0e19b65dmr3729352lfb.85.1702384530474;
        Tue, 12 Dec 2023 04:35:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ty6-20020a170907c70600b00a1d71c57cb1sm6227530ejc.68.2023.12.12.04.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:30 -0800 (PST)
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
Subject: [PATCH v2 12/23] exec/cpu-all: Remove unused 'qemu/thread.h' header
Date: Tue, 12 Dec 2023 13:33:48 +0100
Message-ID: <20231212123401.37493-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z4R2heY06/3/

Nothing is required from the "qemu/thread.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a7b5737d3..26b44ca125 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,7 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/thread.h"
 #include "hw/core/cpu.h"
 #include "qemu/rcu.h"
 
-- 
2.41.0
