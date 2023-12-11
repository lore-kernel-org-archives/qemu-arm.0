Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492501ejo;
        Mon, 11 Dec 2023 13:21:40 -0800 (PST)
X-Received: by 2002:a05:600c:9a3:b0:40b:5e59:ccd7 with SMTP id w35-20020a05600c09a300b0040b5e59ccd7mr2694624wmp.184.1702329700633;
        Mon, 11 Dec 2023 13:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329700; cv=none;
        d=google.com; s=arc-20160816;
        b=WKeMLr3p+qEmfCt9NhsfTVOuC9kX2RwEDL6ltIjA94PhIBIDYmcHXzeTiwoJrUdJ7a
         X8s1H7b9zf7GtKfGD7lSecm1YhmTN5inmQYjsfBvk4wLuLdzzv9cpxFZ1PmKmbublxla
         AQWa8vDSb53badVeKUfgl8hlUAL+jo52er4fthCtDX0G6BgXr8M0ULK6oFijcmcRxo/q
         /WQF5NUFbY/if76eO/biI5j0j7YlVxqc7OZrtDl8rrnQBq6cGaUZseSdI/ceZRT4ZTN3
         CXEM85rPY0stOexW4xqE+7ZFRYEttX3Kz76ldlptLTQB+b7j4s5+x2sk7MdVGTk91oUi
         au8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gRG2U+UvZdWTGYdcA/MTX3iesT+e4Kqtp08ALJBiHJ0=;
        fh=xYaGo0bGlil19/mD5EDGXXFLo7j+LrTBzmINuRwZYT4=;
        b=JBHZoTPIfKkFvSooV5YEweINebJtc/X0AwwrKxJtNEWcryFsbmfQPqRzRZeSA5Hfk2
         IM/soUKYEpC77sulGEJBOypjwzRhbeLPNkSWepowswxSMfh3EFqFf/g+2Todc4s6wq9h
         DAFODPdB/sLtugxfytl4N1nVVlGR5/MjYmJX8DlFMTd+nMOOFbG1NXC8Ah4UxLID2ZTp
         M4/ASzC/8vahw8YQ5NIE5r7TMkVUgxlp5XRGB8I2KTjG+F8dYmD/VUdGZaeRR9HDYcnO
         WgDeDV2OULoLJ2Qw6Qug5Z6E4cRxfkAxVjJUDJ8yh/7qCZmXRP5hysiIWjLs7gFLM+Xg
         285w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9SK+1cu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id og40-20020a1709071de800b00a16d7ec2a3dsor1135589ejc.3.2023.12.11.13.21.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9SK+1cu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329700; x=1702934500; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRG2U+UvZdWTGYdcA/MTX3iesT+e4Kqtp08ALJBiHJ0=;
        b=A9SK+1cu2wksbiUf0Qv9xzMKiqSOfYuuxrlXcYAZKD/26gg3mxY2SfLiCYbIUw7b+d
         IC3WlruRwBOYs0flWXTFkFhCzZGc0+KAS3LQo2YtPLIDEDJAgDq7M/WT2mWXghPMkxL5
         QczpfiKAhGgZkH2PR3d6Tw5aHvspc+EEu+ODbFdZjvldB8PmaFAwyy66SnbxK1NP/8hY
         CaxZOpRcEdl/FdpjTgM+fnxf+dcKVOMr+REVnOjGO84R54fPrM8a9EXowr+M54TVvcYL
         yvsHQmRuGw+2TFNK0JfZ4HUuXtzZmSvt6MCOYlXlJLq65RdfhPzmq4ZFw5Nn/j3ZP2pO
         Madg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329700; x=1702934500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRG2U+UvZdWTGYdcA/MTX3iesT+e4Kqtp08ALJBiHJ0=;
        b=nkZhxDcBWmUtl/Gh7tUCUUBcJkz5LVcGLqZkp6Ywy8gHyzZYsFEVKfaYMqehDenw7t
         wG+9a1KvExf3OY1/RcVd0vn/XJax9x+K5UU8TBxSJ3lum+PeX8VYOaUsxd6wauCrcHeV
         /6q5IRCJNYGTXMJ1Pi0MWQi6OjudUmVtLrBbVPNbBgJg0OknuTJN123L9A6lGVkbpcQ9
         xMxDaQWjdPunQu+e/ZvZ/giS8O80fRhyfM11foQ6FGRgArQmvEJjlvtzWlMoHuZYfTit
         Xxj66GYyJG8ImFWImalhgCk0jdtGWtdQ0/piLF96azkLHGjcp8T2oTM47x46zclzR9wh
         0ApA==
X-Gm-Message-State: AOJu0YzJsSXf+2scLcMZHCigX9d9Z2WAClfYE5ga2hUZo7V7/1NqHUlf
	/buAFD+7zkFNI014hYC4F/pKXHho
X-Google-Smtp-Source: AGHT+IEa3URetu7g5tfPDUGMgSUYvKg8IduDwrwb0TA8kvL1/wJJ22FrnJm8tGba/n12vArKa+29YQ==
X-Received: by 2002:a17:906:ecf1:b0:a19:4628:1606 with SMTP id qt17-20020a170906ecf100b00a1946281606mr2921924ejb.45.1702329700238;
        Mon, 11 Dec 2023 13:21:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id jg2-20020a170907970200b00a1db9c0f55esm5287908ejc.198.2023.12.11.13.21.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:39 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 11/24] hw/s390x/ipl: Remove unused 'exec/exec-all.h' included header
Date: Mon, 11 Dec 2023 22:19:48 +0100
Message-ID: <20231211212003.21686-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sH0NeA9UcYQG

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/ipl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 515dcf51b5..62182d81a0 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -35,7 +35,6 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "standard-headers/linux/virtio_ids.h"
-#include "exec/exec-all.h"
 
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
-- 
2.41.0
