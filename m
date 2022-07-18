Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1202438lfp;
        Mon, 18 Jul 2022 02:50:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tq60S79+AvkBudv+717atueHFGhMFikfQZ6CsvtQCVkdkhgB/fO64xAOEhk1vQXjbxowEZ
X-Received: by 2002:ac8:5e4f:0:b0:31e:d96f:a4e7 with SMTP id i15-20020ac85e4f000000b0031ed96fa4e7mr11796808qtx.634.1658137813104;
        Mon, 18 Jul 2022 02:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658137813; cv=none;
        d=google.com; s=arc-20160816;
        b=F62yMLUvhh1SgW5q2Sz6u7rs8q/gFNHQXJ/IfKzzAVxA3/0aZZ8ENCFLTrYrXC7/yH
         KucqX50HLQ2+aF80OnV2uPDCuRizXewCL/HZ3+Ei1CaUffxqM1eSo+Zy6jDAedeTTcg7
         fE7EIWu3JdZqLkUiU3x6VVP87KPghJo2eFHZDuOnr4K/Oa/mblnjDEOY8gxWavyYQzEM
         MZE3rWDDnN57x/PuhldzB2RjO0XNhKjoqxWM6pSMMS4JYtYCWj9zZjRLofmNZ14l3uin
         ffNTuMCzdENiCshJLNmnr3zaSD+MqP+pkG+8J0qXpsylzr67+0kPaLPibM6+YBrDuS42
         vfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=BdUdSUiZ1QfJ8qReR0eVFIG3Q1mQ0okHUWLsI6F9vdM=;
        b=Y+leLMVXi1gPjLBfc6UtHRO37Ol8Resg3OkgZm25BQCBrBv6mDKXKRouTMP5uZ1oGO
         z8ef1wy1nyCKW9t24xoA/4TO0CvInihOfwMUU3gEf4SjCPvDwBFYqoE59YjT99aJCwME
         oRA2WI1Lp0+E+6lQpJEwxo6gVOtkZcvVvHR8FgaZ43C78E2vrARNpvKC4zn2f7DaP3UO
         FeFr3S3CgeV4LzcsMK/hpVcWUb+KvkO7sR+ZrfFAa8tBW6A5nV6/XDpLs76MGCjH5XcK
         xjCQruyv+b/Vbm1WDFopC4300b8wfN9oo11g7gjM7et8zqdLgrb4iSMs2P8nzgTeZAEn
         SDIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AgUvXsPi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a259000b006b15b762e7csi5252142qko.656.2022.07.18.02.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AgUvXsPi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNOG-0006j0-I0
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNNp-0006iW-Vk
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNNn-0002l3-6E
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdUdSUiZ1QfJ8qReR0eVFIG3Q1mQ0okHUWLsI6F9vdM=;
 b=AgUvXsPiWt4Gu2Y2c8YZFVjz4IwGwcaSvoPDblxM24LeU0gfMdC5BH+ScfJhdVZsNGwvig
 LSP3Za3Q7tB7Ckg2gZNCVe4TDED/GPoSCjteTjMMuuQwKpvZuHZ+HmJAR/coCRyh8gicHz
 Cx673LYIVmjiDunFlfJ34oABSdDDTxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-bIQ_EjQQNNWrfIlED1FHUw-1; Mon, 18 Jul 2022 05:49:39 -0400
X-MC-Unique: bIQ_EjQQNNWrfIlED1FHUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CE3C803520;
 Mon, 18 Jul 2022 09:49:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B82112166B29;
 Mon, 18 Jul 2022 09:49:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5923D21E690D; Mon, 18 Jul 2022 11:49:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  venture@google.com,
 Avi.Fishman@nuvoton.com,  kfting@nuvoton.com,  hskinnemoen@google.com,
 f4bug@amsat.org,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 thuth@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
Date: Mon, 18 Jul 2022 11:49:36 +0200
In-Reply-To: <20220714182836.89602-6-wuhaotsh@google.com> (Hao Wu's message of
 "Thu, 14 Jul 2022 11:28:33 -0700")
Message-ID: <87ilnuda33.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PNvM7N3Yw4vA

Hao Wu <wuhaotsh@google.com> writes:

> This type is used to represent block devs that are not suitable to
> be represented by other existing types.
>
> A sample use is to represent an at24c eeprom device defined in
> hw/nvram/eeprom_at24c.c. The block device can be used to contain the
> content of the said eeprom device.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Let me add a bit more history in the hope of helping other reviewers.

v3 of this series[1] used IF_NONE for the EEPROM device.

Peter Maydell questioned that[2], and we concluded it's wrong.  I wrote

    [A] board can use any traditional interface type.  If none of them
    matches, and common decency prevents use of a non-matching one,
    invent a new one.  We could do IF_OTHER.

Thomas Huth cleaned up the existing abuse of IF_NONE to use IF_PFLASH
instead, in commit 6b717a8d44:

    hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device instead of IF_NO=
NE

    Configuring a drive with "if=3Dnone" is meant for creation of a backend
    only, it should not get automatically assigned to a device frontend.
    Use "if=3Dpflash" for the One-Time-Programmable device instead (like
    it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).

    Since the old way of configuring the device has already been published
    with the previous QEMU versions, we cannot remove this immediately, but
    have to deprecate it and support it for at least two more releases.

    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Acked-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Message-id: 20211119102549.217755-1-thuth@redhat.com
    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

An OTP device isn't really a parallel flash, and neither are eFuses.
More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
other interface types, too.

This patch introduces IF_OTHER.  The patch after next uses it for an
EEPROM device.

Do we want IF_OTHER?

If no, I guess we get to abuse IF_PFLASH some more.

If yes, I guess we should use IF_PFLASH only for actual parallel flash
memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
be worth the trouble, though.

Thoughts?

> ---
>  blockdev.c                | 4 +++-
>  include/sysemu/blockdev.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 9230888e34..befd69ac5f 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -82,6 +82,7 @@ static const char *const if_name[IF_COUNT] =3D {
>      [IF_MTD] =3D "mtd",
>      [IF_SD] =3D "sd",
>      [IF_VIRTIO] =3D "virtio",
> +    [IF_OTHER] =3D "other",
>      [IF_XEN] =3D "xen",
>  };
>=20=20
> @@ -726,7 +727,8 @@ QemuOptsList qemu_legacy_drive_opts =3D {
>          },{
>              .name =3D "if",
>              .type =3D QEMU_OPT_STRING,
> -            .help =3D "interface (ide, scsi, sd, mtd, floppy, pflash, vi=
rtio)",
> +            .help =3D "interface (ide, scsi, sd, mtd, floppy, pflash, vi=
rtio,"
> +                    " other)",
>          },{
>              .name =3D "file",
>              .type =3D QEMU_OPT_STRING,
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 3211b16513..d9dd5af291 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -21,6 +21,7 @@ typedef enum {
>       */
>      IF_NONE =3D 0,
>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_=
XEN,
> +    IF_OTHER,
>      IF_COUNT
>  } BlockInterfaceType;


[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00372.html

[2] Subject: does drive_get_next(IF_NONE) make sense?
    Message-ID: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.g=
mail.com>
    https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00710.html

