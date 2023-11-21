Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp528462ejy;
        Tue, 21 Nov 2023 06:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3PXyDf16Hurl4riLxApLsjk9FGBhWAv0zn1+/r1pNoTnppb2Fx4W9kAUoH6i8PijWn1fU
X-Received: by 2002:a05:620a:664:b0:777:5d4:bb4 with SMTP id a4-20020a05620a066400b0077705d40bb4mr4087665qkh.3.1700578691341;
        Tue, 21 Nov 2023 06:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578691; cv=none;
        d=google.com; s=arc-20160816;
        b=p3FEvIJSIL2GqiyBAyodCrudHu7+/5ftBsgCTiBqX7TlkiKKnuPGDHDKTss5ZN+GBL
         ZxzporVRsby4+1berA0nOFDf2dJ5vFtEqjx8JuUKLjLs/oSQOYLSSH6vW8d0r0PkHJYc
         7yVV3Yglue1wq7kkqN+XEcdbj4REEhNE0C3RWB2iU4Tmd7ZbK7T3jyoOus0BlP7Hkn+B
         K6f1KGr0yLJMjNvh4lX7xIqrYD1QKaQJHDP8j47KD6ltb3tQ1+wFNfwbetl5jx8y8ss+
         tpJ/nuEVVtRYbEF6nmu31LWVQEoUcUpw0b9W4OSIXRqoeo+cvw7a8FBWdjNkZdNTwHnE
         7zvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Jx8yISt6NB9SeRa+mQWLDqYIrsLJkAKO0XxQwq5R5h4=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=F5awhXmWofhIsoLKLFEIewKJ79jk9eNs18QAK5wPE1nKjHEpN2ZtfZzO6w6Qp682uB
         Suck88HXpnSub19pnn/llL328m6zcwfJQ+BlPxiMDfVrxi4QR68MxyzKLKvN604ZT//L
         lsq8lDpNH3hMuCS2F/jrCvCl5U9UvFQDfau/uOA+ExfUFv5kxGIQ6kn7ZXcYhgrxLGqS
         yYK4D3T2+LE3oh1DTBr3o98ivM/COFxkaYO8uHLKuPhHy5oCLRHJGPTB9H2p2ZOcV/Vz
         U+ImnMDKfEJaAa+S995G5AFuPcSIJ5VLpJo93AFaMvzNlTvy9nAKOYyekWBwRk3K/Xal
         7lgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Of4aTpMq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az43-20020a05620a172b00b0077d5fa58d0dsi403098qkb.243.2023.11.21.06.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 06:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Of4aTpMq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5SCM-0004J4-CV; Tue, 21 Nov 2023 09:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SCF-00048B-6X
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 09:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SCD-0003eX-85
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 09:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700578668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx8yISt6NB9SeRa+mQWLDqYIrsLJkAKO0XxQwq5R5h4=;
 b=Of4aTpMqYsaJGEK3JF5B9Dokro9UsutjjtDJbw0gHth7BQtesycyWya/lKMU/r1NFkmdYK
 n8W8ZK/J9WDIwFNeZKhxbM/2jx58N0Yy64e9ZJMJUfYeUoikPy2C2StET+0905FTVhB4uf
 u90EfVTsL3flNmp16ZA717PmWK0QPzE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-chzt1qHPMLiBjx-D0S9EFA-1; Tue, 21 Nov 2023 09:57:45 -0500
X-MC-Unique: chzt1qHPMLiBjx-D0S9EFA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-41cd9e05c8bso14782451cf.1
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 06:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700578665; x=1701183465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jx8yISt6NB9SeRa+mQWLDqYIrsLJkAKO0XxQwq5R5h4=;
 b=eZKAsx1fvw6Cl3ktqv7AaDR1sKp+gVpqvhU0WngDe7vUvuuEQTRooUqDRbuMZNTwSB
 Cg2rLo85oStxOw+zbxsrdk8v/S6sIvGC8fQ+DKbifGmdFJs/PmgqknS5DuJAir2CtP9M
 pYWnTX8zUrqStwFlh6ebNd9SzPHeo66v+9+So83JMtdaSbxoBHfnquuddo6WRA7ymIxg
 e2GzZRU79yypTA/VbEQRRPpJM2hamCsf3XRZC8xDUFGnuI8Cj/4L3X0HjzpOxKEH6z6R
 tsu4UBo1mG+JD8c3Tws/U90zXhVpjfAbkYh85lQlbyN2XTCv2mZXbjcScJCll3aYFupg
 8tIw==
X-Gm-Message-State: AOJu0Yxb31ppIkIscE7yxnjWebA01AXE8w7zhz3XslUP4N1TZo9PYFY+
 Jlb9w4UscVy9Q6Wgc1ymupUK1QWjP0ssQzHGJxAYGgzx2vSLUYowOgmsemIyT0zZG1KwTLGrbwE
 trbcAm2q7qjBUDhA=
X-Received: by 2002:a05:622a:5c09:b0:40f:dcda:ea10 with SMTP id
 gd9-20020a05622a5c0900b0040fdcdaea10mr14773913qtb.3.1700578665370; 
 Tue, 21 Nov 2023 06:57:45 -0800 (PST)
X-Received: by 2002:a05:622a:5c09:b0:40f:dcda:ea10 with SMTP id
 gd9-20020a05622a5c0900b0040fdcdaea10mr14773894qtb.3.1700578665046; 
 Tue, 21 Nov 2023 06:57:45 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 w14-20020ac86b0e000000b00421c8069affsm3643424qts.78.2023.11.21.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:57:44 -0800 (PST)
Date: Tue, 21 Nov 2023 09:57:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 04/25] memory: Simplify
 memory_region_init_rom_nomigrate() calls
Message-ID: <ZVzFZtM6M5rRtWBH@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120213301.24349-5-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: VoYlyLIyg4w4

On Mon, Nov 20, 2023 at 10:32:38PM +0100, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, errp;
> @@
> -   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
>     if (
> -       errp
> +       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
>     ) {
>         ...
>         return;
>     }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

