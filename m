Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953273ejd;
        Thu, 18 Apr 2024 12:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXolo2Rw21wwRgugZeD8kEI0jX9jBE4nEp9nCpCAvR32hJL6ah2CBla+iiaYG/gHfg/JpE8VD2MUKoQv/YZvGAirG3EQ4u2
X-Received: by 2002:a19:5206:0:b0:518:9da1:7afd with SMTP id m6-20020a195206000000b005189da17afdmr8241lfb.4.1713468482607;
        Thu, 18 Apr 2024 12:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468482; cv=none;
        d=google.com; s=arc-20160816;
        b=FKl4O+0TiquVqqfK49PlHaMT79Ewr1lqKy3tADeS5rbT3q/+JviwcbOywYMqf4X88k
         yLZ5ZT8oBcQ8Ny88hn0smGCKZ10QL1IkfGuxHPTyGd4OJ/Th0HsjEaKKT+9kyjBjf0Ux
         orb2JH1bqz0stg/mKY+YPYCKPRZ0IwAE/eNHhto+gcGqWqQtSj3F2g5BWJwfadiAO7cH
         1K+eBF8y//sj4mQ8mYTzUzCqnlF4hP87D0eppVZNQfxWRFAo/Y0S53qm/3KqWLrve69S
         gOPeJYbb8U8uaB+ZmQDgszv9fxO58+lu/x0EubZG2f4gwFN/4gbPvhPA/SbZwkMKw2WG
         sNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=o0/TLkq+0Cek1YtUvPVSPSPpKhvNS+eTx919tWRRKxo=;
        fh=J3kSki9kJPMoTlci/H9iDRIT9SYdlQvC3bm15zERcps=;
        b=o9/VRZdN89FRzwWQCYX+FFpUWeFTHo4vsZHrjTmt1y4L+CtJp1FkREPVIhCcauo+BE
         04o3/E4vsLle1EJfTsmDOqtEf/ERJpEEK7a4Q6LS9f+DdOoqZ86v9LyptnhR+++T7G1t
         vYOgNkoG13YRr2vg5bdPsZ78/J9tYbA8Boz3vaqFZxYa37p9/9/FaMbqQlHxg3UR1/iH
         VVAbnuxrB+q79SZGjKps10Neu4iJXt8tQCud9aNSJVDit30PhN7Cu+1eEUDlli/MWX/k
         uYFjs2+lQJUR2qXP1QGpUODZlg88MC4oqPMdFXU5BHhCQ3CttNxa2S5cqOrytbE/IH9R
         tquQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d68BcJHh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s8-20020a1709060c0800b00a555bc7153bsor750850ejf.21.2024.04.18.12.28.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d68BcJHh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468482; x=1714073282; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0/TLkq+0Cek1YtUvPVSPSPpKhvNS+eTx919tWRRKxo=;
        b=d68BcJHhjist12sYfBvN+oXnDP+BD1EQEmUkVL+D23tdwcO6IIoh+/o5B3WKI5Z0yH
         d+NtnFTTUsDnG0D40uRIrguH0Esd5l1vtX4LYy8Wdbw03tw3q6Dzn9zIit4zOsgjPGas
         eEMjL66DVsCQ7hNEkY7D/xAUbFnSuc/i6L0RgVyU2eW+txArnl2J5bDo3QkF045U6j/s
         0o/dSo+ir8oW2g9hud5lO6yyLmEufeu96sezENY6/IrGtei7OduIB5k4H6idqfWVaW2C
         RXRd9wGSBgiQwR44iXTn8tKLhfikhDRJmHal5t+Vw0efh6ozPXiJmE38VjfW+STxo/NB
         K1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468482; x=1714073282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0/TLkq+0Cek1YtUvPVSPSPpKhvNS+eTx919tWRRKxo=;
        b=r+sM83+M/i8x3OhifTxhay+x5++6iQp6KqpEc0uNG4TQzl1u8lb65qLlx8Al5nEtkm
         KE993xmpSP0Zd4e13+mGQdq7ZVoFayDkToFfFlXNzAFiAuZxTHfuYzOQYQ1jM4K8ATZx
         vffYPWK5Z5hy6FwsekS0yvIy4G4X85yUdy6Vpijb++iSO8+zfuSsWX59gyb6imjoXRCf
         EC85lmdNdODv7DrbI0rvzKHL6pgsFpMPDcEF65HFbj/8KRJEp0wFAt0wtXRlSZUz7buc
         MvXoyDXXRjVCLqYRgxVSn+bqO7sQDI3yEUBmW++FKkdvvmHIE2KX0Y/JpdCxvfBwyhQa
         c7bA==
X-Forwarded-Encrypted: i=1; AJvYcCWQG06DVmIaZxb/dyMd3248GRefAZf5ELpNJ1yGPvdPhmypZeIXFAbGzmycpU4akde0PjqjhO66Xe9gdzjK6UnwCrpOtsb6
X-Gm-Message-State: AOJu0YyhDQLDFJwZrYTIyjWSNOP3LE4cX7b2ToMId+oSlDdVPzwnHt89
	J44GlUe6HjTN5m6r+oevCGiq2UsdmfSuO81XtC6qoZ1Y2F/6mQbZgsO5FK6K1+VFCQ==
X-Google-Smtp-Source: AGHT+IH9yyvoNEN3HFm6hHVceIDsgByTLejuLf3ciPZ1cvgkKcJXZJEDKVJuDdc5pS0wuniEfSC/cQ==
X-Received: by 2002:a17:906:a008:b0:a55:4d24:6f9a with SMTP id p8-20020a170906a00800b00a554d246f9amr59518ejy.6.1713468482236;
        Thu, 18 Apr 2024 12:28:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906434d00b00a51e5813f4fsm1286099ejm.19.2024.04.18.12.28.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:28:01 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 20/24] hw/xtensa: Include missing 'exec/cpu-common.h' in 'bootparam.h'
Date: Thu, 18 Apr 2024 21:25:19 +0200
Message-ID: <20240418192525.97451-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XZgzjzdrB3Ws

cpu_physical_memory_write() is declared in "exec/cpu-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/bootparam.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/xtensa/bootparam.h b/hw/xtensa/bootparam.h
index ade7891ec5..f57ff850bc 100644
--- a/hw/xtensa/bootparam.h
+++ b/hw/xtensa/bootparam.h
@@ -1,6 +1,8 @@
 #ifndef HW_XTENSA_BOOTPARAM_H
 #define HW_XTENSA_BOOTPARAM_H
 
+#include "exec/cpu-common.h"
+
 #define BP_TAG_COMMAND_LINE     0x1001  /* command line (0-terminated string)*/
 #define BP_TAG_INITRD           0x1002  /* ramdisk addr and size (bp_meminfo) */
 #define BP_TAG_MEMORY           0x1003  /* memory addr and size (bp_meminfo) */
-- 
2.41.0
