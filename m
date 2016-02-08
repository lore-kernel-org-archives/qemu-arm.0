Received: by 10.25.159.19 with SMTP id i19csp1604872lfe;
        Mon, 8 Feb 2016 15:37:29 -0800 (PST)
X-Received: by 10.55.52.211 with SMTP id b202mr38083466qka.27.1454974649322;
        Mon, 08 Feb 2016 15:37:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si32936081qka.3.2016.02.08.15.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 15:37:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSvN2-0003lt-T7
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 18:37:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSvN0-0003kN-LP
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSvMz-0000FX-To
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:37:26 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSvMy-0000Ek-Mh
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:37:25 -0500
Received: by mail-vk0-x235.google.com with SMTP id c3so60009857vkb.3
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=tG76DjN8tnCLSiFK2SZ8jK+nzkd8c6s7khPdkwRjzTI=;
	b=ZQlkidyEiwzN/jo2DpS/8uoPk/FL09481EbZ7wMXlPbnUSSxrDgeKUTaI6IGBRUJA0
	VkB97RFqY/CeI/DBjRTLRwxv8y/TyQyYIzQlJM3w0uQ95RoYmLAf1RVT32hAG3w7LmT6
	aw5zydeKtVHKr+PDyZ9yoL0kW9gvfUvdM0Ofk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=tG76DjN8tnCLSiFK2SZ8jK+nzkd8c6s7khPdkwRjzTI=;
	b=g62oRSVBLu5aOi47XmfTrBflI70KxBLPzSzgQIjh/0MG8v0bVKlqvmulvzavZBIBN+
	B/w02Gt5vUfZEeFwFsyPREfycOlnvP8BNo5anKCzABzfgymqUD0BdPISq/5NDfQviRvJ
	XISAHAFZ6rKQc85blWC+2sVtXyt0MRCHzp7tV6g4u54adQzJWkC5eTh8mzt/sKlPAjaZ
	aqBoV5QDZ6lm3XZPXHk1XcQUE3HC4dI4fhQ8/eSPKKolnTetIks3FY7PldwkFjomm54d
	EVXtVCEI2bh4H5vL2EXGL3/AJLKeKIsyp0uBLi6sg2n2IEd/emKBgTEnnwqxJ6vkGnFe
	Dkhw==
X-Gm-Message-State: AG10YOQqwxLBG5asaHxooEVoMPP8e98MXtBpz8d9h/GQcPFlsGKADcZmZUnI3zwt3KanXkEFdbLDShsCdW4qaSEo
X-Received: by 10.31.1.6 with SMTP id 6mr20061016vkb.139.1454974644135; Mon,
	08 Feb 2016 15:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 15:37:04 -0800 (PST)
In-Reply-To: <CAKmqyKMMphHzbnxRDQHkH-=v5Ap_V3XfarKicF9h-Na5H1MZHQ@mail.gmail.com>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
	<1453479402-14870-5-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMMphHzbnxRDQHkH-=v5Ap_V3XfarKicF9h-Na5H1MZHQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 23:37:04 +0000
Message-ID: <CAFEAcA9Mr8MstvOT+takGJG9T9+jdMiBdcm5HxmU49SoMzFDwg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Patch Tracking <patches@linaro.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/10] hw/sd: Add QOM bus
 which SD cards plug in to
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PDAoOeRCfjpR

On 8 February 2016 at 23:24, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> This patch doesn't compile and neither does anything after this. I get
> the following errors:
>
> In file included from hw/sd/sd.c:35:0:
> /work/alistai/master-qemu/include/hw/sd/sd.h:81:5: error: unknown type
> name =E2=80=98DeviceClass=E2=80=99
>      DeviceClass parent_class;
>      ^
> /work/alistai/master-qemu/include/hw/sd/sd.h:99:14: error: field
> =E2=80=98qbus=E2=80=99 has incomplete type
>      BusState qbus;
>               ^
> /work/alistai/master-qemu/include/hw/sd/sd.h:104:14: error: field
> =E2=80=98parent_class=E2=80=99 has incomplete type
>      BusClass parent_class;
>               ^
> /work/alistai/master-qemu/rules.mak:57: recipe for target 'hw/sd/sd.o' fa=
iled
> make: *** [hw/sd/sd.o] Error 1
> make: *** Waiting for unfinished jobs....

Weird. Maybe something's changed in include/ since I sent the series
so we're no longer getting qdev.h implicitly pulled in by some other
header.

Does adding #include "hw/qdev.h" before the sd.h include in
sd.c fix this?

thanks
-- PMM
