Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4706769wrt;
        Tue, 9 Oct 2018 06:43:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61gTUohlieGt5ft8TIh5YTGPVw6mgXMYNicg9Hw/RGIugOeMLUlMBAvCB4nCqr1LRTyJt2S
X-Received: by 2002:a37:7601:: with SMTP id r1-v6mr2275527qkc.319.1539092592374;
        Tue, 09 Oct 2018 06:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539092592; cv=none;
        d=google.com; s=arc-20160816;
        b=MZc0GO3S7YphkZrBSHl0TCBXTHydCBoF1FrvIWqh0ypBNec83gGkpPze2zKBwbDSvT
         AfcwQ1k6vJBi6erdEbSwri1ebh5zO/77EG8iCaozCOJoTeNwB1e1ZB75dYYL1bXnQX97
         WMKJeKrB8abAXcKtjipFwdWnu74qf1uoSob2nrh4ti8oAr+09i2PZrbsnnUUQD/NE2il
         8+bULKSUgI1GcIkO0dgKSMJyhTWmlrJq4NHf6GzHda5y4EDnylq06Bz4C6hquKjubyAI
         72BsdjDQngm5XOv6I9aEjW5n4y6TpwEZCikceWBtlZ3QOssdPViDp/KTjKrEADE9x2I5
         fKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rqqksj162arzdJwZrUquUE3cse0J5/UwQWhI2gJmy0w=;
        b=DBuBX7JooyzoBH3AAnbwUvm5cKnYFqciCcmJCtHzt4c5+jnSxKpOv8+otBoyyy/W5k
         WAXFAmckCubr33P04BfdNgxWArWlXpUoAZHTkQj0uPLkHXydTN7wpqQun9YmFWZ5lQeC
         5gekrEnS8tCxHem4pdpfI7v0Chi3OCkPx2SCEVKtOXsWjygHD4DxfgBS4f9zKl8arc+H
         A3VU7GOX4jolzzshjxXuUNu4o/OKJBc0eO/GoK8Ue6n73qIiZO9Kv3uWpjp/ZxcOy1NN
         iRqCC0WTa18+jsgSs0dcl9vVxh1Mn/38qkMpYOu8yyVbk9WmTWW6/yMdr6hSAvFZp0UY
         AA9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YLfsxABt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93-v6si1174932qtd.396.2018.10.09.06.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Oct 2018 06:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YLfsxABt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9sI3-0002MG-Qj
	for alex.bennee@linaro.org; Tue, 09 Oct 2018 09:43:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1g9sG4-0001LD-Eh
	for qemu-devel@nongnu.org; Tue, 09 Oct 2018 09:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1g9sFW-0003um-LW
	for qemu-devel@nongnu.org; Tue, 09 Oct 2018 09:41:08 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:33288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1g9sFU-0003MB-EW; Tue, 09 Oct 2018 09:40:34 -0400
Received: by mail-qt1-x842.google.com with SMTP id q40-v6so1604667qte.0;
	Tue, 09 Oct 2018 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rqqksj162arzdJwZrUquUE3cse0J5/UwQWhI2gJmy0w=;
	b=YLfsxABt6wyiXMURQF4Hxk9sfckTBiX+D+i3OdG4ghA/ikIXfM2JAnxXJphXE4C0KX
	7b4p/YOG3sdSytpuu31zCCDMpcjn37lc2oGUQdfYqYGrdauneGyFgERrnQ3dlLtT3G1Z
	qAY4Fuw9Fc+psmZxlhW3OvqlcWWrgus/XyLjTC6NVsYbtDE1D/BIDAebWzrnd2oOBue0
	n+Z7tHt16I1H+rRqy+/ZssZUb8rmlAu7vyBJDxmZigaaP8h6ABG0tzwFKXA+en1UiFn1
	Qng6raeMfI7+eWuS50onYOvK9XCH7IKVwky6F7vVnMnP4+/dVdaC9BdfooTV5ymwwL65
	afDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rqqksj162arzdJwZrUquUE3cse0J5/UwQWhI2gJmy0w=;
	b=bw7vsr28C1JWG1ILV7q4h7hZYv8l+jpImEPr0Jn3PixgwZiQBUF/MZPUD152yP+Tcv
	unR6B7jR+5/VdZ8QmoiuHgtDHFX8JHmgxq2k7nPPm+VquP7J2B6Xts7CrZ2XDBsyI+IG
	fsGxTZNqpQabpSEi6lCm79qsMkaV+8B8XlSEbtDAelP6iJpd3oqyLKaUZYAiA3ChliuL
	aMOZaq4r+aRk58abvXg8jl+ADetkDMxvSCnMKTbZoeLfz66qf1bVeUCLSpH0CAD/WPWS
	/EhzDRMgK7R4y121gsA91vpNw7omuLznnqoN7+7DHgSFf90b49V7+lSLJjRAEBeZbBxA
	u/gQ==
X-Gm-Message-State: ABuFfoih9tW+UCjIkqcfjOF1D6PJa+M4Vtxnl0xkuyavqibkGKqHcYG1
	/uBzMK25AjGDQI+tfGOYogbCQviRpzs/T90dg4w=
X-Received: by 2002:a0c:eb91:: with SMTP id x17mr8670129qvo.111.1539092423280; 
	Tue, 09 Oct 2018 06:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
	<20181008213407.GF4229@toto>
	<CAFEAcA__7wJ-4mNe3rKe4T+gDUbdBH+rB-DHE+fddmjVzG2=Eg@mail.gmail.com>
	<20181009131736.GT4229@toto>
In-Reply-To: <20181009131736.GT4229@toto>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 9 Oct 2018 15:40:13 +0200
Message-ID: <CABoDooObRovXo+Bw9tJWHy61vhTkysJx1D7016qhYgs1=O7ztA@mail.gmail.com>
To: edgar.iglesias@xilinx.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-devel] [PATCH v1 10/12] target/arm: Add the Cortex-A72
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	sstabellini@kernel.org, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	frederic.konrad@adacore.com, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0iqqDjzvMUp

Hello,

On Tue, Oct 9, 2018 at 3:19 PM Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> Another A72 related thing I wanted to check with you. A month or two ago I was
> looking at an issue with Linux running very slowly on our models.
> Something that popped up was that Linux was running a couple of spectre related
> "workarounds" and "hardening" sequences on the QEMU A72s.
>
> There are a couple of bits in the ID_AARCH64_PFR0 register that
> Linux checks before enabling the sequences but I never found any
> documentation of them in the specs. Bits 56 and 60.
>
> In Linux these are refered to as:
> ID_AA64PFR0_CSV2_SHIFT
> ID_AA64PFR0_CSV3_SHIFT
>
> This is what we have in our tree:
>
>     cpu->gic_vprebits = 5;
>     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>
>     /* Xilinx FIXUPs.  */
>     /* These indicate the BP hardening and KPTI aren't needed.  */
>     cpu->id_aa64pfr0 |= (uint64_t)1 << 56; /* BP.  */
>     cpu->id_aa64pfr0 |= (uint64_t)1 << 60; /* KPTI.  */
> }
>
> Do you know what these are?
> Should we be setting these in QEMU?

These fields are publicly documented in the system register specification:

https://developer.arm.com/products/architecture/cpu-architecture/a-profile/exploration-tools

These are ARMv8.5 fields, I don't think these should be set by default
for Cortex-A72. Of course nothing prevents you from defining a
specific CPU with these fields set to boot faster :-)  Or perhaps add
a property to override the default value of these registers?


Laurent
