Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp348037ejb;
        Tue, 5 Mar 2024 23:48:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmliH7YGZcE7XleeojDJRm+7g0Xl7ZKwxcjU2FouMqv2e2LKeYgQPowUvY0Ylm76ULh1LudOrSwMPVNLkh3BCmjBWQovIS
X-Google-Smtp-Source: AGHT+IEIazQe/FKto5snNXw93Ew7hobsn1OBY4iSK4+8/5/eDNnJf5gmqAbiQUj6SzNo2lfL/hFH
X-Received: by 2002:a05:620a:244a:b0:788:22ab:1cc5 with SMTP id h10-20020a05620a244a00b0078822ab1cc5mr7445670qkn.36.1709711323817;
        Tue, 05 Mar 2024 23:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709711323; cv=none;
        d=google.com; s=arc-20160816;
        b=dZuZy5qotK4HkKks/PIa+6OirYc3ewkmazu00FMH94an+b4LO/DPS2pu3n6OYz9fLl
         QrTIrlibObUWbgsNPyaU0Joecsl84Et1fyn4k5E7JftOcpmGOSGPAJcNP3JT9LE9SfCd
         xo1MVtcf73r/B/HQvR44w9WDTTf8V7E87K9FQViO51jGfcZMuR2Av+VvJLiPjfeqLBFG
         0AFu7siCk8aWEFkWjT7NG57si0c1TbWefZJ63AzbW0d01mrMiUu4sr5CHwNHHLwN+4en
         WumevyPUlTuf9wheUS9gv4XstwekqpzBLub11rlyFITQ0PcsWOwupP1oxhPHaHulHwIT
         tcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=szLotHqHrLAWgY/IdU0Id4a22ZuDv3jSIc1NZf1CiDk=;
        fh=JHYG3bu/CxROEe/PdmQdUgmES46iiw/HdM8xXf3Kk20=;
        b=SsrBEYW5bmjnJ/MB/8DMFtfD9Gap0tGfvtX0xIbGXgFjx1niLKp0vFpbm7iBK+Mg6F
         y1pyaq2pDsNf74XwC3e4InANaXsGODGg0IxVwiZnaucbHjQ99jgJaUKfuTfS6yKiq61o
         jze4POp2FZJL+bhoJdtwFdIC16SP0ULTXII4BTqKkvrjX/cyZWlBDn44/lg8iN0pCNDa
         hqLnJC1Cxrg3nufjSgM74Ee2qyKJUEEUBhSrxMVjzGkShXB0AW4zSEAuXhGY26xT5r9a
         4oF2wqYxSYiDCHhj46VcOPgXs7ENqK4hd9uFRGKlg5jvWZIUMch9utDh5szt2IWPBUod
         7hIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLzoY0rL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25-20020a05620a113900b0078823ff433dsi7435147qkk.9.2024.03.05.23.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 23:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLzoY0rL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhm0S-0002P4-Lw; Wed, 06 Mar 2024 02:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhm0R-0002OT-27
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 02:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhm0P-0004j7-Ed
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 02:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709711280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szLotHqHrLAWgY/IdU0Id4a22ZuDv3jSIc1NZf1CiDk=;
 b=dLzoY0rLh7HhxlxjrRATcDfGSYh0yILHlx0/DpYzBChcfPw0lvdtTIOmuR6rGLF60FnrM1
 6svKYkJQKMQ61ddfkwwkdyEd79yGMN0yVJWx8IUO7plq43y9y9iGpzleY1PA/0Oey3JTKq
 Z0cdrV27QZ3gyqZaPXfOd+BF6Q39myw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-GyWUGp2aNWO6oEgyo_r5NQ-1; Wed, 06 Mar 2024 02:47:58 -0500
X-MC-Unique: GyWUGp2aNWO6oEgyo_r5NQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1dbe3ca6bb7so4048935ad.0
 for <qemu-devel@nongnu.org>; Tue, 05 Mar 2024 23:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709711277; x=1710316077;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szLotHqHrLAWgY/IdU0Id4a22ZuDv3jSIc1NZf1CiDk=;
 b=Vpx/ldHjzhHOkuENS5NbAQ1Wh6s0lsl8KHN5rcnRWYOUbtyRZdDRxdrSWEhc6PCcXo
 d0gvpZ2+6jMIc7qYiySykc8nF/5T+sCCt48dkpImw0X+0UmhalSabT7ziKAFBKy147lB
 fb7Ya/IJ8xhw986d8ZDiStaatUII5pAdP6AA8d9kfcUXZ8VXN9sSTRPSTZjiZZPsCpob
 txm62kAwJf8YQ2xA9qW7Ko5pe4z1LqusGM5pbPNPq/GoUW/BDS7JPmd7+maiTjIpAo6z
 lxymLodJPD6Gl90jLEYa0ZBkr1H7Nt2zTkOu+zegsAIzKNcSvGnsjdtn5ydIyf0KAPh+
 ZzVQ==
X-Gm-Message-State: AOJu0Yz7WgW1lCKQJtJZqWmuiCTeabj6s210g6nn17kq8C8f7xghTyaK
 c68yG2zy+1hOBmpMc9n3UMYchy5x4Od6FsV6APJdxng/U0mpjGffm1SRqTfkie5PHXutQyjeIzx
 oWRUAT9H6DC3OOhzhxmfcasee/r+0uzP4rl65CkDqcwm3p4fsUrX1
X-Received: by 2002:a17:902:e804:b0:1dc:fccb:e05c with SMTP id
 u4-20020a170902e80400b001dcfccbe05cmr6391394plg.20.1709711277612; 
 Tue, 05 Mar 2024 23:47:57 -0800 (PST)
X-Received: by 2002:a17:902:e804:b0:1dc:fccb:e05c with SMTP id
 u4-20020a170902e80400b001dcfccbe05cmr6391378plg.20.1709711277270; 
 Tue, 05 Mar 2024 23:47:57 -0800 (PST)
Received: from smtpclient.apple ([115.96.30.47])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001db9fa23407sm11867440plk.195.2024.03.05.23.47.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Mar 2024 23:47:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 17/20] smbios: clear smbios_type4_count before building
 tables
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240305155724.2047069-18-imammedo@redhat.com>
Date: Wed, 6 Mar 2024 13:17:39 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A030F09-22CE-4489-9F7A-D7343966DBAC@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-18-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5u9AK4wTIoAL



> On 05-Mar-2024, at 21:27, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> it will help to keep type 4 tables accounting correct in case
> SMBIOS tables are built multiple times.


I suggest you arrange this before patch 15 where you are actually =
calling smbios_get_tables_ep() multiple times. That way there is no =
window where things can break between patches.

>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> hw/smbios/smbios.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index bf5c7a8885..b64d3bc227 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -981,6 +981,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
>            ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_64);
>=20
>     g_free(smbios_tables);
> +    smbios_type4_count =3D 0;

Nit: Can you put this before g_free() because gfree(smbios_tables) and =
smbios_tables =3D memdup2() etc are related. This is kind of coming in =
between.

>     smbios_tables =3D g_memdup2(usr_blobs, usr_blobs_len);
>     smbios_tables_len =3D usr_blobs_len;
>     smbios_table_max =3D usr_table_max;
> --=20
> 2.39.3
>=20

