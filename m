Received: by 10.25.208.137 with SMTP id h131csp220360lfg;
        Fri, 13 May 2016 08:05:52 -0700 (PDT)
X-Received: by 10.140.30.246 with SMTP id d109mr15323205qgd.25.1463151951998;
        Fri, 13 May 2016 08:05:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17si5050697qkx.34.2016.05.13.08.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 08:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1Ef1-00062I-De
	for alex.bennee@linaro.org; Fri, 13 May 2016 11:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1Eev-0005uW-3l
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1Eeq-0002NB-Iq
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:05:43 -0400
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231]:36066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1Eep-0002N6-QR
	for qemu-arm@nongnu.org; Fri, 13 May 2016 11:05:40 -0400
Received: by mail-io0-x231.google.com with SMTP id i75so130803413ioa.3
	for <qemu-arm@nongnu.org>; Fri, 13 May 2016 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KBe4bML41dJz4+KFWNIb8sJUMg/a3EENABi9Lj9FgH8=;
	b=YZXGhhh62DB/LDOZljYePe49oKoWMPUP6+UCzHgyjVWmoWqWXtvEG8uvUL6yfdbA/i
	XpG2sqP0prnvjg/DwVugSkZOYaeGpF5F0V652j5erF3Ab6d6MvB+PaO9WwmgyYxh+bjc
	7B6/TwZVsndPdOvk39pY2wkTbHVniY/iQmncg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KBe4bML41dJz4+KFWNIb8sJUMg/a3EENABi9Lj9FgH8=;
	b=enfeJy6m5nDCjDrK5ZU2gMzLG48ES39uYsgpIZPcdRRyC8BbkKlud0Xot3fk1Fay3g
	XewBn0Z8Qh2lI1+joqjyM6qpAPHwFEGDffCMWosbEq2OdzFCngwnB2C6/mCmH64Ccaym
	POMtJBC1tGVYN/szCe2tZUi1+VAq0dHXCtbUq361xGZ8LTKwtoB5xEdOqwy2hhENmI53
	5xlnD0bqI7xulPsSiQnO2XQ1HimkV1LQX+0yn2XOWmqQ/puGGcvYaJGpiH1tu36uwiK/
	lCCZ3rca/Ss9nGXXktduSFIiZC55gdhbp3QeH6QAFLE7jfwwxieStZFF6BFPkSuURIAL
	QIVw==
X-Gm-Message-State: AOPr4FVN5+WiR9t7JcPRnxzQIEEB+BMxP5p7sU50ZAJ3z0zse/90ftWKpNWSXhb0hvzIZogd
X-Received: by 10.36.204.198 with SMTP id x189mr1044711itf.19.1463151938776;
	Fri, 13 May 2016 08:05:38 -0700 (PDT)
Received: from [10.13.4.150] ([167.160.116.21])
	by smtp.gmail.com with ESMTPSA id s6sm1077530igg.15.2016.05.13.08.05.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 08:05:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-12-git-send-email-peter.maydell@linaro.org>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <5735ED3B.8010904@linaro.org>
Date: Fri, 13 May 2016 23:05:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1462814989-24360-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::231
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
Cc: Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QE+x1z+qKJkK

On 2016年05月10日 01:29, Peter Maydell wrote:
> +static MemTxResult gicd_writeb(GICv3State *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    /* Most GICv3 distributor registers do not support byte accesses. */
> +    switch (offset) {
> +    case GICD_CPENDSGIR ... GICD_CPENDSGIR + 0xf:
> +    case GICD_SPENDSGIR ... GICD_SPENDSGIR + 0xf:
> +    case GICD_ITARGETSR ... GICD_ITARGETSR + 0x3ff:
> +        /* This GIC implementation always has affinity routing enabled,
> +         * so these registers are all RAZ/WI.
> +         */
> +        return MEMTX_OK;
> +    case GICD_IPRIORITYR ... GICD_IPRIORITYR + 0x3ff:
> +    {
> +        int irq = offset - GICD_IPRIORITYR;
> +
> +        gicd_write_ipriorityr(s, attrs, irq, value);
> +        gicv3_update(s, irq, 1);
The GICv3 SPEC says:
"
When affinity routing is enabled for the security state of an interrupt:
• GICR_IPRIORITYR<n> is used instead of GICD_IPRIORITYR<n> where n = 0
to 7 (that
is, for SGIs and PPIs).
• GICD_IPRIORITYR<n> is RAZ/WI where n = 0 to 7.
"

So I think it shouldn't call gicv3_update if attrs.secure is true and
irq < 32. And it should check the parameter irq in gicv3_update().

> +        return MEMTX_OK;
> +    }
> +    default:
> +        return MEMTX_ERROR;
> +    }
> +}
> +
> +static MemTxResult gicd_readw(GICv3State *s, hwaddr offset,
> +                              uint64_t *data, MemTxAttrs attrs)
> +{
> +    /* Only GICD_SETSPI_NSR, GICD_CLRSPI_NSR, GICD_SETSPI_SR and GICD_SETSPI_NSR
> +     * support 16 bit accesses, and those registers are all part of the
> +     * optional message-based SPI feature which this GIC does not currently
> +     * implement (ie for us GICD_TYPER.MBIS == 0), so for us they are
> +     * reserved.
> +     */
> +    return MEMTX_ERROR;
> +}
> +
> +static MemTxResult gicd_writew(GICv3State *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    /* Only GICD_SETSPI_NSR, GICD_CLRSPI_NSR, GICD_SETSPI_SR and GICD_SETSPI_NSR
> +     * support 16 bit accesses, and those registers are all part of the
> +     * optional message-based SPI feature which this GIC does not currently
> +     * implement (ie for us GICD_TYPER.MBIS == 0), so for us they are
> +     * reserved.
> +     */
> +    return MEMTX_ERROR;
> +}
> +
> +static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
> +                              uint64_t *data, MemTxAttrs attrs)
> +{
> +    /* Almost all GICv3 distributor registers are 32-bit.
> +     * Note that WO registers must return an UNKNOWN value on reads,
> +     * not an abort.
> +     */
> +
> +    switch (offset) {
> +    case GICD_CTLR:
> +        if (!attrs.secure && !(s->gicd_ctlr & GICD_CTLR_DS)) {
> +            /* The NS view of the GICD_CTLR sees only certain bits:
> +             * + bit [31] (RWP) is an alias of the Secure bit [31]
> +             * + bit [4] (ARE_NS) is an alias of Secure bit [5]
> +             * + bit [1] (EnableGrp1A) is an alias of Secure bit [1] if
> +             *   NS affinity routing is enabled, otherwise RES0
> +             * + bit [0] (EnableGrp1) is an alias of Secure bit [1] if
> +             *   NS affinity routing is not enabled, otherwise RES0
> +             * Since for QEMU affinity routing is always enabled
> +             * for both S and NS this means that bits [4] and [5] are
> +             * both always 1, and we can simply make the NS view
> +             * be bits 31, 4 and 1 of the S view.
> +             */
> +            *data = s->gicd_ctlr & (GICD_CTLR_ARE_NS |
As you said, we make the NS view be bit 4 of the S view. So the
GICD_CTLR_ARE_NS should be GICD_CTLR_ARE_S, right?

> +                                    GICD_CTLR_EN_GRP1NS |
> +                                    GICD_CTLR_RWP);
> +        } else {
> +            *data = s->gicd_ctlr;
> +        }
> +        return MEMTX_OK;


-- 
Shannon
