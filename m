Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074542njc;
        Mon, 30 Sep 2024 00:36:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDA19ECjlzZCI5Fd18ldwFAI01oEGi5U/sYp/Rg8yvJfe676tgxrgdjR9KQ89cWzBlk7lQbJjxFFGhqA==@linaro.org
X-Received: by 2002:a05:600c:4751:b0:42c:b9a5:ebbc with SMTP id 5b1f17b1804b1-42f58440efcmr95760035e9.16.1727681778884;
        Mon, 30 Sep 2024 00:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681778; cv=none;
        d=google.com; s=arc-20240605;
        b=SVWDaT7if+kMvNLqpJgt5vYlLx457LlVDt9RQjAcJI3z3qDlgFRcxAVmbkrgJadG/E
         bbCVsTevzopuqIdRczKFKiQeQ+4LxTQGnAPNRQtRjd4SusZNEd0EkxfSDkus9b/3UuQJ
         FyMqfuWPoNeVKbWLwPDiLzN6QjBeiq7JKuEJxyp4LtUH93pUhzX3lfZ+71Ngodqz7aOs
         fdLJQ+VnLQ+JWIVVSA/7zqy/+XJWa+iltj5NsoWZmZLKcfXblZTnHtPHTzAccDgoK/h3
         RHs5Se0mFj6GS6euJ9LKAH5IJBR9BN/WzRNrjq/YSFvTOsOQ2kjNkA1WkTszNLFP2BEL
         w3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=No3UNTdnI2PUra55xn+9Km9SFh7ve86YSqv3e3Ulz3I=;
        fh=VZxA7oZdQjpTrvLb2IxQFfSeZW1+xcPXXeeFEX1RSFo=;
        b=hzDaAZLO9SJtUTh5sQIbzXH2jXcw3bEl4kV5EvLMI5L/0VDexnAzZ7kyqZ4oQ8p9lu
         ponveehu62iFJBuRtb7UOGP+aQJQHSm7U6Y9La+2tgILIf8pbFOyW+5Q56XV2Sjs/PS7
         106eM10GfMZH2Fr37g1TmMNdpaazCJPMIvzvKfydVEXZghDiUTB5o48O9jd35vdwVEKW
         5lkrSB+begRRd5ponvNB5lpxGwF53TYMp4swtWorPJjDCkFVZu0SJ6yHtlYZCawz3vi8
         sHMl2m6bugDtMJ9RKgr0dCc+JGN7l3df1kS04BHJuI7HavulgLy2rfQvIEYwHpPAsrD4
         NyFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x0KOc90p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5821103fsor24366515e9.9.2024.09.30.00.36.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x0KOc90p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681778; x=1728286578; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No3UNTdnI2PUra55xn+9Km9SFh7ve86YSqv3e3Ulz3I=;
        b=x0KOc90pf3vsKwLoU5E6i0PPA3iPM+btM55o7h0ASP/fLHSnnJoLUhbaXwozm4oe8L
         J0vDYZpH8r8eegYiPXl93YWwpKFK9FurygYqJo0fwmFn2PZI2AzN9CGARfrjvVDBGNtz
         6qJ3C/Pl9PhS0JgZ+NBlOxEZTkofDET3fj3qTWjaTVHKuTg5eNCuAG+FZKz8pr5VQjQR
         Mv9roXNp9EzOhlgXkfAdk78ZrAmfw6xbKmtQtjAWgxAvtXXNV1EueExwEHSr0PB6fygU
         4MkhEQjAbfEh4fgvgAucSqwMh2BJfnVELpketADgqydypbrargf3CSn5QAoBFFExi4Oq
         2MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681778; x=1728286578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No3UNTdnI2PUra55xn+9Km9SFh7ve86YSqv3e3Ulz3I=;
        b=dEG1oiPhy5oyWdGaG1UVQkfAef87jWZsFWX2XYSmJf+94/Ys5I54FpU6TyYsVL9vkj
         QMkegbjMGFIoCmZ6fh9WxSgsvd5vv3voHK55PnvuutFruKARyHY5qhbHwRMb8TnBiHBI
         WJBLUE9TdNHio3+/b6s4Z2gpFaPtem8U970+8McLwyCMbbd9sQ1rX9smfR7jUrbvMiqM
         fJ7mjG1sLsvG6dV+geKqyWIbX/6lO6pne+QxqKqjIuyVQspx2CKiIBDQ25CGNxajXH5U
         11Nv9QOvuEFk4yppUNBwWOlPAzYHPRIqU+HeB4SHFqV0jOceISJb9yiLZETOJDqZvGMZ
         u5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWUhVaX0kYWQtrbNzcS7hSkZm475nA5VB19YsMEI0vbhwMjAgD2TbpRYzcWwBEfg4ZtSXKPRdQ45UfR7A==@linaro.org
X-Gm-Message-State: AOJu0YzsfwZr10idGNVLl1KFlcNuk8Kx1vFYCIg7qmQPpJ2uPwZyqvb4
	Xg9N1uSp6i//nTViyteTRGfX/UlbttZ4yfBVBM5VndwxXwnzXcpGxoSUiVInnG47MQ==
X-Google-Smtp-Source: AGHT+IFRv3VLtyKO7mNdwt1H9m+lBB/oi2IabLTun7tIx7ArAk7aBJ8x8BS7GDBx16sOWJESKh3XrQ==
X-Received: by 2002:a05:600c:4f01:b0:42c:afea:2a10 with SMTP id 5b1f17b1804b1-42f58441814mr91713325e9.21.1727681778254;
        Mon, 30 Sep 2024 00:36:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a54dd4sm141894255e9.45.2024.09.30.00.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 10/13] hw/virtio/virtio-access: Use ld/st_endian_phys() API
Date: Mon, 30 Sep 2024 09:34:47 +0200
Message-ID: <20240930073450.33195-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3DKO9EgILfQh

Refactor to use the recently introduced ld/st_endian_phys() API.
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index b920874be8..37a42407ea 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -43,30 +43,21 @@ static inline uint16_t virtio_lduw_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_phys(dma_as, pa);
-    }
-    return lduw_le_phys(dma_as, pa);
+    return lduw_endian_phys(virtio_access_is_big_endian(vdev), dma_as, pa);
 }
 
 static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldl_be_phys(dma_as, pa);
-    }
-    return ldl_le_phys(dma_as, pa);
+    return ldl_endian_phys(virtio_access_is_big_endian(vdev), dma_as, pa);
 }
 
 static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldq_be_phys(dma_as, pa);
-    }
-    return ldq_le_phys(dma_as, pa);
+    return ldq_endian_phys(virtio_access_is_big_endian(vdev), dma_as, pa);
 }
 
 static inline void virtio_stw_phys(VirtIODevice *vdev, hwaddr pa,
@@ -74,11 +65,7 @@ static inline void virtio_stw_phys(VirtIODevice *vdev, hwaddr pa,
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_phys(dma_as, pa, value);
-    } else {
-        stw_le_phys(dma_as, pa, value);
-    }
+    stw_endian_phys(virtio_access_is_big_endian(vdev), dma_as, pa, value);
 }
 
 static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
@@ -86,11 +73,7 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
-        stl_be_phys(dma_as, pa, value);
-    } else {
-        stl_le_phys(dma_as, pa, value);
-    }
+    stl_endian_phys(virtio_access_is_big_endian(vdev), dma_as, pa, value);
 }
 
 static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t v)
-- 
2.45.2
