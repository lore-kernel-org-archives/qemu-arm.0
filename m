Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp701043lfp;
        Thu, 23 Jan 2020 06:10:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyO8FbdYqMVufuNDTNHLMFyiChlLWVoEEeKK4TLbYG+ntEl+39/LpoRlvnYYmuRfgu8h8C
X-Received: by 2002:ac8:1851:: with SMTP id n17mr16535013qtk.305.1579788619126;
        Thu, 23 Jan 2020 06:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579788619; cv=none;
        d=google.com; s=arc-20160816;
        b=02HIzjonyEhQHZPekW9WZy4IVbLLEmJRFPVaeGWeuIBei5SkTfuXfYPMrOGTW32Oan
         k+laEJYhvu4aCfMa316sFAICnUC4zi3nnWF8+YbgXvYUfhIUOc5MeOZVJPiNvM8VplQX
         KS/USNl+m0VhI0YYwePUhtG9VOLUwlYjsI/IPp8QwyOD3dBgGrgDduFnbvL/2+c4Uy6S
         lX6bWvyM1nN2SyvLF3A/VtwAUBIEOHahwqMkyFKAy3QKZ2vhdtXA5zwrzhrxjwqde6CK
         OoHASlK41Ejg5u5/ubIaWeZ+BxdxIpsfthMgqzmS1ZsAxOABwAUgT4s8m+e6cS+BLc54
         NjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=TBORFnp+tciqid/2artkp/ttKTE5+gfgU5ltKs/48yc=;
        b=x147vuZ9LwAVT/kXjwrvc3h6X2fJGW+3fE+CW0lilxmPCxX0/yTMLPRSbttvh3P6bJ
         /nPoKvQqStaaVmNcDF2MqyVsbxLG8UcGjkmGHMW1EUb6nkiUJbjP1LysQsr8chxIpWsd
         i6CA8QPBq5RNRf7DRpwnGjgTtZiEygo85I2EazJCRuzEOyIuOEaPj2lqBD3Ga6bNeSsI
         nyzAfREKxXFz/zBfEd1HSMLHXcJIGwx25G4bgAEvKPYli+D2C2ahcLwTr+7F+huDaiBp
         ErWzhhZyK6K4Pii1xfSNeqhIjAho5OZNNFoBbSqiVCMx5+ZAy8UaQESocszb21S5Lz85
         xBWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cEsyBPjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si1535456qki.127.2020.01.23.06.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:10:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cEsyBPjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudBZ-00072O-Pq
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iubfI-0001lj-RY
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:32:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iubfH-0002QX-Mo
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:32:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56987
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iubfH-0002Q5-JM
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579782771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBORFnp+tciqid/2artkp/ttKTE5+gfgU5ltKs/48yc=;
 b=cEsyBPjdcub3Qs9ixSxnMQpsEIczST+2vK0G97GDKlhxba1VUQWlX0+u6O2dw21g+Lsw5x
 ZTpRxCgMG1/rilgG2xVJSW8j4mLYT4xMEqB53BShgbFGdZMKnd0ChnEPvACVuprKxCAZ00
 MOd2lAZREXnEkAsEKMBRN56eERfmi5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-vOpOihrVO8ySE7LdiDGVBw-1; Thu, 23 Jan 2020 07:32:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 655351084426;
 Thu, 23 Jan 2020 12:32:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3B45DA70;
 Thu, 23 Jan 2020 12:32:45 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:32:42 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 11/80] arm/digic_boards: use memdev for RAM
Message-ID: <20200123123242.lacjilhmionmhnzx@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-12-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-12-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: vOpOihrVO8ySE7LdiDGVBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 antonynpavlov@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +lxQv9y1JrgK

On Thu, Jan 23, 2020 at 12:37:36PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  remove no longer needed DigicBoardState
>=20
> PS2:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * move 'DigicState *s' declaration to the top of digic4_board_init()
> v2:
>   * fix format string causing build failure on 32-bit host
>     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
>=20
> CC: drjones@redhat.com
> CC: antonynpavlov@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/digic_boards.c | 40 +++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
>

I don't know anything about digic_boards, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>=20

