Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161149ejc;
        Tue, 14 Nov 2023 08:31:34 -0800 (PST)
X-Received: by 2002:a17:906:3bd9:b0:9c7:5667:5648 with SMTP id v25-20020a1709063bd900b009c756675648mr8031056ejf.51.1699979493898;
        Tue, 14 Nov 2023 08:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979493; cv=none;
        d=google.com; s=arc-20160816;
        b=SgZm6w0bzyDmt0WX5ccGKzujJVB78CMHzKUZ48vSvhYUhcpt52FrgDmLk0BZWRiY8X
         vWcogZmAFiBQFfVC9HV8sLepOvd2ypZ/XKcUXQx0lVczt0avM7ph+WHOM6cOd28KQs5o
         oLiJYd/tr774h6apc+fOCTulMMQxwHr0mubsEVTnlAoVRMaeFKdgAo3QoF3gqZt3o7KW
         osuNHYfxgh8cUIr+uKU/A+Wn2yR3ab/tEDdSEBqtzrralNanrV31brRa1AC6O7lQk/RP
         V6TFIk2TaTbclcK/aJQ+fTUHFcKZ3L6IcbAtJFzUYoHx39cVFNso9sCM+mlJcy4XHm0o
         qRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X6R5SODDqvfe3Gp9I1X7nXyO5kwGwphXiKxDLZtl7/E=;
        fh=gWEHW3TxA6a60GQ8RCwIBjY/qgn5Qdgh2FZ6pi5rSzM=;
        b=wtljI9l+7IafxWSBxJqt4tcoBYXHCPiri2PFBJtk5MXouNiLsilv3roHt9RCKHKxRr
         KWwqDH3ijXIBL/Fh3fewEZ8O2pnrObIWqgvIPMpL/tyHWPtCx03V9mQmVXDbuSyqBnQq
         DnSxjV85J67U5WLwAimwB87IE888ceCnxJ5C/NWEdk2D1SfFi3iB+qMDRoxkG1F1LTaK
         T1s0eoNHEpbvj+b+bRa9NIoXyuBpI6cQLwkIPs6voO4SwXde+ImbHCzCLckypEfG8sha
         jv6oh/+a70/7fvke5GQm/tc4ZtFCQXIpoogsyUv4ybTajSxWLfAoVoQaD36CeJ+X0sBb
         NGoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OoPwbbTU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ps7-20020a170906bf4700b009cc5a590546sor460691ejb.1.2023.11.14.08.31.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OoPwbbTU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979493; x=1700584293; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6R5SODDqvfe3Gp9I1X7nXyO5kwGwphXiKxDLZtl7/E=;
        b=OoPwbbTUcfzgz3lz6Vc851QMtynf++Y4yzpPVsml5AEC2oqrWIFZKXmXJKyScLzrGx
         ELEcRRS28i4VhyQln+UyyfK7G5kCBHs4PGYjYEMaozHDdkmKxbdO/A5VzChC+YV8Q13z
         tJPKBVWabKg8XkWXhTVk4WOYE+lacIRCBa+Gpap+EDO3dv/9pJbRArifsNgI0c+DOUUz
         4MfWvZ0UkEmyOnNi7132S7lGVs0L0pCBeW3FJLOJhdMhD/1nfRvZ2iO0Ydl/zp3NwC3O
         tIG/TM9MHC1S7Q85CEyC4N/sLW/j5o3nf3EYpLU6aGswMmyY32om9Frkh53dx9vVYxuF
         D5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979493; x=1700584293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6R5SODDqvfe3Gp9I1X7nXyO5kwGwphXiKxDLZtl7/E=;
        b=weyI3sk9pxQ9vCY7iW7U2AXuhyObPOfE19G5DCYuR9lD8LDKtRa+AcAxXPJ1gcNDpz
         ev+l9nruzjXfERFCZmZbzNp9XbJROthmmC3Shia+ag7PXEtOhcOAQm2twgYkjETbjs3H
         7a0dU5hTpbtjO3kB+mVQEZ+u/MBSmsRmWnIkJuNEGU26r9Ch7VI0ZsPdmXxjopHCKtQW
         G3gZnpmXy2EtcwgMfyVpMhW6qsQ53d4zp9XbYkEqhMfMJQ3Ohm/9dOVRugHiB295L54F
         JdKYVupMfQewDkppJ62S4+jWQrgTdAW/Yw3yr+ihyRbyaEPgE9EFxvhO9qDDGKWuoaPy
         8f8A==
X-Gm-Message-State: AOJu0YxuGORPvj43GXjd2CBr6lM4JTTPZgxeJBwJHWnAmngEc4bMuLlr
	GLYBTvap34JdnzTY+3MvVXEfzx11
X-Google-Smtp-Source: AGHT+IGutQxHrTQ0PDT/rm4Hi1BwUJSaiBc/cWKJ03y/patFhv44C9aSztIA1kKfAa9MrKB6HwgJAQ==
X-Received: by 2002:a17:907:1c9b:b0:9e7:c9e3:d63d with SMTP id nb27-20020a1709071c9b00b009e7c9e3d63dmr8902204ejc.7.1699979493603;
        Tue, 14 Nov 2023 08:31:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id dt10-20020a170906b78a00b009a5f1d15644sm5694182ejb.119.2023.11.14.08.31.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:33 -0800 (PST)
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
Subject: [PATCH-for-9.0 1/9] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
Date: Tue, 14 Nov 2023 17:31:15 +0100
Message-ID: <20231114163123.74888-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nSSbGVn4T4kj

Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f1c30d1384..8aa6a1ec3b 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -678,7 +678,7 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
     start_addr &= TARGET_PAGE_MASK;
-    size = TARGET_PAGE_ALIGN(size);
+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
-- 
2.41.0
