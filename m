Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp495618njb;
        Wed, 4 Dec 2024 12:39:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6eLlQUpuPYUE8hR5nqTmZgQsarLR0LNJ3da2yZTu6hz1LITiZQMJEvTVLvl1QkFjsm2us7ZFRva8dzw==@linaro.org
X-Received: by 2002:a05:6a00:1790:b0:725:3305:1a80 with SMTP id d2e1a72fcca58-7257fa4b354mr10978917b3a.4.1733344781231;
        Wed, 04 Dec 2024 12:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344781; cv=none;
        d=google.com; s=arc-20240605;
        b=NWnjpcNX7YTeCzyv6+WSqrf99++8HtQSpzc/8Q/CwTT8JiInoZffM/sssOTnHTCJ4o
         yFirKyr6nhYQ0qKeTbRNzmN3Hy8aH5WJHxQM1C2yTAgtBAJf0aPDc+ZZp4MQSo9xeLcG
         ducg3ltUuhus/5OQ0pWhF3wtxGDgpBeJys8Ash9GCqWg7l1AFptyGXpa/ha8NDqiqmVf
         Dgp13D+v7XpowwEbi8GdM2wykJh1bGwof+EMvMn84SkBYn0PcOCOwihFjE9OT/l8XyxP
         bBYGwC230S0mzAsJBNUf9FNUlbGK3B3ZU0Z2m3tB2zxJJDQrrwtDLEhXpANplur6XpI3
         042g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7uEWKx4UMORhXv3S4HTDKbGhL+95awbPajLQt+JOgxQ=;
        fh=PqpXi6Vvq4duho37pot10MkZEEonwgnQVFCjAflPGNM=;
        b=CQfCbtkDTwMI1yRhHYMAbzmdmMUrB1OzvFJZtyUqrvIr0uVZjNXSJcL7oC+mm4WFEo
         g9+Ez0MqSfnferKq2K538ayeVZfZ2JJ4WZyj3reA3NyUbWSXCoDYOJhPArqR8acdir7q
         nMljBfusgH0FjJwbdaJbV0ALQuiI9p7lEjqHYOXPh41h+A6MTt0/y5w75qiA7M6cMf/K
         F5i8gB40v4Wx6Vk6X0fq0hvhzrpdAeBPJ94PJRQJEMWbv+HyzyL+B0WwR/iV7gxuKo6j
         zPUV9X6+N8LRErtMJKl28R51jryfjZTUqqy8RHyFRqUA3mCo5wTYLmbCnRxi7Mgu6EjJ
         kwbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ah0wn9bf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7254184ef02sor9513312b3a.11.2024.12.04.12.39.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:39:41 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ah0wn9bf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733344781; x=1733949581; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uEWKx4UMORhXv3S4HTDKbGhL+95awbPajLQt+JOgxQ=;
        b=Ah0wn9bfG8tfjNjJP4z4cAiGoCh8BXH1BwamNffv8tZrBL6GQ4xH1LN71EsWplbzVm
         pL2WJLBmNvqTsfFuWfDibZD67JJdkaydWFPR1sO1UFlI1bNiKr+CTdSat2up8HYRhMOl
         dnod7Wyb5k+wH+9aXIMXiaGF39FyXZ+2UzPcc5uEjbDBsipaJWcLRuUjf/FJ6lbPAXxs
         4kxsNvA3hCTorypjDcHgfE7x3B9/ZkVgpyjFuhlLU5ocPyIgJc8/Xfs+VlrKsAVxBoCl
         hiPKLgPGPfGTduycjv14Pb3WPUINIV2ONFcwpgRV9PtCTXVQaBFiolna9TsMFjNTVgxE
         A08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344781; x=1733949581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uEWKx4UMORhXv3S4HTDKbGhL+95awbPajLQt+JOgxQ=;
        b=TrTCnWwP910egT4BfKA79bnIBHnIf2/sfkT0vUGaSG36ld2T9A1P168JqR9hBKSL3g
         2FMa5UVYn9HyOoxfO2gFvbr0YSJo+mDd8QNWkMn6Gg69oqX6HzwHdFW5hPKredUgNPfH
         5L+/au/hYT8k5FoQgLmwTiHqcaet+bkO+tzCCPnkQKW6klhoyyllKUO9r8wZLSxUh22i
         ICQSTUxmXmrRbEbW+G7cowcbykhhcykQeyTZiC+Eu2wm0yISlAdl9EVQ+U27oesfQCqD
         a2wm48gyDpYmcRE0HO/v/KC004V7Qdg0Ite1eFzkcmHrC0OJElwbct9Q54R15lfOMqxj
         nPnw==
