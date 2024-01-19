Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp879197ejg;
        Fri, 19 Jan 2024 03:37:51 -0800 (PST)
X-Received: by 2002:a1c:7919:0:b0:40d:4e28:43e8 with SMTP id l25-20020a1c7919000000b0040d4e2843e8mr1363046wme.167.1705664271029;
        Fri, 19 Jan 2024 03:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664271; cv=none;
        d=google.com; s=arc-20160816;
        b=bh4PYMAlTogdiRBiryCtwCW3R24t98cY+CGP9acEac6M6obrNJMkYhNecBIqJQ5wOH
         vJmdaDHuR71LnIyORfq9N8fQQmTB4fgSWnf2uEQ91QCB7vqvBcS+R4STEEFzDSQlayPM
         0kPzXHMblVzMKxXaN59eEIxdgkoEvIFxeApH4+spVzmBScXvpaRiDKYzLdsKMnub+7a7
         ohvfAC594OmVdpmpt4CcascbMh4JgnOJujBHSB2Mg8aOKZPNPtr41hUuA51sb4Putox1
         wotx2+8nSVCrRxAmUbjKZWZjPbYgECI6tVagUYSP3F/Vt1nJJXPEH5HK/+zIdq3gEm0Z
         X8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Nr4OUHS+lBPFXd43ccavf7bhITrAw62IpLJRw1qHBNM=;
        fh=Fvwgvy80ygdP82bysZimOYQryTQSPXLk9G3SuBJkrbU=;
        b=eNBZgqEgodQqHdBywX//1m7nxErXv0pWYoxaF6VCq07K7XIWSkoKFXQ4WniLezwKaM
         b60OlRos/0sNzb1dlPlI2Bn1cKQJx1uCgr/kE5hTG96GaYn+J6gFjMYz8o5JZFe6dK+U
         7VQ9AEnQMo2LsFrxTGT7Bloz6teV2+v3gWVgai2Oy0gQvXL8hO9FQ3FTAFFkUAnDmm9u
         D3QGJcYIQ3TmXlnnOqZLFRcZvHYf+npv/X8YRgq9uzAfSev+eirsO1y5V661QBSdFfB8
         kkiab+5xV10HGS6UQoweDQCfkEHC41q+U2uyvSG6RsBJz7x7WFR7PBq/5BzX+YwvvLyY
         4PTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWAfgTIL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fc17-20020a05600c525100b0040e47c9fe2bsor202833wmb.0.2024.01.19.03.37.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWAfgTIL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705664270; x=1706269070; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr4OUHS+lBPFXd43ccavf7bhITrAw62IpLJRw1qHBNM=;
        b=uWAfgTILSbXx6uKODBrL7dmFNJytjpsgTJl5rokL/wHiMmMFuZ2Z6O/KZA6HF4uZwW
         azrT6rzsGpDbWAP+gV6qWH7Jordk4K7FcEzPPVBbvdnRzhLfXIYqJy4aEK1mE9loloiu
         J91u3Gx8/+S7AvP3UdrKgWnFSSl7nwT2Qp0x8Foyahx+XI40e3Wh06zQmkfSQ8dGFrmn
         kv1g9ZGgOpd1Fj5sbHjMrs/bDAcNMNiV3QymYOv31kZ4OEm5uH2Wyc0ljHC3SDRw1C1W
         HdZNjH4HmWa1kQ/VR3br0et+AUzLFJuO5WyXcQtQo2hh0M8FKTpGNX6l13e0Mh25Jna0
         FYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664270; x=1706269070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr4OUHS+lBPFXd43ccavf7bhITrAw62IpLJRw1qHBNM=;
        b=m7CEGRffnIGYEzQBoykYRn9sOQBJK8m+vz9+nSPG8UOBNU70Fn6dfenkqORYddgSdo
         yDiqDfaanYI9TWWc/tU9xtUaU0X3pkEC3u3OFlve3EqyvgxvtjS+Ma4/nccdVUikgCsy
         WC3vNZWwZHZUIJdYK552qcaDuCrV9fOacCVcYPdJnoEBuBiPqcPd/pdXnana6V6sUe+T
         XsfzJXxMEV/Cp+uiV7wn6EsxBS+98nf/LkTlZR/D7XlaDslXHQlskFV9xvqPI5zKPtn9
         IwkxYJtbFArcfOFsFYuMcHYT+tCEQfBK8ovLrakJZQu9cFq+itYBbwv2ixU5/yYyyzea
         2e2g==
X-Gm-Message-State: AOJu0YyNCYPIlgoDcgJxPyLoQ2FSUZ7oUPrCAzE4rUYBA3pgSKS/afbQ
	KXy2sBHaZbcVcNzdAZ72Q+Y+yJx7zZKgR5gW9V4O6lVRXoGV/X5cVST5UTWwV9OJCQ==
X-Google-Smtp-Source: AGHT+IFyTbs9SjNe0bzDqWuc52RujTUb9c4usvahIXvdRm1GAXWN+0NECvsNYTHwwL2fqfD9VRtwkQ==
X-Received: by 2002:a7b:cc88:0:b0:40e:6207:2ecf with SMTP id p8-20020a7bcc88000000b0040e62072ecfmr1314432wma.10.1705664270639;
        Fri, 19 Jan 2024 03:37:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net. [91.163.26.170])
        by smtp.gmail.com with ESMTPSA id hg14-20020a05600c538e00b0040e5cf9a6c7sm29076314wmb.13.2024.01.19.03.37.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jan 2024 03:37:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Bibo Mao <maobibo@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PULL 36/36] configure: Add linux header compile support for LoongArch
Date: Fri, 19 Jan 2024 12:35:05 +0100
Message-ID: <20240119113507.31951-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H9XdP59VvgGg

From: Bibo Mao <maobibo@loongson.cn>

When compiling qemu with system KVM mode for LoongArch, header files
in directory linux-headers/asm-loongarch should be used firstly.
Otherwise it fails to find kvm.h on system with old glibc, since
latest kernel header files are not installed.

This patch adds linux_arch definition for LoongArch system so that
header files in directory linux-headers/asm-loongarch can be included.

Fixes: 714b03c125 ("target/loongarch: Add loongarch kvm into meson build")
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240116013952.264474-1-maobibo@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 21ab9a64e9..3d8e24ae01 100755
--- a/configure
+++ b/configure
@@ -445,6 +445,7 @@ case "$cpu" in
   loongarch*)
     cpu=loongarch64
     host_arch=loongarch64
+    linux_arch=loongarch
     ;;
 
   mips64*)
-- 
2.41.0
