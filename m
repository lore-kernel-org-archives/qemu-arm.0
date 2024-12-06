Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1088841njb;
        Fri, 6 Dec 2024 11:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLSEzVT7mEHgOoSm9HxHPS4ZfHIqkBnC7CXyOrYz88jM6Fwu62wlKiqQQ/iy8Pd7bpQXc+IObtxqfXiw==@linaro.org
X-Received: by 2002:a17:902:d2c8:b0:205:709e:1949 with SMTP id d9443c01a7336-21614e077aamr49463265ad.57.1733512987310;
        Fri, 06 Dec 2024 11:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733512987; cv=none;
        d=google.com; s=arc-20240605;
        b=MfnRPBlhvdS3LddM7gVZv7zM+X+wJGCxRFPOBoEGYyHZDefijIGNnVq5hPA4usqVHu
         08obO7oEjZh228AOOmMsXgEabAZNgrRMkYtDZ6mMZ3MJDmo4MP88+HxNqyVY/Li+EAup
         dY3cIHep4FwMzpQCme4edaZ6LnZNPXPlbLPKhVLZjuvCj7zS24oMgUAQO6nfGWa9orPM
         r+nsPve9oHt3WtWDRWdV4vKjLtqsoT8jJCSzRecGnL69Eml8f4tzOIskuhWvyGopzBOH
         16hQgxLCi1WM/Hov95lNib2Fp28xYddqb87eYNMN3KnRE54nF7OuizFztoAlqpfu4gbT
         6SeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        fh=+pQqF+D4Xw8xd+X/WRHieKhLMgn5Fl0KUOkRvkYdcrk=;
        b=aZ3bpVSmrS2qzREGM3PKFNQIuJm6HV/eF2k1M9jV3e82Zs82JvepKKrzKXvny2QHNi
         /K7vabUgf7W9oRLwnbhX9IZFRo1RKQO/Nl2c0snUCC5OTEr+m6dcZLl+XyOIT81yvRbs
         tkvgU4ZAwgfH2iO5g9EyNXK9p/6jwfhHuJW3z5p4Ea1SIlArmS4O69ba8rEMOfYlK99e
         Ltm+MJKy+PN1wWywUknOP8muolG2GWMvyIU98zJonXuoDK6mNF8OiZABaMRvC6WGu0dE
         OBuDPXYacyVXb9WXvDE9XbpbHJ/ClBIqv0KCf+zUc0/PtLkMkTWWSsuvGW4QcM/wJ3TR
         Xqfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LArUJZCk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f99525e7sor30388265ad.18.2024.12.06.11.23.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LArUJZCk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733512987; x=1734117787; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        b=LArUJZCkkP0eccOFHnDvO9G2nUXwh+wKSJqf6gTQ3pxipRwr2/VeJKhowLardfZKM4
         wWub7n+l0wtM6cZefMj5qJXLSsNjvjRuJiAhY+ZnOSOXUGUbkUBf7ZvEB7wfs6YD6i54
         VVhJbR1CSn9bAQbgDEAl0Vv3wscm3mBH+78bjhCKoFQk8VGKZQGupraDLvn5guqHyTJW
         VNIXwZFlUQ0y4akafBtq4R7teSYI2SvR1M/OvvCPcEbOtGgB2L9T15UGbPDMLhxPkFkS
         bFAfgImFVfgbTT4VGjXcRTCO77O8yYVhUrpy4Y5wlbizJqlXw06MO89+WbPCMUbkVlh5
         xBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512987; x=1734117787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        b=LW6f9AS1ZqLA1SzgFZRvkw0ltQtVoeI103MoH3ouRGEt8+3L8oyFAht4Omh0HjYC/T
         Uozj42KZql6F+w//6UX++sRpV1UH6C/bvf/lDkNSYFSRpDnqr44dx0chaJovSqaNXWqz
         FDZfKkU85JmUwrNixMlwMpX/iRJbKUUhXAC2Nvo0OrV57dWNu3lxuZJvE70a7dr8n/7H
         luincGoPQRaW1JQTfmBGvV4XauMAJuDk9Z2VuOKKEL+hzD8aZIdn2xIP2W+mGOEfBqLl
         nuM+xmxp5hrzkaVhUi3yLWw1oqVOMHYakNXSTH5itkX5EFrq9Qz5uY4eeenkQSQ+wfM/
         NOHA==
X-Forwarded-Encrypted: i=1; AJvYcCXMWDJ+lNkNBB1Q5ObfRTqVC+8MuoeiHL6M6i3ElRaUYZFywtvrMKm29oyrJ57ezN5ckWfv4CkK8aM5Hg==@linaro.org
X-Gm-Message-State: AOJu0YyJFQRmBcG3kMGAMepXW8P02TbUC46yK8KPn2G6GPc9sSqu89EP
	vhj67drWluEDBp//ZvxYdJ3chvuDHA1Hz7SXmuOwQwIZ0WKWbeRk6SuzvRMYoZrcGQ==
X-Gm-Gg: ASbGncuyNrv6iVNO7jDDzaQuaBZ3TsyJ5sso1dxsqPPbCBqIV0+xmW9QOrQuaX/m8FS
	qwp0GRJXN7y5EvQBG3O03mU8pSqoEMLaJrBifO8m6pqYdUQ4CBlN67MiNlnrGL8N+cSu7QzlncQ
	ocEl3DBxjrt75q5BOKxkXjuj7S5STdRkfnamgvyk3EHSwKpJb023UG+lLmy1MRwTEqlcPolnVkD
	O0UQy+Tl/pRe22JbVU7/ZvB9B1mg3vK/cbSLXW07P5Nc/Rntb2dOVm0g7MM6rrTWXV+ayYRYsNK
	xes/is+q
X-Google-Smtp-Source: AGHT+IGFNMIA203JcpKeFIxylysn79ylSKbJqspslFJM5eEBt5ZksetIN2OXtt9tYkuYEuZ9DdKz2g==
X-Received: by 2002:a17:902:e74d:b0:215:7153:5697 with SMTP id d9443c01a7336-21614db3f60mr54621075ad.28.1733512986288;
        Fri, 06 Dec 2024 11:23:06 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm11720395ad.266.2024.12.06.11.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:23:05 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Troy Lee <leetroy@gmail.com>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 4/4] docs/system/arm/virt: document missing properties
Date: Fri,  6 Dec 2024 11:22:54 -0800
Message-Id: <20241206192254.3889131-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F+fqp4btnXGV

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 11ceb898264..d25275c27ce 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -169,10 +169,18 @@ iommu
   ``smmuv3``
     Create an SMMUv3
 
+default-bus-bypass-iommu
+  Set ``on``/``off`` to enable/disable `bypass_iommu
+  <https://gitlab.com/qemu-project/qemu/-/blob/master/docs/bypass-iommu.txt>`_
+  for default root bus.
+
 ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+acpi
+  Set ``on``/``off``/``auto`` to enable/disable ACPI.
+
 dtb-randomness
   Set ``on``/``off`` to pass random seeds via the guest DTB
   rng-seed and kaslr-seed nodes (in both "/chosen" and
@@ -186,6 +194,14 @@ dtb-randomness
 dtb-kaslr-seed
   A deprecated synonym for dtb-randomness.
 
+x-oem-id
+  Set string (up to 6 bytes) to override the default value of field OEMID in ACPI
+  table header.
+
+x-oem-table-id
+  Set string (up to 8 bytes) to override the default value of field OEM Table ID
+  in ACPI table header.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
-- 
2.39.5
