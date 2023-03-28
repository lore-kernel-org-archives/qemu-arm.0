Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2764087ejb;
        Tue, 28 Mar 2023 09:02:14 -0700 (PDT)
X-Received: by 2002:a1c:7c10:0:b0:3ee:289a:3c3a with SMTP id x16-20020a1c7c10000000b003ee289a3c3amr12324292wmc.30.1680019334053;
        Tue, 28 Mar 2023 09:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680019334; cv=none;
        d=google.com; s=arc-20160816;
        b=q3UjOFImVwAmGoK/QdKkBrWrHyfT7iGlUDFrxsQfFDz322gXuTP/3YdugqR7kW8pcw
         gitigq7eC5or8EC5aoCZSxAeb6Z62kj6huGDTRumq9s25t1mQGwdmb7NDH6jr/zU86wv
         NK0fB67hrmaaDTJwWxqT9yktQF5YPowIoNEmRp5EBDm3slG4a/BILGiwDfhXwP7O3Krm
         tTz4ELMJMM9JRelQa6NUKO1Lps/MZITtIUZ3yPujn3gm0ybVpP5KwK/+V9PfKssdW9/6
         R8dAOAVor66gUXmpSVD0HgGJpG1UDyy9oVLegbVf3Rr9WEj8PcMu/e7/5bGDVXY2DkqS
         SNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=DhzKhRdaeH3YqYYfa2/gIkHTzEDralXDVjVQACMXybuo+eCV95XiYo5faQBM7bcJz9
         AY9tABoKhxz3fwwkanOswrBBdPYDBaMeXFxnRHftaFoCWXy3deExXjLnozWWnb7ZdCnb
         prAqMFzGUXZIcq+GYcDLFNknNp1UM3e0YPXHRNmFXqnh/0bQ7EtjH7EoaJn04QyaLxXV
         l+0xny59qCqnzIC8AIy67C1+U3SyTdIJPD19btgaazzm36NmqePxYWeca5OQBn12WwhO
         wunbR49QzLa9V6xVZ1I9QRihK9vmNxBBoHmVcff6t6J2XRg7MYd6Rn6NMNraMISSpHLc
         xw7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBqnn50n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6-20020a7bc406000000b003e1faaaa3a1sor2725355wmi.2.2023.03.28.09.02.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 09:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBqnn50n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680019333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=YBqnn50nc5BI6U2W2Uz+dLXQxn1NXHOzSypufKCyjOjT+cy3R7s0R4aqhwiDm1EzRC
         TQRA8apn7ceclv47/0cw5P4cRiGgwQUuwq3Zo4MRQ58HSywEWli1lhc4vczj5tBN5cT2
         EH6UeGV8Y9V6THfP62La39VWMa8enqO41YrD6+m0WRymZ4gzfu0oHhnvJXWPG3aJ6bV/
         RZ+0MTo57uraXhRjNX2vobjAzL7jx5j4xTzbwv14WIC2WUvqtGkqyidF5A9rKft4ryjm
         QF9nr+Thu0ERZdq6QCcmboo4d90zZPpJf/uvYLxXMjBgcjG+0wXDMEo0kibI+mce/6jE
         Dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtiprwlUv8RpyZHXqJVAug6oqdjSRp6/2zuWFlQJTRs=;
        b=5/ORA2vU9Lj0qhlJgRB60trZMdIuoS/Qt1hZ7FZ2y6NjMFrmIs8LbcPPwBTNjB0SCd
         cM62h+UHSNcG/ZJZNt/gRf4H+WQOzjL7jnwRvYywuq7GDppWlG8QOa0r34ASoqVryEtF
         Y4ZKgUvngdXXYeD0nnL5td2pbi34fUvQwhfN7LXl+9RpKCK4/arcUandYXP0PBbu2ZYt
         B2HEzISqrYB078ns3MLS0Otuj7uIKxdpfTjURt1h3XaiN2egwIC/sKpy0LNV9MiW0KuE
         fdPfeSFWQ7NZue/kmg9jwCGsWuyAvTqAd49kkfas61eBGv3jIZ2iwG48QGvMzCuBsqA4
         SdPw==
X-Gm-Message-State: AO0yUKWnKizAos9qhe7MowGi+/GRUjgJepCZNTUIbIKXJ2rE3Y53qCWV
	A7UrPAYay7VH3J7jHpjFO2iCiY6w
X-Google-Smtp-Source: AK7set+wy+rcXei80pJmoUp0mvVFmGsR4Dmw3o1mOxbaDnbESYJxnRRG7eE/MMueHWRFm/HPkvRUVw==
X-Received: by 2002:a05:600c:204:b0:3ea:d620:57a7 with SMTP id 4-20020a05600c020400b003ead62057a7mr13068749wmi.8.1680019333682;
        Tue, 28 Mar 2023 09:02:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id s3-20020a05600c45c300b003ed51cdb94csm12936005wmo.26.2023.03.28.09.02.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 09:02:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/3] softmmu/watchpoint: Add missing 'qemu/error-report.h' include
Date: Tue, 28 Mar 2023 18:02:01 +0200
Message-Id: <20230328160203.13510-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328160203.13510-1-philmd@linaro.org>
References: <20230328160203.13510-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QibwXBtlEtxP

cpu_watchpoint_insert() calls error_report() which is declared
in "qemu/error-report.h". When moving this code in commit 2609ec2868
("softmmu: Extract watchpoint API from physmem.c") we neglected to
include this header. This works so far because it is indirectly
included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".

Currently cpu_watchpoint_insert() is only built with the TCG
accelerator. When building it with other ones (or without TCG)
we get:

  softmmu/watchpoint.c:38:9: error: implicit declaration of function 'error_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        error_report("tried to set invalid watchpoint at %"
        ^

Include "qemu/error-report.h" in order to fix this for non-TCG
builds.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/watchpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index ad58736787..9d6ae68499 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
-- 
2.38.1
