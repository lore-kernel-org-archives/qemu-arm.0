Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60685CD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtMl-0006aT-PH; Fri, 15 May 2026 10:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtLu-0005kP-Os
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:17:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtLr-0005wz-W3
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:17:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so83704345e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854638; cv=none;
 d=google.com; s=arc-20240605;
 b=KR9ZZt+IJA0UbmqhVkyTN8G2dxzKdciWbqRI8IUDrJuxGsP7Bc5qTF3ECafTHdZXo9
 feLdql/A99Ff9XF1ricA5mLEmBU145Sjcy873iufEjxwLvxIPpwpzbikjD1db5U+LRhv
 usakSbqAbYp7U/W++NlnVX0z9DwxTfHj5QXBwYWL+1oIct4xMoka8oQ3YXw1I12FprYb
 uMzzkCl3ZdPkJLw80v9ZEwaJ8aBvttRu3gMBvy9PYHxsGI98A4oruoNhz4vTY9z0yCYV
 xin6RzwI5Ru9Sea1iqmry1KxrRZw4jcjKotQ0siiNgG8rz6nX/eIPj+WsgHFKYt/4ogt
 jwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RpwF4bN9IyrPkq/1bQFEPnBnaxLa1OtsRvp4x+A6wU8=;
 fh=w9r1ZTK5a/B96Inlgt8Rt/FZ7ReiLsA/ZBX6sxIeeTs=;
 b=Mpyke5i2cUqg2fwTYwIWwrtLThGquDzE/ddMWSEswcIJuSSTdCxRSQKTnpfdMAsa9F
 uQGAzumLkYvLLgd0uphkXFZ3XVmA46amnNmva42aub5hBrr1lvrZzgi2y6MF+c7E2F+v
 QzpT0AG1+zeETqVcU4zBpJ7T2YL0TC0B1kT6RQIO3aWspn+lPy8LCrc9LAoyMHqdG2UD
 8h+Nhpww+eNdswyoS7YUiXJwwwfemcmYp84XpLezk7JIxERSgJubFn0lFK60sKqFE18F
 B0d4HI70CBboD5HyMKLoONJ4CvaT+W/uMl9vmv+tfRSmZ5Q24Y2Ow3+AkQpfbVaTG1P7
 fZAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854638; x=1779459438; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpwF4bN9IyrPkq/1bQFEPnBnaxLa1OtsRvp4x+A6wU8=;
 b=ZK4Nlr0pTINP14ONSFj1LO8nhdnFIAXTbnRrZXrFw6Hzp/xJfpjsGs0m02Kf2fVvrd
 onAt3U3E0qMSfoYMCe8kJzLMihSrtgT+E4FRLB9Kyvf79VsxWZkbEePOU6w6pU6W9Hug
 7vNisO8QMDRIBSccK+8fRaLjY/voFDVb4Mnu3cYGmB3zavIonoAppQFh1+gaWTa7JQyG
 QEA4IX17jGrpPjQFW+cBc6c5DQh9QtjcjtO7KU/e/Nr0AtZdbEePIcj2MdgAnSj4AVzK
 M2VAR8CchS2YnjdjDdho5C1Amyp16el1Tkz8owMiH4xRtNhwYqYfz+XEK/QfHaMJjlWx
 iKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854638; x=1779459438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RpwF4bN9IyrPkq/1bQFEPnBnaxLa1OtsRvp4x+A6wU8=;
 b=RcVxSfUa5Hy762UAmYknm7fu/0m6IOkQex4r0giD186QtpOtT24rdc9QokTMSwpqwO
 z71SKe8AGgxx50XEZL/AFBG3jEBr1mPdiO//aI2BmOxHK2vowlO0tngHCX6uojN782eg
 LthnxU8bTd6sLdjsiYc1wTHqeoSI7uRH5IMh9jqPwaiJXnWqiIh/QRyMDXezq7uw13kS
 tSNgIMG5+jTAUfPPcULUovkuKHSlL0JJZEPMhSktjxs6szoyb02K6D9GfgcFjpT8ykaZ
 HcdVpxPGgGiUPrrg8NGwdPYoBU47Lt1AEDvSgFRgjrvUSjJ7MmOl5HwgGk5chD25d/5R
 K7hw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xdB1ntk5PHmRhT40V4S2of5qmLLn5TWu/1Pi+JvEMFvjwIWDxRK1D3icWq3h+68cNCObrSwZHZA==@nongnu.org
X-Gm-Message-State: AOJu0Yw5ldur5ok+Q6/TgVXLLGJqIVxz7xf4jd9OoL2WYGGaJRhXnamu
 Z378+INpn0SR1xewC3sWjBhnYdzc+cvPnAMuT0Wa5o8d9zjnDIPWf1BqCBoPj3xcd2ZAsOsUP74
 /vvPr2KMKXS833qSyzC1DN0akFmmmjMFD2zlV2RNfIQ==
X-Gm-Gg: Acq92OHizWlpd+WCjcDW9b0NXMFOC03JjmpcYJbMxDw/TBpHk8mEFE4yQrCdpjaHxr6
 faOIxsflNMLylzDGassSapgwJFjIsTqLuDSs2Y1ap5bs9AOjsQ+JxHjChIbQTT3VRWo17Rz+m7v
 LtuX0eaRUY6v6yQGTFKsILSnOvo/McuyQrYz2p1UXpjdCxejk4MxDOSe0SOHbprbZR+TYmbbxZA
 wBE2V/tT4ihtn9W8MwZVhdxdkx5zpMgW7HX2/FoHg94MS/2sD2s/VDr1jOKVDKquMRhnZAxL0ay
 pKWwcjjzyBbfdZEe7nmGGvH04qmSotOCdMj6PaD+7S7MS5Axw2wewoSUHyCL
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id
 5b1f17b1804b1-48fe60eccc3mr55950055e9.13.1778854638222; Fri, 15 May 2026
 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-7-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-7-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:16:51 +0300
X-Gm-Features: AVHnY4J7SapanDU5sGaXP6WITthqt-mdUGcPCtRE-bf2yeGZO9maOS-JQHCmEtU
Message-ID: <CAAjaMXbiqcfhSoKHKJn5-+6XyTtOLd2OPb==HdYzC=qYxsuWpQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/20] hw/arm/meson: Remove now unused arm_ss[] source
 set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/arm/meson.build | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 7c3d66f4378..88e7ad1a3ed 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -1,4 +1,3 @@
> -arm_ss =3D ss.source_set()
>  arm_common_ss =3D ss.source_set()
>  arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
>  arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c=
'))
> @@ -108,5 +107,4 @@ arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: f=
iles('vexpress.c'))
>
>  arm_common_ss.add(files('boot.c'))
>
> -hw_arch +=3D {'arm': arm_ss}
>  hw_common_arch +=3D {'arm': arm_common_ss}
> --
> 2.53.0
>

