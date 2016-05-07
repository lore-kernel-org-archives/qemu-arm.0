Received: by 10.25.208.137 with SMTP id h131csp559423lfg;
        Fri, 6 May 2016 18:51:34 -0700 (PDT)
X-Received: by 10.140.229.69 with SMTP id z66mr23952008qhb.48.1462585894805;
        Fri, 06 May 2016 18:51:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d193si11436529qkc.27.2016.05.06.18.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 18:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayrP4-0005iQ-C3
	for alex.bennee@linaro.org; Fri, 06 May 2016 21:51:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ayrP1-0005cm-5l
	for qemu-arm@nongnu.org; Fri, 06 May 2016 21:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ayrP0-0002M0-0Y
	for qemu-arm@nongnu.org; Fri, 06 May 2016 21:51:30 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:37366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1ayrOu-0002La-5P; Fri, 06 May 2016 21:51:24 -0400
Received: by mail-wm0-x231.google.com with SMTP id a17so102393784wme.0;
	Fri, 06 May 2016 18:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=69V7btfMFnU/L4wSnrmqgzsy1SdInGRLqhb6wxrMJXk=;
	b=mKm+eUavJcrIgCslzXX0c+JyNU6i7gPEoaudBzeECKECKQer4QfGXjXaS8dJKFPLVf
	t0btWk7+xNKZHzlydxDY6tHs+QpW3eNb8IR7l2hB8iz7tQ/iVQ2HzuxM6mM966bh+93L
	eHj0MnPeAg/EWe3d1eZSJ8Mm8OkApIRe8EH2L4bL50Useje2Y1LA9xL7W+nSxSpu5o64
	sJQKCmW2dNQMqMVTUIMlUue4/YLMsX0cQf1VnG9uuAad69sAazybt35tRYRdAtx445zZ
	Ad2vSKx9+/+O3rPwHxj0NXc2ZYEIO4CLxRyd78XzJLxgV0Wm+SxMOgh6/8M5TNkEGhMe
	V8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=69V7btfMFnU/L4wSnrmqgzsy1SdInGRLqhb6wxrMJXk=;
	b=O+H15fGIu5gyY4RStnIjQu3VJyrpQ4zcJetQDVt3XcUJmWQYRQLSsHj9AcWZyllekL
	RLPjQ1Uw4KsdKWun2sY1NoaqImt7ZVXk0RhyBCqF+JJcS8EJSPmqSsY3lCXUpuNA+hGf
	rBXZJBTAN/n8y706rkAmfjZeSiDB6RlFXDMRzXFyxjGrF8JTpJDvK+fwu22Fs9NaHWHJ
	8xwhS+YpTazrpnOc+dXYdCHLOvOqEU7XMtesp2NL/dZ+u9E8ohawQpRTkKCD7oLgiVBa
	+uLaulbPctqZWydHB1IDX6SeaTXpwXD3wrbu2+2V16m3xjZvOqtMAFgZKY3xuopf9nZr
	kUAQ==
X-Gm-Message-State: AOPr4FW7H1n2/9NWHZarzi4AtEWab1kZZfF8W50GR25qjpkXUrsCiTrTrb3jhG/6TyFvPQ==
X-Received: by 10.28.21.75 with SMTP id 72mr167584wmv.64.1462585883311;
	Fri, 06 May 2016 18:51:23 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	r123sm11117811wmg.20.2016.05.06.18.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 18:51:22 -0700 (PDT)
Date: Sat, 7 May 2016 03:51:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160507015121.GF16305@toto>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v1 2/2] target-arm: Enable EL2 for the A53s
 and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7TIYM/wurUY+

On Fri, May 06, 2016 at 11:25:52PM +0100, Peter Maydell wrote:
> On 6 May 2016 at 19:11, Alistair Francis <alistair.francis@xilinx.com> wrote:
> > Enable EL2 by default for the A53s and A57s.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> 
> I don't really want to do this until we actually have
> something approaching a workable EL2 implementation
> (ideally including support in the GIC, since EL2's
> not much good without it). I'd hope that software ought
> to be able to work with an "EL3, but no EL2" CPU, since
> that's a valid combination, unless it's very strongly
> tied to a particular h/w implementation.

Yes, I agree, we've got a few more things to take care of.

Cheers,
Edgar
