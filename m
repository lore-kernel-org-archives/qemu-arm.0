Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351168eje;
        Mon, 10 Jul 2023 10:51:06 -0700 (PDT)
X-Received: by 2002:adf:e44d:0:b0:313:ef28:d3d6 with SMTP id t13-20020adfe44d000000b00313ef28d3d6mr14455119wrm.6.1689011466543;
        Mon, 10 Jul 2023 10:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011466; cv=none;
        d=google.com; s=arc-20160816;
        b=iNFnXto3wID6jEGon7SxUye78ULJMk9vcEfPVpydHBYXlBHhRK2UMFIMCC+1BfEHSA
         JbdkPQLwJ7ZfU8rRVIWnlLaV+OxBueycAkiNmIETXXrN/bs+Sm6rdr9wUdC2lCD4fTUv
         78/V84+Z7OtVS2Y2KKbLIQcA53CEkrCzgPEbwv0HXxLQddus621EMuWxb/8i2LOm2kW+
         jc3ZGZ2kuShOPWP+9SEeVHRm76Vl89G0rJgyrxz3EiwPHfA1RyYJl+bkewuIUSfuKsff
         0a8gitq8GPBjlOiZ5wUzA0/WLGuzq4C4tOzTeiIJcengxH731lbKIe46c7MzMKeilczZ
         GDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bjBDCpoiteMk+vtT+Bu6RMs4u3VYv7NZmre5rEgpQbA=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=K9WAQZug01+64E+odwKKwtDmyX+NhSljASwf0tPsLY+PlFI9lq7gzX7DmgvcabJWXx
         BEjIikNTuKHH6CDxLJiwUAD7P3fIeBBtSfx25IFtXQCXBS4971ujCD2wITGPFIoo32Tb
         00mljLJwxhDrQbReiaoJqBYcjpYiobRnjmTkBT90rJ/J3hgr3CzG6qltvHjvQw3zQJVh
         mQGtdsUs7GzFwbnSxqMtOPiEnmZk0gJ6kiUewSaRIfaIWKA8ZNGwsNFK4a0wJ2UMWb7E
         BZdJOdhjUb4b4cvLelUTKV3waXHt/H10hHbn/xpZxXprDI6du42L/MvybmTFtSXj57C7
         cAGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViobvUEX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n31-20020a05600c501f00b003fbe0d0e596sor2354652wmr.4.2023.07.10.10.51.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViobvUEX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011466; x=1691603466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjBDCpoiteMk+vtT+Bu6RMs4u3VYv7NZmre5rEgpQbA=;
        b=ViobvUEX6bOMS1RO+aPZwqMQkpL/2e7jipZSa7zLtDkAzVH3ZGU6wC+MGFoa+bfRxJ
         5W2GqW2uUeUI7Ak6PeYrtThqXwEYWuW0DCoZDCUp/vxLaAVRUsv0oxgfFhKN5iBfP3HV
         q9gDxBtxz6QBw2d1lPZUuNyRT7NijR1WB778FBhEn4n+KGLjr37KC/FvyBuAOKwiIaM5
         yqC7TWtnnvJYRA+dwd3/hhy7XOEpTFkWP6FCi3WkYJNaYt2QoEO7V9pQolUtX3ll6e29
         KRbtWhuv4/Zelz2mpwqJVfF5skYVjFaNKHMp0GwkcVI5IaGBve5mf5VZ3Y4CaCBNI8mS
         wy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011466; x=1691603466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjBDCpoiteMk+vtT+Bu6RMs4u3VYv7NZmre5rEgpQbA=;
        b=J9+V9ia+qc0uyG07kc8Bp/TQF2JNs5XmckEg3SI5o2zHGXIcT39URcDvz3PVXLrUTg
         8TZacOCQq1/uGqYlk6wM6TvCsMGTb7WR19ZgYAQ9D++s7QObBsYPBadbE8pnKmMVIoM3
         zzEOWB3n/3UALN7wV2+tLqETI0W0oZHG9u8idAlQ11PI2splY4hh4Pmx2nS3OObhdjGE
         tqnnOWBVNzv1IxRjqIKhmT4ALQcZFFbcuubsT6U7cc5t1WMPv/kcmwFR8csSEBMEaMxB
         rpfXdv1U2Z/WmnaRP40fWyM1V3iO+QRYr05zmannOiDfeKFuzaCCxoLhcjbMCrfGdg6U
         7N4g==
X-Gm-Message-State: ABy/qLa5meiqpZeccPMnUCCd1fYI17RJ6yZ9BupD2IuM0yTnwQbzpW0N
	08wrTNwdNSP9Ld6Pa91RPouqXcB/
X-Google-Smtp-Source: APBJJlEPPn9CeAza1fV5XWc0RZiDdDkPxsLhgs4DFt4pMWmSe5G7IjDvgATDBiQ1rAZ99zGXqAI3Aw==
X-Received: by 2002:a7b:c3c1:0:b0:3f7:a20a:561d with SMTP id t1-20020a7bc3c1000000b003f7a20a561dmr12728469wmj.8.1689011466022;
        Mon, 10 Jul 2023 10:51:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fc17e8a1efsm723789wmd.45.2023.07.10.10.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/11] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Mon, 10 Jul 2023 19:50:51 +0200
Message-Id: <20230710175102.32429-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 56hgCQeWc95P

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

Since v1:
- Restrict pl011_ops[] impl access_size,
- Do not check transmitter is enabled (Peter),
- Addressed Alex's review comments,
- Simplified migration trying to care about backward compat,
  but still unsure...

Philippe Mathieu-Daudé (11):
  hw/char/pl011: Restrict MemoryRegionOps implementation access sizes
  hw/char/pl011: Display register name in trace events
  hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
  hw/char/pl011: Replace magic values by register field definitions
  hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
  hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
  hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
  hw/char/pl011: Warn when using disabled transmitter
  hw/char/pl011: Check if receiver is enabled
  hw/char/pl011: Rename RX FIFO methods
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h |   2 +
 hw/char/pl011.c         | 255 ++++++++++++++++++++++++++++++++--------
 hw/char/trace-events    |  12 +-
 3 files changed, 215 insertions(+), 54 deletions(-)

-- 
2.38.1
