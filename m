Received: by 10.223.197.9 with SMTP id q9csp2696933wrf;
        Mon, 9 Oct 2017 10:48:49 -0700 (PDT)
X-Received: by 10.55.221.68 with SMTP id n65mr10478148qki.27.1507571329233;
        Mon, 09 Oct 2017 10:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507571329; cv=none;
        d=google.com; s=arc-20160816;
        b=hfWwyvLAGyHpCGapDae3t++oAveptppiQL8tGG1rRu1Vy4ZDY/cwhsN8BktwtCwUIV
         xvOlgyxfx3A3m/JuFsx9iSlNCct3QDYE8O9oVrNWcFujSr23eI0swELEHK+Idwr+oLmW
         pXo6FYTqUVTH1Op5f2wjwlFxx5xJ92pBhCqo+DVuENfRPsJbctL/DxVGakYfJ6Yv0AM+
         2jJz/e9We9VimELDx3HK04iWpzD9JL+bS+XxwkvuZoc5I88poQHC5ITLZj8IVQiffcGw
         j2U/rl+2Ch69p5wimLkaKCP+67bCGJMf0ZVUDNEA50kR4863z3sGBhsg1Q0CZ5s7U1Sp
         IT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oQd+kr2OWeuBRJ1mOuEEPhJtTDizubnUQ7FUV8ijIXw=;
        b=yoOIQ6gfoMRi3qzuKzYtHg3nVlqmj1JS5oFtmpXKT2hJifAIB0D+Vzlt9cuR2ZGwCR
         5kAATdwEcXV7Of3tiX6BjmG8V4AgpOsEu0fL4OfWNBjsqQicm9fm2IEuFuAI8S6vxZAA
         nZcdje5bMaLb3ws1YL4fvJZbAs8f/ZIEvGfYVY1EMmqyxatleu3GptQ6ELaCCoOKM7yR
         8iThukybvGh8FAui7qPkqOzMVHBE1+jHmNG+XGRDUuIjNhnfpy3V9Fm1mTir9RALmAuE
         jQ+mLjY0B2UeuJ5AU1BboUHTqN1kMLatxAM/Gp6UGftvFA4qfuhr8jbW0okTXMlI1LKg
         r5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQa44Ucc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b70si1456019qkg.531.2017.10.09.10.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQa44Ucc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1cAa-0007Pv-PH
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:48:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cAO-0007OZ-MM
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cAN-0006Pf-Th
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:48:36 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:56926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1cAN-0006PF-NE
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:48:35 -0400
Received: by mail-wm0-x22b.google.com with SMTP id l68so25586161wmd.5
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oQd+kr2OWeuBRJ1mOuEEPhJtTDizubnUQ7FUV8ijIXw=;
	b=MQa44Uccv48b1eRQjHebar28rbgqGGwWFrgRlHBvI3+h1b3VWUVZRlY0q1pvZ74gJ+
	80BmISshTo5f8wJ8VaHxOJElbXuVErUD4sncb+LLnZ9yacDB1Rawi2BGU8D3kOaqhZq4
	tkybnAE/oa7SZZrJ4GVYHzUwVO63bNbpVPmNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oQd+kr2OWeuBRJ1mOuEEPhJtTDizubnUQ7FUV8ijIXw=;
	b=L1iOCKBgNnwSo8RFZogaQNVEdiv51nSh9zVKX+bevbZIipIJbNo3immo3aAL+GsaLs
	SgWE8h+5ZKbYfEPwuNWqJ3CJQqZlCRLbZGd8jhm0TAY4t6OEdIGNFCIIJhvS3/JSxxYb
	e0/Qq3I40cm/56Yx3duoiJcwoo5pxO4XASGMpichvy3L7ZoC7eH7cfBW+4hPkeoTTY2Y
	s1ucigUdmNQWLpuyVqw+0eYBHzO5pylSSACHwMyaMDPf2JLunwQsOzCscdN0bD1J60ix
	SrvZ2UAPfPVdsA09Hir2QntPG8BDXFzbGFF1EDIGpAMqcPu3FHqynlVvFsRNa00/ZneZ
	B4Dg==
X-Gm-Message-State: AMCzsaX9JXMcXgJxsKy+FahBNGHDG/ulMCGvu53QRX+OZGtnkLqJ8oAh
	nn+3zXjEqPh8mIbLR1fb8h0djavGtj3CRa0dfuK3mg==
X-Google-Smtp-Source: AOwi7QDXmZoWzRn/4Fqt1V9XrV8+ibnemVfyco40DoifdRglg7ZKGTFyKSeMtWSw6X4Qo1miEognJolCNkgtvoQuqWw=
X-Received: by 10.28.236.203 with SMTP id h72mr9795061wmi.147.1507571314643;
	Mon, 09 Oct 2017 10:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:48:14 -0700 (PDT)
In-Reply-To: <1504286483-23327-20-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-20-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:48:14 +0100
Message-ID: <CAFEAcA-J4FTDWzSTYbo=UcX7h5DCddd+K3XRW_umQ8XzKqrQgw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH v7 19/20] hw/arm/smmuv3: [not for upstream]
 add SMMU_CMD_TLBI_NH_VA_AM handling
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
X-TUID: iXBkufmtdG2l

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> SMMUV3 does not support any IOVA range TLBI command:
> SMMU_CMD_TLBI_NH_VA invalidates TLB entries by page.
> That's an issue when running DPDK on guest. DPDK uses
> hugepages but each time a hugepage is mapped on guest side,
> a storm of SMMU_CMD_TLBI_NH_VA commands get sent by the
> guest smmuv3 driver and trapped by QEMU for VFIO replay.
>
> Let's get prepared to handle implementation defined commands,
> SMMU_CMD_TLBI_NH_VA_VM, which invalidate a range of IOVAs.
>
> Upon this command, we notify the whole range in one host.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Definite NACK for this, I'm afraid. We should emulate the
hardware, not new things of our own devising.

thanks
-- PMM
