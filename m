Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074182njc;
        Mon, 30 Sep 2024 00:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU62D7t7t/qM0sBFP3QW5Y+3kQpScRY9eKfnqakbWJ8NbtexWGx2/M1kAmlxZ4CdjbrC5SmxR5yrz8gyg==@linaro.org
X-Received: by 2002:a05:600c:45cb:b0:42c:a8cb:6a75 with SMTP id 5b1f17b1804b1-42f5844b9bemr81507455e9.17.1727681713634;
        Mon, 30 Sep 2024 00:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681713; cv=none;
        d=google.com; s=arc-20240605;
        b=Wy68qBJ+Av5G1041Hhc+QEI3EoVC5vn6SS/fVKgXzgzHsWh1bPLPJfOtMb+O/4kA/4
         sdSQWo1dz/0nLJAnBHC3mXMLdgzcZbisVzflOXJ+TKY48lhdcmesFi2Ec+dfr/vKNQNs
         +bw6EtDpV1hK7bgFb+0lD4dvnx27vP9AB21tjk4u7TpVXyHKl+D0YRH25Y9l2qlnZSlf
         tIuGjIWmDv0kHsrWjb2Ayt5vOh2wPWhDbJKmHLn+8lUgY0VWhmLmwFHQl2iy6kQJqUDb
         T6Ru9vmAdoOYTidLoF6DFllVyYdWDv3yT3djWd0CX1f2wsIjx1jvTmo7RJAoJxFPTbWN
         XSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yXipE1vCqUL/2GGIC/pfDOg0/7HE+1Efkqb3qV24aq0=;
        fh=yfNF92Ce2/x7mUn0uulhkVYsJmpwXkHNidnZ6o78xCg=;
        b=ZlpzUF8FNStejqbjNGiuicIMLSvlle0/Cp6uy4u8PpWTx3MB71plqdfr4ozN/et5dt
         BO65gBquLT9HGDC2Qj3712JlB5UGorYIZ+QoE7q7GwZEA4dco/+YTP65b0A2YzUpR+Wi
         idF90i2quT7T5OJRLx8RQus9c28A0v1uJcptqDVvHOLGKmO/rtmRpsyCvintGQxzhCGp
         16NTmNOoSetvZwN0cWRTsxmg5A0MyP5sji+Y0BrbMpxjW9icH5GrJYxQ5wnE4XcMny76
         ChIpQLZXqsplpDwG11AHWFhDu0JQOWDqfJg79oLHYbpt60IjN7q9HKU16h5uNg4FeCrM
         lasQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u9mxmuFd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5821c0b6sor26059895e9.13.2024.09.30.00.35.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u9mxmuFd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681713; x=1728286513; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXipE1vCqUL/2GGIC/pfDOg0/7HE+1Efkqb3qV24aq0=;
        b=u9mxmuFdyT3cmZeUa43idZNfUv4KvjxSMsIrNtXXo8XheSNS9O5E9YKMP0/Q170Qp4
         992+uNjPNBcPIiEgTKXJTkM8bFsOqnl3ZqDymUQfKUofh7/LuPaB2dPr4+8EyTT6rd9z
         pwCe0JEFdvPWK5/lJBSzNUkFlMwK4i3kNHwnSr234JZIiuitn11pfiyefIycqx7xCKgZ
         aun4bEQff+3JYQUZ/LXYMkl9FlEJcCv3B3FFf7T+/V/tyWYnTRHH06A+eCcufSX5mkUW
         KwyRDqFHWWOjyr0DxuSiYiDsW64CEfGl/ZelwTaVyc7a8fKzBfzGmLwqFA51XEaTbmAu
         qDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681713; x=1728286513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXipE1vCqUL/2GGIC/pfDOg0/7HE+1Efkqb3qV24aq0=;
        b=WyGUbo/1IjI9bAzCX9/r2xxT0gluCDry6w3WyXLNZB1SFR0hcPBdnP40RVaSgaMgJ9
         mT3EVZKEDjGRvPiDrVtW4lnxqhZgLDmaOKT9DtWRs7/Txa5DadOZlIvGPwFu5+MSej6P
         bF9ccQOvmQPeGtrix66U8NoZZoKVIxeMSqQNkXtbaYFq+iag2QUsTYlOejCmxGOorW/r
         qP5tDWXIr4HYghyg5cJTTfRK677JDuzate5mohYdFhsrV1SzJs+TmL43n1Gj0a1ZZc5Z
         PMTgxsWsbwwNHU8/bgAPf97qztsN99Zh0CAnjiN5WZjmML4dZMkmpwpruVnFRcTupW6Q
         ifQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDms6/k5PW9uxlnz7WtSg4SoobHnvGf/qYdYxjXXlGqar6DfRUd0NGpY+t7MSa2t8R3wqSeM/M4oL5ww==@linaro.org
X-Gm-Message-State: AOJu0YzH2r8tj3CGlEDW4bLzT8xGN+/IFfh4qQQJIi7gIzf7sfRrBLW3
	feXO+wk267bT2YyaPMIYjv42nPh8DTZrSkjldSTMNIo76MALk4d6RRCDpb4gyD6gRw==
X-Google-Smtp-Source: AGHT+IE8wS4WpCF0/bxJggWg+4eccixi5G2yV44Nj13zqRqQ7E/h8vxjwxEQnrMTjigRWr4M/8ssTA==
X-Received: by 2002:a05:600c:4f86:b0:42c:bae0:f066 with SMTP id 5b1f17b1804b1-42f58434768mr72915825e9.13.1727681712926;
        Mon, 30 Sep 2024 00:35:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f58c523dbsm91069205e9.38.2024.09.30.00.35.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:12 -0700 (PDT)
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
Subject: [PATCH 02/13] hw/virtio/virtio-access: Use the ld/st_endian_p() API
Date: Mon, 30 Sep 2024 09:34:39 +0200
Message-ID: <20240930073450.33195-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pE9rGTK9l/pA

Refactor to use the recently introduced ld/st_endian_p() API
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 36 ++++++-------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 07aae69042..b920874be8 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -95,56 +95,32 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
 
 static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_p(ptr, v);
-    } else {
-        stw_le_p(ptr, v);
-    }
+    stw_endian_p(virtio_access_is_big_endian(vdev), ptr, v);
 }
 
 static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        stl_be_p(ptr, v);
-    } else {
-        stl_le_p(ptr, v);
-    }
+    stl_endian_p(virtio_access_is_big_endian(vdev), ptr, v);
 }
 
 static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        stq_be_p(ptr, v);
-    } else {
-        stq_le_p(ptr, v);
-    }
+    stq_endian_p(virtio_access_is_big_endian(vdev), ptr, v);
 }
 
 static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_p(ptr);
-    } else {
-        return lduw_le_p(ptr);
-    }
+    return lduw_endian_p(virtio_access_is_big_endian(vdev), ptr);
 }
 
 static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldl_be_p(ptr);
-    } else {
-        return ldl_le_p(ptr);
-    }
+    return ldl_endian_p(virtio_access_is_big_endian(vdev), ptr);
 }
 
 static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldq_be_p(ptr);
-    } else {
-        return ldq_le_p(ptr);
-    }
+    return ldq_endian_p(virtio_access_is_big_endian(vdev), ptr);
 }
 
 static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
-- 
2.45.2
