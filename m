Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2718662lfg;
        Mon, 2 Mar 2020 10:05:44 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtUav4bUl5KQ/oh+22EImIFlnou0YsCw8wNueymSz/F9rwHH48YGFYDcMfrxHJxWpvjJ3Ta
X-Received: by 2002:a05:620a:8c8:: with SMTP id z8mr465875qkz.205.1583172343915;
        Mon, 02 Mar 2020 10:05:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583172343; cv=none;
        d=google.com; s=arc-20160816;
        b=tfquVsFb1le2kiDkDQp42c0hdy/bK81isyNFYN1X9ERXFcRcKK7MD08k6Qy24UCEkv
         ePRM6cFhdHl2v+HQL/849oABzF8FLDQgNx/L4tlgJMDlDnCAzaXRuJn/nNKgTDK8crum
         MXvt210Oyqi4cDZ02+y8IJy/B3unzIQzdBO4II5oUKGWQnEZ01aMTm82lENzizAXI3Ov
         UrxOYcr24Tve8vbkLE3VsreR+qOhwRltyR9nf5elG5WGx0nZjTaDcO7br25QVe9rsWKw
         PeAYtU3xA2rV251wv2RiEdjWQXps30CUQqtDdz/2s5Y5X3T7GHRpgPDu4UBiQZfnvaOw
         ffJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OZAKp698nDFtpKLNLur9DnETix6IWAkZVq0kZKRLyaE=;
        b=Uyhfun8IqHXI+ys61WMtrnQUsHpRW0ERZGUP7nXxVJeZ6qDgqMYXKOj8s8R1L+nQlb
         Slm5/1owMPOphZXJkVxBJdZAtpQvupkIrR5b36U0saaAtLt5BN8LWLrchKP5ay2k+V9I
         58B5OhNWFidvVgHLlzst86ckwTin92AFdI8EzcPmkXaArC9LI1r3fN5NW+SFI4IzBm3C
         sGBK72NCYjeeA82Qys4Wo7KIexa0+5/7WwBiyAUvFLwZXubOQv4kO9KJagpTHlgW4W6+
         xqKdXM6WFsLmrjB6hGaGvn5ObxL8uK0NdcMjvMq9GIbvESzoh9Gfhx6wFsF0RAtFSIYK
         bJkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PuqDrvCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si2762794qvv.33.2020.03.02.10.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 10:05:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PuqDrvCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pRn-0008Pl-BW
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 13:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8pRI-0008KI-L6
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8pRH-0001Ia-Iw
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:05:12 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39294
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8pRH-0001I8-Ex
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583172310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZAKp698nDFtpKLNLur9DnETix6IWAkZVq0kZKRLyaE=;
 b=PuqDrvCmG8k0q67dc8vhJLRw3tNI3cH1JZxFIPmyvDhCDlZhcIuaCjJpa3mlMNiNIk2Uc3
 LaqdxKfi1JjqzIYnu5CFYiwAIidDadaHHrot9P6jpnzbVd9X4TMw/CPTOfUn+5YAaVVl4K
 Gt9fSXSwuaiGk8USf9z32qOGLS6wSZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-vcwmE-koOjiHDQG7vnfwQg-1; Mon, 02 Mar 2020 13:05:05 -0500
X-MC-Unique: vcwmE-koOjiHDQG7vnfwQg-1
Received: by mail-wm1-f72.google.com with SMTP id c5so46375wmd.8
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lMCEoIAGm1SUink9H674IdUAkOanssyTdWx6QJzNTYU=;
 b=k8qI2MA8x1lRsAyN1lzMtqLuUKgQrD9nznwu4jUgoYYDxE9GPY2E3e7Z7o1SPGgHXD
 cQ8oVaJTvadn3mS/m7H1Kx1lR7bjLu6tRkZWSDAHk2/KGA3MJi4AjAbsZDEzxyyZJp28
 6SH4HDkquT0tOSSTkh+P3oSj9cl29Hyfr9TwRkKm10QSORKUwPoDEWbJfL7wXczJIYtt
 rL7TIsPvnnaaZsUoRK16aoqk312SKH16PUILhiWHT3xG5kzZnHKHA6bI0NoV8vAA+akS
 xvsiJFn8spjvtYpxaXy0LlDAb5BG8AbvnzoUlZWdSVx+D6H9livcrVNKsxh5OOYPoVBA
 YNCQ==
X-Gm-Message-State: ANhLgQ1u1Xhf26A4lsoaHSwqZA7Rd/HrhpVX0K976nuLXGCfLNRlayYk
 2d2cb1YTxwFs//eiGcNHksZ/WUm/hxLxctXqs/ewSqFRUadAEhhU9BCe4OdeyEEJlFE1o6o+uDM
 pX43d8LT0mepGRWA=
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr285656wml.90.1583172304833;
 Mon, 02 Mar 2020 10:05:04 -0800 (PST)
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr285627wml.90.1583172304574;
 Mon, 02 Mar 2020 10:05:04 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id l4sm252508wmf.38.2020.03.02.10.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:05:03 -0800 (PST)
Subject: Re: [PATCH v1 0/4] hw/arm/cubieboard: correct CPU type and add
 machine argument checks
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7aa65cd8-713a-c89c-ec43-74aa4393991e@redhat.com>
Date: Mon, 2 Mar 2020 19:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pIMxyCUtMjJ2

On 2/27/20 11:01 PM, Niek Linnenbank wrote:
> These patches change the Cubieboard machine definition to use the
> correct CPU type, which is ARM Cortex-A8 instead of ARM Cortex-A9.
>=20
> Additionally, add some sanity checks for the machine input
> arguments in the initialization function.
>=20
> Niek Linnenbank (4):
>    hw/arm/cubieboard: use ARM Cortex-A8 as the default CPU in machine
>      definition
>    hw/arm/cubieboard: restrict allowed CPU type to ARM Cortex-A8
>    hw/arm/cubieboard: restrict allowed RAM size to 512MiB and 1GiB
>    hw/arm/cubieboard: report error when using unsupported -bios argument
>=20
>   hw/arm/cubieboard.c | 29 ++++++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
>=20

Series:
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

