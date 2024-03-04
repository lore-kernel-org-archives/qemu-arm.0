Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2704481eja;
        Mon, 4 Mar 2024 08:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeyBMDEqGw6do9MsMkSgwPOtwYCrXH9hq1TVIpx9rjc16M5a1fMqm1j9dESnuUC9gWHElocODwujvxkTk7oI1H9xIzy84+
X-Google-Smtp-Source: AGHT+IFeXC1cIm8HXaxbxet5csJ475xk2Z9bYHSp9J6S3qfYInNTUxnPChTtWP8PNVN6s6U9pNRr
X-Received: by 2002:a05:622a:188c:b0:42e:d4c9:e070 with SMTP id v12-20020a05622a188c00b0042ed4c9e070mr10869952qtc.60.1709570623663;
        Mon, 04 Mar 2024 08:43:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709570623; cv=none;
        d=google.com; s=arc-20160816;
        b=n8hTv8tD+f+FrVUd/EoP67BbVUeErrWjTtFqBde8XAlZ7iCdcCnvuaeYp0LUw4a2MV
         D09IEf8pDDYcFV33NzBlRPI8jXlC4fIfkAf4cqttmtJXAgx81/B3R8lDfsGcYO1187zu
         ovcaPeQK70J4scIgjpZrg6QEv7N2xvWTZFCw5l1W/sGZAfaZ/Xb4+aCH4tEjL9CXlwMW
         cvBtqnTDPByUnbfJHygCP11pITEF8fq1v3EUxL+6sfAV4DJczy+XOC5mjQvDNKdJy1Ox
         n9D7sTKd7WP5XKAJf+xwHsRORWENKZQOjes4citGsN3n60jwUfYhsjX5KJSQuKc0R36j
         A0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=lGund8dWrWdtVg7OgtEi7Hk2WzobqDUR2vASBBvDgzs=;
        fh=RZPIi3RpcoFOU69A8WMkr/NH4Ap1vkFHcFicHhHxEl8=;
        b=ej3kuVkHMCh20kr5XeY2PGt6dWAKv0gAnGVUclG+nGDAV4zFxUizB3PmsK7aXPKTXw
         OwZlDuzbYyKJC0JA9WiUyUBJgHF/qXGo4HH0BDjAtiI0b7QUO9KQzvbg/lMMxxkTQ41y
         kgp7aFV5N4W8hpA++k0EmvSGgOo4VmscmTDpH94qfyHLBAwogmD9i2RmRWqPq34wXqcl
         JmteUFYd6+hZYY4JHDPGKIHkSSaTknuJ4UF8GwqspwUBAjAaXzftdJT3LNl5FSUSjrAA
         sPNwS5xqEn1OWXfCNtQmyTOYpZKMySbz/BIe4ko/DSG2xL1R/1wwx1YRl+gJIE/TOeSO
         NYyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KFHtEIo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac84e44000000b0042efb9e64dbsi306267qtw.222.2024.03.04.08.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 08:43:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KFHtEIo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhBPV-0008Sc-QU; Mon, 04 Mar 2024 11:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhBPN-0008Rd-3b
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 11:43:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhBPK-0006qI-Ht
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 11:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709570597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGund8dWrWdtVg7OgtEi7Hk2WzobqDUR2vASBBvDgzs=;
 b=KFHtEIo17/Xvm5PTXbrftSja/a9NcFM/Ajv3j3KIQl5CE+gCEixBbBheDkz998YtG8HAdD
 IEpnbNoX0mm0Xc36Ev/a+oAAcSdUiE96/OkiF7yi/28QZrn2DJidOWYLoR3RT/xZI1Hx6V
 jL8yUGd07aeNAYZfy1kZ3AiMpFqnsqw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-UuAysGEVO4iwcmn5_NsFYA-1; Mon, 04 Mar 2024 11:43:16 -0500
