Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1653594wrq;
        Thu, 12 Jul 2018 11:02:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf78Wb2jcTYQ3BLGSQJTi3CDqvJWfZ4zwEL+cdTaXeyC7ePtPQVj1xQdJ2eNIsNvJS1RCuC
X-Received: by 2002:aed:35fb:: with SMTP id d56-v6mr2791953qte.17.1531418544406;
        Thu, 12 Jul 2018 11:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531418544; cv=none;
        d=google.com; s=arc-20160816;
        b=SGBZzdWJKyvYW5n9wlmA6SwaVVJAot7YuRqglpFAnOgElt6H/uM7vSDiL6E+hiqMY3
         pSJf9SfKZzWq8v1rUxmBr0jDhV13HnW/jGALDmnr/bQ3LNQ7veQuy7T57LhBwba4b9Fg
         CGZR1kyAY7XoXcyviqmmOXJzzC8dRk1lFRbVIxZmqEylHubclzYl5c1rFvZpp54Q2huP
         HJkhE4f8ZYPdMnS+wcQGrQ/lxcZZeng12ofDonPLLr+Ai3WRRu1QfKMRUicOvm3EO5wv
         zAovsxfVwaWGVFVOGcIyJVHoGnmZa3VXZH6SiQabXvuaZW7S5CZ9a7umQWbRqTIw47Xy
         Z7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=9g3fMoCE0LkviT151HnYa3v+dx+ZB96ZManux0qzvWg=;
        b=wdMTh4wtTYTmb9cEG7B/tu3Lbmt+6BB2MKLS5gVtY3bazfqvlTdD4wCVVk/V2CVonH
         Yxvos9Gw3UQPPWkXlXA3mIkC0/upE9rMQ/E1wIAMXIuoGYjBUTUCfG6jFZUKgZxAO1yU
         jRPXjJ+cbV3PXeEsXAcwwfzO+pYfv6Uw5W3EIRrKf8eP8PVNhV6iCCDA/wJv77RtBXuw
         tl/CKEeAj6BGzNO/TuDJRmn0cnyEGvF4y5hK6syI5IKhnyFmAashoN2ttJiOYlQzD445
         73lsDWkv6DNJJdee8eHWpCFraitSlqRm1oTBlKyhJba3IoPpbv4PRaFehL5Xk4rxaHbu
         iAew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWxPdVcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8-v6si18402259qkm.293.2018.07.12.11.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 11:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWxPdVcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdfv5-0005bf-Rv
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 14:02:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdfuq-0005Z3-Gr
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 14:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdful-0007lf-Nd
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 14:02:06 -0400
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:51025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fdful-0007kR-Gt
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 14:02:03 -0400
Received: by mail-it0-x241.google.com with SMTP id w16-v6so8077115ita.0
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9g3fMoCE0LkviT151HnYa3v+dx+ZB96ZManux0qzvWg=;
	b=gWxPdVcR6gq6ulVFhcNfgv06d5Js/Fi6kdjLGnSzjWaAvJQzRTCcGcXOttCQHjYeee
	ImVtFFuIVOOPg8DZADK/49hexv+p3qE4l3vu33i5kBi5+8SUS6GWaE0xpKafwbwj8oDI
	tgCIJeylQcAF2afQ94tJ6n8BBgrn6z2qWTYq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9g3fMoCE0LkviT151HnYa3v+dx+ZB96ZManux0qzvWg=;
	b=UVKOq+YVwRPJxMKJakguo11ancB+AGWJlQFUSqRqQ3BbGRVqctBUWV0vgkDlxY7Ihp
	YtO/aiJucL/gEz5rlKR39glCr/AQI6XDWdVAg6kfNFUBghKMp3BKeaeXAHpqzBCZLBd7
	mA28UJb01lYwcVtaHXSlaOhg8KaC4GgyqqvY0sh3zxxotPfCJp7uj2fZ73OHwRfooWC+
	FbSGlS/QKuDajvxuZnI5rRgbto3o26AFB4HMW2VrSakyNV6iidaQYO6GsMkLPVpsv0Qc
	Mxy40vMqeqNRhNryaEeowkDcREjZ1Ud2t3iYM5iNAffU+02wUTj1ipQqCz/LUg3e+842
	8bXg==
X-Gm-Message-State: AOUpUlELQWI3vlvdvGZs4jP7lJLuLDyGBqV14PGslnTt1zYef4UWn5N7
	1c6SgCjqWxYTvJbgsVupLGvONA==
X-Received: by 2002:a24:b34f:: with SMTP id
	z15-v6mr2190025iti.53.1531418522249; 
	Thu, 12 Jul 2018 11:02:02 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.233.255.141])
	by smtp.gmail.com with ESMTPSA id
	r6-v6sm2830248itc.16.2018.07.12.11.02.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 11:02:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180712154152.32183-1-peter.maydell@linaro.org>
	<20180712154152.32183-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <995c9d02-e2d3-0f91-d135-56b25a694819@linaro.org>
Date: Thu, 12 Jul 2018 13:01:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180712154152.32183-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 2/2] hw/intc/arm_gic:
 Fix handling of GICD_ITARGETSR
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UxNSJU44YBlu

On 07/12/2018 10:41 AM, Peter Maydell wrote:
> The GICD_ITARGETSR implementation still has some 11MPCore behaviour
> that we were incorrectly using in our GICv1 and GICv2 implementations
> for the case where the interrupt number is less than GIC_INTERNAL.
> The desired behaviour here is:
>  * for 11MPCore: RAZ/WI for irqs 0..28; read a number matching the
>    CPU doing the read for irqs 29..31
>  * for GICv1 and v2: RAZ/WI if uniprocessor; otherwise read a
>    number matching the CPU doing the read for all irqs < 32
> 
> Stop squashing GICD_ITARGETSR to 0 for IRQs 0..28 unless this
> is an 11MPCore GIC.
> 
> Reported-by: Jan Kiszka <jan.kiszka@web.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

