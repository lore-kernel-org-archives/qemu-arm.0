Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553060ejs;
        Tue, 9 Jan 2024 10:10:18 -0800 (PST)
X-Received: by 2002:a05:600c:4447:b0:40e:36ac:d9e3 with SMTP id v7-20020a05600c444700b0040e36acd9e3mr593647wmn.37.1704823818594;
        Tue, 09 Jan 2024 10:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823818; cv=none;
        d=google.com; s=arc-20160816;
        b=co5fknO97Dz8lj3pKlSnlkDYHuX8BsNBDkzi4y0s03WcSZHLTN7qR0SgceeL6QpZse
         a6Ct25xtGk9I4U68P2RehgSC+/4Y/KFW8H0Ov/j+ZKd0OmW1X1XFxfTZLVAeXEmNm4nT
         yKjOGnP882wccXuwutWY7UiJHIUM3cTHyy00gDDwEwQAcMxU7DPUz9pSAPBcoOdeynnO
         FcqY/0z5uaaVE/4VSF7C4nLuCVJtL1hzAyax2uHpIZBk/A7NFc/C4xOn5qu0NRVXodZX
         s+MePxYl1nEn2KDVXhGl23Unp1EwewTjOR6thqHPvTD3/1FBWC8caeJVnoi4Ywn3RlVo
         DYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=rzvLWgeDQvr4ciI7iyJwKBBLmz2W00WZuMTIkz5wThxkPfFyImMtLUSC0JT32S+FLt
         SLym/2UA4InOFxKxbc92nMP4RG9IQ67mMzzo8OHyRoSeAqyaAbReH/PxwcPo9WCoPqif
         0owCKsd6ByB0ebj6PztoctI9w9oiCY0RB9woVacx3FKYQDyy6sB8iRd7vhi6iSF7dyGO
         fjsk67o+zGhQyo6BGTwUeYCHmRWhD1wYf6azqZ+jnAQfHzUozhVr2zCSxfgGEtBb5cQS
         eng14bPsP22yxPOI7WjkIXILC6qhP5hF4rvUk+xGs1wrTT7w/nfOx7HMXvO17dQJMQnL
         /qmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8jh6rYr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13-20020a05600012cd00b003365f12a05esor2125353wrx.3.2024.01.09.10.10.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8jh6rYr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823818; x=1705428618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        b=y8jh6rYr4H+VI9NNK+IxEYoTTpNiV4pArA+ZnVgpskhLbKSLO2nA21Cq4VM/NiYdT7
         +DuroMSULlRvKhFQnRf8I6tbly4hqeL+OKyarc3V47eogqss8uC4qhpTOEwyxkniNpjt
         ZqM3ZoZbuiWw/YhUqieGx2jzukJ/b4Rr+rjaFnP8ZiNBJ2SxBfIDCsSNXZUPF7PNmzZu
         pcfVPf69dCsL1lz8UgHguoaXYVQxYozH51pNlfVwi/+FWsEsjzlB+45gs0GLoNXmXgC+
         8RbRXJnr0rgVMgAmqmilCOjM8MbU28Jreny1nvmjVvw8SrvWjy46mGsl/nHpu4pSg402
         xlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823818; x=1705428618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n6b/Kfb2q1nuszk7kQnrf8+ZzcUeVpd0islGk5jF8M=;
        b=QkL7CnzvTa2Mwg2gqHAijYPJ7DQ4T67MxmUSTrFaHpb+qkIw1Z0yl+EAIgYGUD93bz
         dr1uaM8WR560Pi5tIrkuFL0ZwuYwvrxjoS4w+pIycNozEQWuzjU0uIBoYJwKLBlWNxLY
         4XYC7A706yXemgYyt2TtYByTv4RoHuks0e+uubY3DdGkyErC+wND5anWdhCNTrfcMyQU
         4gjvDcOJ0/qy4w7pMIU8R39duH0CPvDAp7KDaDZIc9+y792YATjGcFHoectIoqw8w54l
         EVhy+nE+OFN4uLk6EkBklfYTF11iCO5eDTEh+2K8nQ79sap0IqruNrrcEwh4Pt3DoT3v
         iphA==
X-Gm-Message-State: AOJu0Yzh1HoPyptVq4SPVrATjG4M0fzhhPQ2U4WEvSRLKdVv2ACDBT4X
	jzKvQ3OVaoew/LW+r4Z/3v4G+4fiQzMaXKtIJo/XcX2ZvjhXDmWX
X-Google-Smtp-Source: AGHT+IE4jXA8U3e7c26iLW2dOY1wGZCd4tmuuH2ptRrYrBk6Wktz0CFYIyrg0TR6TFnaeQVst5SKlg==
X-Received: by 2002:a7b:cd17:0:b0:40e:364d:d526 with SMTP id f23-20020a7bcd17000000b0040e364dd526mr735782wmj.87.1704823818320;
        Tue, 09 Jan 2024 10:10:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040d5a5c523csm15647125wmq.1.2024.01.09.10.10.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/14] hw/arm: Prefer arm_feature(THUMB_DSP) over object_property_find(dsp)
Date: Tue,  9 Jan 2024 19:09:22 +0100
Message-ID: <20240109180930.90793-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BTmQoLeCj62/

The "dsp" property is added to ARMCPU when the ARM_FEATURE_THUMB_DSP
feature is available. Rather than checking whether the QOM property
is present, directly check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8350267d96..0a7ad2b762 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -321,7 +321,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "dsp")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_THUMB_DSP)) {
         if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
             return;
         }
-- 
2.41.0
