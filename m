Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp24550qvb;
        Wed, 13 Jan 2021 05:42:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysXd/OU+cVycqp2aBBfY9ANKFMTuoWL9EQOmLGYukpvjPpX82s88Rk2q9X4/Vu7oyyXqlO
X-Received: by 2002:a25:10c3:: with SMTP id 186mr3125575ybq.195.1610545336116;
        Wed, 13 Jan 2021 05:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610545336; cv=none;
        d=google.com; s=arc-20160816;
        b=hRU93NzcqJSnVkxOlExoVK7BlREbx6u3EBtLuOLbk5ZviVI5WvdN2AR9gzn/3sbdtT
         pVJlstZHkkdBst/NkxfB9U4t9apohndvtfS4uYIw+kj4IikVtfKzz5cB9xpZNT8+F0cn
         R43I+/ms31fXH/+hhUF529fXI57DMYl42ewRMQAzF5d0QssyJYoxnaREAwn7uQHwcnsO
         7kCfFMrVRE9LA/7qsO8xSM552vjm3MYF3+moM7XWZPLsc/RtvU8qdSorfQ0MSh9Hpbb6
         I2WWaS6d21GyeWq9BjtL2kW8ZdT6PvqydhMiKdpZ/0CyFcd9VAxTwvgqipNidVYk7djN
         5ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=1M1HVPG5x/EzzQTgE+1UfMy6ZGLaTVSVKbBp8UB9Hvw=;
        b=Xp1PCXNiFj9jAUrKJCEuvlfAz5En3hrZ86MCAfFy9igeth3iiSk+r2oC2ywLdowoC1
         nh+l0TfJsSVRb1aWPJgjdCZ5tLf//qWRecl3ajPXOzcX86c1/AZEDWIxddgzo7OCg5JL
         VXWxuMxy+o+WiBdNjqFx1/iEXvO2xbI0uNbr7xxFfPZIViNWWD89TvP7/Qh1Qjo6TdVW
         B5n2ak2AXBaNyee9TsdPWBUHTJTcM9vThKei9YUaRaxp0YaBIlGoRst1K4iDmZz8Z9iZ
         HvQOBgLxYB/QaGBrJkzbU8aDx0lMqGmVzBXjXC6XITK3MSC9chS3VJfwrAoGWJ3nhttF
         qKzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZQ9lh9Hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w133si2233185ybe.292.2021.01.13.05.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZQ9lh9Hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzgPf-0000dQ-KP
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgPH-0000cy-Ti
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgPG-0001dF-6h
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545307;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1M1HVPG5x/EzzQTgE+1UfMy6ZGLaTVSVKbBp8UB9Hvw=;
 b=ZQ9lh9HgwI84W1jxYmj7gpD5Bw3eJQxc6CMCo5WHha5WpLhA/VJrzvgdy2fWkkOcz+/Ycl
 +dtGeBbrxz4hFEqkOl0V173k6Lle7w08X6FddhZyWNAvU8H/Z/molzi6TpOg2OSZamhV2X
 8FAwG0s76jGrjj3tVzLr3alzE+kVG2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-NGkEVNczP-ejJvESeh1PWA-1; Wed, 13 Jan 2021 08:41:46 -0500
X-MC-Unique: NGkEVNczP-ejJvESeh1PWA-1
Received: by mail-wm1-f72.google.com with SMTP id c2so1654906wme.0
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 05:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N2MHTxwdhCvA6Y9T2q3kdbtmuus9DH5udATDeE2ah9Y=;
 b=V2no7sIfISdw3MKLe1yqRviU4zQmCXqT9qdPM0g/x/du28oge5YUZxkpQcf+NCeHYE
 zLZVe5OHBiHXiPaAkgOILVFyKvOCFknmJS1hUo0DINC9i62dl0Ris9PuD3SiGkfKB1go
 7Wnbf6NdUJQLlC4c08bY1fwsXQ5nnKiRAGLRXzdI5nHFCEY78eyeS4qyuAalVWRZalEB
 xyV9CAJo7941+EPPfjPMuLz12ensLyW5ji/nPI409bnKIhTpj87sHKSXrE8Ba/p0fcp9
 hCE8t5W12yl4V28fOa46MGXQfleGobWrwyWyXSaKk2klfjtqHfWE8DjgoFGAcGe8eHhc
 z1MQ==
X-Gm-Message-State: AOAM530j/qHbXT/gctfC25tIz28yAPgcK/C2LJzd1kf4jQySn7N87YL0
 1oGvcqWx1q5kkZjZZqD8oYGB1mwK7kvDCaI3QzhHDjIogBI/TBI/l3cCFXnWNx4z0oSxZlC6AeI
 H/scbuBKUKW9n
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr2302033wmc.98.1610545305129;
 Wed, 13 Jan 2021 05:41:45 -0800 (PST)
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr2302016wmc.98.1610545304948;
 Wed, 13 Jan 2021 05:41:44 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id n11sm3839020wra.9.2021.01.13.05.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:41:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 04/11] hw/ssi: imx_spi: Reduce 'change_mask'
 variable scope
In-Reply-To: <20210112183529.2011863-5-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:22
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-5-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:41:43 +0100
Message-ID: <87im81gdig.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CfVbxoHGHHei

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I think this one is wrong.


> ---
>  hw/ssi/imx_spi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 35ab33c0511..bcc535f2893 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -303,7 +303,6 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
>  {
>      IMXSPIState *s =3D opaque;
>      uint32_t index =3D offset >> 2;
> -    uint32_t change_mask;
> =20
>      if (index >=3D  ECSPI_MAX) {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0=
x%"
> @@ -313,7 +312,6 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
> =20
>      trace_imx_spi_write(index, imx_spi_reg_name(index), value);
> =20
> -    change_mask =3D s->regs[index] ^ value;
> =20
>      switch (index) {
>      case ECSPI_RXDATA:
> @@ -357,6 +355,7 @@ static void imx_spi_write(void *opaque, hwaddr offset=
, uint64_t value,
>          }
> =20
>          if (imx_spi_channel_is_master(s)) {
> +            uint32_t change_mask =3D s->regs[index] ^ value;
>              int i;
> =20
>              /* We are in master mode */

The code does:

    change_mask =3D s->regs[index] ^ value;

    switch (index) {

    ...

    case ECSPI_CONREG:
        s->regs[ECSPI_CONREG] =3D value;  <<---- here

        if (!imx_spi_is_enabled(s)) {
            /* device is disabled, so this is a reset */
            imx_spi_reset(DEVICE(s));
            return;
        }

        if (imx_spi_channel_is_master(s)) {
            int i;
       >>>>>  You are setting change_mask here.

At this point, s->regs[index] has a new value in "here".

Later, Juan.

