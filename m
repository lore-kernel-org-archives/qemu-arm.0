Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp642528ejv;
        Fri, 12 Apr 2024 08:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIx0+ssBdOHnIggD0SuIxPELuhQHl31WdaMXIe9+M+QpZKVvxXdCmnED1PcoPOCSYSZzlWcmp4bA6AdzFvVRbNBGevb9NI
X-Google-Smtp-Source: AGHT+IGbT3W53xhdVx+vCsZ6iB7t4FT+PqaahheWhqIr+Mk9yWOSQOxJAfooucqOGdC3HYahxYWg
X-Received: by 2002:a05:620a:4d03:b0:78d:6198:f07d with SMTP id wa3-20020a05620a4d0300b0078d6198f07dmr2952927qkn.31.1712935583814;
        Fri, 12 Apr 2024 08:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712935583; cv=none;
        d=google.com; s=arc-20160816;
        b=OCMSkYUuwbMNJQIVd56gLRGTChn8QX0TSqMjQIL7d1B8Bn3Huln3RrVhqTpsAj/7/v
         r9NZoCMN7RjYCXa75YVMXIHfQrk8cqMSJOq5gZat/qhQ9WDrVE+9SXy4bSxLL26AW1UA
         JSpU0e2VrKEjuyLeNQ4BJhopMuRUZdbtkYKK6o+8tXyVSTG1jISvNohnv7KD4AaqY+4f
         DlsgfrdVT66Jurg7HAklbUkB52d6/wJ9a4Y2Kg75vE1iJESqhbfvw8Och8NvIBix9YBw
         nRLszOyZhZLcMggtH798Sverw/aeihvsHrFj+rgSEOU+kx9OxVZmgLC8+bKKM8KFQ494
         U+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=4QRMf4A9pdnITwrqT/648C2rZ4OGfHGeacWNc0Yevds=;
        fh=PtEzZV8lewTsEhdjnvYI3dlW1izt+z1+lGR2Vrrdpq8=;
        b=u2ysCXUwriIfXOmEISH3QZfCFfnefWP+k6yv97gO2CbaIMLhFssRl+AxCm8C43m9hl
         0qfgLn2Cz5be7qHvv2d4vv7y3Fz/3AXFTaL06oitMBtW7mEh6h1GW7eVIcKlutCmdHoc
         2b71J1p2DfHS9EnoitOragykZyjO+GEm078JF40Bwsaeapl9cyBYe0k0HRQDW8DPtWKD
         Rj36WpF2htIn1X8kuRAVdkL5cb7Cdn8V+mF52Tjh2mfniJSoGQ8WekEnOZh5y8QKaUpT
         +WzaIvYxmGziMpnK/8HEMLd2WZBpQ44OSYoJ3vmN8mGo/snGXh9h33pV8DMRu18PgfU+
         233g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hVdoq+vX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22-20020a05620a09d600b0078ed33d557dsi462709qky.489.2024.04.12.08.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 08:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hVdoq+vX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvImv-000745-Lb; Fri, 12 Apr 2024 11:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rvImt-000738-E1
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 11:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rvImo-000585-Es
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 11:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712935552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QRMf4A9pdnITwrqT/648C2rZ4OGfHGeacWNc0Yevds=;
 b=hVdoq+vXR3tWWkQZziglqwRF8ljz7NLopvdf/IxQEUqw0gujc476C3YhGrtLevXHowXUSl
 9RbJLf9f8Fa7ZuluSHrXIUPgUTK5sfevBXlB+imgqFXcSgThE0WPkc8LO1a5ejwar2x8Y5
 GFiqwrBAehswECfiEqbhq3s1fbWNUjE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-tRwoxP8OOrqz20i8J_xFNw-1; Fri, 12 Apr 2024 11:25:51 -0400
X-MC-Unique: tRwoxP8OOrqz20i8J_xFNw-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-36a3010f66bso10263995ab.3
 for <qemu-arm@nongnu.org>; Fri, 12 Apr 2024 08:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712935550; x=1713540350;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4QRMf4A9pdnITwrqT/648C2rZ4OGfHGeacWNc0Yevds=;
 b=hUxBvFQq3YOn5yk3KFJXWnacimxyJ+5dH7SfIX/0dft4njxy2UikfoNcNdVdZuOg+j
 5lt95OzpHDEcvzugE3/sVwiaqVlZ55pQrr2wGKGKhV21UFS+z9oukXThhe12RTz1Bcx0
 6oR4lRORKjrU1IJ9UQteJs/YviIdrEdjtw6mTt88WcO8CQ+rNc/J3/5znBmAs1PpTV+9
 cjX6IYRD0U0Wthku1EZeIrTlEV+wZgtB1oCjt/CSc2cZcQ1lB7+6jHhA+kuEB5seBeox
 ap8dlUrnMBYtUPzPQAgXmxolNHgEEt8yCJPl34gmU49eB9jfwLV/yAO+TT7kZC7jCXpT
 80ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP17JqfdyRc1B14I5w3VA6k9nk4lCjWLysDsZuUt+WYCsaxsq8NHtPO/m8b6APst3lhY/H+c4oXgvypYdQvhS4aEOV
X-Gm-Message-State: AOJu0YzRfix7Lhfs09xa0QIKAmTTz+Cvl1IVw/Cv4AVpVskgQB2DxMlt
 IrWrn7imRvOc3+kg+/3cVkn0Jq4QpVjPBOvJPvdFqzFaWtpAQ5hb8nPrME84ooZTPEpCdwxCNT3
 4x7uE0yJf1eS+ktwZ/lxJ+4YpF6xDLgRLIzKiCdbGgG9X8FEilg==
X-Received: by 2002:a05:6e02:174a:b0:36a:2f18:109 with SMTP id
 y10-20020a056e02174a00b0036a2f180109mr3277889ill.4.1712935550720; 
 Fri, 12 Apr 2024 08:25:50 -0700 (PDT)
X-Received: by 2002:a05:6e02:174a:b0:36a:2f18:109 with SMTP id
 y10-20020a056e02174a00b0036a2f180109mr3277881ill.4.1712935550461; 
 Fri, 12 Apr 2024 08:25:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056638144d00b004829e76a7c1sm1107539jad.172.2024.04.12.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 08:25:49 -0700 (PDT)
Date: Fri, 12 Apr 2024 09:25:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH 02/12] hw/vfio/pci: Replace sprintf() by g_strdup_printf()
Message-ID: <20240412092546.348163c0.alex.williamson@redhat.com>
In-Reply-To: <20240410160614.90627-3-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-3-philmd@linaro.org>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.103,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jue2JYRVOCsS

On Wed, 10 Apr 2024 18:06:03 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use g_strdup_printf()
> instead.

Isn't this code only compiled for Linux hosts?  Maybe still a valid
change, but the rationale seems irrelevant.  Thanks,

Alex

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/vfio/pci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 64780d1b79..cc3cc89122 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2442,10 +2442,9 @@ void vfio_pci_post_reset(VFIOPCIDevice *vdev)
> =20
>  bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
>  {
> -    char tmp[13];
> -
> -    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
> -            addr->bus, addr->slot, addr->function);
> +    g_autofree char *tmp =3D g_strdup_printf("%04x:%02x:%02x.%1x",
> +                                           addr->domain, addr->bus,
> +                                           addr->slot, addr->function);
> =20
>      return (strcmp(tmp, name) =3D=3D 0);
>  }

