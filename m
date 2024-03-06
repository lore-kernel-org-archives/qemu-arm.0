Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp341541ejb;
        Tue, 5 Mar 2024 23:28:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzs3qpkuPltWKYMVhOJOSTftRuJNP6vYIY//hidxaa9RX3h+sVZVW9n/SdGa+PwIDS7/YoxG9NRC/isUyQmTrbe7mMcI/+
X-Google-Smtp-Source: AGHT+IG93jwSrI7WDPZJTrDvmbrfjdN36RoRsWs9sciSAM3bVJbQFx4RgMqWNT8MUojQsV0xh0K0
X-Received: by 2002:a0c:e185:0:b0:690:7e5a:5e2f with SMTP id p5-20020a0ce185000000b006907e5a5e2fmr4409973qvl.20.1709710101745;
        Tue, 05 Mar 2024 23:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709710101; cv=none;
        d=google.com; s=arc-20160816;
        b=KFnJLZAGLEp0WPIglJz1G2BOTw/Gp6qDsFvrWrJBXo8BbPFXdnAvaj+qUuvi2Km7pa
         Tzcb+GknqkoXpj+fhKTG/cfSOA3+6or4UrqR45LZFXzsUC71g6P1Fy0kh1gix8zdXLGt
         b+gYZ/bIzFiEtl6qyatWMXtZw9sNk4jyh/biJPNZBBeMcbVCSms/7gMY8WcqOSFmZo79
         4t72RRw4lAcgnCr6BX56zzsTG4nf5Quyge3+DUgQjMpHDDzQJhztcjZzyXOc16XrsN6g
         WcOg2/7bZhlqRMw6Lsqhd0hRz67ifFQhdAhznrG0muOtbikYlwMKh9FILzhVyTzHtXd1
         HstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=LlQF68IQFh7N2TUJFeb3tap4d0+BWq3Jhhr81gz51Ns=;
        fh=xX65MlYs9o0VSairO03qSNLQGnDto+s+xGE/tu9A2Yc=;
        b=mZQ6Q6TdRWP4LcZOWdK8EBpBgJ2gm6xnr6nKe1Qn9byXx/aJuHGs0XS01HwYsmopwI
         Axk9lYaoQQoJlF5QFAT468s8lHuWdUKlVmwQsgbLdMckOMb8yaMhAW/SSC/DE84JPWxC
         YV8ku2tLdgLxqFgAKCuvdjRBBDzEy0RYqHFCZA5KiMts2pK9onEyuKdn/ZFSJvXMZ2eV
         Xnip1celTJ+0blbV8KImSZltyeHwo2ymknpyyHqQybUBgRr9IPSwdh0qSTpQW+4lTKAj
         jm0aLGGmze0aqMxHtxgXITxD5cfimpkYgOX3qGF0rzoAg0wXATZer/WYvN3O9mM8+QdE
         Y57g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0oDJx0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a0562140ccb00b0068f34f6c1b8si14116434qvx.14.2024.03.05.23.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 23:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0oDJx0R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhlhI-0007CB-La; Wed, 06 Mar 2024 02:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhlhF-0007C1-Ij
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 02:28:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhlhC-00037V-VZ
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 02:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709710089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlQF68IQFh7N2TUJFeb3tap4d0+BWq3Jhhr81gz51Ns=;
 b=a0oDJx0RGy/jJDzQ5lNcGlw9oTupsAO4NWD6rJpHzKJdSzJMFXdDOf5l8AiPaY3Qt28sid
 uuobCnXmr/qofs9xrRz6riVv6kLJlG3sYZOv8GrVvBpGD3Um4inTlRd+ie/iSh3KBPcBeO
 I2RBnoydOhmNCGpEO29COEy3GA90Tpk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-qvko84tSNIeW1kaChokdvQ-1; Wed, 06 Mar 2024 02:28:08 -0500
