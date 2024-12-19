Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1853418njk;
        Thu, 19 Dec 2024 10:32:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWmF/3ubdSHf380nnOVWrnIGedGtTzxaCK01csg8u+VnDv5Xzz/jTazeco2P/qRxgVPylQ1U7ndpZ3zw==@linaro.org
X-Received: by 2002:a05:6a20:158c:b0:1e1:ce7d:c0cc with SMTP id adf61e73a8af0-1e5e081c937mr192146637.38.1734633134570;
        Thu, 19 Dec 2024 10:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734633134; cv=none;
        d=google.com; s=arc-20240605;
        b=kakqWKJcjP2U3GgW8ybqvvDK5K9vKpV7xnR5d44iou4Oga44sUCvEEYTtwaZbC6tQs
         9yX//oQ+kCAfNBRC/faFLxz0x3AcBi+F/ArnKcteltqYYoFcz0JfTnX7wQwkHVrfINbg
         N4VsVcB7GonQOOBLYjHb6cTwo/nMqAvmc+fB9MwciXyKEvPggbEPPV1dRCATMXSHAHnD
         BvBUmciwFpHbc1b0Etgx/1JyavfphSX5nUK93a8c+iJqkfdpWzR9sxsUBk7PXkXncfyg
         q1YWCKu95UGnCPdwHvkwtZ7jA6C+EPGAwjs/Jv3C7OiJAckzZSxEbNAiiL6GHcwK6u6c
         B35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=NoMVdzf7dEnl3NQdwGbML5tlJY5JdwY7hUGe8zVB6Tk=;
        fh=j8nXtehHS6lO9Zf35/ujowx9VgJqLw2znRPYV0tqLnQ=;
        b=lswRSmwTOOXR1TEckrtgAFkGp/NLfwCR7ph0aEQbzj7F0QiMdtu8qWJX6ldfA9B6GO
         UTq0ve9Mnu/p4+Majyl2rd9XFPii8bEpEX53AOMk/+K3vz8I0apF+ROQQw3StLSa5B3s
         oOVfZ3kQ4w1S3Xx9acW42TvJC2S89rOb7AgvfCEe9SikVUTTKZt+QFPNjh14Vg/R/IkU
         v33wBcZBbl5ZHO5HrudCoSKCVWMC2AFKGZdUe6zsRpzVF5bsnSMgW6k1zX8Yy41Kn5T0
         9fPHuFbsidq2gdzVLAlw+3k9DWVmRlMOHHNvqPg3FHDQBExJt76T1cXw6YUjfp+vU4a7
         VNqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgQrSntm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72aad915229sor1792624b3a.6.2024.12.19.10.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 10:32:14 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgQrSntm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734633134; x=1735237934; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoMVdzf7dEnl3NQdwGbML5tlJY5JdwY7hUGe8zVB6Tk=;
        b=qgQrSntmIhv5jmPVrS0IApCzAOPgcF0Kosh9lBCWewBPZP/piCK5FqzXwolGa698hU
         gQ/zTKnAgVXLSxTYDOKYKrosAwEycUwbvx75AYhAst6lTGYc7g7dyEKAOq43RH6rDz5a
         WCllYlKY5FcaWv4TkBqzuSYyworCUHDIr5EgXYm4/em5HhroavG1+gUS/KcK+jjQUlgc
         seKKsV0J3VZRkENW/MhiCp85mD5OLItPdiQ2pBWSu9E4aTr9BpbDxEjl0psklQx2t5vN
         SL8FusSJB3koJwbTYAt8gWAWtk4GOpNfYF97dQfbl7jXdoQfdWgzgK4/bjrLgmDn2UiK
         l2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633134; x=1735237934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoMVdzf7dEnl3NQdwGbML5tlJY5JdwY7hUGe8zVB6Tk=;
        b=qjrwvuFNJ3GyXR7az4RgOOpGuaw11K/lXqsUmZoejhxzHawlUSfuJpGnoFMTVLDkRM
         89BdNYAJCrWy7H5tDeWEdGHy9dh3u637aQrDxyzGAe5ez7askrw3s1l51Vs9zwl9ppTR
         Ki6wddgxCwDCqXbgWEHt0IPMiIBOWg+QU7G+ko563WNmlrAtyC3SvX/XhhZyPZ16lRIP
         yJw5IsofrCAd/UlY1vcollNzpTjArwUJhXc/UdC3BjjrIUX9OdYgcPWS7SmmRwqwIhY7
         tPCysZUc+dzt31GOFWhfeqPpQue38O0MpmryEKVDk3tte4IvyQVGfydCPSlN5cKJ9afl
         UwCA==
