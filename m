Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2552049wrt;
        Thu, 11 Oct 2018 07:09:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV623MoO0BmgK9LibahP0SlpXpz2Wciv890FBTl3bglD9rnzY+GmVGa2SZmq+pT/VSYWJIOSb
X-Received: by 2002:a37:6046:: with SMTP id u67-v6mr1628464qkb.62.1539266949844;
        Thu, 11 Oct 2018 07:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539266949; cv=none;
        d=google.com; s=arc-20160816;
        b=EO4BSJt0mBhL1YfW4P66NUydds0FrfRnhBHNl0nOgiyqmFgJUFgd6vTlt40d2fs/7G
         AuwJH3Wdo0PXyL8hqtNwpLmwCGw5aRfnJD9iyPk353S52dQwTeuGAGshelb7KMxPQlNw
         FKJA3fmji4hXrOJIoMKULfYdnckX3Fj3QkiRVCrgUv/3PcDaJx4Osa5r5+VPfuZEVxwL
         keb2UUD9Gn7SbU8ClsWBgV6ntOKPxysqn6PJLN75TRwWaerLv9+6c10T6Cm+kHQROFmd
         5t8ZTWvs8esyo5+6gxkrDvEtlMFvo8Z2hENj2iXsQtjiJF114UADoCPx+kQjZqFT1omL
         jxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:to:from:dkim-signature;
        bh=Vwe8h/OGkJjkZ6N0fVCulDuVX2UDsGc6QzTxrOZ4TwA=;
        b=oRbbJJN4zSle0rbhqGgHHgReIWp5KG4Zj2YM+Ld0ZCct4Qyh/pfP1mFRkWr+bgvhxz
         puIY6VZxPUD2tW0i44io5LgnpuEGWHVxHRjdrYAxRgD10hDqaihhpkfKY3tIs4liOpvK
         iONGhKKryBbJz1YLF7KP1ZJ0876jeloKG9eVos6tQ6iuxbrZDwZlC6cxZhCZorSZiit1
         f1j92tXHuaOG7zr29bZ1YxtmHC9pz/F6SzrNHC4z54TV5HM09KA/oI3j5gaQxbmpo/wF
         1jMrC05D4+rboJfiUzcuMvhFLjiWrRZEVfhPHRSg81TSmWmPT6WwQBXdS0yjljQVt2qi
         Oe8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=O+m7FtM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15-v6si16452359qku.267.2018.10.11.07.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 07:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=O+m7FtM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAbeH-0004fD-6Y
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 10:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1gAbe7-0004dN-IO
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 10:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1gAbe6-0005gk-SH
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 10:08:59 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:51068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1gAbdz-0005YX-Jx; Thu, 11 Oct 2018 10:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=Vwe8h/OGkJjkZ6N0fVCulDuVX2UDsGc6QzTxrOZ4TwA=; 
	b=O+m7FtM1K/qSQsSqcG/BXR10zfH7PgT2McQDZQvTIbIze52Bq0tdhnvUItd9Pi9TVGwZE/59gn5oIRIOMHT9MurtZ2wr0dFyFfzjnimOaZJky5B8yYx1Zn0VQzvF3d/TQq6ZBOH0tE4F/jOUUuYVD5TgLduVKczi8DOc230FRdAhP0C6WOB8DnZU22ei1ldRdkMeW8wRKa1Z1nUPj/MQrlCWs5r8d7eNs7qW6FoiMDKnzfWZ3v/FKJM8PhfNV2cZUax7EgSj+Bmrb7zjGQHWfTDlt/QntWeYCBJRQtrpLNDOsd0mu5/x8GwyBlq+z7UsWTswokK631L7RCvq3FreCg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1gAbdx-0002Sz-2t; Thu, 11 Oct 2018 16:08:49 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1gAbdx-0007BT-0S; Thu, 11 Oct 2018 16:08:49 +0200
From: Alberto Garcia <berto@igalia.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Prasad J
	Pandit <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20181011131413.22208-1-philmd@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Thu, 11 Oct 2018 16:08:48 +0200
Message-ID: <w514ldsmv7z.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-arm] [PATCH] chardev: Convert IOReadHandler to read an
 unsigned number of bytes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	"open list:sPAPR" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rx0CtXXyfiRK

On Thu 11 Oct 2018 03:14:13 PM CEST, Philippe Mathieu-Daud=C3=A9 wrote:
> diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
> index 5e09caf851..ba3f3408a2 100644
> --- a/hw/char/ipoctal232.c
> +++ b/hw/char/ipoctal232.c
> @@ -461,14 +461,14 @@ static void mem_write8(IPackDevice *ip, uint32_t ad=
dr, uint8_t val)
>      }
>  }
>=20=20
> -static int hostdev_can_receive(void *opaque)
> +static size_t hostdev_can_receive(void *opaque)
>  {
>      SCC2698Channel *ch =3D opaque;
>      int available_bytes =3D RX_FIFO_SIZE - ch->rx_pending;
>      return ch->rx_enabled ? available_bytes : 0;
>  }
>=20=20
> -static void hostdev_receive(void *opaque, const uint8_t *buf, int size)
> +static void hostdev_receive(void *opaque, const uint8_t *buf, size_t siz=
e)
>  {
>      SCC2698Channel *ch =3D opaque;
>      IPOctalState *dev =3D ch->ipoctal;

Acked-by: Alberto Garcia <berto@igalia.com>

Berto
