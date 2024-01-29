Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp276429ejk;
        Mon, 29 Jan 2024 08:10:01 -0800 (PST)
X-Received: by 2002:a05:600c:5404:b0:40e:9d77:9180 with SMTP id he4-20020a05600c540400b0040e9d779180mr4823400wmb.14.1706544601014;
        Mon, 29 Jan 2024 08:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544601; cv=none;
        d=google.com; s=arc-20160816;
        b=zHMdMopD4XgGodrMgUZ1yLuipK7vXl1bVrtsZur7cd6rorju+cB6Y1ah9175spjNr9
         1olyHL4jy+ymfcjyr6QPZV6ZKPDu21b0SVvJyVpURYn70l+YNjPiqqXQ9u70ZjsN4xT8
         xF9b4v4GicdO5L5XjWNlUNuuZ5KmcCO09OKBPoafViZrSbBu9JKCd13i18b0ML2fe47M
         zNOM0XDaaToi5RaRmTqQzYTkkpbNOBG6R2liqwpF2r2H+ite3aRczadlfth1uRaygdfQ
         E2X+bqiaDYOr8qkIYlmu3/1vYkGA8urScKurZsf3mcO+bdGmp9gUEDIdWMc/x/SlKuOF
         AaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=c1D1QWxLv9n1FAmCrJuS8BwGpLuNTIMzH6ItcOpVnrs=;
        fh=i8IrxfRLCV5OjP1q5SHj5PLJJsmsGE7RKBJUCNgfBeY=;
        b=ZevKLoulpn7I1t6Mvl8syBs2bJJtOSQGe5w8ULFPLEl7jNjX0ZQWgfWyJSpB04089T
         CmZBNkZMH6ltUzlotQ03yJ/+9uCiJNg1utJU1Qi/HvXUlTblMhbX9/1o4b5W6UYpgt7k
         Hl/gG8SuUgicDQvfUiaxdVi1n4V/18U1Zd3ELhFG4YpXw9Qs9SubLFlvfBrJYpLK3Vm5
         ZX9YAROLl+DnS6MQkhRoAz6n+SwWR+Ucaz165KtGJztGfMRUrcWlQD2xl+5yFocr5/AR
         biH2hhqf+7E+t/HuosGaHbPUmC/WdAFokHEndOr2dLnFp41aGobV0CxxSwTRqrYc2O2A
         /4Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsH865UO;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c4-20020a056000184400b0033aee637bb0sor159698wri.9.2024.01.29.08.10.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsH865UO;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544600; x=1707149400; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1D1QWxLv9n1FAmCrJuS8BwGpLuNTIMzH6ItcOpVnrs=;
        b=rsH865UO3Vl0mvi5BkToqbyopx123QNi7geCpNkZ9IUTtYJQpeSaAqCzTYEDn4K2N7
         BYMOA4gOoGCPoqe1m6Z8AqfK86Qhl5kb9rIxhpyEd/G+Nqby5J048ouLGUT0CY3pJLfl
         pfwvamTFJG374reOEs7nPB4GRRARg7rEU5Onx757IYfFBS+mfATnUPOAL1chYcdrUkZM
         1y+McVKz/fFdIdo9gwou57MTCTRA4apSfDojjbtWU1xIMLhw9xSwTir+mzeBkL3P6z/q
         x6C7UlT2JssfVK09deXvPpZ+gdNHqERoOWsGHaNJWpSk9xPakuwRPsmJWCxKdHfL14KF
         kUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544600; x=1707149400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1D1QWxLv9n1FAmCrJuS8BwGpLuNTIMzH6ItcOpVnrs=;
        b=DQ4FHRkl+c2DSZGfxRLNGDqvi35p0FT3HjvGE07OZpciAZj7SrAM/4CxqwsaDf4mpV
         kh90TjUiEXjC6zVXPdLGq1TKIGP816FpgkjDeV1XoaoqKCkXvi90Z95K7bV3/nMrrOf6
         /Co+zB1BFo4o2lpABrocWy6vvN2AtK3IQEINoINvGrFg5qWz6K4GQnFGbajZUTbMASkO
         YSpwd1Vqx5g3Lgn+TlnZjpn2628v9XRm7KvIP7a5zKhtPwtsS005RUReUCVmPJq+GgGy
         kDuIdieG7vCtdY6LVM9gtpVCxamklyF0zzFCMrNoZHkJLWpuarO30NB+2VKLRDl5hGeH
         5IzQ==
X-Gm-Message-State: AOJu0Yzu3RYTtscvYKPHYNP4zP/nImddMI9YIP9iQqbvQURd4L6z8RQ7
	g3tFTlu03gwOG4qoWYnoQujWn3q30Jfzj+XTq+E3jl3JZFvJXI0TAafQUa//9HNgqQ==
X-Google-Smtp-Source: AGHT+IH/bOzdB/hWLHnlC4utuFQ6+hGt+tEbKVS9IZSSoBHTJXpbHWy4lCR3Fz6iq3mXqvJWYwIstA==
X-Received: by 2002:adf:cc91:0:b0:33a:f340:d09d with SMTP id p17-20020adfcc91000000b0033af340d09dmr1781371wrj.49.1706544600632;
        Mon, 29 Jan 2024 08:10:00 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:10:00 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/6] hw/{arm,xen} convert printfs to trace/reports
Date: Mon, 29 Jan 2024 18:09:35 +0200
Message-Id: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PlIh3NpxdC/K

This series changes some printfs to use the trace event framework. 
Additionally, it converts some error/warning reporting fprintfs to 
error_report/warn_report.

v2 -> v3
<cover.1705670342.git.manos.pitsidianakis@linaro.org>:
    - addressed Peter Maydells's review

v1 -> v2
<cover.1705662313.git.manos.pitsidianakis@linaro.org>:
    - addressed Alex's review


Manos Pitsidianakis (6):
  hw/arm/strongarm.c: convert DPRINTF to trace events and guest errors
  hw/arm/z2: convert DPRINTF to trace events and guest errors
  hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn
    reports
  hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
  hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
  hw/xen: convert stderr prints to error/warn reports

 hw/arm/strongarm.c      | 82 ++++++++++++++++++++++++++---------------
 hw/arm/trace-events     | 15 ++++++++
 hw/arm/xen_arm.c        | 23 ++++++------
 hw/arm/z2.c             | 27 ++++----------
 hw/xen/trace-events     | 21 ++++++++++-
 hw/xen/xen-hvm-common.c | 47 +++++++++++------------
 hw/xen/xen-mapcache.c   | 59 +++++++++++++----------------
 7 files changed, 156 insertions(+), 118 deletions(-)


base-commit: 7a1dc45af581d2b643cdbf33c01fd96271616fbd
-- 
γαῖα πυρί μιχθήτω
