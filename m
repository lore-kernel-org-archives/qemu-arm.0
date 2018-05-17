Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp134216wme;
        Thu, 17 May 2018 08:40:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrKbb+KoEB0i5Gs+RTBeGpDl5RqjNYajNVipIy2xqF5bTys3xYc/Jm246eAqEpktzaopMC6
X-Received: by 2002:a37:1f02:: with SMTP id f2-v6mr5276830qkf.434.1526571633497;
        Thu, 17 May 2018 08:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526571633; cv=none;
        d=google.com; s=arc-20160816;
        b=QxP/49wetXR4aYqePKLG/r03Dava2sTTgsctaEFaiCA8gWDjHclHe9YOA477zE/FRZ
         TKJpmLtwskVcpdBZwpD97hwK5jyKiQXiWOBWQ7Yi028Y7au7f3N3GwMZgERaemWnkxt3
         A/gh90t/clIm6hGUFUxBBbX04LrQKNYjcZRi17wAKnCIEM04H+B+eRfHTmolbNkKnhfM
         HkPpp2A+LrAM9qsgRkyGPttL4v3vPj21uwmzpGTQIPLGYr45QQE2FAShTgQ37P0SACVB
         +bAthAdYlBYTT3tctlbYP84togwefWeUpRIrrSdNDFA+FLvHbEnl6tbOGmnjcaygmAuC
         xlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KiitTDestEoAyCP379QZ3HlIEiK0AtxdKLJCoH9srks=;
        b=D6nFL3Z1QIa7CAa9ZK25nMSutPd1mJS3cnwLjuVk9gFCAOgPPhfDqvjmDerTMYPsIo
         X+IXauKtmFrToKJFjH08w9AqIXi0Sm+JS7M3G+ePqqUtu3F6H70O7CLBkDL9fXB9UE2C
         T/CfqKdsSUU2qHR7z7Y1Gkr5WuvbMpsXguZ8v7wIY9rPHiub4Zb5SXOtUOnwUaF+PvsV
         sv4QtiUgiy2dpjuiQW5G2QkzDrxnOHH2zu1LNIV7zM11gadKYwTNHCZZAOswykV+HKN7
         bNqZ8h5I3nqR5a9TgTGUB37JdZfKJ4P1CTSjVb4HAiaTe32h2wi1C+HowsFhFlmpb9KY
         IAxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTNPJJrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a29-v6si4034543qvf.264.2018.05.17.08.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 08:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MTNPJJrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJL16-0000YA-W1
	for alex.bennee@linaro.org; Thu, 17 May 2018 11:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJKyn-0006pr-Ai
	for qemu-arm@nongnu.org; Thu, 17 May 2018 11:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJKym-0007Cb-Mk
	for qemu-arm@nongnu.org; Thu, 17 May 2018 11:38:09 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:34138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJKym-0007CO-GB
	for qemu-arm@nongnu.org; Thu, 17 May 2018 11:38:08 -0400
Received: by mail-ot0-x244.google.com with SMTP id i5-v6so5561728otf.1
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KiitTDestEoAyCP379QZ3HlIEiK0AtxdKLJCoH9srks=;
	b=MTNPJJrxF5Zg8yaKp0IOpKZ+VeP1Fd5z5vxmIvGYc1XHtSLeGQiP+8KH1FWU5ns6JO
	CsLxJDiuTHlDXx0+s87loTgJdqiHkKkCMXhwuq3S3Oorw95a+h70pzl3uQI9JEv2bOTF
	SLT9Qr0zFErqHgPp908EoM0zoRIQV5zN7azWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KiitTDestEoAyCP379QZ3HlIEiK0AtxdKLJCoH9srks=;
	b=RS3+v/Bluk2wchVDPrtqoC/jnrrBRzGvPVX1lVvabeRbBbmMsBi3iUMxfovSeXo3QN
	jMqhCywoZ1Jq+QW5E4i0cb7Rhky9+COVM9HtxvRdzcQY6MHFZuYyA4B2B0xUEaERbkhF
	Pf4r9eHdJdoq+ZzLpcwZccYCeXInwXKzTAioXoKZsHq10xCsBSdSYZ+Z80RvN2mzSXap
	KlZxqAnUWipZ4DyAn5d6pVHDQWqYEtTc9yq/5/8xdXOALI6bRtRHTW3Tr8kE+410iLXe
	BKjYeFInsHokUG3+MTngZDJN/rBv0o/HBqNns6ubK5LBtSy4qD5/dnAsu+dJWFW7kDw2
	gNkA==
X-Gm-Message-State: ALKqPwcKdUXB2q2rniiUhbrtvJ8tbyJg+Fd2S2+S0jcObkAEIoRBCiuF
	Ev6BmyHRmqSART2SpMxIiHEJM7OjNbkt206jyJ3ocg==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr4229039otd.210.1526571487700; 
	Thu, 17 May 2018 08:38:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 08:37:47
	-0700 (PDT)
In-Reply-To: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 16:37:47 +0100
Message-ID: <CAFEAcA_ddWtr_MLXXU8b-=p14f-BaN1UHpXnNJh9cdYQ7KWh+g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 0/2] ARM SMMUv3: Fix a couple of Coverity
 issues
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZPToiEdNtkn

On 16 May 2018 at 19:03, Eric Auger <eric.auger@redhat.com> wrote:
> This series includes 2 patches that fix Coverity issues respectively
> in smmuv3 and smmu-common code.
>
> Eric Auger (2):
>   hw/arm/smmuv3: Fix Coverity issue in smmuv3_record_event
>   hw/arm/smmu-common: Fix coverity issue in get_block_pte_address
>
>  hw/arm/smmu-common.c | 4 ++--
>  hw/arm/smmuv3.c      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --



Applied to target-arm.next, thanks.

-- PMM
