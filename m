Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1437937wrq;
        Thu, 12 Jul 2018 07:30:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcKAuHXE5uqgPcm+a3sWU//f72PaPD0tS/gUuYpS2z/L1qnLDqqaIfyHODnLTbCEIe8p2eV
X-Received: by 2002:a37:9e17:: with SMTP id h23-v6mr1839700qke.269.1531405800540;
        Thu, 12 Jul 2018 07:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531405800; cv=none;
        d=google.com; s=arc-20160816;
        b=uJ66TYloV9D9bfVbTnv2ZR5UpHhwPdzoPdLXLRAVGyvx8zksBfboMsIMsOcmS56Un3
         fmwxQ7UyTp5kUTiCGKWHlZiYQi2TzsCgZYNiJxw4ZIt6ZCrvPL61S+THt0DNCRa3QqrT
         Q3dQnyyl+Tjd9Py7ktWvl0pT1U7eUwfQkXx5uzRRbd+qtF8BnHsRd+l5f9IDdqX+ePFN
         9yTirlxbLFES8UbEyQNklQ7jl7F7B+xFWXzVzynxjOhYnPaflstewZOVph45lEpBcAe+
         cDRR9/H13FBd36DehpWC7dnN/52UR/dmExDLXj+elNb0sRmuNdK52Tc9Y0WyspYq1zpJ
         yk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=v7RKkvba8Sz+i+pg4q961ojmX4JE02xEES9cr4D9mXc=;
        b=XTfhXDpNJRM55hWsXw+R5/t5bfhZPaHUfIanpghbWlEA1LiHYhxZD4+5DP0QG+6FGJ
         0jilwIJXLu6X15DzSfF9OWtV1oe62vKPdOkERfFi44AdnwOXFyrgT7fH/CICRzt8//MA
         NiqwRC43bvZ3AejJ2pz/CETCqJ3sahHQLrH7HgRHqDgsO1pn1KqiQ24YrkwJAiiR4cHV
         LeB/CkIQEMpui15WLGZ90QzT4Ouz/J8ylbhdM07nOZ1BBuQ7NZtaYNm0BaCkRqg4SPKJ
         c0duSOeV4VsPL01PxG6+LlgECnKHAZecoJmdPR5LxIYpeAu+iv61qwrhZ8S+sr7hsGKt
         qFsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A30fengd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3-v6si2832413qto.323.2018.07.12.07.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 07:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A30fengd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdcbY-0001Yo-0j
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 10:30:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcb9-0001VQ-MG
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 10:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcb8-0000Bo-CE
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 10:29:35 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdcb8-0000BO-7P
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 10:29:34 -0400
Received: by mail-oi0-x244.google.com with SMTP id w126-v6so56127914oie.7
	for <qemu-devel@nongnu.org>; Thu, 12 Jul 2018 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v7RKkvba8Sz+i+pg4q961ojmX4JE02xEES9cr4D9mXc=;
	b=A30fengdnz74r/a40CL5jgaMvEoVI58cxcVauhUQw2AYVcyCwefHx3Y/B29qS/yYym
	+qzohWl1dVRdfkPvYrK3hd1zjd3rMRuEBoiNTXgHDLrjNXKTWwXhKp11fFfAmgG+SAbo
	TDjHRkcumpnr10F/1fLKaUG8UXuiApIYCgRAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v7RKkvba8Sz+i+pg4q961ojmX4JE02xEES9cr4D9mXc=;
	b=rLup+mZ1zEAFjLHBIKTudFNQMEituUfx0vU8S2qOHDjEKlZqcXd1uvlVqRNtzF6FSe
	OqejzaaPBV0Ri/qMHlQBYrxGf6PpdgfuNfYDk2BaTabX8/9pKQiHQh4cKK9cEA9vRThn
	BTu5rY4+Q7v3lZB3LfOcMJAICMUZil3v3if5YpRRTYR5Jmv3mMEvgk8xTOCehKhg5imw
	Icv9gSXyn9Ne2+2j0IFqLht5ltytvMBmftfPnmynY59SnBiSZgsbtQL1CB6Q56KXnLOO
	LM+1R7LVGYoevM8gT3KT6rFZPFyq6BjalyUfnG9Y57KyPUgXE8stPLUFjoUHmQe/nbZI
	YYng==
X-Gm-Message-State: AOUpUlGbIIrC63I8prMSLqiPrd4IdXCcuMuPqRtuar36sBeercC5QUmX
	5IfRjI5qhcYEF0aBvyT6eDgxywjNCa8rKNxwB2N21Q==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr2700253oih.12.1531405773596; 
	Thu, 12 Jul 2018 07:29:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:29:13
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-20-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-20-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 15:29:13 +0100
Message-ID: <CAFEAcA-F8Lj1SxFJZ1-GwdYaFSGP214eGTrFFoBHh0aasbBraA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 19/20] xlnx-zynqmp: Improve
 GIC wiring and MMIO mapping
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a1ZBgRgairni

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> This commit improve the way the GIC is realized and connected in the
> ZynqMP SoC. The security extensions are enabled only if requested in the
> machine state. The same goes for the virtualization extensions.
>
> All the GIC to APU CPU(s) IRQ lines are now connected, including FIQ,
> vIRQ and vFIQ. The missing CPU to GIC timers IRQ connections are also
> added (HYP and SEC timers).
>
> The GIC maintenance IRQs are back-wired to the correct GIC PPIs.
>
> Finally, the MMIO mappings are reworked to take into account the ZynqMP
> specificities. the GIC (v)CPU interface is aliased 16 times:

"specifics". "The"

>   * for the firsts 0x1000 bytes from 0xf9010000 to 0xf901f000
>   * for the seconds 0x1000 bytes from 0xf9020000 to 0xf902f000

"second"

> Mappings of the virtual interface and virtual CPU interface are mapped
> only when virtualization extensions are requested. The
> XlnxZynqMPGICRegion struct has been enhanced to be able to catch all
> this information.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---

Nothing obviously wrong here, but I'll leave the details for
one of the Xilinx folk to review.

thanks
-- PMM
