Received: by 10.25.0.6 with SMTP id 6csp1882159lfa;
        Tue, 16 May 2017 06:57:50 -0700 (PDT)
X-Received: by 10.55.27.101 with SMTP id b98mr11032261qkb.282.1494943070321;
        Tue, 16 May 2017 06:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494943070; cv=none;
        d=google.com; s=arc-20160816;
        b=irGm7i9cJ2GFHfxB2YRCt9Sp22IglN6PLkxotOMOwUErPUE59z96DlSVnSgvgJe4MH
         kMdaZvIUtIFXm4G3ODTjT5lHuDEF2Q7pUJT4ir8+bfizwFO3KsuPTan24xTCtVwZ70gN
         yBxvCRXd1z0qTQHAuD31RsnChCZIt8Xf3AQLTcHAgALcyivsvm3T2IdU4cHH0r04WFFG
         ZRXfJkzZLZ9RAaNFO2cM82Sj3EE3eh0IdsYFnSt/w5mUkOrbWbEYRepfAEDCI/gX6iRy
         WPabhI8mPSB563nHRganpNAnwuH5Odg8ZN2jGhPgmciTYPLmFehFBrdYJFhrjkquHfw7
         pPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-length:mime-version:references
         :in-reply-to:message-id:to:date:dkim-signature
         :arc-authentication-results;
        bh=noDzO9PanLwU12/totvhQQ2X7LMHuKd5Fircw61FJhY=;
        b=IxJHSOdzOHMWugc1oADJbDPA3XwQhRNCaOBwkzhpVV5YH6kRqkzer3F4BMKExCGOzp
         Xa5EKfYFSTG9tlohLRKO0kjKRU8gTq2hq/RHXkg7lByJNj788zw2EIk4p7qoa4lItKIo
         kXJhX7HjuE6SCo+PZgkgiy+CetpHVNoNiddFEjoKvVFU3a77qFkW3Ii/CjCzwnCXffXE
         3JA1GQNjpzDLC++HIYY4WlyXEVy9fgguZLPB+3llAJBeNQqn4XNAoVmrSLIHRJb+bl/W
         UGAq6oGwViXpPq5c3W4u4Lq2ygYjfiXK3tFyFwIdaaJnXVqF0N4XBkxam2eFJeNtKSkR
         qqoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si13768725qty.276.2017.05.16.06.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 06:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAcyz-0008Oi-PA
	for alex.bennee@linaro.org; Tue, 16 May 2017 09:57:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAcwx-00075e-Ut
	for qemu-devel@nongnu.org; Tue, 16 May 2017 09:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAcwu-0004ZT-17
	for qemu-devel@nongnu.org; Tue, 16 May 2017 09:55:44 -0400
Received: from sonic303-47.consmr.mail.ir2.yahoo.com ([77.238.178.228]:38547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dAcwt-0004YQ-KL
	for qemu-devel@nongnu.org; Tue, 16 May 2017 09:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1494942938; bh=nok3Xvlry8cZuBPvGBfIpbT1GKgHd1yPHfnJFeZ2DNY=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=UWQ95M241gKduUykxD8wRno16ZAhtq4OLxzXsDc26iUzTMHp9Q8RCCTkQKmdrCrv2FQSe3OdRYKt0L5e9KsyjDQfhEczYgvKqh4ZC4cjhYK8eLIyrBW8Dbn1O6OfafHdZzlzx+qdol+E/UPG7rpTj0GuHm9pjNIMgz9tWRO3nhAAIY1jpnvKDcyFfO4bcKZCDOb+rU8w5kXNnnmuFfL2Q5OJfMt99ZLZrocOIvfVW2U/e1qXjSIQ1RaZGg8QctX7K79JgOhtp3ViJeWz2bAHbz5DxF06AZb0IkyKbg1DVEe7y/Qcvhw26t80WYOJCE+F0tb2r84DoKMWCsolbbFVlg==
X-YMail-OSG: 69LP8gcVM1kxWCf4a0.eaK_3AAHv.MhfQB0Y4sikJn4EI3dLTjbefBXLdoHXoXc
	dAL6pMWoAIH16HiRrCoaYITf5lYsAEgnvtoGVTOwQIqLQdPikgGRiPCHMQ8lAjqgLJqkC6D9QSCt
	ZzPIJtDpNbPBZWNkG58Tfen4Ok7xNtnyb_939W6ZyxzGG4oYuLgL4dG1KHVhJaHeD90S6TNMlzHj
	VLc.7VCm6kaC5CWGa5wK3e7P4y7AMFsuUUjDn4.dI3csK8PKA_selJB0xYJBHCEig0gIPoveENgU
	u_pH_BmcGNvs1hE5pwFKrJic5yXwhlC_OEY0hzR_XyFR4zQBOLjPL1jzXT41vlcsckN3_mIzP8X.
	TGbQQDDaf5xIFcozRnr_ILVUgbYDQfIa4AzQNA8k9inKHd0wT9qXtJqYFBZUvv7fJ1figjlAX.pP
	uipzTQAMOAmqA3Te7ymU0YIxcxpSU_0oHcfjLXI9CTJTyNOY0KzDjsgEvl0vffuvf8MhCqR338Yo
	mxaJjHbjwPI_0e5z8trIxXYz2uFQxgBekBnElv1iTfw7XUASfLTKt8Nfo
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic303.consmr.mail.ir2.yahoo.com with HTTP;
	Tue, 16 May 2017 13:55:38 +0000
Date: Tue, 16 May 2017 13:51:36 +0000 (UTC)
To: Geert Martin Ijewski <gm.ijewski@web.de>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1288208690.891235.1494942696952@mail.yahoo.com>
In-Reply-To: <79d5c7a2-c5be-a4b3-3cc3-85c3e572d062@web.de>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<79d5c7a2-c5be-a4b3-3cc3-85c3e572d062@web.de>
MIME-Version: 1.0
X-Mailer: WebService/1.1.9552 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 77.238.178.228
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Changes to Broadcom(BCM) files and Raspberry Pi
 files. Addition of PanelEmu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: John Bradley via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: John Bradley <flypie1@yahoo.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vmG17guCMbMt

"I think that should be #ifdef _WIN32.
Maybe in the far future QEMU could also be compiled with Visual Studio=20
or any other windows compiler"
The reason for doing it this way is that MINGW64, which is the dev platform=
 I uses on Windows10, does not include a port of the GNU Socket library so =
I have to use the native Win Sock Library.
=C2=A0
"Why not something like
typedef struct
{
=C2=A0 =C2=A0 uint8_t len;
=C2=A0 =C2=A0 uint8_t type;
=C2=A0 =C2=A0 union {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cnt;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } pinCount;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin0to15;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin16to31;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin32to47;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin48to63;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } dataUpdate;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* todo: other packet types */
=C2=A0 =C2=A0 };
} CommandPacket;"