X-Forwarded-Encrypted: i=1; AJvYcCXAsv2+scHFIxsE6mmQayRAm3Z6xFlJjL/VtodVOlx6TubrkEG8PkjgYXfbjElp3ZPDNYnOegnQiJvXCw==@linaro.org
X-Gm-Message-State: AOJu0YzUPNBzGXgbFD/BTky2fBestjzwFOoxh7YHIOBphRKSv6djxBG7
	5Snqp9XUtjx7ygAZONN+0lhkG0WH08PyDinB1sdRV6WiK4gJ7Ma+xCvZcu+MI+Ey2g==
X-Gm-Gg: ASbGncv29Z5U4YiFKyQebsINqcGsnEl0bTGfPiKeV33O78RrMQaRuk5c6nqXcnr4hPZ
	RFneFDxdqolTXIn8yeLIvsYYl1opvthwaqmkmBM97Z6kNzWWOvuNIqScd889Ag55tpNwMPW1oGO
	BVZhL1SUxNckFygytAdsPDZHvUZEXTf5AnW1ARXYbH8h4MPMcIxrTFXawqWWetr0qwtb1hkoSwh
	tYjwjczsRjxt8e04FoZlp/Un+qZnAxEwJL2h5vJm/p1XXfUr1OAOAFg
X-Google-Smtp-Source: AGHT+IH1RIHjckoVdXLtfDrC5JBvOGaa4S0Ps3ubbOqCu3ObdCi9E/lTdV0oqoo+Bj/Hh71Yf2zrdg==
X-Received: by 2002:a05:6a20:d80d:b0:1e0:d848:9e8f with SMTP id adf61e73a8af0-1e5e046decbmr235871637.13.1734633134142;
        Thu, 19 Dec 2024 10:32:14 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b302sm1624733b3a.175.2024.12.19.10.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:32:13 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/3] Change default pointer authentication algorithm on aarch64 to impdef
Date: Thu, 19 Dec 2024 10:32:08 -0800
Message-Id: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GwOF+svrnAmC

qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
spent up to 50% of the emulation time running it (when using TCG).

Switching to pauth-impdef=on is often given as a solution to speed up execution.
Thus we talked about making it the new default.

The first patch introduce a new property (pauth-qarma5) to allow to select
current default algorithm.
The second one change the default.
The third one updates documentation.

v2:
- ensure we don't break migration compatibility, by using a specific backward
  compatible property.
- added some documentation about migration for arm virt machine model.

Pierrick Bouvier (3):
  target/arm: add new property to select pauth-qarma5
  target/arm: change default pauth algorithm to impdef
  docs/system/arm/virt: mention specific migration information

 docs/system/arm/cpu-features.rst |  7 ++++--
 docs/system/arm/virt.rst         | 14 +++++++++---
 docs/system/introduction.rst     |  2 +-
 target/arm/cpu.h                 |  4 ++++
 hw/core/machine.c                |  4 +++-
 target/arm/arm-qmp-cmds.c        |  2 +-
 target/arm/cpu.c                 |  2 ++
 target/arm/cpu64.c               | 38 +++++++++++++++++++++++---------
 tests/qtest/arm-cpu-features.c   | 15 +++++++++----
 9 files changed, 66 insertions(+), 22 deletions(-)

-- 
2.39.5
