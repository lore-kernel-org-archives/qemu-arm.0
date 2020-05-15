Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp269487lfb;
        Fri, 15 May 2020 00:56:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgGPGXmN734zMMLj5DcgpsyNu2Mju42kaeIp+/tPl2LDHO2/epMiHGi2Me8I9yAR0dzn8p
X-Received: by 2002:a0c:a5c5:: with SMTP id z63mr2304149qvz.50.1589529387502;
        Fri, 15 May 2020 00:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589529387; cv=none;
        d=google.com; s=arc-20160816;
        b=XvrqA3k7rLxqAAkABv47J+N4AXTrmtVKi2knDTGOks4qw6oM4aci2DnK/Ep0vxbKD+
         Xg7KKgpSFR0DeM5p3SRgUIcokQ/+ka5SlcKqJFOk+ojsgRrIIJ9yLYyA29WHmeTWfC8j
         o0sZ2deLlek6Pf1XrEeeZCDLw9hYyjRf/jKbzaGdPnQtd8c+kSOr0JjDVTKJ2DklwTZs
         bkx2gWT1Ze3H/17KRDHOUz+X0Q96J3BhHmX2n8HJJRdtdAfdoSLeQnTQHKl92Uc8ueQO
         gQEWifTDqRipbRL5vX+8XlmEN58ZdHLW7qKcyXjdVz1i7NB22G4xR7gH5iNuQe05SV92
         zYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=odyDP/WPHS0++wIIxGlV1OCfgY8XMDET2qw3D5WmGJE=;
        b=ojdoUVgjuF0+1BvK8C307vFdC+/iPuLQ5AkSVe4XSfFvrktnT0UySwAHX8P7g5nVXn
         sAHGp+68cPdrRbdW6MQ/uriPbxBMUvZegq9I/UhPpOkSGb9a4M8MKgQ+kL5ybYNapD7T
         oMIT5axlvdq8H3UmtWqEKsoIBk/vdz6CckAqbM1epuiCgbjW9bIYcCdyCsPnBcAq+BFz
         Jci0wQmRZC/cvomTZMN5L2WFwSPHdWbUT4POmlwn0IDp/XQFF36esZjSAh2Ntp6EGNJN
         B7kwXvpEHCAlRhpMwWp0UgOqSeyOukFuxgfXitIYRTTfHNnfsV+LdFbUYwuqlzio2xfd
         lncQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pek0cV3b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si784012qtu.111.2020.05.15.00.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 00:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pek0cV3b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZVCl-0003as-05
	for alex.bennee@linaro.org; Fri, 15 May 2020 03:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZVCc-0003Zp-Sn
 for qemu-arm@nongnu.org; Fri, 15 May 2020 03:56:18 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32029
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZVCb-0006r1-BP
 for qemu-arm@nongnu.org; Fri, 15 May 2020 03:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589529376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odyDP/WPHS0++wIIxGlV1OCfgY8XMDET2qw3D5WmGJE=;
 b=Pek0cV3bEUh8Q3j8PESNL5b8AGK3BKM6IUv5xKcPe8u1bFAHgaIpX8vaZbnpFy3TNIrHPX
 KbD2Z0/8M2u4+WxUx+M3vNjPqP8Gn+w9r+cuq+ykvRsj4RWMfktTYHaQUsjPE7Q1at0006
 WnuOzwtyi9N7KxLpWPLQPNtN01vPX3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-JwCfvr7hPGu0C3Db_3q7_w-1; Fri, 15 May 2020 03:56:15 -0400
