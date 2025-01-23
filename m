Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485339njk;
        Thu, 23 Jan 2025 15:45:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMNs2NG7GnXZvFod+jbcDdVRBg43bFrNHD5h1PWGJbD2uq4ZpuMYaJzfD9ByviUCZNXPLgJUXO2C7Jng==@linaro.org
X-Received: by 2002:a5d:5f54:0:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38bf57a662bmr23500041f8f.37.1737675925079;
        Thu, 23 Jan 2025 15:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675925; cv=none;
        d=google.com; s=arc-20240605;
        b=f0MhWsuv3rrTbNjnEs1uOH48kq20dLACai1nQQkUJIZnL3g8POaBEfVoQHvNvFt7YL
         w0Suc842cvcZq3YWvvr7Gc4HzyeCKz0piBheyvFUQruyGzZ0jrDRHtp+IxsRSaKvnJ5d
         sDhtYHGXWHAjx+y4tZVVZWfyrxbQiHEu8rbR0wStWunA0DZKgIw2N34mYK1zdOREGCIQ
         e1YQhdpr6+0x+VrE8Y2dCkAub727f4yccbxMNw2f1q3EgnIHfTGMGh1Ask1jYVaSyy9O
         ttrQCWlnJW+Ukgmx8hE0mCAu+QfGPqjchynOttmTDjcqBzDuDWn2lO+cCSwgDghPs/w3
         CRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
        fh=Tbe3g8YK/jeLcZCeqj0W3pFXgIEPgQ97O60MQRJwxgM=;
        b=lsN6lIR5Kk6ohERZH7gsa7f9EfFltrm6cNj+zDw4N8ES/xn7kuKdiyoRSrq9Rhh7U3
         zA1wxgUfgQ+/lHHTXpicWUJn9Bf1jO+F6Ta8y4TMVxYrP16ZR3HbMpFRDe+xogJjSsJN
         f+LLWXAaihT5toghMTZRAVjEF4AhhNSjs3/xGMCAv3IDaJ2vimA8Z0mTek/UlU/jrwt1
         W8dRyLAzbEX8LkGbrKuisUrkM4QR2bH2/1beWvJTOrbnsT1O8gxAkWuTULnfnDcvuWn+
         3jZjY0J8UH6cqC6vccecYjl0Qgsy4pk+7iQgQPoSnDzqQCUt1qeHFe3wv00tYwL7delp
         GTTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DTW/bGkP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4e0591sor1511335e9.7.2025.01.23.15.45.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DTW/bGkP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675924; x=1738280724; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
        b=DTW/bGkPjEcSoHgZjoZe49nb0H4VAjAnr4z13KALZrG8nY7fFqgvT6HO5vHI4DKr0h
         I0NOYn9PDPTbname4WB4AasNYsSvlUP3DVTz9UYjtR/6svksWbEiF2Mvviise7K1H56L
         Sy/K8O1Bljf3uY654xaM8JKYtoHw7X5Amja2TkOIIoSSAZBtLrdunbtCVGbdRBGXh0yi
         as57T37QsWrOo2rXXRs9b8Nfo+0PDLiKiupKsPBxM1yM2eduLS633rYtI5Mnzi9e2Vyp
         9Kjf92A6LfrqvEbfRug8+cy9rSMxRcZBm1OiX/D3pDnvwMlz1e+oGRjCKfjInNdk2YPl
         +jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675924; x=1738280724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
        b=XGoiow1r9P5wiVHQo2jorZAo/4VQc1X7B7GIOjELwgmZdbYlvP5a1OiqWG4mui36Bj
         PaAKB0tdHKEny0NjFK5W+qA4ZFoeM1eHwsUK6fDdEGrlWrTlXIzhQ+ryEJ4UWGo17Tcc
         tNQapv5eeNKg/ny+aFwv+yfDTO54u97WILLvnyzchRgaUCkKrH6llkHpQqC4G0/OjLui
         s5Xe3y2iISFmlnGIzqzdeFvaxv6k/jZAGswYPny03WJ8fMyedSNek+xw3aVrrOFDtHy5
         MZ4qBSu7DJxiWIuRfqecZ4XsC1vVf3GRep9bGJqcTz+arNByhtp4onMuL95084YFMPBw
         YeLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIU4Gb7DgTK9yYrUm1eGKh6IBZNPyVF/VhkKm+85S40VFj/U7buJhip/OTktKrda6f05M+JyAjKImjAA==@linaro.org
