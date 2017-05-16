Received: by 10.25.0.6 with SMTP id 6csp1771761lfa;
        Tue, 16 May 2017 01:58:06 -0700 (PDT)
X-Received: by 10.55.76.140 with SMTP id z134mr8408911qka.35.1494925086278;
        Tue, 16 May 2017 01:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494925086; cv=none;
        d=google.com; s=arc-20160816;
        b=SOKT1Icmj55go9WjE1BKTkHOT9MqkEoUAjg0NP6+5VRIaQJBnOI7pHXEvtmHXy+DIb
         v8YL3UqeWMysG/MoK/6Y4x5JQ6rhE9V8QTARFOK08Vs+X33SzV2lkaoDOtJQqto53Hvy
         mNaQyEP3/EZI7ZTBhuroiY2UHOkJBXozUxmomG+RejZX4pIcRgaxqh3qOwkPl6t7mCS7
         TZraSoYl2T3zkY55GzvmFDu1mtut/mVwmvm5IJ0vfXqbo4QGtoCCawYRgCA56g+CRI/H
         n5QBIJiIEtIU8UXkhtGkdV0LIKVTPDrYqsWGTitJoK0v/LyEotuFXw1WuyDBy7b03N7A
         kC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=N/PGJIzQe9j2Oe5UfQdS+2mBlJTj4jmhRQjwTLqbNT4=;
        b=y1E2z9I23NCmNV4JDUr54rnU7qKRyt5P8ylvRRtakZBUlG2pCahV04m38ES5E1b6Tk
         r8ytZtTMnOo6DWBmZXeBqSWfLSMJPJV2kPrqMn2oK/caPEe+ZQrFcXDaMcxlegBbIlJj
         mWCytjUycjRXXoXhhwZudMK5yhU4VsEWruSfpAnv74jlG6zjAJLsqigHDeG/CdDWQmap
         STWudzIIvCp7buhnd7xbsai3UEPYxbzF3twfxXmgpivC8jn17oECXuR25BwBq0gBLUJc
         zjiRv6ae0ovDke9qr0fQw9y8PbZsbhVK4F2JthsrBxf7vPhkUMwR4XqQxYkApuQIhnWP
         UIVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q46si13072734qtb.158.2017.05.16.01.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 01:58:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAYIv-0000Tb-Qy
	for alex.bennee@linaro.org; Tue, 16 May 2017 04:58:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gm.ijewski@web.de>) id 1dAYHd-00081p-Mh
	for qemu-devel@nongnu.org; Tue, 16 May 2017 04:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gm.ijewski@web.de>) id 1dAYHc-00078C-Is
	for qemu-devel@nongnu.org; Tue, 16 May 2017 04:56:45 -0400
Received: from mout.web.de ([212.227.15.14]:55154)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gm.ijewski@web.de>)
	id 1dAYHX-0006xM-1d; Tue, 16 May 2017 04:56:39 -0400
Received: from [192.168.2.125] ([217.94.10.216]) by smtp.web.de (mrweb001
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0Lcxfc-1dsNPP40W0-00iFT7;
	Tue, 16 May 2017 10:55:32 +0200
To: John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
From: Geert Martin Ijewski <gm.ijewski@web.de>
Message-ID: <79d5c7a2-c5be-a4b3-3cc3-85c3e572d062@web.de>
Date: Tue, 16 May 2017 10:55:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <757990479.60759.1494722527715@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K0:zn7x8OnIoprBM0O4fZNLXnhIVpubgZL1x11kCh9HxlbMPufb2KE
	QAwRgPvKUbUGewXtBVqcpm+Hqf8CFEEW/YxIGLTnPyzdQo+trAFdzw8H1C2a0h43Bl+l1ee
	a/j/NHDGENU+H5CYikoruxBazqMO3U2o9rOy5g77UyyxmIHX2kxpVr1qzS3tmBcMhS3lGHX
	cKCHjGlnTCZNOtbd1UPmQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ndoXBVs/DEY=:CB3ThX5pPWS0r7EaYwbEKr
	zMMGNM3MegqVEtVHXgj7XQrITQid3SYCRoE1eftiRzHZybw3ApioSxbexS3vdVDwYkJ50l4Qg
	9B9p5TEMnzbd3jPez8I63f/BVXePZjQSkGQoCT6uO4NwSlDVrLXPzV9m7Qo2MiNRZHePAXHt4
	TNT7QuDqlrco+4GIvr44gKim8/HjAFKqJvtjsbe3iPNc0R+ndVse+cE16lkMj2qc4RgT0ZglZ
	Tgk4WLlFgnmFLm/tqr+neV576/kPcPi8O1zlhxUS5rH49tDIPaF1YcVAFT1QyzSD6CmaU7tFL
	1iZOvt+3g+BSDAQiqdNPRlBNoEiJ8rmIIJl7vCJ2Vg62xc1FZdaI6FmBtsHL6tEPRs378M/gl
	ks5fT/RaWENyYgtIHRlEUn0rjL/fKIj9L5IdWxZ700xpyqkocR+lH0t8LulSOYKGwHIbkDqtL
	AvMuQ5LoXyZ2JUNxFFwM+B3Jx1NgxzIGY0kk98R59nwZCtfmTNKcUPfuWPuLqlyKemQrXeE8C
	d0DAjtulQ0GeBXZzeETO2aWyASWw4O9HG5RlxNYedT4c6Pe0u9r09GqqcBc3PSoF4LjzG5rQn
	yqdf/3SkWVRTP8Ypa+/5CYZTZB27wmPnCJk+UFHxpYiGt1nGtN/g1QPtY1R6uChQf4EosSFNg
	xQQ2GuqyOCPkxZI+PnH32v9rhLwEA/LoyfSIdit5+BF+ZNLKmu9fiiGPV0XiCSAxPplaveh8T
	7UhtwT25x5k3aYdVGh80sOBlH8ozCboWoGOsFWgodN7g0lGX8ju9cAiLEWC5+Y/UnVLf84zAU
	RpvVU6x
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.14
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: suAPYRtVvb+J

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
Maybe in the far future QEMU could also be compiled with Visual Studio 
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
> +    MACHINEDESC = 0,
> +    PINSTOPANEL = 1,
> +    READREQ = 2,
> +    PINCOUNT = 3,
> +    ENABLEMAP = 4,
> +    INPUTMAP = 5,
> +    OUTPUTMAP = 6,
> +    PINSTOQEMU = 7
> +} PacketType;
> +
> +#define MAXPACKET   255
> +
> +#define PACKETLEN   0  //Includes Packet Length
> +#define PACKETTYPE  1
> +
> +typedef struct
> +{
> +    unsigned short int Data[MAXPACKET];
> +} CommandPacket;

Why not something like
typedef struct
{
     uint8_t len;
     uint8_t type;
     union {
         struct {
             uint8_t cnt;
         } pinCount;
         struct {
             uint16_t pin0to15;
             uint16_t pin16to31;
             uint16_t pin32to47;
             uint16_t pin48to63;
         } dataUpdate;
         /* todo: other packet types */
     };
} CommandPacket;
> [ ... snip ... ]
> +/* Set a pin to a specified value */
> +void senddatatopanel(panel_connection_t* h, uint64_t pin, bool val)
> +{
> +    CommandPacket Pkt;
> +
> +    Pkt.Data[PACKETLEN] = (char *) &Pkt.Data[6 + 1]-(char *) &Pkt.Data[0];
what's the use of this pointer aritmethic instead of just 6?

Geert

