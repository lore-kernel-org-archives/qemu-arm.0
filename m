Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1259132ejs;
        Wed, 10 Jan 2024 11:55:04 -0800 (PST)
X-Received: by 2002:a05:600c:520d:b0:40c:416c:d99b with SMTP id fb13-20020a05600c520d00b0040c416cd99bmr820282wmb.47.1704916504271;
        Wed, 10 Jan 2024 11:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916504; cv=none;
        d=google.com; s=arc-20160816;
        b=vv1DvSTnTqbHJHNgrvX/clMzvj4RmpS2z3otucg1NGsl3G+6Ustm7GEql9H+Oie+l+
         bstEP5uoZxeldhWh1lnpGP9aojvLk/ztW54byFMhyZeqbVvz6DpO4zRD+Bo/Ecww+Z3v
         Kn1kQJ4TbIFUUV50xH/7EM1v8vSRIxHLvpF+UNUPvIQk14+NqIv8CeGcVbzrHbknEinm
         /CC7jf7mIPdhZk1NwS57gFwewnrIJ64xRKkwRr/FCkjiEeBj4wVlo3DXLymxNnyEVnEN
         P5OAciMp53moO0edzVfMNWNcvcuOri8l3ovgg8TXVYvH+rMsYuQNy5JQN1n/m3dKxNIU
         pSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GdLxkKJBM9/8cO5ervTCmHlXNSnSwQGVSVS04z23rsg=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=msugmR/B76gsyCmUYkcI1nhKjjc/J0GPzGuN9Uv52yiMrveIltwjUElb17hlKpXxJP
         Z5C2vyK8KN79kaRF6xawx5gs60d91Eb7d5uQEv6igISrWcdMyztGx9k60uzskOtgrsFR
         KNm6y3yPkzTwFA9n9nIBBSLWp8nhUJcrzSzIeuEXkMCmcYlMYFzNCjVC4Nuhk9Xg6IE3
         N55tHNFLmgckP65qXZlZBt/VfYt09ZzeUPcSFIoscSV7zj2y/C7Nf97H/gtI81wX14BC
         jMF0gamPECi3VsVJr1s54dnN59nkWM8U5gFXi2RJsaYjZJn1xVBvRraudttHF/lmy0K2
         Difw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgrjIfSy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n32-20020a05600c3ba000b0040e5181638fsor1652913wms.12.2024.01.10.11.55.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgrjIfSy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916504; x=1705521304; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdLxkKJBM9/8cO5ervTCmHlXNSnSwQGVSVS04z23rsg=;
        b=mgrjIfSypoMWh0a/FdPa7nMgub+2vnvVFEXqbT7Pm0uqEM0rHK010U7xKF0u0ddJru
         muEFEvE/OvCkV+cp5eXZE58Z4mRpytoigx/AxI3Jjh3vH7+5mLXQvFSrsW84znXMhR0c
         wYUj5D7nN1vBq1a3/EIumqZO6jRZl9YjDrgzwlkRTRHkWFUsvc42fL7oozRQ1sx602ku
         mxaSW8v0i72k2dpD+G3jdv5GOHaBgfQ/U6VXR66al6UBiE6wVXvVq6d/wv1dl0/3Jy1r
         BHw5EQhEaacF9fHAfKd354AmsKvf1m9mRw0PZI2ErXM7L+6btCMYitLTKdJZOBh5YqtM
         g8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916504; x=1705521304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdLxkKJBM9/8cO5ervTCmHlXNSnSwQGVSVS04z23rsg=;
        b=mSEewzc+1xVEb9xvCCsQgvi4qGE2dlaDlZ5akHsIZpSIBa+iM3AU2rJs7d2v5UeVe4
         WtI65JykvSMYiuuP5/0ELEVUE8QyjW2qHtXp4qXUoFBKgWtibaJTS1vOsz1B7zj68OwF
         3/8DRV+QaG1mmkVNTsh0SV0CYTYTfeUBSemSisRxVkbCWN75t46kCo82cNlM0u7aScb4
         WtrJX/P2Y0Vd62j2uH1/yS33AJ9PD0P0FXEogrxg+VSxhDoXyD5Wt7Pcrx+yTeaNIsnA
         N+N+4yIYizAlfqpMnrv6RTSjRgsFCZ3ChUT1pABhQPRskOabRT+DydekZ0yFM05B/ZX9
         gCgg==
X-Gm-Message-State: AOJu0Yx/BGB366XrlfYr2RdUnWGDMAkbmSh6tXyLIv6BxSRZtMn5Ira/
	cPCkVqg2v8jk1iR5B897zNvniMpLJcXMcVQsg+535Mb9jcvBnQ==
X-Google-Smtp-Source: AGHT+IFBq3SIKl//Nr9ItYDR3BjCPPqSfdupmfgRICMthFR5bjiXIpR3ELMN9whuDN7HLjO6jOiNlw==
X-Received: by 2002:a05:600c:4f85:b0:40d:4e28:43e8 with SMTP id n5-20020a05600c4f8500b0040d4e2843e8mr783060wmq.167.1704916503990;
        Wed, 10 Jan 2024 11:55:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id w4-20020adfec44000000b0033662fb321esm5583482wrn.33.2024.01.10.11.55.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:55:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/14] hw/arm: Prefer arm_feature(AARCH64) over object_property_find(aarch64)
Date: Wed, 10 Jan 2024 20:53:27 +0100
Message-ID: <20240110195329.3995-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DOp2646a0C3x

The "aarch64" property is added to ARMCPU when the
ARM_FEATURE_AARCH64 feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 49ed5309ff..a43e87874c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2140,7 +2140,7 @@ static void machvirt_init(MachineState *machine)
         numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
                           &error_fatal);
 
-        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
+        aarch64 &= arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64);
 
         if (!vms->secure) {
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
-- 
2.41.0
