Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953098ejd;
        Thu, 18 Apr 2024 12:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8Udku8JOuQcyA84BTykxxo/jB3oJb9IUFFQxaT1GBkbqtC6Ib5zjiLmwxzR75LxINdo8MWMGoqP94at05MuiPlLRltL/+
X-Received: by 2002:a17:906:6d4b:b0:a52:571c:3d7b with SMTP id a11-20020a1709066d4b00b00a52571c3d7bmr53730ejt.59.1713468465246;
        Thu, 18 Apr 2024 12:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468465; cv=none;
        d=google.com; s=arc-20160816;
        b=ae1bdh7k5hGvqWlj2lZuPzXdUdXI3Fppw4/+sOmIxSR+WkfVds7+Zy8O7pVdB23aGP
         cD1zW1r79yc47cG19o3qLBqIXJzFFLpRnFCYyWYmNX7joxlikPWd9YaZy7LEKKM5B+x+
         IhBM9ingKp1xgW8m8R66ZJxpUAru7a+/6LWycDeEi6KKcvAzjzid233Bx6cIXw1bM3z+
         TpHPHJNWhcKxpzNE0vkUrtfQ3QPNARPJZcYjohNCPqyyp9OEbKX/nhWVloV1Wdqt9xys
         QPjK2VhIubAjPLVFsSumi21aDxTAf72m8qXm0hRmxS0sKGREsEsc0LBNyJRKHQSpasu8
         YYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zuWZ6VCaeCTfKgGM+fcYzWiSC9LIi21t46RdwEg8Jqc=;
        fh=mfWpFzD9a8AyEaP2xHNkbLN+t/nm5MLrL+bcLziAuz0=;
        b=ZMuCg6fJLHTDYHDgCUG2Y39TyjKSlDFGhe/meHERl2icbl3chmuaLQuXqpqDD8LhCP
         3BDcHmYcqmPKBQ4kIK6pgXn4GZPlLiVGXN0BkluEVGzkoqxlB1zFukmj9KKEbd7vLKWw
         7+x0nOw8N9fznUdDi3cdrG+SNWtM9nocNCByDwtJ+9lHECNy+vvQi8+gh1zPmrwMZ3oA
         oHP9QKLhKr7NdvpqzD+BFzAsxhmBbGwxUFcMHzh7nTH5gTN62F5II40LkKHkJjXH69Fr
         N8KQMJOnDEaxV08BSeF2XERojd6btARJpNkUvZaCHoEno1khVn9N+GOGP/hqhoV3X30c
         onqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lAqN98rw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s19-20020a170906455300b00a5251bb1419sor673442ejq.18.2024.04.18.12.27.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lAqN98rw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468465; x=1714073265; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuWZ6VCaeCTfKgGM+fcYzWiSC9LIi21t46RdwEg8Jqc=;
        b=lAqN98rwXu/Px4FxUhU7kUDIAMTzNrBTkUJxPjzhSpWVoDS0wEvhUpYpMeDoSYc2LR
         b5e9VoHkaAyTvpkqTMsqpce/07JVb/DD6z9rhIL2BT9xZjXvjEdICMTlSaS8iZhYE+1C
         BdUDbkbkuAFJtWV9gyyry7JMWV9RQE23Whl1KfEJOQ1A+FrDjg1L2jaMFB6yIwCORCOZ
         VVplycVNy+kcED0L/JUyI9cR3qFhc+2Gvxwdc4gkq7DhBj1FiIL8YxOXmbtPRO6uMgmj
         8+pkLugX4K/anjLqKuskEHPz2eqNyl5n+eE5GJl4vhPcD2BAULRvhXkHAjH/taIFaGX0
         Mfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468465; x=1714073265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuWZ6VCaeCTfKgGM+fcYzWiSC9LIi21t46RdwEg8Jqc=;
        b=Fg8oRFUTM9WbIb2oAx5z9NFN6TjkDFJKnJU883/cJ1eeYp1RsLg2iQnp0PpqEvduVD
         /jcaYbTYUeOZDKjDpC7DTyK9YcNOy9ZmmKE/csikTuX3g1USO2E79g2llZALyicIjRzX
         5cRykZaRDdHiM58BrCQh7pG0cSfsw3hU1AJKs4iBBJNOzmcej66c2oqOjkzywxVtaBDG
         AGnrVdi2Be5DYL4kW8+SdXdhrLZznmIeN3ksFDAqhwEZ5RT9N7En6F7/eLqLECYoWbD7
         SRN8vXX/rjWwKH0TYfJUF/EImSkWBH1O+CxR/41Nqs+JB0IFTSOqfZs+OyBvu0utEmAj
         e03g==
X-Forwarded-Encrypted: i=1; AJvYcCWFiuFOKtKDdIqshYOJfRE1sCqGc8uZNYJHBTUmQ76RnM+3MlY4ILqAGl65FaMDwM9Rit6DUlnRu8ts1BcwTH/NeDIIwhsX
X-Gm-Message-State: AOJu0YzpI0kF4yFNT8eJITxCubdmItCHO5MYvAWdAYnAYDxwgIW3nE13
	1LviMK1MQ6XtKIpk90bCqr/4+9C46x3OIEa4zkolSaqIxV5WLQY5xA/1MSPY65fKKw==
X-Google-Smtp-Source: AGHT+IHNrvZlZ7Uei/H294UHaKVP1n4MPQEnwPA0Hao+SxNQsQzhpCkD7PK2coUvXZVR5L3VPti1CA==
X-Received: by 2002:a50:aad4:0:b0:56d:fca8:d209 with SMTP id r20-20020a50aad4000000b0056dfca8d209mr113241edc.10.1713468464845;
        Thu, 18 Apr 2024 12:27:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id fi5-20020a056402550500b0056e598155fasm1213489edb.64.2024.04.18.12.27.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/24] exec: Include missing 'qemu/log-for-trace.h' header in 'exec/log.h'
Date: Thu, 18 Apr 2024 21:25:16 +0200
Message-ID: <20240418192525.97451-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FcvGyPSrSrvn

"exec/log.h" accesses the qemu_loglevel variable,
which is declared in "qemu/log-for-trace.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/log.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/log.h b/include/exec/log.h
index 4a7375a45f..e0ff778a10 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -2,6 +2,7 @@
 #define QEMU_EXEC_LOG_H
 
 #include "qemu/log.h"
+#include "qemu/log-for-trace.h"
 #include "hw/core/cpu.h"
 #include "disas/disas.h"
 
-- 
2.41.0
