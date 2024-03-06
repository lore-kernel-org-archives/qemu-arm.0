Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp327345ejb;
        Tue, 5 Mar 2024 22:49:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6eEMmqGLhGUVp3lYh/v7CmIUYVp45CrDOPh47Otzww0IaI9iUFEyMklc3t5m2T1eBLeGNKofV57M8vHep4a5ug70s9rri
X-Google-Smtp-Source: AGHT+IHLhB+CFq15BR6pT4CRC6v5kGerUZekLKh0tayetnWVqPpRy7nwa2cPBKpJhqexcn+Xe9mB
X-Received: by 2002:ac8:7e8f:0:b0:42e:f847:2dd4 with SMTP id w15-20020ac87e8f000000b0042ef8472dd4mr5092597qtj.10.1709707794601;
        Tue, 05 Mar 2024 22:49:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709707794; cv=none;
        d=google.com; s=arc-20160816;
        b=Ckge9wDB9eO2+DMu9Ax+wN7Gnh6HMDUXwfAowFGLdW3T5kNd/l4koh2sM69o54puqp
         B1OzbzT+IanquolrCfOEKXNl/ezzYfKOA8UZekzmf2ASaMa5+hQGXEzue6avSsMJYsHY
         q7pSglqKOMt9NeYliIoK4ZeEHoeiVVcEdbuveJ+ex9xuuyYr2kTYZteJ+ujGHE44n8ab
         gTtZE94FvkkHcjniwTo81aqQS6i+wFYeVCJV3GxxvKVr0cp5gkBa5CwnOXTtvYPS91LD
         WnFZn3Maj8OGME30Zo09OVwXlibEZNeAmY1cE9qGFHEFJ/BEtcR66f8P6diYEmJI491f
         NM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=sCaa7cwfjQf5Gxgli57snp84e9LJ0ihvkZac1GUYFdg=;
        fh=oXSzz/NWKq3WmajHbHAWrUxWMA0xmTSaBZ3cX6kbnM0=;
        b=ruXYYMi9oMWnEjaze8HZ6BkooV3+WPIxI6xuyAZk6YhC87JYMeMW4ABp0SFbkrW0Ou
         wLLlL1Xu7/EcV/yizcP7P9W3B7rr3s4SX+R0n39zs0CiwuVhm0WyFW3SGobaUOgaYefR
         nZ/8sTpf5pi3hAAAOyfm5Iu9EI9/jCncFqZRuYBlOgYKtElgeTy/v+f3mH1QlzRMYfCS
         ulenKZXITydnoFe9JmE7N7T6Ab78rJ1DqwaKOoH7GovqrRzCA3OdSCJ0oF0bmPhbn7Mn
         O7LkSU+u+V00vWWc1Y7C/sZ2L8xT9RLue8ctl8CeTI3A69Kl5qlj3qRwibwoNLF8xmv5
         fPEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iShl7VI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05622a118d00b0042ef851eb68si4764138qtk.746.2024.03.05.22.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 22:49:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iShl7VI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhl5Q-0006bh-D4; Wed, 06 Mar 2024 01:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhl56-0006Xi-3C
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 01:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhl54-0004dm-LY
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 01:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709707725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCaa7cwfjQf5Gxgli57snp84e9LJ0ihvkZac1GUYFdg=;
 b=iShl7VI+37RlOvTJnSTKTSXE8lFXq5uVkSA2rFxO0F8wEiPjBf72s0+XF575muP0LOo/NQ
 tBnG4c60sMhNUYR0HqqXMkiCyUutcPCqtKUX/MpXiqOFilb08Vzt7r+YgtW7Q8mGdMw4oC
 HOs0KSXqd3Fhg1+yGpakC5jN6q5OLfE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-nYmeT-H_PayH-XamS9AfzQ-1; Wed, 06 Mar 2024 01:48:44 -0500
