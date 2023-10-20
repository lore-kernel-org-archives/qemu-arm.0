Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360335ejb;
        Fri, 20 Oct 2023 09:37:29 -0700 (PDT)
X-Received: by 2002:a17:907:60d5:b0:9ae:7502:7d30 with SMTP id hv21-20020a17090760d500b009ae75027d30mr1742572ejc.57.1697819849018;
        Fri, 20 Oct 2023 09:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819849; cv=none;
        d=google.com; s=arc-20160816;
        b=T9rnLEbWZD1pCo1m0EZeAtJrRmHxNNk4r/jRbICj0asMIl+axJOXaK6JSZjUX5etxe
         dMry0yTbNLz38OPhQ/2etPKiD8zt+G0R1cZh+SZCUJjwC8GKXKLlQ3GixgW/DAR8vZc6
         0yCunz196MLt8PyOvNDTWF/MHE+v/uiP379zHcE/8iKf/YE4Rcgwz7ZYk9bMRtr5bJQ5
         AEhWumNyEW5FLYXG3GWecf4N9Enx5ImvT56N0CE3whkIyxP6/7bL+9inGGzPcsgcOogz
         k5NVeRRFdOzmFnR53G/TMQEmt007TSJ2YTUCTscL27+Pgq+WUILfxT7XBS1oO/f/HyNo
         amKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TUBi9PwmyHFRdVnHd5x4eIWhteYAhCTGnXhaAjecfzc=;
        fh=F3caX22uVarkApB8NfNOL2H80XtKskTuXURRNmjMW68=;
        b=ZMvrpf4f59Su3UbTFvEQXVzYQHB/Hygoi3s/BuZ5T6UPsPFGjkgs6q25oo/P77kScC
         +3LB44So586iAqFJvB7C9vcMDL63v0UjSe1uuxKkl5PBdDDqagESpbnV8JVy6yTXl3Vs
         4a6sgneRbrBX36sv3d4i8WzixsMZ9Xu/O6zEAuyQiiTUEHcw9Ii0Ud/0+X4idXUhVPzG
         PDeVK3f1hMDA6vFGd0g4P6TqZnK6nNc6ZltlePT3b4Cbx7hUvdB1oba9/n1JOnGOWQwH
         TFTGIVAAhHfo9siFgzBsp79c5uoqYRlXc9r4p1w6xZpR+endE0YX6BVshZ6GxKWvlsO0
         v8ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3WSu79R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy22-20020a170907763600b009be71abfb6dsor688113ejc.12.2023.10.20.09.37.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3WSu79R;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819848; x=1698424648; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUBi9PwmyHFRdVnHd5x4eIWhteYAhCTGnXhaAjecfzc=;
        b=A3WSu79RF4AxF1utlAG5bA9yxq96mDzVcmiJbhoZiZkp8mCOTOZPcP44RA9KwjrcNn
         ElG5DRYVf0d2B+UpLG056RScjvGx8ik0Ym4pA1NIRloxywY6UN+nWygNaiupEEPWMGZv
         vPz1DjLW//ylFWx8VTWU7Gk61Mchankv2M1LI1IABrjNtpzRrnv0dYnFlg8dZ02KmFs9
         MOQ63LLRM2ippMjjFFVm6yXmtSXaRYjeOT1ugl0MOdjxmWX+AR5qzVbyaB/8vvQp4Dtc
         D4RWJCtNz1dVM962LVN0QB+eBy+5cVPeQMBL3yJIII2NdwWoyn/lpEKvDSBW4mkZbeeX
         +ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819848; x=1698424648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUBi9PwmyHFRdVnHd5x4eIWhteYAhCTGnXhaAjecfzc=;
        b=KuI93xqDoNZqhxInhUJOuWsg6ongmFHEdUKsAOKFPpKgt9/t8Qdj6TtneP/MJpswwe
         4T88qGqyXGw7JbDY7SxHwvwhy35KljTdjo/Cogas4TGiDWHNWj3cXwIZHrMrfZeEWGHr
         N83pyl/R8VQw7d3PTIldpW2g+YiTMzqfYUHSW2WZy8DYr03hb07xtpxJF194QfNIP1oP
         Ei9WInYLaWFk1l+ZGXF0cth/410O4daEvVPH4pCBKIYkaI+j3vHBC0NndK+ppmSpIBWE
         C7I0yLIYEYDSAT3mhu2FvAMD2HnjI2OlFbHklYgEXad2rysc84QMwnFS7nu8zhu8vSVe
         4StQ==
X-Gm-Message-State: AOJu0YxSlqo7iEcKvGmb05Ix5XILnqfSGGZsmcfVlKDwu58X/g4C6ALs
	j/aEc5kKggTjIBZ3vsfEVuf+ORua
X-Google-Smtp-Source: AGHT+IHly4QZub59Ll2I4YbndNTZvqVJdsar+JhXYawd1k7qkul5/m3dgvxkbGUtuq6oLEHMDGA2sg==
X-Received: by 2002:a17:907:2d92:b0:9c3:cd12:1929 with SMTP id gt18-20020a1709072d9200b009c3cd121929mr1719344ejc.60.1697819848740;
        Fri, 20 Oct 2023 09:37:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090607c200b009c6a4a5ac80sm1774732ejc.169.2023.10.20.09.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 05/19] cpus: Filter for target specific CPU (mips)
Date: Fri, 20 Oct 2023 18:36:27 +0200
Message-ID: <20231020163643.86105-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fBlcBkvQ58oV

Enforce qemu_get_cpu() to return MIPS CPUs in MIPS specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_MIPS_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/sysemu/cp0_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index fcaba37c40..af0cd60829 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -126,7 +126,7 @@ static CPUMIPSState *mips_cpu_map_tc(CPUMIPSState *env, int *tc)
     cs = env_cpu(env);
     vpe_idx = tc_idx / cs->nr_threads;
     *tc = tc_idx % cs->nr_threads;
-    other_cs = qemu_get_cpu(vpe_idx, NULL);
+    other_cs = qemu_get_cpu(vpe_idx, TYPE_MIPS_CPU);
     if (other_cs == NULL) {
         return env;
     }
-- 
2.41.0
