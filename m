Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp206132wrt;
        Fri, 11 Jan 2019 06:34:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN65N+1d6N3+fpuNh09X1mWijmfP0sggv5NhVKnSuL81G1DeWpQCWQONVNM2TIXYBJT4EXLc
X-Received: by 2002:a1c:838e:: with SMTP id f136mr2356816wmd.93.1547217258283;
        Fri, 11 Jan 2019 06:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547217258; cv=none;
        d=google.com; s=arc-20160816;
        b=R7Hx9VD9ALewFggZ/JL0vEphMKgkWKfo0gvzF0jgYymcuUCoMaH8rzEdCDlxgy/WCX
         yIR9AuNMEJ1JDKnqiSOtMZN6h9gAYhhC4dUFKezW8DaSK+Pe4ui9SZo7X6gs95R6H+9D
         FOLlDdeaMaDskwWRIBCRjmT3FJ9DPJ8lvOyepXBPPlmc4HlrblO1IfRAVrjinMEkoAe/
         MEUwSrx1e0po4hrYzcayiU4rfDKKoCAVL9IuGhiw2zD2qhNYW42QSKF6pHnN4VRPKlum
         5/pkgdTAbIgKw55+YySEeOOvo6Go5Cpv7hkoMC4l4pVxpIqSUCCjp2KEryJSg0BKMPX+
         WZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=dKYeupaJxCg1WULCYVeAo99x7HW4pN/pXb1A1WTOia0=;
        b=z1mL6Q3mVkgqN/hDs0MtBQK0vORq9CiE/i8nAiPlngeoUgSdf/ujYZJ+iX2CQP86WH
         5T0VaifSbZdEiuFaSs+U5iVxrptWsioUrJ3jtaqTL5ZGwmUDwq42DklYxhv4aonSGNeV
         hv0/GL+gnNQQ1W36rhp/mJVOqELRS4no+rz79VYy+cHQRPJN5qrVLuR0GRX3Um2RY/fF
         mKP9IXbkTPlRacK9sQtVmT6oL15mydF8ShB7xGAC0TlpcOWknjW+V9osKx6Fh/hD5Fyy
         1ddozW3cdgz0AUgyZMkZMhLauWmSSwtAon8NWErLMYsQZ6q+m5kLaXi2/e1/K2DC7iPP
         lAww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si43815359wrt.179.2019.01.11.06.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxt3-0002A5-CQ
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxih-0001ws-7I
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxig-00060n-6F
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:23:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ghxic-0005rp-HI
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:23:32 -0500
Received: by mail-wm1-f68.google.com with SMTP id t200so2574703wmt.0
	for <qemu-arm@nongnu.org>; Fri, 11 Jan 2019 06:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dKYeupaJxCg1WULCYVeAo99x7HW4pN/pXb1A1WTOia0=;
	b=d9RE2NN41k9DV1RZXveyZiI/q1TehUbv58++JwjwaPaNQ9cJwRenB2wZ3UvAsRO9Pc
	eh3xkI1m6kbYB794t1Ud1R5+rjzSWkqZU8zYSsWduADLWBTSIQJ0f7gFB3jXGK3GGlvx
	bYuAYdaRy71KAMP8O979qsK0GHAbXMWSmhkU40ma2/q41pB7V0YSyM4T2o612gtONRp7
	IUGfTob29GzKw8dBvH3EDNZpX31jK1Omx5nYD93whZVBmja7FwqGWF63ByiZtDN4Iv0Z
	72DswX7llAcIFtBFfuv5q/Mm07hRzcLkzKCRbUefz7+7RzgVkLHc1vVLyHUjsCm2o/MF
	VN3Q==
X-Gm-Message-State: AJcUukc39NW8fkAU8OOvIWihoHVz9Ss40xgz+REbvj1d/llf+vkdLgZz
	n2ALvQ6lo+RcIgk9JIWpB7lgNQ==
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr2641563wmf.32.1547216608983; 
	Fri, 11 Jan 2019 06:23:28 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	l14sm142981330wrp.55.2019.01.11.06.23.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 06:23:28 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20190111140457.2935-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <459c5b99-253a-9eac-deec-2d093b7fc28d@redhat.com>
Date: Fri, 11 Jan 2019 15:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190111140457.2935-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH 00/33] typedefs: Remove scarcely used
 declarations
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EQLtImFz045S

On 1/11/19 3:04 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Since this file became a hot topic [*], I took previous cleanups
> from last year and continue to clean it.
> 
> Regards,
> 
> Phil.
> 
> [*] "HACKING: Clarify the paragraph about typedefs"
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02132.html
> [*] "Fix duplicated typedefs to be able to compile with Clang in gnu99 mode"
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02117.html
> 
> Eric Blake (1):
>   typedefs: (Re-)sort entries alphabetically
> 
> Frediano Ziglio (1):
>   spice: Remove unused include
> 
> Gerd Hoffmann (6):
>   egl-headless: add egl_create_context
>   keymaps: remove modifiers include
>   keymaps: drop nl-be map
>   keymaps: remove common include
>   keymaps: drop support for include files
>   usb-audio: ignore usb packages with wrong size
> 
> Li Qiang (1):
>   ioapic: use TYPE_FOO MACRO than constant string
> 
> Marc-André Lureau (1):
>   configure: bump spice-server required version to 0.12.5
> 
> Peter Maydell (2):
>   ui/console: Remove qemu_create_display_surface_guestmem()
>   linux-user: make pwrite64/pread64(fd, NULL, 0, offset) return 0
> 
> Philippe Mathieu-Daudé (15):
>   hw/input/ps2: Remove PS2State from "qemu/typedefs.h"
>   hw/pcmcia: Remove PCMCIACardState from "qemu/typedefs.h"
>   hw/ssi: Remove SSIBus from "qemu/typedefs.h"
>   hw/ide/ahci: Remove AllwinnerAHCIState from "qemu/typedefs.h"
>   hw/nvram/fw_cfg: Remove various typedefs from "qemu/typedefs.h"
>   hw/i2c/smbus: Remove SMBusDevice from "qemu/typedefs.h"
>   hw/bt: Remove HCIInfo from "qemu/typedefs.h"
>   hw/char/serial: Remove SerialState from "qemu/typedefs.h"
>   hw/i386: Remove PCMachineClass from "qemu/typedefs.h"
>   range: Remove Range from "qemu/typedefs.h"
>   audio: Remove AudioState from "qemu/typedefs.h"
>   ui/console: Remove MouseTransformInfo from qemu/typedefs.h
>   ui/console: Remove QemuDmaBuf from "qemu/typedefs.h"
>   ui/console: Remove DisplayState/DisplaySurface from "qemu/typedefs.h"
>   RFC ui/console: Add "ui/pixelformat.h" to declare PixelFormat
> 
> Priit Laes (1):
>   qom: Include qemu/fprintf-fn.h in cpu.h
> 
> Thomas Huth (3):
>   hw/audio/marvell: Don't include unnecessary i2c.h header file
>   trivial: Don't include isa.h if it is not really necessary
>   hw/audio/marvell: Don't include unnecessary i2c.h header file
> 
> Tom Deseyn (1):
>   Add getsockopt for settable SOL_IPV6 options
> 
> Wainer dos Santos Moschetta (1):
>   hw/core: fix whitespace in a sentence

Please ignore this cover, I learned git publish use 'master' branch as
base, while I'm custom to track 'origin/master'.
