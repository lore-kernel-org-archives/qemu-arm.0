Received: by 10.223.172.38 with SMTP id v35csp4958762wrc;
        Wed, 27 Sep 2017 10:38:35 -0700 (PDT)
X-Received: by 10.55.39.193 with SMTP id n184mr3141646qkn.273.1506533915673;
        Wed, 27 Sep 2017 10:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506533915; cv=none;
        d=google.com; s=arc-20160816;
        b=rELvAK+y7TiSNKJ9HOVvPa4OVBE3MepGJmzwMZgwIgmR39a0WJfaQL20w9Hz/LK2g8
         5YhzK8+wjjF4N36mxd+UYqm75eNxrnj1mzAiGBAD8XZtUudlWdpoQFZHtHYpC4/lUt2E
         7Y/TgxVB2ZnIw/1fkVDjDoIZETdD1CCAuSFt52dZPGkSYPdkb9ZiN5Wgh0B6wClPYyPh
         nLk0yOStMv96VlXhl6N6b7RC6ABJj5bK9GP8DK1sqEETdrZVkw11E9+AM+Q630yeVal5
         JxuiAor9ufGm9S6Dix4wqn5FBfqGc9x/a+Xu7jZz//5JtYkwl3GrCODIeq/08DlUQAeG
         jVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=20LFrp0TQrpd18XxGoZ4RuY6fAJipAm3AzQoSrOJkIY=;
        b=sy1q+Q7dW+ArVjHPWc/vEiz1mFHHYHtDTCY4ZFhAPDmUb9lELkfUzTuoW0naJCEe1J
         rr4AtMydXIlk0kSnGZneySMij0TfhFfCF4lz5nbHKL8g7WY8NfsMCFzOVEsFxmRm27qF
         NjY6Navhx0R9zmcDufS/Nz2LyAIr3iekF5Uyp0rs9E76/Xd10+UlULkEsH+e1G3lx6W5
         4O/+vChJrRsgF3Bx9pwqKbTf9g0HzdR0jRL5jp0eft9S6kcL67eijWE+vyl95UBB9htO
         rGL2rimvgK+5v4/DDZtZHwebZIceJCzxGNDkaW9ekYOlaBj7XBV78dvDBFvQ1d3JI2JL
         DWeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gb5MxRM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q44si319709qtj.490.2017.09.27.10.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 10:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gb5MxRM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxGI5-0001eR-EK
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 13:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxGHv-0001cQ-PX
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 13:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxGHu-0005X9-RG
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 13:38:23 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:48069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dxGHu-0005WQ-Jt
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 13:38:22 -0400
Received: by mail-wr0-x235.google.com with SMTP id y95so3994681wrb.4
	for <qemu-arm@nongnu.org>; Wed, 27 Sep 2017 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=20LFrp0TQrpd18XxGoZ4RuY6fAJipAm3AzQoSrOJkIY=;
	b=gb5MxRM8rnxibNxPFg/pFNU43q4Z8iq3JcDlc1uAn7+ZlU3q6jgZGlwM04qPRBAAwL
	78mGiF1tyAwwuwFs2gLQVUdB3w00EuujvWpQsM1/XTVhw0fcq5tsyJAB3xjXHVz67jQg
	eLlw4SOWBAAnfxIYqkrPAr9o2+69peR1zJeJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=20LFrp0TQrpd18XxGoZ4RuY6fAJipAm3AzQoSrOJkIY=;
	b=Thl7TuDFJz4kvFTn+0xd5Z3dsh8HXKxlk8ZX5VokaKuzF1CUhBSIjcTX77vu2pDfGK
	KpcbOn80UoGEvvyT3nWFgGDBTySQpuqlAd32uFP9e7Tf2KlrOwjzsM6yf+LTmes5CZsw
	UPVODxgrnVyxV4/MR/CzGgKo3B216R7ifMWjnMkww7zRZwwX4PAOLBM5W++2wYe3aI+v
	DssQN0UbwACYK1qK0KzuorN1s/BO7sMyl1f6f65PK8GwfvyzQvhSLuHcX9B3vlBZRL7K
	PniD7gjv9CS7YusVNYsNpkpkoQphsJaRm0SMeoBjrFlfWHd+Jm1EnTl/MdEWeDBAN1JW
	rNZA==
X-Gm-Message-State: AHPjjUjesc6fqbwsOxRB9RdIjczRfoBzDHCLeIpLnKX2WfJaNjEQ3tmB
	Cfm/xDBBgsvwYaWoqDqYY9LcVdpxxa4tWw4BlcJQEQ==
X-Google-Smtp-Source: AOwi7QARDSNrxA2QAewoaBlIjODwciRck67qzG2FoMj8nRG4IFON8+JqPPQUnheby3lfbCb+c4oT8Ky0xehlAiVlNVQ=
X-Received: by 10.223.186.201 with SMTP id w9mr2071101wrg.230.1506533901373;
	Wed, 27 Sep 2017 10:38:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Wed, 27 Sep 2017 10:38:00 -0700 (PDT)
In-Reply-To: <1504286483-23327-2-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Sep 2017 10:38:00 -0700
Message-ID: <CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH v7 01/20] hw/arm/smmu-common: smmu base
 device and datatypes
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKXW1zu2RA4x

On 1 September 2017 at 10:21, Eric Auger <eric.auger@redhat.com> wrote:
> The patch introduces the smmu base device and class for the ARM
> smmu. Devices for specific versions will be derived from this
> base device.
>
> We also introduce some important datatypes.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

> +/*
> + * Copyright (C) 2014-2016 Broadcom Corporation
> + * Copyright (c) 2017 Red Hat, Inc.
> + * Written by Prem Mallappa, Eric Auger
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Really GPL-2-only ?

Unless there's a good reason, you should probably fix this (including
getting an ack from Prem/Broadcom where it applies to code that came
from him).

thanks
-- PMM
