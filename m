Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp220962ejc;
        Tue, 5 Mar 2024 03:37:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwN/N/0WzKf8t/XFXKFnSR7JbsIhmmqkDiIfgSpNT13LEOd8CUGPo4zzoRQ0rghjw01sTe2hGlvhtMagFGba1hPKliEcVw
X-Google-Smtp-Source: AGHT+IHPwLT4H2yrhQStsAPy4Cn9CfNfFRNYoCXy1MHI6g7MUQnZ5hM5KMilPwtblBgfPTE38t/P
X-Received: by 2002:a05:622a:104c:b0:42e:b936:78b1 with SMTP id f12-20020a05622a104c00b0042eb93678b1mr1780857qte.58.1709638674059;
        Tue, 05 Mar 2024 03:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709638674; cv=none;
        d=google.com; s=arc-20160816;
        b=caAjZfPmMtyYxOp7/t5ZdMKM5vXqKjMzquY1MHV2dmAK5hfkAV2KMusdY3oNuFj7X7
         s8lE2gYHVq7oter0Mj+JKXwZDIvX3ahZJYWQ/tq2xZagFxVRZ90mIJw0ci5OQ2a5COC+
         L5o0Sa4wVDK/xYOoir1dUy32sIKleeOhxl8qmbzaau7JAwodvuIhCWbrNlUfiT4Yb/5t
         eS4PoZ/0bgX13EQYfq+pSc8NvLDFvk0EmITH5qxu9lCqug9fCiAqierDVfniskEjlSIZ
         RinJONnPELdw7RB9SkPHCtjxs7KpHWLDI84d4n7PJrhrxD42na+Wodcut7zao7ZM0qDB
         //Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=X+XyziquYx1qV8PnNTEvXP00ge/08XPje0E6BdPBN5s=;
        fh=P4KDKWZcL4TY57gBu4JJk/XyTyGFWgS9azqICDNBqwk=;
        b=evSlG8JlKIxcRAkyGALZTg1uAq67aFdxG6toAhLFYwqMf5zhnMabzFaMybwstv45SC
         9455Aq+nLjj9DRDMc9p3FcwpSCzMuq1zZsfxaWvpLXDWCFwgjxaNdWlF9ioAf90ZmdDL
         Baf/vB8ImzeQbxtuq4AkE16jPxBLe7VY46X4m5QIpVCDLQI8m+qVLHwxmwTRW3BchkLT
         DUgIDK6Y9g9cYWSfJDwMJZv9KGV7ng1CHTbkTTdPM9AbSVTr1ZeDdESu4akui7oclhZW
         wv2x3c1w8cWi8UM3a7F7gEubgePzOfdFQz6COHdocfT3q7FmEEBw34LkNdwiaUDTgiP2
         uRnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K9n/H5aM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a05622a171600b0042ee131a8a2si6795415qtk.580.2024.03.05.03.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 03:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K9n/H5aM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhT6j-0000SW-Rs; Tue, 05 Mar 2024 06:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhT6j-0000SJ-5Z
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 06:37:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhT6e-0002Z3-FB
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 06:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709638627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+XyziquYx1qV8PnNTEvXP00ge/08XPje0E6BdPBN5s=;
 b=K9n/H5aMPqTREuHFzQubRhB3us8Nd1fLeCPKVbrTo3GuuqBthrkUCGfcKfZPnn+QWWau43
 rvwPGh+X2hsko7CQeGcOepK8HskGuhOaRLAdTO4tHHPmHYbxsafz8Ebq8jf+xzTDfIocNn
 3Ujk1snRmCejJ10FcweDzh6n2PfD2VE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-a69uK0M3MBWhWgWgJJSfag-1; Tue, 05 Mar 2024 06:37:06 -0500
