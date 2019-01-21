Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6375540wrt;
        Mon, 21 Jan 2019 10:50:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7WnYLT86F3CmRRohIlViNFFgagIEwmYrOjb3eKyShtdEDXzTjdBzhCpOVcjhgcTfbKoaUZ
X-Received: by 2002:adf:fa05:: with SMTP id m5mr28639034wrr.155.1548096655336;
        Mon, 21 Jan 2019 10:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548096655; cv=none;
        d=google.com; s=arc-20160816;
        b=YRAc5pIPt72jeVnDaMrAFu/gmcliBPkz+gP6JNurkjvMJU6rx59X03La+de2YOQT45
         06MnC9CiCCgYoGmrb3VO0dBCJuJBOZi+43n1NA6sdNvzvxRC1XPHnjntr8+F2vvxc4Ng
         J0Qmn0W2mnSn8Xwtnk+e1Dfz+wnHi4/BBfdOuNtipwfPhGsXpI/jT8dDAoA8qR+4aNJM
         EPKZpgCBSlEaTHIsS8hMU/2P2uZtbBzb7+HagPSppfRP1TCpM0t/S84uAm68D3XmeUP6
         G3Oer44jmJeUgN1bd0M14zxTbqSTuRJv1SXPBiclyUYsWToauHrAyW0zBwFM4pp9V4g9
         Cq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pCR59i0EG5sqmtLn9F5Y++jpb+OFtjOyRoEKuIOl6JI=;
        b=oBXDsAMaEw5KAzAIOB/TSlsBV0o8yulKdYvYOu866SKUWQKHM1ybNOBnw5BZJVDNZK
         hjnUp3scNI8Me4JGOnIWesupBZcyUhqZggXsZr/422XUktiTJPqSDElYLbKPVONRc3xc
         LhqgDBjimc0l2M2CdxmN9/Y5NQLV8E7aqtGkRqfqLMySV4TYBCk0E1l5xAy7zaf1zDY9
         YgsdthoV9ZBvwpz/OrNil/5yJNVpmzx06EKr7rjOpzEmT35xtx+reTY/w1eYKoje2w1B
         syWOquzhNSVtKnNHDzeqkgYp3NjkqTqq4TFLejDed2dhJ8Sq+aOAsEHV2WQaSo+AhkqO
         tifA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSwwwTwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si33655733wmg.90.2019.01.21.10.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 10:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSwwwTwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glees-0000JF-Dh
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 13:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleU7-0007gg-LI
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:39:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleU3-0004ae-P6
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:39:45 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleU3-0004SQ-It
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:39:43 -0500
Received: by mail-oi1-x242.google.com with SMTP id v6so15343542oif.2
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pCR59i0EG5sqmtLn9F5Y++jpb+OFtjOyRoEKuIOl6JI=;
	b=RSwwwTwpQAeCZwkUPLZ04gZ39XDB5iFSFWLAPJS/J4nAVKA/93O1zkH0tJ8Qody1xV
	fwB4bT6eINaBlHy9yVvO8q/Dt5iB2uX7N64D9X+BCZbDVo9/xCdvu0nep5r6rnqfSLSP
	yYDwjxoV8myhQDIdWn9a2NWIcKD1n54kqfWHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pCR59i0EG5sqmtLn9F5Y++jpb+OFtjOyRoEKuIOl6JI=;
	b=um8JT3ipLenI5wQ6D/c0lFijS4iudcHN7K1sUwWy95Y7EoE+KS7rRaYfZIlXvmPJJS
	UqcwuKvEgIfNkJlzcwdV7dvv0wWs5A6pq+Yb63slFtzbY+bYiZH4Bx32m4/W2xnRQcIR
	Bo45M83n7T7mEZLOomYuae9ynpdH5laJYFqEqrOaVg3piN754MGfhC6O0hCz5Jgb4tyW
	MvedeZcZJG7qXKsaqhXjU0tzBYDgC8c8D4DmlKcfWIDbql7mzZ59C6QYR2/7siNQL/gx
	7HkHG3eVcMmikXs5hCJ2It1rupnDl91uvUPYFw35NpcrI8xsSaM33Lb8H1uouQA4pmuo
	ANtA==
X-Gm-Message-State: AJcUukc+usVbbYuC+9xp36o9PKwuQvFl+o01ePKMz3tGr+3i3fb6mH/f
	tx+qTwmBnC9dn41hfqR9TLVQ46TvuKaSyiX09/KK5SPJ
X-Received: by 2002:aca:c501:: with SMTP id v1mr6022559oif.48.1548095963655;
	Mon, 21 Jan 2019 10:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20190121152218.9592-1-peter.maydell@linaro.org>
In-Reply-To: <20190121152218.9592-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jan 2019 18:39:11 +0000
Message-ID: <CAFEAcA9prusajBwp-66Rio-xjT5vQ4j=WzT=-ww2AV0khpOPPw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v3 0/4] tcg: support heterogenous CPU clusters
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRoJb/zNoqo0

On Mon, 21 Jan 2019 at 15:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the process of debugging my board code that uses this
> feature, I realized I needed to support the CPU object
> not being a direct child of the cluster object, which
> also lead me to the object_child_foreach_recursive()
> function which is a neater way to iterate children anyway.
> I also figured out we could add an assert which catches
> most "parenting CPU vs cluster realize ordering" bugs.
>
> Only patch 2 has changed here, others are already reviewed.
>
> Changes v2->v3:
>
>  * allow CPU objects to be indirect children of the cluster;
>    this is useful for ARMv7M, where the CPU object is a child
>    of the armv7m container and the board code that sets up
>    the cluster object only has the armv7m container object:
>    this is done by using object_child_foreach_recursive()
>    rather than an open-coded child iteration
>  * add an assertion that the cluster has at least one CPU,
>    which catches the easiest-to-make errors when creating
>    and populating the cluster

Oops, I should have tested this a bit more carefully before
sending it out. It needs an extra "patch 0" adding at the
start which makes xlnx_zynqmp_create_rpu() not create the
rpu-cluster object if there aren't any RPUs to put in it.
Otherwise we hit the new assertion when starting the
xlnx-zcu102 board with fewer than 5 CPUs. I'll send that
patch out in a second (but won't bother to re-roll the
entire patchset).

thanks
-- PMM
