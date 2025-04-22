Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136937njd;
        Mon, 21 Apr 2025 22:29:43 -0700 (PDT)
X-Received: by 2002:a17:902:d490:b0:21f:7078:4074 with SMTP id d9443c01a7336-22c50beff1dmr193153945ad.7.1745299783646;
        Mon, 21 Apr 2025 22:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299783; cv=none;
        d=google.com; s=arc-20240605;
        b=a+7Q8Fdd+xNVttNPIbWeBRtxs700cU5SyPJgjL8oiVcDvrPp/jY1mSw6VLAkLLUQYN
         owe5g/i1FZbx2zej4fnKI2DuurlWaVdI651WKiIwck2VnelPww/sOg8PqDzFpNhk2M+y
         7q0E/XDI3xDVfxyIzDZ7vUosNEsCrv7z51sE0mRKxW862q2Ki42Xmb5t+MVK7T6VnO1X
         InW2suFaB0KGasLCI/8V9NBiNit3FVwbtqH7TxIBAGe4WBz5LP6Y5jU801rOCYqfNYk4
         aOjSXhuw5PQ0ZhFCVtLbzJoxQW96rOet6KrgApR7qaNgZIPgOQdg7O//avTL3d95Augg
         5pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pZ7bO6pXxeYaOHh3umuOVAnE+OOJlkmKTF0VXeHFfUg=;
        fh=TSW6r4y2vMRttVzV9v3/Ah74snf6ROvQx1rYBg4XcG0=;
        b=bIZMQxE2YGb/gj/tcjJjuVe1Qw76oyJGVN5szkWHtNPAYwEK3W249p9W84ZY2P0W6R
         Czt5VLwGKFmmv3kKoaqr7E2l79M4GEHzmhHLuIPw6lDURMBmoMbk8QkWZ9SHzUGrBzrD
         ovG+3UkEJiqduGoBMoKuhUMQE4rTH2bgqxcpVNSmfWTnLe6HqhwsQ6KbeapIFMgFHA4c
         JLhSZFVo3Ra6gcpnNOHtjPrcaUKQj5fr5ZjcE0+UQGRp29MfbznyIkrNb0H9nlImlT4w
         ytqNW/uPMKe3/7YVcvv+UgqPK+Y2Z2wzuIG67E2xSsdqU52kIYtp1z7ytN0hFWmqb5Hf
         TN9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y95e7F9T;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d39b22sor42241825ad.5.2025.04.21.22.29.43
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y95e7F9T;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299783; x=1745904583; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ7bO6pXxeYaOHh3umuOVAnE+OOJlkmKTF0VXeHFfUg=;
        b=Y95e7F9Tz93yiuueA+bO9b4hKQbJjynZSFw2ntGKRPphxidCbk4TCDV6lacGk8p9SR
         cXj5bMKGPVNOB4CUa17AyvgO7DqZZUnsf0iioBRSuwruB5LCsiB27PNysTYlYyaHk7zf
         h5bY3Qm8rB2bjWbg3F1w+94G7DcKQx9eduuErrT/IZKDJJ0aC4X7J0Gxp6YkqodRATQV
         9pYwrzXaVefaTvCY1DsY4waM2cVJaRNe1b0NngdR5WM+dEu/0/0UAHvbzM1HCZMfU4TH
         nlSEX/8MzddCEsZeUuQ48yR+qGsQKE1iWasyuae84V0UvPRar3JaOg/2Akl9LEtDClZU
         Y6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299783; x=1745904583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ7bO6pXxeYaOHh3umuOVAnE+OOJlkmKTF0VXeHFfUg=;
        b=vDdpsWVgIm5q7SZkT089fyCI1OVSMUp2W/7JO4H9sVHjnEQo4riOLMLrGgWJ4d7Sb9
         UkRbWSkPfCSJWLvRNmRD5yu51QA9x6hl1XMWMIciOorO+9SKjnSvyhjUf9uEm1stLusW
         j7mNAhVl5DhgtC+D/4KhYVgh6bTnHiL9K20PYMfzMGCPIJHgFOgy2GNdsdf48g2PztpK
         MMfybWAIfBa69IPUCJetTymjWW6bmyW6APpj7BipgOTJ6o+LpQprOJ1HwP4TdaFkC0re
         h7wEDb/S7zk0cLAokmrKyieaNP7Oo3bCwC4Xr2YfYYmgFZfbblnEGBP0yOBj/DHh7IV7
         5bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV03lHrLlx4VeElQ9bcLEiyk0f20aUkrEzJYZZjspazx8ZkvoXBqbSBnNHddew2QWh0lLlWO8r6vu1JXs17@linaro.org, AJvYcCVIdhi+ZxApJXELx4bZTvI5iOSjGRi5QQQfSh0aaigY8AOz4xWOrSZqR59+D3R/MVxEafOE5i6B@linaro.org, AJvYcCVO9ydedvb3PUuSO4wIrZdNnbHly8BZj+1ZHGDrAV2UzFmzV5q4jZwUAJ/wcLRWroWcw8sZA879YIO5nDzfb1Ab4lw=@linaro.org, AJvYcCVokjxcvM4lVExPoEw+kw7FgneVAf3o62NFFNvKPDRxXT9KmWDqZEV/a/YqPACWVOwXqHyf2gavuYwjI+ityX5TLQ==@linaro.org
