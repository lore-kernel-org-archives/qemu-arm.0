Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp18719wrt;
        Wed, 3 Oct 2018 12:54:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62bXccc3rhA+609/mFVMSnGB9p3c7vf7lpyVRSAZxV8oISCb1DKzhNeSSCMAlVjFADKwVss
X-Received: by 2002:ac8:18e9:: with SMTP id o38-v6mr2697886qtk.256.1538596441451;
        Wed, 03 Oct 2018 12:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596441; cv=none;
        d=google.com; s=arc-20160816;
        b=WAMbN3v+QcP9qwfNi21YNgNRnCAPDW82wO1/O1Si7gy7X5SmKBWU3Meg0bMIHORyEI
         rAe7HphIsQwV9+BIO0gFVVqSLkmmped/Z1Wy+lKebNDsGZhiiBpIwSuLhm/PyEhFOtbE
         qK5pLC4JncEHh2mYwMm3eTbmbjg+vb0b0OthtOwr4pLYy/dSsJ/xoE4zbrsiRaJb0bB/
         YQpAffjcDc+O15vK6UygoOxYtXM85o3P7wCA2DrlqCprQkJtg8ZqbKlBX+H2YQGv8Jcd
         a98ZdtbyUoLQmyXJvwB3Ps1jl0O6Jzlg+WCZcEHMi50a3f/cYxiK6HhFZPjiS3T2Kl0f
         7psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=SCxjbpcewe88DURiOdEogS50h+/m7saiEaM8e4jZcNQ=;
        b=lqyDrd4UctkdxKknJHsYvRxOoYbc6J+9ROrk+VdelW3whoKzbLYjGHyOXzDvYYbg0n
         kOm/9NzrMpp0RDxVlJEGhcV4C8RRxlpFZ7yd4z89mATdikBsQCaDJIqOidc1hyNwN0Pg
         MBERN3+c79ufCbFjXCTEPWWoa6HgjbVndEV8Ti1eucSGXch8ixRGm5uRYQlXbRw8EW6S
         iNuRraNb6goFCYrugUlDwL4+0HvZtjPYh1uVrlEvYkXRZIVI5NW6EsBEfyiu3cuDt0C2
         cWuFKkMOWOKDw1xq/XaFAfUXneEGJ+IdM1RlKQ947KMNEusHjZo5NjgG4KocZHhrdGgf
         1LpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fs0wRGqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5-v6si1517046qke.401.2018.10.03.12.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 12:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fs0wRGqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nDc-0004g7-U0
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 15:54:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nD8-0004e3-Go
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nD3-0000cX-Dz
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:53:30 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nD0-0000aX-8b
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:53:24 -0400
Received: by mail-io1-xd42.google.com with SMTP id w16-v6so6046178iom.7
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SCxjbpcewe88DURiOdEogS50h+/m7saiEaM8e4jZcNQ=;
	b=fs0wRGqAyWA9KLQPGMuL7y0mgl7G3dcyzilwJaMDOexKf5pA5IXYBDoyTqkdZfaBMN
	2e4HXptzbcvAkL6KIFAtpOZkINsdbZ3J89zf1aw0oyAGG4Gu6Yfr2LMYkiZpbLnNIAdu
	neKcyxVK+YYnAyudftBLVd8jobCfDAOIKVzQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SCxjbpcewe88DURiOdEogS50h+/m7saiEaM8e4jZcNQ=;
	b=EdpUJbLSWy4I+krHYgj/g1soLSPcpQlz1shPoxEpp+sBB7sJMh29veRIoGTv2+6Bs3
	X179WSXjVWqkYGztDLV1TCQinla5Jw3DUicq5Cw1UdYvMzC/Ul1i0bAbhWV5OfzA1tTp
	4Uzb5oZLlwQagWE3f0lRzo31PpFhobdGUg2dhhffipia0O2XIThORwnYp3kE12g7+IvX
	NbA8WOEwnHAKM8PCl/hYsvG9Uy+yfHwh+EAijDX1VMki9JcnQeS1ZcncuqiCBPHlWxx4
	w6mdkEI3PSgzxDFgC6DMN1FprC8JTkG9WBqhbp2FtYmStpmjpZVh3vQ+Kkj4n5zQNhV4
	4/qA==
X-Gm-Message-State: ABuFfohJlXc8kH35S9gj8N5EWlr8/O/QxIn6TYASm777GpMtmXtAtxVw
	w4lKHDi5wIAb5wr9gOuum0P+8g==
X-Received: by 2002:a6b:bf86:: with SMTP id
	p128-v6mr2196968iof.156.1538596396542; 
	Wed, 03 Oct 2018 12:53:16 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	f197-v6sm1094458itc.4.2018.10.03.12.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 12:53:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <466ca17b-61ee-5881-0f68-2f6837f34ee9@linaro.org>
Date: Wed, 3 Oct 2018 14:53:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-devel] [PATCH 03/13] target/arm: Move v7m_using_psp() to
 internals.h
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
X-TUID: afgT4vsvzOyx

On 10/2/18 11:35 AM, Peter Maydell wrote:
> We're going to want v7m_using_psp() in op_helper.c in the
> next patch, so move it from helper.c to internals.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 15 +++++++++++++++
>  target/arm/helper.c    | 12 ------------
>  2 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

