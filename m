Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1176998wrm;
        Fri, 18 Oct 2019 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO6fuSV/OlSGfrkXs8Ln9vbo5q4ib1CvjOX/Ob/3p5Z1dnffjiYmyDQM8CoLe4xLxJpGGv
X-Received: by 2002:ad4:42a2:: with SMTP id e2mr10450032qvr.189.1571418096052;
        Fri, 18 Oct 2019 10:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571418096; cv=none;
        d=google.com; s=arc-20160816;
        b=KBhRCAZSDu17qeZGIvlEFLFnqKooOJxh3ADfk9hd12Z9IhbIHG18w2BmLhGy7vMUqo
         UjRBLItseAW7cB2xnyCdZeX/pA90RUHxrn4XEhWDnghyzkJJlomV2w3M7pH7o9yAh6aS
         Y2BVl4GW4NbcVa75kQWsVwGunE4EaxkmWP1VIEeGvH9jXFNAJT/Cg8oKevIf2c5jdXmE
         nR5H4NyEV4xFafKA85iCFdjzjzGTSfOjVDpGvDG0BvEdoy1kjhcA6zSqcIKzaGTr2J1M
         LL4QmmO0Uu9CMOMHH4rtCMW5Et3FBogHrRaKQz0H7g/aK2iV4GtNvaaCiP5NiXwodcJE
         Y4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wofiPsvRbp+QeTuDJUj+hUidGtWOPEsWdjPIhzLcOjE=;
        b=cHKEcFMnwNmpD+KVgT6QPnAY8H/xPFafWkGCa50EEn9doH7lQ98Eae7WvNN+UrssaV
         GJ26nLxqKVMq09WGaWzfrXEOuIg/IANh5PokqHLHOSDeMx4jtjRinsh5M5edpMV4LxPr
         C5h9KlEJPZBzjJGpVp+8/GZroM5WKEcYQ5jPuyYzSlkLXih1iygmu909QF1lMBHmfBVS
         gIpvR8GqKe3k2ErMb9SxMBMrL0TdRrfXjmE0WhJLeACBFvYqoQOd/Du+4GlhtSuu8h90
         +zWgkMNhdB2vfdI08BgQfxbAq9WczzLUZCz9k8AYJWUkhCHeQz4KJzuCdlRjfSXN0hGp
         YI8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fgu6jw0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si6466976qkx.10.2019.10.18.10.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fgu6jw0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVd9-00044m-Fk
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVaW-0001XH-A5
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:58:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVaT-0004Dy-PP
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:58:51 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVaT-0004Dg-Hk
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:58:49 -0400
Received: by mail-oi1-x243.google.com with SMTP id d140so1490412oib.5
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wofiPsvRbp+QeTuDJUj+hUidGtWOPEsWdjPIhzLcOjE=;
 b=fgu6jw0b2ZfeC1V0TyPDQ9QaoHHk5U6pUbGOp4mkaoiin4AhxPLxKk2DOAEMDrIrjB
 qQOR1FNKHus87x5NqFlA85vhytXYERIr7QW2UA0LEKbxpuM8H9B5d8daLTSn4nNNYlRs
 svoMUNxd+83444gFkfzxGm5ssgWx+z4OFrCQh6zhx/res+OKP6PhVVq0CpJIR4OMwQeT
 +0P1/GRMlJcZE3lB12wLyTtwktJ/AKd6W5BT0XTsHWSGF13toRv3b8s5DtOCwOCCsR0K
 uikzwNZCzvPS89GfEbPa0tSPoInwXZj0wRhd8g8YcEVKCHtvzLP2aqdeCTKyWtbtiVZk
 sWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wofiPsvRbp+QeTuDJUj+hUidGtWOPEsWdjPIhzLcOjE=;
 b=bTQ5Fmb4uQtJemM01qNLeDlKs6TOaET1u8Gz3m1A/uaKbmp/cLPfN/XXb2Mps7gXmW
 ALyuM80sSDcQ2Aee6l1mD54Z4HP9XOP4/KwLHESylSGcVijy+DQ7aabsZK647jAC5ySe
 ffg/BjTTl1Zaze8SCG9Ki5EJJzrXgZe0177KKWUPtXdCuquL9XuceSc+73eyrCcujK9W
 AkhhvetgGTDVxudLXdW2L72/fZgM3Q2kOe/fFpKYmEyMJNPIaFVrR7j6FHaDGNXhDzI6
 V+7U7bZCSEi/ZhzvMv91+KMjVjavGZfILP+TiElVpXe2pXwfgdofNJGfC7V8tmFlqTme
 QvBw==
X-Gm-Message-State: APjAAAUJqehmGcwe4+U7J1VqkcCovfTG+DmtGZmu+oooMxdRy5arnsNF
 zxzyfM/XMw5EBfDMIqGBBRKKJ3AdihFhQ2l5PSrgCw==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr8956761oic.98.1571417928577; 
 Fri, 18 Oct 2019 09:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-14-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-14-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:58:37 +0100
Message-ID: <CAFEAcA9KYviP8YQeD5YaYR5pL_-S=C2cn23pLSdX=j_6=3qqmQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] qdev: remove PROP_MEMORY_REGION
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q2JPILEk3AJN

On Fri, 18 Oct 2019 at 16:44, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> PROP_MEMORY_REGION was a derivative of PROP_PTR, added in commit
> ed03d749f3f513b8fb0287757cfda2cb6825f063 (qdev: add MemoryRegion
> property) and thankfully no longer needed since commit
> 3eff40dbf44896a8180c86c84dbdefb2eb173fbe (hw/misc: Remove
> mmio_interface device).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/qdev-properties.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index c6a8cb5516..16837ab5dd 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -216,8 +216,6 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>      DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t)
>  #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
>      DEFINE_PROP(_n, _s, _f, qdev_prop_pci_host_devaddr, PCIHostDeviceAdd=
ress)
> -#define DEFINE_PROP_MEMORY_REGION(_n, _s, _f)             \
> -    DEFINE_PROP(_n, _s, _f, qdev_prop_ptr, MemoryRegion *)
>  #define DEFINE_PROP_OFF_AUTO_PCIBAR(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_off_auto_pcibar, \
>                          OffAutoPCIBAR)
> --
> 2.23.0.606.g08da6496b6

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
