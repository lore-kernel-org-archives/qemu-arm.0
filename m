Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567152dyb;
        Mon, 23 Jun 2025 06:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSWaxPJGAAuyRwAi9fRbt2PETbmMKEzt7QLY55CYj1g69Vn0+hp/Z3YqfPfjBeq5JdKrawCWMrCMptKg==@linaro.org
X-Received: by 2002:a05:6a00:139a:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-7490d23e189mr16988524b3a.0.1750687110281;
        Mon, 23 Jun 2025 06:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687110; cv=none;
        d=google.com; s=arc-20240605;
        b=H85HndBinfVYmutUxKBak4D7elPJ3HWGqrmoM0vWt5k6N3zso2hw4RBHpV8Qm3lSzq
         8PxEYIIQJNtKDlKG6v6v85rg+40ssaFSBTd5bJ61FYAY5uWcDeLYC+nKEcNJOmlF7zR1
         20JBiEwc322+1ORNmwBD88LU99pOS9wbyixC/jBZq1GqfK7lpJUyMD3H65sakcRrbo1p
         lyS9spQqCbnmuIYlGVMmGBGr9ncVY/6mIIiNcNSYbJ849f+8JtZMRaQWdpJy0jvNnPdk
         IhSVbQpYQmpcMjdRsHK0D5VM/S5/sabYFf+7tRUe8wDp5Kb0QtNYsr4lSZ+Vxb6sOLip
         86kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Nlo8as5e/cpldlYDplp41yosw6ZzdGOstiWraYoHkls=;
        fh=8W2fEKDN0b0OaYhwutEjz1lXWpV0K6bfejyWqmjn1MA=;
        b=JLktCIEAeLBmImtZyBI3yAIFzJF58a0dcSkKDqMu6aZJPpPYa33EUEyHAgohBGkXoN
         dsb/8U80oXoMofhVj0OU1zUddRozAhP2ItnC5P2EidcAKrmVlJBildURAQlIbGT/o1dG
         uuWHv6g+u9vgbeQ4Ao1eI60Zqe3yOIsPr62JxyMCC5IdrrsYZb2F60y43wbxticHE1zH
         IB9mqktP8agK392ZoIPTnb+AQc5PfQNZ5qEi4r/ZjgyGCVof1xtNd/8bZkIC8EmLBigw
         fXl3mHYL7I306ddpMIHjvCYCkoZdU3CStcovKaVaYQewXdVUg+X5+2j2muR4F0KtmD0C
         wbDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSPE71Qw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b31f11eab73sor5398540a12.4.2025.06.23.06.58.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSPE71Qw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687110; x=1751291910; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlo8as5e/cpldlYDplp41yosw6ZzdGOstiWraYoHkls=;
        b=OSPE71QwugOEKHPM7JZQPQsCUFef8n0jxcUmEvNg78d2+jf1dX1/bB2D6HEfwHFjOp
         pbwpRWlXGTDCg/jQIPy9cTNh4JA5kXl2tGzaTi4dD16dwruRtrq6/f0PuxY3BThwdEDQ
         kO/0TREyKnp4dbO2Siu8RWWGW/Z+kwgY4T+oAC3eufn83Df8avPkdPI91+EVvEzF28xL
         wAcRbf2HjuvEzPJRe4XKryMB/H0KxSj5cC7Wdf8NU5AHLh2FpmfAY1eaq0ZcP5OwvyhQ
         K04slLW3GlA6lbcWxQFbJ1fv6RJuVdJMCe18zDRCkmOVPcAOjTdbwQ4hDWAy7nLwUWHk
         06pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687110; x=1751291910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlo8as5e/cpldlYDplp41yosw6ZzdGOstiWraYoHkls=;
        b=EFus/ipPDzKz+mylGcKJOZ94r/T2b5woMiEpgxle+MbmwHIOHzHdUKgmyDZ375K8RQ
         /OTZytRIqvkw2zB87jQpUeDzPYH6nS8jy0qkQfAlliAbK7rBJl1cuRMZEa94ThCWwMn5
         J+VVRrxhXDgkd8h1q4bJcTMJOld/VMonNs4DaEzSrGRutWuHTG85dSK4CCyqyLR8ozHZ
         9bpvX2vZy1rgoaTGGqhxx2a3bEC+6HfUC8ipounHfKhSoIyv+ypxIQSJBPDHvlGnOA1A
         Tfx1fSTwImf+qbINPJfh+DLJb6/HBXBDXTBXDtn4UxGAzFi1KX+nc0iptHL3A04NS2Yp
         y1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVLLaTa/5F7STsZfFN3WTfe+QDBk87zqBYK3Ux9I4NUGwTE1lP6fgKuuy7OPnMSmrWTcnC6VW7h6+JXPg==@linaro.org
X-Gm-Message-State: AOJu0YzR/stdUGcVy/Ehj4uJ1MXVBt47efH9giC5igKVjwSVrDKMKKo6
	BoocyZEF+EzBhJxm6c/fv5q19iBGXymv1FIUgaS7Yt490Q7Tz7ia0VSPfMywgkcHZO1s1w==
X-Gm-Gg: ASbGncsUVu63Z+KH/zdNkg2spDmNHotJ8GcQx0rRnha28qaIQQm9u7QLyRUtN+F5b7t
	J/Fm38zgj0jSfjFq7iKhoJWXY50bpBI/5GOgAcVdxULljkHkRLl8PndExu4mByLiXFEXslAhU3P
	IlhVv9OHeKFDh3F7t2TlVlJoGXXzrPiIBKDszQ7Qhh1vNdxx55H+BdsHWkD0T3OYd1wz4iIIF61
	BaURLDGy1LyMVilMYJAoI7q5NtXgajmhB6bHjNGIlWm7VlzQQflQLIVgEKtH7kqZWYnMvNnCzmZ
	MGYPLj1dfZk9eSxuWSizNV+Bcg6jF3YmN/6Ogq6zWyRX0JrEx9Oyo+2rBCccCATvmn+GPt9BRII
	9Ig==
X-Google-Smtp-Source: AGHT+IGg0Hu01Sq7RKr8UgZ1A7DHPgd6q0vY0ikfWBIFKs7+PyeEB47pid34WctGwhJJz5vwK28x2A==
X-Received: by 2002:a05:6300:614:20b0:220:2a67:14a5 with SMTP id adf61e73a8af0-2202a671568mr16673077637.32.1750687109875;
        Mon, 23 Jun 2025 06:58:29 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:29 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com
Subject: [PATCH v5 2/9] hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
Date: Mon, 23 Jun 2025 13:57:42 +0000
Message-Id: <20250623135749.691137-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YW9n68CXzYrb

Because 'tcg_its' in the machine instance is set based on the machine
class’s negated variable 'no_tcg_its', 'tcg_its' is the opposite of
'no_tcg_its' and hence the code in question can be simplified as:
tcg_its = !no_tcg_its.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a3..19f85d0abf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3337,12 +3337,8 @@ static void virt_instance_init(Object *obj)
 
     /* Default allows ITS instantiation */
     vms->its = true;
-
-    if (vmc->no_tcg_its) {
-        vms->tcg_its = false;
-    } else {
-        vms->tcg_its = true;
-    }
+    /* Allow ITS emulation if the machine version supports it */
+    vms->tcg_its = !vmc->no_tcg_its;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.34.1
