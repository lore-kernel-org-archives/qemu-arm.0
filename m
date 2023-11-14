Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082806ejc;
        Tue, 14 Nov 2023 06:39:07 -0800 (PST)
X-Received: by 2002:a17:906:1395:b0:9be:ab38:a362 with SMTP id f21-20020a170906139500b009beab38a362mr7051426ejc.46.1699972747266;
        Tue, 14 Nov 2023 06:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972747; cv=none;
        d=google.com; s=arc-20160816;
        b=xxlpA+bkyUMdYoY/imwgCgoRh69TLUwbyCj7OyJOGyRLWb95nJRGtoC6KjdXIc7ZEn
         1ft78QPPq0eYw1mSygPSdXvrBL0eoExcpuo85e1brWrOCFlnWU6HpgUIdEc/56BacNX2
         SFQYNw2y8DE3jXaExbOyVRUQ1dwjFwFB3pyX7Hu92CfCuNFB/c6Yx48AiDyFof8nQRVC
         mucQ8LB17oZ0FYbyOUrUm/cfCfDLfkBkoqdkXi79d9Zj72Y+Uc+JrCKZbW3X9wkoHyWq
         d8sEHHC0NZLbNyYJ4w2xOHPPBuCPPaa34eC+UhbIpS7Nm3zzeylkZugIDGu0k0UpnY9e
         YC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oo2mmHUNt8cswMDm2G2tk7NYG50Leech1RMDbe0XTgw=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=VXXxRTlOQ957WNytsbN0TSG7Ep/WvX7kRrHWa9DLawvikhNA7P624ccOn1ZzolsFfi
         UxBD66elT78F5ns2zfMxMAeXZZkLldHYdr2cqTQf3zBtlOOMn26F7/hhmYbG82vOjJ0j
         grBr8o/EWFegTmRZDq5Rh8THAZ5cGSiDBKc8uriQZiEk7ktBvp3NcZg400lBiW/4qSxW
         GrCqrUoNtLBfRAn7I/CfWWakapErwkStCwhH5OUHJ91KevftgZ9j7JQuR5nRvTEuDlgY
         KD9tQ0LJjPYxRYtqZu8xk+FELKS5GvFYndlwqjFPnIYe7PYgQlC60rsXk0ngtES1ytcK
         qNoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVZOuKEy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 14-20020a170906008e00b009bf54269e3asor1970409ejc.1.2023.11.14.06.39.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVZOuKEy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972747; x=1700577547; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo2mmHUNt8cswMDm2G2tk7NYG50Leech1RMDbe0XTgw=;
        b=zVZOuKEy3R5YBMSI4ZkoEcgXh/l0M+CzUxK43nWr6S2Pc7zuw2bgEoN9f1iFNCXf6Z
         QouIp7/5/9SEsENnZIcrj13UBQYNk5MM62ZkdfmUTSTJa1qOCt9BixLcc7GVTCe+zIGX
         u55KnqDkh/gWKiyn7kaaUBOyrgwlUodohzedp5T/OXYgdJDb+vFOjyaUWGXLM+7CmRgl
         rYp0tjg9IXP1ZP7/ych/fz+8UVg83N8xw1hQ/NhZD8sQcDKRR0CgAEpL7L7sa/73lhSq
         9coU55POYfXMYW3fGFUey/73mBw2EdJOfr3VD60hEtAZl5cRNuxL+UID0Du3qJd4qRMi
         3LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972747; x=1700577547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo2mmHUNt8cswMDm2G2tk7NYG50Leech1RMDbe0XTgw=;
        b=hgDC+SA5U0Oh1El7Q4oZZ/psg/iA9a+KFi14Ybxh1xyGw07trji2reg4XeJXAPQ2rW
         7kgwytv4QMtL3MN4Ht8y+NVAX6/3pjwqZwfIX7pyLLaLyOnLu0lPFVIzbm5FPZCB9tbj
         PNHKsTcJGjj3VorbVFJjUzfUXZm8pRFfE/eK4V7h9pikILra25YEHQ2SUB8nFnuMHIOz
         P8ORqHQInEYdHkgB8vJ5pMGX1EFxCkr5e7DW+pnDkCUS7Zor45dwkxnVbdx2SrNoMurr
         T97OxZ01qtgNGTKb6bFkra1WWh9eZ/cc4zr8CjBE/0wML7m/9EdTtbkwFEta9NVtTAyK
         gKgg==
X-Gm-Message-State: AOJu0Yw3fF6BIm+flUfk/Zp2QVYaofiqPjTaCITDIeEzkXHPZl2xB7fb
	dodHdjqNcW8XAwFbl29JQif2kYal
X-Google-Smtp-Source: AGHT+IFJHEre72B5jboKAaroDeSDmy2A+msHyepV3IUCtazYitevtMIyD1yfonucyI3qP3HjOGn0kg==
X-Received: by 2002:a17:906:45a:b0:9c7:56ee:b6e5 with SMTP id e26-20020a170906045a00b009c756eeb6e5mr6778901eja.40.1699972747032;
        Tue, 14 Nov 2023 06:39:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906234d00b00997e00e78e6sm5591697eja.112.2023.11.14.06.39.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 07/19] hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
Date: Tue, 14 Nov 2023 15:38:03 +0100
Message-ID: <20231114143816.71079-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ut1Mao5NfOM7

Since commit 04b0de0ee8 ("xen: factor out common functions")
xen_hvm_inject_msi() stub is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 7d7ffe83a9..6cf0e9a4c1 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -24,10 +24,6 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
     return -1;
 }
 
-void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
-{
-}
-
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
-- 
2.41.0
