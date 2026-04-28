Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12BEFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 09:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHf6v-00035o-0K; Tue, 28 Apr 2026 05:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf6u-000354-6g
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:52:08 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf6r-0006fb-JL
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:52:07 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65075c2ba66so9111259d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 02:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369924; cv=none;
 d=google.com; s=arc-20240605;
 b=j4PIjiGayqjpsuaECQ4MSwjLywRsR9AbeC8zoiBsSf+LK035+YS2L3dAWD6bAhruO/
 wj+gOaeZpDBzyt/BemhMsdmFud+DRK9r8UUxaxwfYqLAYmIBoVipxIP0HYm5QhbO+xQk
 O6mduDf0d9X4S2enWSRyltmI3hCol5wr2jpYWXwTGnFwiSUE9gMZIpNU4xA165jLEYEg
 WyCozUFnO/ps+zM5wfgDBvYNxnzkhfniLGAqJ72qhRixlflNgSfh4saNwSbqTimWOkuL
 NEvhXMZw22orbC2SJbPGLqsPRQjV2yBZrC5pJDp1r5A7doqjS4l1HBiqCtR40kCwWObg
 E1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 fh=vK5M016T6mug0K+bBNNl7tIbK5JWhExp6PakPNEINNk=;
 b=MvKi8fNNM9eKpONmO3gJXYhTjgBtqyDM9OOrXL/tFOyoeiTQ5v9f2i4xvifIVnwEyK
 xOZFv+Ki5pnLyK1q8nuwEjW1R6OecGBf8oQxRTpezhHbaC6S66Qris0Lt2qBvbi1jqqg
 wiYCcp8Ecxl/ZB5UYjN7Du4rw+21mMrbOzLBDgjC58re7F1x8EJSOiXpEH9eHmPET6qX
 lMTyIh9rAkNieuEexUn2ZkpJ9cqNU0xjGzexv2eYivg7kNj1wyQG7+pes2nUgrOxvrxM
 Dmh9kpVY1A1SZCyKXYGKDICo7G2pZ12AqG9TY5ZDSXWvTjWtEctGsHlJpGyoIJz8pz3T
 MGhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777369924; x=1777974724; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 b=EKJB1l9KO+snjTd6eRM/5DLCoW7svOqmKFJUIC8RG4AyjKqw/0SweiDudlOJXkt1kV
 Y3VLt8H5Kx5stU5kIoY8rTik8cVgbKmXINfNAEfAJBCdfX2/weU1GvlOtJITJCT7y9q1
 40AUlcKnH7GbELi/5qHumJ+hGlPYgcPYG86B8JgjrmETbZnot9yzqT2Q7jMzu917U8UX
 qcaZ1S8flY6JBu/EeiGJoEHC/szFtnTd5OJvleUGbfaDBzlDMzJvCfiXu7BBQRYTZ1QQ
 utKWu33KEssOvhhcQHbS9WvUTdUrRvST5aOSV4njDMDAlt4xeWXxeRO56i1K0f1oGNop
 yyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777369924; x=1777974724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 b=P/YbWB7pkZjXZni1SiFiO3OIYLXDmXtEc3AvtTFLEJmhTX0FTZBHRcjqOhGSf5V8yH
 xO1Hrnv3y8UesIs2LzmNMGV1PnJUEVTqv69jyrWs7nGDritEpI6e1qyhQr+BJ/yzIw+4
 BDZxKMFhVP9Auo/TA7nII8ZahWcC+QPWlfkWilKeGhSPpnM0NFIa+P3eEZq3jyXig6iX
 aoRkO5y9us6Z+yHnWWSjjqWvjE87gcTdDiaK1ne1fl4LSN1R2qWxdYARxEgULa44Saxm
 PvS8mp5U1YptUxseX7nxp5OO9v2Nn2i1LYltlYUFU47102BfdrdNSS9RO4I9oOStLpWE
 zv4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uaODD62wYgMI3a5FhtPPjnzfS0BQVNscb/IinTEmlK6p2V8fUd4IcGlaxM52MyeIdKBdrNsOlnQ==@nongnu.org
X-Gm-Message-State: AOJu0YyZuFrqCLexVpbn1KAdMJsi9hO17tlzI2Xwmi1IdVXGQ2A3djZx
 KxXMS/luoNfcu4hc72O4arwd8+jdMt8h1+nW1pgdJJlrNHTxge2DiRjqygWUGReA+InBBz3S7D2
 9cSFYpDooTt3KGc8Hbk9ExnLqMDggVX0RRXQhPseJUg==
X-Gm-Gg: AeBDieuygpXI+SA6TU7BDLUYARnir3rd6x/pGPBUrodCYW7k9lVIm6pgxdTs8EKpbWM
 zzH9Uwq6EtU12R4KmUozZ2wfIalXnyUhfb5LwUfcXmnypSMFhwEDyYtuhrmo2oIKBOc7IhV9wNV
 XGBw8zaSr+bNnZfOHsgd7gLnacauyyCLvo33bFoQdIseEA5ErRXu+NmdMyOIjU5P1FpaUxTouXI
 +LAD0db68gezwBYEQCrwEIHyKfozKRVUbspW9gdzPnBCAdDY5QWjfyUPUSIIVzlM07s2RSqlTim
 Zreu9Az4mHc46FEgdi8Q28aimeDqh/Ylpg0pfok+1I9mDXLSmttXSfyamXK3GmspEDyepOFPji3
 dcw==
X-Received: by 2002:a05:690e:4813:b0:654:a4fd:ebfc with SMTP id
 956f58d0204a3-65beed4b37dmr1477104d50.5.1777369924253; Tue, 28 Apr 2026
 02:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-4-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 10:51:53 +0100
X-Gm-Features: AVHnY4LN6oyQ5hgpGpRcO4ZdokEuLd-PlagZ965MDMbtumluQ7kS8dcp9G1gEZw
Message-ID: <CAFEAcA_BFzFSOrXB9DorTftGYVmvP7gB8_+14fpwGEC6vasAeA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/arm/imx8mp-evk: Fix reference count of SoC object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> object_new() leaves a reference count of one, and object_property_add_child()
> then leaves it at two. This would leak the SoC object if the machine object was
> destroyed since the machine is the SoC's sole owner. Fix this by converting to
> object_new_with_props() which gets the parenting and reference count right in
> one go.
>
> Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/imx8mp-evk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index b84ac91a17..cfc3038c36 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -74,8 +74,8 @@ static void imx8mp_evk_init(MachineState *machine)
>          .modify_dtb = imx8mp_evk_modify_dtb,
>      };
>
> -    s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
> +    s = FSL_IMX8MP(object_new_with_props(TYPE_FSL_IMX8MP, OBJECT(machine),
> +                                         "soc", &error_fatal, NULL));
>      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);

There are more boards doing this as object_new / add_child / unref
than with object_new_with_props(), but doing it in one call seems
better than three.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

