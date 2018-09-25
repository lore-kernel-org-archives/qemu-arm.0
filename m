Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp733653wrt;
        Tue, 25 Sep 2018 07:19:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63+9s6cOH9reLYidjpPa99oLqs5ixV7st050urGRBQ+z8lDNXtA4QGxbkcyykHcoVyytFWZ
X-Received: by 2002:a37:dcc6:: with SMTP id v189-v6mr906213qki.9.1537885169261;
        Tue, 25 Sep 2018 07:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537885169; cv=none;
        d=google.com; s=arc-20160816;
        b=PbUUR0ilXmUBAoLkzNnMjLpItvNVxnLsnuHDaZ2PhetPv5et7NKJSn55ynIdr9oE4u
         EUKZcD91ajPvc4HegOhIzYEsyiTdvacWxvFWiIU/HQTU8TJ3uKz5FSDab39M3+tR0GQP
         9OegMFsVv377Y8cUaCb89qEwlOV8W72YJsOi6tgoJQW9qxyUtmCfoLDHArhevIWaXi6t
         TIzjiqvuEnO+KDOKkIgCgOVSt9y6CPSzUnfvAzcg8O3Yh0q2SaiIMzt5pRWCT0ZE/SS7
         9D/qd6bGHFS0Mp6T9HBFI3Dx5zDlBoCtUXsqGICdNkMh3+jc6b2o5VcZRYTfpxzK3eIo
         vKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ADzxdRWW2nYyLJycRqPVchtosdBcP0DZqIu27aR6Kxo=;
        b=JCcwgeutRk70J4CUVCuoVneZ+8sW7llb6g3Y3txF3dD+ionSy3zuhe4S68XD2xy/Xk
         nSSH3QbsXRx7auyRmv8U24juf13L2rUmA9x7gF6wdHB2ibzhHH5pFEHgsDO8BnMJCFaG
         ni0uS5pmVc3ZIBxrOGZdLy74Sf4/UqT5dsFr9liamVmvW30aXRkag/1WTD1Vib7oLaUn
         WOqdxTTKIOURhqAdZVPYgJMbeL1EVcQJzZ5j1H8JBURr/TyPp0x4WQr3Tf9ncaM41psv
         yDJ0Z9oPPybf8wWI5eeS8BYM0GJoBPW34TrGPqPK2p+eR4RL5mYcMoJJP985DfZZ4Y09
         mymQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RROdcyw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v12-v6si1544836qtv.322.2018.09.25.07.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RROdcyw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oBU-0004rS-Kf
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:19:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4o1o-0005Vw-9M
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4o1m-0007Hn-8G
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:09:28 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4o1l-0007F6-HM
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:09:25 -0400
Received: by mail-ot1-x343.google.com with SMTP id j9-v6so24548422otl.2
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADzxdRWW2nYyLJycRqPVchtosdBcP0DZqIu27aR6Kxo=;
	b=RROdcyw11qxAGKIV78c/LippbAY/FQbnET1CJM7W053oZauqjIa4Meu3u0Ga2axMDR
	yqk5BqEswssn2Sp/J2+bYNWNIZYBVQCIzu+fYCNHUbS6AheK/lRCaTiEkPT6+G8nu1Dz
	MXDtNJdCxwowQ9Em6OGCz8p7wwbga0achZFtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADzxdRWW2nYyLJycRqPVchtosdBcP0DZqIu27aR6Kxo=;
	b=hSnPClfeszEBE+0e1/3zz+tdczjPj2qljLm/IW5yI0MjR4EvZVp9tGHe8DHoYeYfAI
	boWU64fXVyD97Fwsd6UG0pL/Yml1xA5op0ScrleM7eXVzOWwTMKANjuPmaOWEQv/uGGl
	/bCY5LgxMFteljKZ3J5wxOMkoFjzZCMaBFeRBdLNsf3MLhHJTHL+3Sep8iabEwds5/Sg
	GRh4piM+0ik3JSID8BzIxviNl2yUDht19KjTd5J461ar+suC3pLt/CZaAa7YejybM/G+
	Qxx7zHpiDUQERo+ryalUJnKWoYQp6+yQS5uhUmdDI6qwsRmsDukDRe7JNQQdn3a5sQiY
	Gqcg==
X-Gm-Message-State: ABuFfohfcOfqYc0wZOexXUlXwNyeCmNTpNsJfMDYP6nKHiTzX3nP8V+V
	Yjrazdc8m6ZQ6kjYNZV3+genqNULVfYsMK1WncQ7ew==
X-Received: by 2002:a9d:2e21:: with SMTP id q30-v6mr841813otb.98.1537884561120;
	Tue, 25 Sep 2018 07:09:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 07:09:00
	-0700 (PDT)
In-Reply-To: <20180921070138.10114-2-eric.auger@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 15:09:00 +0100
Message-ID: <CAFEAcA9vHnCrw7mX=_TTvhBjpE-58dZCX8zPOVpCBNeHya-p6w@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/smmu-common: Fix the name of the
 iommu memory regions
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
X-TUID: +Ybg78b1pQXL

On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
> At the point smmu_find_add_as() gets called, the bus number might
> not be computed. Let's change the name of IOMMU memory region and
> just use the devfn and an incrementing index.
>
> The name only is used for debug.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 55c75d65d2..3f55cfd193 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>      SMMUState *s = opaque;
>      SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
>      SMMUDevice *sdev;
> +    static uint index;

"uint" isn't a standard type (and causes a build failure on
at least one of my build systems). Did you mean "unsigned int" ?

thanks
-- PMM
