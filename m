Received: by 10.25.15.230 with SMTP id 99csp181514lfp;
        Tue, 4 Apr 2017 05:28:01 -0700 (PDT)
X-Received: by 10.55.23.87 with SMTP id i84mr23634177qkh.201.1491308880909;
        Tue, 04 Apr 2017 05:28:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z46si14891826qtg.20.2017.04.04.05.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 05:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvNZ2-0005jI-CH
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 08:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvNYu-0005j7-TA
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 08:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvNYt-0006Oe-WD
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 08:27:52 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:34656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cvNYt-0006OT-PF
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 08:27:51 -0400
Received: by mail-wr0-x234.google.com with SMTP id t20so8216255wra.1
	for <qemu-arm@nongnu.org>; Tue, 04 Apr 2017 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DmYfF2ehfBolVvHStaTUKBswNQfvjo5Gmfl8YHsLr28=;
	b=YWAmI6BZO5snmV5ayF/tpfZXOUEdQVwpRly6SRCxhSF1u5Znm073w+B+RAErPEbML2
	b4F0xNXzRVBdG7ioNCUQUG3wVny0DPlbdyT2rUCesfuTyrIfOUpOO8f2akhTenZVoyMG
	OIa6nbpOPjcT/W3QkvaXaOcGf9xz5KDYe651I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DmYfF2ehfBolVvHStaTUKBswNQfvjo5Gmfl8YHsLr28=;
	b=A3+70wVE3drIculFkFvNVn66QBXTTY9jWn26zVs5uZstVLw2Aivz/D0t6+bAx8eaG3
	e0X3Qkj66jXq3ZsdOusJjUGmspKE24h2DjoBhebMtVgzdg3bVFS3bbK0XrIDbMIrHjCS
	+6sJg8dfl3E3Bm59aN6sgk3tlajG0EbSobFY/VUMN7zDQ3Pel4h+WLCxtwZVu6zGpW80
	MFWfLqLBqN/j66MN2FHEjAcm/Sh/8c0/Y8P7y662PQt04u86USAl/rL9qW4BJf0yY0n7
	tjjvrpmtWaS16mGBa1Gd2JKN36SJB+EQHxCoWriRVbwofCw71gLvUU11I7LPSShRhstA
	pzrQ==
X-Gm-Message-State: AFeK/H2fZ1CvMLn49JwrkrNt9G5KRAC2vJQjyKYgS79tObewA/BiC8vWreAsfEOWEaMQc+iFyD6hLl2XjzjEiNR1
X-Received: by 10.28.24.79 with SMTP id 76mr14400024wmy.111.1491308870527;
	Tue, 04 Apr 2017 05:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Tue, 4 Apr 2017 05:27:29 -0700 (PDT)
In-Reply-To: <1490276212-32008-2-git-send-email-diana.craciun@nxp.com>
References: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
	<1490276212-32008-2-git-send-email-diana.craciun@nxp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2017 13:27:29 +0100
Message-ID: <CAFEAcA8s9aR4rbJzd=9-oRashOGvUtSL4xxqbu2M1Cv2YFND7Q@mail.gmail.com>
To: Diana Craciun <diana.craciun@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/2] Increased the size of
 requester_id field from MemTxAttrs
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
	Mihai Claudiu Caraman <mike.caraman@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>, bharat.bhushan@nxp.com,
	Christoffer Dall <christoffer.dall@linaro.org>, laurentiu.tudor@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cpcyteFXj1Sk

On 23 March 2017 at 13:36, Diana Craciun <diana.craciun@nxp.com> wrote:
> The PCI requester ID field is 16 bits. The requester_id field
> from MemTxAttrs is used for MSIs to specify the device ID for
> the platforms where this device ID is needed (e.g virt machine + GICv3
> ITS). However, if more entities that uses MSIs in the system are used,
> 16 bit is no longer enough to represent the device ID. Increased the size
> of this field to 24 bits in order to accomodate 256 entities.
> Also the name requester_id does no longer reflect the content, so
> the name was changed to stream_id.

This name change would be reverting the name change in
commit a05f686ff3, which says:
    MemTxAttrs.stream_id also renamed to requester_id in order to better
    reflect semantics of the field.

I don't have a strong opinion about the name myself, but flipping
backwards and forwards doesn't seem like a great plan :-)

thanks
-- PMM
