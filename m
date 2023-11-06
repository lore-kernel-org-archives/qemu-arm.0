Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2675913eja;
        Mon, 6 Nov 2023 03:04:00 -0800 (PST)
X-Received: by 2002:ac2:5618:0:b0:506:93a0:777a with SMTP id v24-20020ac25618000000b0050693a0777amr19593547lfd.2.1699268640755;
        Mon, 06 Nov 2023 03:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268640; cv=none;
        d=google.com; s=arc-20160816;
        b=ia1iQ2DjvF0y3KHe82kpWjUpO7F8NJ/foXLmO9CVXm7h9W5vQmYElm4fUcja5GIhcr
         rqlVawjHiORLLNSVAaj29nBltZi6U/uZhv1szY9tKFfdyNh8ABznLP9z/RN18b5R+6Hz
         oLpfgI2uiod0ORI1Gjr9e24vi4hbS94OWhCJZxJBS1PKvWnSLwj8xDV9uK1tUqeEUp0N
         JpKnHDQLwyR517v1rEIYtKWy91yxGMcEWuiJBA1bYEyDYOxjbPElrM9H8Hdcdu7FK6uT
         HGxJxxhkCqyqse6mw35HIAfEdx9KrIQXeUyKADCAPKDmi5exwh6jKKe9SKozV/2uVjoK
         GFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OPtEnXMJWXTavrW+hTGrjLz6IdGpJzROhuSvymabGIo=;
        fh=Jo/ucEdKrq0dSRmZHiojvQ6EZQCjhpZSt5vPHyvMZxA=;
        b=dx+s66qBQdTMDFijXLGGypwe34cybk2uN+zM5ePSpJv1rpZbHtYJ5yxCP8GdAOF2EG
         H0PIPE3em1u7VsECSq9H1AS2f+mYgh2pi/GkGPEjRzdRYYhDZfD21STj6kZwFUj/jbef
         c0uTUIejAfOzWs+LaALDIsdCNlZCCZuQ+e0cjcmROyplbqKJ6h4xtT8Mv+UY3a/9xTv0
         U1iBvfSdh8TW8VnTCmKcZP1v+QLWrQWoz+LzT3ZsLnWkhD+aODkITtlBTauO7Bo6lDrU
         HOTUyf4SCE/K15Vmf5W52aC9ExhACAqH2uSw8tyMnZ35+exHPGK3ENycncOjddgpTVr1
         WtBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohl6kMi1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r9-20020a19ac49000000b0050949a1edbesor1766379lfc.30.2023.11.06.03.04.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Nov 2023 03:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohl6kMi1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268640; x=1699873440; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPtEnXMJWXTavrW+hTGrjLz6IdGpJzROhuSvymabGIo=;
        b=ohl6kMi1RxA32fMpU1QgXSpu+ek2yfp1/YCdIf/j9Wz1jBn7sx2KenmHXzozDFjT8u
         8ScuY7QFfkbCr8/P81iZwaGDemESX3DE7xFRsyr7Logknm4khxOsfDX6cSkVCf52QiiI
         Uck8a13PH2dNj5WDEwRdQk9AGQbkC6W+fNXzfailIsrh8ya9mZTsielw6DJ9OAYiA7aY
         lY+TQYHhAkKcRY7Qo9mVEvd1FK5Cq9UnTmea2zt/lByAUeliGqS3mmJTBfgejSw0ma+L
         VwMHAwlpMWBtL6DCvk2AT3OBd65saUeMIyrK9H4o7GPRVRaU6PunEfdng/OC758HFsiu
         j9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268640; x=1699873440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPtEnXMJWXTavrW+hTGrjLz6IdGpJzROhuSvymabGIo=;
        b=P/UA/HdDwzjFYKD5m848ynjKFvGHcsU9J55ozNhEElzCxPfrH4QaXaGt2r4yQe8taR
         iSGsJPJXA71rKifZrikJFMd48P7L9I5//7l9za2Es7sG/kEcNS6bjhg8cvp7iMMe3z/k
         Slq9Ki16AhD1ADz8Len9WaoakGxaO1BavrilOebvweE+YU8djubv8KUjFMeESfky0Xbi
         t8/bZy9o9DqoKRk7j1+IbVtsCxr32yG5GyZ/Ng/y5G3OSUwde9hrP9v+r67U6HKSGial
         W2o6C4xwKUPDVK1lS7eNMHLUc6neHVyBuEClZOmJWnXzVcqHlI2V5nFJV1xXQ8XDDo2+
         0NcQ==
X-Gm-Message-State: AOJu0YyH+9m9wWcRNnYHQctrNIP9FeqOHMiJgj/mr8YjOdsNNTi6zpSJ
	cp9SRqD1BDzws7Fep85UOAqCFho+
X-Google-Smtp-Source: AGHT+IHnmaFN+GKLxd2N49xPwJp/PkOfW8YFcpTs0zHKDnkUPvcBfxvj2jLWyUiBIPgGTifMjl5zjg==
X-Received: by 2002:a05:6512:1282:b0:505:6ede:20a9 with SMTP id u2-20020a056512128200b005056ede20a9mr26978590lfs.65.1699268640437;
        Mon, 06 Nov 2023 03:04:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b0032fdcbfb093sm19447wro.81.2023.11.06.03.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:04:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/60] tests/vm/ubuntu.aarch64: Correct comment about TCG specific delay
Date: Mon,  6 Nov 2023 12:02:35 +0100
Message-ID: <20231106110336.358-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FM+o6V9CYaJH

Wether we use a software MMU or not to set the SSH timeout
isn't really relevant. What we want to know is if we use
a hardware or software accelerator (TCG).
Replace the 'softmmu' mention by 'TCG'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231002145104.52193-2-philmd@linaro.org>
---
 tests/vm/ubuntu.aarch64 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index 666947393b..eeda281f87 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -25,7 +25,7 @@ DEFAULT_CONFIG = {
                      "apt-get install -y libfdt-dev pkg-config language-pack-en ninja-build",
     # We increase beyond the default time since during boot
     # it can take some time (many seconds) to log into the VM
-    # especially using softmmu.
+    # especially using TCG.
     'ssh_timeout'  : 60,
 }
 
-- 
2.41.0
