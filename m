Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1226904wrt;
        Thu, 22 Nov 2018 14:34:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/ViF+9LWCM5GMYGqqdNIIb82KGaVcfjA8GFCd+p4I0n9A7tGd4YzvJhcspP619eioLtKz1v
X-Received: by 2002:a25:3d83:: with SMTP id k125-v6mr12756907yba.26.1542926063119;
        Thu, 22 Nov 2018 14:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542926063; cv=none;
        d=google.com; s=arc-20160816;
        b=Yc6KSkfLrHuMRmSHoPgLE6+2PYLgVr9hEAITfbz5ylyZOqf3BaN494eM4KG/j/khMm
         bloOjGVFOjEwoT5cOoZp1kTv//fTvfD6r0XG1QfVAHfS0wT+TIJcX4dpdswVQw/P8opb
         uaOEJFi73Jh8g51B5X52ip+wYsW6SPVyjUajOo04wUyCcWBFdcbGbGeM9x35aG3Elb5C
         I7uN4KDTRTFQV2cG5p2SvERp1XfV3ggnLt5WavgKaP/U1yHAEbw4Hyzu5mnVxoxOgeJr
         1SJsgrGjVBold6MJi1RRfMveGj3RQgBrluYpjq0xooNN6Be/1x7iHOFdfmA4jLgbY8A7
         QTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GkWGG6ZefQ7YEAps5uXFbuunD74T8lsjeMBK47a6UmE=;
        b=DaPdwrl1+JBRMTIIwlG+2ppSsNate/ooiwcfebg4nhaJoMPUdc08j9k6yMsj6CzccK
         mUn4ndDxNPDJSP+ps1CFmlr8iOzGWLh+YwfReT1M8C+KgMnDEuiMvziZEUgCXjSA0lTC
         wYvGw4WKs1v0NVgTOxuw+mMz11owlW9Ti4Szatq9NQhI1v/hk9h/6lHhKu11GAdHFIbX
         4FusIQ9ITvtc8Mep3F8RsKLeMj6hS00/lroTx5h65vgonMtG+DEgj8JqFqBHfHk9lZ09
         OTHEE/rFCTgsIpj0FYDeSJhCB6OuOmP0kXApuDnC+8yMNHlXwA5DGRl/GOcj6mutdhxU
         CLzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si15825264ywf.466.2018.11.22.14.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 14:34:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPxYE-0006p0-J1
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 17:34:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPxXt-0006nl-8C
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 17:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPxXp-0004t9-4a
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 17:34:01 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPxXo-0004sx-UR
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 17:33:57 -0500
Received: by mail-wr1-f68.google.com with SMTP id p4so10590047wrt.7
	for <qemu-devel@nongnu.org>; Thu, 22 Nov 2018 14:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GkWGG6ZefQ7YEAps5uXFbuunD74T8lsjeMBK47a6UmE=;
	b=Hrj5hhVvfmBjLzpZr7BHNjjcnGk/uWj5xuPMnWKFZwgp2RHbOci1wtW4dg23qx2vXC
	EUO1ruhxEO3E9EJc6C9qYyehzA4y4Cj0PWIEocWLErPjmTzOxQUL2r/4uhc5rSGBJOfZ
	Y9PskRQxS8tU8QzbC61Bp7qIqdEp71/UlDCt/tIo2KlfbMjOOA4gA+rt5PaaCvXhQ7sy
	0lbnVETeb76/Hjs76eOWKB6jmX96Y+3NFxZX6667z9WbOb6kALYe8sYhPRl4s4Cd48Zz
	IyxGukFHeaBPKevzU/PWLP9hEuEoNsoLW1MMx5Kn/Yg+XvyE4yEobv3Bn5C1PKHEAs2l
	M6Vw==
X-Gm-Message-State: AA+aEWYNxbiVCWfxm/WHqEe8wITXSccokyL7Ha4T4oHXvSFy3956zvPw
	+aVbSN7FKCeUumUra1ewzFVhOw==
X-Received: by 2002:adf:c6c3:: with SMTP id
	c3-v6mr11033645wrh.243.1542926035885; 
	Thu, 22 Nov 2018 14:33:55 -0800 (PST)
Received: from [192.168.1.33] (75.red-83-57-172.dynamicip.rima-tde.net.
	[83.57.172.75]) by smtp.gmail.com with ESMTPSA id
	n8sm17792655wrw.59.2018.11.22.14.33.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 14:33:55 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	thuth@redhat.com
References: <20181122180143.14237-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1259e457-6cb8-3b1e-853f-53f1e47cac63@redhat.com>
Date: Thu, 22 Nov 2018 23:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181122180143.14237-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH for-3.1] MAINTAINERS: Add an ARM SMMU
 section
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m/ILPq8ROqYc

Hi Eric,

On 22/11/18 19:01, Eric Auger wrote:
> Add a new ARM SMMU section and set Eric Auger as the maintainer
> for ARM SMMU emulation sources.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406c56..3cac9f0a0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -151,6 +151,13 @@ F: disas/arm.c
>  F: disas/arm-a64.cc
>  F: disas/libvixl/
>  
> +ARM SMMU
> +M: Eric Auger <eric.auger@redhat.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained

Shouldn't you use 'Supported': "Someone is actually paid to look after
this."?

> +F: hw/arm/smmu*
> +F: include/hw/arm/smmu*
> +
>  CRIS
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained
> 
