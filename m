Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp293284njb;
        Tue, 7 Jan 2025 08:52:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPW8bNZfNhPl4BKqvwfEJJNZSR5ORXTs+Vokb3/fBYup34lPvNX16HjHUH0RMbcYt3R0SCyqvfhxv3fA==@linaro.org
X-Received: by 2002:a5d:59ab:0:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a223fd597mr55546143f8f.45.1736268741898;
        Tue, 07 Jan 2025 08:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736268741; cv=none;
        d=google.com; s=arc-20240605;
        b=lOn7TqmGC+lYBXK942cs666uXeWu+Ct1dWtuyRjDUw0b605mVNMU63TWXjwbPmYZ/K
         7MRJgXo94HEjQrrZ4Dyl5faFgBitoH6e/KRCtIUgbtZzbAby7Sc4Uh3vM0aeDfWA4iT7
         IHvLuSfT53YmWmg8z60UMVs//fStzWqwk5zEjJircZYKrM6bh9WZ67RoromolyqNTw/3
         qrPshKcIWw1wNVnZevO9Kv+4xaq6z+DpAqSxXGm9UQYAvwJgEdLCTVlFyEtrqxXgPaPc
         wU/n06yb1BnhB4WFNKy/kWvd9QTO69hbiAe6NrCxtNNoHhB1OtHzUUbmGspdXDfrL6ga
         ONWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kwAIsSbR5veQrsYYHH6aBtjqtWXUUTPWi9UM3AxwMO8=;
        fh=xPVGemgCRL3Uf18AfCyyvlJEcL1gl2AT21zZmDi9HsE=;
        b=OehpU7RAUBxpWGWfIs770DoxDCcZ/7yFwOml25J+mRi/g7XoPPX3yTY5IOEzXNqR3Y
         ZJO+T6lX7OMSRmRcSxbd6VP090h7Qxlnj60EEDTP/vE9cdKmxr5xAu2xzAEfe6+RFTK0
         GzQiPJK91GqKncqXTw7b52eT+YMZDRebQZJ7Q0Yol5iLPxfSVr90s37xGqsX4A/KKQNv
         1SbAMwm80vhlV64EAtRV1+zMpT4kA99L6q4ul3I7R7eTn/b+eyJRsBQnrxxcJ58CWaBS
         jzJShOFNuH2ttPjqGg2ayjEQ8qCV/Zg4BzklA2/BFw3BfUHhzOg+u7sHzNN2Q8MEA13n
         QGJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bD8y/KYR";
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <alex.bennee@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c8a8d9bsor11212642f8f.10.2025.01.07.08.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2025 08:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bD8y/KYR";
       spf=pass (google.com: domain of alex.bennee@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=alex.bennee@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736268737; x=1736873537; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwAIsSbR5veQrsYYHH6aBtjqtWXUUTPWi9UM3AxwMO8=;
        b=bD8y/KYRiBoVA4GeqDviWL+ED5mKFSZNRBvD770B9scMZFnaQSsU5sfBTDW3mEkkRO
         PG+JL8YCyn67iZOZEpVru4GDYjv4wzyfL74HA+46GJzmPWNXmgQas1KOQc5KKram44oL
         AMt4GNSXApoH5FLvXfkh4DvxEcoxCPKQH0qcLLkmzKxdEX5nOlZPrjY8LwcGngkkDDLT
         ixCrSUyWQGEqxzcqP+TSEnG27DO7rGrRVn6rc8hPCQ4mnD8Oa+Oej+v1VAZEykZsWFuv
         F7fi2EbWpsn4Sw5WAoQ2S6r78Cucso26ahZewgZwo0mjm6BDvZIouStljZBwi6PO+S1i
         g93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268737; x=1736873537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwAIsSbR5veQrsYYHH6aBtjqtWXUUTPWi9UM3AxwMO8=;
        b=cLiBywaCk2EHFKO7TvccLHe95UBi7EAfOREMdbH5cL94IjkVHAT80byDk/VPl8zg8Q
         kNjc3oBNXwMCAa/zRMrHY88boPuTpdyT89wllHeDSwVdDhIPAjmFwOEGCcp6EZvJsdXr
         sRHfRndsFZEaIE00Mp+M3/eVI8k3GVZFXQzp23R58TLsTZKkAUlYHT2t5rx8VT8AjGbn
         BU0gq72Z1mzcb2g42mYh4vrDlAYc3PKgSWgzxKIjydo9uU0EzsSa0Et4LOErSqy9m88S
         k1bCQ9IxfZRIZzWaCx/7mC4VR/K9xoCwFDDYlosaKeQ03VmZinfp4oA6jYU53viHYglr
         V94Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAqxBytng66IHVucd86mMClDaXdiEvpLk9LA5nim7DoaPtdHdRrut/CANT9pDRbyslRIDJZOYyzD2LIw==@linaro.org
X-Gm-Message-State: AOJu0YwXEQ2MkBF8YVcTMk7ja8NXdRVXpPDK4rVLap/A85PhEHA6ch9P
	+ukWQON7XiCRoPW2b+eQM0vQTkjkzHkm8mOQWRBHefqgVy8LHgEQmBO7jY8lBr9I2w==
X-Gm-Gg: ASbGnctpk9luJrzI1omg0QXI/1RO9/KiSLeGLD5GKp2pUhXEwm1R9+nJjHKu5RUUhzs
	QsFRy2T/QBJHQgthS4vjFc1G+uTYnQsCobRpoMA1M/aWmCWfoNtnnCmlHhV8KPctGTXGPAQnsi/
	IQyzoGtzQP7xqs9vNHoePRdcGakCO/Od4H1g688yJ3eJ6x4ahdmChCp9v80Whma7d7KKkT8dP0Q
	g6dUZFaW56V0tDz7srRV2OdusJO8SKx001f4eE8Ba7aZSFvO+2kba0=
X-Google-Smtp-Source: AGHT+IEocHxj2Rhi+GCUxV2FmFDrC6uen0UJr+MO6HARR3ACdqCh3EUsk7L5gS7PU51e4s8NKfjnXw==
X-Received: by 2002:a05:6000:1848:b0:386:459e:655d with SMTP id ffacd0b85a97d-38a221fa039mr56509991f8f.20.1736268736727;
        Tue, 07 Jan 2025 08:52:16 -0800 (PST)
Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e528sm51453740f8f.83.2025.01.07.08.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:52:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 63FD76017C;
	Tue,  7 Jan 2025 16:52:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-riscv@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-s390x@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Fabiano Rosas <farosas@suse.de>,
	Weiwei Li <liwei1518@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eric Farman <farman@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 26/29] tests/vm: allow interactive login as root
