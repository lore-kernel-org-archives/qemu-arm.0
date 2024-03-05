Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp242380ejc;
        Tue, 5 Mar 2024 04:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxBPE4q9VQMpOj2YaevfoU4MEdrOsdnVY0RkUNMZ/W/Hr/ulFGm24bz3EH/UPDhdGMsD56wVMOErIdBcKNgEKIxeW48a85
X-Google-Smtp-Source: AGHT+IGr4b2Aj8of1A4kv0xOClKqLJMBo9qEa5KYANHrjVzvY5GbfzfylhioCId7/+WvRBH4Az8E
X-Received: by 2002:a05:622a:170e:b0:42e:f865:e225 with SMTP id h14-20020a05622a170e00b0042ef865e225mr1935130qtk.36.1709641302232;
        Tue, 05 Mar 2024 04:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709641302; cv=none;
        d=google.com; s=arc-20160816;
        b=uVrcttHyn4Cw8BOD7UIymEiPb/evwakLLSaIyT07MHncLPW05zkPezkuaBYYe/+cFS
         XxLO1FNh86/fPhOzc5/jT+L3C8kbLURubUtQ6OhDpvFvqBtSYfz7UiK+YT8AU6s0lxhA
         qOAt+bkRNATpcJIelekrpBohIQxFphBAKJ/B0g5MaBN6d58OlWP0H005n3cmiNW7ZO18
         ScpuxzPH+C7WbABqz7t0XTbNDEjY4UWM5fBLgG43AmZmHnLDvH+xOLsJ8vIoGuZSn3qw
         /JoM+ayGq3Xj4buFVY0VvTcyz97cqc+07eKFu2kpj/CIxa2CzBdtiu+qAwcUwabmNHvU
         9TsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=RAjdxLQTy3Ft1cFCeEt0OWnunJxMkypAizmH685dhkk=;
        fh=V9MOcdVJOpHF0D9iycs3VgRtUV3wbB4KmRiqY+FEcjM=;
        b=EIQSQxhr5mNa9/CA3Xeq7Wzr6DvjmINnUesz92d6ZQNy8wcDiXzBunwxKFlJjQkrNS
         e3W44GXtVF7//myuY5yas0ThNqSj/q8uIuGKs998euzDSoLoc5lGsQywnl/RbOFrwEfP
         2o6mbQPJ4HyB3iMZMAgvqsOfcF1VayI3wo//eAk1I2djNhEub7O/gWLNhf0orGKXrPQr
         Zsjcg++lkYBebs2BVToSIXUE7cW29fAVlrwPv7NDfLsw4LYNETsVUYiIEX7ZkaKv+hx3
         Z3TAa5yPf5JbfOr3bZocf4/xaWguW28LTGoaB5DjysoUDNIx+/ieBM9vEcfqV5XRMrQy
         mZjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CyYph8Jd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05622a010f00b0042e8ce272dfsi12059341qtw.297.2024.03.05.04.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 04:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CyYph8Jd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhTng-0006bu-8N; Tue, 05 Mar 2024 07:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhTne-0006OW-F5
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 07:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhTnc-0004Pf-Fl
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 07:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709641295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAjdxLQTy3Ft1cFCeEt0OWnunJxMkypAizmH685dhkk=;
 b=CyYph8Jdt5ywqxGQPnEMHPhNEj7wcrfaSM12flJKvytifi+UCMvBWS4prNDM9YljeKVC3z
 tPs4Hm0oY6dyKVhCBwpk8pjihQOA9i9RJp7JYPWkHgI8y1lSNvkdqNx/APilxgSyQfuGXp
 CJ/Z1maZ/t91kAP/yWQFh/C1275QxQA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-WdGgB8dXMKedoAPZVIgpVg-1; Tue, 05 Mar 2024 07:21:33 -0500
X-MC-Unique: WdGgB8dXMKedoAPZVIgpVg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1dccd8076b0so65538795ad.0
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 04:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641292; x=1710246092;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuCTE5dR2LeiJCLJ3DPa9+R29o0fzWp8dhviYMi5D68=;
 b=o5n8wF5NbOcWP3qFjE6Cvl94KBPoPGK2WSo2Ah0eufHBmDkn9Y700/8eoP3f51/Yxo
 NZnmA/+6hzHa25iycIz3+P2Tp0x6d8mf7d/UcEKS7vllDXyDkLHTRZ29IQXLmEw+aeYu
 MZgpi5fTOw+znDB0xAHEnDt6lIb5YTZt/PvMO80ScjSx6ZZF4rMozhnDo2eoYppTUZrv
 8XQKGCGbyP8MlHW6Un7tnpSlfHE/sOMLUwxfSSjalK8h5/AIxa9on5EYYQUNxrR5WKpF
 uFOKKRQ8Y+PkMhdknhjb+uDDKh0ANiu2o6k8OBHnQ1iIFu7r5NBphNw5lsyCc16XomC+
 J15A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKKpX+iDEew95LDEH9UBsPNEERqizjq//MSIzhel5f2LEXCfLgcftiLNWx0ubAjzzVk5OoHTHYGrHC+4K0NpPKxwNR
