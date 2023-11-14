Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083235ejc;
        Tue, 14 Nov 2023 06:39:49 -0800 (PST)
X-Received: by 2002:ac2:5612:0:b0:507:a58f:79ac with SMTP id v18-20020ac25612000000b00507a58f79acmr6040832lfd.33.1699972788856;
        Tue, 14 Nov 2023 06:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972788; cv=none;
        d=google.com; s=arc-20160816;
        b=kTXofpbW//QCuDqhI+P6RnV5lgBMxRaP3EUn9vwQY2+7ceOagOMUngXXr+J4gk8nsV
         Zz4hVwVwKf7DuCWNl4WznttSAk/LVU5B8kP2nPsl5lIL8TMSG03I/Y314V017bOC2Qt3
         QjrLDsGk2DgjPERFD1/xG71HFh2Cdh14fHqEPuFVSGHJh6TPwVfb8uk9VBw2AodLO4EL
         9JQxRK26gjQh416hvY/S1dPivY6bD5CYmfmJq2NwzV2I2NZ4dommtItMPdsTrPOx2xen
         9nynIZmpv9oqlpPZgF1P5GbrF8upRCQuKPMNost92aD20rxVk0Qx3ExR0uTXKqraCgOS
         5xQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=x5X2FluBMHtEHwLVURbcbmArZUeMN34wqMB+9uG3SGg=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=zlXQvtfTGl8fPU3iQ9CsYwFGDl0vOIQVrj4zrG1/ZHN9kmhoncK7+QsIPmbrxDMFBs
         NHlSQ2sl1jin72DV7oEUVOO6wR/NB72tQZ8RHjCZLuU+Y03TnvCpGgh26XiE2NzAKjEK
         QBFlKyEJJkhTEq6/LHpcLmsoh9TpSdBeWtQjYDLctf079XqFTQce7j1R75KLGZFuZm17
         xRy2ZK/7OWzs/vsIUJ55Ol6Cm11hLfXsmsexe58jiejoecCDQGsWsPscGFAUwL9xfe9o
         TGV5LRjvOlsevu7OOrYnsSa/qGqGWexWqfh6DSAYm30R1PDStxNxDdx4OLU7eJ9PuT2p
         HX0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7j5bl3X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c20-20020a196554000000b00507a6b9f3a0sor1712184lfj.29.2023.11.14.06.39.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7j5bl3X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972788; x=1700577588; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5X2FluBMHtEHwLVURbcbmArZUeMN34wqMB+9uG3SGg=;
        b=j7j5bl3XDmerb7tjreqrLxVcIOCJ+iJRpmMaPWdp8cKdQp/lAdIQ/tn5Efy2+QOymQ
         +4K/eUoUAXrQ8UNOzjHNVl/JdBK87DCX+vs4+Ef2k5MxPAhoyzpHmjqw8Pfme0BLELma
         3/U19t3YX6ITR7WiN3mcSSV475WsO//ksULoygb87nyivMbk5+1Yv2BD39kABVTaQxF8
         QyBVYbQV6kKwDsr0PomRPV65vol21yb798YofEH9a+Jz/N4l7P4Tt85lZkw1ECFO0dAv
         FOT1nqAykz35D407SqCjPK6z5aBWLUYGOd4ehsQRSsKqYTcrZjVJ5ejnyxcAwugjjkuG
         05WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972788; x=1700577588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5X2FluBMHtEHwLVURbcbmArZUeMN34wqMB+9uG3SGg=;
        b=Z5v9TNVWDMZBWDQe0n6pMWTuFbC7P0zbFMaNXBYdfUChh49IkRMFXRbY7O20Zgsvf2
         0LRZmZTE3dhsPyhS6v5q5VbJMto370Z7iaeG9rIiiFZSRISXV0UZxNGVVX8cgYadoCAV
         hBxYfa7d+0OBs7njm+BhX1pPfR0lSPiIT9Kj1KjAbIpD74uHEM6AF9t9XopX87MmZSaI
         G5lU5CQcRDUSMXR3YoWmk89wZvIcshMCN3vERifsMGHEdhMjWvcchGGR/UIsrBaWIOvJ
         0eRqBMQrnJZPrAHSa417Ixl5KbHONjKYiHUMbsEnYW01nweVlXzGlhin/wkZk8gWkdOV
         /LPQ==
X-Gm-Message-State: AOJu0YwvDqoDSPrWgBIteh/T4JKhuNBrgZPAWkAjt4G01hAyGVW5t1JH
	I3laYQHfC8TsqAboQDrfijXRUP73
X-Google-Smtp-Source: AGHT+IEJ1DzMQPrVK6vmcQ1s/BHFe+ZR138ty+E3IEfmXhpEvhlt8hMy3AYRKnboRNNE1Pe2RYsE2w==
X-Received: by 2002:a05:6512:b14:b0:509:8e3d:7cb0 with SMTP id w20-20020a0565120b1400b005098e3d7cb0mr9400030lfu.41.1699972788532;
        Tue, 14 Nov 2023 06:39:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id l18-20020a50d6d2000000b00542db304680sm5268842edj.63.2023.11.14.06.39.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of 'target_ulong' in handle_ioreq()
Date: Tue, 14 Nov 2023 15:38:09 +0100
Message-ID: <20231114143816.71079-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EV6Nak/z48z4

Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
function to xen-hvm-common"), handle_ioreq() is expected to be
target-agnostic. However it uses 'target_ulong', which is a target
specific definition.

Per xen/include/public/hvm/ioreq.h header:

  struct ioreq {
    uint64_t addr;          /* physical address */
    uint64_t data;          /* data (or paddr of data) */
    uint32_t count;         /* for rep prefixes */
    uint32_t size;          /* size in bytes */
    uint32_t vp_eport;      /* evtchn for notifications to/from device model */
    uint16_t _pad0;
    uint8_t state:4;
    uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
                             * of the real data to use. */
    uint8_t dir:1;          /* 1=read, 0=write */
    uint8_t df:1;
    uint8_t _pad1:1;
    uint8_t type;           /* I/O type */
  };
  typedef struct ioreq ioreq_t;

If 'data' is not a pointer, it is a u64.

- In PIO / VMWARE_PORT modes, only 32-bit are used.

- In MMIO COPY mode, memory is accessed by chunks of 64-bit

- In PCI_CONFIG mode, access is u8 or u16 or u32.

- None of TIMEOFFSET / INVALIDATE use 'req'.

- Fallback is only used in x86 for VMWARE_PORT.

Masking the upper bits of 'data' to keep 'req->size' low bits
is irrelevant of the target word size. Remove the word size
check and always extract the relevant bits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index bb3cfb200c..fb81bd8fbc 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qapi/error.h"
 #include "trace.h"
 
@@ -426,9 +427,8 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
+        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
     }
 
     if (req->dir == IOREQ_WRITE)
-- 
2.41.0
