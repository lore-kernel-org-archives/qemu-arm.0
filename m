Received: by 10.223.161.27 with SMTP id o27csp3940856wro;
        Tue, 31 Oct 2017 10:01:44 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QTqKYHCJSB54Kbr6gKYIAwyndJsWLQbDynOvcUtgOMqxzjv5RHtQATT+rFAnv/pRGlHo/Z
X-Received: by 10.129.48.10 with SMTP id w10mr1751810yww.378.1509469304130;
        Tue, 31 Oct 2017 10:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509469304; cv=none;
        d=google.com; s=arc-20160816;
        b=WIuQ+0xLikQqs1lMB4msoJuH7gyyEmE/pItW/74aySn+T/342poXeIOjTYbcOBXjN6
         cLGqGjtvjfNrdpQbWaXpEU40qPiRUyZTE208oc1FNo4oE1aRYt59/PYK5rAwGSuDHNPO
         JfCwf4AIfOgcw23u0+OG1jq0Es2nV+BSYffg7HsSSt/zgvd3bb3LaSWTNPr4c4x2mcSA
         1GPHGLxhd0+ItXlvElk2ElLF80jK4bigeHJQkzhmEWgaHlsxp5eUmIn3ZHipwM+YZEc1
         //XvQuuEuaL+9WYHGorubBqVGNpdzzR7Yrcvrx27a2tuua2v4KsKn7DceVt1L5KZ/PO2
         m2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=WgT+69+Ph4G/9uypcV731Qx1rN4H7ISDcwxgoNIVLV8=;
        b=DrLdEDSdxpPRd0PBoAiqlYHaGQ2tPz8LejmiPEPBqnHFL+75W6QEC5DmJdZ/fl12Jo
         ukwR2cQyGcU/2aTDDRMSngUNkz4xiXva/hB8c/B0B9i7a6vIomH446ZRQQiky5pfTd47
         k8wbXEklp0bqJd+p/xzhHnHuu/Tnih+boxjXwkWjOV9oFhqa7aTWPvKvNpHQV8gHN6j1
         VYgdGMR1z7EzKm335C2eQI0eb+9EVV9QxX+874IASx/TjD5zO5sTLuyHzd1uDE3ei/nO
         My9KM54Xs7wvvu8kCoX0AFa9fBZqdZOgTm1ZqlEDCfCd2+sxrTYW5tmY29gmGSx2B1Es
         +sFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si532465ywl.58.2017.10.31.10.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 10:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9Zv5-0003KV-JL
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 13:01:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9Zuo-0003HK-5q
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9Zuj-0004hD-BR
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:01:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9Zuj-0004ft-4b; Tue, 31 Oct 2017 13:01:21 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6C37D2190B;
	Tue, 31 Oct 2017 17:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C37D2190B
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 31 Oct 2017 10:01:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
	<CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
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
Cc: julien.grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a89Sx+SDrJbJ

On Tue, 31 Oct 2017, Peter Maydell wrote:
> On 19 October 2017 at 15:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 18 October 2017 at 01:10, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >> Advertise the presence of the GIC system register interface (1<<24)
> >> according to H9.248 of the ARM ARM.
> >>
> >> This patch allows Xen to boot on QEMU aarch64.
> >>
> >> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> >> index 670c07a..a451763 100644
> >> --- a/target/arm/cpu64.c
> >> +++ b/target/arm/cpu64.c
> >> @@ -136,7 +136,7 @@ static void aarch64_a57_initfn(Object *obj)
> >>      cpu->id_isar3 = 0x01112131;
> >>      cpu->id_isar4 = 0x00011142;
> >>      cpu->id_isar5 = 0x00011121;
> >> -    cpu->id_aa64pfr0 = 0x00002222;
> >> +    cpu->id_aa64pfr0 = 0x01002222;
> >>      cpu->id_aa64dfr0 = 0x10305106;
> >>      cpu->pmceid0 = 0x00000000;
> >>      cpu->pmceid1 = 0x00000000;
> >> @@ -196,7 +196,7 @@ static void aarch64_a53_initfn(Object *obj)
> >>      cpu->id_isar3 = 0x01112131;
> >>      cpu->id_isar4 = 0x00011142;
> >>      cpu->id_isar5 = 0x00011121;
> >> -    cpu->id_aa64pfr0 = 0x00002222;
> >> +    cpu->id_aa64pfr0 = 0x01002222;
> >>      cpu->id_aa64dfr0 = 0x10305106;
> >>      cpu->id_aa64isar0 = 0x00011120;
> >>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
> >
> > Whoops -- we missed this when we added the GICv3 support, because
> > Linux doesn't check it.
> >
> > Applied to target-arm.next, thanks.
> 
> Unfortunately I've just noticed that this breaks booting Linux
> in the "not using gicv3" case. This is because we don't actually
> define the GICv3 cpu interface registers unless the board
> instantiates a GICv3. We mustn't advertise the GICv3 sysregs
> in the ID register unless we actually have them.
> 
> Not sure how best to fix this -- it's a consequence of the
> design decision we made to have the sysregs implementation
> be in the gicv3 code. There's no useful feature bit in the CPU
> to hang this off either, it's an effect of whether the board
> model happens to wire up a gicv3 or not. So we can only figure
> this out fairly late on (probably at CPU reset time), which
> is a bit tedious for getting ID reg values right.
> 
> In the meantime I've dropped this patch from target-arm.next.

Fixing QEMU is harder than I expected. Would it be possible to update
id_aa64pfr0 at CPU reset time? Like cpu->id_aa64pfr0 |= 0x01000000; ?
