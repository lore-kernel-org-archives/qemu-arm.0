Received: by 10.223.159.82 with SMTP id f18csp980892wrg;
        Thu, 23 Nov 2017 09:06:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZbtAKWsmaUSgbwW7vDTX2/dkvdwRvp4cg5JuRHg5wN0Y1pIruBY3nqoUpdnojHCVbUBMKy
X-Received: by 10.129.118.14 with SMTP id r14mr1388855ywc.6.1511456767426;
        Thu, 23 Nov 2017 09:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511456767; cv=none;
        d=google.com; s=arc-20160816;
        b=qpzHJTbTs7tQN97XiRK0wZt3UWf1HNhadrq6g78hYVknAvrr759EEp+6rMtbeoVzaD
         rpqLZmYfAkZy8oyCagj8Q2rjZcoegOhqgwkxLw3URkMMBdr+e8nbkUdMcEbl9CzEWh/Y
         nytY8CBqcmS3IjQjAB2/Mimar/ZYXVffgc7zNfg+g1vKfGDCZxtm1lbAbfhctp2Z7zc2
         mY5QQv4AeKVCOYbz8Q65ySzLWjlH11aXt8QdXWWucsOph1TnIEHBwwsJtyKrPCSRjlYv
         wlyPbBVe75JMu9Vs42aR5RaKDwKsTBEfwffjHyNKSXMh+DhOB5f0EM2pdPi1hY5k2iN3
         fvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4c64nNGAVQYoRJrdZXcbUwIKJpu48Pzg9dOrXSWwuCg=;
        b=ZyYV5obbXXQvMCQCPDqRFJw9FzvA7mqDJWKl+7X24tfoUk7LN21Qj6fDfcw2n/Pan9
         qjgUqbZ8l9YGMnJtySL+qO+HklMWPpNcgPPdJ7/v0yyphDm4pIa+A9k6CKL2XWAKJd9W
         M1ty/5v479MVqwsb2TE+gKpicfHLLnrZEZ9snCx16ElYDqg8WWdYJtBMJcNLtr5Ihv3Q
         CkT14UgeSPDNeCszkZCMxEEN3nnzpz44MTrADlwOdZmEz/0EHd2vNiVBQyCpFV5Ms2gg
         yXRyRdcjH2zV4BdDiAmDkFKqAoYpt+NEyebBLF87tlZGU11HcPslJVVt01oV38LwWSsC
         Y6jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LejTu+sC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g185si4295280ywc.669.2017.11.23.09.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 09:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LejTu+sC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHuww-0006QJ-Rk
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 12:06:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHust-0003Hw-S2
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 12:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHuss-0004p8-Pu
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 12:01:55 -0500
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:37673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHuss-0004nc-Hi
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 12:01:54 -0500
Received: by mail-ot0-x22b.google.com with SMTP id s4so16783441ote.4
	for <qemu-devel@nongnu.org>; Thu, 23 Nov 2017 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4c64nNGAVQYoRJrdZXcbUwIKJpu48Pzg9dOrXSWwuCg=;
	b=LejTu+sCu7DtUfHyX7fK65jzLHk1Vg9CuSD/Ov7/QAyGPCQdGPNioVg8eSnLhghQIp
	Efba3tPAucwE8Y9OqnUDlWTQ9Q6rGQnsxPZ/romacW//EtIynw/4pu3HcLYhtCvai3yv
	cAHGELCKt+dy414ChEd9nMO+edjCCdcRfB+9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4c64nNGAVQYoRJrdZXcbUwIKJpu48Pzg9dOrXSWwuCg=;
	b=JQQJEQkeWDiEXBV8C7fQ1kSvx5ZExRGjNwgPuq1s9hBxyaCSfWYZ1vXnjMotO7B46Q
	gR1/G3yIBcSItT1PBCJDOdFv/ICIH3vewzDxoKlLkN3O4mzyFX4EEysYX4epKDSVNWB9
	p69cU5f1vlNh02O9NxIKGXkt73vhpi3nb0pJGI5/vOaObI9Qp9VKYIGpxFWHuX3ug/7Y
	uwXu8/0iHroUfYxqg+x7MLXiylDn0sYTuh/UnxHPQXrgzajI58wzJiJR/URok04fQ4jK
	+FYxOxjmLqIkW8A+sXrLhx0mIsa/14CSj5k8SldmC4pnQungOHo9pIHNo4vib3fUsgKK
	eW/w==
X-Gm-Message-State: AJaThX7ZgDX6H8qHr3qAEwz7LBeVIVvpotcgx1J/+hbrsy5hpBNIliTt
	djWyC0/bnf45ntGmhB2SYuM5Su9VlMmpK8Y8MihJHw==
X-Received: by 10.157.37.173 with SMTP id q42mr16444797ota.116.1511456513454; 
	Thu, 23 Nov 2017 09:01:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 23 Nov 2017 09:01:32 -0800 (PST)
In-Reply-To: <1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Nov 2017 17:01:32 +0000
Message-ID: <CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-devel] [RFC v3 0/4] vITS Reset
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XoBbeZhflMI2

On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:
> When using update-linux-headers.sh I get suspicious errors at the end:
> grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
> directory
> sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
> file or directory
>
> and include/standard-headers/asm-s390/virtio-ccw.h deleted
>
> I would prefer having s390 people checking and testing that.

I think the kvm_virtio.h problem should be fixed by
http://patchwork.ozlabs.org/patch/838230/
which removes it from the set of headers the script imports.

Cornelia/Christian -- any idea about the virtio-ccw.h issue ?

thanks
-- PMM
