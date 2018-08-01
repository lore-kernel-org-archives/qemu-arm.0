Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp565377wru;
        Wed, 1 Aug 2018 03:15:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdb+0gRqmYMHovXASjjrscfexle44wVxd5d5ipdvZZWf3t7l1cI/66e25v//FVrjNPK7atM
X-Received: by 2002:a37:12d2:: with SMTP id 79-v6mr23285400qks.299.1533118526866;
        Wed, 01 Aug 2018 03:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533118526; cv=none;
        d=google.com; s=arc-20160816;
        b=Cs5sqSvdYzb7y78uBrwQ/vpJCAB2SoyPZX8Ys36v4kWkgE7XEQSDJx5dg9WWbzZhDC
         9FqQk1pyrMZ7bMfPEIRYTPkfItrZ7x/A+1LpSdiUT6hnxF6pxvPLl+0zZwDCAlVwTs58
         2/MFvnlNj0duR4PwBXTR5RrvJmIJ5O1CEIOTm8RBQnK8MMY+ZUpX+p7gj/G9QqyWFc3/
         EZZ+RwyaCzBalwLARe+Jl64ow+cOMtE/JI+p51HXeY2SJ0Sp/2qCeTP2TMQXcOZgEn3N
         AGhLalJmnbmO0CQvZC/2kCIVdfD0tYq5aGsBd+/yn58kDSHSzn576Cy05SEGLrCiR53/
         tUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ms+htvmVMY14lJAVZhGLmYqetFYr3FOmE68CQ38ybe0=;
        b=hbKFzbaAjVVAyPId7rdFZSzbGAO5y10xemZQsRONyz+uQePTO/APFMXx3WQJ3aUXO1
         Z2Ry4XxiMOvqAsNrSyaDxNcbawzlQO6vZFIDPZRXqgtFy//Wnq6O/JVHeK0U+WDSI6Op
         s8hmgPjNlDoNEKbXCyrCQTYxjL+AQPfpEbSvmpOP41m06msS9zXMFnMObLgOIhVRcRUa
         Xjctl3+UeESOi6qGrTXxY+I6x2VPKAs9FBLHqO2bTgjox7QfN3TjgE0Hfhw0T+nkKM8i
         k7ZCz/XhjUx/1jsfF2tYdJ4NrMnHgFqzA/GPL+Jn9s17xfc9k5SLvCxtQMj5LDI3Ua0C
         gOMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ts1F/N4B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t124-v6si7308991qkd.121.2018.08.01.03.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 03:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ts1F/N4B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkoAA-0006T1-Cu
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 06:15:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fko9y-0006PN-Pv
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fko9y-0000pe-4l
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:15:14 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fko9x-0000pF-Vf
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:15:14 -0400
Received: by mail-oi0-x244.google.com with SMTP id n21-v6so33593032oig.3
	for <qemu-arm@nongnu.org>; Wed, 01 Aug 2018 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ms+htvmVMY14lJAVZhGLmYqetFYr3FOmE68CQ38ybe0=;
	b=Ts1F/N4B71qlOBpSzpAZV+dPyQ4Shj01QO0/69px6eo99qiwuQqKhDOqk/RloIrwPj
	iegyr4siHVqmHqcemFDrIpfMj2dMivXUIY2NJ92fpAq76v8JHK6WzPs2sR1bmKfrktTs
	l38JW5tAOxKcH+FzMgcSenWGUXGShWKfCdLZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ms+htvmVMY14lJAVZhGLmYqetFYr3FOmE68CQ38ybe0=;
	b=qygUh/tZa60KWh8Sc0oCOf88HAMl3Vy/eJM9GwuoMaDwvFv5OJoGjYU/TB5QbVmIJZ
	pw1LHe45BME+14HYJv/+vrBCXfkG9NFfIXX7WDGvQWuXKGFTgo2YFSpM8n0KkcLz/f7s
	F6Hfp54Lqv24AFrJWKlzd/0UuAEjYGAHbO7rO/L21WiCXiPlG+gsW57VnCOPOWulTf1f
	VeOzJW9QyF8L8gdDimml0o+6Il497tiCQ3KWqT74BrBtN1snzQldwJSvtWfswMvDBG+3
	cgbndkrFpyr1T53kvuxIBjdDv1dQX0pCNC8NdLkXfMVyeBYTmKUI2Ns9sSTI/vpFM+fr
	jJwA==
X-Gm-Message-State: AOUpUlEYnzpKDn+NNwP96Sifpl9IH1SGv47V336opkbMktTiRxwBiwDz
	GcLNYSVYOYywdpcfro18QdHODzadE/n40KFQwtgwzw==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr2565612oia.11.1533118513449; 
	Wed, 01 Aug 2018 03:15:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 03:14:53 -0700 (PDT)
In-Reply-To: <4beb699e-8e9b-0a3e-01a6-891033ebc7a5@huawei.com>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
	<4beb699e-8e9b-0a3e-01a6-891033ebc7a5@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Aug 2018 11:14:53 +0100
Message-ID: <CAFEAcA8cQQNXcO3FmqGR=txEFxZe8n4+qhdbVR7rvQkuS1_L4A@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v6 0/3] add support for VCPU event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jY+NuRSmmMbl

On 1 August 2018 at 11:05, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi Peter,
>    sorry to disturb you, any comments for this series patch? thanks you in advance.

It is on my to-review list, but I'm afraid I have not yet
got to it.

thanks
-- PMM
