Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1913766wrd;
        Thu, 23 Aug 2018 21:45:13 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ/sgacldupMQ4nBxm6NrfMhLbdVNwCMmqFs5fpJaG2091i/kcl2JKlsQoHCgYHIwTZvKmL
X-Received: by 2002:a37:c0d3:: with SMTP id v80-v6mr53212qkv.256.1535085913407;
        Thu, 23 Aug 2018 21:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085913; cv=none;
        d=google.com; s=arc-20160816;
        b=cn3k8Dp+ut/0c8EBLtyyAa1vql5+Mq4Ie/RGu/vESXcBE4uKRtAO7uhy0PahYE0N8F
         RDsplsoLHOPV5NknIKbe//eDn+L3V+e59gBbj4IRE0TGYHqVjBccd6TgIHDiMk2RGwO2
         sNr4Z2C+8LIKFvxbc3AYfB3i+br/8qIUUWdTD28l5m2TG4vLFFedt0Waoz1RC/3OipOf
         CMfvRqT4PMWoHHNn6O+CTKiCa3P9IfNmv107Eh2Ydn2kKzQ9gePSNYBxiNV4vR0pR8pp
         wLpOMLZ+MZuBs40t5n8wZysNnnEGUomOT+VuZTfn4JQ/LLq93TzwjNbeWbKOsQwb3iHV
         npjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zp3o8ZDJaZaQeDmAvAWFxSJLrYdE4qM9QW5q4uQHH9c=;
        b=PepV8KFmN0374RBa/EPZ/HAY4bRtJLMe5rSPPPC4wFQ2pw99efSVP5DZbn2lRbSpdR
         G34Vb/i8d+7A5aw8mt5r2+DcX0AOnLQxSUIQx4U34k2j4+LjvoAUsC8MA4ulKXtt082L
         aPnti/K7d73jCLn8UWeI4QsX/f7lSmK0O2m95bTXvCaMr2zJfzAF1QvVJC1YzbnSpM4z
         5KsIE41XndTVpTdc/Y2+vKGgX6mEc8qOcGS0B3t7v35JpH2gt7xnJnV8k+2w1yfOMeKi
         z92sdjV1DrD8M3sZl+7QBP+dzZ5La4uAL5QiYcCxAViqWmByeOTUeaLrrt2sDYUAy+4B
         IJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eORhzOm3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67-v6si4978714qka.168.2018.08.23.21.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eORhzOm3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3yC-0006Fr-Ut
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3xI-0005cZ-2e
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 00:44:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3xD-0005mL-1B
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 00:44:15 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3xC-0005lh-OH
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 00:44:10 -0400
Received: by mail-pg1-x542.google.com with SMTP id m4-v6so3192957pgv.12
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 21:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zp3o8ZDJaZaQeDmAvAWFxSJLrYdE4qM9QW5q4uQHH9c=;
	b=eORhzOm3n+2EG1/zU3zCB0O3Nhxu3SItjEDKHy6KIziz61mKmGBjCtxrCxBEJc6q8T
	XXCCfe/uOxCKa6GSLPx5VZngpFlzZJnSNphk3vQz1VW2XtDRDN+RS6MaxW1dnrAAiFXK
	z/JX6I3gawn06++BEUi0RHxeOeR6+5IMYxm0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zp3o8ZDJaZaQeDmAvAWFxSJLrYdE4qM9QW5q4uQHH9c=;
	b=UcLqnGRwbVBt2AluYnIsUkOlbxekyF3yJKB/CXlFtCUNQKT5U9YROGUef6lBJ4tcJ7
	/Gx6UO9qG632v+OWcnrcsnm1usF2UOf0aMSGOQhW0p/ZEiXseyuxt6v9QKtyfVllfzYq
	CJ3KVQ4nBTRibplH77QMegSUt2aMIyIpx0AjVTq1F3GG0gp6iOi3rAXbG6vwpvXIm9ax
	azW0IXlVD0Q3gGoVwvxTd3bqO+11NSnVxSi0xjA1E1XcrzPoa6W5zC2R7KFuRkfhQ6wR
	H9uP92g4IKNzii8EXNgxdIYqvaOAojilqj8lwpYZ8ZMv87/sJMCRvFl3gy3xSTS0Wpqg
	YwZg==
X-Gm-Message-State: APzg51DOnSFCizznj7ss73IzUjwgfDCC0Vdqyhjw8fdYlqKHFOFruGbf
	oi0tt9PZlLAZvh4yvGiHepNcXw==
X-Received: by 2002:a65:560a:: with SMTP id l10-v6mr60584pgs.130.1535085849707;
	Thu, 23 Aug 2018 21:44:09 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	a72-v6sm15732504pge.85.2018.08.23.21.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:44:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <369b363b-0b90-fd78-d2f8-49f23510cb3e@linaro.org>
Date: Thu, 23 Aug 2018 21:44:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 6/8] hw/display/bcm2835_fb: Fix handling of
 virtual framebuffer
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J9bWJ7/qwGs9

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> The raspi framebuffir in bcm2835_fb supports the definition

framebuffer.

> of a virtual "viewport", which is smaller than the full
> physical framebuffer size and at an adjustable offset within
> it. Only the viewport area is sent to the screen. This allows
> the guest to do things like double buffering, or scrolling
> by adjusting the viewport origin. Currently QEMU doesn't
> implement this at all.
> 
> Add support for this feature:
>  * the property mailbox code needs to distinguish the
>    virtual width/height from the physical width/height
>  * the framebuffer code needs to do something with the
>    virtual width/height/origin information
> 
> Note that the wiki documentation on the semantics of the
> virtual and physical height and width has it the wrong way
> around -- the virtual size is the size of the allocated
> buffer, and the physical size is the size of the display,
> so the virtual size is always the same as or larger than
> the physical.
> 
> If the viewport size is set smaller than the physical
> screen size, we ignore the viewport settings completely
> and just display the physical screen area.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  6 ++++--
>  hw/display/bcm2835_fb.c         | 28 ++++++++++++++++++++++------
>  hw/misc/bcm2835_property.c      | 21 +++++++++++++++------
>  3 files changed, 41 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

