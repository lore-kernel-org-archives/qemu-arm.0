Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2763989ejb;
        Tue, 28 Mar 2023 09:02:07 -0700 (PDT)
X-Received: by 2002:a7b:c851:0:b0:3ed:c468:ab11 with SMTP id c17-20020a7bc851000000b003edc468ab11mr12233841wml.28.1680019327649;
        Tue, 28 Mar 2023 09:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680019327; cv=none;
        d=google.com; s=arc-20160816;
        b=hP9BwrsAs9NrrdQoOu+KimW5lXhjXrD7svraUQ5+cxDuXRDeS7jFC3+qsbIHsehEkZ
         NlJTkHwnCb2H4oCmnRyXKVvVm0cz4EdVpxrjV1JmM42IICqZb5TIVDmE0rAYNf/vX5FK
         jKoTd28hHHUbSdiSCCbYH6wrtsaO+wSDseQDnQH0APVAedzAvE28PTlPUdlzcdoMPiS9
         s/BwqBuxxvqnUcjEouHSCnNXEtDVNRcCg1fWNcgxuivr/4si2hMIavk+5J5X3P2yDSa8
         VOkFAdJZ3DgAO10KMhCWeBsuLg37KEaF00Z9hjEgmWKaCHiSjnsQRCT9PZusMA1Dk13H
         EzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=NmsSjup+xEQ0gc2TIeG2hC6j/mKEA8p4JNIyDCKCDnk=;
        b=ji/MItP28qtxDmfW2c3pnp61jZWxUnEtP566UpFqOCvtKxEVohka/e6c/pajvTwV7i
         tBp+u2CPnnS4pADCA92PpNg8mXzy/FLI3FP80wrsuQEz2AFlY4AD2ganAHG1TkyA15r8
         co4wMb3ZIiP2pRpwsmKHtOeX3zyA9XXE51Oztq9YrnSi1VXIbD3hNGwpipjLgD4fkiDb
         AIsNRhTmNMluj9uqdyW9gpshPnlAUPpX+imfbe8ddZUJdPHMSKD2vlTDcGXfvBRARC7N
         0/kBC0mYJy4UX/ylXsnxliq+MaP9T+FMCK/APLzv+vYFJg3pQ+nZeQfQRH08wiBnf3gu
         TZeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXS+Ym0G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a05600c22c600b003e772b077c5sor2742546wmg.43.2023.03.28.09.02.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 09:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXS+Ym0G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680019327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmsSjup+xEQ0gc2TIeG2hC6j/mKEA8p4JNIyDCKCDnk=;
        b=TXS+Ym0GCybLQ+ER+7Oa64F9rrGVRrgJJHHwtCwuS35WZ4qfoTxmWr9K11Xw/xLIvC
         HyxDht7nCxqWeRQn1c1jnzfl4FIZs5Ue0uZY5GHM0kvyX4ai9P/BjvtiQVoHf+gEuaS+
         vffYGdeuaiGR7ecdBjMu0x0rXTwgv3MukciKmf7Ne52JOIHM8mNxZIDRZ7Gh8ZYeQcWO
         lzeM6dSuSYR1E02pRPkzet5emj1HYJk5xqrlMEhfihx2P1itD0KWD1HlqqDIeVUoMkhE
         pOhST29TgROk1lCDEy6wQ5b9G2A5T/uG2wGWxO/ZDPuPfSBsc7NugKZoE1BAtT8x9K/s
         IXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmsSjup+xEQ0gc2TIeG2hC6j/mKEA8p4JNIyDCKCDnk=;
        b=K2qn4N4YB0oypRKHML5PBXwX23pHIgrh+Ex05yrJ749vx4NmbvpSQ10vXICyJZVOiV
         FJi3RXijTCjutF7k2W8hSifoWJ6bR6wZJYYUdtFKA0Sa9d2Xj5SFJXceH19D2Kir1enw
         a4z4IIwr+FYN2rnfI1tK88o2tISUVNy4yfJaGPHPAO1OEl2nuwmk/Ch+Td3V22OaMIka
         BRvEzv/GIYsqC7/qtAhXfmjG9ukhLFaDd6Cdf0/MpXOphbG1dmhAvUnQx9Ffhql4ek4b
         vviTvN1508PKPKQSlWuxEcJIyUFNVAAx+FsXJM5zNVxTpmvpatRmXabWmISzciK9fv+f
         Xm+w==
X-Gm-Message-State: AO0yUKVi/0oxejjKVL02S9gOfjeFiqBcLpLGKztJSSryDl21JpsnXBra
	J9V1IcW5FacEaNArFV2EVNp1SHKo
X-Google-Smtp-Source: AK7set9QdPz+EVC4C8quH18Yt0Nyoa2yv+ZsJ7j72om3axKiVorYuqs2XM+85Et9x6gjQRM3bWSGKA==
X-Received: by 2002:a7b:ce08:0:b0:3ee:da1:135f with SMTP id m8-20020a7bce08000000b003ee0da1135fmr12778012wmc.7.1680019327311;
        Tue, 28 Mar 2023 09:02:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm2937626wmb.1.2023.03.28.09.02.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 09:02:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/3] softmmu: Restore use of CPU watchpoint for non-TCG accelerators
Date: Tue, 28 Mar 2023 18:02:00 +0200
Message-Id: <20230328160203.13510-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: vCm3a/YcnJ7+

Commit 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
restricted CPU watchpoints to TCG accelerator. This is wrong, as
other accelerators such KVM do use watchpoints. Revert (partially)
this commit.

https://lore.kernel.org/qemu-devel/4784948c-1a92-1991-d6a2-b4d1ee23136c@redhat.com/

Philippe Mathieu-Daudé (3):
  softmmu/watchpoint: Add missing 'qemu/error-report.h' include
  softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
  softmmu: Restore use of CPU watchpoint for all accelerators

 include/hw/core/cpu.h         | 39 +------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 softmmu/watchpoint.c          |  5 ++++
 softmmu/meson.build           |  2 +-
 4 files changed, 50 insertions(+), 39 deletions(-)

-- 
2.38.1