X-Gm-Message-State: AOJu0YydLSh6BYUjfmVuR2MYtc9a7yqXia/vPr42P7oSQs4yPsoFKP7l
	KqCq9d91VV/sqlw94j23VQYYborVnD6Zc9lhp0lUd3dQ8oOVTAN4JXPZ8Cn4bvQnDQ==
X-Gm-Gg: ASbGncug1d3Uav+EzWptB9/pJwgHUP7qAH8znIJzFYlueTT6eJ0TAE/3Www4OMM+Buk
	hG/TkOj84nB1Okg3P2T3Tf2bTsZIVBcWLat2tobt7FPqkJ5lPChUohLEBSIyOO+wrZ845qf0oLf
	IMzsjpsoCZraGzX8VwjstxAJKdH4c2c2yM3QDC4meiYvGmu4298rEbTq9qKBE7kDiyIEMgcVYIO
	FyEGT1sCHoJ1NpOmsL3vOzEBxTeScADDzEbBfs925vc4l4HAAVwPWcZ3f4jD1OJX9PSkH1i8nFw
	c3NabHp3B6mIinlJvULQXpUXE5QOLlWoXb2vV19qA8ZOUAyNXcdXe8s=
X-Google-Smtp-Source: AGHT+IEwKoXpxcAtZxGgBrKoty0PAI7DEzj3vUSJHkmHg5BnQeEwYri/vD7fXqCVh16ykXZTkiP5lQ==
X-Received: by 2002:a05:600c:1987:b0:436:faf1:9da with SMTP id 5b1f17b1804b1-438913c68ebmr255744445e9.2.1737675924510;
        Thu, 23 Jan 2025 15:45:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa416sm6932195e9.6.2025.01.23.15.45.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/20] accel/accel-cpu-target.h: Include missing 'cpu.h' header
Date: Fri, 24 Jan 2025 00:44:06 +0100
Message-ID: <20250123234415.59850-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lQrfqxzdCQOQ

CPU_RESOLVING_TYPE is declared per target in "cpu.h". Include
it (along with "qom/object.h") to avoid when moving code around:

  include/accel/accel-cpu-target.h:26:50: error: expected ')'
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        |                                                  ^
  include/accel/accel-cpu-target.h:23:33: note: expanded from macro 'TYPE_ACCEL_CPU'
     23 | #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
        |                                 ^
  include/accel/accel-cpu-target.h:26:1: note: to match this '('
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        | ^
  include/qom/object.h:196:14: note: expanded from macro 'DECLARE_CLASS_CHECKERS'
    196 |     { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
        |              ^
  include/qom/object.h:558:5: note: expanded from macro 'OBJECT_GET_CLASS'
    558 |     OBJECT_CLASS_CHECK(class, object_get_class(OBJECT(obj)), name)
        |     ^
  include/qom/object.h:544:74: note: expanded from macro 'OBJECT_CLASS_CHECK'
    544 |     ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
        |                                                                          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-target.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/accel/accel-cpu-target.h b/include/accel/accel-cpu-target.h
index 0a8e518600d..37dde7fae3e 100644
--- a/include/accel/accel-cpu-target.h
+++ b/include/accel/accel-cpu-target.h
@@ -20,6 +20,9 @@
  * subclasses in target/, or the accel implementation itself in accel/
  */
 
+#include "qom/object.h"
+#include "cpu.h"
+
 #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
 #define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
 typedef struct AccelCPUClass AccelCPUClass;
-- 
2.47.1
