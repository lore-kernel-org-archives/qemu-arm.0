Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2977207lfi;
        Thu, 5 Mar 2020 06:26:13 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv6wdkkkDzIZKapf/T9dtT6i23U8tYcGmtd4Arz5mOHoMWFAI107jOtDLjgWswSos4eusLj
X-Received: by 2002:a05:620a:2191:: with SMTP id g17mr7335477qka.427.1583418373469;
        Thu, 05 Mar 2020 06:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418373; cv=none;
        d=google.com; s=arc-20160816;
        b=NGxx8gA5k8RyFSx/tDZkNKYCaYicFAiE+fQBII4uxf0GO1XM+R2d/RwuZtPQtqOSkE
         i05KPzhNzF5hbid0FLBSdyCJEfU1++iYa6Fp+nSOs3Ig9OeNpryD30HpcKn4zC7c6WUA
         kDL12h8uVpvFNPHIWE/O5tEGTWbDmdF6jpraY1Rn+PR+FKTMiyK05iJ87rIyKunqE/XD
         aBFaL2FSUisXIRbopXzUwZbZZU35DaGF7PW1Nj5xvgP7bw2PPsbo8W56qbubIbu9lG+J
         t2XXu4TJx07XP1l60l5y8EWKV+82rO0XuBCvyTQZYF+7Zy/O33PXzStxh91ZZC/Wu2WS
         ojzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:message-id:date
         :mime-version:subject:references:in-reply-to:to:from:dkim-signature
         :precedence;
        bh=kklBsHwqHz0mHomd3SuArn/pLwTElmjqphBMbCWWWwE=;
        b=IRhGw+AOVfTgtmw3xnCv6Gy5l0iwZWdcVsxrSQR1tTsEi8tE0A40wxqpxsHv7WGc+c
         z/DxYOU4tCQQtc6mr1xmQAa7TowVsff+0hw65dKmMTwgZ09zhgHS8aV2ih6KkgAtsGDR
         NIxhNgQmGFEimaSOW4UdCh5obWjtZ4W1GUwAXoMO4MjQedK3h66ED+tHt9Hhul4l3i7/
         3HTKAG33dsaCyjA6cw6i6Tmv67pKb702Jp7JyJqRjeq0bDOjB7u1sxVKUCic4G49f977
         9sndH1AZKH59D1q8TlCZAqkssy5Qxa5Du5kXCiKNyXSLYqfLdxz0fwhLR0WZY7vp70ld
         VeFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex-team.ru header.s=default header.b=mclYmM0T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si3082889qkc.151.2020.03.05.06.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex-team.ru header.s=default header.b=mclYmM0T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from localhost ([::1]:50125 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rS0-0006Ux-R6
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9rRO-00061o-08
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:25:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9rRM-00060f-Qc
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:25:33 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:41258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lekiravi@yandex-team.ru>)
 id 1j9rR9-0005lY-D9; Thu, 05 Mar 2020 09:25:20 -0500
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9AE9B2E154F;
 Thu,  5 Mar 2020 17:25:14 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 z5MNPQhVm2-PBO06DpE; Thu, 05 Mar 2020 17:25:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583418314; bh=YyF2qBT8dm3IZGrfiOfUkAj9l9sxVno25dxtEJYNu9s=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=mclYmM0T5/GYKQWvd06n/AP7uK3ujTwm+rq5ZfUyy7ssRi+6foz4CwBc506ZleAaA
 9Mwe4pQ12xO/Xuiv70sxX/Uu3NNlloZG8VC92BGPknHEYN0TOcYDPSe2h0nM7IOLDJ
 kVh2HZoqnwxdVfYWPpOr9CBpKmZFQB/G+EvpMuZA=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1g.mail.yandex.net (localhost [::1])
 by mxbackcorp1g.mail.yandex.net with LMTP id iUMswpJpt2-EsudiJzi
 for <lekiravi@yandex-team.ru>; Thu, 05 Mar 2020 17:25:01 +0300
Received: by vla1-bfecef18a7a0.qloud-c.yandex.net with HTTP;
 Thu, 05 Mar 2020 17:25:01 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Markus Armbruster <armbru@redhat.com>