X-Gm-Message-State: AOJu0YzywpOHV+bKaolImoTiRY4MaxNHocFL72xloN+AlI/QCFso0GO5
	krMILwn50ME31slkeIRNI0w4qSQLpKqM1fVJqkw7KwwKOkfa1ePURBlRAOAp
X-Gm-Gg: ASbGnctr0MrRUBETP0sPca1uej9i5HE2DjBd13evVWB4fMxx77Yi4nzofmvIcQN8lUU
	p3sk2ArovgNAmf8DWrXUOwvHddwVfCeGSMZurOQbN9hOQdEWK0GV0eRlJ/jAGJP+OrOHwskB9Y9
	rFUcphs/zjDTU4TzUpuLYe/h4VB0CvBmlCw2/uESnKiUiRdJBfpqqnp1CSbdbF+et3GCuPaxQNs
	Qa1QVC3dB0UFM6Dhu9US5RueQnijiW77y9pjorQhr6aClZngzIboA+7JMp1bMLKRFHDCsKavKn5
	1Sl0C4uW9ExkYcDdD6GOgDHGWqWLsWO+2PLfvS39PYIBGpO/TFnVsnHAKvCPB8deowi4pg==
X-Google-Smtp-Source: AGHT+IEZF5/R+WzWuaEUpNlwBrdt21FqufDMrrlmvN07ViDg/j4NoEnHz6mNB7gGUv8QbgO9db2OMw==
X-Received: by 2002:a17:903:3d0c:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22c50cfa84fmr239090505ad.14.1745299782951;
        Mon, 21 Apr 2025 22:29:42 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:42 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 13/20] block: Fix type confict of the copy_file_range stub
Date: Tue, 22 Apr 2025 14:27:17 +0900
Message-Id: <ce34a721a5283fce854f417baf7b1c8f5c48c028.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tyWSmIdvmpcH

Emscripten doesn't provide copy_file_range implementation but it declares
this function in its headers. Meson correctly detects the missing
implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined in
file-posix.c causes a type conflict with the declaration from Emscripten
during compilation.

To fix this error, this commit updates the stub implementation in
file-posix.c to exactly match the declaration in Emscripten's headers. The
manpage also aligns with this signature.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 block/file-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Removed the Emscripten-specific stub of copy_file_range in
  stubs/emscripten.c. Instead, updated the type of the existing
  copy_file_range stub in block/file-posix.c to match the declaration in the
  Emscripten headers and avoid a compilation error.

diff --git a/block/file-posix.c b/block/file-posix.c
index 69257c0891..2758f31844 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2015,8 +2015,8 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
 }
 
 #ifndef HAVE_COPY_FILE_RANGE
-static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
-                             off_t *out_off, size_t len, unsigned int flags)
+ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
+                        off_t *out_off, size_t len, unsigned int flags)
 {
 #ifdef __NR_copy_file_range
     return syscall(__NR_copy_file_range, in_fd, in_off, out_fd,
-- 
2.25.1
