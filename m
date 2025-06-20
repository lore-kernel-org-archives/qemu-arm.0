Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878754njc;
        Fri, 20 Jun 2025 06:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9Nq7u90aaqL7Aq+IQT8PFTmupvIcofMiG5omvUFPoga743+BXX4rweTIgnOkpTEoTZp4zExYBA4doTA==@linaro.org
X-Received: by 2002:a05:600c:8b2a:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-45364790383mr30366255e9.0.1750424951247;
        Fri, 20 Jun 2025 06:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424951; cv=none;
        d=google.com; s=arc-20240605;
        b=NUSgxD9DFZQ4lUjnc2QXDlvPDK4WWwpgv8cHCAQVWStDE2z+pn6hK5TY7WCW4uakeg
         Y2mUl7qWaQUXU8vsuZuLMyLOTbLSNLSHM/VhNhahojUYpbumQ0UPM9SHRRhVh2d2VTLr
         JsB8ai84QypqYjqvut1JoA7EsdxiUEmGvKW2OgPUjv0F5etJqlYlmdL0SmFHv7n4j12T
         JPIwGUSQx1oobdaE6VXEF79RQxDJmnMSgLdU3cpWPDrkQboJR3CMc9dbuDflDOpPZmTK
         smrW4OFzVeSA65ikMZFcq0sS/LUmfZZbTjefJw1AFL0U87h7175uW/cl6WK/nTO2NkIS
         AmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        fh=Qc7+ncWy91GrItBlCI4O/sjkT2nHtWD5scWqfp8V9dA=;
        b=kIlVvPImzCSCMMQKsOPGS3AzzEIjSRkIWkD1SDESut58wRXT5vxJ5JbkrXIfk5UsCx
         v6GXMlD9A7nwMT80xbIvbSG7qA5y7WEPiCg6/IB9tvYOTX+UmGF3gzHNN+LVmuMD1rY5
         bNGBB3Dn7SHpZ/gjRUabKDJwhQAaBWoRBa/b8YWOKPXWZCfes32I81WpXYtRud5zoEZG
         /7hkTMNiQAbfjbagQYOeBRqkvGqe9HUXmwso5qGdM8KJaxeODxqs+riGscef1cqPRUrY
         fNum+2R13kXch3w/24GapPRFQw/5yg70f6kmh3YOP6SIA/2GU5LErH/rwpA+Jtbdrc6y
         qOqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MDCszFq5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453659dbabbsor5197335e9.1.2025.06.20.06.09.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MDCszFq5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424951; x=1751029751; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        b=MDCszFq5treM9GgiXmqK6J2LcKuY7X+hPm3JgQ2sI2Op6kJ82XiK/vzz7w5oXY+cGk
         A3F83p05ixki2K56Be4o7desTmyRERC2B48QoRZammP2Q2si75AsOmuq/jRkQjBuTt4U
         qlmeLOaLnd75ibqoyBqON18XXzgxP+W+SWtHueX7Xuhv9Pg/C4WfwLToblc/uos/rZOt
         mgNZ+mXCSN/70ydo6DUE3sr2hFNXB2bQRgmPkDSNHPMg3+6kUykexJ6LWRaNw6Ic7Bxu
         bfMmeRioy6huIAB8Voes0JGdQW+IFITtvRhFFMwqSIigH3nyiQbBgrVoFY7M0byo4b7e
         r6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424951; x=1751029751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        b=tHF5NnYxZa2gW43dCjgZ0q+OyqdNHE/62AXbwWsjTuiZzTGb0/E7NfVmSnEE8gZpCy
         q5mr+2RmNjFKDtdMxvEqWb4AvfGDVN7p1bdnXgc5weTPDfloUtUMnT2tVnxgsMlnw7n5
         cEfNKebYUQXwOrjM6EbQ1duoflyYZ/HtBTdle7uyk7pcUQ2PFg4VF+bvTmov6vYnI+wF
         8jqXGJsRda3dehY9phSJZyGQcujZ83+d/NFXJfZjp5aKzEwM9dWHhPGGRH+iZPswC8ic
         uFZ3w6AHxSPomsXJNR/3Hkyf6piwzOj3qs6Cpeuvsk3qHgc56aS3vwNCAbUY0foWXBK7
         3wVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEqtfLrlwdBlWAbSnGUbDN0KmG7CY1F3m8izXC+vTHH3WQEKw8boz1QYMv6uEXBIPkeFqxQVt5hliARQ==@linaro.org
X-Gm-Message-State: AOJu0YxaZqnPMxCjsKmGbt8YN1e9Or2DeFUIXfsnucG8bLigypDRIxfp
	U4MCRnS48MwzWBwHfvr/kyUr+sPJ6vjfE5tPVzkz438MAOpWXIp9w0jOCDmGdLl6ZoftHA==
X-Gm-Gg: ASbGncsOJMj+rhzoY5jIU/a6czrZv7MJcvX6Qc46q3V+y+qjEAw1Ot+Stjc30IuHZ6v
	/hVeUtsnwjGP6ovvY8T8QkHg8qJTLN+tNEcXFGs7dSoVF4AnOKM8Xry0sCaw4hP0kaWLj4T/bGZ
	m+9FTdNAoVk9yiMHk7/Cemp7AaeQFZHCgqw19SCBQnoiEipb2wjc2XC+fOeTnRm6btD/U/YkhO6
	ftiuJ6Zrj8Fk0qhSC3xGrc/OUE3lf+VNtz/kSL1mLvaJ1WCg/URzeS5odF8DuWaQSEOpIdBa/f9
	Vi8NtsbbFgmF88brfmx/ePLy/moSXoBknLBbxjlrolES+3MkUf3ZrSYzPvIsE+EKq0IsPDNYQl9
	MYIUQSLbuy6d9HTMOETo3yVZpMoLCf5nEmwIe
X-Google-Smtp-Source: AGHT+IFC6yofAEZU9uIg4ElHVXtdVlW8O/y3B6pNs8rlLb+5bVvaCqliz0NCeVD+ukrt5UnUQmDjdA==
X-Received: by 2002:a5d:584e:0:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3a6d12d8c86mr2406728f8f.33.1750424950626;
        Fri, 20 Jun 2025 06:09:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117bfd9sm2076809f8f.57.2025.06.20.06.09.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 21/26] hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
Date: Fri, 20 Jun 2025 15:07:04 +0200
Message-ID: <20250620130709.31073-22-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f4TjCqhVeA2W

QDev uses _post_init() during instance creation, before being
realized. Since here both vCPUs and GIC are REALIZED, rename
as virt_post_cpus_gic_realized() for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9099570faa..da453768cce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2032,7 +2032,8 @@ static void finalize_gic_version(VirtMachineState *vms)
  * virt_cpu_post_init() must be called after the CPUs have
  * been realized and the GIC has been created.
  */
-static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
+static void virt_post_cpus_gic_realized(VirtMachineState *vms,
+                                        MemoryRegion *sysmem)
 {
     int max_cpus = MACHINE(vms)->smp.max_cpus;
     bool aarch64, pmu, steal_time;
@@ -2349,7 +2350,7 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms, sysmem);
 
-    virt_cpu_post_init(vms, sysmem);
+    virt_post_cpus_gic_realized(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
 
-- 
2.49.0