In-Reply-To: <274ce4fc-f7ef-791c-7c25-c99b694c1e78@redhat.com>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
 <274ce4fc-f7ef-791c-7c25-c99b694c1e78@redhat.com>
Subject: Re: [PATCH v2 1/4] qapi: net: Add query-netdevs command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Mar 2020 17:25:11 +0300
Message-Id: <1039831583412539@myt4-457577cc370d.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 95.108.205.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Pirko <jiri@resnulli.us>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mOE2r4JPCndm



04.03.2020, 18:57, "Laurent Vivier" <lvivier@redhat.com>:
> On 04/03/2020 14:06, Alexey Kirillov wrote:
>> =C2=A0Add a qmp command that provides information about currently atta=
ched
>> =C2=A0network devices and their configuration.
>>
>> =C2=A0Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>> =C2=A0---
>> =C2=A0=C2=A0include/net/net.h | 1 +
>> =C2=A0=C2=A0net/hub.c | 8 +++
>> =C2=A0=C2=A0net/l2tpv3.c | 19 +++++++
>> =C2=A0=C2=A0net/net.c | 91 +++++++++++++++++++++++++++++++++
>> =C2=A0=C2=A0net/netmap.c | 13 +++++
>> =C2=A0=C2=A0net/slirp.c | 126 ++++++++++++++++++++++++++++++++++++++++=
++++++
>> =C2=A0=C2=A0net/socket.c | 71 ++++++++++++++++++++++++++
>> =C2=A0=C2=A0net/tap-win32.c | 9 ++++
>> =C2=A0=C2=A0net/tap.c | 103 +++++++++++++++++++++++++++++++++++--
>> =C2=A0=C2=A0net/vde.c | 26 ++++++++++
>> =C2=A0=C2=A0net/vhost-user.c | 18 +++++--
>> =C2=A0=C2=A0qapi/net.json | 89 ++++++++++++++++++++++++++++++++
>> =C2=A0=C2=A012 files changed, 566 insertions(+), 8 deletions(-)
>
> ...
>> =C2=A0diff --git a/net/net.c b/net/net.c
>> =C2=A0index 9e93c3f8a1..01e0548295 100644
>> =C2=A0--- a/net/net.c
>> =C2=A0+++ b/net/net.c
>> =C2=A0@@ -54,6 +54,7 @@
>> =C2=A0=C2=A0#include "sysemu/sysemu.h"
>> =C2=A0=C2=A0#include "net/filter.h"
>> =C2=A0=C2=A0#include "qapi/string-output-visitor.h"
>> =C2=A0+#include "qapi/clone-visitor.h"
>>
>> =C2=A0=C2=A0/* Net bridge is currently not supported for W32. */
>> =C2=A0=C2=A0#if !defined(_WIN32)
>> =C2=A0@@ -128,6 +129,12 @@ char *qemu_mac_strdup_printf(const uint8_t =
*macaddr)
>>
>> =C2=A0=C2=A0void qemu_format_nic_info_str(NetClientState *nc, uint8_t =
macaddr[6])
>> =C2=A0=C2=A0{
>> =C2=A0+ g_assert(nc->stored_config);
>> =C2=A0+
>> =C2=A0+ g_free(nc->stored_config->u.nic.macaddr);
>> =C2=A0+ nc->stored_config->u.nic.macaddr =3D g_strdup_printf(MAC_FMT,
>> =C2=A0+ MAC_ARG(macaddr));
>> =C2=A0+
>
> Why do you use this rather than the qemu_mac_strdup_printf() function
> defined above?
>
> qemu_mac_strdup_printf():
> =C2=A0=C2=A0890ee6abb385 ("net: add MAC address string printer")
>
> MAC_FMT/MAC_ARG:
> =C2=A0=C2=A06d1d4939a647 ("net: Add macros for MAC address tracing")
>
> MAC_FMT/MAC_ARG seems to be reserved for tracing.
>
> Thanks,
> Laurent

Somehow, I managed not to notice this feature.
Thank you for pointing this out, I will definitely fix this place.

--=C2=A0
Alexey Kirillov
Yandex.Cloud

