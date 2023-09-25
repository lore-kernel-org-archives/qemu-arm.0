Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp281162ejc;
        Mon, 25 Sep 2023 03:32:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu2a58nE/uzO/x9R3cnqVSaGZQlWbUpOje0e2vTXOPj9twNQ63laM/m77bJqtDHhmnQjqp
X-Received: by 2002:a05:622a:608:b0:412:22cf:83fa with SMTP id z8-20020a05622a060800b0041222cf83famr7497670qta.28.1695637928033;
        Mon, 25 Sep 2023 03:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695637928; cv=none;
        d=google.com; s=arc-20160816;
        b=FwT7OlAs+B4fMWyUcspkRoOCN1kYQEj6dH1YdD5OCi1qSVLSatiazC5reXm1sGB/xs
         omtH0C4xnES7i9qzV/4JeBu1VOYQpgWyXVYtFaOrSfdw74wOL9KjPs8lZK2kOpdostuW
         +MWZyocXvL0o2nH0ukjs0ZLd/sTjafLqiGDqpiWyO0MTxSvTubhkuL6dqQ2QRdxKTP8G
         XoyswFG1zEHBRF28/5tUC0KQI++ulObSxPRsZiJmSU9aP62apQP4H0UB4agiz0UNAsmu
         zN+ykaT/PygnDywB+eQGQE9Q5dbItUOoH8MnIzc3Wl3F2wxpHiMdqQK72+0qrQv9/vR6
         ZwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=c1cwFSdRlu0Wnlm1jrM9IfNJHssewWckutA3WOkrFVA=;
        fh=X3C9n4MgKwKAcdIz7pYsgXIgSm3f18hXzdSvlgMhT7c=;
        b=s+ctj4FcnZ064lLhj/YVbMfdBHv126XwddD0mkWF771HyLRHfv5F/M72gjSmP1x/Vv
         UhdpMbOFPshLaspjcxP0U80WdmaF+3uCWov+lVt25Ec3yAus/48SFSeUsLCKF4Lf/cQQ
         jY8QLGcFOE3o4H2aJQI0vmE0LyvpYdzNh8C7fyXlftvVdj0sEix5uM3wwbS531349SNS
         AtjYMqrG3AqHmInd9qfp34MW+D4WGhmRfPD1OjQ6NhTtybJp9OxSVSohV0zXrKWvzGxX
         NTojFrHdfvQrJyShuPXiuTpGigPZX5QJBJAscMhB0e/eDRgFG7qclZE4GzjFDZx8Ac1n
         A//g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z1kam7TP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac857d0000000b00417bfe9e70dsi5773892qta.592.2023.09.25.03.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z1kam7TP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkisl-0007nJ-4A; Mon, 25 Sep 2023 06:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkisa-0007ZV-AL
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkisY-0002YP-NU
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695637909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1cwFSdRlu0Wnlm1jrM9IfNJHssewWckutA3WOkrFVA=;
 b=Z1kam7TPcHU/jHwIticIGIBk4E/iHCMEEOqGvW+Kd161tyc1YYlsaX5AhAzfXYWfkmghu2
 WIJAorz8jyWt/RdnvtJWLXg4pp8TCV6Or4HpXiTCqeIgmszA4TXw+u1L7l9SJwiICUU8tU
 AJlX+MzSVmbGbAViEKAcoKzw58k6GlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-nkcvOYVKNwqG9o6IF5p6kg-1; Mon, 25 Sep 2023 06:31:45 -0400
X-MC-Unique: nkcvOYVKNwqG9o6IF5p6kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06EB785A5BE;
 Mon, 25 Sep 2023 10:31:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D9F2026D4B;
 Mon, 25 Sep 2023 10:31:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB02D21E6900; Mon, 25 Sep 2023 12:31:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 04/15] hw/pci/pcie_sriov: Do not open-code
 qdev_unrealize_and_unref()
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-5-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:31:43 +0200
In-Reply-To: <20230203145536.17585-5-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:25
 +0100")
Message-ID: <87lecua6i8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fMxmk3v4XnDi

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> (See commits dc3edf8d8a "Convert to qdev_unrealize() manually"
>  and 981c3dcd94 "Convert to qdev_unrealize() with Coccinelle").
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/pci/pcie_sriov.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index 93b0624599..0b6101302b 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -204,11 +204,10 @@ static void unregister_vfs(PCIDevice *dev)
>      for (i =3D 0; i < num_vfs; i++) {
>          Error *errp =3D NULL;
>          PCIDevice *vf =3D dev->exp.sriov_pf.vf[i];
> -        object_property_set_bool(OBJECT(vf), "realized", false, &errp);
> -        if (errp) {
> +
> +        if (!qdev_unrealize_and_unref(DEVICE(vf), &errp)) {
>              warn_reportf_err(errp, "Failed to unplug: ");
>          }
> -        object_unparent(OBJECT(vf));
>      }
>      g_free(dev->exp.sriov_pf.vf);
>      dev->exp.sriov_pf.vf =3D NULL;

This replaces object_unref() by object_unparent().  Why is that okay?

