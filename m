Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136910njd;
        Mon, 21 Apr 2025 22:29:36 -0700 (PDT)
X-Received: by 2002:a17:903:2410:b0:224:3c9:19ae with SMTP id d9443c01a7336-22c53601521mr238493695ad.34.1745299776125;
        Mon, 21 Apr 2025 22:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299776; cv=none;
        d=google.com; s=arc-20240605;
        b=Chi8gouB46j2SXlmp7k2gdUGp9bu5pdO8wO6nMQYwCqRnAUjChDgQafaS8ht3LFebC
         hWO56kG2lRwA12V/L+gilbFjc/6Tf3JMKlP0afJhcU1z53/thMsMrCJRrcfpx8OGjike
         K36/FRGj/WJk/DVScl2Y2nPztdQVAVob+kswqM++Xg2TvXtBRiY0N8ghVbZKvTX7jd/o
         gvVPjMJRLFY2WldkO53qluEkCsWVJztEan8ZD4UTD4/fx5ankvu4AtX38xZxAr05/5Co
         CmeqPSuPIQjFFGgLtHJcXWbtL1YM6d9CtISdiY5End0oIupaW7dC45VC3UoXgu1qwdpZ
         xAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6gr7bhHNF0kj7hfwtuL868huK6XynZ7LXafxTGg/yBU=;
        fh=Y0WG3vE5veqpRCiG2qhHbJy4n5LA0N4dVlKS7E47S6A=;
        b=edwdPS5NuOwVpXNjJp1v8hYTeSWm+xs4gsQIP74+TsbV3dj3dr5ZhNEzvkijKWd3ke
         U+P5eb+RYN7XUNx/Tnm8eB/dKDG81CUmAnFl9FlqLbdJPIixjwt4v5i1rJu2z3P5kMLn
         il1OEQgFwh8sVgVSINt5DZGy+ROUEXw3tCJcmKbDl9Mc6nOpqr0UKvo7EP0VMSQ834V4
         JjJv26H9BlPLzfKvVF4RC4ks7mhAODorv8KUXJumFIJHalJvwfgZvS5LNrdbCVoSL9QA
         ihRpalf1GXLq2thIPJUZx5dDm/wS/oWysATjq8Q+Oe5x8Ts1t9wQGremwNEGzg0v8Eqm
         zQMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsUgzcSi;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50ceeb2esor54932335ad.10.2025.04.21.22.29.35
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsUgzcSi;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299775; x=1745904575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gr7bhHNF0kj7hfwtuL868huK6XynZ7LXafxTGg/yBU=;
        b=BsUgzcSi3YX8v5Nj1BOc87y3rUWkjWVn8RkS7BoAsDz5RU+LjG2iGQ3vKRKbV8Ov+f
         RluM9hBm2kyu0Sn+nPxW8+8DHRIRhMO7TxGe9EMf2+CwBhGLeOBaclAMKHU4zLzADnzl
         bl94rtm5J/YU9DDX341PH4EBoT3jRE28dVwOMipCFli9vzmbiMHR9fjLobbRnqnH74EO
         rDEzqwFfD16tn0ejRdxnU9ti69hTZPb+/+vI1qoBRO22qEfJceytN9vK5vZiieYfVAqp
         tnaiUxx8jyYluJceLD7SJ7j8BOE852AUZ6O/9PXbITrY7hAR3ghnOKnO8URiPfLbeOAU
         GpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299775; x=1745904575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gr7bhHNF0kj7hfwtuL868huK6XynZ7LXafxTGg/yBU=;
        b=R5FH6KlREzF/gEN5UfPLERFm5vLF/0kLkTuGzyNfYkPql/EuRwuXmDKLZnfhSs6cHb
         YOOs298jutxd2v0gtr6ZZEyxo/7wE+7fqc/wwriiTaPA3I3VZGtZdHtM1N7Z6dXAxMyx
         TcP0BjftcQSVdEO41oTKOLU3KpNL7t8tsvkW2E/6vKUqXulcFn0/hAWKJ9/cillrcqhT
         zqIpUYLDLz95ZpdlP4Xc2FYLvlwwcgDdYHpw1CknGNDl0ew1cEUUsvRE9GAOXAtKa4wm
         GgUb3995nMQSquTZdkQd8T80O2rpshaR8/w4LJteY2OcJQegLpIHCVTDWrasy2NF+Hdu
         ebrA==
