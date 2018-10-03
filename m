Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp17087wrt;
        Wed, 3 Oct 2018 12:51:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV607HYuiUOF2/8hOOrrhkYG1hKfZhsvg/eSZSp3k0azrZCQHOKjrkv5DuTOzq7SAeJ4rFxTa
X-Received: by 2002:a37:7185:: with SMTP id m127-v6mr199263qkc.10.1538596301209;
        Wed, 03 Oct 2018 12:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596301; cv=none;
        d=google.com; s=arc-20160816;
        b=JVHhPS90/OUnM7SUS+BhSiJv9SLQyIDmLM34znHJcgSxY/jke6GGUIGbYM1oauPhWe
         TJnVAWd5E9l/FATzTvQ6e5iggndt4f+XOIcOEeQU1Cp5spMbbKoQz2I7eIBi4Ok/Zg7a
         ictg2IYiWTNRGMVvjskvpirmm0IIqWHUY1AOaWtGOcgwFs/L/4QaszxuuDQqr3/rBbV6
         lg1mYttzhz47TkVQZXIqI/sX9+ibx5KLQdqkawSX+ESl+bhLNY5hyykuCJB+TEqsfP6L
         +Ppy6IKOEka05UgoulxMd6cZDk1oL1iVOXLu5EmX1GhNXRrEPZN8BSFzUtf+utjCKXBO
         sHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=y5t/2SB62QFUpbbeCjCOj6sJndjpwVdd/Y/uBOGPf+4=;
        b=khHJ+0/DgES9pqMLW7N6qjUUSqd+ULcWsMMSJ28m4N4jH2ufWpWjoMh44QjeAj+qIN
         YcRxJwuD5ktJ6OKeFQtb+pdU3x3my97lcs+iHktyKMipfdQopkXA+jtIg9hlZSwgFymc
         MfrSLOZqRckjOzk3ytCzL2jPEFz9zoQy+ExdcF9jodi2SJEoV64QjMUNIPcIF4T0w2+w
         EirMhkQxKdn9mhOsD0IaY4rg1uAnE5h9NBG+tY16I9emvkf65wBb2Uk6obMCCQe5wZ7V
         9V/rg6YnIEHVLzInQsIwzn3zzY9BjMbqfPevmKLz7XXlWnq+9+gnbZ3yhAFBSWvS9BvD
         +MDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EphAvZVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k15-v6si1333240qkl.386.2018.10.03.12.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 12:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EphAvZVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nBM-0002OD-Kt
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 15:51:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nBB-0002Mi-HD
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nB6-0008Lx-GH
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:51:28 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:39962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nB5-0008Hs-Tk
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 15:51:24 -0400
Received: by mail-io1-xd41.google.com with SMTP id w16-v6so6041243iom.7
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=y5t/2SB62QFUpbbeCjCOj6sJndjpwVdd/Y/uBOGPf+4=;
	b=EphAvZVqPfdFkHv5cye4ed6W+vrrhV3hvJNb00LgS8+b6r3tVwLdhniGLmVotiCwRU
	+lIl1mXFy/wqZxGhc3RcIWrd6/voylnEPXONc2vDPtQZP5qAQTuxdZlN5hhq0DWZ6zOs
	Ae1YeHTgkLmawoTTymKVQ1bgTkeeNnZwSXS7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y5t/2SB62QFUpbbeCjCOj6sJndjpwVdd/Y/uBOGPf+4=;
	b=iV+U+XmofxSmaHTr1odJZ8ktF3N7pPtvObDCN05XkeqM6+CMEh1BK9i3dBJn+eOROV
	yvOtOLk/mVrl0vNMOPQAFt64uXIt30mplKcIz3U1jL3f0EVI9QYA95cKNYeTzMGwo5yt
	ugs+lmTgolAt1rOf7ccqk2PTF4Yi9mfMxnjX54Sv+PE0qsGG3nLjjTZD+JVyP3P7uNV5
	uKNMs33K0LioLbCz/EcgZKUPeijZpt9WTG51QaIBqD0aAxIIvKduhh+a5ddReZ3r2AR0
	xrF1CIPNJl139HpEA4UCb/wK0rV4waB7Y0lusZ0ifvJUtpYnGY/g90UwIGtTwRDrcIs2
	ImAA==
X-Gm-Message-State: ABuFfoh4GXeB8n++Ja9aYF2ScIvcnvIwiXj23ARGQgo3WLvdpB+/tU0R
	eD5XzxgQN9Ll4nKaUWINSzBTJA==
X-Received: by 2002:a6b:f003:: with SMTP id w3-v6mr2167302ioc.12.1538596272063;
	Wed, 03 Oct 2018 12:51:12 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	x21-v6sm1225905ita.6.2018.10.03.12.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 12:51:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <135ffcab-c668-9238-48b6-07346866fe29@linaro.org>
Date: Wed, 3 Oct 2018 14:51:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/13] target/arm: Define new
 TBFLAG for v8M stack checking
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kbZKEnYJ9lnK

On 10/2/18 11:35 AM, Peter Maydell wrote:
> The Arm v8M architecture includes hardware stack limit checking.
> When certain instructions update the stack pointer, if the new
> value of SP is below the limit set in the associated limit register
> then an exception is taken. Add a TB flag that tracks whether
> the limit-checking code needs to be emitted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  7 +++++++
>  target/arm/translate.h |  1 +
>  target/arm/helper.c    | 10 ++++++++++
>  target/arm/translate.c |  1 +
>  4 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

