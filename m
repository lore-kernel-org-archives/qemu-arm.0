Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp961130ejk;
        Tue, 30 Jan 2024 09:11:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsyQ7ibxWPJ2vshsGAMkyWMovVQYUkoKkdXxqCih+OfcF5ZuRnt5UHEZ2ZcSEa4tj3e9du
X-Received: by 2002:a05:622a:13cf:b0:42a:8614:5534 with SMTP id p15-20020a05622a13cf00b0042a86145534mr8742093qtk.37.1706634685402;
        Tue, 30 Jan 2024 09:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706634685; cv=none;
        d=google.com; s=arc-20160816;
        b=JBvfLA/g9QonA6syyMnT/fC0AOoFezwqNZ/u74Hn8u+lKr96RgYeHa+6oaf7WGaOWv
         fYWs7kTuKutclmHRddx5+WLoRW9y/xfTukIUYPZSB5IXD/XtdiqjeGT2ioVYTs0vArRj
         5pWOiGkPy0t2kvfhACa42/kmEz+KhnFlP4K2r27kqc8wqtVhOz1gqpdg08vACRpIhtK3
         XVuM7wk8kI+nC5Edgj8A1FVUVfah9GcLSBdxuyIrW+5c/FQkVqjR7LnQiCN7ISwFCvYJ
         MdZQBVVgZg5wEWODUvkMcNaouXvlLeNa5zwYOjMb68oVoQTI5aOuFKIdAr1/Js9Tly91
         G2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=w3US3GYINWUDRxxsHxW1CK1XIJEN6r/XxxRFKNDrYZA=;
        fh=cZcfwQooAypZMR8S+YDeIdQ645V1fWGYrDcAd2zT4cQ=;
        b=K1EBoJozta+JEPr/fxaq8DdcplLRI5iuUH3qIAu6CUjVTmX1/ZlMsKFVAi8kAh/JLH
         cLAHN/roy8S67Zh27dfc42JXg8BeLwWQbq4tV4/gWOI+jU7M+s9R8m+WGTHg3jeT0rn3
         q29P/FzcUf96xCBd80XIwIDB2jSnK4t3JmO4yR7IfTdO9GeVn2/XttEmC06JOvmvpFx5
         CnKOpFMWy/63F2h+N88wWWcB7sulrLCwuMoAYOkwujweoky0+Bq8shXu6xymYRRvEu+Z
         NCaqhhV0CNBfPiDJhWlrxbHfz2jmS27PVjWfULz91YMJrRc5e7lW7b63kXBBZWAwALeA
         PqYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCyQE5tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05622a175400b0042aa9314400si3986635qtk.505.2024.01.30.09.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCyQE5tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUrdj-0002wX-1z; Tue, 30 Jan 2024 12:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrde-0002uB-Ft
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdc-0003Un-Lk
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3US3GYINWUDRxxsHxW1CK1XIJEN6r/XxxRFKNDrYZA=;
 b=iCyQE5tgC9Zgr4jtB3ctnGBBgqv3s4z6V2XEdV7FxR6KnuiMdWc8bB/t14uS8FaT5H36nd
 Ffiz1/u/sxa/Mtooa+ikCHLLUZlixc6smblnzBnkNAXBw7XSH9/nyN+XRUsq7cR8p9tPoU
 mocFmH5TrqpboBwDzEV7tqEoq1OpJwg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-p4UV9pH1POSPKYcvpHaklQ-1; Tue, 30 Jan 2024 12:11:02 -0500
X-MC-Unique: p4UV9pH1POSPKYcvpHaklQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5ce97b87716so2202614a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 09:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634661; x=1707239461;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDpf39m9/K8wpY2UV02GGHmrme+FZzgNAG9ovgKJupE=;
 b=KRP3hg32qX/nHwyJLI3Tcunt+ifj44AEpMwc8xL3qEPCF3yKlIKdUgVrvFZVL2Nj4P
 MNKAtpPV9gldv8cwixh1JbbnUit/ZKAOPQrFF4RivsRj8ynVPRP9M55Sv2XqQERE5iuf
 QB6M5I3N7BmEuryQD2AM7bDQM5XYVZoxNtLtwpBaFjnTtkeAEKdnixn3wdgJZPEcxORi
 S0tG4BmRSX5bEt2lOsnTDHfd0CIuiEdNbtLn5xLI6UP4PWd5y9Bia1U5HGTa6W9a8OXr
 n7Ag4DzoyfPv9y/jNIJS/hRoRmCdZxll3nlxEupM680b46S4IFRl2Oivf91dZ3VBvIlj
 THnQ==
X-Gm-Message-State: AOJu0YydD9ZIv8wM5Y8de/oV503bfma+K3ndHTFW5QqM0iVF9P3y+WaC
 HJ+XJufrrd9cSwlzP6H2DMDhChQyIO5qsIpbrZLUMnEAJ8+2gsSYJfINNvGFE5TSTPeAlHLtzMZ
 o+aRfQORkcUOB3YMXANFRWtP8NFLrcTNqFuYQKSYwNNAO41mK3Q==
X-Received: by 2002:a05:6a21:61e:b0:19c:7c49:4e6 with SMTP id
 ll30-20020a056a21061e00b0019c7c4904e6mr4568342pzb.51.1706634661189; 
 Tue, 30 Jan 2024 09:11:01 -0800 (PST)
X-Received: by 2002:a05:6a21:61e:b0:19c:7c49:4e6 with SMTP id
 ll30-20020a056a21061e00b0019c7c4904e6mr4568322pzb.51.1706634660854; 
 Tue, 30 Jan 2024 09:11:00 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.10.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 3/3] hw/arm: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-4-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:40:45 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <93A9587D-E34E-4EB3-924D-6CDC64E1812F@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-4-groug@kaod.org>
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
X-TUID: yklWh2IrsOrh



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/arm/virt-acpi-build.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 17aeec7a6f56..48febde1ccd1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1008,7 +1008,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBui=
ldTables *tables)
>                     " migration may not work",
>                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>         error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                     " or PCI bridges.");
> +                     " or PCI bridges.\n");
>     }
>     acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>=20
> --=20
> 2.43.0
>=20