X-Forwarded-Encrypted: i=1; AJvYcCUFmv0zhmnWjCb5HxINn8y3f1HRhoybmMsbdJ6/kSV7N7o79mt53WWaRXQn0VinjB4jej9jWT3p@linaro.org, AJvYcCUMybVxEPN5YFH0k9pFwlVPoIwbg6ltHfRfCbJL8dHuMHwVcm5q4uuEBjJLhw5s24vnSllqUiMweid/udbnarx/7cA=@linaro.org, AJvYcCVEV1GA8X5xWgQhOyZWGhWl3myqLvGBi9P6C3/e8AOaMPAJCettgvTfuGmMQTIFRElfHRgiyGYYRq6SfXZN@linaro.org, AJvYcCWCyL/g05FevozzMke3BfLAfzGMDKpE8oGSFjxWMRsXMOv5QY4y3wIks/PbKVK1DEW2Xbkbpz4xuR6x5SuGmZt1iw==@linaro.org
X-Gm-Message-State: AOJu0YxY+da6cBj3JYduwVKSQSC7lQJcsS7wt81nOxj0sTR+2+/u7h8B
	FSF3yn9tQa+GeTi4b+3xAobDqcMEYpe8NYkuaRWx9QH/baD4oNSL
X-Gm-Gg: ASbGnctHg5HI2dAc3RNpYwQ6LrQKBqTNyvyGT1satL2E00dQAw2PBE8upg3MXoryPQ2
	rztwcuNV8qzaY+OET3xECbWysdK0BLxbB2k75gO/Tw0SL47IYyzgJQnHfzjoLTNY3b03Sm241Uz
	Q3GLu4PLj6pv6HBMyph4MofpEQGzegLIxhCBJjprf1eZsyv+UE4XFpREugi24TyjiiLO3j13mt3
	FYw+HiLnGF679MCxAfDu07aOwTykrsRH6KMw/LU/Ws9DYaIvEpANluZ4+hF3llDNYwbHckeVTle
	cMyjS0tS+bhaU5CDb655TittdxsaYacmeLyfRubDwcrcbhrHsRDY2QOe7S0=
X-Google-Smtp-Source: AGHT+IEvwcDPz94D7S/A/DPpswvF0YESDUhtKqiVJ4FZXaM3bYPN5bTVckf7CP+ln3cnZtF4hLLr1Q==
X-Received: by 2002:a17:902:e808:b0:220:c34c:5760 with SMTP id d9443c01a7336-22c5361b398mr186304095ad.51.1745299775484;
        Mon, 21 Apr 2025 22:29:35 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:35 -0700 (PDT)
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
Subject: [PATCH v2 12/20] block: Add including of ioctl header for Emscripten build
Date: Tue, 22 Apr 2025 14:27:16 +0900
Message-Id: <1821e79d3977c3645aa79128b823748aa9a63800.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3dzV8crFq5gX

Including <sys/ioctl.h> is still required on Emscripten, just like on other
platforms, to make the ioctl function available.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 block/file-posix.c | 4 ++++
 1 file changed, 4 insertions(+)

V2:
- Split this from the previous 12th patch into a separate commit and revised
  the commit message to clarify the purpose of the patch.

diff --git a/block/file-posix.c b/block/file-posix.c
index 56d1972d15..69257c0891 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -110,6 +110,10 @@
 #include <sys/diskslice.h>
 #endif
 
+#ifdef EMSCRIPTEN
+#include <sys/ioctl.h>
+#endif
+
 /* OS X does not have O_DSYNC */
 #ifndef O_DSYNC
 #ifdef O_SYNC
-- 
2.25.1
