Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2117980nji;
        Mon, 15 Jul 2024 01:45:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHFGHYo3D+TBKfj5CJQfLafmNj1D9mBuks7josHrRXUsqXIzrDLxwKdwCgnNHKsB6xNL5UuI95o0xRVUOkLwrAkYTmtUea
X-Received: by 2002:a05:690c:e1f:b0:62c:f785:51ff with SMTP id 00721157ae682-658eec67a3fmr214941967b3.13.1721033130778;
        Mon, 15 Jul 2024 01:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033130; cv=none;
        d=google.com; s=arc-20160816;
        b=UNi7ynRqb2XixK5rl8OOjD1lhByQSf1ko7yv/H/CYZK3LlVB3ox8yrJeg0k6AO5YUM
         MKu9ooL3De+U2Ee8S/6AyeCRjiE4GD7R2i54pOoZQVdrLfguhzU0mZIsmMoLrfGLbkFe
         wIdqgUCc0jj6mJXVcxOH4NCu/U+Nvfw3uOPVx5c3anxETsrGuVGBSUx1oSlnav7HSLYv
         uEyjXZ9gp1aCdMIDyG10pLaMKWYvNgrfN6HZKK55pdQfMSuG3B0jTEL+zrkjdKC5Y42P
         VWMHByFd2X8vJhHSd2qilcLmRpKIjGulbewGjY5EaHER2AZkXk6HuwbsKoZKfd04N+PN
         ZF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=xKw3mGktA92OXzn4f9adqHYmUJCgi3sm+YL6zF4rMAc=;
        fh=4YLLB1TBFgCqiTomixGgY+uUZ0GdBNaPkyxMKGGOg70=;
        b=HjuBgyzQN4Hpzqgihh+P/70NpCZfbIqplCac71sYnpIdgZijw/RQ6hS2i/U/fOXmRE
         t44ur3lIUiqUJp/eq86498vt7LX31fMucRErSfW/p9cWLAP2t5skcgLaGixza/m8oyCw
         JdtppUEeiof/LyU5b0lB8Rma8g8VfneNpoxhshJVH3UbqlAtnKD0X+17EkQyIRdeeqAo
         MhnmUhUTBREp22t03dSLHMiN19//O2YEsM29XLUskKA2QHmoNtZ4x6EO6NPyhFWfibtC
         WX1ylbxS9HaVsQcFj3P2n0oKuSEVYFr5vZTzOYGiiWWhIVQEe8HwNtaUpGjQ44Qpf4eC
         RWig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OD7kbxJX;
       spf=pass (google.com: domain of 3qeguzggkc_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qeGUZggKC_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3qeGUZggKC_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-65fc270e71asor24520077b3.4.2024.07.15.01.45.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3qeguzggkc_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OD7kbxJX;
       spf=pass (google.com: domain of 3qeguzggkc_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qeGUZggKC_ouoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033130; x=1721637930; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKw3mGktA92OXzn4f9adqHYmUJCgi3sm+YL6zF4rMAc=;
        b=OD7kbxJXzvsLYjQ02HtXTmJXKL8/kQZNoJDK1omPzETyUONwA3eW7f7UHrLQMq1PcN
         cogvZR0n5i+wtbcDolY/XazQ6CJWvjpQcfobJ9maTyFmvK7UNQvaIavwx6HweOhehXRC
         3TZAxbrnPHVBH16QY/j5KvK01d+vcL2iiBgylpvcXDJbmVa3AoiPXQqN1CAsM/s506ED
         KdWdlRIXyXX2jut5ETy6BlP/jgfuax2Sb1jxtzQ4Eg3TaCNZ/aqQvpHgiDxM28aZ5v9h
         YoGeap5h0gMGVqNvCSsPV2/K27jljuQvAGoJn4P4HzmcZ1e8JtLvf/VCbnuf4dsihOCk
         6ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033130; x=1721637930;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xKw3mGktA92OXzn4f9adqHYmUJCgi3sm+YL6zF4rMAc=;
        b=QfQK7Gftc2kZ0Xe/3r718CxA2wKXSHx4Tc664ROrLm4Z2S7Z5pRQpUGQ3cnaZHE8Gm
         zW2w7s7eQh86rnBOT9PPRZocjV7SkYeQ4hfWk4Syie//csLnYm4+ufV8GRoABjyeVlBc
         lKf94qj2+QfpHZWRxedCAlwyH4EyaQ+1YdS6noZp5na4WkPTz7kd05CDcWSlQALmGsO6
         eOqTiUMFVzp4HFUkB4We8vdoKAcEGhR+kmg8FmhW0kG63jBxi+7Id/ByPQwrhcIVnFrD
         ZzYD80evQPMmcOabyUS0sTmmV8++wNvYR6ct4WF81yHtnegb+VbkUOHbFzjNfDdSm3ne
         Nhtg==
X-Forwarded-Encrypted: i=1; AJvYcCVtOSM2dXYZbd4qVcrO4KF/szWFg9grJhFSj2WcBMD9nIYElW1fBRMy0CMq6rWli6tEgrYOp/ieFOXZMBrX9WiEsaTkp2Uv
X-Gm-Message-State: AOJu0YyDDhQHC8zhKaphCYlwOZEdqWWBgjvbC0Lxb58lSKbE8/MKbaT1
	1RqkAi//ag1meIbFJKHRR8TKWFE/28WGmlU6FW0cBbDEKS42RF/FuGmW6PxCqNBaU4dnNS2Gt4X
	yDEezWf8hQQ==
X-Google-Smtp-Source: AGHT+IGO0KcFyjN1gRosAk+SCnqkSdSUonL59FPP5CWTEaYBqM6PQ0MfE0m95/y1oqm8vANJpUZqv2OIt8y87g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:114b:b0:e05:74ca:70ce with SMTP
 id 3f1490d57ef6-e0574ca77fbmr537739276.4.1721033129837; Mon, 15 Jul 2024
 01:45:29 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:01 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-2-smostafa@google.com>
Subject: [PATCH v5 01/18] hw/arm/smmu-common: Add missing size check for stage-1
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: A+Epa9+o7SU3

According to the SMMU architecture specification (ARM IHI 0070 F.b),
in =E2=80=9C3.4 Address sizes=E2=80=9D
    The address output from the translation causes a stage 1 Address Size
    fault if it exceeds the range of the effective IPA size for the given C=
D.

However, this check was missing.

There is already a similar check for stage-2 against effective PA.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 1ce706bf94..eb2356bc35 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -381,6 +381,16 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
             goto error;
         }
=20
+        /*
+         * The address output from the translation causes a stage 1 Addres=
s
+         * Size fault if it exceeds the range of the effective IPA size fo=
r
+         * the given CD.
+         */
+        if (gpa >=3D (1ULL << cfg->oas)) {
+            info->type =3D SMMU_PTW_ERR_ADDR_SIZE;
+            goto error;
+        }
+
         tlbe->entry.translated_addr =3D gpa;
         tlbe->entry.iova =3D iova & ~mask;
         tlbe->entry.addr_mask =3D mask;
--=20
2.45.2.993.g49e7a77208-goog
