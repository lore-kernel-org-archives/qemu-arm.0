Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3053487wrp;
        Mon, 23 Sep 2019 12:46:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhfDzqK/KDs+3oH1vlV/YyFqDVj+HN0nZhE30HD/IMSVtRz+xhwGQbjOQGWVQkvGR19hWx
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr1118215iod.261.1569267997688;
        Mon, 23 Sep 2019 12:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569267997; cv=none;
        d=google.com; s=arc-20160816;
        b=Iun1HHpNWkCuZ+/JPq+ZsadK/eB1h/h0oUKqrCN8PKfAhOvg6bJqNGlaFvrpDZ0kWz
         8foP52DlkkR4MRnSMORldThs+Spe5O2IX8NYB9VoB+e0/1KaL5TieMkrKcVOcSwVvdwp
         3NOz2Z6YIMz0rC7g+ufJIHBTrKOMANK3QNu9lSp3DvjWB8xgLImm3ym9RVkE6grxj0i0
         G89B5qJVW9YxTgreqjU5bRZRzx+yh2AbI6NFX3ujiF68hPQWTFadT2AIe85y8DZSAqRW
         rmIo4FaxLFAiq+A9JVYowU4HYbItahb/aD/8lo+KlDbCCpwS11IqDhu1cVRuEb/vMt9+
         p1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=ztjkecLtq9OKiFLjwAZbtdWz/C4h6jR5A6zg06v7Ipg=;
        b=D79IjxHc/h1OJnkffAhxJ4sHQq0TsVL6FAk/ipxNYLQ3AK3qVxszUZF60IXR5t135f
         k7L/F5V/yN/o5vNIEVCV/pW4n3B74/tepjtGG6Mw82M7pY6uqISDYWBUf4bpgig4qMER
         jaHzJJp7h0uVQAd+kDI4uUSZVBaS46RgvATBkgvs0rXAWdorDXBkNC/qNlI2Fp+biXuO
         1IdhWCSFCHW/+AyrK58324WBm1aRlHnKbJ5SLqOk8vOCxLOAAHUdfzxNifNuGcgzGQy4
         aWW408+GVrp96T7rKiBeokNgiNMhdlwIu81imez9KfetZ5XN1DxLzJr+rDbINpDPQS8u
         CQ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p24si16952774jah.18.2019.09.23.12.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 12:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E56E8308FEC1;
	Mon, 23 Sep 2019 19:46:36 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com [10.18.17.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 900A360BFB;
	Mon, 23 Sep 2019 19:46:30 +0000 (UTC)
Date: Mon, 23 Sep 2019 15:46:28 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	peter.maydell@linaro.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH  v2 02/16] tests/docker: fix DOCKER_PARTIAL_IMAGES
Message-ID: <20190923194628.GC6528@dhcp-17-179.bos.redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190919171015.12681-3-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 19:46:36 +0000 (UTC)
X-TUID: BwxGInm8mIdc

On Thu, Sep 19, 2019 at 06:10:01PM +0100, Alex Bennée wrote:
> Finger trouble in a previous clean-up inadvertently set
> DEBIAN_PARTIAL_IMAGES instead of DOCKER_PARTIAL_IMAGES. Also fix the
> typo to debian-9-mxe.
> 
> Fixes: 44d5a8bf5d2
> Signed-off-by: John Snow <jsnow@redhat.com>
> [AJB: merged fix from Message-Id: <20190917185537.25417-1-jsnow@redhat.com>]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 50a400b573a..3fc7a863e51 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -7,7 +7,7 @@ DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
>  DOCKER_DEPRECATED_IMAGES := debian
>  # we don't run tests on intermediate images (used as base by another image)
>  DOCKER_PARTIAL_IMAGES := debian debian8 debian9 debian10 debian-sid
> -DEBIAN_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap
> +DOCKER_PARTIAL_IMAGES += debian8-mxe debian9-mxe debian-ports debian-bootstrap
>  DOCKER_IMAGES := $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
>  DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>  # Use a global constant ccache directory to speed up repetitive builds
> -- 
> 2.20.1
> 
> 