Date: Tue,  7 Jan 2025 16:52:04 +0000
Message-Id: <20250107165208.743958-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sAytyz7pdLSs

This is useful when debugging and you want to add packages to an
image.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 3 ++-
 tests/vm/basevm.py        | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index d80ca79a28..14188bba1c 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -66,6 +66,7 @@ endif
 	@echo "Special variables:"
 	@echo "    BUILD_TARGET=foo              - Override the build target"
 	@echo "    DEBUG=1                       - Enable verbose output on host and interactive debugging"
+	@echo "    ROOT_USER=1                   - Login as root user for interactive shell"
 	@echo '    EXTRA_CONFIGURE_OPTS="..."    - Pass to configure step'
 	@echo "    J=[0..9]*                     - Override the -jN parameter for make commands"
 	@echo "    LOG_CONSOLE=1                 - Log console to file in: ~/.cache/qemu-vm "
@@ -141,6 +142,6 @@ vm-boot-ssh-%: $(IMAGES_DIR)/%.img $(VM_VENV)
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
 		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$<" \
-		--interactive \
+		$(if $(ROOT_USER),--interactive-root,-interactive) \
 		false, \
 		"  VM-BOOT-SSH $*") || true
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 6f3f2e76df..6d41ac7574 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -612,8 +612,11 @@ def get_default_jobs():
     parser.add_argument("--source-path", default=None,
                         help="Path of source directory, "\
                         "for finding additional files. ")
-    parser.add_argument("--interactive", "-I", action="store_true",
-                        help="Interactively run command")
+    int_ops = parser.add_mutually_exclusive_group()
+    int_ops.add_argument("--interactive", "-I", action="store_true",
+                         help="Interactively run command")
+    int_ops.add_argument("--interactive-root", action="store_true",
+                         help="Interactively run command as root")
     parser.add_argument("--snapshot", "-s", action="store_true",
                         help="run tests with a snapshot")
     parser.add_argument("--genisoimage", default="genisoimage",
@@ -675,6 +678,8 @@ def main(vmcls, config=None):
         exitcode = 3
     if args.interactive:
         vm.ssh()
+    elif args.interactive_root:
+        vm.ssh_root()
 
     if not args.snapshot:
         vm.graceful_shutdown()
-- 
2.39.5
