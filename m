Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4080299wrt;
        Fri, 19 Oct 2018 09:47:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61HpTPZBo0buUYiJkvao4eE5p8fG8Cff7coOlY7NGqoubw0hWNaPaZtuRJDMxueg4htKOkW
X-Received: by 2002:a37:8d83:: with SMTP id p125-v6mr33496701qkd.97.1539967656457;
        Fri, 19 Oct 2018 09:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539967656; cv=none;
        d=google.com; s=arc-20160816;
        b=YXD7nAhsXq5HQWTZOYGVjmHd468SN20+oBir3M+JcNeXdD33vRssRBU0D0UrIG6nMe
         wndh6i+w3AJlADvM+pTOR2Mf2WRFEds141zHluuy4WQx3d8bkxYyOyxmpIDqMuGxUq1e
         P50hiBBleLFkwWyJe6XlzCmq5iMSrPp53gJDOW2IZG08KM83zkTHmBec8HpQQkjuLz86
         ZQ7tasv65L9/KlpEC+CIL+AKjbUBCvGUSSRoxibOOp9Fwso7gGzcvFB8NbC2myjP81Gl
         +/P9wFI+1dcUQ/ThmmL8QSd7CjftPIBstu1uJ1HZBRbpvGxGfXNehSPTLRpeZX4cvU7K
         Fnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=p5pfX9fEKdqmd5jAG0qSA9y9IOugrUkwmxBUiUkOrzs=;
        b=iOO9TlQ33Dmv4aNP/mEt8tpiYGH79+fmXPP7Nvj1NQKGvMnQS8tiNzGDRkfIhlbsyP
         no4RthtUcT/a9ZE/h+P3Gl06GwVJu+4+HZC6xvmyNkl8BzpaqLNIRYVxlXBKYFg2o5wV
         hnkR8zUHMbr7f/plIvAIa1abenIJq6fhVv66021gaRq2OA04H5yqs0eTNGDzB0YNTvWv
         MQsFTGP3mpmODV+sAIdt2D3xTnLVNNtAKKU8s3zporAq8IeAS5eClj33dUQBgqUzHaCU
         TU9ZMK4HMIPE3VSE8Y2GJ+2U3AVF6ZgAfHrAeedsb3fAngUmH8d4lrroxsYHejd2x+Qk
         TD6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jkd4RDKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k37-v6si1634173qta.193.2018.10.19.09.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jkd4RDKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDXvz-0001BY-VM
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDXnI-0008EI-QT
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDXnG-00049i-O2
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:38:36 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDXnG-00047I-H9
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 12:38:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id o21so33765356otb.13
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=p5pfX9fEKdqmd5jAG0qSA9y9IOugrUkwmxBUiUkOrzs=;
	b=Jkd4RDKUUfw1YDoQrKLnHfEi3I5hRYO9uhQT2jEWxKKibfM8LoNI22Dh7I7S1zdud0
	RgcBnm/ti4FJMB2IA/lBAGw+BFjhWZrdR8XXbbAAIf69skj8b2H67nOs3lIDNzKMbMRc
	04gsOQ8Ny6DF5/ha9tk6kjYj288SE1F1i2WW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=p5pfX9fEKdqmd5jAG0qSA9y9IOugrUkwmxBUiUkOrzs=;
	b=G898HK1d144UGNNvqM+HWUKtmrpBmgoHxrdO2kaSQlJlXFpEoWCq5SDnW1Tl6HhRxg
	KMQjTlIxMTlDN+RwV0+gbP1wOJE8p6lkhdgBps8IdljXQHj6maDyjD3vKboudnnRTFfN
	H4m1BHiu0HgfL0iG1QaB5WnYX64aBpGF4AZ9YC3i+Gntr+5U4+vNBSXOy7gLCASqibNc
	h1SOs2yIHRgo+izT9Q0H+NjA93d3Q9BWWemhSGtJjaG20WkDhOz+V3Beoumlp9jN4w3W
	nflzsOV1imBg+dobLzrkdVm/hgfHC8xfHKlaLfa2MT8saVk2utkYcjvyE2ClrO/Eazju
	pOQw==
X-Gm-Message-State: ABuFfogHFWT03/U+jy0mXDWfPWM3gVrePsYXkFQTKsv90qB8kVeF2ck6
	05KkCA+4X1z3p8LHnQRrO2irWxKn6Xurh+ZAw8YdQg==
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr15660058otl.151.1539967110681;
	Fri, 19 Oct 2018 09:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 09:38:10
	-0700 (PDT)
In-Reply-To: <6ea8c64f-272f-6645-8a2f-b94117a24027@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-6-git-send-email-thuth@redhat.com>
	<CAFEAcA_NkdZtbM9n4633_hSr38eb9FJsi92=+Eeuky+U=eDtZA@mail.gmail.com>
	<6ea8c64f-272f-6645-8a2f-b94117a24027@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 17:38:10 +0100
Message-ID: <CAFEAcA9DM0sEpyH=GGoJLt-p8ZYxYEs2u8KDm+AjH23nqjo3WQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] configs: Add a
 CONFIG_SMC37C669 switch for the "smc37c669-superio" device
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yn2q3WiZKY+u

On 19 October 2018 at 17:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> On 19/10/2018 16:46, Peter Maydell wrote:
>> Should isa-superio.o also go in its own config flag?
>
> It could be, but pc87312/smc37c669/vt82c686 inherit of TYPE_ISA_SUPERIO
> so would require something like:
>
> common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_PC87312)) \
>             +=3D pc87312.o
> common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_VT82C686)) \
>             +=3D vt82c686.o
> common-obj-$(call land,$(CONFIG_ISA_SUPERIO),$(CONFIG_SMC37C669)) \
>             +=3D smc37c669-superio.o

This is where it would be nice to be able to say
"CONFIG_FOO requires CONFIG_BAR", indeed.

thanks
-- PMM
