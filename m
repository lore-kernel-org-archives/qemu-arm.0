Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1631717wrq;
        Thu, 5 Jul 2018 06:52:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd8tQG2OMzwwPmDSJ757ZcEP9HU2hUrsk87CfBZzYZ0AdVOxDZWD09kZPpbkyaMNAWWdn4e
X-Received: by 2002:a0c:e80b:: with SMTP id y11-v6mr5231429qvn.10.1530798773052;
        Thu, 05 Jul 2018 06:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530798773; cv=none;
        d=google.com; s=arc-20160816;
        b=OjWz5wtWcfCMR+KP8m6axPyHOPKNBnCGJWvJH9yyKmXj66hQoh85CLnQ6yUkjvrInR
         /Tt/4nndWUzCUUY4kV2NyW+L+m7YRkwkrbGPY31pVN/nSYNToq1koODltZHBHoX7E1Rb
         qZ1uE/IdHbot+np7UANfjC6ntb3FvIYF6wMNP728OPy1+PW58zzkTzi5F8vhw77SPuYs
         ekMGX6uABT1rjBG+fzNyI/kP6E3+F5YtCySFnwA431XQGlvkmqLY6Bxb9V5FZ72TMrJF
         vvchAsvAzO0ltMggrqY6Y8jiSLpRfDnz/5ir3JpkZdHTtIEXMpHHUHBa5btAbDssHetL
         7waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/wVFLNWhWJn1FZcSLKVRyIJmuWzN/r7mxUQ9T4Dx1r0=;
        b=IlIH1/DrofJ70UOHsCU0YDvG6mEgX22PuZswJwU/wVhm+WxefyN12tRWREJg25sVAR
         wvHFGLkBNwTzuhDFFJ0wZH9b+WmGG3lQMuE+gkTwIBuQ0C+LGDxtWFh5peKUqr/NPmvv
         TKyB75caJrI974E7PUviRblNZqF1uN94/UDzJ7cS0C28sCn6BWSZ9MZNZXe7l8HMlP6f
         cZboihRg+ottRb788PDDNdCE/Cxa7Cs63NbXf7e/lksl8qiNO1fJLFxVMqI7dcSs6Xzh
         zJ/yksxIb5WD46HgoXyoBKp1o0KdnO7lsIQcO29hFS3xdoAZDSAGRfMChnOm/xqhOl3+
         /tYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5UCqDNj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k42-v6si5633784qvk.74.2018.07.05.06.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 06:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5UCqDNj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb4gm-000836-EC
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 09:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb4f0-00073t-6g
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 09:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb4ey-00084P-Kq
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 09:51:02 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb4ey-00083F-FO
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 09:51:00 -0400
Received: by mail-oi0-x243.google.com with SMTP id d189-v6so16975862oib.6
	for <qemu-devel@nongnu.org>; Thu, 05 Jul 2018 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/wVFLNWhWJn1FZcSLKVRyIJmuWzN/r7mxUQ9T4Dx1r0=;
	b=M5UCqDNjr2Cbn7M1j+28p8d8ndIsD7oyo5SOLoGa6J3Ilyfw2yyiDwoXV1cdUh598J
	0+4ecqVtgOQujKtmrbtTjQWztUFqggJoIWKNqkWgCt/YoBgu2GpZHrYoXijvAziRY9TL
	Xz4h40/LREfr1w2u2yfi7F4a1weSJwSxoMZ8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/wVFLNWhWJn1FZcSLKVRyIJmuWzN/r7mxUQ9T4Dx1r0=;
	b=cbZcQFVxRxUr6DyuzyOhUC4AU8A9CoAkjwi2Q05MSus7nqxFrIQGiCVJdoO7EN9mb2
	VQFtBntgZuRj85DbbPLfDK5Hp7zspaBpCtfW4MdD3a5RKXI46JpgCousYN6GvC19VSr0
	jm37EtU2YafriUnhphA62atC8hOuvs3aPqxVK5rrz3l+assngneBydEaI0Zf4GaOXVdo
	8HpnFVvp3y4e07FVgsnhvGGvOO5tzdZvF+2VrrK/HULh6ECcj8ESCLrF6J/XzpwvBonU
	NJFoDIxjuyqS06eiFT6CJ7lRb+UAGI2l0gIQLwLxCtt3VlaD+/C8EhrvJAOKJNnChy/V
	of7g==
X-Gm-Message-State: APt69E0W5oe0MvK49zTAnm0KSDFzh0E4tinTa/vN0Uh4h4ATw6R0Xnon
	0kXf77cTdH3RBV6lVKlZ1EuK4qpNqxlOnvdekRDK/Q==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr7173216oig.13.1530798659827; 
	Thu, 05 Jul 2018 06:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 06:50:39 -0700 (PDT)
In-Reply-To: <94f26745-00a2-eb8d-f6d9-d9ad4829214e@redhat.com>
References: <1530775623-32399-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8YkDgJgr5Mgv4PgpmhQDpr+61hfaxmpnQWGXocEawxdg@mail.gmail.com>
	<94f26745-00a2-eb8d-f6d9-d9ad4829214e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 14:50:39 +0100
Message-ID: <CAFEAcA_nPNaEAOcYFQQ1Vxw1E9B4WuZitj1AQSMCQ4qvqZMcMw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH for 3.0] hw/arm/smmu-common: Fix devfn
 computation in smmu_iommu_mr
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpgaFuMyOqVX

On 5 July 2018 at 14:30, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 07/05/2018 02:56 PM, Peter Maydell wrote:
>> Is there a reason I missed why we don't just define the struct
>> to have
>>   SMMUDevice *pbdev[SMMU_PCI_DEVFN_MAX];
>
> I don't see any reason either. This code is inherited from
> hw/i386.intel_iommu.c vtd_find_add_as() which does the same allocation
> and I cannot find any reason out there either. This is not a
> justification though ;-)
>
> Can I fix it in 3.1 or do you want me to fix it for 3.0?

3.1 is fine.

thanks
-- PMM
