Received: by 10.28.173.206 with SMTP id w197csp40648wme;
        Fri, 12 Jan 2018 16:10:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBov0lI6a+HGk0AGmWFuNLlLPNKzB1zsBf8FLAAzMuQ2L+Agk8ouhPnNeMoN+Ge2moorjdNpf
X-Received: by 10.129.161.130 with SMTP id y124mr3911694ywg.69.1515802211426;
        Fri, 12 Jan 2018 16:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515802211; cv=none;
        d=google.com; s=arc-20160816;
        b=aoEwCBcZEBl1oObfzAMWAppaH2BH2R/9CsIR3tDzhnBIOKy49g3b2FvVXOsPt7Fz3g
         Ans39CyNEArNujPBFfEdhxr+CGJTwiSc+kXJm0UV0zyRV2pikQK9kp6pLnKH3a7L4YCg
         PwpLIkHFBpiey2KKPjMDmcS1GjR/XTSSDkdnGHWm11U5VTmhl/DwktIWIDAnEvScbRPE
         6HiWvtisEIhrWSeIsk28sIBY98N4hJflBm/jgxDn4meyOLQ6mw96PkfsZoHPEOaKre5P
         V+4Gk64I9gGIuz9cIqBaUqlSMFx9L0NBjU7gQZEY0bL1ujxL9hk9jcht78tfC/J/1kqP
         3uqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=3vFhiW66AVKFijfEWSn1+DG9ggLgh4B5lPkv6wA0Q9U=;
        b=K9Ug/kDUQnsqx9InoIY62DX66jQkU2jFAg7UBiDX004MiksbvdYT7wyG+KuDJtYoyh
         6PuUl7Q/YKP7+aLLIn2sVEiYQloSLJkjI+z+b3+SnOTRpJxLNKD0etwBmMLrkUC8fn1y
         SUvV+e7DrRnCHZdPcQnptZrhnAer0bsVE5bwmC7ULGCat59jqsY38fdtU18S7SMFK/Xp
         s/Xlp0KpudRO72ZEl9P1dOe4YuYN0e0zIoC6O7u61EBKsVyALEfweXbPeCXj49BQilrT
         GCJ+b63C0izxKLwOmJydQLL4FBwna3m+6uitTDri4TPiNoLXesIIPUU4ZimlQVmY03u3
         L43g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHtLn0Lo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s15si4754517ybg.390.2018.01.12.16.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 16:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KHtLn0Lo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea9Ok-0001fR-U7
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 19:10:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9OP-0001et-6s
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 19:09:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ea9ON-0000yl-SZ
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 19:09:49 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:42917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ea9ON-0000y3-MB; Fri, 12 Jan 2018 19:09:47 -0500
Received: by mail-wm0-x244.google.com with SMTP id b141so15224836wme.1;
	Fri, 12 Jan 2018 16:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=3vFhiW66AVKFijfEWSn1+DG9ggLgh4B5lPkv6wA0Q9U=;
	b=KHtLn0LokcbHX8b1pboZF8wNFbKXUfu2t7XQtCp5Zqb9HzERf7Rl4FKd4Cq+XiuGRt
	3Wv0c4E3X18AZkHBlCmuZR+ehyAfCk/lZAjwaHn4+aPrjEgjwCf9/QeKsgmKZieUwdZB
	PPaEjUp0QmD8CRyE+ieHhOxS+XGft2iaEBL+ALxcmk3AOwwZ+tbAZgDR67H3VgczvpXc
	3dO+jSAAxEAwPut+Dc7fPouK/kYw7Efsnn9Zbev4pJ7TN+KCcfJV+HD2cnTkTEYdIVi3
	MXC1wzy+MSdaow+JdXX4mych7MLa3GLn3yvomDWsyL1sxy41zEyv6qgeYA36e3zadvBp
	STUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=3vFhiW66AVKFijfEWSn1+DG9ggLgh4B5lPkv6wA0Q9U=;
	b=A3xNGM6mlSe5iCmMgGNQmzMGcFom3YAsG4U+gRZGfL6FEJbaORAV+QCLE3Bv44zBVk
	v+rmDpwE6tWgBlrUGnJ7oIZzbnEn7v+N49jZ0kBi0K2znXesGdoxE5BpMRzDToitzJdU
	OJuY6TaXbeqx2cyBaqW5iENsGjpw2RPkVsuq8SR/b0YZL0KRgwUXk8r+DsYZp69R8Uts
	bpzPHJ7B6n7zox/EHMGHjnPM4FNNXmzDXqdG0BqzTknpxE+kwhMOnW2+EhUPTvTzi0l4
	TpmSk5yH1A6IkE9kzvFl/Y/hctyJbU2s32vFaDDEJLhNtz7lEU0N/8DCBY7W2WVMqxjp
	A7ug==