X-MC-Unique: qvko84tSNIeW1kaChokdvQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6e575edafbeso4712739b3a.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 23:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709710085; x=1710314885;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFsYZDlrERx+FL9j9xIiMQijsJBRwzfY9+l04hsVCzY=;
 b=beRcC0amfTFJuGiv873mo89OHHjzgPuWtDtgTwxHRyOwHVBQWjEC+vu3eq0AZ2BRr4
 MVM9TJDB4xvy7b44WNujOF+7qAPDAW8d+Z6OWtRJaXF0BohYiAl069MrdIaFu1CZoK1x
 NVmTe3i+USmqCv1IGGD8+/HExped6olSOYw0uWI5ftC1cHgJfK11hFahIrBoejOC2r9E
 dQr8TmRzWjIiGs23xi+upVQq5NUs/1+c56vUa5oLKbbGDrP9fErRh2yps1005GiRvcCC
 0/SQKOt+r4iPe+9CqF3XCN4xwS5gv6bBooAKYS2zrKylKXAPQxxkaEuCV0Ln1/RVZKBI
 SEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSrmxSf1ypiHoBIXb9KRyefRUW/Cp4TTTH6RAurfVahzqdyEZVn6w/47PGMbD2EYmbqaFjrADp0dWogKRqVWRdK7Kb
X-Gm-Message-State: AOJu0YxQgbg0FICEbi/PijGQnoTAZDipdUVqVm1okQO9O9UKGZeZQmPT
 3+lxz/CovBaql0B2BPvPwjeu3TQQ23fdMN/IFLcPFVnkestlhh2jOzalnjHLbCRgoU56ANgKByY
 xN5Hle9K2m1PCYHzDaXXbRym8+s/DhmpEon3elmbdLNruH//tTw==
X-Received: by 2002:a05:6a20:c4a8:b0:1a1:4ec7:d3fb with SMTP id
 eo40-20020a056a20c4a800b001a14ec7d3fbmr3235218pzb.58.1709710085520; 
 Tue, 05 Mar 2024 23:28:05 -0800 (PST)
X-Received: by 2002:a05:6a20:c4a8:b0:1a1:4ec7:d3fb with SMTP id
 eo40-20020a056a20c4a800b001a14ec7d3fbmr3235200pzb.58.1709710085153; 
 Tue, 05 Mar 2024 23:28:05 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a62e410000000b006e46047fe04sm10126410pfh.204.2024.03.05.23.27.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 23:28:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 11/20] smbios: build legacy mode code only for 'pc'
 machine
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-12-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 12:57:47 +0530
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
Message-Id: <DE550091-7675-40D6-9651-97E090DF767B@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-12-imammedo@redhat.com>
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
X-TUID: z6SBVj3VtlMh



> On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> basically moving code around without functional change.
> And exposing some symbols so that they could be shared
> between smbbios.c and new smbios_legacy.c
>=20
> plus some meson magic to build smbios_legacy.c only
> for 'pc' machine and otherwise replace it with stub
> if not selected.

When I apply this, I get:

Applying: smbios: build legacy mode code only for 'pc' machine
.git/rebase-apply/patch:483: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Can you please look into this? Modulo that,

