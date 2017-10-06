Received: by 10.223.197.9 with SMTP id q9csp1673797wrf;
        Fri, 6 Oct 2017 06:52:45 -0700 (PDT)
X-Received: by 10.55.159.88 with SMTP id i85mr35198985qke.350.1507297965688;
        Fri, 06 Oct 2017 06:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507297965; cv=none;
        d=google.com; s=arc-20160816;
        b=nEbJGReA2cCIVIPK/+MubybfnYXAgVIQzhSxGeJBBF0ZgKUWIQygDLLWFnolwSC0TV
         go8ZeJ+xqybxYiWxFKg2TRWSMdeVLdDF7E5jzTG7RpKZJ5uJppTVi765Bkb27fKibIIH
         WFP/Cp4Lt2pS/ZO6dH4QeF7KNmcGAeYXldrhU5xJMVZ8Efr0lNrRPkYwwGY2lx2fm9df
         e6JOoLCAdtEWMjztRLUTJctnXVHXpeSeXqkW2kY8IKzizS/NCjXuB0vWfqb3JQ2Yj3QR
         nearckLK690Qiq7t54BXxf7T0lIzmPBejiVyAI6bMVkZNXMYtrL/fDbSUr1mdIBwDTAV
         XBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Oz9d8UTaC+tcectJoDhN6thLn31hsxGmHHsuTkcE9hE=;
        b=xjurIkgOli1dkhIUy3m3KZkW03A+jOL6amM37ifcrA0xL02kks7m0RGgxAQ7dAi5Fk
         U+6h+MEblqEmfPNTwRYTT28nRmWl6oovccLFvf5ByE//51BRfTYnqElrBi41akUg6bjP
         pnrRVHKUNKWensdpiQHHqDdg5gFIBrydJJQdnPhB3nuE8/B1Drm6UV6y9MFsYal9fyQb
         yd667kKVcqv6p/Y72PB7oIJ95I25h7yd9/Z4xWy78Bivc5w5xLtms5NYVhzxw/vKiXpg
         0+CBKl8GPWGO4ABhGmZcaXxMTlpa0Y2QUnG3DULI+heHtB1RFO4XnVGY4LoF+ggxKLTs
         CMlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iq6Tm9Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n91si1247437qte.546.2017.10.06.06.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iq6Tm9Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0T3V-0004JK-7Y
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:52:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SyG-0008S9-Cv
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SyF-000405-EB
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:47:20 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:53379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0SyF-0003xU-7d
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:47:19 -0400
Received: by mail-wr0-x230.google.com with SMTP id y44so5377662wry.10
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oz9d8UTaC+tcectJoDhN6thLn31hsxGmHHsuTkcE9hE=;
	b=iq6Tm9KgZnZhbBvPAwQiDABVtD5QufgRYgQ0JG8Ir7qd0V4YOf/3b5EYoPzFUur8SA
	skreCn419mzaZV8vNma4R0u1OT+CVTA7uOTY96Oo/RHZsOzvhG14Fe0mpjG7rRoD3McN
	gowYqBG1R/cNjcLyxF23dRHpTm9MO7yWpP0I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oz9d8UTaC+tcectJoDhN6thLn31hsxGmHHsuTkcE9hE=;
	b=oLbS26lSBIjzB/vYGx+Q1dIli6DCzl+CgNIhzzZOkFNj6/epZbK7LW58HW5nVs2ltD
	lEYZAZr8NrEu1SWN6o3qAAm1yiRFrz7srekOoQkoaMkWgWZjjsPcV0fHNLN9IXfd+2Gf
	+vs13+Qlm/l8X3uaAQWcn20iuVZb0BxoBXxWX2V269znk7lSq+WGmk+b6wyK+PotcjJw
	7dkTFjMyMx+BXdvGgViTYv++w7FAyh/7o0nHiG4qsfj2M/UHJIyrYYjwmaYZOgplpXh9
	V2Sd+mlZ65i8ZSJBg566dWDfDrcR6baBIuruNoCXS8h1zTHZ2M1cATVDwVRaNVdcEJWt
	o67Q==
X-Gm-Message-State: AMCzsaUmCK3dIvHP7cU1hpeGVSmOJ6lqb6YGaCOTrMIP+eWoYAYt6e1p
	EeFRNtOqs229SyytmXO8qJpjd5ew6hrCZ+VXRhkDag==
X-Google-Smtp-Source: AOwi7QAvhlM3Ce+fUUJJhshYL52hc7jRycpVHNMRbloQefx0w8WaPsXOLTZ5WkidBI0XZxxeMRL6ecWckA/4+GUYSNY=
X-Received: by 10.223.175.56 with SMTP id z53mr2351672wrc.177.1507297638037;
	Fri, 06 Oct 2017 06:47:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:46:57 -0700 (PDT)
In-Reply-To: <20170918195100.17593-2-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-2-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:46:57 +0100
Message-ID: <CAFEAcA88T4nACCLGG+bj+A7r+xmBJ3iVD4heKMuUy3nLZ3JQrQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [PATCH 01/17] imx_fec: Do not link to netdev
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A1hwJrFdIFFE

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Binding to a particular netdev doesn't seem to belong to this layer
> and should probably be done as a part of board or SoC specific code.
>
> Convert all of the users of this IP block to use
> qdev_set_nic_properties() instead.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
