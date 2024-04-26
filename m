Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636717ejb;
        Fri, 26 Apr 2024 12:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNUaSobmAx1lcaKM44gyZTrohKIgk/aicOdpMHjFbiaTm7hXWV9rkzFRCrbd1CSyC5dkFPV7GwbOt223hr3b0FCxrmv9e+
X-Received: by 2002:a17:906:4943:b0:a58:76b9:73bb with SMTP id f3-20020a170906494300b00a5876b973bbmr331773ejt.36.1714160582661;
        Fri, 26 Apr 2024 12:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160582; cv=none;
        d=google.com; s=arc-20160816;
        b=OLWfJH+6vMs4XQAlrFUi5RgvyvUaY65LycBlY6k/40rvZ94stRUmJLyhn8afdpaAUN
         mP0hC4IwlvdrsAiumCaFoTsv4D0PabDnDav626tldFGIAVFDS5iEH5LZkwFfAkxSLSSD
         TJ/TjyIO+gJ5L5WI5R2L0/BBLrfuuyABABzr3bxE27p2ii/qIcxbCWRCAmSBXBU37UjV
         7skYJ/13ulbCE66xkMpUTs937MN2uqr5bsa0Z6nhwbd4GstXe+buV4GfibJEfpfIqkxr
         i3gdspa7iJSyO7GiiiqUaxAw3L7vaKvikWx4nDSdhltT7nqdB2WsOD46EufiKpFVVN7A
         LtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/GRlD0UJ4FFPuLeyFAJhX+j56Axb9nXKO9LompOTbz0=;
        fh=VnlGRxLm1/SaMFZEx2JlnagaCQ5GkrYKEvu6tPjPdxE=;
        b=nbBqDgmGO55dotIGhi9M8/h1YkttMAABZKnv2CY0R8ZLgSgWLGu+jvvsv1Vwp68b0Q
         zHcwOFW+viiq018YB++VdsDLJF551Ptv3ZvlbejLP2Ms+gONJyxSaimeuPxSeTm3hVX4
         CgJTs29fuAoBxyWp7gMDcuqlTSBdn59/ZtzXJNlax+tNavp4Xi+cKeRtFmIxiZgXq9DP
         OegClo03LgtLdeQPE2GP1nwpjeSCs2R+7FuJb3joqvOdm7WU+3WkZoIfr6FzoXDm2d6e
         1Z+YCy0eyPz+AXZLgFf+Ic/wO1sUgAQ5gLe1Nx/5Jq1rNY9jXFFVu9HVpnUvWMVq0wjj
         ByJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBNiaWWY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gx22-20020a170906f1d600b00a587ccbf2b3sor3184693ejb.21.2024.04.26.12.43.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBNiaWWY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160582; x=1714765382; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GRlD0UJ4FFPuLeyFAJhX+j56Axb9nXKO9LompOTbz0=;
        b=bBNiaWWYBwwOZIW0/KCMP3Nn7grJbLDiRvlaHnB5b9tNUt+bVSEloVopSXhflS1bQS
         e0/t4GqaQxeMqpE4HahAcPcc8dr3qUGcpmqpdvZgtAY8rgkI1aJG2nVST3/prg0+Ui6P
         QdUX6hU2OwReprK1IUXwXKrW9Vr7aiK39Tqj7cFV2yGh60AojKXo0oLed5IVXFIR7xcZ
         f5lyjAqxi1v+bFjOsSKqUqzCJtKZbBx+RMapbaPDMlZyBfSJSlrjc+7nxlVkxcoeQHTy
         oCxto6KCcBPazhtAtv9cEGPmvQmIg/m7NybTQEiFmoEnE4wAtfTgYGzLojqkL3F2ZGuD
         dGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160582; x=1714765382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GRlD0UJ4FFPuLeyFAJhX+j56Axb9nXKO9LompOTbz0=;
        b=p1suJ+KCkrTZ1YmcxWBSgt87Yc4vJEAfPEy6zdb5fDjKVTCcNDaXMNn9XxLPX0UCS+
         i+s9io1BY3J6aZiXtbCTWrPbOTr5WtWt/kqbBDFsil5p4zyyvNtxXt1+KATc9V99P9FD
         TWh4Wp3LOraFm4TZiswMwd9q5eeT2JucafM0Q6C18ra4JxIJ/kdNNOgGIb4ciafLt+39
         wwDXzyFOvyTPGFv1CgF2r9W+HgSg+HE9ScekNMoxmvF2eo1MsPUWpUThlMRPQUUX0OgC
         rAG+v7vacVuy0X9m16gUL4Sr0veDZMyQRUA2ZU8idw8kBQwdgTf5s/4b7uAkP2ClLUo+
         FlQg==
X-Forwarded-Encrypted: i=1; AJvYcCXC1TR6MrdFAidUTRCZjhXCJKPO2aHb/nnyfRPALp7sN5b6EDGemSCsP+kU7e6bjsscqyWG94NoctOlI19vB8hvDpFciIiQ
X-Gm-Message-State: AOJu0YwmKNMX0/RQ9KTP5JopuysC2Byo253F1tq/Dul7NOtlZG4K2PIG
	BtKHZIZTPESeJnCGBXzSqUUqRaE1maGS2BabX/3QNU2mgZ+IdywMp6kdcGmp+HYvbg==
X-Google-Smtp-Source: AGHT+IG6A8FnBbnMBUpZM52sQlqiWMtOTwbyU0wTqUCvEyv+4YX+LfAkHA/i8kisOgzCXauqVx2SXg==
X-Received: by 2002:a17:906:17d7:b0:a55:664b:fa35 with SMTP id u23-20020a17090617d700b00a55664bfa35mr274955eje.6.1714160582240;
        Fri, 26 Apr 2024 12:43:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr. [176.184.11.147])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170906e95800b00a58a3b8589csm2615549ejb.21.2024.04.26.12.43.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Apr 2024 12:43:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/38] semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
Date: Fri, 26 Apr 2024 21:41:30 +0200
Message-ID: <20240426194200.43723-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RZA4gxSjA8BN

Nothing in guestfd.c requires "semihosting/uaccess.h" nor "qemu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-8-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/guestfd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 955c2efbd0..d3241434c5 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -12,10 +12,7 @@
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
-#ifdef CONFIG_USER_ONLY
-#include "qemu.h"
-#else
-#include "semihosting/uaccess.h"
+#ifndef CONFIG_USER_ONLY
 #include CONFIG_DEVICES
 #endif
 
-- 
2.41.0