The problem with that is packing. I tried to do it that way but the differe=
nt compilers I am using for QEMU and GDummyPanel pack and align in differen=
t way and no collection of pragmas and directives could make them pack the =
same. While writing this I have also noticed I have made an implicit assump=
tion about the endedness of the data, which is not good. Also keep in mind =
someone may write a client in any language from Fortran, Forth to Python.

"what's the use of this pointer aritmethic instead of just 6?"

This is a similar attempt at robustness across compilers.

John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hill Li=
verpool L7 7AF=20

    On Tuesday, 16 May 2017, 9:56, Geert Martin Ijewski <gm.ijewski@web.de>=
 wrote:
=20

 Am 14.05.2017 um 02:42 schrieb John Bradley via Qemu-devel:
>>>From 7f74f048f135d9c9c230a9e90f72451c841c6d35 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Sat, 13 May 2017 23:07:47 +0100
> Subject: [PATCH] Changes to Broadcom(BCM) files and Raspberry Pi files.
> Addition of PanelEmu
>
> The files add the ability to attach, via TCP, a panel emulator
> The include a unification of several PD Raspberry PI additions
> A modification to dev-network to all circle SDK WWW client to work
> The DummyPanel is not included but available at
> https://github.com/flypie/GDummyPanel.git
>
> Signed-off-by: John Bradley <flypie@rocketmail.com>
> ---
> [ ... snip ... ]
> diff --git a/util/PanelEmu.c b/util/PanelEmu.c
> new file mode 100644
> index 0000000000..59c87d2747
> --- /dev/null
> +++ b/util/PanelEmu.c
> @@ -0,0 +1,293 @@
> +/*
> + * Emulation for Rasp PI GPIO via Server connected to via Socket
> + *
> + */
> +#include "qemu/osdep.h"
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <memory.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#ifdef __MINGW32__
I think that should be #ifdef _WIN32.
Maybe in the far future QEMU could also be compiled with Visual Studio=20
or any other windows compiler
> +#include <winsock2.h>
> +#else
> +#include <sys/socket.h>
> +#include <arpa/inet.h>
> +#include <netinet/in.h>
> +#endif
> +
> +
> +#include "qemu/PanelEmu.h"
> +
> +typedef enum
> +{
> +=C2=A0 =C2=A0 MACHINEDESC =3D 0,
> +=C2=A0 =C2=A0 PINSTOPANEL =3D 1,
> +=C2=A0 =C2=A0 READREQ =3D 2,
> +=C2=A0 =C2=A0 PINCOUNT =3D 3,
> +=C2=A0 =C2=A0 ENABLEMAP =3D 4,
> +=C2=A0 =C2=A0 INPUTMAP =3D 5,
> +=C2=A0 =C2=A0 OUTPUTMAP =3D 6,
> +=C2=A0 =C2=A0 PINSTOQEMU =3D 7
> +} PacketType;
> +
> +#define MAXPACKET=C2=A0 255
> +
> +#define PACKETLEN=C2=A0 0=C2=A0 //Includes Packet Length
> +#define PACKETTYPE=C2=A0 1
> +
> +typedef struct
> +{
> +=C2=A0 =C2=A0 unsigned short int Data[MAXPACKET];
> +} CommandPacket;

Why not something like
typedef struct
{
=C2=A0 =C2=A0 uint8_t len;
=C2=A0 =C2=A0 uint8_t type;
=C2=A0 =C2=A0 union {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t cnt;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } pinCount;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin0to15;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin16to31;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin32to47;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t pin48to63;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } dataUpdate;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* todo: other packet types */
=C2=A0 =C2=A0 };
} CommandPacket;
> [ ... snip ... ]
> +/* Set a pin to a specified value */
> +void senddatatopanel(panel_connection_t* h, uint64_t pin, bool val)
> +{
> +=C2=A0 =C2=A0 CommandPacket Pkt;
> +
> +=C2=A0 =C2=A0 Pkt.Data[PACKETLEN] =3D (char *) &Pkt.Data[6 + 1]-(char *)=
 &Pkt.Data[0];
what's the use of this pointer aritmethic instead of just 6?

Geert



  =20
