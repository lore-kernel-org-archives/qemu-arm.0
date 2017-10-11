Received: by 10.223.197.9 with SMTP id q9csp695984wrf;
        Wed, 11 Oct 2017 07:58:47 -0700 (PDT)
X-Received: by 10.200.63.109 with SMTP id w42mr20333733qtk.128.1507733927897;
        Wed, 11 Oct 2017 07:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507733927; cv=none;
        d=google.com; s=arc-20160816;
        b=EyL9UWA+vFgmymaWqMbRqN2K5qEA7T559A46VxWbLFukID1gSQwkHBDMBFSAA07uZX
         BGZjnsWZReMn+iOaX3C+Z5cbRvlmcUmovgEdKwB54R7N7j3uNT2PLPcbpOoM55k1bv2r
         WkK5KC8AqgiFo7tRnb9O9jOxvtaAgqYFwbrcyB37QG0oJY37almBn5vFzCFYUYFgacL4
         FV/hkdnB8ggIJdwHgu9A7Fda8JKf2iYiG1eW5kWZW2JolPMqXPzpwNQ0oNgUmNaYyI9w
         d6r53l/ce4V61dI63tF2nu7Diey5ZkzTRikMQR/xYe836qXgZH96uIc+wfAu8apdCJzt
         0Z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+Rt+BfYejWZ3EqVqfl91ng8hym3OFP00p7asNVVbx5g=;
        b=pebq172wvaxgvGXXxZlE1ph6dXs+6k6XhMI1XFMFIB4Q8GvoRfvjHG8yH+bk5S4HWW
         RHTDUfv20kxZgR7UG9rKppmbSUfLgERqcY2LfV9R7GOCbTFHo5vEJHoKo01TvRg+aWSz
         oO8+3wj/MwkmR8a0PhE34iMfH3XMLQN7PnpG/wdcbGKt+USNfY3uiXJod8+UT1BQ4RHt
         lMjnF6xp3XkvkaveceN1DnLtTZtFuE97qbCnZYoXNYUlDTA+9PEcXsEmC5/O9PqbKHfF
         d0m5lTfIlRzHR08tbP8ZEteL7PWBRTrbpw4cop3F7cUw4VBrJdjxdL4ojJ6JFHwj7KOE
         4a2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WKWN1fmb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h190si1167147qkd.340.2017.10.11.07.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 07:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WKWN1fmb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2IT7-0003iy-MX
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 10:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2IRl-00031Q-Kt
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 10:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2IRk-0007tE-RE
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 10:57:21 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:50520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2IRk-0007sI-L1
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 10:57:20 -0400
Received: by mail-wm0-x236.google.com with SMTP id u138so5524195wmu.5
	for <qemu-devel@nongnu.org>; Wed, 11 Oct 2017 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Rt+BfYejWZ3EqVqfl91ng8hym3OFP00p7asNVVbx5g=;
	b=WKWN1fmbddOsiThsFXwRgJ8svIveVMxhivEfWqAgEkn2kaux5M0zvbh15pj4ao6s7x
	6TelV/7WOhfO4qNY6g8FFz4aqe1fptZdfHea+SAQSHyJCVXIPt8zL5YDOgosuGbFjFxm
	Tc39oDFADYxbtfrKzIVt3LOv5M4puactiyfRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Rt+BfYejWZ3EqVqfl91ng8hym3OFP00p7asNVVbx5g=;
	b=sfiLF0I+cIOsSkYpA2fUuY8AqlF4E5zxPv6ofknkZLgJBRh465fyWwgwnU81p8jEHg
	8lIzNZ78Kh4oXxT0PeEsp19jlmDJV+5ug9Hpt9c3H/VCOk65jTPO82asndl8/zp7lXRy
	UPkTwR4wB4uGlfxUa99EgYf9sF2PjtLS++j6pWPGA0He2u29RlU6SyOVQYs5QQmgHoPV
	Lg0RV+uGXdYurVRQhkMzRSWBwkikvCtB5TUHhW1QtMTKlk+umCo3MCJwcKe+YXiQCBW0
	XJ0IlBs89tqQyZAzfkqRXqTqdnURYz8+g/TZJMOMhXIimZ4Pvx+ev7Ts0yxFVP8mCNXR
	8yyA==
X-Gm-Message-State: AMCzsaWil5YegSz1tkBTmm6LNit3QFRAcDi/w6eWjEJrHXnA97f5sn/9
	gr5a7vfgUBnT86I5Cipwq4q3Hmv3kM5gcNH04U6DJQ==
X-Google-Smtp-Source: AOwi7QBY4Npn08pSNAl+53Kwv7i8I5HQp+/tDiKUk+kJuFY0Stz2WuZe/+nbKmXuAgn6GSB4Ot3ANeiZs9QAWLQS+ns=
X-Received: by 10.223.186.201 with SMTP id w9mr15526394wrg.230.1507733839561; 
	Wed, 11 Oct 2017 07:57:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Wed, 11 Oct 2017 07:56:59 -0700 (PDT)
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 15:56:59 +0100
Message-ID: <CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: Wei Huang <wei@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpI3YIrAXlKN

On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com> wrote:
> This series implements the virtio-iommu device.
>
> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
> - probe request support although no reserved region is returned at
>   the moment
> - unmap semantics less strict, as specified in v0.4
> - device registration, attach/detach revisited
> - split into smaller patches to ease review
> - propose a way to inform the IOMMU mr about the page_size_mask
>   of underlying HW IOMMU, if any
> - remove warning associated with the translation of the MSI doorbell
>
> The device gets instantiated using the "-device virtio-iommu-device"
> option. It currently works with ARM virt machine only, as the machine
> must handle the dt binding between the virtio-mmio "iommu" node and
> the PCI host bridge node.

Could this work on x86, or is it inherently arm-only?

thanks
-- PMM
