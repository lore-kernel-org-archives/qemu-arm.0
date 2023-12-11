Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492147ejo;
        Mon, 11 Dec 2023 13:21:01 -0800 (PST)
X-Received: by 2002:a05:600c:3423:b0:40c:224b:a72 with SMTP id y35-20020a05600c342300b0040c224b0a72mr1762543wmp.147.1702329660920;
        Mon, 11 Dec 2023 13:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329660; cv=none;
        d=google.com; s=arc-20160816;
        b=bL0JNsz351/T4ION7mmEjeN9gQlbx808lHmKshhIWICqaGoJgqEwXruQZBBK0COHho
         Gm+yotekUJsZgkTg2DXBPSbGVfWkIiXZGc+bKRsBB14Oosyt+E8GUO9YDe0ay292Wj0x
         d/k6yFFZlRLqDEEqCju/4SSbHS8uJMIW1Qoq8/3zn5mIyRNd3XlSLowPd0KEGjP3308i
         8dlo/pc0s6wMn8WK6C0MuqBgllTrTXItFlkGuSql79O3ZJezaz46KqtuhGctXCRj32nj
         Bmxgh3Hr5f5oC48QggwTDUIr3mzayr1B1MJJhxGtXLOunRyezy251ZI0k9v07Y0q5hZU
         TmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y/4S5uEaEhG14FzKfAgbneY+HkdmgvAL2IyWQ5CT/QM=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=d6x8tuqHACy/vx8kj8Mox9yW9dUYS+VoWIY2sP5V3S+qPLGCtH2r1ZmD07lpGHzJ8s
         W59DX5m1m19FLAKbwBwhgvKvKI5JNWPw9V8Rz6wBYcHKo4vMP6OKNlaHNp6n9JlCuuQF
         6hJPsswIcNeC/mN3/THGiff/Z7VtR0eYBO1PqQvxlxDsBgIVL0UZuyqIWno8jgqvgbDm
         6+pjhhrBiVe8CpIGKfzU5tcllc7E/W5i25omCdixto6py9NfaHebmNvaUuJAs9bS+szb
         0DNifz7a785QeBTjCAWnv1EvW8uhNg/OlNqJBneoWwGr7roDn+fZqTtIah6J9rhTA12L
         SB4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc1Sb1gi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id en5-20020a17090728c500b00a192ff92d2csor1520192ejc.5.2023.12.11.13.21.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc1Sb1gi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329660; x=1702934460; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/4S5uEaEhG14FzKfAgbneY+HkdmgvAL2IyWQ5CT/QM=;
        b=Pc1Sb1giJGtEXKo4c0glGpvxj8nQsI2QqhIRVZ/s4Gl2FntzVXguy9DrocduZeHGa/
         itwye0pXwLb7LsHhgKKRTx0q86RC3ouolKP0CaEBMk0pPoDVVK73ByRLODbUGL9A7GcA
         DoTPCRfZkLMr30/SWgCtYHJaD/JU6pfLeHFrF4BWLHiRXRViI8GS/BCB/4xA4u8u4ZIt
         cniaZOCAtAtle1/ScpfVYqlrdrpzY4zWzA+TQP2xC7Ww4hb+OTn2Szxz05WMornjato+
         oc5sxXD/PdVE5wXZqJZfuXQt/Q6G8Ez1vFyMvalkkSkeb8LFFwwOFETaC0rFsfaVq5Nz
         rNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329660; x=1702934460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/4S5uEaEhG14FzKfAgbneY+HkdmgvAL2IyWQ5CT/QM=;
        b=n0S6m5e0WJHlLcN7Qtw3Iqcjez5QPMbJSRtt9od0GBxDkYVqo/PCdcI5X+36YbCf8S
         p+7qVuzZHRTo9KGTOYJy5IO+uev4ZQZol47eXcDv9pG38QK24X/LUvB3CsMF/XjtL8v9
         JeoFNfovRc/VbQF99bpEhDghX/wRGJHtbjYhXY5bJDuiAd3VEshwn7W847fUdT5mSxrP
         ajDCg+onTV/rBmRLwT9lCrg4u9FX11WO9X91u9pHUeNqISO1PRySMzOnarOvAL7e+gun
         iZiBT2EnzI8UcY5kH8hflIhyzQczglexhdBPMM1gi0nXzR4qwHAUoj82N3Jl29p41vTz
         YzWQ==
X-Gm-Message-State: AOJu0Yw213keqm80OsCeW8U9PIkXZwbh+9GnO5+Owj8Kpaw5mQsnIJkl
	xDTNJ9CipLOxLqvp8H4AcmPjT702
X-Google-Smtp-Source: AGHT+IG2Vm9+9nZozqmpyx0to/UIe7Qixe2bQihK4D/rfYN6NuV3VFVlogSlogUpRJvEdJfYdlLdmQ==
X-Received: by 2002:a17:907:7f94:b0:9e5:ee70:5da1 with SMTP id qk20-20020a1709077f9400b009e5ee705da1mr1827163ejc.53.1702329660720;
        Mon, 11 Dec 2023 13:21:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id rf20-20020a1709076a1400b00a1d1b8a088esm5331871ejc.92.2023.12.11.13.20.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:00 -0800 (PST)
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
Subject: [PATCH 06/24] semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
Date: Mon, 11 Dec 2023 22:19:43 +0100
Message-ID: <20231211212003.21686-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wVTVb2G0r0b9

Nothing in guestfd.c requires "semihosting/uaccess.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 semihosting/guestfd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 955c2efbd0..fd7e609790 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -15,7 +15,6 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "semihosting/uaccess.h"
 #include CONFIG_DEVICES
 #endif
 
-- 
2.41.0
