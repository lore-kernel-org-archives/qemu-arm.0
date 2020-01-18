Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp566198lff;
        Sat, 18 Jan 2020 07:39:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQQY1tHyHrCFziqPAK0BGToD94qQ5efmIrn2bkgxJKt9hBBgahqrOsFV0Ha7ld0FSKvwPL
X-Received: by 2002:aa7:d80d:: with SMTP id v13mr9746989edq.8.1579361965435;
        Sat, 18 Jan 2020 07:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579361965; cv=none;
        d=google.com; s=arc-20160816;
        b=on0U593MX7i5Vpr6HejZ7h4dm72ffELfy2H1VzfdHAUV4YPxG7hXqRQ6T/wa+4O0f0
         0jwLFheWzTKJmwtl1PLmUHiLTWFVNxbzr7LYkG6KwdJTKc/rZB7Fs7vkPx6K44vHoXJe
         dEc6U4TmWbKWzhJjUPLICdj64R1asXZ8MXmpXhgrtPBWqmU/rg88mXxJRXYlURHsJuFn
         Nu1AlpFgjKBlXy0leWx0gM2WYwq/kXwz5UXK6X8bAkllF0sGvdVYOQQ+Csc//MmwXMAh
         LqjUxbNLmMkpzswncwJpVBBYxmpnAhhQVGD0aBpvqQr9sTzKu8P7A6pqWTs/SGznegRk
         Re2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KkAm8xMOu305hVVU8Iq9Llxt8o9rYmI6atVtTp/Bxyc=;
        b=HVfA845nXhsneJGXh3V9f4TAjqXpUGHm8ZBVLy6bFcIrEjbkzOBALgXi3KmbqJK06Y
         BSJRf5oLB7AnJHYFK2ebKdjsNAHbwy8PPtjhtaXXENSx3T3CsVkKIFFl/X/YJqZwXkAL
         M0Eo3CObca91OC9pS89+pZuzx7eF1jRSSFSx4LujvxQ1WPPZBGy66LzLLk8feGq0O+3+
         TLqWLoWefJLyPYhCQ77oTelFCOYKUm1FmmeNmHw2TT/6nG//qoBRzKtwXJ3obTwojAob
         nS2txkKanNrau32qZpFjSye+nr4X6nWIEoCQPWT91mPuyo2eW0PAGqNSZQ5mUNyQwPyj
         XNEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CbojLROu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ce16si20661268edb.431.2020.01.18.07.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 07:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CbojLROu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isqC4-0000J2-BF
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 10:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isqBv-0000IY-G9
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isqBu-0008MK-Er
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:39:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38369
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isqBu-0008Kh-Bq
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579361953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkAm8xMOu305hVVU8Iq9Llxt8o9rYmI6atVtTp/Bxyc=;
 b=CbojLROuMi9jCfTL4sSyHU67QyyNqb9cKRD/ElgpaO0+ZnTF4xQAvE9fIEYd5U/r0BC+D/
 F1L5ebA6v3jhKPuuDdmHccAy0l1JGaqaih3TX5j4txHR2L5E5I+f5Nn2fe8yNuTC4JxFsT
 IDkR6DrZHpVp5NYkqh1JTKEGiwmmrps=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-f0aZBvWMPVelayIxCeomNw-1; Sat, 18 Jan 2020 10:39:12 -0500
Received: by mail-wr1-f71.google.com with SMTP id z10so11771514wrt.21
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 07:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KBhmithM/eVBvOeOZkqqwHiOAaxsa0FQBJXrl4Mnl/A=;
 b=DX+qbFaOT+AeE/EMdeuh7ImTrUf2RMYT/EpxUG9WIT84Pd+FA2ck+XmEMob0FAIQPL
 42ALFtBEnReLLqVV7IQXlvuZIUA8EqpKdLXPa96uvHAxUGw0hGz3hu8/A3wWjYxAOPcC
 crjAcYzf+YIk6yom9wS4HuG3qarjsz9Pselcgxh3oo4CAtyJS/UDoIuBhmuqNQ0YrQUB
 0UYXxCgx84zzS+6+uW2Txp8TyaWF6q00MZ8x37Q5Gu9cagudGE+FpxaLKTE2xnbSJp25
 tPOngifNubebiQsBMLH+uh/TUYQYtVA15hey+5ehbwBXcvrzGY8p4CafOlb6jnGYctYm
 fbKQ==
X-Gm-Message-State: APjAAAXMFwjKGULiIZyXzN+io+UcaNAH1uQluJGJS1YOl6Vx5QU2S47s
 qNZIQwU89QfCbiHBDFjX6NWi4YB2RcbPTA5GJ953QXYdpmBtIr3yHk2WYRvjolEaj2hyzCmH5Dk
 FKkYDV0pcG5ZY
X-Received: by 2002:adf:f78e:: with SMTP id q14mr8648501wrp.186.1579361951206; 
 Sat, 18 Jan 2020 07:39:11 -0800 (PST)
X-Received: by 2002:adf:f78e:: with SMTP id q14mr8648491wrp.186.1579361951025; 
 Sat, 18 Jan 2020 07:39:11 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id x7sm38106032wrq.41.2020.01.18.07.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 07:39:10 -0800 (PST)
Subject: Re: [PATCH v3 08/17] hw/arm/allwinner: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-9-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f25acc0-eb0b-085d-9479-144dca324dee@redhat.com>
Date: Sat, 18 Jan 2020 16:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-9-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: f0aZBvWMPVelayIxCeomNw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U04ma118GD72

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> The Allwinner System on Chip families sun4i and above contain
> an integrated storage controller for Secure Digital (SD) and
> Multi Media Card (MMC) interfaces. This commit adds support
> for the Allwinner SD/MMC storage controller with the following
> emulated features:
>=20
>   * DMA transfers
>   * Direct FIFO I/O
>   * Short/Long format command responses
>   * Auto-Stop command (CMD12)
>   * Insert & remove card detection
>=20
> The following boards are extended with the SD host controller:
>=20
>   * Cubieboard (hw/arm/cubieboard.c)
>   * Orange Pi PC (hw/arm/orangepi.c)
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-a10.h   |   4 +-
>   include/hw/arm/allwinner-h3.h    |   3 +
>   include/hw/sd/allwinner-sdhost.h | 136 +++++
>   hw/arm/allwinner-a10.c           |  10 +
>   hw/arm/allwinner-h3.c            |  15 +-
>   hw/arm/cubieboard.c              |  15 +
>   hw/arm/orangepi.c                |  16 +
>   hw/sd/allwinner-sdhost.c         | 848 +++++++++++++++++++++++++++++++
>   hw/sd/Makefile.objs              |   1 +
>   hw/sd/trace-events               |   7 +
>   10 files changed, 1053 insertions(+), 2 deletions(-)
>   create mode 100644 include/hw/sd/allwinner-sdhost.h
>   create mode 100644 hw/sd/allwinner-sdhost.c

So far:
Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

