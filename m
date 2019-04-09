Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5142033wrx;
        Tue, 9 Apr 2019 12:54:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyF3p7nJ2cn/0kvEbfjcp/H7ezvEDUN7bhAcK+Kg/ADPd6ZGkTxygyEVaUrZZcSub6oGg8L
X-Received: by 2002:adf:ee01:: with SMTP id y1mr25561924wrn.51.1554839688816;
        Tue, 09 Apr 2019 12:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554839688; cv=none;
        d=google.com; s=arc-20160816;
        b=zQAYeEfB5dSraofxG5XtNZyJipkeUT0PB4LPuVgye+HhZkj9QSd7bd2TdW6QRl/zH/
         R2fGUy5jxQAJCgkZn82DsNFp8ALpu5aNusr4D59JUCnXQN0J59juYLiPp5xyu/OHtIrz
         9ja9lZ9+WpzvPeTwwo2IhKKrLvRJryPXznw2OmmV1V5PxAwZ9fQh8uuCDIxPjPCEOqHN
         UtK0oAqiYT1jeyx/eZDQZKTj9bn6mBbuR4yaGE7WwLZuqI6DU+AaU7+Lq/xLliPzsivg
         tyZqSRhtJxJgzMtwXzrW/6GoJPDuOik+OSVJllMJ2YbIGb8IThx/dggQvWRtbc4VvQgo
         03BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkQa98a28VKjTQrGjpPepqcM83CyZTPDKD30JbWI/1Y=;
        b=N+TYkkdNMbzWOdhuHxoJuY0F85opQDtUOSfjgKo0OkmoAerh8wQQ/4UG6Opi72Qglr
         DNJkIiIiDMlYU3VQdoM3eLqNQTALaqhGFd5qsxBy1JOu/aH8g4lVMLmIVmBxzHy+4DJ6
         M+CLM10DqSeaV5lp1xZtknIEioZzd72KIzRbeETiSBS0ksFMeR7ZmXPpxtZrrGjS7T3s
         gvRz8sNLijc6bMW6SZsex7teBhayAEnq1uRsvOzRKJpSLuMoRLmE0rl3atvMueEbV46S
         /hlwdQiBL8i3Qp+1teHMtov8AwIf44td0DbVlrPyLnv5eGG3gbCasN+VVYMmUbbaV8yP
         R9Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="l8c8/VYf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si43574wma.84.2019.04.09.12.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 12:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="l8c8/VYf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDwpT-00064D-V0
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 15:54:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDwpB-00062l-5g
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 15:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDwp7-00045m-RJ
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 15:54:27 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:44926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hDwp4-0003zH-5h
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 15:54:24 -0400
Received: by mail-ot1-x329.google.com with SMTP id d24so16713045otl.11
	for <qemu-arm@nongnu.org>; Tue, 09 Apr 2019 12:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xkQa98a28VKjTQrGjpPepqcM83CyZTPDKD30JbWI/1Y=;
	b=l8c8/VYfMQgQqPIsphW8hwqUPJ99LDAEiJMe9KpNxDIu1EOJLYhbhin1iN3KAA9Kn4
	5qkxbALwgrob+r0z/zPGWDOl0Dqc0vQtG+kZOXbkrpNVfmJJDkJemykkV36E+r3mbb+o
	LXTLx8BAYYxe2XNn7uhOEvkjKBj8I0lW72Top+PWvKf4wvOGJyB/0Pn36Z4BF/k2IFzA
	UvjjdYzxeyXXErO+v+pv2W4sbgvi4GPvlxYYdTPSvn/KJlxIfH2Jo3LbJzlS0/SKaK8s
	cRBbVF9HR9OGPONs90idRoTuMlVVxq8sva6Zt1Ze7dYX6NrUbehj3p1ActveFCwlZCvV
	CoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xkQa98a28VKjTQrGjpPepqcM83CyZTPDKD30JbWI/1Y=;
	b=EIL41GK7Cmv0K1axnsUlvjP9F1kyJu5N0bElMzUF3W9A+RxBIph3ZZAXwzOPFDZoAc
	yYxZzoSm6f876Trs/0sbddeI68qQx57MHUnzUDCnLNzRN4VgRf25xXcC/Vvl7VNvbr9q
	uYbAlXMVWZHDrO+eHM6LsyC2/X4F61knhKl1sDmS4Bd+SyluVJur+kUMmlCJDGHE3fEf
	FA/DsSNlrw5EtaqnmW0YYOskpdzHSVN1xM2lcGRybGVae7YnMeu4KkgLpl2PUWwYe0Im
	hvrfC/f/Oc4smGXWDPk24g3ekLHlV6lsVpgNeM178roUtigOs8Ep8FCj53RGNIEgXUNZ
	cU3Q==
X-Gm-Message-State: APjAAAXVlRmWB7eY62G3lTeknj86iK1KOhOvILfzZ8rzmvWCejwqy1eD
	ViXEweihs+8AQ5gveBEHlUqavHEKhEGsTGNXHtijYQ==
X-Received: by 2002:a05:6830:1497:: with SMTP id
	s23mr21786268otq.236.1554839659594; 
	Tue, 09 Apr 2019 12:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <e61c4a17-910b-0066-92ae-3fabf4a4e3e3@weilnetz.de>
In-Reply-To: <e61c4a17-910b-0066-92ae-3fabf4a4e3e3@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Apr 2019 02:54:11 +0700
Message-ID: <CAFEAcA-djqczK-BG-NBF3116fmmbxS5GPH94NGfDXWQU3dxoww@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::329
Subject: Re: [Qemu-arm] Misaligned memory writes on ARM and other runtime
 errors
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eEkV9jXe2nTu

On Wed, 10 Apr 2019 at 02:12, Stefan Weil <sw@weilnetz.de> wrote:
>
> When QEMU for ARM is compiled with sanitizers
> (--extra-cflags=-fsanitize=address,undefined), I see runtime errors for
> qemu-arm which indicate misaligned memory writes:
>
> /qemu/linux-user/fd-trans.c:1389:18: runtime error: store to misaligned
> address 0x42ff4b34 for type 'uint64_t', which requires 8 byte alignment
>
> The full sanitizer report is available from
> https://qemu.weilnetz.de/doc/sanitizer.txt. Some of the reported runtime
> errors can easily be fixed, for example by replacing "1 << 31"
> (currently 188 matches) by "1U << 31" (currently only 70 matches).

The shift "errors" are not in fact errors -- we compile with -fwrapv
to request a dialect of C where left shift of signed integers is
well-defined and has 2s complement semantics. Some versions
of the clang sanitizers don't correctly handle that flag as meaning
that those shifts should no longer generate sanitizer warnings.
If you're using a clang without that bug fix you can suppress the
warnings by adding "-fno-sanitize=shift-base" to the --extra-cflags
you pass to QEMU's configure.

The misaligned accesses are definitely bugs. The linux-user code
unfortunately has quite a lot of code in its data-structure conversion
code that is pretty fast and loose about accessing fields in
target-layout data structures.

thanks
-- PMM
