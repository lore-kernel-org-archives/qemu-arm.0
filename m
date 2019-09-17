Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5648235wrp;
        Tue, 17 Sep 2019 12:44:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqhuBjr8TtyeOFOi9adUoPn+b4re9MAnRBuUl5/VDO1WWOkI2D4J6KNSvP+vhKSUZCmgzd
X-Received: by 2002:ac8:3fba:: with SMTP id d55mr549808qtk.43.1568749462271;
        Tue, 17 Sep 2019 12:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568749462; cv=none;
        d=google.com; s=arc-20160816;
        b=DPjTlbReF6PQp/DwGsJmrCBeurLSqU1d9CQyVfMvcz+CMZULexoSbROmwGoC9ottoB
         Ur1ZkFZ9Cof4EJ/8qfMleiyDR2V3q9u/QBIDX+67+pIIUSD023LRpHbVbN12SPKXGanP
         gM1vnfBmY/0Ihx3KfnudsWhF/I8yEfp8x51goaL+9Alt4r2cbqxlgswF1x+kYWg8Bybo
         25do5EEdo70jupJwcWmlUQO7iBRsq2C72l0Lh4ROthUYRkwbbZH/rmflcGfTGrWrzh8n
         7T+4OGg2w1sG0Fj2YoXEgBmt3Qh/Po8XqO4nOAwjcPMe8og4FNa1mHkPVponPg0TTkRw
         T0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=hP7H0FfJiWoqapYSTYRmCPTGc6Kquaa+iE+x41nO6O8=;
        b=LQgb6w7FBMSf7KcvquJynaAF5tY2JBrDKE+S7ulP/kSiPZHPeBvBQJu9F1yNXc9fY0
         lcQ0Wtw1ZwO9bg6HpSitLvUBAZtycaadcDyk6jynZGaJaCnV+H4Fa1hqMuTin2cRY/y9
         +0WHzgjd/hssa9quxLFXzQF7E2iXxb0Dr3QvGtMgqLeIYCSlusaMlNxMGJl7kPy5PACj
         SzGpBl3By5NQAjgtgihc3C2lWh+4AFped6eS2/P52TyqwbOnGQRBYnOInUzGRNPGNLsy
         bb04VRR2ltnwYTDGLtNBpPZLY0i236ZS9nIwmFkEB4VSa9pqGDVeiHFX/qRZTImmRP8C
         PqBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t129si2256830qkf.344.2019.09.17.12.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28C098665D
	for <alex.bennee@linaro.org>; Tue, 17 Sep 2019 19:44:21 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id r21so1264256wme.5
        for <alex.bennee@linaro.org>; Tue, 17 Sep 2019 12:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hP7H0FfJiWoqapYSTYRmCPTGc6Kquaa+iE+x41nO6O8=;
        b=O+1BezpwpafA6IPa+i3qzRrB56XHZpUUkyCVM8UQRE5eq5dLdZAN7F3cdKzNGblCEL
         cdm8AhRhtaKR3E+zJwbz9D61m0L484mpAfHVee43xcM/jUy2wrAkX2Prd81XDEVLoNVt
         4ayQUGWSKoiElxjQMnTazuwJJB+KC2AbDwgbODLbfiikrKqHaIzTXtUEX5141ubn+CYA
         9KIJl6ogygTS0m3JyRx45ZS/c+bgwEByI3+FB4sgMI0XdEq/eTB8vEjywELYZGsHpGvy
         PSIM5kvh+z0GHPkziCbgwmRS3reZhs+6rVTmnKhVavame6O9RfmuQDe3F1TVDzJlYcvp
         dBfw==
X-Gm-Message-State: APjAAAWTZ5Pi7H4Gn9+RKCn6KSDfVNlsSVCr+4Yl7kb8S04JaAQ4dG8t
	WpoE5lhYeE0SGw5caHtV5T1s16L31ef5gbl1GC2RM7kBDXY2K9kjj6bWL9imUYb6bF780f3QkLv
	QGcrV+5YrUGaQ9+Cc
X-Received: by 2002:a05:600c:295b:: with SMTP id n27mr4156576wmd.128.1568749459547;
        Tue, 17 Sep 2019 12:44:19 -0700 (PDT)
X-Received: by 2002:a05:600c:295b:: with SMTP id n27mr4156570wmd.128.1568749459379;
        Tue, 17 Sep 2019 12:44:19 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id o22sm5354998wra.96.2019.09.17.12.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:44:18 -0700 (PDT)
Subject: Re: [PATCH v1 2/9] tests/docker: fix DOCKER_PARTIAL_IMAGES
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5b77d03b-753b-5ea6-af17-bfccac2614d5@redhat.com>
Date: Tue, 17 Sep 2019 21:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190917184109.12564-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4poccgngjtuT

On 9/17/19 8:41 PM, Alex Bennée wrote:
> Finger trouble in a previous clean-up inadvertently set
> DEBIAN_PARTIAL_IMAGES instead of DOCKER_PARTIAL_IMAGES.

Arf :)

> Fixes: 44d5a8bf5d2
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 50a400b573a..0d033bfbea8 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -7,7 +7,7 @@ DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
>  DOCKER_DEPRECATED_IMAGES := debian
>  # we don't run tests on intermediate images (used as base by another image)
>  DOCKER_PARTIAL_IMAGES := debian debian8 debian9 debian10 debian-sid
> -DEBIAN_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap
> +DOCKER_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap

As John noticed, we have another typo: "debian-9-mxe" -> "debian9-mxe"

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  DOCKER_IMAGES := $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
>  DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>  # Use a global constant ccache directory to speed up repetitive builds
> 
