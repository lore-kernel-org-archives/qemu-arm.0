Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4276920lfi;
        Mon, 6 Apr 2020 11:26:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIOjlLhuAlKAd7HK/1yKa0lxEonNc3XjpiVgxSzOo36x7O01oWRYlHdk8hoPrQorB/QjP0q
X-Received: by 2002:aed:247b:: with SMTP id s56mr784735qtc.203.1586197615214;
        Mon, 06 Apr 2020 11:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586197615; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4I/+IvbyGFurmWz+nlgcuKzXt3yHDlKZD2WipKi9rttcimeqSO+bbzZiN1fJRKlaV
         wBnDxDXTvJyk/OHm5H8ufoNo790AjJzRzSG/GxkcwqizmH+curoCEjHL2oUbLwIoK3hV
         b749ew03w+jfCb3zX2knr5/HET98DJPVPve2tIKIA7o71dH3E5J4t893N1TlvMPb7j5C
         2adX1cx6QrtxwmdcFR442PeKRB7iCrd5oBmeGdFTnyjQIZVThpjVczt6K7Hrd2+n7LAH
         SQJ7EpGW/GOcfdyIhcuxVwYwk25OJDXH5pN8UPKjnVtCIp475m6xLuimp4rtAUO28n4h
         b7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=lcRHjxwj2IvLYyUdLYq/UMlWvaUXQxQz8jsA6VMuQkI=;
        b=NTrnJ+Ytyg6exLzUzDzDX3EK0f6Wn6jmFrrTpQlOGUT+voxJgTOSDuc/n8qPenPbdy
         8SE0uw5p9MD33Y9LFDONtRLbNdsq/GOAG9LxyQ0+y8cEFMK5hwz3TE+rGMRlk/fJQk2v
         W36almXkSvTEYlgMjYa/OCXqSis8xWmJ0DRd0YtO8hTiSOS2HJ1hL187D6UENBrkkmrj
         weW9/CYxRSBhe2xOmyRXDoOQdjxbnUFv72xOZbxfpPe1ynb0qLCUfrP7gpv0x5ZTRUyF
         RerI7gH6prE9QO9W/8NBOhzVVf9lqc7NJL1jBb2RtPNI7VVAH5Unhm9LtymfQgTMWoSR
         wjtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHCi6bur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si273945qtv.36.2020.04.06.11.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OHCi6bur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLWSU-0000Ao-Lx
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jLW3L-0000Ki-0R
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jLW3J-0002Bq-So
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jLW3J-0002BU-PM
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 14:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586196052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcRHjxwj2IvLYyUdLYq/UMlWvaUXQxQz8jsA6VMuQkI=;
 b=OHCi6burjlJfmKU2Oht6jJEUhCJJ9KTxRa4CUGHoV/SI+TWEVIHhIleEnJ1PbRuKxMyVb9
 GlzC3991kGUIOg67+zwckyvajp9rqEV20nHzAo2JLujB9WDp6u9A8JySsB+TUoCmv7H6gr
 CCYkJZgVPXWwFXDbuO20E5nuxIFoiyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-UbMHiyz7MBKGZynepQXUNw-1; Mon, 06 Apr 2020 14:00:35 -0400
X-MC-Unique: UbMHiyz7MBKGZynepQXUNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4322418C35A4;
 Mon,  6 Apr 2020 18:00:34 +0000 (UTC)
Received: from [10.3.114.49] (ovpn-114-49.phx2.redhat.com [10.3.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9385C1B0;
 Mon,  6 Apr 2020 18:00:33 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 v2 03/54] hw/arm/allwinner-a10: Move some code
 from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-4-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e9eb76ff-b81b-91ad-55c1-62da93ca8cf4@redhat.com>
Date: Mon, 6 Apr 2020 13:00:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-4-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 28u6+JGug8HQ

On 4/6/20 12:46 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Coccinelle reported:
>=20
>    $ spatch ... --timeout 60 --sp-file \
>      scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>    HANDLING: ./hw/arm/allwinner-a10.c
>    >>> possible moves from aw_a10_init() to aw_a10_realize() in ./hw/arm/=
allwinner-a10.c:77
>=20
> Move the calls using &error_fatal which don't depend of input

s/of/on/ (here, and in many subsequent messages in the series)

> updated before realize() to init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   hw/arm/allwinner-a10.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

