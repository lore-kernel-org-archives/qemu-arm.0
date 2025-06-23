Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510324dyb;
        Mon, 23 Jun 2025 05:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSvPJGejijPV8cWMQ5PS6Ai3A3vBVCAb6NtIfiugNj/NVbJ++0Qyho+BfgQhOY120l6Rh7z5/bsgZBXw==@linaro.org
X-Received: by 2002:a05:6000:290c:b0:3a4:ebc4:45a4 with SMTP id ffacd0b85a97d-3a6d11910ffmr10879195f8f.5.1750681250722;
        Mon, 23 Jun 2025 05:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681250; cv=none;
        d=google.com; s=arc-20240605;
        b=Woav1cfs2Zne54eJxhAYOCo1yBWRYkcWNMxmKaXQ9M4mpJZjXOB7StLHvP2bqcWYE4
         9ceLqOkD5Liuaqi4uleydMw4b2jjd8kjDwr6i+nSNYc8yPpKaiHXJu3C5fpPaVn/1ZXr
         /9nOifgpiYzM+gQg8Cm+rd0yEe7MpW6R+fArJ/SWdIM7ccDL6WMbDinnm3KCX+Tuxp44
         1on2q/YWpdAwrmkkywj5f5vgnrCGYFTaUZXIziXpwKmt5VA8f9K4o1fosIpRcM0sdQ2M
         ujC5NYW3mi2NAygtBslegJl3eDS9R9+1AkuI7DEL/D3hmbcvVsDtYJQYYUZZH61uvOjD
         L55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/XMJ0zIICEYOJOmZnjjg6la4eos6APBolhDpaT3Vg7M=;
        fh=ICD67BQewOvKj6UIzypLxGBG7BG91eEEIiDAmSdx/hY=;
        b=jfjR9X4k+0W2SYTOPM9eDSJgQoRsxiCvRwX7RanzBNjXAU9kDsUWTCHJIeUgvCyMXw
         9T3nH/TZCSwHyqb0f1YCTj3lf8S+RXlTXEdU28e79SlQ6snXjNpLq7HpOz7lkCgUIBuD
         iYpMd0L01z/Vx+bTD0VZDSYAe+4WJ01sfYZ+sIN9r/xQo6QYfmLAnQ9RMHc1JmvnOSwO
         DBauu7wQEall6BOS19VybIrmUh4QLRa0/zBeVX/IClCVur/FRI/sIQN8CI7C/yxx9WBW
         vOH3tE9aWM8v1H9x6SLD5z25Mru10g0dnMwdEf3sxs4VaZ6YMyMi/bbM1PI7qjxfnXhh
         52oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGCBYqx7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45365a3c664sor21338395e9.9.2025.06.23.05.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGCBYqx7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681250; x=1751286050; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XMJ0zIICEYOJOmZnjjg6la4eos6APBolhDpaT3Vg7M=;
        b=SGCBYqx7iwv2lVtMt6Q2udczL9Xg/iJ9WON90yIc95Rr0S4R9qkLxMcHfSPUTSgq2m
         oq06/idbt4JR/UCVobQwL5IjTx9jauZlcmyr9ZznJpHQzM3vQRtWCzE1x1c56BUAD7lf
         cay0jjAK/7gOo6yZGSxbnyoZm2F8J27HzEl7U6FN2K3NAmRcmOed162AB1GCUH01X2fm
         Ah4ssMDKXt6cAygu0oWQSkQ6tidyWoicmw1LGbe74dvU50bSllyOErVpkjJaf5VNaAu7
         tWGDvLfXnclq6pvfjT/rAihgjk7zQmGIvZdjldC5S45qZiQstKJu5SbuCHhGG08WTV29
         ZYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681250; x=1751286050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XMJ0zIICEYOJOmZnjjg6la4eos6APBolhDpaT3Vg7M=;
        b=jMzOQ5i23VMd1YV6u7QgG1L3ipT4SdQq9AtlNOAKxDgd4kdKILQ/U76ua1dz4x6Ei+
         Bykvb194fUAFgzndw6SHYrM4bZGI9S6/tlKfMzNP/bXSrfzemyLk7OV5CiEoUy7YsCix
         rL3KEJiA7vEWlOkT+U97ONacAS/uKxkeVS/dJfZR5ip28c39yvEEVsIQiJZu1sKwY3Oj
         KHbRjavrKqOy1a07uaxQJ9G/pY6Vr3tLKovtHQhfMroGzX/TYieL+inVWI6RWojVKbxK
         ypYA4P8aSadEarb53Gn6JfNl2yHWmmW/VNbSVRKbdfoouc9DrZ1H3ZFO5DvEq28nKO+t
         75sg==
X-Forwarded-Encrypted: i=1; AJvYcCVZnHq4BG5wVrfizyiUTMoc51KXipfBKnX/DnmmC+ig9Q2PaGtRYYx2URHS7wQC+/nLuIFdXNWIZTkrEg==@linaro.org
X-Gm-Message-State: AOJu0Yzrw4u7BCHVVKMy4OLobdXNjoLbF+0+EKSf3o4Vj6hpNhT2zsTA
	NZ5EUwGndoEyPtctymj6yRi0FRnUDFjyqwBsGCMHEKhhBoqzJE1DLh1oF4WFvZC6lwYQKA==
X-Gm-Gg: ASbGnct7EYnUS8ouj0zc0eh50QDysKb4Wyre/dOnRREixxtXRqwpNQsSu+4yb5tWPcF
	twPbSh1Lj8KT5/4ikhN/09No33YociWPPpe+79dAN1EjH+sbY/GRJf3b0XCF28H6H2FAWPV3xHs
	wXC98cBjKx/AIeikc5trRNV+m1V0UAVky/nKCvnJETfXUTcITnJE6hw3FFoHr0y8rmh/d4uM+XS
	sWqJxrUD30m1jHaBo8CyAajKvflS2MVnp2NOJtTg7+hd3D5cY2FQnlOoPn1KPwk/rutdzfVIQdU
	yXJ+AfTLr5ZDXDfhw2ULQlqkrAcQYSJd9x55FNYPy7pkOihtnd7pwTijNCbscHmAzeHCzpyPxnk
	laaLjrhTPXKnAI/cLIoo436E/VsGyyGIMl832
X-Google-Smtp-Source: AGHT+IEa/iknzQpht+lrSGEcOk6XAtkG3t/fuyvBomWpFBo82CfJvaf+wwRcGbgYUNKrlTzMZ6RvuA==
X-Received: by 2002:a05:600c:5024:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-453659c9c39mr118467105e9.9.1750681250095;
        Mon, 23 Jun 2025 05:20:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10138sm9313250f8f.3.2025.06.23.05.20.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 24/26] tests/functional: Require TCG to run Aarch64 imx8mp-evk test
Date: Mon, 23 Jun 2025 14:18:43 +0200
Message-ID: <20250623121845.7214-25-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HRFqA8W2CvMe

The imx8mp-evk machine can only run with the TCG accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_aarch64_imx8mp_evk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
index 638bf9e1310..99ddcdef835 100755
--- a/tests/functional/test_aarch64_imx8mp_evk.py
+++ b/tests/functional/test_aarch64_imx8mp_evk.py
@@ -49,6 +49,7 @@ def setUp(self):
                      self.DTB_OFFSET, self.DTB_SIZE)
 
     def test_aarch64_imx8mp_evk_usdhc(self):
+        self.require_accelerator("tcg")
         self.set_machine('imx8mp-evk')
         self.vm.set_console(console_index=1)
         self.vm.add_args('-m', '2G',
-- 
2.49.0
