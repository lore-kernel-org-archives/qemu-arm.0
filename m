Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2200567wro;
        Fri, 2 Nov 2018 07:46:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fSF45pup8y1anAFp2Kesa8ZkNunIvw1zCZIpORfPNPLMNG8S6MB+xiZHejOXolIwWrg90z
X-Received: by 2002:ac8:1207:: with SMTP id x7-v6mr11094366qti.317.1541170017909;
        Fri, 02 Nov 2018 07:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170017; cv=none;
        d=google.com; s=arc-20160816;
        b=kxDMdcq67rfL8LvAZeOWNQUQhirp1kz7KM4tNGrkjq4OyVIMZZBoQUirm42IsL8IMh
         O9tHO+lg8uG7NZl5qn/ovJ0qp/qNrW40ECnBsCTPMs85p7X3U3uOCRKDTo+ZCUBU7amr
         cKgnfHjF/Yidm6ET8I3vDl81CWkMRj44kTjBi6yFRtAfc7m8140CvaAT4T4ajCgC/BBJ
         A1hy9KfmYed1+h+zhm9H1mvFj0RVaK4cUl62N9NPphc9WZpDwubiwhpY0wkMrMg6Qs5j
         Az6btAKA0zG6cZR+ElNGSpxhj1n/P+vg2TO31qPVxmDiDxJCyFV1x3iDCMaw1VVF2AcS
         NeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=e9PBeLt4S7lHWom4cJqedhAMkMxe+GG3PFCOn/WTEm8=;
        b=upTirjuCoKkegz5lsSk+//ghYtQ7J+0aF7LastiMQD6TsE5DlrkFPrmJbo5FN28ZSI
         wJirCRrfP9W4Du/taMmPpp9x7STk9QSkTwQuYbvSjsnnp6k2jMh4enOAsxMtfsOidVxN
         /C4x0gnwl9HPy6Iqen3EMEOy+sD+1TZ3qJr92y31L+la5NIkMIZ0ABqO3oWyHWiqhrOd
         p1XliYZQVmFnALOWjCSh+o1swQevcjiJA7kZ9X7t/29bAddoLZFC4GvA7riw0cVmj5Jj
         hkddQ1WnJqcIAGefpx+/E18GLM5i6xKV6ZWj77AXLk0Jlvm5HjIrZLVbrsjOWEyxbVIF
         RW9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LG1sx5TK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8si869292qvp.40.2018.11.02.07.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LG1sx5TK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIaiv-0004Vw-EE
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:46:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIaik-0004Vn-Jo
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIaij-0008F6-P4
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:46:46 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIaif-0008AH-VX
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:46:43 -0400
Received: by mail-oi1-x243.google.com with SMTP id k19-v6so1752878oic.11
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e9PBeLt4S7lHWom4cJqedhAMkMxe+GG3PFCOn/WTEm8=;
	b=LG1sx5TK9WpOQlBmrlDwO/I/gGUj6amKLAeagE5DeXgZKmqYLGNauQvQ/ZY+brvjhP
	0k0jkMNiL9Fu5RfX4GyzHyiqNV3OiSD/vw6Dilid3Cx4tE/4xaQdoWQL574Ggmp3TIi8
	IGXrF5aA05W7ybDuw2yU5cI+zKRsPRdXlaiUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e9PBeLt4S7lHWom4cJqedhAMkMxe+GG3PFCOn/WTEm8=;
	b=ZDz6LSV+uXQ+qrlFeVzfOuJdVpin1Z21qHPM3dzomaN4U4B4h7Uc3Vy0jYfsz8g7mX
	Yd8P65wfBmSKNsXW7AtrO/ChrPt/SXfj3Mwos4nEMh251d5e9H5BMsN58OX/j5ipKlxh
	Tfd/JFXe2nNmSmzRRv+B1p8DLFTKgp2mWg+9dWluyS5foWWRjC9IpdigikOderhgXfDU
	ws2MttY7SELmdkl5aAgg7FCyA7EL4cG0vhTVbvSM89070lfGVYpM3JKCQisKfPP+kmO3
	zPMtYZurBuvIvwdwcim5ZgJY41YXGi8GfJyrD9yjJ1b/p9fpxBsS1ddPyVrB6CDHJljH
	UL+A==
X-Gm-Message-State: AGRZ1gK3JHVRywLMUX2StVi8iHmcH7V2RBuIYi78w11PjaHhYXOHJNFl
	QD4+oa518HKpYblsJA3A+Nks8eDBeyRd48AXoBd5SQ==
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr6514177oif.48.1541169989658;
	Fri, 02 Nov 2018 07:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 2 Nov 2018 07:46:09 -0700 (PDT)
In-Reply-To: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
References: <20181102131913.1535-1-edgar.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Nov 2018 14:46:09 +0000
Message-ID: <CAFEAcA_S0VSaPz=T4bvP=gVNh4Mw_jQ92C1n4zeovkD_KMMCJw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v5 0/2] arm: Add first models of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ssgzD4lM8CkZ

On 2 November 2018 at 13:19, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> This patch series adds initial support for Xilinx's Versal SoC.
> Xilinx is introducing Versal, an adaptive compute acceleration platform
> (ACAP), built on 7nm FinFET process technology. Versal ACAPs combine Scalar
> Processing Engines, Adaptable Hardware Engines, and Intelligent Engines with
> leading-edge memory and interfacing technologies to deliver powerful
> heterogeneous acceleration for any application. The Versal AI Core series has
> five devices, offering 128 to 400 AI Engines. The series includes dual-core Arm
> Cortex-A72 application processors, dual-core Arm Cortex-R5 real-time
> processors, 256KB of on-chip memory with ECC, more than 1,900 DSP engines
> optimized for high-precision floating point with low latency.
>
> More info can be found here:
> https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html
>
>



Applied to target-arm.next, thanks.

-- PMM
