Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553440ejs;
        Tue, 9 Jan 2024 10:10:57 -0800 (PST)
X-Received: by 2002:adf:eb8b:0:b0:337:2aa3:ac88 with SMTP id t11-20020adfeb8b000000b003372aa3ac88mr533427wrn.157.1704823857117;
        Tue, 09 Jan 2024 10:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823857; cv=none;
        d=google.com; s=arc-20160816;
        b=RPS2KkC/ibdxTZ2rYtXHPDYYa9FJ+iAttj4NsldwzpcnZje0TlqLxa2o1pQKtY8Cnx
         1CyHvUiyF6nBXzh++54V/12/rI7wxTYuPXc5Kn9/D/4G/f8eyjb4xPitIP49/2QSgX9w
         n4rr7GLcHnZh738ND2KtS1gGnd3zG8VVJJVAh1QC8jY5LknEFyF89L1kiY9NVD3t07ZM
         gov7OK+5mTNn/a8RXGn/4u6GCDgZ3wYAZn8jKCp9y0TMuZzmzMwmzX5ejOf1lAOs4Rcj
         z7l5qMicWPGKLtN5P7A48EwX+s+WJ8gWflW0KHSco7ZbYSMDHGU2QAawE+irs5tzNxx7
         ECRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TTZBSvKw8jVi+klzEjHlnxZcbayvqCJEGNzo5jVRjUI=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=pn4kjcn+83EjzFGDIZXidy6JEyqnd5UldHn57zv9JGZ2BYXjtrYZyDvl5Ft07DkWvJ
         jDKSgBaWfbcLz6ZY5M11YL/RPjLRkmbPuHoZGQAhhp99Vgrn5eqxv+DzVwhGKoVKqrHz
         ank+VWRUeIj66fkmGTvOMkjcMkR/m6bsAZ4MRz5xqq34vtrGXiPv3LAP73diyi8nnOY7
         blwHwjjwU+9XsjHYy/jqI2JVZILjWBy0kbxT0vkQgx7yI3RkT1BavC53iQbRCZHekZe3
         khIIzUg9kYbCg6pdkfjP2DHCSrw/rCGViJSWhy0amTUy53JnHPKYrj1PRAQ+JSjM0TMo
         OsQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUjRzHjY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m29-20020adfa3dd000000b0033683c7eb9asor911655wrb.1.2024.01.09.10.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUjRzHjY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823857; x=1705428657; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTZBSvKw8jVi+klzEjHlnxZcbayvqCJEGNzo5jVRjUI=;
        b=UUjRzHjYkTWgWGm1E2JuT59hMcxuxZe8jYeHhWarEZ8uUw7BGkxfaVqXCAb54jLe0E
         zn+9TBsAjtc3wtxrs5j0s7Ih/fFwXeMl2anflZ0d29i39kIv644INee48IkjF0vXtDEV
         z8bCf2Bo5TYUokERFpTiQxZaNSuGHZrM1ycBxXWLWRWp8/mxNpTyT/A1mNd97IosFFP4
         d6RL9cEbaYLnyxOj7izmSZEqD4hP1poQ4tfK4sFYVtHYvkGX17djhF4vxmMzJnComLrH
         B8I+QM913e7yX4LbS7es3xK59Gdf1PW1WvXYq/Z6aGnjY5p8jhzcjq4nW7jW0F/rJPj9
         p3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823857; x=1705428657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTZBSvKw8jVi+klzEjHlnxZcbayvqCJEGNzo5jVRjUI=;
        b=Y518BERRRDWF91AnrjAQd43FL3mTcZ3MmlCPktzAbTJuo9DWzeCGd3Tt2kFj5TEXKO
         ypsWssnK6PlN0KRSl1CvvI/WTj4QGTzmc1XxPW1ACcnARyKOUmaaZXsRqYOxpHyq962Z
         z8F4Nn0odcEhyD5JLkwi1sN+6RiPaJVRER+i360x32priTqp10nrmKkOeSy+rxs5wKwC
         0FP+1vZj2l+NLjwhQxmyKJwuHlr3MwaY9KNeJQseioZP+YKY5Sfr1kN9xkpc3N7CHDHC
         j7PPVpf9Qy0itq5Y+/43oA7m1ATmL7fQf/+oOlcoTJ8L+cDvQ3TADHk39KexR9bBJpfF
         7GrA==
X-Gm-Message-State: AOJu0YzqseKI/2c2IYic3TIs7LCw8snmbM+R7EKXoTpZXbPCc3bnWv1G
	PcR7DcmnZALgdbbEiphaOb84Mfb4D4mL5JyK
X-Google-Smtp-Source: AGHT+IE4iZHZPpHy0g0Cu3FHdz9gyrxhzfhRi004s0M5I8nKQulT5SiowlGH/83JXZwoVHiQQzuJ8w==
X-Received: by 2002:a5d:50c3:0:b0:336:8940:c4e1 with SMTP id f3-20020a5d50c3000000b003368940c4e1mr475893wrt.30.1704823856733;
        Tue, 09 Jan 2024 10:10:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d6384000000b0033760ad2eabsm2966695wru.69.2024.01.09.10.10.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/14] hw/arm: Prefer cpu_isar_feature(aa64_mte) over property_find(tag-memory)
Date: Tue,  9 Jan 2024 19:09:28 +0100
Message-ID: <20240109180930.90793-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hUrHbD265DTZ

The "tag-memory" property is added to ARMCPU when the
A64_MTE bit is set in the feature ID register. Rather
than checking whether the QOM property is present, directly
check the feature bit.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6d1cb24a6e..2ce4a18d73 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2189,7 +2189,7 @@ static void machvirt_init(MachineState *machine)
                  * The property exists only if MemTag is supported.
                  * If it is, we must allocate the ram to back that up.
                  */
-                if (!object_property_find(cpuobj, "tag-memory")) {
+                if (!cpu_isar_feature(aa64_mte, ARM_CPU(cs))) {
                     error_report("MTE requested, but not supported "
                                  "by the guest CPU");
                     exit(1);
-- 
2.41.0