X-MC-Unique: UuAysGEVO4iwcmn5_NsFYA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33d30a3d6f8so1419965f8f.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 08:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709570595; x=1710175395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGund8dWrWdtVg7OgtEi7Hk2WzobqDUR2vASBBvDgzs=;
 b=tLfulhTdRwfeOhDaginqITRo06tIWDu16m1ifjp5nG9nAdU7E8E2ApFZvxo2r4bbHe
 U4eIocyFn/WdUMRFm0jATrUmS/Apyfr+aSseqb5zQdbz2GS0IAuhIbZv7vPOrx9GLZxZ
 HHQbNXRQDZV7BHJY+uXR2WV/b+nodEGO2cSoE6CZ8b3YY8Q4UqjSez2+WXlonMFFSB06
 NW3fHiTVThyA12x1kCQRf55u5IHVYtzrOMe9LYJdbhDnRXL2FJEKMSpO2iTZKev7zPQg
 /n2rsTfS1swAUMW5X17Wx7BhRBmGl4pVeP82H2ammthV0/aO5IYlTAMpjvSyK7CK0mwY
 oCRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7a3DzMlzSNIqLCia/9SGVHoON/XpgAXn27frx/tRX992YzYXPwmwK1dOw2Qta62DDZCkhQQjsUg8LJsHXUuuFxGTq
X-Gm-Message-State: AOJu0YyCYdWpR7ALD3TYVJzJKkyVYIh6wP8QepI+Ps3WafhTk0/2YoHT
 qfq/DvKxffBBOYf58vmssxMgqrqtogFUDC42MuNrDaM/PuIUmEvCdioOnaRLYdYriU6QyrciZsg
 UMUbjsUKevO5fUcbhOIFt3E72S+UDGbLz487A3ChsC0tAejl5gA==
X-Received: by 2002:adf:e811:0:b0:33d:3072:e38d with SMTP id
 o17-20020adfe811000000b0033d3072e38dmr5851909wrm.21.1709570595122; 
 Mon, 04 Mar 2024 08:43:15 -0800 (PST)
X-Received: by 2002:adf:e811:0:b0:33d:3072:e38d with SMTP id
 o17-20020adfe811000000b0033d3072e38dmr5851884wrm.21.1709570594776; 
 Mon, 04 Mar 2024 08:43:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p6-20020adf9d86000000b0033e0dd83be1sm12662816wre.91.2024.03.04.08.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:43:14 -0800 (PST)
Date: Mon, 4 Mar 2024 17:43:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>, Alistair
 Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 09/19] smbios: build legacy mode code only for 'pc' machine
Message-ID: <20240304174313.5ff4dc2b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240304152300.1be944ce@imammedo.users.ipa.redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-10-imammedo@redhat.com>
 <BB495028-FC8F-4E80-A58F-B3AC81732DFF@redhat.com>
 <20240304152300.1be944ce@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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
X-TUID: I7Xy7NrePhJk

On Mon, 4 Mar 2024 15:23:00 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 4 Mar 2024 16:25:03 +0530
> Ani Sinha <anisinha@redhat.com> wrote:
>=20
> > > On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
> > >=20
> > > basically moving code around without functional change.
> > > And exposing some symbols so that they could be shared
> > > between smbbios.c and new smbios_legacy.c
> > >=20
> > > plus some meson magic to build smbios_legacy.c only
> > > for 'pc' machine and otherwise replace it with stub
> > > if not selected.
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
[...]
> > > +        /*
> > > +         * preserve blob size for legacy mode so it could build its
> > > +         * blobs flavor from 'usr_blobs'
> > > +         */
> > > +        smbios_add_usr_blob_size(size);
> > > +   =20
> >=20
> > Could this have been made as a part of a separate patch? It is extremel=
y hard to understand why you are doing this when it=E2=80=99s a part of a l=
arger code refactoring/modularisation. =20
>=20
> sure, will do on respin

I also has split out variables renaming into a separate patch.
Hope it will make it easier to review.
=20
>=20
[...]

