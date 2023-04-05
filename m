Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp479753ejb;
        Wed, 5 Apr 2023 09:05:03 -0700 (PDT)
X-Received: by 2002:adf:eac8:0:b0:2c5:4c0e:3736 with SMTP id o8-20020adfeac8000000b002c54c0e3736mr4464736wrn.24.1680710703548;
        Wed, 05 Apr 2023 09:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710703; cv=none;
        d=google.com; s=arc-20160816;
        b=xu+Sxde6PqeJO1znrJ3x5o8VAXD+NjoyEsW5PGGzSCnZpbfLjN0vPUkHl9Sb6MjM/v
         h5hKy/9w4D/ksOhU+185DWlgvyohry10gb4fNo1W+9fe3JVo0GvcvaHxJVpERG84rP3M
         qmjVhsbzJ86qytAnvrKPMMHyexQi8rUIPkhsWkTgGsAJLTiF77UYKnbZCQrmUBj0y0Kb
         zibEHHrP7UmkNZX4JMLyznAOk1nezkiHWQxE/t8s+cWpAl5bC58dp/8QcN23Lfp7wo9i
         snckn50d5x5rQyli/JbYKmmLbdN6m9ptbBNSXkvQwmeGwo0A0GSnVnXqt+JopMKONLnp
         aKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xxoSzGepGv7BmEwhIUriUkTSi2iiaajTQsAiWFvibwk=;
        b=J+z2y0+QItsjv5kFIN7F5q6L1ElhSsZaDj/ShGcfU9bjBMUgF162CXOZASV8nz2jFI
         YW2wUFdiR0P+7opD98cldl+XUPsVdVT46kv6OKbVCgN390hHSUyF7xu5z0O+HrYn4fYE
         eQIu4wopu8h9vRME9I72jxNBPAjvJPhR1yIiANFgplrHuL+ia74WFgcwYzQ8rOhMWwSs
         SrpS9U29E0/pQOj8asGmnYw4d7GVqiHaK4N8bogIvE3VRLnWzvJ5gVMVAsHN8/qD5suM
         m0nqGeysa/0mIX7UNbAnxlcMBAs56ot3skHGRN8J2JVy+WpqbQObS+foYI5CbouS9Gi1
         3fnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQmQx5Ib;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i17-20020a5d6311000000b002e619235763sor5294162wru.36.2023.04.05.09.05.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQmQx5Ib;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxoSzGepGv7BmEwhIUriUkTSi2iiaajTQsAiWFvibwk=;
        b=DQmQx5IbN6E4g6+BkWxA6gztVY7c/sHCIzd5stHTLyHiWOEkRlEtrivX3vqbDbGjL7
         XxhqdFKDllanEdiwIR+2geFMKUEf51/bjTU6C1eN4FPCiqJiX82RtiNDDdUc4v8TZMlS
         hfE9xJx7iUvpEr/MKnWta3hPHTH4tZxYVjBbZjbRVHV9SQjjE7MOqQkE5Vx8Ki+X5wTp
         c5TkfIiumSxeeb7KERAMfNwXTLH281hiqor5R3BeKHaP0CWh9xqCJFkqSyE1Ryn0CRfG
         Wa9APsQXMmO/K9sEl+9/eYdh12Me4fUTC8mQAdjssj9vMZeCKSBjNoCuzIYv3M364S11
         1Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxoSzGepGv7BmEwhIUriUkTSi2iiaajTQsAiWFvibwk=;
        b=kxqd1JGDICdUKO74nR+lpsbvtZfPW/1yAM2/hPD5Mcstx7X3i08e88TX9k9OA9gCeE
         sFEYSgMk8neClYmvhLDtP3m4w+3lOb1jY8znzze2SSLyyDLr3jvfhr93tGc9DAGi+4Fz
         1mX3fO8QaQeumCGF3acjmhiVVh+qKJDpvZV4uQmn+yJSSUA/mbssk2VXFAT+DOaBqtS+
         LaQah9FzFz+kKdDBNxUnRifcBB+A324xMdkWojr223zuB+rOk90Q/YGBqsRdXpgNq6zm
         Figb6iZn8Vqq3bWbJp38R+XhoGBEiHDB13j97tjMx+p69/+gIjoTuhSTmI++DDaaIv6t
         OGjw==
X-Gm-Message-State: AAQBX9e62eszS62nRogzxS0reVQi36EUxwSuEOfoRbpVQTet1yO7OINJ
	5ulXTfr/+4p29BWsn4hLpPijLB/mloyZOdWmzB/wmg==
X-Google-Smtp-Source: AKy350bS4fbO2z32Jbhpsnm4njKJVeihL7eN5HhQ5ZKA2WfgsKUiX7r37OaZuRjkvBKDgyCpYJKbBg==
X-Received: by 2002:adf:de8f:0:b0:2dc:c0da:409 with SMTP id w15-20020adfde8f000000b002dcc0da0409mr3979004wrl.27.1680710703263;
        Wed, 05 Apr 2023 09:05:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id k16-20020a056000005000b002e116cbe24esm15293404wrx.32.2023.04.05.09.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/10] sysemu/kvm: Remove unused headers
Date: Wed,  5 Apr 2023 18:04:45 +0200
Message-Id: <20230405160454.97436-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jn71+EPh1DTx

All types used are forward-declared in "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index cc6c678ed8..7902acdfd9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -16,9 +16,6 @@
 #ifndef QEMU_KVM_H
 #define QEMU_KVM_H
 
-#include "qemu/queue.h"
-#include "hw/core/cpu.h"
-#include "exec/memattrs.h"
 #include "qemu/accel.h"
 #include "qom/object.h"
 
-- 
2.38.1