X-MC-Unique: a69uK0M3MBWhWgWgJJSfag-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5c670f70a37so5586935a12.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 03:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638625; x=1710243425;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lr9ZwAIZH9USXJUZ1I9mjZLUVZFZB1fODebftbuXqoI=;
 b=hTULp1RFRUOXxfVVKnndc2pz0oclzlbwAam629FgvNLKx5N6ki6TQ9jlnm4sowfTP8
 p913m4xbcJwwLOup7EQo+dP/R6Pm4DXbMIqK+PCiB5wGn+jP5tvkxiPDeZ95E++tIsMi
 mNKgIH3D5tKnLH4yqgMWUfxWi4cuCc256qVN1mzKj0zGetrA/kNbvpEOf/OhB4fey6qB
 5htdiJk+HYhvl6ICX2Lf6NxycMjAyISPldSkKtSnkmQw47i1vJRCKO+hm6fgpwDohvPC
 Go6DfhhJBY0fnUjLxSVkAtOwZjvacGBl98iMoja5w3/X1qo2e2eLErnDY9UauwXe2+TW
 QEtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDwxG8pJHOYYS+Fk/I2fEVW2AEBsyYrZdtuFUAA2joeuGJliQbfaH4NQzWNMw5nrIGAECtIS6SRasF/ZkrTXieYz2y
X-Gm-Message-State: AOJu0Yx3323yNIyaWNK9eI8BUGuCaKdtZ5KoOX8ecVTjtLgUUB4/2db3
 34iixZ7NHeAnP0nTujK3cB8gRgZx2w5DAYc8xthayy+ohb0J9wY+uimXlrcjr25tysuAEBUAvrs
 i+WLvC3EUeDwgYXVUwLL7G1w345Vg6twvccZsJWPIW0RbdJLC9A==
X-Received: by 2002:a05:6a20:7289:b0:1a1:20b6:bf11 with SMTP id
 o9-20020a056a20728900b001a120b6bf11mr1597654pzk.50.1709638625359; 
 Tue, 05 Mar 2024 03:37:05 -0800 (PST)
X-Received: by 2002:a05:6a20:7289:b0:1a1:20b6:bf11 with SMTP id
 o9-20020a056a20728900b001a120b6bf11mr1597629pzk.50.1709638625027; 
 Tue, 05 Mar 2024 03:37:05 -0800 (PST)
Received: from smtpclient.apple ([203.163.238.152])
 by smtp.gmail.com with ESMTPSA id
 le8-20020a170902fb0800b001dc8db3150asm10357683plb.199.2024.03.05.03.36.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 03:37:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 15/19] smbios: error out when building type 4 table is not
 possible
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-16-imammedo@redhat.com>
Date: Tue, 5 Mar 2024 17:06:46 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <CC89DC43-048D-4C23-BF18-470BECA3140E@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-16-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z3NV2wtcF9sm



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> If SMBIOS v2 version is requested but number of cores/threads
> are more than it's possible to describe with v2, error out
> instead of silently ignoring the fact and filling core/thread
> count with bogus values.
>=20
> This will help caller to decide if it should fallback to
> SMBIOSv3 when smbios-entry-point-type=3D'auto'
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index e54a9f21e6..bf5c7a8885 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -605,7 +605,8 @@ static void smbios_build_type_3_table(void)
> }
>=20
> static void smbios_build_type_4_table(MachineState *ms, unsigned instance=
,
> -                                      SmbiosEntryPointType ep_type)
> +                                      SmbiosEntryPointType ep_type,
> +                                      Error **errp)
> {
>     char sock_str[128];
>     size_t tbl_len =3D SMBIOS_TYPE_4_LEN_V28;
> @@ -659,6 +660,12 @@ static void smbios_build_type_4_table(MachineState *=
ms, unsigned instance,
>     if (tbl_len =3D=3D SMBIOS_TYPE_4_LEN_V30) {
>         t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(cores_per_soc=
ket);
>         t->thread_count2 =3D cpu_to_le16(threads_per_socket);
> +    } else if (t->core_count =3D=3D 0xFF || t->thread_count =3D=3D 0xFF)=
 {
> +        error_setg(errp, "SMBIOS 2.0 doesn't support number of processor=
 "
> +                         "cores/threads more than 255, use "
> +                         "-machine smbios-entry-point-type=3D64 option t=
o enable "
> +                         "SMBIOS 3.0 support");
> +        return;
>     }
>=20
>     SMBIOS_BUILD_TABLE_POST;
> @@ -987,7 +994,10 @@ static bool smbios_get_tables_ep(MachineState *ms,
>     assert(ms->smp.sockets >=3D 1);
>=20
>     for (i =3D 0; i < ms->smp.sockets; i++) {
> -        smbios_build_type_4_table(ms, i, ep_type);
> +        smbios_build_type_4_table(ms, i, ep_type, errp);
> +        if (*errp) {
> +            goto err_exit;
> +        }
>     }
>=20
>     smbios_build_type_8_table();
> --=20
> 2.39.3
>=20

