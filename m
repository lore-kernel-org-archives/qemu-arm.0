Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1147284wrt;
        Tue, 27 Nov 2018 03:35:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X0Q9kXsgzQ5XrfIthbTnj92+Di8Hk/4VKmt1c5KGNSlkwe7u3O2wQdkNPxfKIXxnvPH18M
X-Received: by 2002:a81:d80a:: with SMTP id d10mr22181540ywj.395.1543318541660;
        Tue, 27 Nov 2018 03:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543318541; cv=none;
        d=google.com; s=arc-20160816;
        b=iX9ejkHwV8B7DbzK7anyq4LfBsVNvgIMRfrcOFF29DsQrm7OC7aE5IjGzINGbB5Ped
         sx1A0XWeY0lrIDhKNB2DrYllJh+wyfhLfJWEAGc3LDU9UlL08VD2w/bAzXzprpsExPz/
         IZ+8Ml6aIllTxyJMJ4jU56r4hhPareI29QVRXEQKEWbD84XD1+0B0voiuPxyxPRMlR2W
         teF00bnEWNECGSAB01ZmdD30dXdjK5ly9pUp8Vz6KeAxlSpNKz4tBzA5y38CxuqrY2XS
         J71nABzZoz6YVs3lIR7zL5Ry1ORiEbT+ACDvtooZNJd+hXT/IZxZNcnsRsRBhWlJ4PG0
         1CsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=9D4EAYORcn9j4VPURgcRByr3g9utSpxo4tmVEWJiFTY=;
        b=i5XG05LaNxsio7t/BiXC36XY0SLuUuEPMlN177eS7jmFw1JhW8FoOWiud35+UwC1Lv
         63KJD+0zpSgmNi2zxvcmpe51AAA00I3+d+23NcIO+nj5Q9kkOCR3VP1dT44HXl+vjUjf
         1zAfJbRIeX0JHOZvBeK5l6vQ2KqcDqRW9k7AbZ1h7wkvWJcDVrn4Qhak8zNvisKb6yM3
         +23dA/CuhdoVWkIvB1HoFLLzhNbBm1SrJxcqlRxuf4JKhiXEhjO7cZT4tWkBNePnnh1Y
         SGoKlVSFs8jhiNlFBnKZTwd08nqXUS9UaFjqV1nbCY/r1Mqeh6pDdQdROtsA7sHssFWv
         g5+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j199si2575482ywg.356.2018.11.27.03.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRbeX-0001vK-50
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:35:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbeC-0001sg-Bu
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbe6-0004aE-Jp
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:35:20 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59865)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbe4-0004YW-N4; Tue, 27 Nov 2018 06:35:12 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MJn8J-1g7aik1YBV-00K714; Tue, 27 Nov 2018 12:35:03 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-5-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e248dae5-445a-3a39-e395-36f9d090da9b@vivier.eu>
Date: Tue, 27 Nov 2018 12:35:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x2TbgoaHQHdyPg5wd8NABc5hdUf6iqp7BN+uAjYYFs6ufd+k8s3
	gjOKGtqJ+T6XMZ/Zs3JQ82aXtBJXfdfy8FlGacHcmEsDXrmxYggmFTG3IcoGaZiPZPLJCLG
	SxjZ8h+sMscJ/9Fwps4GFq+Yx45AJQYKar5iTCwaCMyTNNPCNUtTTQYNiffeZj1ltIzWLx/
	OG75uWAdzEsrYFz6oojQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TMZtG5qWVpY=:nrt7x5RnjbaBA3nm7JIjgf
	X+CQc850WD2Mbggyt3P/UNBGw33YpGWDVZwC1ZsZEKJs59lnwYwqi4aVXRKXuW6xbmBVp0Pf1
	EYbsKl+89LM5VFpGuVR0TDGsquI36A0uGredvoXyezXAt3TuL7/G4qGg9naElFVfkQ2iix5r+
	+lxcQbZPrfi/xo8+FIcuIZMQzKIhROtVL1BHRxXzgYsrQ5w80+rAhfLYVHGDVBU/LHp8vg0GO
	QeJg2aiwKfKVktl1bZpIr6Wx9ljq5peYOMsdK13Q1TfdT6IW00lGarL6bRCc8iKsOxkWsORbK
	euYRFRv4nRLyxSFnM3ePba6HRgN1Kaq60L7m5WoF4VX1R7qBLV8fBwhjToiccn/7i014ytD+M
	3bkW1XdZo1+P9mS81yvMp5Pl+9RRrecdt9K0O9Qi7mI07Zrgh7Ke8rXe6C4C2uXq+gv5TYzbj
	NElAhc9IPLfqLB2LL+GB8CCBbkdz71XGtilqapWm67H6la6mnr75TV4KUyqY9Fq6i2bLkJCkR
	I/gPSiYUB3pOkDYVAYLA1nYOxpAX/OmUlukJiz9sexYMVTpr9jR6UURFrw366XnfiTHWi66/Q
	doykB3Fxw8eOzAJUuzj6WIX86kBJ4dPKJTYjousYgGssajJLhpq3ht3GkUx2bLOd4dri/bW+S
	7ByPua1HDJ0eITOqCFzftWWAGXZcztUghYeeQ3LLy9J1Ih33sC5nGSRBhAzbvB/zvpUyE8XbZ
	PAbGDKisOfR6RCGaYDKwHD7XLsvuyCdrrIx9Ljide+MGHHMutF1PYaSQkdN3NA7rqmOY4f4k9
	JVnU4c1pvC9KhbI85Abd9dIJfy3Dw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH for-3.1 04/25] MAINTAINERS:
 Add missing entries for the Xilinx ZynqMP machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mo4GTlwUYCDn

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b9996ab2c..007f89f126 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -711,6 +711,9 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/xlnx*.c
>  F: include/hw/*/xlnx*.h
> +F: include/hw/ssi/xilinx_spips.h
> +F: hw/display/dpcd.c
> +F: include/hw/display/dpcd.h
>  
>  ARM ACPI Subsystem
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
