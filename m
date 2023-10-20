Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361128ejb;
        Fri, 20 Oct 2023 09:38:28 -0700 (PDT)
X-Received: by 2002:a17:907:720f:b0:9c4:4b20:44a4 with SMTP id dr15-20020a170907720f00b009c44b2044a4mr1618865ejc.48.1697819908304;
        Fri, 20 Oct 2023 09:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819908; cv=none;
        d=google.com; s=arc-20160816;
        b=NqSYpcXpRD7erPSm18ySuGKcVnNcpDC/oSmw7YcYRRtvhTEmelLMFl7qwl9Ns98FE7
         3/hWCNMe0+gr4X/5Vcndww5o7+Pf6MegG93f233m3IBic0YLTsgu6azFk+i76YbOzZPb
         fJPTuvE8cpg+TDPpaD+hFVwh40vwHN1LswX8okePny+NKjsqSZtdp+jLgadaBARUofbf
         0C5QIKoL1bQMlJpwdhhDKm0DoPgGNBTWtwZ0x1LEaSIyazGrKGB7jOcX9cbr9MMgZB0q
         hw1pNL1IEz8Oim/Oz+UcpHnhbTmi/fPlTe7mkyQs5KfRkBeii46qAGjA4Q/gyPRETBBw
         kmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XJgrMi/wBqEbOvB4DV5saOShbSMfpSRqXMWSTunBKJo=;
        fh=urbsc+C6xnB/Cu276HBg3jk7Jn9Nncnewa/Ayf0I/i0=;
        b=G/zQnWGJRZHwaYEk/OZ8M8MSU6geoBLWK+nmNc8edRPd+7HlqSINKvE++Q51f58tUz
         XttP/Ca5FYXHm3x/AirkH+ebrfSVsp638gyC/Hdgk6Mp3txlVjvTrDXkI3TN4A17lZLH
         l88m8b8QE6kSbiizO3O4qrhqHgSPI4qzBBnRZUT4EUJsdHGCa+/bgR2HEKNIxHs0QkR4
         AbX9xWMxOyFHmQTB5IoXxfMbvKURWJejIbKtLX0vU+xLELvKNLmP/WHO8RwNlsvVh/q9
         ZaM3F96VDQHiG3ARZAAnYSiEraJyrO7M67lOQ8sc8mi2lCLWcuja+ypqJOalOQBz24If
         FPHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzy3e2cR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gx3-20020a1709068a4300b009b2b2ad2a82sor695825ejc.17.2023.10.20.09.38.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzy3e2cR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819908; x=1698424708; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJgrMi/wBqEbOvB4DV5saOShbSMfpSRqXMWSTunBKJo=;
        b=qzy3e2cRxbkcZMQRtULXZ9Vqbr46JUOFSvcLAPx+gXvENLcJBYME8DVZvCMVm2vwI3
         5i0I/Ges6tuMyey202hm4k2WfZl1iIZvyV1t99MtR/CgBXwAqW+ocVuHK1bO5gme2Vne
         p335bmE/lisxB2CG3uPP785kh8RMxcRiOAlrPep7KZDey1Rf/6+r+heq1FFVPwzV2/V2
         7A+FAcd/qWm1TNzse3XJLxwjiHw4YGQ+JKxYXg9dsnQalEm7E4J3vFNnZQj4ct043Srx
         v8CyNSCxhDPREkZsVPyrY1ueLHZRf7PLutzrmVQORWdBz7iCOpBtmO3tW5r4Di20uFIB
         QWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819908; x=1698424708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJgrMi/wBqEbOvB4DV5saOShbSMfpSRqXMWSTunBKJo=;
        b=PXV/XwXn/DPo0kFKISPimnOWG7ynhXT1OF9GT5TSX0kJJxI+7SdyYmvWA4pzQICwmT
         Po988W3KjL3or55Kvok0m/A7+6UHJPmAhaABSaf3pyPmqj1G2CAxIggIBFQ4RXjsO1wc
         oJXikTHfe9iYAEJGpqMk7gQKrUnCQus7+7XKfkhKOTRjV446DTE7jSIcJG98WC0CLKo+
         u0Am4NT7B0aZ6+VoCfCjb9/qNtS8CPqMT+t/TVRZR+1ffcBR7xca6n4I2z/6Zxn9xw0G
         PiVXkAxtOmOqF8hDthlXaAX4FiJwgnRDAOl3Q0xhhvi1LM9mdsneuwt/OTkDgH+7WyC7
         39+Q==
X-Gm-Message-State: AOJu0YxPn4qsfzdDQ2iHllCa6nfJrvoHvbNDzupqmIHHvcMV7yauuIlz
	beyc+skEV0mMAvKs+khPOPkS5uyd
X-Google-Smtp-Source: AGHT+IH7+ZNyajLwkQ3t7c25QQCi97yzQLzCUBWOzenMRYSotv/xdOmSa0eQLzVkCMAjxOV447k7wA==
X-Received: by 2002:a17:906:c14c:b0:9c3:e158:316a with SMTP id dp12-20020a170906c14c00b009c3e158316amr1782665ejc.68.1697819907900;
        Fri, 20 Oct 2023 09:38:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id s19-20020a170906bc5300b009b957d5237asm1805635ejv.80.2023.10.20.09.38.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:26 -0700 (PDT)
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
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 13/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_M68K_CPU)
Date: Fri, 20 Oct 2023 18:36:35 +0200
Message-ID: <20231020163643.86105-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cixuAKvvZ50e

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_M68K_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/m68k_irqc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
index 0c515e4ecb..071937e6eb 100644
--- a/hw/intc/m68k_irqc.c
+++ b/hw/intc/m68k_irqc.c
@@ -35,7 +35,7 @@ static void m68k_irqc_print_info(InterruptStatsProvider *obj, Monitor *mon)
 static void m68k_set_irq(void *opaque, int irq, int level)
 {
     M68KIRQCState *s = opaque;
-    M68kCPU *cpu = M68K_CPU(first_cpu);
+    M68kCPU *cpu = M68K_CPU(qemu_get_cpu(0, TYPE_M68K_CPU));
     int i;
 
     if (level) {
-- 
2.41.0
