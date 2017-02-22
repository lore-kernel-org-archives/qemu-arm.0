Received: by 10.25.0.147 with SMTP id 141csp951956lfa;
        Wed, 22 Feb 2017 04:42:52 -0800 (PST)
X-Received: by 10.200.41.153 with SMTP id 25mr28346624qts.108.1487767372374;
        Wed, 22 Feb 2017 04:42:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si766231qte.315.2017.02.22.04.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 04:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgWFt-0005qP-Li
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 07:42:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgWE9-0004tW-Jw
	for qemu-devel@nongnu.org; Wed, 22 Feb 2017 07:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgWE8-0001id-Ty
	for qemu-devel@nongnu.org; Wed, 22 Feb 2017 07:41:01 -0500
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:34826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgWE8-0001iJ-NR
	for qemu-devel@nongnu.org; Wed, 22 Feb 2017 07:41:00 -0500
Received: by mail-wr0-x234.google.com with SMTP id s27so1013786wrb.2
	for <qemu-devel@nongnu.org>; Wed, 22 Feb 2017 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cIejmefgIcYpI71B7BzrFe0IKKPHUcGL3N9e48K+1rg=;
	b=i2jRgX7ZKVaOX5v4k6ZgAt0+tV0KRbH8a7utjvVIkn/4X24Shybqlj+eSoGX7pTlyV
	amk702me9lBZS8Kr4SahBHxCgb9XoylGb7frEslFh8ZSh80RpRcq57quprfgrOljTe1D
	g2XhztHI+FTHUUtmj720dRqRBDhw+K+eaJXVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cIejmefgIcYpI71B7BzrFe0IKKPHUcGL3N9e48K+1rg=;
	b=rM5sKKanycCEoiunmvlPwFUyVhPaFfa+x8NrzYX6lSAgcpYThMrhSvyihb7yFB/JIb
	EtNebkZNQIasqbPHM1TrrsSTgsM3jaVuigfuBx2a/TG7dj3clRRn55PYVI87M/RMZ/E4
	JutBVlwU2sMRka/UCyE+DLP+8vpC7wtBUWiMVlfoqcutp3SrQaXFq3YKPKMePMO4TWSg
	iDiFZwzAJ0eoe+5icHL/dV4vaJWMTVaiD7bopOx59Jk96vTEcL/y/hO2q5PQ3e0Drvqb
	6+IRdjAhgflwhFb6+Hvz30JFeNQ23sqUgtLG/IP4ZCEYUjWPUh9CEVYsghcuPltsQayL
	1IFQ==
X-Gm-Message-State: AMke39lLAifQLkYsBvxFQUvW3jBloFRRW+eYVFZHz/EruppB0TrqCPvg9UixKgGOo3y1t3P1Qhl/bB8+aH1ogaCg
X-Received: by 10.223.150.209 with SMTP id u75mr7315475wrb.195.1487767259621; 
	Wed, 22 Feb 2017 04:40:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Wed, 22 Feb 2017 04:40:38 -0800 (PST)
In-Reply-To: <CAFEAcA8sTEtJGpvrL3qCQ7OfUaQ5Ym0siQfGMnTpaUQw+Uzh_A@mail.gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
	<CALicx6tqxXZxBTxYvF55ydBg5CB1to3MsEkhaohucx4EAZcEJA@mail.gmail.com>
	<CAFEAcA_NbQNzrUUCAS2e5Xso0rg6H3+nzDjTc9i8Tc+GLpXvLw@mail.gmail.com>
	<CALicx6uiFYXsOMaiCH9HYW_jxbMSg+QSCrbVr0D-UKWwtf+TwA@mail.gmail.com>
	<CAFEAcA8sTEtJGpvrL3qCQ7OfUaQ5Ym0siQfGMnTpaUQw+Uzh_A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Feb 2017 12:40:38 +0000
Message-ID: <CAFEAcA_U_8tJqa7U8vKqrZJYkyJcdcCGBV4E8ou9psqu=GS2Ow@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-devel] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rm6SJt9j6lND

On 22 February 2017 at 12:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> I talked to Marc Z who agreed this is a KVM bug -- the kernel
> should have these bits be RAO/WI like TCG. I think Marc
> was going to write a patch...

...so given that, what we want on the QEMU side is:
 * in a migration preload function:
   /* if the sre_el1 subsection is not transferred this
    * means SRE_EL1 is 0x7 (which might not be the same as
    * our reset value).
    */
   cs->icc_sre_el1 = 0x7;

 * the reg_needed function should be
   return cs->icc_sre_el1 != 0x7;

and the rest of this patch is OK I think.

thanks
-- PMM
