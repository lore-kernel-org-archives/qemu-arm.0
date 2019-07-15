Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3732679wrv;
        Sun, 14 Jul 2019 23:21:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIueyYqy1xAnWeVyVQ9+1u1JrMjVu81SQVUE5dVn35ibbYm5e+0DDX5/E2JYSvRwlM/bJP
X-Received: by 2002:a50:ad2c:: with SMTP id y41mr20982014edc.300.1563171667366;
        Sun, 14 Jul 2019 23:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563171667; cv=none;
        d=google.com; s=arc-20160816;
        b=xQJAZR6/qlxpxWtqtcNN65J2/bBnKYSqoIjDRkDSeGezD1Adi3tAizst0OsbB9eIBR
         p69ILv/qFqV2HrIwz/wiruLwf4WAWaPSdUkQ8DrxVKboL9Kpx8ZafVgs4OLghcoT39Lk
         RHFI1RU1UjeMDmLEVd2BRuT6Ep0RuhnENfbN02Ezsam2vwkP0kTmhXbpArlMK41Xa4L0
         xrzF/xu+MLI7RWpuGg2NP0lZaokEU5mIlR6aduKFkuQUa+qpyLlLEjVEY2rtCuTIw8uO
         VCBOQl6z+aRoQKdMYZjk4/L5MPeY1hw7DnG/Q9xWNZ+2/hh66U8R8qrX8GIeEobv/A3A
         91Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:message-id:dkim-signature;
        bh=eZg7ZrLtYWslDxuPFhpIqd4M6gwZHOXSSdnLe/ew7vY=;
        b=IVZSQ9y9a1UPVMnXZajGpxIY1UNC8MHGkTFTRBiJ/Xqx0ZkcEXL6S3eAOoIPGUCEey
         pegP9OU00Iez4bWxjo0YYcPpANv2PKSzDfprAwGt0ksmnP32W/2pDm5gHBKHKYLxQCgh
         3VTZ+BD53gqjuRosyjH2AuqQuqJek5IyhF+OtNrW7ZcTlY7chQXNcmZTiFCt41WdxoBG
         dzHILtURpJBjv8snIZg/r5Rz5/dDagmLyJQCpd4Mf/m+bEVg7FEX62CNFcap0MsBZNxg
         24zxaD51ziZ8kmkO4oNjkPBjXze0RHIY1wZDYqPhy60CXmmzc4Xhxu2042IWHIu2eWEL
         fw7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=By9wl9u0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y54si9767795edb.416.2019.07.14.23.21.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 23:21:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=By9wl9u0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmuME-0003c4-GU
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 02:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuMC-0003bw-43
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuM9-0002ct-AW
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:21:03 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hmuM6-0002bT-AT; Mon, 15 Jul 2019 02:20:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id s1so883053pgr.2;
 Sun, 14 Jul 2019 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=eZg7ZrLtYWslDxuPFhpIqd4M6gwZHOXSSdnLe/ew7vY=;
 b=By9wl9u0QYnK8kJWxmFJLX87L41lMo0fGH14cq6R0CXbBaU1MkrGEJ+jjvK42KP39Y
 dXaZpplnImU2N1Xe4i3yXi+PMaXkogCBMnREnrAy4Y/iCrrfVTr35ouwsz1EJVEsWxc/
 qU8rcM5VJeWXEXON1gTbf5AZIrM3ubNc08BtwcobHo7JLPEdD+h3n0Qswi1Lgm5ZyG1F
 nHYAcgy7+t6Bbtmmr5NTQaJ6WZYP5zNGzlnUlRG3X/ycTKwiqUorjlpAUF0PRFkBh9Gx
 LZZHsWXueOk1Pf2xGiNfPnGlDCyIsXgSDg6eGfL9aTMooqpce3BhMUYRH/1nqwsHiMrG
 n0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=eZg7ZrLtYWslDxuPFhpIqd4M6gwZHOXSSdnLe/ew7vY=;
 b=U2GAwdvVjCQ3nfZZkQstu5do7DJjawy6hraUOrHyJR7CG4p8f104l79axa9ZWoGucq
 F/0lr6lWz9XH6ZkVx8AEyaAz+B4o4MhcWe9V4C+NiBTdc72oTqIS+yYBQ/SyR0oGmOjV
 bBErOT7Z+2s2WPqn5kUwrEIBBOKShfSiYuZ7ndOzeaTdY1lT2b9P/kddaSHxvWJxsgDO
 xvd5b/XeWB0yl5emfuDmVAbeg/ZJbtLATH9ckrClWqHPUTU/lz0gpvx4Soagfl0bZABX
 UnUnE4n8qA9k59w0LXAWQTggFmYwZW+PRyTEMRTOJw3RasjbZ026vFanzreFIizHU7jP
 nmrw==
X-Gm-Message-State: APjAAAXsPPBFEczs+5qdEeaz+SSRZzTp6sQnPerIv/8t806eU7txaSKj
 FGDwgh0ztjRdfsM2nCTaVJHBL1x7
X-Received: by 2002:a17:90a:cb97:: with SMTP id
 a23mr26854886pju.67.1563171656829; 
 Sun, 14 Jul 2019 23:20:56 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id m20sm3392023pff.79.2019.07.14.23.20.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 14 Jul 2019 23:20:56 -0700 (PDT)
Message-ID: <a5a7ebddcb737793aa7d6ba84db93b44e00cf7ac.camel@gmail.com>
From: Rashmica Gupta <rashmica.g@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jul 2019 16:20:51 +1000
In-Reply-To: <20190715061925.28030-1-rashmica.g@gmail.com>
References: <20190715061925.28030-1-rashmica.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH 0/2] Add Aspeed GPIO controller model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, clg@kaod.org,
 qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nygQ8ScxH4X

Doh! Forgot the v2 tag!

On Mon, 2019-07-15 at 16:19 +1000, Rashmica Gupta wrote:
> Rebased on Peter's target-arm.next branch.
> 
> v2: Addressed Andrew's feedback, added debounce regs, renamed get/set
> to
> read/write to minimise confusion with a 'set' of registers.
> 
> Rashmica Gupta (2):
>   hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
>   aspeed: add a GPIO controller to the SoC
> 
>  hw/arm/aspeed_soc.c           |  17 +
>  hw/gpio/Makefile.objs         |   1 +
>  hw/gpio/aspeed_gpio.c         | 891
> ++++++++++++++++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h   |   3 +
>  include/hw/gpio/aspeed_gpio.h |  92 ++++
>  5 files changed, 1004 insertions(+)
>  create mode 100644 hw/gpio/aspeed_gpio.c
>  create mode 100644 include/hw/gpio/aspeed_gpio.h
> 

