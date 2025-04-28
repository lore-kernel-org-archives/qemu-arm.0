Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783821njd;
        Sun, 27 Apr 2025 23:41:23 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:224:1609:a747 with SMTP id d9443c01a7336-22dbf5f11ffmr155145755ad.31.1745822483240;
        Sun, 27 Apr 2025 23:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822483; cv=none;
        d=google.com; s=arc-20240605;
        b=UeB7Oj723lPzvv3EZ/h33wrIG4y/FNIx2XDCLqwg1kBmjI/u2iudS7m4F0eeLmoaPt
         B9IJe74NvIZgT7MEhspJgWeVw79byCnk/XcTldSbn9vjkHV5gRFrjTGKuNiWnynLG22f
         opSOP2G+KD/2UAVKq23ImWOvLRPUCiDuLvppW17giPnOHNsRiehL+Crc69Ev6Um9ULyV
         trnWwgLT4C+RCaMikTaPCq63mOKbJLefQA6Ste9IfS0/wdW5uwrcHVqnzXrblXuG16GW
         1zlSXDIoPNrVRvMnqgLoOBb7oO6H5bcEM88ntoks+XJ0waYPrDq2TwFAl6x4Bv+A/dV1
         WmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A+qJYGpC8zudJ6XJWHSpEsa6KVoxk0Yfz+c+aIsjTJ0=;
        fh=y9mBxolaVQOglBtqhEOewo+joet7hN/Ehdwlj29Hu6Q=;
        b=Ou7i+pOaVgfpwZtEe9xXg4SJ/Zsae0WUrvt5Sbt9+V0GVewI1lpdzZttrcITjeGQ5T
         iyxvIdYs1VzrmQShPV5pj8qirXoLdnA0BpKGURoRi6370ucDMcWlmQbURPRLipsBY0o9
         rmR2Ny+UMamxlkoAWhW1WlIjNYFQGNghBtUV3PhToTO/PGraqLfk0qPtt8YpS+9/+eai
         Be5QFyLtwpjoPHRz+xFTouvy3F/cmfkiUTeQo6ZhWLK5PNeUhS16KZEwtrt0yNYF7e4V
         0ciCJxTsh/hhuknYnbzgUra6nvmX5+lBUz2+tgHSXuvHZpx1Ng7PV8sxYpZvSU85oZkB
         V9fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="iYLM/lEG";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db52098a7sor1468075ad.15.2025.04.27.23.41.23
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="iYLM/lEG";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822483; x=1746427283; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+qJYGpC8zudJ6XJWHSpEsa6KVoxk0Yfz+c+aIsjTJ0=;
        b=iYLM/lEGgMp7c6k/t9U2TuDyQf5L4M8Awl8yyBO07Z53+4EtOH9E5qW91hhRifUoOn
         FQGWOC/niOL4xQhvVgII0gX2HdyPF2BLVrtqYecexsz0Ui4/tzmExiwtHfh25EQLPbhs
         zxUIs9Kl2KebqYhR4OsA60vXvGeLTrK19SNBa1RI0xNi8kBUS2hvF0LOhmNr5FuaabXM
         9IvpvCQ2pVF9j8G4RpAUDlRafH+f1Oa57qhZbFNVVm4seEuebf5T1Odg0e1dOf1+Hecf
         W9qLqiOGBMDa+VST8pcyrYsXVsvVzGB/9nzCxvx5AlTIvZUaapNdIx/nlEbrXWu3eqZ6
         nXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822483; x=1746427283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+qJYGpC8zudJ6XJWHSpEsa6KVoxk0Yfz+c+aIsjTJ0=;
        b=TzNZ2yyis4bBE2q45C4ZOBGyEkEtOEjlSSnp1KhREPMMLIzc4mdTvXGqCzowbklv0b
         T6JoVwxGzNLbGJboYD7XIhjM+AUw0GJ4UgRk5xUatwfa4PPlBsy/rvJPB4QaPUHAbmd/
         waCIR1zirIEFao6aeXaKsH8qtOmo2dqEvzMTu8k5l0G2T0VathCQHUMfChXEV9FkUzdX
         wv1+Bz9RGMFjRxS3ggK6+NldwSWzNNgLoQtGTlza4cKhTHqmn2D0APkEw+dIIb0NuGod
         P188si+KBwzRVbp16khjE8O+a3J6nOEZh7ArQ0DgJBLA0VSKfDsg9riCC/LlMBdzR4cH
         Njvw==
X-Forwarded-Encrypted: i=1; AJvYcCUkFJkNGHKjb9l/PCDQpl3rnHD0QAGBIrRcbvWhJMEfNt2FhAFQXGgszuvfbZ8RMSJWoh85xrjsCd7HJVlKTm9kUQ==@linaro.org, AJvYcCUpY3uOt1oZ8poEVqP1/iKFO29PFkrRtfapQmJryB+tpZ3OTrxxqwy/yFCCsAyxZ6TaLYnQXLMW@linaro.org, AJvYcCWJYo96Ky6p6Pwn9CqTq7P6MizoDyEMQez4fj5mP6Ko97+sjRbNFbehPbfvNSfiee4lQYMbs3/ZsVZkLMvdoj8NNlU=@linaro.org, AJvYcCWpuct+TR2IxWWbSZvPr7mePwUs9947gnjF0c/ojXHz37xqE0Kp1m3QjkIAPGj0OeKJNkkfMbAU+KiDY2iG@linaro.org
X-Gm-Message-State: AOJu0YxVeD6Thu0tUzVWGEWHdGwZaHs514Pv98slnZzLGzRzoI1K9Sgy
	c5jm/okAJmDl1FrGO7IUwuKV8oM5FjEKzKVaxC2TXc/Rat0Bf4ri
X-Gm-Gg: ASbGncsp9Tc4OghwqyawIWOonR6GD+aeMoKBTXsRy+dgb7TfZxQuBeSCNe6PChC7iDx
	VTsU/ufz5/YvswmYKCF5ik1vj7tF/+g+gCNaHuCdHQrAPqvwkzUe7aCcC4qff1jT45VxMASwCNs
	miUywlXTGFmzaq63GLBxP93SGXEP55T4yRmbdt+z2Rlxrd+to45omzgD6Di+v/ci4ipTwsTmtbu
	UYLXqffhIIL8sPAkZ+26Q++JOcoIF1N8o4eBusZL2Vt4ekd6o3WgrXWWAiqnV8eoYDkIcSmec7k
	fkkrN30RDbrdOxFeJy3dJUJqP5geguYN/eXoxg==
X-Google-Smtp-Source: AGHT+IHO3f+qZc9Iv97lxl2T4n0xLw+LFAlqa4f7UljrI/mIPNgu9dL4YuCAFvRtzFV72lSX8lpLmw==
X-Received: by 2002:a17:903:94c:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-22dbf62335emr154850705ad.42.1745822482596;
        Sun, 27 Apr 2025 23:41:22 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:21 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
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
Subject: [PATCH v3 13/20] block: Fix type confict of the copy_file_range stub
Date: Mon, 28 Apr 2025 15:39:02 +0900
Message-ID: <938d2beba15d4bd496a600ee401995fbaa385c62.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +Es6i1frrjjM

Emscripten doesn't provide copy_file_range implementation but it declares
this function in its headers. Meson correctly detects the missing
implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined in
file-posix.c causes a type conflict with the declaration from Emscripten
during compilation.

To fix this error, this commit updates the stub implementation in
file-posix.c to exactly match the declaration in Emscripten's headers. The
manpage also aligns with this signature.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
2.43.0
