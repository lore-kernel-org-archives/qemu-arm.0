Received: by 10.25.208.211 with SMTP id h202csp1240493lfg;
        Wed, 16 Mar 2016 08:02:17 -0700 (PDT)
X-Received: by 10.55.73.199 with SMTP id w190mr5796238qka.77.1458140533478;
        Wed, 16 Mar 2016 08:02:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z69si3619768qgd.9.2016.03.16.08.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 08:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agCxh-0002nt-26
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 11:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCxZ-0002dR-Vm
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCxV-0001nI-Vr
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:02:05 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCxV-0001mu-Si
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:02:01 -0400
Received: by mail-vk0-x232.google.com with SMTP id k1so65203222vkb.0
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FPKvzY2/vezmeNFoWIVIZEqD90zAAR0DQQydr4NuRHo=;
	b=Ta8IFM5tt8D7ymmx0+ZgnHxtHeAYL/5XhTme1Sm1701Wr3hBbXIkNGj9MqmWdwoVg8
	dX+jGBZAwCP0RVHart13sGiF2ApS2t7Qj0egBrhSnUprP2uCvxrMhRXWhQyOs9r4QITU
	ph+vdTsfXHMHFu5b5eHexntms+G4WIiSVQ2zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FPKvzY2/vezmeNFoWIVIZEqD90zAAR0DQQydr4NuRHo=;
	b=ACMNpC4Xk4KWVDnp0BQ6Hvdhk3ZItua4OKsf2kIu7T7uh5lloqJh4vglCLZ2wPYyjx
	knS2VHLm0Dp6SgIK+iylmcHPpO5iLfInjkSPmyl88E+q9S6iJbXCqPuRZ2KFxYm3oUhq
	x+HjHO1bkcPyM/6mwwcmViVuVNG2OL2PbcgEr38BxxIzcjXhR6F0UN+fEjMB/r/OmgB/
	6LaisQTl4mzuXHJlOrd/3trezI/m95OdIDs3Z0FAbH9ETBpCFy7KJpmntZ22+HfMQsr5
	yFs/RXAdZNcMzE3zfZzmck07extJcaF0hXnDnp4oDWfViWUKGMay+DjfUhvqq8av8SNf
	z+RQ==
X-Gm-Message-State: AD7BkJIMk9E9elEGR0VC3BDiMAKOScv6xyeLeB12tCjttj/kPjXRq4phvFvpqeuoICt9yYka6Yrpu0V8OTGRE2PI
X-Received: by 10.31.52.147 with SMTP id b141mr4993408vka.82.1458140521439;
	Wed, 16 Mar 2016 08:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 08:01:41 -0700 (PDT)
In-Reply-To: <145625173293.12025.6340664976132573147.stgit@localhost>
References: <145625172744.12025.2350972792125742783.stgit@localhost>
	<145625173293.12025.6340664976132573147.stgit@localhost>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 15:01:41 +0000
Message-ID: <CAFEAcA_DGgn8cQ9neJ1BYg-r3rH3ybgqpyEwNy0u5YA4DJX=xw@mail.gmail.com>
To: =?UTF-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH 1/5] exec: [tcg] Track which vCPU is
 performing translation and execution
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
X-TUID: 83ar9bODfZmS

On 23 February 2016 at 18:22, Llu=C3=ADs Vilanova <vilanova@ac.upc.edu> wro=
te:
> Information is tracked inside the TCGContext structure, and later used
> by tracing events with the 'tcg' and 'vcpu' properties.
>
> The 'cpu' field is used to check tracing of translation-time
> events ("*_trans"). The 'tcg_env' field is used to pass it to
> execution-time events ("*_exec").
>
> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
