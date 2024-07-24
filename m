Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360902njc;
        Wed, 24 Jul 2024 15:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCph6BhEGGWA/nvrRW0/8iPhaDtkX7E7uACnPG6pkKK6a7QGr3BCvxwAzmT5F+N5NaWol0vRl/EXuNO0ACTZPwlsf5PJK0
X-Google-Smtp-Source: AGHT+IGSFjoo4hhkcuxndSXf77GrNE6/+QychstBlc3/Kib1pUh18ZHe1VuITKeDpHz9mf4x6ruy
X-Received: by 2002:a05:6808:f16:b0:3d9:dc70:1119 with SMTP id 5614622812f47-3db11041c33mr1062814b6e.46.1721858873232;
        Wed, 24 Jul 2024 15:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858873; cv=none;
        d=google.com; s=arc-20160816;
        b=mcL63AgpTxU3e1G7EDb6fE+fRRfzoybJvg7wVJ2UV4GQo1TwqvOuxU6GQiQFBAAvQw
         NSvg+oW3dJ3g9z3d5KFjEm/dGxFv15JGq2twOmNcaSi0hgU0vSRgksS0/NChN5DTWvtw
         UlXEAwk4jQArYhzzjggYRWmMpgQhSJcMs/aFpR8t6y4PPJwSVJWck+UXNq2q8ZesLPis
         JbDkzk4ng/LmZ0FQ3wekz+Jw6YxadQnW8VBKnbdM5LmvoZ5YiHf4cGMqPfKKJqBX1pzC
         PtMyLmNUfj1hMsqEQWXnIagAy9vQHfJlRv25orCQ0PxWqlvoNs4H4Fo51D6CDjTm2VgT
         crBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
        fh=yyYZuL223+Vv0ZhsVZLfOumTvg5lZxdjmI1YeubsR6o=;
        b=NiSdKfW0TIZ4kLqESefbmHIymKzPhld+vaduhbpr0o7i7zE2acwSltjEnX7xZVZJ4y
         0nRW2wg24MT2nwENK1SV/ioU77m4HM4cDwnrFeCtHY5fvG4UfLxqQh+1/pZzOaSln7NH
         yueI3qv9MJdCgKjfTwkcK1c8LdXkBiMrM2iAiBTfuf5KO/KgW3+C01wnW5qWbSVD3WGA
         O24TogZwineTsHuqaaSLyAQwDhZh4grNfRO3RsiWnSqSoDgNteFvVbGfKcFaE5HFpak4
         CiE5LVprj5Pjm8ZsGGyEGb68RHMWva01L8V8YMMXrJVJxsi0kEf5RWYRJh2e0PVBZik1
         7hlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="1FdLU/J3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fd2fcsi1047041cf.230.2024.07.24.15.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="1FdLU/J3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sWk8B-0001Go-4g; Wed, 24 Jul 2024 18:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk81-0000dl-C8
 for qemu-devel@nongnu.org; Wed, 24 Jul 2024 18:06:34 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7x-0006cj-Vv
 for qemu-devel@nongnu.org; Wed, 24 Jul 2024 18:06:31 -0400
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-819c1f53617so11155539f.2
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2024 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858788; x=1722463588;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
 b=1FdLU/J38OAIL/tfOChYrJnC2Oks3YNRUHOHMZV0fpqmLDk5/i/zYvOOKlKJbdKEIB
 anAF+Ri5x2e7wyH6WSerykYLFL9YxC9iaPP4I4OsNWSYPSkK3OT0uyHJDOGlYrsIBILs
 rprkol1OmiPU/KycdkuRCEBxo/UZwIwqf22oeffF0xJlgtP5QXJZ0wBEnilFmC4hw849
 PkqKegtRbwSO87QJ6Yn+S+7iIEFcARUPJm80GLnLT421cUKoGtFUOZNzu1ihJemYGW58
 J4FhgOBUr+R/U9cRhRRTBPn5EQGsLohLcsNnLbCnx4pSQitswdAXEGss4mQFXez9H8V2
 dACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858788; x=1722463588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
 b=rd3B3+35Ufuxyb5A2rf4tkiSCdpvS/PucsMfhYU2M/GxnROxFk5bqQmYLsedtOVAs2
 gj1M8nE6iHRd9svgtI9L2t9bR0E8mrhxErqvMeG3kXNFkIfCPIDPE6JFfUtmLICLC2x3
 /WXtsRpgMQ1FaV+eg/vbzitBhwK/nbenvSP5Jq1jS9tgM8xG1yg2anUB5elf//U7blbM
 l9dkOxu9HccuJF3NG2NeMwHFPJx6nKTK8YgUt1SjRn1DVVTEHE2NSEhPyZh0Dj3l8qqD
 zC+Gxo2wuXmjgjzJKKYnCQxe+kwldmjH3REHy3jiZ5o54kn+aDfz7vMbZ9ak7RL8ajxS
 vyMw==
X-Gm-Message-State: AOJu0YySUTw2K6gy5cyFZefcKujtUzhN7iKkxbTxZTwyo3npYjbxe58+
 R6s9drFpo4qgsGdH4EZc/y/CPKhfQzMclnCTPqKAMG21iU7aIJbKKes0mkgEhDrD3NMamnNdLai
 AzzA=
X-Received: by 2002:a05:6602:2ccf:b0:806:f495:3b34 with SMTP id
 ca18e2360f4ac-81f7bcf7d6cmr139694139f.2.1721858788497; 
 Wed, 24 Jul 2024 15:06:28 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/15] bsd-user: Hard wire aarch64 to be 4k pages only
Date: Wed, 24 Jul 2024 16:04:43 -0600
Message-ID: <20240724220449.10398-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d8OTSpd8f5OF

Only support 4k pages for aarch64 binaries. The variable page size stuff
isn't working just yet, so put in this lessor-of-evils kludge until that
is complete.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 2d5f3aa312c..fa6cae0e3aa 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -21,9 +21,13 @@
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
 #  define TARGET_TAGGED_ADDRESSES
+# ifdef __FreeBSD__
+#  define TARGET_PAGE_BITS 12
+# else
 /* Allow user-only to vary page size from 4k */
 #  define TARGET_PAGE_BITS_VARY
 #  define TARGET_PAGE_BITS_MIN  12
+# endif
 # else
 #  define TARGET_PAGE_BITS 12
 # endif
-- 
2.45.1

