Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2875871wru;
        Fri, 20 Jul 2018 08:04:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGtJ0umTSdswsv6epLfghADect4aedc5FAqBl1GMsBLIPxlQ5yAIo66/vOsdKPfLHE8pQP
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr2065219qkm.75.1532099068230;
        Fri, 20 Jul 2018 08:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532099068; cv=none;
        d=google.com; s=arc-20160816;
        b=tdITkr/oo7Hr8CZOHJYgUEBhc4UXBd6W4u+kxF2UwWf8Q+vb3SOS7+4mP/ucYMhv9N
         lofKZP50jEv+ZfYrG4ooMh/SqjVSPuY7T27r/JMuPw0rTXBQcOZIeyEB7mMT9dTXIhP4
         F6oCn43fGpYHhSa8B0kKTFagorkEYG6qce6olA+QZPn87qM12898v2X60dp0zgLMZ9ix
         5V7pr73MrKxVR1qeP4SugK+2Y87PUTW4e/xQBl66yv90tVXdxfY3szHq8gb3BDudE0Qf
         nZea5FgANpiir5QKwkRnpIcvPXUyE4NljJoppiAQSRTbN5kpjpa0gg7kTxunMi07xfGx
         eitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G1xa/BPi6h38Vnc8L/Mabhu9XSx2Auz3jdhwWy85mmY=;
        b=t8mjC+uR+RgGjTc2ozF4Mu1mfpRNzEJRywABo/FTWQ/rgH3URgyq1Z0TWt/Gk8/yoZ
         2D0DVTcXCLffFOn+FkCzevGWAgbqe1V+sCQUAsnvdjDRD2qhSsknKYVJtM9QT5dPKh5Z
         gkKVUcB80tcAuOld/0nNECxFjuugIzCNpa+wmHL1iYhGNRuhVDuIwd5sSVy7TbuJFboM
         rvbqMlBsBH/xCG2hqwrXOMonRCNdgLjlSBA1LCeGCc8U8sTBQCOBB3hONHRRqSkJ3TOJ
         mNHFP9A70ebU5O5dmLxE0FAsW0xeG9Xjue6S6BsH3XVfDM53bJcQjm7zlLP94PHzf9J/
         vwaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fn7IETIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i28-v6si2133739qte.36.2018.07.20.08.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 08:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fn7IETIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWxH-0004zj-Pz
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 11:04:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWww-0004xf-R1
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 11:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWww-0008Uz-1Z
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 11:04:06 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fgWwv-0008Ul-Q7
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 11:04:05 -0400
Received: by mail-oi0-x244.google.com with SMTP id l10-v6so21905200oii.0
	for <qemu-arm@nongnu.org>; Fri, 20 Jul 2018 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G1xa/BPi6h38Vnc8L/Mabhu9XSx2Auz3jdhwWy85mmY=;
	b=fn7IETIl24yppygUY6LoiirqIqpc/+1Dw8tH163nZSqOTTTfc4AunWiTAO37c6Q3X/
	wrzo1qvEA1U93MqNz1GvVtuZtpYWvGRAN3l5sMVMsrYBi/M5b/CIEPYhd2r+7kAarWpr
	LAlAbOcg0HuYWUo7GfNml+MlRJq8Lbwd2jGg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G1xa/BPi6h38Vnc8L/Mabhu9XSx2Auz3jdhwWy85mmY=;
	b=lHvRGkMZJKhcrcCYlCMush+mzPgRtXYJ2yIhbVdY2PbipqduKEnCGY9P98EyJrHU7Z
	NtIDAAD6RTJE9KFcvymhu4RVU8rwJg6tfX5F3qYV7/VVABS7f97yexrvzRMENR2537oH
	2XatlQcfF40a7dEIPBfFKAQs4CxtwuQoENDk29Wt+u6DPv8XZjwEycOqwLJ1zE5Y08YR
	QWSYDGfjopS7HyUhw7NkGSlEfd6myHf+iiHMHDpx1/8TZAqy9b/SjB6rqIyp1sq3K3Cf
	ykuOGN3m6MqUAwNbEZBrk20UnvutIFHjowvYj0JwDPgqnvXXtMLQUTQuWryz5fg1J2ig
	tmmw==
X-Gm-Message-State: AOUpUlHStVeMBIIKQdVlwJwvwEQzlnwmahiwPtv+RPZalHFELQ7+n3sn
	SjhWCnb2d4GHEgFHPJ75t6846vjFrWS/jBQIvUU0eA==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr2603726oie.80.1532099044964; 
	Fri, 20 Jul 2018 08:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 08:03:44
	-0700 (PDT)
In-Reply-To: <1532006134-7701-1-git-send-email-thuth@redhat.com>
References: <1532006134-7701-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jul 2018 16:03:44 +0100
Message-ID: <CAFEAcA9K90g83RDbdf7-nJwkGRShCrg66sx9RniR90r91+Ck8w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/spitz: Move problematic nand_init()
 code to realize function
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4XtpTbHPLeni

On 19 July 2018 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
> nand_init() does not only create the NAND device, it also realizes
> the device with qdev_init_nofail() already. So we must not call
> nand_init() from an instance_init function like sl_nand_init(),
> otherwise we get superfluous NAND devices in the QOM tree after
> introspecting the 'sl-nand' device. So move the nand_init() to the
> realize function of 'sl-nand' instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/spitz.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