X-Gm-Message-State: AOJu0YylrDsOW3nBPp4K3uI9qEbqR5BnP++U7glM0vaHtCEkycja5CZ7
 1sC6S7IXBA1y0UI+JsUXgFZBknK/xk2KBZWuNXeOiNmxotcEChKdrK3vS9pj2ajvky3N3Dc8hqv
 4OKqAlSre6kh8mfhHHqAVY+8EruPBKZVxwQvKVJzJHJr03YiIIQ==
X-Received: by 2002:a17:902:ec88:b0:1dd:911:19b1 with SMTP id
 x8-20020a170902ec8800b001dd091119b1mr1886164plg.19.1709641292561; 
 Tue, 05 Mar 2024 04:21:32 -0800 (PST)
X-Received: by 2002:a17:902:ec88:b0:1dd:911:19b1 with SMTP id
 x8-20020a170902ec8800b001dd091119b1mr1886153plg.19.1709641292252; 
 Tue, 05 Mar 2024 04:21:32 -0800 (PST)
Received: from smtpclient.apple ([203.163.238.152])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a170902d48700b001db5079b705sm10400830plg.36.2024.03.05.04.21.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 04:21:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 18/19] pc/q35: set SMBIOS entry point type to 'auto' by
 default
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-19-imammedo@redhat.com>
Date: Tue, 5 Mar 2024 17:51:14 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <B21B8627-97D5-4047-97BF-963F3CA57DCA@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-19-imammedo@redhat.com>
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
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
X-TUID: 0k1nb4o3uxMj



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> Use smbios-entry-point-type=3D'auto' for newer machine types as a workaro=
und
> for Windows not detecting SMBIOS tables. Which makes QEMU pick SMBIOS tab=
les
> based on configuration (with 2.x preferred and fallback to 3.x if the for=
mer
> isn't compatible with configuration)
>=20
> Default compat setting of smbios-entry-point-type after series
> for pc/q35 machines:
>  * 9.0-newer: 'auto'
>  * 8.1-8.2: '64'
>  * 8.0-older: '32'
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2008
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/i386/pc.c      | 2 +-
> hw/i386/pc_piix.c | 4 ++++
> hw/i386/pc_q35.c  | 3 +++
> 3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 56562e7d9e..2f69dfd0a8 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1831,7 +1831,7 @@ static void pc_machine_class_init(ObjectClass *oc, =
void *data)
>     mc->nvdimm_supported =3D true;
>     mc->smp_props.dies_supported =3D true;
>     mc->default_ram_id =3D "pc.ram";
> -    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_AUTO;
>=20
>     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
>         pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_4g,
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ec7c07b362..f9da942c55 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -535,12 +535,16 @@ DEFINE_I440FX_MACHINE(v9_0, "pc-i440fx-9.0", NULL,
>=20
> static void pc_i440fx_8_2_machine_options(MachineClass *m)
> {
> +    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> +
>     pc_i440fx_9_0_machine_options(m);
>     m->alias =3D NULL;
>     m->is_default =3D false;
>=20
>     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
>     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
> +    /* For pc-i44fx-8.2 and 8.1, use SMBIOS 3.X by default */
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> }
>=20
> DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 53fb3db26d..da3f92bea7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -371,10 +371,13 @@ DEFINE_Q35_MACHINE(v9_0, "pc-q35-9.0", NULL,
>=20
> static void pc_q35_8_2_machine_options(MachineClass *m)
> {
> +    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>     pc_q35_9_0_machine_options(m);
>     m->alias =3D NULL;
>     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
>     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
> +    /* For pc-q35-8.2 and 8.1, use SMBIOS 3.X by default */
> +    pcmc->default_smbios_ep_type =3D SMBIOS_ENTRY_POINT_TYPE_64;
> }
>=20
> DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
> --=20
> 2.39.3
>=20

