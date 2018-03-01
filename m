Received: by 10.28.91.67 with SMTP id p64csp1836278wmb;
        Thu, 1 Mar 2018 05:34:08 -0800 (PST)
X-Google-Smtp-Source: AG47ELvoChkqcVYeLaQSRQTRzG/oUQp4jyYHE4fcJOVega2eDkZtYl5RZ+8fEtHY6KqJHaHDllNV
X-Received: by 2002:a25:dbc9:: with SMTP id g192-v6mr1054778ybf.195.1519911248183;
        Thu, 01 Mar 2018 05:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911248; cv=none;
        d=google.com; s=arc-20160816;
        b=C/yApMXFfuzInKSTGkVRDZtyAFJMDgmXngm+iXTxnBJrYoVRyEY2w+DADzbFzv+MjR
         22FpwTzICaJF7WEo2WgxuTgHEEaKhG3jCz+XW9fa+7QFhbUdtgZvjmIk+xbE4/iwRiYF
         Km7w20dnphur/p/7jIgEkfXA5rbmTgL0zszWFqz8kALeyef9p0vnYjLwVSdaSe3GnFGW
         /X8K8UYRef0e+YneCSgG5yTHQT8Y9vAAd/uHwOiLIn1uccB0LUcx6Y00fa+zgvB+GijG
         wyObpo0Xu9WC+cIM1o8BS/nJOt4vRCgbeFMehbr4IQHn0RjAjqOYmbLAe0j9cfDbax7i
         +qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pCFQx+Gj8U1gM3P3xZdeT+sbeuQMaP0s7hBo9knJHbc=;
        b=DMq1DOeRoV6K/knd64Irisn/np5lVAo3YgIAfP5Ugozxe9SA+x/iJkMmsplZs3JTPm
         AEI8rCDy8h0wvEyhry/xkqXALf4S5TVxfNaMIsfz4ycD+kzYBeBQRvkGXE3kLM6al5FQ
         1mi4Kvt+ridELGeh4ylz2gZGQs/Liq47tzP8k8iPtsKZUPUV4XnzBjXgEEqZQB3HBzyx
         /ESGqkF6cG5NJ1VDVyJCgI2wn7RmgtDedzLI2tah1EWBezg9iql5IGIvecem0pmWAbDH
         x58A+ga5PeES8i7VsUD6/GyHg6yaxCNgmtu0ABLPueOo3Q1hdNBlQ8zWT0kyFJKqQKGW
         QoMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cORQ6F8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h27-v6si645931ybj.717.2018.03.01.05.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cORQ6F8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOLX-0007qc-Fe
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:34:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO7H-0002D7-47
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:19:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO7G-0000uy-BJ
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:19:23 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erO7G-0000ul-50
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:19:22 -0500
Received: by mail-oi0-x244.google.com with SMTP id f186so4426436oig.4
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 05:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pCFQx+Gj8U1gM3P3xZdeT+sbeuQMaP0s7hBo9knJHbc=;
	b=cORQ6F8atHvPxNLSxXsIbVeq+TGd0o/wsALoit8AffCpDKSwvmbf75ytP216n+L0E1
	Pku7E/x+ngqZOxT+dAi2f8zGvuDLINTKthd/E7DC570SkvADO2GyrFczdral//YOjH5t
	VzZ46TsvfjFBA+cK83e0D8Psb0Lj9xmISiyIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pCFQx+Gj8U1gM3P3xZdeT+sbeuQMaP0s7hBo9knJHbc=;
	b=fgfCSSqm35j2B7xd0wz7ybYFjV3iawFTRSlxzZHq7xesEATgahAwO4fu9JUAYXNKcp
	nIqcJs87LVE8cNxy6jF4o2PGN7szcRpokTDdhgDzzbjgn40D00JCTfkn4+TAM7TR6cIV
	4DcESHHg3ihI0x0Mr0ySV/SW7/9miR+rb+4gpCN8Yy+MFHlukvp5CGTzQVq061Jj/rdv
	ztRypDS7eU8aSmKJv/E3XtFDu4vsT21IfUew3vuU2o3LHjHDNmH+Epq8QPqpI0b9cHb5
	QSH3MEjO0vdlOzQMsYEsjxyx24hIZ6R7zQRe7JcnO/tPGpRghJle8sEwy0R9uPAEQIbY
	OkIg==
X-Gm-Message-State: AElRT7HbilxIeNNVGs7veKe5eg95827GwLC68/WiGLWOsVNGZAlD04DC
	AvHrrd42OJqTCXOx6F4dqQqfByTYVM2hebg31x9TuuSC
X-Received: by 10.202.61.198 with SMTP id k189mr1143053oia.252.1519910361490; 
	Thu, 01 Mar 2018 05:19:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:19:01 -0800 (PST)
In-Reply-To: <20180228193125.20577-4-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:19:01 +0000
Message-ID: <CAFEAcA9rSKMGTtV6c1aCdMZj+5RbSCrXMv7jSgdyhpV44Q0gYg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 03/16] target/arm: Refactor
 disas_simd_indexed size checks
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rxxEMdFa3mXq

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The integer size check was already outside of the opcode switch;
> move the floating-point size check outside as well.  Unify the
> size vs index adjustment between fp and integer paths.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