X-MC-Unique: JwCfvr7hPGu0C3Db_3q7_w-1
Received: by mail-wm1-f72.google.com with SMTP id m123so777366wmm.5
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 00:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=odyDP/WPHS0++wIIxGlV1OCfgY8XMDET2qw3D5WmGJE=;
 b=OZ+hQQdI0g784+nsCcCJKs4Y26tJicTM0PHEh8dX6Uox0SAqJWcvSNfWGkCRNOPuwp
 wxBFocB9A95eA4KwP7CnVN4ZV1bfYh4Vwh/pXjKK4Od5J+hZmIYIRfsTR2NDH7LhJmzD
 6P5g8uUJ4Bzew3vO4s67SMWNknDacP4kHL9F/+qbv+BQze4d4yxNcQxQzEx5GxETEb7s
 f3f9g0OQ1KG0qJi0zgISkSJOzHifxttMF5RpPrK3XeHsczJHpvmSHyvHkk8RmoCx6KaO
 Ve1aA2VoCCDr9lGMEdI5Ym6Rd+AUz0DpF9S01802sAav1a614FNGqexGzca25rdGcDkI
 ZnqA==
X-Gm-Message-State: AOAM533DPGryvK7OorSPoQq5N04TR1S2p62HnvMkm7zkXYiIqq4Oy7/z
 hFtxSPh79fKTTvFdprtrnGTMFTppdgxT5/3e8k0uw9DCZJ2n6SH425AcSoz1vKlbkQ1XpozfTjA
 aRQQfK1gG4e2j
X-Received: by 2002:adf:a35c:: with SMTP id d28mr2686536wrb.37.1589529373856; 
 Fri, 15 May 2020 00:56:13 -0700 (PDT)
X-Received: by 2002:adf:a35c:: with SMTP id d28mr2686514wrb.37.1589529373550; 
 Fri, 15 May 2020 00:56:13 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r11sm2453549wma.35.2020.05.15.00.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 00:56:13 -0700 (PDT)
Subject: Re: [PATCH 5/5] docs/system: Document Musca boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a94c5a6-cbf3-184e-40f3-25b18052dfa6@redhat.com>
Date: Fri, 15 May 2020 09:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507151819.28444-6-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N3AGTuQb6ht+

On 5/7/20 5:18 PM, Peter Maydell wrote:
> Provide a minimal documentation of the Musca boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/musca.rst  | 31 +++++++++++++++++++++++++++++++
>   docs/system/target-arm.rst |  1 +
>   MAINTAINERS                |  1 +
>   3 files changed, 33 insertions(+)
>   create mode 100644 docs/system/arm/musca.rst
> 
> diff --git a/docs/system/arm/musca.rst b/docs/system/arm/musca.rst
> new file mode 100644
> index 00000000000..8375c5008d5
> --- /dev/null
> +++ b/docs/system/arm/musca.rst
> @@ -0,0 +1,31 @@
> +Arm Musca boards (``musca-a``, ``musca-b1``)
> +============================================
> +
> +The Arm Musca development boards are a reference implementation
> +of a system using the SSE-200 subsystem for embedded.

Maybe nitpicking, but this sentence seems unfinished.

" ... for embedded [?]."

Maybe triplicate "systems" again?

> They are
> +dual Cortex-M33 systems.
> +
> +QEMU provides models of the A and B1 variants of this board.
> +
> +Unimplemented devices:
> +
> +- SPI
> +- |I2C|
> +- |I2S|
> +- PWM
> +- QSPI
> +- Timer
> +- SCC
> +- GPIO
> +- eFlash
> +- MHU
> +- PVT
> +- SDIO
> +- CryptoCell
> +
> +Note that (like the real hardware) the Musca-A machine is
> +asymmetric: CPU 0 does not have the FPU or DSP extensions,
> +but CPU 1 does. Also like the real hardware, the memory maps
> +for the A and B1 variants differ significantly, so guest
> +software must be built for the right variant.
> +
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 15bcf9f81f0..1b86b93c346 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -72,6 +72,7 @@ undocumented; you can get a complete list by running
>   
>      arm/integratorcp
>      arm/mps2
> +   arm/musca
>      arm/realview
>      arm/versatile
>      arm/vexpress
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea7bdd359e0..f8e0fdb4ef2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -706,6 +706,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/musca.c
> +F: docs/system/arm/musca.rst
>   
>   Musicpal
>   M: Jan Kiszka <jan.kiszka@web.de>
> 

