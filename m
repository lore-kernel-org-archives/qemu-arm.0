Received: by 10.25.0.6 with SMTP id 6csp876523lfa;
        Thu, 1 Jun 2017 09:29:26 -0700 (PDT)
X-Received: by 10.55.17.11 with SMTP id b11mr2981150qkh.5.1496334566083;
        Thu, 01 Jun 2017 09:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496334566; cv=none;
        d=google.com; s=arc-20160816;
        b=AfJYn+h+7V+lA/dbu3gZjZxmHsecqIxtQYm9c3x+OhOyB5oneIX9xZfxddxCTeH1t7
         28muYooAyS0yh5s5NS9EwETW1WHzXoUR9rdlpOdaFua4qmRWkVdVKoEmSOaSFSGs8tkh
         4mHmBDUUc0bDREKVSkJyEH7F/rtg2H0YvWbcOda6ZZQ5dbPvJuy5JM+loXDAvmElWFxP
         teM7M5/egWVknlRBZQth46c8AHexIVvDwjJZZaKQ2/MIuzyPimdp3veMP/1htqyiQt7J
         usVmFgjpAG4u4MZy/iBibsILSEIi4a8Ym7XGSSA7teq6e/PEFDZf+ZA5N29YQpaBNVvC
         Zn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rWgUzR2yAckzIMzr1JnnA4ATNXGO8XGjvfR2riUWvSg=;
        b=ZpCZQFx6fPwCJQMAEfamcVs0Q4uCX+8QTKfbSlRM1Hsfnk4GlPDfnvMoclLn2HmWAh
         +jbsxlyz1TLQQLxMd3cS9HaN+1rURccsLbzOd4z1Bw0y0XSSqC5ZT7zy1ZvlWY1DA1fc
         pbv3XaCJH5PPL66sxM8HpkUr+n5Ci/Uy1TDEhfwfbWc7NTcsRvH0dwfbN8veAf8F807E
         UONrk0Q6i0c/HCaI2DmRJMXLwfSBPfjpuHHuCePGDE8PM+nlq/o9BLSm+ldN+sZxHQrj
         Xu1O6rVUA/pwNbHahYFmkp0yJ7phM39iLKBiRuYMMKjcXaJx7MIuJ/j03wYgvcttOdcy
         Y64g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d34si20475226qtd.201.2017.06.01.09.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 09:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGSyR-0005Dk-9e
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 12:29:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGSyM-0005CW-Ps
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGSyM-0004ix-1t
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:29:18 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:34974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGSyL-0004ii-QZ
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:29:17 -0400
Received: by mail-wm0-x22f.google.com with SMTP id b84so165328131wmh.0
	for <qemu-arm@nongnu.org>; Thu, 01 Jun 2017 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rWgUzR2yAckzIMzr1JnnA4ATNXGO8XGjvfR2riUWvSg=;
	b=V+L2F8Fj4egb3ZpfA29zJYYpoC4txgWHPYoQ+C2p0WpD1AkyBI/ePKiPUToHL9K4Ta
	Q1fmkqnlQcsECQ0dlwczoGCe20VhLZNkeTTMguvyxkLkTKwxy6Yeh41j59vKsaxsGSSN
	yvnFOO5shG8JHY/JeORgQQos5HjnobAu878Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rWgUzR2yAckzIMzr1JnnA4ATNXGO8XGjvfR2riUWvSg=;
	b=QCI0miYDgW6UW3otYWFqT3stYcCsvGu4ldaAvLmTPhUYhifAqe1AQpP9neamWbb9Af
	gEm4gfLq5hBBhcAAhTt1uASJVtXF2Pdvr6vCkZsf8g6IwTnwNWBw/5H1w2IiligQdUtp
	SNBoCAI3aanJPIxnisEmT7pSE68Hogq9IF/hGtyvPu7GqYoQFRPwWvCL9id+DI5Yvr5V
	ofVZo5Y71HZMsL/6mQ6JznDWMOe6lT1RSPJe8fzFZIpyYmghCdx41ts4g54y6iSKqTFl
	V92t5ZGQWWYPFejSHtUXvvGfhFKKVZpIOCgEXSDIvzda9xHzTv4yM5D3/Az2OVhBa+0U
	mWJQ==
X-Gm-Message-State: AODbwcAoODozVGiJ4WnkJCEtnCQN0lsKQQgmg5Jp602y9et7SgiZXCmY
	20NDr9Mfo3SUPZKWiBk8hMg7z7D3CTsl
X-Received: by 10.223.136.131 with SMTP id f3mr2310339wrf.151.1496334556735;
	Thu, 01 Jun 2017 09:29:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Thu, 1 Jun 2017 09:28:56 -0700 (PDT)
In-Reply-To: <20170529173751.3443-1-drjones@redhat.com>
References: <20170529173751.3443-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2017 17:28:56 +0100
Message-ID: <CAFEAcA-fEFnLuKsAxqbCeRFXf_EtQWLT+UfyBBYF2UsOLM4xhw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH 0/2] hw/arm/virt: numa: provide distance info
 when needed
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkNIKqYPowmp

On 29 May 2017 at 18:37, Andrew Jones <drjones@redhat.com> wrote:
> Andrew Jones (2):
>   hw/arm/virt-acpi-build: build SLIT when needed
>   hw/arm/virt: fdt: generate distance-map when needed
>
>  hw/arm/virt-acpi-build.c |  4 ++++
>  hw/arm/virt.c            | 21 +++++++++++++++++++++
>  2 files changed, 25 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
