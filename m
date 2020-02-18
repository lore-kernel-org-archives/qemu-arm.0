Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5799093lfp;
        Mon, 17 Feb 2020 22:38:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwc9EGCAcDJ4zriWxIulRxey8TiHZ0wpLYwLqo9dBAcu84TEDbgI0Rdttyv4ANaeRDKXvon
X-Received: by 2002:aed:35e4:: with SMTP id d33mr15803954qte.389.1582007923582;
        Mon, 17 Feb 2020 22:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582007923; cv=none;
        d=google.com; s=arc-20160816;
        b=FxDuCno6Wb8nkZdPI2XDNgjkDZ8n7lLdLPzD/oZu/vOCGoHK+3DcolILlCDLDa8UQZ
         R6fV2S+2QGa7x8huRGNXYAsTwlvIbDL8322ZkvBLQNMLCA0uucESusHHGV1BT7U+eCBl
         e9bmEFimBCLUk2F9jquOdUAS6RHMrFnRwR34zWkSlo6wnFJtl3jY6BdlGJaNoN+AtdtD
         ZrmJsxHtRB27N6plFpKjWg+/Ee7mXy7K3ekPsk5sHdOYg3YKhtEtU9xiya1a5fUTvJmh
         vvFcQ3nucJYv+u1nHwRffMAHM/bD2riy7WCfL49uqRyXnm+FwYfHwttZxYzgijcgF7sI
         AM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9qC+CGolcOBcc4a1J/+qzeVK5mL6D9yq6kCEYxmiKC0=;
        b=DuBXp+LqFcOZ4e9RY3y6m7hwKNpYcVMmLD46rJ9ufK89EAjFWrhP0OUnqRk1M4IU4G
         9eHoD0dVnrRBGNYu5eECVTF5v5laDe7/z4hEuIr2hOsn+ATl9rzMhmD2z0Sp+uR/C39b
         gee4bzOgb9WR27hXDgJw/h2tznpJRfOBjKQz5PW0RgeZPLksg9KPfY5xfPCnoHbPZuF4
         X5C+6ph8SJeLAZ29r1FT3ghljaOpE5p294XMTAz9fw8HEbdnl05j8c0ohQtRWZf8p7k8
         zQWjNkwKqseEBH03jtlOTM/EHBBUmVF6BeBIDyp0cvqikM8/bEvKS4sTTHJDU8TU6cQW
         maoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H95QBZD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n139si1494206qkn.164.2020.02.17.22.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 22:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H95QBZD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3wWo-0004fs-VD
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 01:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3wWX-0004dY-5d
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3wWU-0008GP-RW
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:38:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42290
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3wWU-0008GB-K8
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 01:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582007902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qC+CGolcOBcc4a1J/+qzeVK5mL6D9yq6kCEYxmiKC0=;
 b=H95QBZD+KaJ7lB8DI9U4RKck7Kv8hT0/RonJDK90NAZIbBgUrAhAbCKNoUdjB1fvMTz85Y
 sSyCg2tCadY76d4bQNHAoL5JUvPxzsnhk4nYKDohSZbCXCJMR7djvK9DyBXGfDqr2jkNF5
 2+8qQQhZaUARYyvCNX6rAYs0cU6cITk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-OGwW5MZxN96p7Feitx9vQg-1; Tue, 18 Feb 2020 01:38:18 -0500
Received: by mail-wm1-f71.google.com with SMTP id p2so599807wmi.8
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 22:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fI270OyDYIHJ9RKxTaIBJnJDHlaj2fFo4SFEKm2BOhc=;
 b=MeKY71RC7K16mM7FJfJ+26p86w9ZPpX/F/DQlCLXq2iAQFqHOF5wkJeW0nMj0qZ/F6
 EgHjzCTuaZ2KovJqhlWHbtHoON8JJYfjhn8uCYl2yJdbJYa/vW2yOIRyjPXEeuAuZuN2
 8ohd32yAtUmq/Xu5Hdpk6GZ72gnf7Z9aGeGvcuolrMqYMg7Wmoq+zpKa9T9VBOckSS8f
 IuavUbyFKmkIECw332AFAGVf2Zu/DkbU43t9hhBB6KF0yD34Lt5UGRxo8z4jUFJkKIzP
 yVOO+ftHVmujLV3ZaGNbRSQH7XGi++ljYH3pAhhOJYXzTk9TZypcFDqDxUHs22VrUmTs
 Km/g==
X-Gm-Message-State: APjAAAVlOhKGaNNbjvWHwz939ZxetizRKu4OTtoYfST0+iefVDS1sDCc
 vy5ymx+6bwM2b7VTlsKbsswCEy3p1yLgR1zhccvkg3oYyW3TqYaPFhWMuexXKBALOdqBJMnAzfb
 GlGpB4LoT5Wj/
X-Received: by 2002:a1c:f008:: with SMTP id a8mr1087876wmb.81.1582007896932;
 Mon, 17 Feb 2020 22:38:16 -0800 (PST)
X-Received: by 2002:a1c:f008:: with SMTP id a8mr1087843wmb.81.1582007896620;
 Mon, 17 Feb 2020 22:38:16 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id j5sm4613871wrw.24.2020.02.17.22.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 22:38:16 -0800 (PST)
Subject: Re: [PATCH] mainstone: Make providing flash images non-mandatory
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200217210824.18513-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bfeae9e1-38fe-163e-cbf5-071b587543da@redhat.com>
Date: Tue, 18 Feb 2020 07:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217210824.18513-1-linux@roeck-us.net>
Content-Language: en-US
X-MC-Unique: OGwW5MZxN96p7Feitx9vQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90fDLizGyouG

On 2/17/20 10:08 PM, Guenter Roeck wrote:
> Up to now, the mainstone machine only boots if two flash images are
> provided. This is not really necessary; the machine can boot from initrd
> or from SD without it. At the same time, having to provide dummy flash
> images is a nuisance and does not add any real value. Make it optional.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/arm/mainstone.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
> index b01ce3ce08..6e64dfab50 100644
> --- a/hw/arm/mainstone.c
> +++ b/hw/arm/mainstone.c
> @@ -138,19 +138,10 @@ static void mainstone_common_init(MemoryRegion *add=
ress_space_mem,
>       /* There are two 32MiB flash devices on the board */
>       for (i =3D 0; i < 2; i ++) {
>           dinfo =3D drive_get(IF_PFLASH, 0, i);
> -        if (!dinfo) {
> -            if (qtest_enabled()) {
> -                break;
> -            }
> -            error_report("Two flash images must be given with the "
> -                         "'pflash' parameter");
> -            exit(1);
> -        }
> -
>           if (!pflash_cfi01_register(mainstone_flash_base[i],
>                                      i ? "mainstone.flash1" : "mainstone.=
flash0",
>                                      MAINSTONE_FLASH,
> -                                   blk_by_legacy_dinfo(dinfo),
> +                                   dinfo ? blk_by_legacy_dinfo(dinfo) : =
NULL,
>                                      sector_len, 4, 0, 0, 0, 0, be)) {
>               error_report("Error registering flash memory");
>               exit(1);
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

