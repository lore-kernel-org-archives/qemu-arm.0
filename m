Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1673731lfg;
        Tue, 25 Feb 2020 05:17:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEwfX+WXDCAYLqfUSIeoviHvSUBPVTnaYBAOuAK+gKqFjmMND4uBnRP2tzWhU9ds0MKXRE
X-Received: by 2002:a0c:fca2:: with SMTP id h2mr50822737qvq.146.1582636658185;
        Tue, 25 Feb 2020 05:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582636658; cv=none;
        d=google.com; s=arc-20160816;
        b=V2T7y9k29C0dwjcHf+JIYMDNLT4FlxFi1JYU55e2c37FWt6mTOaHXDA+8hfKGDDl8S
         Lq1xFSNH69HKIHPN4kiIlIDSE4l0mJXBTYF49weDyl/meOSfV/Ux/yY9MNN2PRsJV3HL
         DN2aEp//6IYfXb5UfaU2Y0gBg2N45sgxjWNFdahpfLk4GLFHI1qHSGDwAhNrLx0hPCWW
         CJ7OQ6a1i5nxcGhu6u/y+qChMv2xHhM0cgkjiS5uphCcwmO3HsDVywEC7KN57ZhtQNuZ
         g4A9xrREWf1n7P47ZQWdjlq3OWm5mqT15Fm6O4Te9ADin3vFwixWJMaznA64tEKf9aOb
         v2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/s7kcgzjK6Jcd+lbezo/Ccp7/oxDgNdlRqtHaMhsg7E=;
        b=lLfhXNGbUvWSHFqaUvlSIoVT4vlWBJ1TC3QoHzaohXGulcamrOcpk3dVCzf97WFlwW
         OIoVFlWNnxc2AZCk+Fkce+F58AzeAROJIqWErt8uOZ+vXNWJrOiwuE2LMW6g858EKSYE
         XghAa1QEYmVnTaX2PPZUz1GWv+rPAINrrdEtcfdYCLkYH2N4+G1Lxzx+tI/vWJOT26WO
         vKrKgoHAluseVzFdxQuqynkxQIj8Pn5JiKmSm5bp0pnhrnkUtaJvl0fbzttRlRmD3SD0
         XNjv7Ma84wL0fysAEhEphizGcI2t/amVNOlX7afjgn6uagrFOyG76aEgEAO3L3rQNdCT
         GlSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SIGZ14+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si7037103qvz.184.2020.02.25.05.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 05:17:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SIGZ14+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6a5h-0004g9-HK
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 08:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zcu-0006T2-1P
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zcs-0007O4-Tu
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:47:51 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Zcs-0007Nf-Om
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:47:50 -0500
Received: by mail-ot1-x343.google.com with SMTP id b3so11933219otp.4
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 04:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/s7kcgzjK6Jcd+lbezo/Ccp7/oxDgNdlRqtHaMhsg7E=;
 b=SIGZ14+L/T4pUJ7s5q8BJoGdGbwusvHd39ts3++WjorzQF4mgBdbGNdrI9a2dFNyKN
 LWyt0ZWAuD4ok65VQuLb/AKe4QqNxpTsvj5iP6xVLYAcIjQu4B9CCP9DbQvHliwHRn7E
 klMQAj3LBf/B1N0g5KaxCQhBAbf/rHalwpg4X1qOHF2Gqc3MKMvuIKd36Kfa4HNryDaY
 02gOq2wqbDzrAbql0z6a9rSNcNEykoANoZUMi/xJm23IwTukgAiGfeDYaUnJa0DMtNwj
 /ORGK2p0w6/ua+dG31Eh1tJ+fmfZfAIJ7X/PMdPmTako2ts0k3gk2nZhYUvtMJdiacZJ
 6RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/s7kcgzjK6Jcd+lbezo/Ccp7/oxDgNdlRqtHaMhsg7E=;
 b=C0ojKG7Sz7m0t62Tqu8a14gjB0nBJOvchLDRwxod0RptldzKcIb3CVolyvIvdSsCPT
 glvMhH5pW3AOv0aVcnF3dpHaMwKAW6E17Y4AjhdoDxhDVS+j0jnvfpzahNkUUsBaLSU+
 7nSxq9vkxtKU2mnOSWIeoF+2J/gXtXlRBTp4Nvq4oPk7EHbePHiENBB8EdwEOZP2fme+
 ZmMA+lsQhJs7ka7BuSlNUcXkcQOkGU51fZJnmrKNcLFgo6CMQrnmNn6GGPIynUnv6R0J
 tvRFCM10oMvh2+9e5gte+9NXE3ks4SUWUEs+OwrdXe8sDQzucriIC4Y52Dl5qfINMUR4
 FtMg==
