Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4876691njc;
        Tue, 27 May 2025 08:02:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXovLW2/Zw5I464VfxN7SbSkftXuXVfekiBuHaPhdJV+4Kr93rg4JZwpuWagj4QGVqXrxdcXUbIsPAvng==@linaro.org
X-Received: by 2002:a05:620a:198d:b0:7c7:a614:7214 with SMTP id af79cd13be357-7ceecba45b8mr1999743685a.5.1748358167606;
        Tue, 27 May 2025 08:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748358167; cv=none;
        d=google.com; s=arc-20240605;
        b=JIlFWzNA18P81AFYDVHCpoqYX1IOniJUSSNEZlepwD7GJ2Vf8WW0iqEYgJCoKH7sU2
         qstMz9eWITzwIwfxgn2Rcy6ivnlMJqM++EHYYssCTK5Lyb+lmOWGap98cEYYh/SKPN0p
         czGnlIdZUhnpKUmXywGBl9LRS6ez5NaSDvrZbBXSskZi8ncz4s9ue9vbetOusSdlHDJf
         VIQO5ok2XRQDKh1evhNqnnsY6q621tKbl/8aEHvyNHnu5dbCLjozSpKFSa9/u5P6a9ZH
         JhFowM4c8s1RH1w5z2AAZk254rvKvd4Jj7WhwlpBeHOBuOHuuC3mIEGmlJaxCHk81uzJ
         SSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=VQWVqvC08Xp7zGQnvxpeyUf1DukXF9QgCrg60idivA0=;
        fh=uIp3jj8EEER2Qmd4meVZCJ1Cq/60tYsjVDhWnZMeRE8=;
        b=XXvJofIVRDegfoOGn6+1M+kGu1yXeE79qw9KdX5AaCBiC5OAu9AZT05MBwJzd727/U
         voTLLcFM7X3ARXjgeN0t6MBTNUd9E9u2scJ8yaZH4K3//vEjwcatyy8bfB8auO8bk/OC
         LG1wUUimIht4+N+IvB+3BXhJxX1PwXcYSHGr6D/JHjqr3T9jvqmVqRemIwQvg/Gue2Ry
         YA4o6iUCHbMxTnVYXMZUXVTBklzNvrt0K4OBtRh3APOeWUxUDLRNlIjULeZY+gC5upuo
         l9dehTT8ESkafCR3t6CvD0M41u97JNcvorbpjGC+AvYIihbdn4OWvYhfMKUMV5pxmQC/
         d8RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmLm5G15;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id af79cd13be357-7cd46700bffsor2154755485a.0.2025.05.27.08.02.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 08:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmLm5G15;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358167; x=1748962967; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQWVqvC08Xp7zGQnvxpeyUf1DukXF9QgCrg60idivA0=;
        b=bmLm5G15x3968P/sg1xmH36JC7Jm7OiskepQxw9TP7IF0rrI8K6YQYOlZKUZeTHuiV
         7YatlU0rWjfVtEyN0Cq7j6ThF7fUtXHuszt6dAVkL6mlcJLy8+h7sLTVZAxif3b1ijvD
         nJQrH6/gIQN3PnP6+YU266wBA/vfq9ztrnvnPVokUYNzvtvNl9Ka4b2V5QQW8VMwmtTb
         7GYsIZjz92/8nXgR+qk1Ieqpr1iq1Wiybx6vwzVgO8zA9SIhr5mrrt/v9IRKyaLD6qJL
         zIhqT9cBRKH8DFSONZx7hwWUfy0WdwpZD/xocAWrrF5StbhQFZogP2/mblJSgzaNgjHn
         NsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358167; x=1748962967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQWVqvC08Xp7zGQnvxpeyUf1DukXF9QgCrg60idivA0=;
        b=kos3ozlShqTHM14feXBNbAmcvMbWnzBvWAh4c1fBExu3WEjg4wZ/YlKFoTih0URBZT
         cbPcvHQGJbKKeoVyw6sSwjltbE4jlI1cWPHyuu0P9+/Q7tL7rvZSVCXshm6oY4TtL1H7
         RWgL1pOspL9C5jftujcnmavGPkrOzitxs8APC6EKwZTs8D/G0v62Lg4EA7h09bn9jqVz
         /LpkTC3gU9qJhbDpIjl4SAw0sD9fUCkZRL6y4OixKcTtbCv91hG/DLIs+vIBoOAqNae5
         x1LZpzShBI437Rubz/NdQ7IxGl+oinXOeZ4y0/EQJbQwC7QFBXZbE4EuhQkp2MuWdcrY
         zGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu2Wpl8IRXb9DrAcjRjKqajPe4fMNf/FMrpwF0TE2c0vJj+uszx64zESQb21zswpX85Q9hC5J/lv7h2A==@linaro.org
X-Gm-Message-State: AOJu0YzV+kyuhS/5tG/wBinhDv/xIIpUpqvQHEXmc4MUR3HzkhQo3IYR
	uYRTA2enpdtosYvb85Q30p8tMq3BWwVCJ1ojb66z62zTNLeRmawDcBlE8D5YlGrY/pgV9w==
X-Gm-Gg: ASbGncsI0hr70S0WbzKBLhCKmEcaYhR61lpMi94zxS9B7zhOd5G3UBBTEvUHWKms5Ic
	0dF2/JSzKQvd1Ebr/Z+LMLzs5C9y9+UkQC9QLzdboXlrvn/1PnI9qMqd9TbKaTcfWEmRHoeIMuB
	4JRFEBxotZzw3dqgSKOIXvrc9dcW3xPciqIR90LZToj6ccUtp6QIsi/6rB1I+fSXRZoxMWmWcJD
	2BDMOwk5li5ox+RRqTS1zGl9xRS1nwU7EE1TC/SKPTp9e0jMt4pMeghepvLxgvzlzuCa1vPux1s
	2FFDRX6gxy8IjgtBfuoSb7CJYDv4tR1QyhxBdRCX3jQ2DQ3bAFT3lfAyrV7/gOIV5qJ6mybUslm
	daAB9pxQu1BNwwGDkglPHsQ==
X-Google-Smtp-Source: AGHT+IH7yldyN879XztzSQmAwIGYPh3TLazr8AFzJHZErAgZJ3c2KXqGc8JALi00JgIokb/BxFkSfg==
X-Received: by 2002:a05:620a:2615:b0:7cc:b4cc:115b with SMTP id af79cd13be357-7ceecbd8348mr1786940685a.32.1748358167002;
        Tue, 27 May 2025 08:02:47 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e51e94c9c2sm2189649137.23.2025.05.27.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:02:46 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH 0/2] Add functional test for ACPI PCI hotplug
Date: Tue, 27 May 2025 15:02:27 +0000
Message-Id: <20250527150229.1617074-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wlIhDdFKZEQv

This series update the current functional test for PCI hotplug to
support testing the ACPI PCI hotplug.

The SHAs for the linux and initrd images are also update, but probably
we need to point them to immutable images instead of updating the SHAs.

This series must be applied on top of the ACPI PCI hotplug for ARM64
series (yet under review):

https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg03487.html


Cheers,
Gustavo


Gustavo Romero (2):
  tests/functional/test_aarch64_hotplug_pci: Update SHA
  tests/functional/test_aarch64_hotplug_pci: Add test for ACPI PCI
    hotplug

 tests/functional/test_aarch64_hotplug_pci.py | 28 +++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

-- 
2.34.1