X-MC-Unique: nYmeT-H_PayH-XamS9AfzQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-60832a48684so92095807b3.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 22:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709707724; x=1710312524;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amopS3vJStku62EOwJeUGTXSrh+CQIsD9NEthLDq1bc=;
 b=uRWR9DGE8oN9X3zuHGEmYwxUonCz9jynB/v1cepVvL6OfwClfgWXi2FiHhhj+vs6d3
 u9AqVfEzk6YdNpKenvrXt/+Q6bj9ioesdMGxcLeNL39kDW66AoADlbL9o026bIZQbKbo
 f41CmmZxquREf51svg9G7daBPBhdDivyUA4C/VdWaJTqoDdoFIluMQjweiiPQAFNSdEM
 ZxK6S9CSa79pNPGsKL+y65imykyjtBhsyDwHfIXfa+KF6m8up+pnx7JmyLWrwZ5iPzcZ
 WkSEFyxsbzESRyG8R0uX8LgL2kb/acdLde9//42j0PGOVFyYVrFfP2YLJfh4v0hfmJLW
 jDHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhS5i6NwpugtREQiysKcbeYzO9Nyv3oxWw73KizTk3n7udIuhS+UsAoe2Rew3N1r96ccdOF+iYHT3LAXCeOp3qjiAa
X-Gm-Message-State: AOJu0YxkZ9QGYAHoO+5OPubPKPO14F6X+U598hRf03vNxYIWpcsVl3ZM
 126ULjoQit5bvFMsmvg66W4lNiN3A8Zj2Ix3DuIpabtdI2/ZVFAIBPQtIKUDNQzYo2ZcSqXs8sR
 4DAn/Y5nKIPHm8pkxOKcGGsthFAMhWRKqmPFwPUS3a37cgs4/pg==
X-Received: by 2002:a0d:d341:0:b0:609:7354:6b11 with SMTP id
 v62-20020a0dd341000000b0060973546b11mr13962726ywd.52.1709707724051; 
 Tue, 05 Mar 2024 22:48:44 -0800 (PST)
X-Received: by 2002:a0d:d341:0:b0:609:7354:6b11 with SMTP id
 v62-20020a0dd341000000b0060973546b11mr13962707ywd.52.1709707723721; 
 Tue, 05 Mar 2024 22:48:43 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 lo12-20020a056a003d0c00b006e627d0e97bsm4081536pfb.181.2024.03.05.22.48.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 22:48:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 09/20] smbios: add smbios_add_usr_blob_size() helper
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-10-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 12:18:24 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <66FCEF16-5EC6-44CD-9EFF-595CF58A5C3A@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-10-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 7NxwMhqPVMQN



> On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> it will be used by follow up patch when legacy handling
> is moved out into a separate file.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 18 ++++++++++++++----
> 1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 97cf762228..01180bd82c 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1287,6 +1287,14 @@ static bool save_opt_list(size_t *ndest, char ***d=
est, QemuOpts *opts,
>     return true;
> }
>=20
> +static void smbios_add_usr_blob_size(size_t size)
> +{
> +    if (!usr_blobs_sizes) {
> +        usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t));
> +    }
> +    g_array_append_val(usr_blobs_sizes, size);
> +}
> +
> void smbios_entry_add(QemuOpts *opts, Error **errp)
> {
>     const char *val;
> @@ -1334,10 +1342,12 @@ void smbios_entry_add(QemuOpts *opts, Error **err=
p)
>             smbios_type4_count++;
>         }
>=20
> -        if (!usr_blobs_sizes) {
> -            usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t)=
);
> -        }
> -        g_array_append_val(usr_blobs_sizes, size);
> +        /*
> +         * preserve blob size for legacy mode so it could build its
> +         * blobs flavor from 'usr_blobs'
> +         */
> +        smbios_add_usr_blob_size(size);
> +
>         usr_blobs_len +=3D size;
>         if (size > usr_table_max) {
>             usr_table_max =3D size;
> --=20
> 2.39.3
>=20