X-Gm-Message-State: APjAAAUGGPJ1AACkrhFP2SdFnnb8nv57y0aSQ6pkD0CzADwtLJN9Ttao
 +ZDNAgtp3o6uTmbHiX41zXFsACoRqfDo9bZhYbK8Knst
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr44866318ota.232.1582634869785; 
 Tue, 25 Feb 2020 04:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20200223233033.15371-1-f4bug@amsat.org>
 <20200223233033.15371-3-f4bug@amsat.org>
In-Reply-To: <20200223233033.15371-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 12:47:38 +0000
Message-ID: <CAFEAcA9bZJ9X20SX-5J2M6rWEhNC=un3Re3RVhGGHD1qMEdWtw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] hw/arm/integratorcp: Map a CFI parallel flash
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xxropmrw64cK

On Sun, 23 Feb 2020 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The Linux kernel displays errors why trying to detect the flash:
>
>   Linux version 4.16.0 (linus@genomnajs) (gcc version 7.2.1 20171011 (Lin=
aro GCC 7.2-2017.11)) #142 PREEMPT Wed May 9 13:24:55 CEST 2018
>   CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00093177
>   CPU: VIVT data cache, VIVT instruction cache
>   OF: fdt: Machine model: ARM Integrator/CP
>   ...
>   of-flash 24000000.flash: Integrator/CP flash protection
>   of-flash 24000000.flash: do_map_probe() failed for type cfi_probe
>   of-flash 24000000.flash: do_map_probe() failed
>
> Since we have a CFI pflash model available, wire it.
> The kernel properly detects it:
>
>   of-flash 24000000.flash: Integrator/CP flash protection
>   24000000.flash: Found 1 x32 devices at 0x0 in 32-bit bank. Manufacturer=
 ID 0x000000 Chip ID 0x000000
>   Intel/Sharp Extended Query Table at 0x0031
>   Using buffer write method
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Kconfig change was not committed
>
> RFC because I have no idea of the flash model, its ID code, and which
> default CFI family (1 or 2).

ARM DUI 0102G ("ARM Firmware Suite Reference Guide") helpfully has
a few details:

Device                                  Size  Organization     Flash part
Integrator/AP Boot flash               512KB  1x512K block     Atmel AT49LV=
040
Integrator/AP Application flash         32MB  256x128K blocks  Intel 28F320=
S3
Integrator/CP Boot/Application flash    16MB  64x256K blocks   Intel 28F640=
J3A

(of which we only model the CP.) With luck that's enough to
nail down the relevant device properties.

> @@ -646,6 +649,14 @@ static void integratorcp_init(MachineState *machine)
>                            qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDI=
N, 0));
>      sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
>
> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
> +    if (!pflash_cfi01_register(0x24000000, "pflash", 16 * MiB,
> +                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
> +                               64 * KiB, 4, 0, 0, 0, 0, 0)) {
> +        error_report("Error registering flash memory");
> +        exit(1);
> +    }

Passing a 'width' argument of 0 means "weird legacy backcompat
device that's a bad emulation of a pair of 16-bit devices";
we should avoid that for new code, and instead set
the width and device-width properties to whatever the
hardware has. (This in turn means you can't use the old
pflash_cfi01_register() function.)

Should we be using blk_by_legacy_dinfo() in new code?
I'm not sure if there's a better way to do this if we don't
need to maintain back-compat with old commandline specifications
of the flash contents.

thanks
-- PMM
