Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp924890ejk;
        Tue, 30 Jan 2024 08:14:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEizPGD2daHdzvd//4pVJerVbPlYGnU2Rrfm1DqGkjxhPD5/JJRsNdbuEe3FjAkEB0tqINg
X-Received: by 2002:a05:6102:7d4:b0:46c:9b24:5431 with SMTP id y20-20020a05610207d400b0046c9b245431mr1717045vsg.32.1706631254424;
        Tue, 30 Jan 2024 08:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706631254; cv=none;
        d=google.com; s=arc-20160816;
        b=DwNuM7RFEaCa/+FYuXX4OrKyZyWRATt5s3eY7HllFeNiLm4TM2PnakLbYu4V2dwapb
         1XzfQjoLkueOrHHaucf+CzP8zmdEoQ/VS+gncnvFwPVbpHYqoRXTZH/kQA/z8jYDCZvD
         0KuozsMPHbfcO/NP0DLHoYvyQRjmJIdireZdL9AjOMLnIf++EJhno+tUAqfEAWl8GBSt
         oh0D+q1XViwDf6QIhXpSgGmCCYjLjLngN+3MVEAppfb6lwjfICnts0cPShsiAQRWqESg
         tbQXvSKPS86NYVzkIJJtX+SO/zDSoJVOaR5erpgmNlDNYm1mjhf2GrdKJotF8siMsBYU
         k0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=PA4zWU1Lm86ToeIZgFSkuXwGmu3ERuGa4Rv1lrSr3O8=;
        fh=wuthECvUTeLPkgYfNhld5TgD5PfIvWqffJ0VjICR0Uc=;
        b=LwTAMVNaU3/KgfxF+NALVrO1sucDap7dtAc0TSxRVPHySXr/a0BZEPyt7GUFiMT4f+
         +3PHmPn64y3YXjCqsneQjGJwC4bzjfXrs1Jly3L+73iCdaQWdPMNRsQ5bNmCU3/UO3Ec
         jLBTDNC3O18/FQROWoUCi2xIlunEVvm0fVVEi2EzDdo6r6RCVUITTH7rj6NIHbKE5JXH
         ic7ZvmKbOo/rdu7OeB0Z9urq0T/tj5ObLKlNsHxCdN+Cr9ZaVuFEXc4O8h5V9z1ZDNQi
         yCJfMxbYzlcY9S55jNAc6clLEU3lBfm6YL3PsTMhuvjYyitJpTZAy1bmxG+FkCAs9kzo
         5zpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NM+P1nUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a05610220ca00b0046b14a63f33si1167196vsr.12.2024.01.30.08.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NM+P1nUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUqkD-0008Ls-HL; Tue, 30 Jan 2024 11:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUqkC-0008Kj-HI
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUqkA-0008P4-0E
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706631228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA4zWU1Lm86ToeIZgFSkuXwGmu3ERuGa4Rv1lrSr3O8=;
 b=NM+P1nUJMldcXppODuIF9IXUw536mOR16F6TbDnqfWE8Y3qFskaxS4kZm3MaYnzB2Wuja0
 9JXOfTppZKLhtJOPA4drhz6hz9hgRKXGwSB7Oknn/ZAPP0U2pYo0+lDbQebRwjGrAqLe4P
 /hQcTfRVCbmwwv29K4PGRR2m1pRTzc8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-P7qRhzWZMGy9H_cTLffmig-1; Tue, 30 Jan 2024 11:13:46 -0500
X-MC-Unique: P7qRhzWZMGy9H_cTLffmig-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1d78e48085bso42217805ad.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 08:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706631224; x=1707236024;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2TXQY7oLkByMa20k4kM2kuAi6geHCpwaT9GmhgYfg4=;
 b=SLmZBB35EJwNrE7fSwo8ir/vvhYSa4hcff3FHascJi4TVUvZ+bcaqwCVe4dPEeYRC8
 nK+ahCJlsCf50CrQl5vRMOzTxHrfyvYdUMwdUPFYTpDCEgiA/3nn2Z5jY0vsj9DjM8pn
 OVTxpQCp+SUGquSbXZpGoF1h4Tn2BwQk1Q+Tk4nPWEA/0zrKpDvVMAp9LxxQhXNOeE/7
 HIUqgQ6NUs7ecuz6gu4eeDz9s4mUrKWzfVvGQi/s6jmsvuGRd0PldRrnerE7T8aVwmjo
 HtjZEFoIQHp0V7mksnDAuI9Tk2oZKO57Drvchzqn/ZuzM7gNvHAuC7+CJnzl1Zqijk2o
 S9xQ==
X-Gm-Message-State: AOJu0Yw3qPyfNc3dIbjrFkyzceSuSsLghl9rEuWF3hjCWLUKCaWkx3cQ
 iUNcG6q7yqKXt5lNsqYmLgkUDCBLBHp7fSS31NTI/jkze3Xl+zgtIC1Yt+65ACjJ8uaO0/h10/y
 470WVNw3iQBeCYGM+tIYLfrbX2zvipeHFKJDh5pvRJk+vz7hD1w==
X-Received: by 2002:a17:902:7482:b0:1d7:690f:a961 with SMTP id
 h2-20020a170902748200b001d7690fa961mr8057421pll.44.1706631224682; 
 Tue, 30 Jan 2024 08:13:44 -0800 (PST)
X-Received: by 2002:a17:902:7482:b0:1d7:690f:a961 with SMTP id
 h2-20020a170902748200b001d7690fa961mr8057407pll.44.1706631224363; 
 Tue, 30 Jan 2024 08:13:44 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a170903411200b001d73adf350asm7394811pld.56.2024.01.30.08.13.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 08:13:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 1/3] hw/i386: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130155653.142283-2-groug@kaod.org>
Date: Tue, 30 Jan 2024 21:43:27 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Message-Id: <6E771066-49E8-448D-B90A-21766B108874@redhat.com>
References: <20240130155653.142283-1-groug@kaod.org>
 <20240130155653.142283-2-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
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
X-TUID: WhIczv3PxWW/



> On 30-Jan-2024, at 21:26, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_fprintf() doesn't add newlines.

^^^^^^^^^^^^^^^^^

Should be error_printf(). Ditto for other patches.

>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> hw/i386/acpi-build.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index edc979379c03..e990b0ae927f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2697,7 +2697,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>                         " migration may not work",
>                         tables_blob->len, legacy_table_size);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         g_array_set_size(tables_blob, legacy_table_size);
>     } else {
> @@ -2709,7 +2709,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>                         " migration may not work",
>                         tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>     }
> --=20
> 2.43.0
>=20

