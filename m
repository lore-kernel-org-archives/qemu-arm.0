Received: by 10.28.71.27 with SMTP id u27csp2319235wma;
        Thu, 22 Feb 2018 11:13:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224GBQ86xzU9lrvzlKzVrlhj273QYMyq6yU4Aag+oNm4ZCG5FfG95NJTAWxn9b5iAqVF48FQ
X-Received: by 10.13.208.197 with SMTP id s188mr5554522ywd.217.1519326791909;
        Thu, 22 Feb 2018 11:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519326791; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjigzsxTKa9EuLirOLkFVi8T7DU+1326FkOuLztfRZcs5OxCy2e2va8sZKUkqJFSiE
         VAI5W6vioJe9+HMoftZCnb+8G3EFAfmVshiYMM0Ifvm0Wzr3E6+D7W2iwB2Ga/WgOMwX
         pJ5k23PE34bUiyUhKSLFH1COeDp5lVCmFz0Qfx6Vx5ZrsicQJc6/TKxZeD78a/3HP2WC
         wqjPzVa81AGh18AS/rksfLTW5r2eOrB2XO6+hEMRk2sc+pWtiRiQAPNWbkmeK+v9qpOv
         Pe0+rOidlIuEoGyQyBJ1smDo8GewxqlnH34D84N0K167JMwF4JVQlVvK67aNmtSfl5ln
         3pQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hDRdlMm04drG9Xo4n2ovJZBAkKTpFalHiUl34pyrTlo=;
        b=XA3C8VnX+j+rkL//aPOhVfgYYB6ZAfdre50yN0Hbh64Cb+kmUcDo+x6IwANLAeS6NO
         /+hi2r0+iVNn+cBU7zdjM7ajSD+FrISyoCE50GaXw9WtpxaCRznhd2aCmZMhbdXjvekp
         go0Hw68Y4zlGFfUToFpmRcYh7MjsrSk1EY9L54rQSx561Z4dtpUDRBC7VDtELN1tlXcJ
         kQHAQPWofCLPahxDr6bnzms+9IXMfP85GbcOcP3Z56Ik24LnF24FViuRuFNhI66MS2+O
         h41l8wlzgarsa33EF++yBe0YERIHIqrPdqs0RI7l5kQXRZIeb+ClqIMNXbhVLClAemfZ
         7QMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BabW02cH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f126-v6si114824ybc.654.2018.02.22.11.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:13:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BabW02cH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eowIo-0002Bs-Ei
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:13:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eowHr-0001sz-Ug
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eowHq-0007HM-JU
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:12:11 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:37682)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eowHq-0007Gp-FL
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:12:10 -0500
Received: by mail-ot0-x22f.google.com with SMTP id e64so5607185ote.4
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hDRdlMm04drG9Xo4n2ovJZBAkKTpFalHiUl34pyrTlo=;
	b=BabW02cHGTctw8O8BfGn7x+XXKvAfOo0mAO1NrS+6yj42dD/tI9lDL6BYGMU5BCO4P
	r5A8GNGRzhQ1zZ3kmT2/FqqRraXll4LKFmenEU6UPI0uWbuOkH80U6giFRdvK68XB0BY
	ykUH1Uu/UZB2NrotNEQrV4RGiYdu1BStqxkeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hDRdlMm04drG9Xo4n2ovJZBAkKTpFalHiUl34pyrTlo=;
	b=aD20WIeaQG0qq4IiP01HY5y0S1qdJThQh2EJcEER6a0lej4v18AHDXaPN721e3yTtg
	hElDbcM8jUc532Z3GKGaLFD10HTiDvKCsWV+ck7RERq0L03QoC0zsFgbd64kI9ctktNy
	wsY8pZWDucIPYHlU++RalqFkJBt0GcAtM5hBZ6Oej44hPYC+RYGmjC7PZcUMK3d0UEs2
	2wNTYmcm/jveOBJYf3qDkFYwuPMw3lUHjutOSHlwYUDG0t+6VAOUen8rQqG558JX4aMN
	4OQLuoVq36u7rzdpRicZt3zSbaJDwNo3EwwVfQof0x+5cZWURwUDWbAk3fcRiDRTKNrO
	0F5Q==
X-Gm-Message-State: APf1xPBW7RQ/iuxzLU54dbaNOEA0/mvi+krMg0lVRADyAJePO9DZB9Ff
	lg/LMBxnTzdtnFel99tv80BaEltcaj/X3bnwuccWW7S1
X-Received: by 10.157.7.227 with SMTP id 90mr5648409oto.126.1519326729732;
	Thu, 22 Feb 2018 11:12:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 11:11:49 -0800 (PST)
In-Reply-To: <151932620203.726.14470172414364772802@bdbb90650ae5>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<151932620203.726.14470172414364772802@bdbb90650ae5>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 19:11:49 +0000
Message-ID: <CAFEAcA90bTkHb+AF2W7Jv3GMENo0Ni3rK6GnzNVtk+RF89VuCg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-devel] [PATCH 00/19] Add Cortex-M33 and mps2-an505 board
 model
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7kM5cMD0eG8u

On 22 February 2018 at 19:03,  <no-reply@patchew.org> wrote:

> WARNING: line over 80 characters
> #530: FILE: include/hw/misc/iotkit-secctl.h:14:
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html

> WARNING: line over 80 characters
> #660: FILE: include/hw/arm/iotkit.h:13:
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html

> ERROR: line over 90 characters
> #54: FILE: hw/arm/mps2-tz.c:21:
> + * https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/mps2
>
> ERROR: line over 90 characters
> #57: FILE: hw/arm/mps2-tz.c:24:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.100112_0200_06_en/versatile_express_cortex_m_prototyping_systems_v2m_mps2_and_v2m_mps2plus_technical_reference_100112_0200_06_en.pdf
>
> WARNING: line over 80 characters
> #63: FILE: hw/arm/mps2-tz.c:30:
> + *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html

Does anybody better with perl and more familiar with checkpatch's
internals feel like tweaking it to suppress the over-long-line
complaint for URLs ?

thanks
-- PMM
