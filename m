Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp71873ejr;
        Tue, 10 Oct 2023 04:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk1wfiUyMnT7f++P8lLc8SZLY1AQ9uQTcrJpEaaKc637xX0hIwt0qGXunoleAQdI3adtow
X-Received: by 2002:ac8:5784:0:b0:418:1565:ed49 with SMTP id v4-20020ac85784000000b004181565ed49mr22807032qta.41.1696938787553;
        Tue, 10 Oct 2023 04:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696938787; cv=none;
        d=google.com; s=arc-20160816;
        b=rUJQfKm5nLkqmtxHU8GV27uO2b3tK4OqbK/xPRHrB8mEx2druu75M4mCrjxLubT/tz
         fbESXlR3RXWF4z8yxCuMB6HmCr8NNTnGvsuMVhr4nSc3jMcGtequUCV1wV2dbIY82KkF
         E54xdn9PqmubwbTm1ao1vA+QKO6Uplian8wym18pjQZ0e2/xNz5XLsVSvHXKx+fwsiDD
         MHrM1KstS33ahdedeii0r3xcY5uJlcXhYH4ZYV6RNe3ZpunWFATuzWXrjDnA8x9Mcq4+
         kGsjHWdkw0HznddIg6f7eWyVKM8+DOUPwTf/8oUpYjCNQfVYZny2ICvg+OkiIryGTCSP
         1yTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=qTSUkExp9urZ3PDfCzDNQrYHi5COhIaHNRtwBBrHOKk=;
        fh=wCeULhrNsm+4bwIA5o1huR6iEhWuKio5Uqtnu7dGbKk=;
        b=REEtnRLFZxLso6pfA5dOwIO9M1GZnSIzt+PzV8Cdk7jjDUDJQrbA7TipmAH+M7T9DH
         Cy2m1BCgsAOga3ySyiDEvUIoBuZ4EnNOeCQ4iSLJD2vpGGXwFkAokkYrwukt0mrDEOGB
         ink03t7xYIPmu4V0bYpefCTcS2U+ZKdhPsbdnwqD0gmOhOFbk8axf4QV+lylykG5+TE4
         JVTPekKcOHIxvwZDBdz++aF3FmP0g8S4b3mN7Mu0jkMOyf3NHNTQPZ1z8KRJIc8j+F98
         sLGRj46J9XNm1elNFaw17/rlKWMsk796eVjzeCWxv/cfvvgohgaP629k/FEu71Rj609L
         sX1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ac85a45000000b00410a9ddbcf7si7603461qta.163.2023.10.10.04.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 04:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqBIK-0004uT-N9; Tue, 10 Oct 2023 07:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqBIJ-0004tq-9x; Tue, 10 Oct 2023 07:52:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqBIG-0007RF-Q0; Tue, 10 Oct 2023 07:52:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 33CD57456AA;
 Tue, 10 Oct 2023 13:51:57 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F15B97456A7; Tue, 10 Oct 2023 13:51:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EF0D2745681;
 Tue, 10 Oct 2023 13:51:56 +0200 (CEST)
Date: Tue, 10 Oct 2023 13:51:56 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 17/18] hw/display: make ATI_VGA depend on PIXMAN
In-Reply-To: <20231010073830.606570-18-marcandre.lureau@redhat.com>
Message-ID: <074ec11f-30a0-a70e-fd24-d264925a1df9@eik.bme.hu>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
 <20231010073830.606570-18-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-372921519-1696938716=:36553"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eStZ9Iu+nJAG

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-372921519-1696938716=:36553
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 10 Oct 2023, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> configs/devices/mips64el-softmmu/default.mak | 2 +-
> hw/display/Kconfig                           | 2 +-
> hw/display/meson.build                       | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
> index d5188f7ea5..8d85607571 100644
> --- a/configs/devices/mips64el-softmmu/default.mak
> +++ b/configs/devices/mips64el-softmmu/default.mak
> @@ -3,7 +3,7 @@
> include ../mips-softmmu/common.mak
> CONFIG_FULOONG=y
> CONFIG_LOONGSON3V=y
> -CONFIG_ATI_VGA=y
> +# CONFIG_ATI_VGA=n
> CONFIG_RTL8139_PCI=y
> CONFIG_JAZZ=y
> CONFIG_VT82C686=y
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 1aafe1923d..4d8a6c4af8 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -125,7 +125,7 @@ config DPCD
> config ATI_VGA
>     bool
>     default y if PCI_DEVICES
> -    depends on PCI
> +    depends on PCI && PIXMAN
>     select VGA
>     select BITBANG_I2C
>     select DDC
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 14a57703d3..4a10040c19 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
>
> system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
>
> -system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
> +system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
>
>
> if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>
--3866299591-372921519-1696938716=:36553--
