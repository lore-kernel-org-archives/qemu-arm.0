Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161071ejc;
        Tue, 14 Nov 2023 08:31:28 -0800 (PST)
X-Received: by 2002:a17:906:4907:b0:9b2:b691:9b5f with SMTP id b7-20020a170906490700b009b2b6919b5fmr7060938ejq.41.1699979487857;
        Tue, 14 Nov 2023 08:31:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979487; cv=none;
        d=google.com; s=arc-20160816;
        b=igFrLIxTWOg6n4wnFtR3E5VdMmLx2rjdw0FlBXOslPcnQHqMvOnOR+UlGqGtxLHF6/
         bHW6hpX9ZOxFu4FkZZb0lPRtbBDQ9C3awJxZKFUBCVXAP4I0HyQO/2hdvpdgwhp58CjO
         aIhH6Ii5xAYBRUzgEgc0Q0CCmxJrqSqUvkoP5xrQu5S/by4AqB8Jmpm3qHVLNJ2s6dvI
         DOfOuna1olkIti1qJBUepM/G6P4TfB7AXoQ2elM2ne68SvBHXBigA0zE8iv73YB8HUP6
         6BSKG7tsJbfKKYTJR0OLZXRpdpuVxaAg70bWapRr333PmiKX/4yMtVYHmEhG6MwuuRfH
         u+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=WLUIW1wEN60RfjCUyh0wJRK9Kz/EqjAkfQjEh/PTjs0=;
        fh=9pdq7NpBxJPnvyNu1sJsWepRx2HfUbiacvC5FeL2cfI=;
        b=c0E6yoDIMccunnk1oIzI+mSQpiW0xZvEmwjjsIXJnKhFJdg44LELTZ7atTVSYjjuul
         KqYdbfxhAA4lr2nq9cxjY2XilV920ph69QDnhlzuh9VOLoWrEPP3Qwe6bzywceI1qgcp
         NpyLvFC/PzHU/5xXflQpUTkpku4p9BEiqw91O3KMrXGFKcDzCECskXd2ztsd43DCjJQV
         YufJ0ZlAOI3kYeIxosO3pYbFREe4PycjTwY0KF2YcPEHJqxGILe+gS+RQqyMCqpJirqB
         lYEy4zj4UA+LgZbwKexSLVcbwoRymDoR9wmIaHl8PXXdxvMfsrYzSNUvtcswEwUoMnHR
         99pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhvaYpfy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 27-20020a170906001b00b009cd938511ddsor477368eja.21.2023.11.14.08.31.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhvaYpfy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979487; x=1700584287; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLUIW1wEN60RfjCUyh0wJRK9Kz/EqjAkfQjEh/PTjs0=;
        b=ZhvaYpfyIxQmxx5CdKoM1HprYunDk72+1bAYreYfEfYmsOcJqcxw5K/K8hsiDgQT4A
         rAKxz+pR3l7VfiNIvh8TMevjmoMYY9awkAFEyXnlqCJUwlCdA8WIpOxaP8rfzL77KZQO
         +2KsPPeytaRvgsdQNF0LBHwraGct98JGmdI8KugB7KaGYuEm4TRC7yB/a4A8BQYzo1Z2
         yYOCsZB9Nn2VAaomgoLbi+xz3RTgS46BSJLGUtgf51k65zz57Bd5kzrhLptyKCq2QOwM
         6+0siZ7tdfnuO/zzPRGA8HX+7H0TNAsfUDZjunx+iUEu7JwQpSmuulMmJCFkpDHR/8bp
         j+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979487; x=1700584287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLUIW1wEN60RfjCUyh0wJRK9Kz/EqjAkfQjEh/PTjs0=;
        b=qbvvylnlbkdfgAnh1Os+SOKIIjPmcxFbXTwJhalhCSynVsstE6sHOj22Z0JXK3+Pt7
         uMIrIszkJyzrwoieKDKii/k1Cb/UTjvwfa3FbERnBVDoywYHDp72chfpRcF3wZbFeU6Q
         v0fko8pvaNW8YrczaZOtmWUjX8D6q+opMO9DvPwyj84AIiHwsBVi+FX/G4TlXYiTQn3k
         a5+yh5qtRuWkvIorSPXDIHebvIHc5yXJaqXwG6ng26Ic83Zrxn7Oss7S1RfDgxwAiMIf
         8f3jbqcheT5eLI404n0vzPJZUqsCa/XTJqC1lF8yfpXRHCmnPsUBqVMkuS9vOezNpgvp
         xk2w==
X-Gm-Message-State: AOJu0YxDaCsR57bJYb7OjpRzfL6dBGmjDFpm5v7Rrld4O6SGQ99LdaZ9
	C/VvmO4CxOcxuGzobkJPjBX9xxXQ
X-Google-Smtp-Source: AGHT+IEWSkzHY5obRM6zNhXhqu10PReegPajovJZrPBLVpt+fJDzRpOh65h9KSuNBeV+qPZ25y+u/g==
X-Received: by 2002:a17:906:b889:b0:9e0:dcf:17f6 with SMTP id hb9-20020a170906b88900b009e00dcf17f6mr7932359ejb.58.1699979487100;
        Tue, 14 Nov 2023 08:31:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id m16-20020a1709060d9000b009be14e5cd54sm5785453eji.57.2023.11.14.08.31.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:26 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common xen_memory_listener
Date: Tue, 14 Nov 2023 17:31:14 +0100
Message-ID: <20231114163123.74888-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: wI/yuGGpldch

Hi,

While looking at Xen target-specific code, I noticed some
generic code used by x86 which is not implemented for ARM.

Maybe ARM machines don't need it, I don't know. But I
wanted to see if I can get this common code target agnostic
and build it once, possibly bringing smth useful to ARM.

The changes don't break CI testing and Avocado local tests.
If this xen_memory_listener feature isn't required for ARM,
I'll send follow up patch that keep this series with common
xen_memory_listener but with a runtime flag to disable.

Patches do the usual "change target-specific API to a
target-agnostic one", in particular using "exec/target_page.h"
at runtime. Then non-x86 code is extracted, then merged to
the generic xen/xen-hvm-common.c.

Thoughts?

Regards,

Phil.

Based-on: <20231114143816.71079-1-philmd@linaro.org>

Philippe Mathieu-Daudé (9):
  hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
  hw/xen/hvm: Propagate page_mask to a pair of functions
  hw/xen/hvm: Get target page size at runtime
  hw/xen/hvm: Expose xen_memory_listener declaration
  hw/xen/hvm: Expose xen_read_physmap() prototype
  hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
  hw/xen/hvm: Extract common code to xen-hvm-common.c
  hw/xen/hvm: Merge xen-hvm-common.c files
  hw/xen/hvm: Inline xen_arch_set_memory()

 include/hw/xen/xen-hvm-common.h |   5 +-
 hw/arm/xen_arm.c                |  24 --
 hw/i386/xen/xen-hvm.c           | 441 +----------------------------
 hw/xen/xen-hvm-common.c         | 474 +++++++++++++++++++++++++++++++-
 stubs/xen-hw-stub.c             |   4 -
 5 files changed, 468 insertions(+), 480 deletions(-)

-- 
2.41.0
