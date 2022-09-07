Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3444093ejh;
        Wed, 7 Sep 2022 02:30:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6W4j4KdOEa0QijEE4LyP5QZMPPFT0TDv2Ec+FSoRBFe1vGAl73skWBVKQwrOQo+kPBVH51
X-Received: by 2002:a05:6214:2625:b0:4a6:ca62:ed1d with SMTP id gv5-20020a056214262500b004a6ca62ed1dmr2159660qvb.126.1662543052622;
        Wed, 07 Sep 2022 02:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662543052; cv=none;
        d=google.com; s=arc-20160816;
        b=EkBpKqhL28dUfCje8bo81liCibcho6OvwUgDGxCPKiIdUqGuV/5uC6d8WWAclwLE/9
         TqV1bTIaCT9NkO73o4aekOesZFyKem1FiLDo6HdOPX0xzUVEUP9WxWEZnnwb2f8y69c4
         RsY3FghwftsJPbYoud+smtJE9WMebcg6vnC483andZCUMo0cysS86e+cmfmLkfGMKK1O
         QQcvGSHYgn2P7X2+YXTbpW+Ingw+yHaDfFuE8tAfaLN8+vX+jaJz63+jfaaVEc0mfkgc
         5Mg/q0EJi5a8b3u68BPWqbBYJHi5YEaign82fzGwWftywPld2LpgRcpsIsA2/j3Vtu1B
         tg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=RrdgRzO+9vuuDVrxe9Vg3KClkEjhrgjJV8KIscv2ido=;
        b=BT/xyJMXEHkYeLB+GKF2/OLpeFjCINaL/X+VQbtjpGJvZkjx+y79Q4F+1C2LV8r3gv
         inhIf/ZaHxlVN3C/AYKdHODHeALQOVHz+Vg4Tj7Q9BacgOrcK9gIuKE7yJcQRbea6aV0
         IDXpAn4OuNEAWzc5qLVvVBDrXKu5jebtKT/43ts7rMV+vqLlGRyRS/4DiWnC8ajg+tAh
         T3Dcs3Wm/kuayIGuyXWT9MvEkFV6Y7J/vc+DzrdzE+2khEsNYJUZlCne0JUbXA9kXU//
         7HpJ5BXkydzeWJDOab7gxfrbLBeOx1sRR0XCai62kaEBGcM7ejKMruNo3pcZo4OUovXN
         LsHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5Dcj8Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05622a038a00b0031f0126d2f4si10009901qtx.4.2022.09.07.02.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Sep 2022 02:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5Dcj8Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVrOS-000389-Oe
	for alex.bennee@linaro.org; Wed, 07 Sep 2022 05:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVqnN-0006Ux-TB
 for qemu-arm@nongnu.org; Wed, 07 Sep 2022 04:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVqnK-0003Sj-FF
 for qemu-arm@nongnu.org; Wed, 07 Sep 2022 04:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662540744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrdgRzO+9vuuDVrxe9Vg3KClkEjhrgjJV8KIscv2ido=;
 b=L5Dcj8QeLwnUODmf2LLdEumiKQBRd6KYn/7+GjjcaYRJZ3Hn4uC4ZAIGePfQMV9oMuBt5V
 g0mZ7ix9DKweIQEGLwSTnaIfCAqOc1iyFjeQd5PH5XGh7umMwIcuy+09Zp3Bn9zRhhzpVt
 WyM261YuU5IWwmnlof6XhQiMKh3T860=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-jLb8CCD8OqqjU4KfhC82TA-1; Wed, 07 Sep 2022 04:52:23 -0400
