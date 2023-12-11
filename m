Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492242ejo;
        Mon, 11 Dec 2023 13:21:10 -0800 (PST)
X-Received: by 2002:a17:906:608e:b0:a04:e1e7:d14c with SMTP id t14-20020a170906608e00b00a04e1e7d14cmr6105975ejj.32.1702329670143;
        Mon, 11 Dec 2023 13:21:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329670; cv=none;
        d=google.com; s=arc-20160816;
        b=o9XGy91wuZMZZUU+HncGSUVeHUX4PV8HYyjGfG8blR9AZTzTO428FAS1NH5UJMHx9r
         mo9gYGd8Je+B5QS61suKs5u5CUAXMgOXggPhVZRTjwt+6Afgom9Qn93MPMp/4o5D1IZz
         HjxPvp+49l/cFRX4cjxdSolp02nki5Cy5r6usEH0KPHEhDqiDXf8tTYDH+njRFBG7rLQ
         /z0nqH+liQyyljJs88YL8ab/S+9AJTl5p4V+fyy8bJljGz3NTv7gWPgWCbdEq8kJ2s6N
         eilx4Qyy2yFVaN++OmAdONaz802g8ASEvMjBX69ZTGV21P5HztSnVdPlv0CB8dXfRSEt
         U5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=rjZdHpot1XsQZpWpU407mt7SnLoEGnQGsVAS4jGhDakwlTbTmOLymp6B2NE2xqOEa4
         FHKFeSIKhV1rzXS6G49VEdvGUoow9tnNBDwQE/yXmeqdO+NU8LphmUSjlafiFCmPAX3P
         8aly85U8POv2P0KuUNcjLMJw716GHuv2MVLEFLfBUQUKn2iRSxDg5Gk2QhEDedwPdBz2
         dFdrVTdw/zuSk6h307WNkcyCVAd3AyDlPGB6h6AolxIbyr3RtpV/lSVvFjb0muEFp3nT
         XMHfpW3yT31PTwTaKNtjZizF715kIk6f+NPB/thYrxXEmiIasJTJemoXYL9xO+y6Itsw
         /p8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVetQXJT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id nb41-20020a1709071ca900b00a1d558dc794sor4338329ejc.0.2023.12.11.13.21.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVetQXJT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329670; x=1702934470; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        b=kVetQXJTT4OwMmDfFEZepxYO0DCEIPBbyTzDcCzveGMLH2lEnnttBs1RZlKLsaXyIA
         CgN1XZLo7ERIUcEsf5Zg/nev9p9/6vSKxTh25jb0fu9EA1y+0Ooo8lmRjck6ibKzPe0K
         CJ2zbk5/yFxqTtbeEcI0nDjy6mSTsBKdfyZUf/q4DWY8KYgVS9EemPBR4Z0TOM/P6zDZ
         U4hKHPyEHHP9MP1lHHuajQYA7JviYYPsHHbRlvH1Cmvh/Bj4tXiFbTgqF4c1zWKMQmeo
         eVmJQszrJcHyM3K2OwtxQwxE357Do3EvVmjrvgJUrrFBie4uVlVCPYnUni3S0DGSu8yE
         t1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329670; x=1702934470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
        b=cQ3W+6P0RVrU8CgY8xGTL+CGE1/SkSavdxB3lUwWyW4t4172PWB7A/7a2+S0Xt2v22
         HUQvI27ESxOTeC1+g9/WCL16Lt/FppmuvhukixtZXYuYnszsNqrF+zY3BzcPji+YjPyz
         6VsOJRe9Adlsg8MSUn6gwvuKYS7jt3ABS+LO7xgA21OBEIS5dUUDVLiHE/noitLfSRFD
         6ZgeHqEmLxcOLU3MzgYnhZ1sivgc1PiKx4pWJk/douCjXdGbsuqJa3JZ7iKD3nqExImG
         aMyfSEsfJg4kw0BPZRUKTQSnSx/4a9EmTO+z3JQenudQZ2J8Ilxq64ISbN/RAqG87P/A
         tscQ==
X-Gm-Message-State: AOJu0YzUYAc2eir/18yBQ7MniplFAhv0sn4386JgdLFq6MpMv2hVuypa
	KQekLiPGsn4UbImr+XTqfwDQKcMx
X-Google-Smtp-Source: AGHT+IHqm4UZ94oft03ymzOFSZfr6wL2NQDR25w3u0JiNetMo2FIb4m6lHXBdEO0USlv9SICLLe3wg==
X-Received: by 2002:a17:907:c08:b0:a1f:9842:5a4b with SMTP id ga8-20020a1709070c0800b00a1f98425a4bmr3691271ejc.66.1702329669925;
        Mon, 11 Dec 2023 13:21:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vh9-20020a170907d38900b00a1d18c142eesm5352528ejc.59.2023.12.11.13.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:09 -0800 (PST)
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
Subject: [PATCH 07/24] host/load-extract: Include missing 'qemu/atomic.h' and 'qemu/int128.h'
Date: Mon, 11 Dec 2023 22:19:44 +0100
Message-ID: <20231211212003.21686-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FPGK0gdYY0gE

int128_make128(), int128_getlo() and int128_urshift() are
declared in "qemu/int128.h". qatomic_read__nocheck() is
declared in "qemu/atomic.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/load-extract-al16-al8.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
index d95556130f..6b47339b57 100644
--- a/host/include/generic/host/load-extract-al16-al8.h
+++ b/host/include/generic/host/load-extract-al16-al8.h
@@ -8,6 +8,9 @@
 #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
 #define HOST_LOAD_EXTRACT_AL16_AL8_H
 
+#include "qemu/atomic.h"
+#include "qemu/int128.h"
+
 /**
  * load_atom_extract_al16_or_al8:
  * @pv: host address
-- 
2.41.0
