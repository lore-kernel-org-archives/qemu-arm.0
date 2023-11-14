Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161500ejc;
        Tue, 14 Nov 2023 08:32:04 -0800 (PST)
X-Received: by 2002:a17:906:46c5:b0:9e0:8782:fb98 with SMTP id k5-20020a17090646c500b009e08782fb98mr6563361ejs.32.1699979524159;
        Tue, 14 Nov 2023 08:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979524; cv=none;
        d=google.com; s=arc-20160816;
        b=C5LH+DmwOa7GrCbKbv3Iqn5WFjGgDghiW2m+x+RuU0YDaVkYhoWSuKP13Y0IpWUm8F
         MAnKhkXySCVj1suXTXB2U45zWKG6lsTbrf7j4ypaIR+OqXI1PNWH31I0axMIgI1oJCOX
         R6GfdLNd9YR4WxozSvEla/t7iQHqm5rx+BvbZTdFCILSyyat+78Rs3gsv6zaEKy80x9Z
         ZlXrQlXYawGRgnRM55HpMncgvSn3f08wYrPwoNuKygRzzt3kQHUpRNIIkobtmnv58dvy
         pEN2jRp0qSx5WhI506HYtKlLunElNKclEFW9KJsL5sEnqt+nO/qWtpzmhaxcxQazF6V9
         BTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WTlDtVgsnwcqvtsJBU/yKayNDVYOQAUQMToAEPEK6Gk=;
        fh=3ONVdx/N3j+Uu4iiyqRRC3lFqZDQ7vyxbDGhEJiZppI=;
        b=t9leJuJnfVsiJ26phDoja3dHh8LZjJ7u+XoeICczc0UArwM893C9R1qVjFAAOxeTJK
         Kr8cw+/YHUKQN2hF4Y+pzzBMnslWqyi3e/zv7CA4efk/L4LvnhXU8vIrjZZMsyrmorYn
         aQIbuFRqW6abKKhzxmcGtWAmmfFvrOasXngwupiWnQLRI1kln/cfE4NtdaqqnsUlfHXy
         N16MzjP9PP/tl4rBS+aOu0xH6jrvrKLNlx1YiezFwpCxUhd0GIbIhOeMrg6+E71A1J/w
         LDJ5uksXLiO3lb0FxDuuYVOAKjnciahcrzeGvC+2Cq9zE768hkbdhNeElJrnX5sXjgTd
         TWNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXz2vKXA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c25-20020a17090620d900b009e419bc64b0sor2032066ejc.15.2023.11.14.08.32.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:32:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXz2vKXA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979524; x=1700584324; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTlDtVgsnwcqvtsJBU/yKayNDVYOQAUQMToAEPEK6Gk=;
        b=hXz2vKXACZ8SCF3IF86FWaTIEL9e3wtQQ9glqJrh/QIK6MdlE+ptsFQDXSpboxFHRr
         fgVukXOXxNfZOgEOhBm040P5/3JtNcLSDdDG+4cReZawPgeY3I1If2UHrNDYvkCWC9+F
         c2+hxMCp1yRF0UKFfge2LvHPpAD+KwhqC7Cf7him0kfOSq5r7VWlUcLXfqp/0a4nbcFu
         ctk/9ctOdlpVJWi42wy3TWaSk9/Tm2YVOsqaO5i+sMjezm2xoDe+m80NpfYRjfEtXMf3
         BXb3eobU5nYz6vVTZwgp6pkdRR0zA6WYnhC+BLVPU3xwxerYqAcD6gHPrmX+iroAbWAj
         yIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979524; x=1700584324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTlDtVgsnwcqvtsJBU/yKayNDVYOQAUQMToAEPEK6Gk=;
        b=Ja8DhpUlz8t7LLr1fCOBXnKK1gO9GccKsXWAgABwI7lTEWxTPT6QAmgXyEuNl5Iqid
         WCFIENW5ml29GYLonwJ52oAeyk2yR74fNTsAKQNhZcA88HTzm87/VRMfVSxRkGd5hBzM
         egEjZIcgD3y2XrUQTAlU+/7WrJgC1yYptsq//9USU46FplWeTMODFhDvZI7pWTul0vzp
         Mbzip8AFDVGyHj2wXvLN9PMjrrxCLlNVKgyG7NCQFLKCRpgDAyxaYEnksin8ZNkpkk8x
         s5EjE4GYEm0gdQ3CXswqz4nHDMEmUN0lnXUwVoR4d/pZWly+LtUjSGq+/NOz7xGd/5C0
         279g==
X-Gm-Message-State: AOJu0YxlMxpt0QIWw4mp9CJtfepJfgU5Z1B9yvkxoyTV5zkCREDLKQnD
	51vMP80zCrU9eP0ny1sXbDrtNMya
X-Google-Smtp-Source: AGHT+IHt381u+VrZTF53LFbjgSQ6v/t56GRcLe7EuiK5Y6nqGj9R0LI6bw4MbxrPYnsq1mWw3maHWw==
X-Received: by 2002:a17:906:3458:b0:9dd:dc2a:eb8b with SMTP id d24-20020a170906345800b009dddc2aeb8bmr6116891ejb.41.1699979523898;
        Tue, 14 Nov 2023 08:32:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id b11-20020a1709062b4b00b009b2b47cd757sm5740724ejg.9.2023.11.14.08.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:32:03 -0800 (PST)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [RFC PATCH-for-9.0 6/9] hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
Date: Tue, 14 Nov 2023 17:31:20 +0100
Message-ID: <20231114163123.74888-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /VdYsf/YyeCt

xen_read_physmap() is the first function requiring
xen_physmap QLIST being initialized. Move the init
call there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 789779d02c..3b9c31c1c8 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -532,6 +532,8 @@ void xen_read_physmap(XenIOState *state)
     char path[80], *value = NULL;
     char **entries = NULL;
 
+    QLIST_INIT(&xen_physmap);
+
     snprintf(path, sizeof(path),
             "/local/domain/0/device-model/%d/physmap", xen_domid);
     entries = xs_directory(state->xenstore, 0, path, &num);
@@ -575,6 +577,7 @@ void xen_read_physmap(XenIOState *state)
 #else
 void xen_read_physmap(XenIOState *state)
 {
+    QLIST_INIT(&xen_physmap);
 }
 #endif
 
@@ -595,7 +598,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     xen_register_ioreq(state, max_cpus, &xen_memory_listener);
 
-    QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
 
     suspend.notify = xen_suspend_notifier;
-- 
2.41.0
