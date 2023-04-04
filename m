Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp765080ejb;
        Tue, 4 Apr 2023 08:54:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9LDymoGsDO8SrIPY/vlml6HJs0GuB57Fs5j6dPZYUPscaHqmApnwynmOQ4eZBTlP+0BDi
X-Received: by 2002:ac8:5fc3:0:b0:3e3:8770:bee3 with SMTP id k3-20020ac85fc3000000b003e38770bee3mr4459756qta.1.1680623680794;
        Tue, 04 Apr 2023 08:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680623680; cv=none;
        d=google.com; s=arc-20160816;
        b=UDxlP4k7fzI1tbnfRIbyylBVqrCPlCnPvjIi0tzFNCINmBwCI8hHhApEXBIhlJSo1S
         iRpp/YsogeJ1v4SACzaJ4KQ6C5VX+72XZdh/y78Z+73StWBQzm1LnZpq1lnwa4mOiisJ
         6JcerEao7AAFSZib+GcE9koEEb0ZbHC2NE0vwnd+4pG8aAcRtz+xqv9p8p27mSLd7uo2
         LwY0yQM+4HZen7JWRte4Up3G4eO/9Q5dqKFRnglXefIicPfuj4ZFcc3N3teuJxcswS0I
         nPnDI4dLCBsNRdtvDPcAQtcnlv3k0l9hUIMJVtKSADaZ2UfAaqpHIvIHTpjl4RpaoPbX
         IVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C7uN3p4wwSGCEqw4iaI9GVBzbptRL9e8O3Et6SZgxKw=;
        b=jGbd1o2kQBrUPT4XO3+VfY0mJ84pR2eGH7/AgPqcOsgCRod4WeVDC3eBtUEYgb3eF7
         0Lv4hV5TGaw559jDe0tDXIAurWig5FsAVaSv63yL1qhxR4ueRWIeZh6299mdQkZjSGQx
         G3OJJNyC+135OvrCvxEI0jTBxaz5zREn5UEoLKvi5ud1jTbGtstz8fJO1B+ibQ/tf+AD
         wy202OsY+Pw3orDL/sIhPumnmiHHoqEHRXfmFOdyr886FpMttuMnS8EzFAH8nz8gZx9q
         DvkqlamFHY6U00N7qKfmSkyRIhfFwgkvbJW9BpFfFiOaP3VyERjYbVQiJk2TxNLyup8n
         VTNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgFYX01A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020ae9df03000000b00746a54f25besi7957744qkf.194.2023.04.04.08.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 08:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgFYX01A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjizB-0002Ll-Oh; Tue, 04 Apr 2023 11:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjizA-0002L3-Lu
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 11:54:16 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiz8-0005Oi-Tq
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 11:54:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ew6so132449059edb.7
 for <qemu-arm@nongnu.org>; Tue, 04 Apr 2023 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7uN3p4wwSGCEqw4iaI9GVBzbptRL9e8O3Et6SZgxKw=;
 b=tgFYX01ADPRskN/UQEXeGyefwrH+5K2Hb7IoJ6hS4nNVri87/pLqMvEiBUmKm0/qNO
 UKuAKGCiDWQ/Q0gIgYTdLSAJmYMsXQ5JVw9eVLJ31WGqUJ8XCGnNQqSFUYQMbM/NmqHi
 THZXKcAHBi+OlwHaylinBhNK0rRnJ9FUYEU/t0R77AniBoQRCTQUo9DgD9hOJ/sR8LjO
 V9bD/RlrjxQRmQ3Xpf+74W9pbN5mpqAjS3D+9I/bJ3Mh2tZCmAKg0floIMlzH9c8Pg6o
 ed3fRE3Mh6QSwBwAzU165ThkiGvoNGWvJ2OxPL9v+mqQ7yE73iLJx/BF1oZTiGURv/Mt
 Cl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7uN3p4wwSGCEqw4iaI9GVBzbptRL9e8O3Et6SZgxKw=;
 b=2PxYKPzTYHo9xCfq3S1DXlo1U9QXrAwHin1bryXQv9g85mZiETVloerMtd480TLsAb
 i2zxeSAMLtDUK/RLcFNaXGoBxQGyIMcE9sW/knXJU8wVtIH654jgL5vivTgZOloZdTYi
 zvRFZHmv27ueG7eHvZ0Zh1zVYT1MBcX5Eo3hOISrvliJH2dpmVRcM2gV4h8N8Qk7eh5b
 MU+4IsiUn0+akmz7rmlCcY6KQxhDteVlZsXt8TfYv6bHKEMiTbBy2yk5ShciZ079tmJD
 tQXItGUbOSKNlqHqO2J8c1S7vsYBzSo72cuj2pWcXEt3/Ng1PRTrfilmKuVltHZeSl3N
 aVvw==
X-Gm-Message-State: AAQBX9d25XdQAjnVpSDFCr0DvAOAPudBOS7B3t8Yy/o9dKeXCOhbT4gO
 cP9lhNBAHWOcH5aV9pFnR9KJfCskettIXoJiGTxoYg==
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr12059156edb.3.1680623653341; Tue, 04
 Apr 2023 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220714154456.2565189-1-clg@kaod.org>
 <20220714154456.2565189-11-clg@kaod.org>
In-Reply-To: <20220714154456.2565189-11-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 16:54:02 +0100
Message-ID: <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
Subject: Re: [PULL 10/19] aspeed: fby35: Add a bootrom for the BMC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Delevoryas <peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QiBvOk8GZV6v

On Thu, 14 Jul 2022 at 16:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The BMC boots from the first flash device by fetching instructions
> from the flash contents. Add an alias region on 0x0 for this
> purpose. There are currently performance issues with this method (TBs
> being flushed too often), so as a faster alternative, install the
> flash contents as a ROM in the BMC memory space.
>
> See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
> property to boot directly from CE0")
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> [ clg: blk_pread() fixes ]
> Message-Id: <20220705191400.41632-8-peter@pjd.dev>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Hi; Coverity has noticed a trivial "memory leak" (CID 1508061) in this code=
:

>  static void fby35_bmc_init(Fby35State *s)
>  {
> +    DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
> +
>      memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_M=
AX);
>      memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
>                             FBY35_BMC_RAM_SIZE, &error_abort);
> @@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
>      qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
>
>      aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
> +
> +    /* Install first FMC flash content as a boot rom. */
> +    if (drive0) {
> +        AspeedSMCFlash *fl =3D &s->bmc.fmc.flashes[0];
> +        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);

Here we allocate a new MemoryRegion...

> +        uint64_t size =3D memory_region_size(&fl->mmio);
> +
> +        if (s->mmio_exec) {
> +            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
> +                                     &fl->mmio, 0, size);
> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWA=
RE_ADDR,
> +                                        boot_rom);
> +        } else {
> +
> +            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
> +                                   size, &error_abort);
> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWA=
RE_ADDR,
> +                                        boot_rom);
> +            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWAR=
E_ADDR,
> +                                     size, &error_abort);
> +        }

...but we never keep a pointer to it anywhere, so Coverity classes
this as a "memory leak". (It's not really one, because the memory
has to stay live for the whole of QEMU's execution anyway.)

The easy fix is not to allocate a new MR, but instead use
a MemoryRegion field in the Fby35State struct, the way we
do for all the other MRs this function sets up. Conveniently,
there already is a "MemoryRegion bmc_boot_rom" in the struct
which is currently completely unused :-)

thanks
-- PMM
