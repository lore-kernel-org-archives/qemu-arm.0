Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1385316wrq;
        Thu, 12 Jul 2018 06:44:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeQNlmri/hIDfRQi0oloTAMZ73R1hlGelqfHPFJhtirJ+Rm15tSgehxRisFVRYkOkZ/6GUG
X-Received: by 2002:a37:1a4c:: with SMTP id a73-v6mr1740241qka.77.1531403045800;
        Thu, 12 Jul 2018 06:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531403045; cv=none;
        d=google.com; s=arc-20160816;
        b=ChbSh5kLTcOU54NgHEwSyAJZkVm0SKHZSSJqbPfhJGVQ6P1H1MxgX+TzPE0atYOh/o
         64F6FiBFmfb9wDULdyi0sYtLVnD/lFRd1lVyUdj9RqAGg0k9qNrkg3vTNGwiZBYtvES1
         AfzgRXebPEuyhLBOZHe0P8uANlJaYZpI1SrUi86jBtoECjxJ30FDIjOCHuTgMhQo8WiQ
         gIhqrDKwClDSBBTleMrewl1uCr+vC3JOGE2JQEhc7bXVuZEqRWim8nilVJWAarZzznHA
         qIgJg70BhTQ2vGlQtVlYS1UGxU086sTvw+oLXdtDatl+Xr/cbpcm6Og5eyzol4yLVRSb
         W32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=z/jcdWFWDb1ZADmQRyi66WI71HPRZnrMhGRa0zrp0ZA=;
        b=kqvzV9sNTz5wwG3W7/RuVjscbFlGxVGNj0ziLWkyg5oNP0GDjOpx0LsyEXtZ0jhQWN
         avATwh+o6Jm6Dz6LwyDBLZdA+wwm48SHk0dqYa5/qPd6/H/NJ27cwax3Bj5L/H4eA5OD
         4JP4fh4JsCogdxT2H1v1c2v47pZyNSTJGDVb6/YXvoHpx7rpEN3/t26d6p2HDqUSyE+4
         aUn+ifynvdk8yAaZCBjnzh6pyKbXPYHx1Df6vNHnkJCKvI8JNN14O7seReD0dBx/IIEy
         0bPrfv5zwyB5ML8/f+FoIGqYWcunXDy6uzmNV7om47oWTf3IjHB1y/4MJdEEhUqwE9tA
         ZGpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V8qMpwpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23-v6si4861789qtp.143.2018.07.12.06.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V8qMpwpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdbt7-0000bt-C0
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbsz-0000bd-GZ
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbsy-0003yQ-PZ
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:43:57 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdbsy-0003y0-Iy
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:43:56 -0400
Received: by mail-oi0-x243.google.com with SMTP id w126-v6so55827888oie.7
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z/jcdWFWDb1ZADmQRyi66WI71HPRZnrMhGRa0zrp0ZA=;
	b=V8qMpwpBVzpNiqGT6KxZ8xUaHF8qYCK8ORSV0krozvrTxVCV2O4ZV7FBsQOO85sSBh
	r5TK4z7/gAV2I61+Cf7PDeBa6R1b9sEghsV3drvk43CaNaKxmsphNDCHrnw9iPdl+yWt
	SbJGha/Ie4OIu6q4Wx/wUvXYD0vxmWV9I9Pyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z/jcdWFWDb1ZADmQRyi66WI71HPRZnrMhGRa0zrp0ZA=;
	b=fWOifbJUsS46DnXq8Cj4ngpAtVMokIAwfdderOBx8Zp+C2B7cXMsIFeZZg8XdLlxpq
	d9ffywuuLyqNTqKbcD1Nv9h1jKcvHK3VUZyOx/0HB6otWTRO09PlSCbeL9wUKzo9CnFl
	CQKL6hPSflhBkV7TmPtKXCXbyW/naHoksjhzL5DOxnltPo1T7UJCKoJ20IP7WtRmtsls
	0k1HndkVVVYdJhTMlRMhzkH14XKTOl3ysNSZxEjlpQIVbavjYtvnNhassoyN4SQJJPic
	RyJq+It4ZCJiBLLiNQXzUR8yPNCIn4qZ3DBQRGrJMtB596rA2n0prZGw0m4+3YH04Blj
	l+rg==
X-Gm-Message-State: AOUpUlEXiAAFZg8JyKGJt3ifcDb6g2a7FTNkm2yPScxoIyy2UcyYVUrq
	2E/FzmI5xQvSifjREOITShltSQO5JqE7K94zo5sKVA==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr2248121oia.164.1531403035642; 
	Thu, 12 Jul 2018 06:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 06:43:35
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-16-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-16-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 14:43:35 +0100
Message-ID: <CAFEAcA8H5Gx3C2Zx=AtyjY-FHZOtBceGmpHiJqCFiNi802oD4A@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 15/20] intc/arm_gic: Implement the virtual
 interface registers
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LocliY7BQhTU

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement the read and write functions for the virtual interface of the
> virtualization extensions in the GICv2.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 161 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(I was going to ask for tracepoints and a call to gic_update_virt()
but I see they are in later patches.)

thanks
-- PMM