X-Forwarded-Encrypted: i=1; AJvYcCXtB3tS7zvUAtdG9Jxb3shQAcKtoSRmqq3PzaSBu/4KbmDSbksQZoeSE87j/2Fd2U0g6iZ/gkLkJpviww==@linaro.org
X-Gm-Message-State: AOJu0YyEv9f4rh/BlsOAMcXvGxgskWQP3vgCMUiBQM78ctSe5N6MhJRT
	0pVT4BoOqqmd/lcZDCkG1TJmFUGXp0yssWmC93qk4iujVqjddcODgPXqSz+LSrOHOA==
X-Gm-Gg: ASbGncvA48yBHxM1JKYwHBzaXt7biVA/qsTjtTxcIn+rkdBMlDXukApdtHJvYEZX58G
	51Rj90rI+ARcaLpHLBygRF2U6oEaXh6THnrF0TNbIY6Dq+kMSnyOoLtaNlapd/brA5+WLQtfuJZ
	zy5HsZZSfOpDseYXqtPbJEcoC6h3KhRjdoZa3nMgy4yssHPRJFXe0pgDzL/vMbsDxKm6hN0ujJZ
	nGroB6YTbKsfueyjnPM5kfciVaZGIU/yxSGmER19wBN/sQ+MjL0Xjc/ghninoEqiJJnuOK1Eo+4
	OekFBaXJ
X-Google-Smtp-Source: AGHT+IGRmHH8Jghz9c6dmEXgPR1s3p0wyJTu/hoRK3vkNtXhjUhWYATNR7J22jzmrXEKaAwl6P+5XA==
X-Received: by 2002:a17:90b:2245:b0:2ee:49c4:4a7c with SMTP id 98e67ed59e1d1-2ef012101f6mr9882558a91.18.1733344780742;
        Wed, 04 Dec 2024 12:39:40 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700cc6esm1873117a91.21.2024.12.04.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:39:40 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	qemu-arm@nongnu.org,
	Troy Lee <leetroy@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	alex.bennee@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/4] Minor fixes for Arm documentation
Date: Wed,  4 Dec 2024 12:39:08 -0800
Message-Id: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: icM4REaiOw1e

Reviewed following things:
- system/arm/cpu-features (options)
- system/arm/virt (options)
- boards documented and listed with -machine help (arm and aarch64)
- grep object_class_property_set_description hw/arm: ensure all options are
  documented
- reviewed boards description
- reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/

The Arm section of the documentation is in very good shape, and this series only
has minors fixes.

v2:
- ensure link for orangepi is http, so we can't switch to https
- left patches from v1

Pierrick Bouvier (4):
  docs/system/arm/orangepi: update links
  docs/system/arm/fby35: document execute-in-place property
  docs/system/arm/xlnx-versal-virt: document ospi-flash property
  docs/system/arm/virt: document missing properties

 docs/system/arm/fby35.rst            |  3 +++
 docs/system/arm/orangepi.rst         |  4 ++--
 docs/system/arm/virt.rst             | 16 ++++++++++++++++
 docs/system/arm/xlnx-versal-virt.rst |  3 +++
 4 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.39.5
