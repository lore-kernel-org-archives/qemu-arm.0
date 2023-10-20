Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360385ejb;
        Fri, 20 Oct 2023 09:37:36 -0700 (PDT)
X-Received: by 2002:a17:906:fe48:b0:9c4:4b20:44a1 with SMTP id wz8-20020a170906fe4800b009c44b2044a1mr1931382ejb.65.1697819856369;
        Fri, 20 Oct 2023 09:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819856; cv=none;
        d=google.com; s=arc-20160816;
        b=yTXhHHB+LzccpaOnNjOXsKZozqsbyBr0GnSAboiqSNgsJmOOSW82tfxDIlgjGbGkJi
         DIZ39EQ+tvxQfdQ/SqMXlds+W1wZr0m+z8MV8NHEuB0DgIIIVyEcDNJEeF0mLJfdqihN
         sc+gDEr+SGdgSspSjp1Zpk1ItDc3/YY4BM+8/+VyYwnPsv0yqyi01lgjx4BUX2TrVU4X
         5xWJNA9ny6f9L5+SSOfCe5j3G4ifv8eqGud+cUXvJy4jvjKku0N4TE9p+/we7EKDXU7C
         c7OH/NfwXVzdAoBH/Gf87cxL043bhu6eb/nT9De3lGdO/gy+mMrPOFHKX2SYcPJ/TrbH
         JSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z4zSU56YOB/kPm9j9X/WOBopNqbVDhMN21ij6wb+YZU=;
        fh=oZ6L1yuWB6YDZmAcQyPUwD6mml29vQS2pd5Tujn9RoI=;
        b=dP/6f0BN7uWnC8KbivcAV+K/Xw45eIZD1o/acMI0ZcFcxz9Pwn3zHEH1moxRKyjP8W
         CY6s2SdoqtSY0UWf+SURoQ58YykOrnQKOJARiaTvmMZ321shuanxsq/koAq1omtUQ/hs
         WW/wp6iNmlA/aiUcKxcTFSkjLRD3B10ckmo4uCVVovYALcHfIHqn+Ee/0ya5W/sZYDYw
         aLlYsCSFYPgYiu1A7CACmnIs0cOzRvfz5MuGp848xBE3e1FWkYWx15Udr3H/UWxScZrI
         pX+h9Cs7eFcFJvExPYQP1JPFyeX1Ejh/jvWwhlRkUscCD9q82f9sH5uNJQno1P3F8NAv
         RpyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nws67UyN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bz6-20020a1709070aa600b009ae5a5f11fcsor682775ejc.19.2023.10.20.09.37.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nws67UyN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819856; x=1698424656; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4zSU56YOB/kPm9j9X/WOBopNqbVDhMN21ij6wb+YZU=;
        b=nws67UyNdJfgB7l47CVjM+cDGHtqSSSZhXk77cWXhpOGAVolPl12IczbN8EohDto5K
         +ufQDRxDp/SEFP8lRGoU3VEiS/hB3cVjQBBFuAZvfM9JDN5y+zym5wgJNVDfgZWd3IrQ
         DWwz24dQuraomaBl4WsDrSrk8FdnTGIyObruqh82ukP6ABziCFE5r4FryoPKqo7jvc5s
         H44ON+Jlj4phUe1ZHQvzogTZ7jpv6ZZw53r8kYJhO5DCe/WfhwgSN7PkwMxFeRcUs6rR
         F6X3hzCZvmEVJ0vPeCqWkdRTA37pL9fPecqeQoeC2rpV/JNYl567YKC/0lpSCF/bbH0k
         WTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819856; x=1698424656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4zSU56YOB/kPm9j9X/WOBopNqbVDhMN21ij6wb+YZU=;
        b=dIEio+KZdZH5b3qiHlcKu16TnIDxff8fTVgycoNHefWQ8Z95d75tH6OrsWpbIi9AmN
         ktU3cUY/j/9MXWVIceZpSxeI9hVPq26v2aXVObFccSDAU9RU3JOyJPWk+OOkw0s+ymcy
         cTSZ9JUC8t5G3g7LYjHTtpGndSfRAKPj5DrmdsnD4nkeQ27UsdJMJmgh8jf+Cq/vyWbO
         2C3mIkHD/bj32J0Pcq6DgQc6CNhe7/RqGORT//5w5Ht06RvYSNXnknZuHt+GHLtLll+J
         oi4GtMEBsoYAvhQxfZFz04K+IzIHQiMgzL37RPiLK10p+AqLUShe5EeFGa8mA96G8I6B
         livQ==
X-Gm-Message-State: AOJu0Yx7+w+IEHLxK2tWmbK+lLTRx0YNcFy5G00L7zPJbEOc5jd1NMMg
	18NCFEUeQsGRcvORdcWa9kKc5bcY
X-Google-Smtp-Source: AGHT+IFzE8rRAYRNGkxdtIkU8F15D+clgt+fZzmt2nFT9O/jx8yWn16j3wmMgA1YAJA0Zxgs4hb2Aw==
X-Received: by 2002:a17:907:97c2:b0:9c5:45f8:c529 with SMTP id js2-20020a17090797c200b009c545f8c529mr1549786ejc.20.1697819855974;
        Fri, 20 Oct 2023 09:37:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090655cf00b0099bc038eb2bsm1782737ejp.58.2023.10.20.09.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 06/19] cpus: Filter for target specific CPU (s390x)
Date: Fri, 20 Oct 2023 18:36:28 +0200
Message-ID: <20231020163643.86105-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aL8+/GtuJE5c

Enforce qemu_get_cpu() to return S390X CPUs in S390X specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_S390_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/ipl.c             | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 14cd0a1f7b..377f43416c 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -671,7 +671,7 @@ void s390_ipl_get_reset_request(CPUState **cs, enum s390_reset *reset_type)
 {
     S390IPLState *ipl = get_ipl_device();
 
-    *cs = qemu_get_cpu(ipl->reset_cpu_index, NULL);
+    *cs = qemu_get_cpu(ipl->reset_cpu_index, TYPE_S390_CPU);
     if (!*cs) {
         /* use any CPU */
         *cs = first_cpu;
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7628b746a8..3bb4b13c5e 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -583,7 +583,7 @@ static HotplugHandler *s390_get_hotplug_handler(MachineState *machine,
 
 static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
 {
-    CPUState *cs = qemu_get_cpu(cpu_index, NULL);
+    CPUState *cs = qemu_get_cpu(cpu_index, TYPE_S390_CPU);
 
     s390_cpu_restart(S390_CPU(cs));
 }
-- 
2.41.0
