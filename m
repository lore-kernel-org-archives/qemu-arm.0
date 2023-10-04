Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2513753ejb;
        Wed, 4 Oct 2023 02:06:44 -0700 (PDT)
X-Received: by 2002:a5d:62c8:0:b0:31f:eb6a:c824 with SMTP id o8-20020a5d62c8000000b0031feb6ac824mr1360280wrv.10.1696410403799;
        Wed, 04 Oct 2023 02:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410403; cv=none;
        d=google.com; s=arc-20160816;
        b=DYCGdf0Jl6XGDEhJYduyDZsi9J1K7/neCo1ExIfLXVAu6zPoaDjHkVPsE+kLhDw2hu
         5T24PG3vOo1pgcAzptF8etpV/fXMdnRXED/dQT09SlkUBxICWXeA+yqyQNXUPq+/eDK6
         fUp6yfuSAXZaGRhYUj+qPYW2Wm4ieRZwbxpdXB2M0uYGYRGBC1Ekp1Ef7b9fKo2OpYrh
         +Jo9dnTe/NbpFzHsuDbRarnKYd0w+FbjEiC7dU9wtj89ZTXkz5466fxxksAXu+qZWfEI
         fI96Tse5JwJdk1pH5pWTRVWOrffz0Hu9amXf2l+x7VRLLbFwTCChqctRzGzFKYM7aSvu
         l3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KW0FErR7ELssAL8Eeq2tpDX3VFyHXdLlH6PwpSmbjt8=;
        fh=ZK/B1K2NhuADndGGf5+iCUhnFgT4badOJu1OfV9gBTs=;
        b=cRfQ9CT5YqccLRtvcnfFiwrpYlFxmZtyhBGryVXjLFEIh0IqILxDRaDCrbhDkLdXpP
         J+yGBupvCjyEaKaFBYfLMJOnTKb/KoKfxsrU7FjsnLStyHaioJJdareQl5zn3lki7xfy
         20YwKDA41euAZIDnn5avGhJ+iQA6YfKEuZ5WyXaWDs2Bv0Ib8n0U3zWlnvo1F2ypoyPG
         +kNWJM6lHhZ2dnj1jJmJzOtux3kIl2smgoWLVBWzcIpLpdbRIUsMP8u6jkI4XBwrw3bl
         Tpaio9TAznUB5pMB2YasiwjoioRWTdqsyyxxvjWg0la/tR7yzCo2J80y0hY8ll2YGhk6
         cMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqmSZXIP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3-20020adfd043000000b003231df0df94sor1291796wrh.2.2023.10.04.02.06.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 02:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqmSZXIP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696410403; x=1697015203; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW0FErR7ELssAL8Eeq2tpDX3VFyHXdLlH6PwpSmbjt8=;
        b=LqmSZXIP1DB+HkzCT7vYQ8PUiFVC+ZWOGGLfftobPp127iE16pua917LtABRYj6tnL
         HBrZTcgfqEIGgN4R68YPSClTid3eWQEIghYUDrtV5fG0hySyZG0ElZEzAoElbXqOiVri
         KLiza02u+GWwuzLhFGDjtg86MWQi+mqXycez2NdJAvMi3FTYUkaU+BKNQ5O0Kg4fAcK2
         vPNqkJZcwb5kPmmEPz+WTuYsVDpekFb9zLtUS0nDNgc6Hn4hX226sUXvyGaVsQ4wtMXb
         LV0oSO/TJ56pezb8TXCls5NAa281jD1LOrQXaD+OkJb6RuappvAf9Nm71DCdD00ZX1cV
         f0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410403; x=1697015203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KW0FErR7ELssAL8Eeq2tpDX3VFyHXdLlH6PwpSmbjt8=;
        b=O6uDNT8AKYzGUcyYmDQtOBy7m5HNHkuANw29HBoaQiWdZ2axdGDH37m9FuCIjO1A+9
         OOv34uw+yUCC2htvTgV4urMg0fZZh1RKvM02FajzJgF3pfYAcJKuhg/pR0MeOPzcYXUN
         U/AQUGv+OTvTufh3lJc/TG7iRtgBzdRiPkCzPZ1FpvHmjBuPB2FIZMC283URF3vvs3Dr
         twwzXN2ka5UtM/EQmENzLaZJevDaDv9bX90VwktyszIsHikyOyFhRg/qEa1lUdifc+vm
         TwMVciiNtBU3fPAqFyGxkHzvfqL1eG0aMW8qp34y4r7wzqN/1dI1YAH9/yoldeDde5Kv
         TcqA==
X-Gm-Message-State: AOJu0YylFs4n/S3XjPkplUvj7KhIU+dEZDqsQUwjPY0QpcURzJE/iGiH
	FKJoXjyTesZ+cQOOradZEzX5wA88
X-Google-Smtp-Source: AGHT+IG+f9X8fiDCU5jiCOaiu5Vl9cfEHkvdCPfGN4esmdsnG4SYojgqEzgjagAO0hCCXQprvL1b1Q==
X-Received: by 2002:adf:db09:0:b0:324:8839:cdf6 with SMTP id s9-20020adfdb09000000b003248839cdf6mr1551602wri.53.1696410403516;
        Wed, 04 Oct 2023 02:06:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id e6-20020adfef06000000b003197b85bad2sm3520638wro.79.2023.10.04.02.06.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Oct 2023 02:06:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 02/13] travis-ci: Correct invalid mentions of 'softmmu' by 'system'
Date: Wed,  4 Oct 2023 11:06:17 +0200
Message-ID: <20231004090629.37473-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WJ+Pu+fFN9YW

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .travis.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index b958eca5de..76859d48da 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -34,7 +34,7 @@ env:
     - BASE_CONFIG="--disable-docs --disable-tools"
     - TEST_BUILD_CMD=""
     - TEST_CMD="make check V=1"
-    # This is broadly a list of "mainline" softmmu targets which have support across the major distros
+    # This is broadly a list of "mainline" system targets which have support across the major distros
     - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
     - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
     - CCACHE_MAXSIZE=1G
@@ -197,7 +197,7 @@ jobs:
               $(exit $BUILD_RC);
           fi
 
-    - name: "[s390x] GCC (other-softmmu)"
+    - name: "[s390x] GCC (other-system)"
       arch: s390x
       dist: focal
       addons:
-- 
2.41.0
