Received: by 10.28.71.27 with SMTP id u27csp2318072wma;
        Thu, 8 Feb 2018 09:15:56 -0800 (PST)
X-Google-Smtp-Source: AH8x227aNQR9ovXWIO+SZ6X99seyy3/8SiXg8ndcr97uKEndE6TAmlH8wn5QKv7hROjHHWUaGHK8
X-Received: by 10.37.4.2 with SMTP id 2mr1019737ybe.397.1518110156165;
        Thu, 08 Feb 2018 09:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518110156; cv=none;
        d=google.com; s=arc-20160816;
        b=X9YOIYGAq3XUGrfSx7PBVkF74ezVcmrpOsSDOddgZCO1b1ueS4Qw1+OA3Wj/ebYhne
         aFkgeoHyzX0Isz0IiSJy8S3x+RnvDmveonmKHVzhQyVTATO4VWMTx5UEiQat/BSYTVXv
         exEf5GPBKp+2BWPZTJU8uTMzgG2y9PFgIPCjkORRYpOWP4PkSUqKdNLalyje9gQq3tc+
         AC5SAWjh5FYXHo1FirZrfK+pe/U7RQcBF3IGC0g0cNwkeiLdSmYOyRH3tzqg/fXb3X48
         ytFF7e0d1wG34WTQcQhztq9XShnVfRDI780GvmZyW8QKCiO8GX4O2PDAkPCEGSAeZlEC
         8byQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OeUMhpm9ElNNpc8eXjyLuahW2PdqtEPW+Yje4ia9Eb0=;
        b=B+br1JMq2oPeIBTUM88zQ3eKjlIqIpyTZ8/mvW5Xakyc8nkjvl1f1OdPaVOb5lPAtr
         O9uMxSJrnLkiOT10LDCVXJ7tj6yuRnL1wH/URBH8/gEpOjdhgaDV+KMaOgaceww9VKT9
         kO81q/NHwLp1ADb2ZRvBqwi7XlTWd/iLMMNSQQ5RdTyla/soEUaJb6Z8vy6SwfFYacBk
         xecv+GVf2I5fKn7EntuqocRN10OIg0BVkNlc/19ord0uoz+G1yj5VJLdSpDVfsfaQkJa
         k8+b+QeYspG4rKWG2PgAgBhiXoJ9ykJ/+c1fcerjyHnYpX8iLK7UV+RLle9ahyclics1
         PQ+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MUmIWD6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12si54567ybh.742.2018.02.08.09.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MUmIWD6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpnf-0005TF-Dq
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:15:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejpOP-0000E9-Dt
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejpOO-0004Rl-Iu
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:49 -0500
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:38130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejpOO-0004RF-FD; Thu, 08 Feb 2018 11:49:48 -0500
Received: by mail-qk0-x22b.google.com with SMTP id w128so6443467qkb.5;
	Thu, 08 Feb 2018 08:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OeUMhpm9ElNNpc8eXjyLuahW2PdqtEPW+Yje4ia9Eb0=;
	b=MUmIWD6rXiPA40shsFTImK1dl4KNdrion7sn+rHP5k2wRD6nsa/vMfSHmar4nrNBCx
	sa05ByOwSO1yaIgEOJF6Tv50XKIYQc2T3SIDamWWZIzffoysozPoe5H0E90T9V9P2o8S
	L8F+eTAwd1c3mDrj0etJpPa16sSP3rg3JTSBApmZaK40bRgnpcal+JOzsmNlYhQWJjsN
	SCcLUwgn5WAatEJkG4YK0xDbFlgjZiln1BJMAGyENbNK3ivtwdBdgF+oGlvwssVcmY+Q
	0R/v34Yns4F2aRspLVtFB1hB00nMHz/hruI/2SqzB917JuxUrcAYk4wdeRXN1xFiOnPb
	3miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OeUMhpm9ElNNpc8eXjyLuahW2PdqtEPW+Yje4ia9Eb0=;
	b=d4Qistg+k4Rq3AydsqpG3/LuYcLQ2yHBE66AhenO1cUsQfotmzE149kZed3BdSwfRS
	P1okZrx+DLtOa6rRB0Y7+9q1MUOC4YJkCoS/eCHXJt/fTfUHzgXo0oog1f1o003vKoBW
	AvB3qpUSYe3DKDv1c1A9k/mBRg31Az91oDtqrqwatQ4I0anIsyXK+XnRD0p24kbCB2py
	BYP2jp+tePO3QKbUXJ6NhlZeCqBSckju6jqMhVuYOv/QTbPgZb23kefvGomkgV1ZB9IZ
	kVexwAY2cyWkPWdT5+N/EBki5HWEboPBkNpVUZkYjNGycLxpE7sMw7OOyadwDt0ACMiW
	bwLg==
X-Gm-Message-State: APf1xPDqek5+wojI2nfpT+sYuRg4/L2Dru+RN++f3lRpdIacwZYSd4C9
	+IsNjmPK7SZ0yBz7/ZXW5rHUTa4XZHfoex++fpA=
X-Received: by 10.55.197.19 with SMTP id p19mr1937270qki.210.1518108587060;
	Thu, 08 Feb 2018 08:49:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Thu, 8 Feb 2018 08:49:46 -0800 (PST)
In-Reply-To: <CAFEAcA8Hjsb+KW4A0ks696+zXOeDErndeQDFvOqshyONpyaSSg@mail.gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-13-andrew.smirnov@gmail.com>
	<CAFEAcA8Hjsb+KW4A0ks696+zXOeDErndeQDFvOqshyONpyaSSg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 8 Feb 2018 08:49:46 -0800
Message-ID: <CAHQ1cqGQaWiqY1Hg514frugOE4-kUAxXFgFvX4-Gs5tDRgcsMQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-arm] [PATCH v5 12/14] i.MX: Add i.MX7 SOC implementation.
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0j90E+HOrkL

On Thu, Feb 8, 2018 at 5:26 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> The following interfaces are partially or fully emulated:
>
> Hi Andrey. I was just going through this series to apply to
> target-arm.next, and I noticed that fsl-imx7.c is GPL-2-or-later,
> but fsl-imx7.h is GPL-2-only. Is that intentional?
>
> If this is just an accidental error, and you send an email to
> say you meant 2-or-later, then I can fix this in my target-arm
> tree by copying the license paragraphs from fsl-imx7.c to fsl-imx7.h.
>

This is just a mistake on my part. Feel free to change to whatever
makes most sense.

Thanks,
Andrey Smrinov
