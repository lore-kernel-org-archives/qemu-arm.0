Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7138989wrt;
        Mon, 3 Dec 2018 10:50:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VdMzag9JpsXJz7BSuF6k1CdQIhe2cTEbUiqjrA2pQ6dRlKTUAD0X+y+1mrEk/oBQPdnXFU
X-Received: by 2002:a37:9543:: with SMTP id x64mr16031841qkd.158.1543863030366;
        Mon, 03 Dec 2018 10:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543863030; cv=none;
        d=google.com; s=arc-20160816;
        b=AFOH7LdFWd3P/BlDEDEV3uZhlLmJFPB4l6eil7T7asBLiopiy0X772O13sngVELnei
         +BrD4ZGbUR3ZIjN4D5pH6pgopDe15nKPsVSE/xvwSdMR9Exce3/h93OvfphqHCYwSKRu
         oQgWtIoeg8PMoUyovM8xijsA9SucbH6w9s6uee4VJY9Z3SFaWSSWKeciSN1733EGbp2a
         zjcovo1AnAGNhxfTQPwBTqw9PNtXcPWQdIww25trcpgCoEnsqpX70FPCCTteTEP0ms6m
         muKG9tPNaAR7ZnVlLM81xNJOsAvBgrpyvK2PiijDTmoKVkGpv6RTdb/29Sb1AaULLgUW
         6JKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJGd/gidGQAKnFbQ5FRsSNNhQX0V7HY3XljdzepZoqw=;
        b=uOdCv1NvKnUn//MCNRzAM60XNE4+B6Tbys2fcWTBTE55kMpQS5q5f1t9qfrUWJv9G6
         xooKAvVYbRBvPAkBI8+WjjQHUD7Yee83kZphkEyqez3NCH82nlEwmH7ukuFTnUO3yJ7S
         ZHI/Snz6q5Kgx5rRV7DEs/O0Xlr39r67ydE4VZWrOfYtzVb+4CT28T73oUwPEZ1y1Z3T
         Yncy7OMmEi2hmrHpfP9dQnQQurG/TNQpa66wcUw2yMLEQrJMzAWD+czhQe8ssGD7M70J
         UqnlDhOdgE9XCmUJw/X+q6IL330TxTlJMbn3scHOzyg8poFmayY8aUe3SBnvBPDKG3fh
         sq5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gsbTRH/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l82si5312qki.89.2018.12.03.10.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 10:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gsbTRH/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTtIb-0007gn-UL
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 13:50:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTtIN-0007fw-Vb
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTtIN-0005GG-1O
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:50:15 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gTtIM-0005Ft-Sh
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:50:14 -0500
Received: by mail-oi1-x244.google.com with SMTP id h25so11926837oig.1
	for <qemu-arm@nongnu.org>; Mon, 03 Dec 2018 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IJGd/gidGQAKnFbQ5FRsSNNhQX0V7HY3XljdzepZoqw=;
	b=gsbTRH/xOUlVXYE89UUerLhRHrUi+3oxHq8mTg+kO3+l+l+6cpdGejWLnsyC5G+N5o
	iROXoFABGsRje2/DEZrxpf3sWXDQx8BOCtcJU6yQakJXIOQghCp3o8K4uw2U3Jy3vOhn
	1NQu7FvgKdViqd/QSVNzvwa88PJAz7y7duG/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IJGd/gidGQAKnFbQ5FRsSNNhQX0V7HY3XljdzepZoqw=;
	b=habQXRFGhnaByYuAEdJ4w3stWUd3thDGMiVoUjEQWnmr/tr0Ej8bLufIJYQi4euh3e
	4lhp7UvUUFt3bP0a0Tk/3igw6s1nxdz+/0H/EwGLzbH+O3/VRX7eHx7iaRV6pTlGwi9h
	BAhj1546rcZ0ADPCvpYyXg/CFq8LP6P05Cb23fz5LARsO6q0w/Iv7eJunwloGH7IWntp
	aqOhI3up8Y+2tp9tcUEUZ2Jr4Am1nN7qTkveKpNyPDWFIv0dp3FwudMe9YNSHjBI8rbm
	AeuOcTXT7PsPgK49CzWJeYm8wv11XbfFXnE+CuDWCMd0qRMjSNnydeUZKVsl9in9pIEN
	LM2Q==
X-Gm-Message-State: AA+aEWY2cyoRnVvHis0pcIJUZDM8swLkO737RUp7VdYEmHfGBExwwRMn
	q9NnSHMeoGzIxckE+Uyk00qQhnyv55fx/jC0lmDo/A==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr10088313oib.146.1543863014338; 
	Mon, 03 Dec 2018 10:50:14 -0800 (PST)
MIME-Version: 1.0
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Dec 2018 18:50:03 +0000
Message-ID: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wF0/Xxz54z+o

On Mon, 3 Dec 2018 at 11:04, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> The first patches are simple cleanups:
>      - patch 1 move the pvpanic device with the 'ocmmon objects' so we compile
>                it once for the x86/arm/aarch64 archs,
>      - patch 2 simply renames ISA fields/definitions to generic ones.
>
>      Then instead of add/use the MMIO pvpanic device in the virt machine in an
>      unique patch, I split it in two distinct patches:
>      - patch 3 uses Peng Hao's work, but add the MMIO interface to the existing
>         device (no logical change).
>      - patch 4 is Peng Hao's work in the virt machine (no logical change).
>      - patch 5 add pvpanic device in acpi table in virt machine
>      v2 from Peng Hao is:
>      https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html

I would still prefer to see a more detailed examination of whether
we can do this with a PCI device before we commit to taking the
MMIO version into the virt board.

thanks
-- PMM
