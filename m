Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3675903wrq;
        Mon, 25 Jun 2018 04:13:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK8UTYtYeyGA0UCdq3tKFyDIveMfeqlvD47S8E0jQF1qblMuDWISv5rKdnOGuWIs0xJY9BE
X-Received: by 2002:ac8:298a:: with SMTP id 10-v6mr10446259qts.383.1529925185425;
        Mon, 25 Jun 2018 04:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529925185; cv=none;
        d=google.com; s=arc-20160816;
        b=K+7E9UCavLn3w4tYzXWCx0m0DW8Ju0ymGo1pZfhv9sOKFheK4FJdRTuu+c9dPBw61C
         pLch6J9wURlR+VRnMuiRT5Fhf2TA+4RjY1193DkPPcCBnallKRaLeL0d2qPAcvKjqqtv
         fTJSAqnSgWPTLHh+BuhYbFT1aPMKEm/V/rk1vzD/4g9eI2eJLP1XOlSHYv27DxxnoM8A
         dP64B9Jmnc09bsUF9wiEtNCPaAeUuHuaIsu+h7lzwX0S8XwSY5sqlTdMB3sB4doEyRIX
         4DFq41AL8KKNil0bING8LDyrmTFnWDU3jYiB1N+A88HL2K/B0psY0JILXvdSgX8YeT4i
         XwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d2VZo0NrE81po4+1AKXyVkdZYJnmDK5rFbpa9YbY4aA=;
        b=EVytR3Mra+N20sZLstu1nyDJsf+Za/YxPz7V2Eesym/upKkCISOm3HiAxrWZTt2+xu
         ZlURr2sDPHsAHtaSB0wp4tq9foJZJaHxbVBkfb6GceP2icivA833uLDAbEM2v50cGY5V
         iXZqLqgxHpbnK9yaB7wPgCWONxyUVUYruLco+FKq/K8plUnhRy0RSdsxvfI/TzoO7ZGg
         WLq4UTYZrsRY2HspPr8s1KaojtSDOt4c3wbJuv4Qlbkwx+hFXZbwDiYgVqutAHnXhqLo
         2XLpB0rMH9W8fBiBz4yLSlDyPSBst+irbLO3giFr9wxkaD5Ou5yIyYHXp8NtFZ3UZhjw
         ErkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P1ZGH+CH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x9-v6si9375970qka.303.2018.06.25.04.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 04:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P1ZGH+CH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXPQe-00026Q-Sk
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 07:13:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXPQV-00025h-Au
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:12:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXPQU-0005zq-G8
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:12:55 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXPQU-0005zc-8a
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:12:54 -0400
Received: by mail-oi0-x244.google.com with SMTP id e8-v6so12092666oii.2
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d2VZo0NrE81po4+1AKXyVkdZYJnmDK5rFbpa9YbY4aA=;
	b=P1ZGH+CHgkmz5K/dZ3Usrf4yzNijSsmEt/MHzdQuwW0WmTrwM9jHh1C7fV3R2vpPvH
	ggn/UaGWY/wA/KltyX1YMtSnzYXkG+O4j0ulclHzxKTYh4YsglzU7GVZlq5HB19cW01U
	XwhEWJbj66KTRfzniqcj/6dQRh8eQZkO65nfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d2VZo0NrE81po4+1AKXyVkdZYJnmDK5rFbpa9YbY4aA=;
	b=O6boJSfSd1sRw53DZgjMm+7VBMbto0FzXdDsA5V5EN2ujOvrqg2mZi5wmJugs6GaL4
	hk31zfOwm0NDRQh8jslNebXwioTbDXV76cbLR/PhNNGwzT4YyWJZFdedNityNsXwDJ8/
	6zJOrTA7MKvgODnrJLmApR2nX5l8qDmacmSKBvPX5PpusGlYCwO6nNSCeBX+y0/HFgyp
	4QIdb32v4QFGh6K/kHpXJ7J1J6z71qjWnpkYPcuvzzCMjQxy0Y13QEINf6Heb5ucdyi3
	ZN1Qm9hej7vGM3lNcWfe0XiHOKRe3Qb8rp9uj638bN2DCdDt1P66vmUK1ZsL1RQcCqXY
	jJRw==
X-Gm-Message-State: APt69E2el+tsAJRSoNbf8IB5QHH+jxxE4pPZM3F4fJW30G1ML9zp/AN9
	Ga3FkJVx3s6zi2oX1JI/ZLY48sWQYS0v60nPCJ14Ow==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr6802162oie.12.1529925173642; 
	Mon, 25 Jun 2018 04:12:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 04:12:33
	-0700 (PDT)
In-Reply-To: <d3c05355-4eda-f501-8f04-d808f416393a@web.de>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<d3c05355-4eda-f501-8f04-d808f416393a@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 12:12:33 +0100
Message-ID: <CAFEAcA80O-6ycsVFEkfTSYCakQQZyGy9VV-+2rx6dE3-Ffd-Ng@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 0/7] arm_gic: add virtualization
 extensions support
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: evMIXSFmfDfl

On 25 June 2018 at 05:55, Jan Kiszka <jan.kiszka@web.de> wrote:
> On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
>> From: Luc MICHEL <luc.michel@greensocs.com>
>>
>> This patch series add support for the virtualization extensions in the
>> ARM GICv2 interrupt controller.
>>
>> The first two commits do some refactoring to prepare for the
>> implementation. Commits 3 and 4 are the actual implementation. The last
>> commit updates the ZynqMP implementation to support virtualization.
>
> Is it enabled for the virt machine as well? Seems we are missing some
> mapping of GICV and GICH there.

I agree that it would be very nice to see this enabled for the
'virt' board; it's a bit tricky for me to test otherwise. It
should just be a matter of mapping in the GICV and GICH,
wiring up the maintenance interrupt, and advertising it
correctly in the DTB and ACPI data...

I'm hoping to get to reviewing this series this afternoon.

thanks
-- PMM
