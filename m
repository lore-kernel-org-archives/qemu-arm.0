Received: by 10.223.172.38 with SMTP id v35csp3304311wrc;
        Fri, 22 Sep 2017 09:39:44 -0700 (PDT)
X-Received: by 10.200.46.146 with SMTP id h18mr9382820qta.100.1506098384154;
        Fri, 22 Sep 2017 09:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506098384; cv=none;
        d=google.com; s=arc-20160816;
        b=03KSCcjfzsxhMh9i/nF5BqyFEIIO3K4uVVMjg2SSCbloloFoOHjMVdavvpsANcFOvB
         ppY3cu4hA31dwvNwHfipjw7A0P0FVNrkemULoPukGu15ROydd0rrifJrec+bQ8Tfe0v0
         niKc/yNheiX5hMXlAyDGuq75yuEgYK/r0QkEqZ8VBKzIlCFtKs5s4cGy4Uwde+OeWal2
         4bIzHTTCxrekFHkbWDgOYggLWkTFL/JKDGOMCM9zOBhQt6U+eEDYXW93NPSTMArs/JNd
         8XsEh7B4X+YgEdwOTbiVi0pLlTnOeai3aCc/y3cxeQNJ2WVtmLuC0AnhJaDWp54A+quZ
         532A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=kSwD2P4cC30082U50oc01vpT3FpJnm4MP+54mbjbzgo=;
        b=lQxGb/CvTKcTKILZhm0b9O/iuk4RaNwO7q5wKthUwjhz9VYeKILQexPy5jTcPgFS7o
         P2WNN4RRPzHBFEPOTS1bhmhH5mcbEy3iyMvbTsKNBsIzEpeKrm5OAoRnpzGCeq64wkaP
         9tU5+XJTRF9SbNy1olCVrKQYj8u/uCoZbhm1Visf0htHEReL4GeCI7jHSpy6qJ9CopzU
         pEB895UPN47RZtLchdafEY8je0Xboe4sto+q5WMSFnTVXO38oQuOp6BYe5f6m0XdpVoR
         5XibrP/RIRHF50flxi606Vupw0TkEx9swcPunxsHGsj+FVyNrYFEyB0GP5OUcm0SLUjm
         kmxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KC2W9z3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si190923qtw.58.2017.09.22.09.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 09:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KC2W9z3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvQzN-0002VQ-RS
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 12:39:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQz9-0002Td-AX
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 12:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQz8-0002oU-3u
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 12:39:27 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:55181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQz7-0002nr-UM
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 12:39:26 -0400
Received: by mail-wr0-x22c.google.com with SMTP id g29so1341262wrg.11
	for <qemu-arm@nongnu.org>; Fri, 22 Sep 2017 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kSwD2P4cC30082U50oc01vpT3FpJnm4MP+54mbjbzgo=;
	b=KC2W9z3dkGg4JRLHyTFu1nBVEbGaSILPZHQW6HsA6v/3HQPbLt4Ivo6TP/77mHUpzf
	qR6+Wrvwon9rtJO7d9c98fbePLhfmeOP2X2CnAA+JHYmAG3c1UYdxnT6aoxg5hwoGsKW
	pHmFCaCPcmglYS3R5A8fYNN38/AKWRcyQlQZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kSwD2P4cC30082U50oc01vpT3FpJnm4MP+54mbjbzgo=;
	b=sSBhJ+CgxZ9chDxQktPTN+HxrzQrxCLswmJBlvn72ffhMXh0yeIBjtWGBW5sgpiC7r
	FcIRCFTMHqXKh+Rxf2VUgyiDoCt2hJxv1TtrVJLS8lwygqEatyXzNstFpfW0aaExp5AV
	brfnS1WzAxaYbZ2704AjDGB82erPZaWHKPIWebjzMhetVyvTOuif0Ag78SFnxP9TVur+
	UN/BypTvwiozVWaAysSk4/+/Kn5Udn6DsRxiuTERGbuc2JvWbj/1IYI7dsffIfNhO++M
	xgX9VP7c6o9FDtPdSrOqpInsHd8OfnNAZO334ztmZFRZSfzbtU6ubfqARjAKXHVi4sGc
	+72A==
X-Gm-Message-State: AHPjjUily9b01bO3x80cxq4flfcB0dtmc4qRXlYHiaDeZCqG8SPdB3od
	bKJKP6WCbAsTN+d3YWH9aAV6oOMCTnn4wwaP0NC0YA==
X-Google-Smtp-Source: AOwi7QAXaffyVnYuoXo/B1kmRthoMlmfQUylQtssYsRO2r84YKVFzlW3qoV1dZWRZA6YgxusqH4dlHJdB/mtyMxBF3A=
X-Received: by 10.223.147.166 with SMTP id 35mr5874037wrp.90.1506098364858;
	Fri, 22 Sep 2017 09:39:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:39:04 -0700 (PDT)
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:39:04 +0100
Message-ID: <CAFEAcA-9KOvwzhiSFj8xMUypMnsXmPeoCSMuhPTgrwi-SnyKBA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH 05/34] misc: remove duplicated includes
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ItiGY0v4dUv+

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> exec: housekeeping (funny since 02d0e095031)
>
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
