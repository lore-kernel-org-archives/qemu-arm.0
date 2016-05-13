Received: by 10.25.208.137 with SMTP id h131csp228962lfg;
        Fri, 13 May 2016 08:25:23 -0700 (PDT)
X-Received: by 10.55.204.3 with SMTP id r3mr7050630qki.65.1463153123759;
        Fri, 13 May 2016 08:25:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s205si12364432qhs.11.2016.05.13.08.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 08:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1Exv-0008Ei-8T
	for alex.bennee@linaro.org; Fri, 13 May 2016 11:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1Exr-0008Bm-TR
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1Exq-0007Ft-Ht
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:25:19 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:32961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1Exq-0007Fl-6L
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:25:18 -0400
Received: by mail-vk0-x230.google.com with SMTP id o133so141396692vka.0
	for <qemu-arm@nongnu.org>; Fri, 13 May 2016 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XjDR1gQVk/9f4R7NgdLKn6mOdnFKYz5gj9PnSjCFKM8=;
	b=hbwkggCwmUjdULoVrBygXwhynUv/ogpNv41TWJ+AGyDWHWI3mEsqG3KS7sWALj3EdA
	SK1A/yUMcRicvR2qpLGS8Cacf1kbL0M1dirNnUbg0abO4VlDLN3g3hkcQTTgEKTXN1is
	NXneyjJ9jDnpzzUzkk27VfUOETEo3q1ij46r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XjDR1gQVk/9f4R7NgdLKn6mOdnFKYz5gj9PnSjCFKM8=;
	b=fhoFc63052iqXMU92KzMxTL6TX9ZNzWo91U+z5zUAboCldqo823RHOPJs5wQV/bF5w
	Q6N+sOjeMBAkqxqzoWL0pTXyKXEyZHU05jYfHFK9eCrFhY3KehIz44gDl+o9wlwdA4s0
	dSlkS76CS4cv6B+Qy5HYdLryxHUS8tz+6JkWG7hLleYWts3IB/gDEtxgit/zNCeSnGBo
	YdosR0leZ/BoWOV2877ycAz6S7AuqBAD15pNlboe75q5ldhZukZqU84CpunRqcBm7fBl
	L/ZIZ+1YOFvENL0H1kfMM+Xvlg0E7tyzH8VzsFPDeeVRIpeUIqybp0ZuL/X7lWxA6h1W
	jJ3A==
X-Gm-Message-State: AOPr4FVB6TaL2plEEbGs+A0OmJvyYXIlNh4uxF9R1tkGEf7nvCfrxofmNJ5/+f6sn7DFJGofa49r/YyFI7rWnNhe
X-Received: by 10.176.68.162 with SMTP id n31mr8045845uan.26.1463153117384;
	Fri, 13 May 2016 08:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 13 May 2016 08:24:57 -0700 (PDT)
In-Reply-To: <5735ED3B.8010904@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-12-git-send-email-peter.maydell@linaro.org>
	<5735ED3B.8010904@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2016 16:24:57 +0100
Message-ID: <CAFEAcA_9ZuAb79S1-PCU2kJ=6cHTYbuHTmD2VaZyecgBG_oFuw@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH 11/23] hw/intc/arm_gicv3: Implement GICv3
 distributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+PmoVXvM87u

On 13 May 2016 at 16:05, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> On 2016=E5=B9=B405=E6=9C=8810=E6=97=A5 01:29, Peter Maydell wrote:
>> +static MemTxResult gicd_writeb(GICv3State *s, hwaddr offset,
>> +                               uint64_t value, MemTxAttrs attrs)
>> +{
>> +    /* Most GICv3 distributor registers do not support byte accesses. *=
/
>> +    switch (offset) {
>> +    case GICD_CPENDSGIR ... GICD_CPENDSGIR + 0xf:
>> +    case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
>> +    case GICD_ITARGETSR ... GICD_ITARGETSR + 0x3ff:
>> +        /* This GIC implementation always has affinity routing enabled,
>> +         * so these registers are all RAZ/WI.
>> +         */
>> +        return MEMTX_OK;
>> +    case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
>> +    {
>> +        int irq =3D offset - GICD_IPRIORITYR;
>> +
>> +        gicd_write_ipriorityr(s, attrs, irq, value);
>> +        gicv3_update(s, irq, 1);
> The GICv3 SPEC says:
> "
> When affinity routing is enabled for the security state of an interrupt:
> =E2=80=A2 GICR_IPRIORITYR<n> is used instead of GICD_IPRIORITYR<n> where =
n =3D 0
> to 7 (that
> is, for SGIs and PPIs).
> =E2=80=A2 GICD_IPRIORITYR<n> is RAZ/WI where n =3D 0 to 7.
> "
>
> So I think it shouldn't call gicv3_update if attrs.secure is true and
> irq < 32. And it should check the parameter irq in gicv3_update().

If irq < 32 then gicd_write_ipriority() will return without
doing anything. We'll unnecessarily call gicv3_update(), but that
does no harm, and I don't think being slightly inefficient for
an access a correctly functioning guest will never make is a big problem.

>> +    switch (offset) {
>> +    case GICD_CTLR:
>> +        if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
>> +            /* The NS view of the GICD_CTLR sees only certain bits:
>> +             * + bit [31] (RWP) is an alias of the Secure bit [31]
>> +             * + bit [4] (ARE_NS) is an alias of Secure bit [5]
>> +             * + bit [1] (EnableGrp1A) is an alias of Secure bit [1] if
>> +             *   NS affinity routing is enabled, otherwise RES0
>> +             * + bit [0] (EnableGrp1) is an alias of Secure bit [1] if
>> +             *   NS affinity routing is not enabled, otherwise RES0
>> +             * Since for QEMU affinity routing is always enabled
>> +             * for both S and NS this means that bits [4] and [5] are
>> +             * both always 1, and we can simply make the NS view
>> +             * be bits 31, 4 and 1 of the S view.
>> +             */
>> +            *data =3D s->gicd_ctlr & (GICD_CTLR_ARE_NS |
> As you said, we make the NS view be bit 4 of the S view. So the
> GICD_CTLR_ARE_NS should be GICD_CTLR_ARE_S, right?

Yes, you're right, this should be GICD_CTLR_ARE_S.

>> +                                    GICD_CTLR_EN_GRP1NS |
>> +                                    GICD_CTLR_RWP);
>> +        } else {
>> +            *data =3D s->gicd_ctlr;
>> +        }
>> +        return MEMTX_OK;

thanks
-- PMM