X-Gm-Message-State: AKwxytcvZo3LOWh4nqirTjsAeyY3pYZRFOPQ7yZwNy1QevtyljyvSYaL
	o4wj3StcsnsCKnNAPWG12A3PS/bLy5FukvQWwDE=
X-Received: by 10.28.51.12 with SMTP id z12mr2562753wmz.16.1515802186701; Fri,
	12 Jan 2018 16:09:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 16:09:16 -0800 (PST)
In-Reply-To: <20180111205626.23291-20-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-20-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 16:09:16 -0800
X-Google-Sender-Auth: GmJL_WP55-ImAmRDpkZiDa-_vRU
Message-ID: <CAKmqyKPhSYpMcyDJ6T-dM9LM8LOwq8vZBM7NAM+dzJaM3ULOUQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PATCH v6 19/21] sdbus: add trace events
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yOwAsQjlMivk

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/core.c       | 14 ++++++++++++--
>  hw/sd/trace-events |  5 +++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index 295dc44ab7..498284f109 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -23,6 +23,12 @@
>  #include "hw/qdev-core.h"
>  #include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
> +#include "trace.h"
> +
> +static inline const char *sdbus_name(SDBus *sdbus)
> +{
> +    return sdbus->qbus.name;
> +}
>
>  static SDState *get_card(SDBus *sdbus)
>  {
> @@ -39,6 +45,7 @@ int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint=
8_t *response)
>  {
>      SDState *card =3D get_card(sdbus);
>
> +    trace_sdbus_command(sdbus_name(sdbus), req->cmd, req->arg, req->crc)=
;
>      if (card) {
>          SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
>
> @@ -52,6 +59,7 @@ void sdbus_write_data(SDBus *sdbus, uint8_t value)
>  {
>      SDState *card =3D get_card(sdbus);
>
> +    trace_sdbus_write(sdbus_name(sdbus), value);
>      if (card) {
>          SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
>
> @@ -62,14 +70,16 @@ void sdbus_write_data(SDBus *sdbus, uint8_t value)
>  uint8_t sdbus_read_data(SDBus *sdbus)
>  {
>      SDState *card =3D get_card(sdbus);
> +    uint8_t value =3D 0;
>
>      if (card) {
>          SDCardClass *sc =3D SD_CARD_GET_CLASS(card);
>
> -        return sc->read_data(card);
> +        value =3D sc->read_data(card);
>      }
> +    trace_sdbus_read(sdbus_name(sdbus), value);
>
> -    return 0;
> +    return value;
>  }
>
>  bool sdbus_data_ready(SDBus *sdbus)
> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
> index 0a121156a3..c0f51f11d4 100644
> --- a/hw/sd/trace-events
> +++ b/hw/sd/trace-events
> @@ -1,5 +1,10 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>
> +# hw/sd/core.c
> +sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t c=
rc) "@%s CMD%02d arg 0x%08x crc 0x%02x"
> +sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
> +sdbus_write(const char *bus_name, uint8_t value) "@%s value 0x%02x"
> +
>  # hw/sd/sdhci.c
>  sdhci_set_inserted(const char *level) "card state changed: %s"
>  sdhci_send_command(uint8_t cmd, uint32_t arg) "CMD%02u ARG[0x%08x]"
> --
> 2.15.1
>
>