X-MC-Unique: jLb8CCD8OqqjU4KfhC82TA-1
Received: by mail-ej1-f69.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so4572445ejb.19
 for <qemu-arm@nongnu.org>; Wed, 07 Sep 2022 01:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RrdgRzO+9vuuDVrxe9Vg3KClkEjhrgjJV8KIscv2ido=;
 b=oALuIuYzU2ki0K2Cc6EdJaci9Qr1/iQFhmf6ZTccqGpC+hML48S82VD3bPJjCqfkcI
 ilCEqmOE0FZeyo952IhAZN9I1jLVjJCYjT4wUzuzJKWZTlHDZBNifECZ0F3mZjeDjBcm
 2Ge9oroY09hugrMNRuFeFhLUJRB2vjappSLhRgert3EVqBFJqGs9w7i5oA4oEHwP8mDe
 xC7TzP3ygBKM12DeSC1Czmiz7v80MpP5sHjmVESpA58praIZX5O3FyZDmDnavHwNrMlU
 Oy1G7CJFmNX6qtLjp0sajY2bxgAY6aX2CJqA73jPJ7/yYrtsvi6g3pJy5jjiStndnhwj
 7/lw==
X-Gm-Message-State: ACgBeo1eBgQB8FuWvjOw9+HL/q6ChCvZCalbVJe8fiV0IklAcjxS3Xp3
 UyET8fQC5ecdFRddxXIO4wTInnFnK3HL7cT/0Mm02gvl0kq/uWNdoxls4cI9QOVZGg+7KJtEuTS
 eFoMX5U3tb29y
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id
 e13-20020a056402190d00b00447ed224d0dmr2253200edz.309.1662540742577; 
 Wed, 07 Sep 2022 01:52:22 -0700 (PDT)
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id
 e13-20020a056402190d00b00447ed224d0dmr2253180edz.309.1662540742305; 
 Wed, 07 Sep 2022 01:52:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b0044e9a3690e0sm5077099edb.9.2022.09.07.01.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 01:52:21 -0700 (PDT)
Date: Wed, 7 Sep 2022 10:52:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <lersek@redhat.com>, <linuxarm@huawei.com>,
 <chenxiang66@hisilicon.com>, kraxel@redhat.com
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Message-ID: <20220907105220.3f54efb3@redhat.com>
In-Reply-To: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJmmkuYfxXUE

On Thu, 25 Aug 2022 17:18:42 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi
>=20
> On arm/virt platform, Chen Xiang reported a Guest crash while
> attempting the below steps,
>=20
> 1. Launch the Guest with nvdimm=3Don
> 2. Hot-add a NVDIMM dev
> 3. Reboot
> 4. Guest boots fine.
> 5. Reboot again.
> 6. Guest boot fails.
>=20
> QEMU_EFI reports the below error:
> ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
>=20
> Debugging shows that on first reboot(after hot-adding NVDIMM),
> Qemu updates the etc/table-loader len,
>=20
> qemu_ram_resize()
> =C2=A0 fw_cfg_modify_file()
> =C2=A0 =C2=A0 =C2=A0fw_cfg_modify_bytes_read()
>=20
> And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> the "key" entry to NULL. Because=C2=A0of this, on the second reboot,
> virt_acpi_build_update() is called with a NULL "build_state" and
> returns without updating the ACPI tables. This seems to be=20
> upsetting the firmware.
>=20
> To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read=
().

Fixes: bdbb5b1706d165 ("fw_cfg: add fw_cfg_machine_reset function")
Acked-by: Igor Mammedov <imammedo@redhat.com>

CCing Gerd to have a second set of eyes on it

> Reported-by: chenxiang <chenxiang66@hisilicon.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> I am still not very convinced this is the root cause of the issue.
> Though it looks like setting callback_opaque to NULL while updating
> the file size is wrong, what puzzles me is that on the second reboot
> we don't have any ACPI table size changes and ideally firmware should
> see the updated tables from the first reboot itself.
>=20
> Please take a look and let me know.
>=20
> Thanks,
> Shameer
>=20
> ---
>  hw/nvram/fw_cfg.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..dfe8404c01 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -728,7 +728,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, =
uint16_t key,
>      ptr =3D s->entries[arch][key].data;
>      s->entries[arch][key].data =3D data;
>      s->entries[arch][key].len =3D len;
> -    s->entries[arch][key].callback_opaque =3D NULL;

>      s->entries[arch][key].allow_write =3D false;

As Christian have mentioned, this also looks bogus.
perhaps another patch to fix that as well.

>      return ptr;