>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> v2:
>  moved type0/type1/have_binfile_bitmap/have_fields_bitmap rename into
>  a separate patch
> ---
> include/hw/firmware/smbios.h   |   5 +
> hw/i386/Kconfig                |   1 +
> hw/smbios/Kconfig              |   2 +
> hw/smbios/meson.build          |   4 +
> hw/smbios/smbios.c             | 164 +-----------------------------
> hw/smbios/smbios_legacy.c      | 179 +++++++++++++++++++++++++++++++++
> hw/smbios/smbios_legacy_stub.c |  16 +++
> 7 files changed, 208 insertions(+), 163 deletions(-)
> create mode 100644 hw/smbios/smbios_legacy.c
> create mode 100644 hw/smbios/smbios_legacy_stub.c
>=20
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index bea5c3f1b1..7f47475aa4 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -17,6 +17,9 @@
>  *
>  */
>=20
> +extern uint8_t *usr_blobs;
> +extern GArray *usr_blobs_sizes;
> +
> typedef struct {
>     const char *vendor, *version, *date;
>     bool have_major_minor, uefi;
> @@ -306,6 +309,8 @@ struct smbios_type_127 {
>     struct smbios_structure_header header;
> } QEMU_PACKED;
>=20
> +void smbios_validate_table(void);
> +void smbios_add_usr_blob_size(size_t size);
> void smbios_entry_add(QemuOpts *opts, Error **errp);
> void smbios_set_cpuid(uint32_t version, uint32_t features);
> void smbios_set_defaults(const char *manufacturer, const char *product,
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index a1846be6f7..a6ee052f9a 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -76,6 +76,7 @@ config I440FX
>     select PIIX
>     select DIMM
>     select SMBIOS
> +    select SMBIOS_LEGACY
>     select FW_CFG_DMA
>=20
> config ISAPC
> diff --git a/hw/smbios/Kconfig b/hw/smbios/Kconfig
> index 553adf4bfc..8d989a2f1b 100644
> --- a/hw/smbios/Kconfig
> +++ b/hw/smbios/Kconfig
> @@ -1,2 +1,4 @@
> config SMBIOS
>     bool
> +config SMBIOS_LEGACY
> +    bool
> diff --git a/hw/smbios/meson.build b/hw/smbios/meson.build
> index 7046967462..a59039f669 100644
> --- a/hw/smbios/meson.build
> +++ b/hw/smbios/meson.build
> @@ -4,5 +4,9 @@ smbios_ss.add(when: 'CONFIG_IPMI',
>               if_true: files('smbios_type_38.c'),
>               if_false: files('smbios_type_38-stub.c'))
>=20
> +smbios_ss.add(when: 'CONFIG_SMBIOS_LEGACY',
> +              if_true: files('smbios_legacy.c'),
> +              if_false: files('smbios_legacy_stub.c'))
> +
> system_ss.add_all(when: 'CONFIG_SMBIOS', if_true: smbios_ss)
> system_ss.add(when: 'CONFIG_SMBIOS', if_false: files('smbios-stub.c'))
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 86cf66b5ce..fb1f05fcde 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -31,38 +31,12 @@
> #include "hw/pci/pci_device.h"
> #include "smbios_build.h"
>=20
> -/* legacy structures and constants for <=3D 2.0 machines */
> -struct smbios_header {
> -    uint16_t length;
> -    uint8_t type;
> -} QEMU_PACKED;
> -
> -struct smbios_field {
> -    struct smbios_header header;
> -    uint8_t type;
> -    uint16_t offset;
> -    uint8_t data[];
> -} QEMU_PACKED;
> -
> -struct smbios_table {
> -    struct smbios_header header;
> -    uint8_t data[];
> -} QEMU_PACKED;
> -
> -#define SMBIOS_FIELD_ENTRY 0
> -#define SMBIOS_TABLE_ENTRY 1
> -
> -static uint8_t *smbios_entries;
> -static size_t smbios_entries_len;
> static bool smbios_uuid_encoded =3D true;
> -/* end: legacy structures & constants for <=3D 2.0 machines */
> -
> /*
>  * SMBIOS tables provided by user with '-smbios file=3D<foo>' option
>  */
> uint8_t *usr_blobs;
> size_t usr_blobs_len;
> -static GArray *usr_blobs_sizes;
> static unsigned usr_table_max;
> static unsigned usr_table_cnt;
>=20
> @@ -483,7 +457,7 @@ static void smbios_check_type4_count(uint32_t expecte=
d_t4_count)
>     }
> }
>=20
> -static void smbios_validate_table(void)
> +void smbios_validate_table(void)
> {
>     if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_32 &&
>         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> @@ -493,134 +467,6 @@ static void smbios_validate_table(void)
>     }
> }
>=20
> -
> -/* legacy setup functions for <=3D 2.0 machines */
> -static void smbios_add_field(int type, int offset, const void *data, siz=
e_t len)
> -{
> -    struct smbios_field *field;
> -
> -    if (!smbios_entries) {
> -        smbios_entries_len =3D sizeof(uint16_t);
> -        smbios_entries =3D g_malloc0(smbios_entries_len);
> -    }
> -    smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len +
> -                                                  sizeof(*field) + len);
> -    field =3D (struct smbios_field *)(smbios_entries + smbios_entries_le=
n);
> -    field->header.type =3D SMBIOS_FIELD_ENTRY;
> -    field->header.length =3D cpu_to_le16(sizeof(*field) + len);
> -
> -    field->type =3D type;
> -    field->offset =3D cpu_to_le16(offset);
> -    memcpy(field->data, data, len);
> -
> -    smbios_entries_len +=3D sizeof(*field) + len;
> -    (*(uint16_t *)smbios_entries) =3D
> -            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> -}
> -
> -static void smbios_maybe_add_str(int type, int offset, const char *data)
> -{
> -    if (data) {
> -        smbios_add_field(type, offset, data, strlen(data) + 1);
> -    }
> -}
> -
> -static void smbios_build_type_0_fields(void)
> -{
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, vendor_str),
> -                         smbios_type0.vendor);
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, bios_version_=
str),
> -                         smbios_type0.version);
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0,
> -                                     bios_release_date_str),
> -                         smbios_type0.date);
> -    if (smbios_type0.have_major_minor) {
> -        smbios_add_field(0, offsetof(struct smbios_type_0,
> -                                     system_bios_major_release),
> -                         &smbios_type0.major, 1);
> -        smbios_add_field(0, offsetof(struct smbios_type_0,
> -                                     system_bios_minor_release),
> -                         &smbios_type0.minor, 1);
> -    }
> -}
> -
> -static void smbios_build_type_1_fields(void)
> -{
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, manufacturer_=
str),
> -                         smbios_type1.manufacturer);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, product_name_=
str),
> -                         smbios_type1.product);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, version_str),
> -                         smbios_type1.version);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, serial_number=
_str),
> -                         smbios_type1.serial);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, sku_number_st=
r),
> -                         smbios_type1.sku);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, family_str),
> -                         smbios_type1.family);
> -    if (qemu_uuid_set) {
> -        /* We don't encode the UUID in the "wire format" here because th=
is
> -         * function is for legacy mode and needs to keep the guest ABI, =
and
> -         * because we don't know what's the SMBIOS version advertised by=
 the
> -         * BIOS.
> -         */
> -        smbios_add_field(1, offsetof(struct smbios_type_1, uuid),
> -                         &qemu_uuid, 16);
> -    }
> -}
> -
> -uint8_t *smbios_get_table_legacy(size_t *length)
> -{
> -    int i;
> -    size_t usr_offset;
> -
> -    /* also complain if fields were given for types > 1 */
> -    if (find_next_bit(smbios_have_fields_bitmap,
> -                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
> -        error_report("can't process fields for smbios "
> -                     "types > 1 on machine versions < 2.1!");
> -        exit(1);
> -    }
> -
> -    if (test_bit(4, smbios_have_binfile_bitmap)) {
> -        error_report("can't process table for smbios "
> -                     "type 4 on machine versions < 2.1!");
> -        exit(1);
> -    }
> -
> -    g_free(smbios_entries);
> -    smbios_entries_len =3D sizeof(uint16_t);
> -    smbios_entries =3D g_malloc0(smbios_entries_len);
> -
> -    for (i =3D 0, usr_offset =3D 0; usr_blobs_sizes && i < usr_blobs_siz=
es->len;
> -         i++)
> -    {
> -        struct smbios_table *table;
> -        struct smbios_structure_header *header;
> -        size_t size =3D g_array_index(usr_blobs_sizes, size_t, i);
> -
> -        header =3D (struct smbios_structure_header *)(usr_blobs + usr_of=
fset);
> -        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len =
+
> -                                                   size + sizeof(*table)=
);
> -        table =3D (struct smbios_table *)(smbios_entries + smbios_entrie=
s_len);
> -        table->header.type =3D SMBIOS_TABLE_ENTRY;
> -        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
> -        memcpy(table->data, header, size);
> -        smbios_entries_len +=3D sizeof(*table) + size;
> -        (*(uint16_t *)smbios_entries) =3D
> -            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> -        usr_offset +=3D size;
> -    }
> -
> -    smbios_build_type_0_fields();
> -    smbios_build_type_1_fields();
> -    smbios_validate_table();
> -    *length =3D smbios_entries_len;
> -    return smbios_entries;
> -}
> -/* end: legacy setup functions for <=3D 2.0 machines */
> -
> -
> bool smbios_skip_table(uint8_t type, bool required_table)
> {
>     if (test_bit(type, smbios_have_binfile_bitmap)) {
> @@ -1279,14 +1125,6 @@ static bool save_opt_list(size_t *ndest, char ***d=
est, QemuOpts *opts,
>     return true;
> }
>=20
> -static void smbios_add_usr_blob_size(size_t size)
> -{
> -    if (!usr_blobs_sizes) {
> -        usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t));
> -    }
> -    g_array_append_val(usr_blobs_sizes, size);
> -}
> -
> void smbios_entry_add(QemuOpts *opts, Error **errp)
> {
>     const char *val;
> diff --git a/hw/smbios/smbios_legacy.c b/hw/smbios/smbios_legacy.c
> new file mode 100644
> index 0000000000..21f143e738
> --- /dev/null
> +++ b/hw/smbios/smbios_legacy.c
> @@ -0,0 +1,179 @@
> +/*
> + * SMBIOS legacy support
> + *
> + * Copyright (C) 2009 Hewlett-Packard Development Company, L.P.
> + * Copyright (C) 2013 Red Hat, Inc.
> + *
> + * Authors:
> + *  Alex Williamson <alex.williamson@hp.com>
> + *  Markus Armbruster <armbru@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bswap.h"
> +#include "hw/firmware/smbios.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/error-report.h"
> +
> +struct smbios_header {
> +    uint16_t length;
> +    uint8_t type;
> +} QEMU_PACKED;
> +
> +struct smbios_field {
> +    struct smbios_header header;
> +    uint8_t type;
> +    uint16_t offset;
> +    uint8_t data[];
> +} QEMU_PACKED;
> +
> +struct smbios_table {
> +    struct smbios_header header;
> +    uint8_t data[];
> +} QEMU_PACKED;
> +
> +#define SMBIOS_FIELD_ENTRY 0
> +#define SMBIOS_TABLE_ENTRY 1
> +
> +static uint8_t *smbios_entries;
> +static size_t smbios_entries_len;
> +GArray *usr_blobs_sizes;
> +
> +void smbios_add_usr_blob_size(size_t size)
> +{
> +    if (!usr_blobs_sizes) {
> +        usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t));
> +    }
> +    g_array_append_val(usr_blobs_sizes, size);
> +}
> +
> +static void smbios_add_field(int type, int offset, const void *data, siz=
e_t len)
> +{
> +    struct smbios_field *field;
> +
> +    if (!smbios_entries) {
> +        smbios_entries_len =3D sizeof(uint16_t);
> +        smbios_entries =3D g_malloc0(smbios_entries_len);
> +    }
> +    smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len +
> +                                                  sizeof(*field) + len);
> +    field =3D (struct smbios_field *)(smbios_entries + smbios_entries_le=
n);
> +    field->header.type =3D SMBIOS_FIELD_ENTRY;
> +    field->header.length =3D cpu_to_le16(sizeof(*field) + len);
> +
> +    field->type =3D type;
> +    field->offset =3D cpu_to_le16(offset);
> +    memcpy(field->data, data, len);
> +
> +    smbios_entries_len +=3D sizeof(*field) + len;
> +    (*(uint16_t *)smbios_entries) =3D
> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> +}
> +
> +static void smbios_maybe_add_str(int type, int offset, const char *data)
> +{
> +    if (data) {
> +        smbios_add_field(type, offset, data, strlen(data) + 1);
> +    }
> +}
> +
> +static void smbios_build_type_0_fields(void)
> +{
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, vendor_str),
> +                         smbios_type0.vendor);
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, bios_version_=
str),
> +                         smbios_type0.version);
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0,
> +                                     bios_release_date_str),
> +                         smbios_type0.date);
> +    if (smbios_type0.have_major_minor) {
> +        smbios_add_field(0, offsetof(struct smbios_type_0,
> +                                     system_bios_major_release),
> +                         &smbios_type0.major, 1);
> +        smbios_add_field(0, offsetof(struct smbios_type_0,
> +                                     system_bios_minor_release),
> +                         &smbios_type0.minor, 1);
> +    }
> +}
> +
> +static void smbios_build_type_1_fields(void)
> +{
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, manufacturer_=
str),
> +                         smbios_type1.manufacturer);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, product_name_=
str),
> +                         smbios_type1.product);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, version_str),
> +                         smbios_type1.version);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, serial_number=
_str),
> +                         smbios_type1.serial);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, sku_number_st=
r),
> +                         smbios_type1.sku);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, family_str),
> +                         smbios_type1.family);
> +    if (qemu_uuid_set) {
> +        /*
> +         * We don't encode the UUID in the "wire format" here because th=
is
> +         * function is for legacy mode and needs to keep the guest ABI, =
and
> +         * because we don't know what's the SMBIOS version advertised by=
 the
> +         * BIOS.
> +         */
> +        smbios_add_field(1, offsetof(struct smbios_type_1, uuid),
> +                         &qemu_uuid, 16);
> +    }
> +}
> +
> +uint8_t *smbios_get_table_legacy(size_t *length)
> +{
> +    int i;
> +    size_t usr_offset;
> +
> +    /* complain if fields were given for types > 1 */
> +    if (find_next_bit(smbios_have_fields_bitmap,
> +                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
> +        error_report("can't process fields for smbios "
> +                     "types > 1 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
> +    if (test_bit(4, smbios_have_binfile_bitmap)) {
> +        error_report("can't process table for smbios "
> +                     "type 4 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
> +    g_free(smbios_entries);
> +    smbios_entries_len =3D sizeof(uint16_t);
> +    smbios_entries =3D g_malloc0(smbios_entries_len);
> +
> +    for (i =3D 0, usr_offset =3D 0; usr_blobs_sizes && i < usr_blobs_siz=
es->len;
> +         i++)
> +    {
> +        struct smbios_table *table;
> +        struct smbios_structure_header *header;
> +        size_t size =3D g_array_index(usr_blobs_sizes, size_t, i);
> +
> +        header =3D (struct smbios_structure_header *)(usr_blobs + usr_of=
fset);
> +        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len =
+
> +                                                   size + sizeof(*table)=
);
> +        table =3D (struct smbios_table *)(smbios_entries + smbios_entrie=
s_len);
> +        table->header.type =3D SMBIOS_TABLE_ENTRY;
> +        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
> +        memcpy(table->data, header, size);
> +        smbios_entries_len +=3D sizeof(*table) + size;
> +        (*(uint16_t *)smbios_entries) =3D
> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> +        usr_offset +=3D size;
> +    }
> +
> +    smbios_build_type_0_fields();
> +    smbios_build_type_1_fields();
> +    smbios_validate_table();
> +    *length =3D smbios_entries_len;
> +    return smbios_entries;
> +}
> diff --git a/hw/smbios/smbios_legacy_stub.c b/hw/smbios/smbios_legacy_stu=
b.c
> new file mode 100644
> index 0000000000..91e6c75029
> --- /dev/null
> +++ b/hw/smbios/smbios_legacy_stub.c
> @@ -0,0 +1,16 @@
> +/*
> + * IPMI SMBIOS firmware handling
> + *
> + * Copyright (c) 2024 Igor Mammedov, Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/firmware/smbios.h"
> +
> +void smbios_add_usr_blob_size(size_t size)
> +{
> +}
> +
> --=20
> 2.39.3
>=20

