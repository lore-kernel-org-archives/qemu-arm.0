Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161422ejc;
        Tue, 14 Nov 2023 08:31:58 -0800 (PST)
X-Received: by 2002:a05:6512:31c8:b0:4fe:279b:8a02 with SMTP id j8-20020a05651231c800b004fe279b8a02mr7795933lfe.67.1699979518209;
        Tue, 14 Nov 2023 08:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979518; cv=none;
        d=google.com; s=arc-20160816;
        b=d8+WgicAaG97ZapvZ9wz9qgmc01x+0Y+IfyRfBKdxxFVGpP5u7zbDE4P9nOL9yNkE9
         WCIXbZfBWvYhGo92K1XnwrBLS49LSnvKvzIyxQk8PcTa0G+vYecpGkn0x5ym00sSpKDd
         TufYlgDmth4zHrutZw+9MbGS/rhWBCf4IGd0fNZyblBQfAgBcjVz9u7Yfj1/FmtN8Efh
         qLlGOGU8n+fY3GXrmuDR2lcq4nWtgRb7Rd4s31godfy/gpx3+CY1K3kGG9xhAR9RVvVb
         G9su4zW3W+VgUVBcwajiaY5rDnDrUdHLAVrQ+i1vX+EmphCLKF7G10l8Vdk6qjrWLe6k
         BaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3H+/pStoCerFaavD4+6+pbKHikmNIDPKszX2p8LZLs8=;
        fh=gWEHW3TxA6a60GQ8RCwIBjY/qgn5Qdgh2FZ6pi5rSzM=;
        b=gkedBIpuUHEjLb66ACuiuKaJ4RBuuMhfh3kx5PJnq/jjANwEqrMtlzVKKL0vmhW9TE
         zEmuckG+ZpGwPtOMSPmQsWEI6PuTNRB2hB5/Pr6J882/GetshNODtzaRDfN3KOXHaVOw
         by9mv6hFwovG2BK6efiBorsMtRnX5xvn7KVPxceOXKTojgJVOrWpbbTnqFmAe5Qf6b9Y
         p2kCuxSaSWE+bK6kseOXW4KBGl1m9EvYU9a966JdsRPLDB+P0YiT7MRqo2us1DFg0jpL
         owAEQdDHLNHhrx0ueD06Z5yCvJ0iCc6foOpO5YKuLyOWOf8+HPQNR9D4oe3IUw88YiMQ
         IjOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWCuCQ4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i18-20020ac25b52000000b00507c99d208dsor1866474lfp.17.2023.11.14.08.31.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWCuCQ4U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979518; x=1700584318; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H+/pStoCerFaavD4+6+pbKHikmNIDPKszX2p8LZLs8=;
        b=sWCuCQ4UtChfxAMCGLvdwy97wYMf6nGa0M2B0vtgCVHNrkh/5N+68ygSXmG/yttrB3
         B2yxhUT3KdJa5MfvquXRM7W5g2ibOjYMKM7NKuZuSlHRFmbbgQhbX2PM2FMI2MN6k1L7
         AnRGWSvlYCWG1bYbln88jaVCO80J8TSOQBDjusoJu8t23Gg7IAJSm3TBBPCFY47FE7KE
         HKQArD7EJxKkw7guulo/dz9SKyqvk/p3+Y7JbL7NbbKGy2MS8nuDBPxGjXArpM+w0yFb
         zkSunOQb+n7XzAdiVDZgHikSrRnW6ATdNyNpCjxyIrlo47doXieUw+x5w7DBp9qvQj3e
         Bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979518; x=1700584318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H+/pStoCerFaavD4+6+pbKHikmNIDPKszX2p8LZLs8=;
        b=VEPMI5KVvQxEH+w0jaOu1pzqDqZPyyDAjqCuSI4NXzixCZBEo7r3vYCTuLIgz8VROd
         6XpDXG5DlyzfxlaiCojtU2FavxuQDS59RTKGAGELBiww+N68SOeI58NIdxVWjQuqvSyG
         wam9Jff1Qv/l+9JlxxMB0X+C9OmQ8z4rhnYTi3a3Q06WqTaeMQn07XhSejNkl2djYheV
         wLSbZMZfFpdvch1PreO84SZX8H/mRvNAf1oUjkjUK+dYv1ZK/nsN+EhrOpxBMgUFSNsW
         G6DMED2+6quQ1cYEE4mVWHvCTvr/FfQtDbK4pbrGrJK+NhGz6AzOCXG365JhFMs4A62e
         7rFw==
X-Gm-Message-State: AOJu0YxfkkQBHhdQiFq3a6217GN5rsubCAmcIpzLTF6S0KhLqiiAWa23
	8SkK+cnBGy1PR5dllzuiCZg9PY/P
X-Google-Smtp-Source: AGHT+IFU6wDkoylQ5/58cZgzmE5wfkRGyUxVY57V7J9SRhQ2EOS6zAeN62VBuenc3iIc8vTnT/LH0w==
X-Received: by 2002:a19:9103:0:b0:507:9f4c:b72 with SMTP id t3-20020a199103000000b005079f4c0b72mr5872272lfd.15.1699979517897;
        Tue, 14 Nov 2023 08:31:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id c19-20020a50f613000000b00542d3e470f9sm5386152edn.10.2023.11.14.08.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 5/9] hw/xen/hvm: Expose xen_read_physmap() prototype
Date: Tue, 14 Nov 2023 17:31:19 +0100
Message-ID: <20231114163123.74888-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CxwrdBk0cufG

In a pair of commit we are going to call xen_read_physmap()
out of hw/i386/xen/xen-hvm.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/i386/xen/xen-hvm.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 0fed15ed04..536712dc83 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
 void cpu_ioreq_pio(ioreq_t *req);
 
+void xen_read_physmap(XenIOState *state);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
 void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index a65a96f0de..789779d02c 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -525,7 +525,7 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
 }
 
 #ifdef XEN_COMPAT_PHYSMAP
-static void xen_read_physmap(XenIOState *state)
+void xen_read_physmap(XenIOState *state)
 {
     XenPhysmap *physmap = NULL;
     unsigned int len, num, i;
@@ -573,7 +573,7 @@ static void xen_read_physmap(XenIOState *state)
     free(entries);
 }
 #else
-static void xen_read_physmap(XenIOState *state)
+void xen_read_physmap(XenIOState *state)
 {
 }
 #endif
-- 
2.41.0
