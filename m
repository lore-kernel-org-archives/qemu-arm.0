Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877436njc;
        Fri, 20 Jun 2025 06:07:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9Emj6EClDcVhujtY4jfhwjVJD+sei5G05UZVYsMDckmBshplXE8zYgSrFMXiS7/vn/ZGF+OlixRcWdA==@linaro.org
X-Received: by 2002:a05:600c:138e:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-453653b02c3mr31914615e9.10.1750424860277;
        Fri, 20 Jun 2025 06:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424860; cv=none;
        d=google.com; s=arc-20240605;
        b=BVjvWQpE/c+CcyW63Qy2BUTmPxVnPwzgICO02VInUulB7WxrX0dy2G7a1h3pW/Ha6Z
         ZtOvRboSFmOacxPNSrxjw/RYwqLV9j4VqX79hqW2bThrZe5DhujQoucRp4wB84eauch3
         DF5+aaA5vFgBLzP+0JQKyzHYsIovXU84O6f9tlc8khx8YOsTOJ4xJoOdvt1sHqNvN0G5
         UKUUiUn4D+Cn/EPGSFYZLNwAJNwqSM1kySPEYqIcUH42iXlMetyGZXdzV/vdPO5ttf4M
         SIywrA8rmMZ1BtIXab52NBg4BBW11H+CpywIKpvJxOgrBG4X4xW4FJI1WoYa5A7qMOiE
         Zd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XksfEnABhqse0vfJxYZJ+Lf0uyahV9aipIl1Sny7z0o=;
        fh=A4nDCY47loIKBPEzdjni2qQs+rz2BEJmIs/kJXjOaUU=;
        b=HshTELAjdVeMqRcGw4ueJJh0DrJVWBAeCI8nU/BkBIjJ/zTSnnE6IHC+4VA0IEjCvv
         IJZqvXYKerR5La7yWREYhVDwf+efcRa8fjGjJWH/hRmZfpS7nKaO3XEZhpOmIr1V+tam
         d/Hc4xfQtR39EdeH9KBU79ozoTzFCje9BYiV1mRAcMlTxMOk3YpGc5aDyrkpBSUYQy6Q
         stbJ5Ue13KXuFnpOy48MiLWSJD/uPhnoBgbiNeBtUcDzMktTG31khukGcB/F//agdmYq
         v8UnW0Gi82OnQ+HBcWVwHhD439HwsnB7+rVuWpE4pBxOWiG4QrVfmhTA1Nu64B4QABli
         Z6FQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMzijw5P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646de821sor6313545e9.5.2025.06.20.06.07.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMzijw5P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424860; x=1751029660; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XksfEnABhqse0vfJxYZJ+Lf0uyahV9aipIl1Sny7z0o=;
        b=DMzijw5PClsobMzETWksu7iEzAyWCrFz+Zi6fsHgqzV5W2p0eLxNsrCOa0HYNXkeRl
         qebr3QqMFZ6+re/2EV4jDpxgdKCVarF2p/kyxRmV5Y1KASCgh2pf8sKWnA5ki9E+PEfU
         Lumeb53YyotkPz6dqjfcpHquCezvTSBgJBoZXdB7w4wsGxjgZ9Iec9+HqQAEk02V1+3H
         MFdjEw6Qc6/NbxTDk+JURFm+n6vMVslhs2Dimh3O8kG3vDi+b9pmDqY28ZwKRdPPbHKS
         0DzBSP1v8p6JV1YAjrRGEJ9++DYSz6N6n0mspOos4xt5JCxEeM3nqDthjyVYurCWkibn
         +u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424860; x=1751029660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XksfEnABhqse0vfJxYZJ+Lf0uyahV9aipIl1Sny7z0o=;
        b=I+j2Nlb8JRi/hg/GRKqWA145tTiIqthyRfPd9qPsMmZQTmXfMcsMkKCy6ECgvCERlT
         jqTq9Y2dw7s/MvlganbWZix2MzEISHpRRHfQAgEgw1VRtZLQsdETYFpwC8+fPP3KuOoy
         nBjuUsLiSz33RGabkaq6h1qzGxFbEyS41KVSeCtQrdn4eehO1nPrgOsTmbXUjqB9NYVa
         WzXVzR4OpWKoTkX+d+krxwvLS3LGQocq3sggFM5a7oBqqJlSUlXuIjdXFSVDEK9OqaIE
         lW/yshvqX+54lWHkJ7g1goiukgf5Xc3hxgQ6rEzImfDd9Kmwp8UrkAGPlju15evQCgz2
         ALqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Vsir8r88lCMEZYMAywkFKpok1OehN85e6HfrqPRN+xSOs4hWAcUW0IGwQ9i/4LmLRMdLOM/T0HWXnw==@linaro.org
X-Gm-Message-State: AOJu0YyZpa9a8JnLkKcAXLdV5XcPER6aTg1XEsm0EwUP/9HWW0ObG2+7
	ndOnJfgIUVxEBVRbMqzLwsQ01SoYN1mOcS5vMMOw60EDcgV0igNKcTzvUz4S34Hkz2bjog==
X-Gm-Gg: ASbGncu2eljmbRI1jeA+5s8R2gdehAugYvW7JFBOIXlbS+RpUw/xLDoQkJRJGXnOQEq
	6tZFFcKp99x6DhPdC/bB3osq+UPoBrF0qhS4RESAEDFRH8VEQn9eBWmd+PoEZkVnxE0+VfxbhwO
	wP2CxVi3uWgQb4UO54vNm/vgN3tLtyYDRbHasFTe4sxbGh4nDWNKjXwrZiVns2CvzqP2t2KFvza
	1XxAENnr7kbK6B2iYAFgZ9paB12plduD33oG6tcOHCSVfzvxtxDRB6I7xBmtAVVsJ6kYhmELlJf
	TpaYZgyyqglpP7abGkSX+SuzcTHmlWJYL3fUQVOAIBA0qFkzh6WHpm9+jtOhwDvViNfwajadSZ0
	wJhFcgQexYbaAdz2dHBFKYmIpygwU64S5EEYk
X-Google-Smtp-Source: AGHT+IE/7BsLb9TONAHrydupa8DFXSIV1OrSggLSDyPpvWjke04D0dS/jXyuRBj9Ay/VLjM8ny9caw==
X-Received: by 2002:a05:600c:c103:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-45368787924mr6185275e9.19.1750424859628;
        Fri, 20 Jun 2025 06:07:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8edbsm58978705e9.24.2025.06.20.06.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 05/26] target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
Date: Fri, 20 Jun 2025 15:06:48 +0200
Message-ID: <20250620130709.31073-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ziDIxk6HF5w/

Keep bql_unlock() / bql_lock() close.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c1ed8b510db..ef76dcd28de 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1914,7 +1914,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     flush_cpu_state(cpu);
 
     bql_unlock();
-    assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
+    r = hv_vcpu_run(cpu->accel->fd);
+    bql_lock();
+    assert_hvf_ok(r);
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
@@ -1922,7 +1924,6 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint32_t ec = syn_get_ec(syndrome);
 
     ret = 0;
-    bql_lock();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
         /* This is the main one, handle below. */
-- 
2.49.0
