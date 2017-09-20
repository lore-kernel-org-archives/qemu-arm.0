Received: by 10.223.172.38 with SMTP id v35csp1022362wrc;
        Wed, 20 Sep 2017 11:38:06 -0700 (PDT)
X-Received: by 10.200.18.76 with SMTP id g12mr9172888qtj.201.1505932686801;
        Wed, 20 Sep 2017 11:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505932686; cv=none;
        d=google.com; s=arc-20160816;
        b=uEGGonxctqkkUr/8pOsqFUXG1S34vi1VOpS31rOZ8SQTX9fgKaMXe0FR9cN9743fqc
         hMuUFulaqtALC2C0LCzHBzTk6y14wCXgvFX8Eeg42KjOVCv7znM6wGd2s8PXzoTW2QLt
         e0IOLzG7OLRg8r39IkMB/HVq4TzDOWZYBL/eBrQsl8BUz7nlBI7ukqoEL+yRlVV+hlvO
         fOaLcfkwwDZtCyaSkTOa0l7so3NPIaAvccqKmmTRn1pm6/RwW2HeFENYj1vQUCaI72ym
         5YzDA7tb9tPUPpJT7MRtDUsrmF2jj496Sy+MVRi3y8o17nikDsIimzN99PmDrHKXegI+
         3qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=N0Qe0/tosYxI3tOzxjW+LwERlX/PRXuaKAfoO7/vG3M=;
        b=k1gM/hcIcqJJkCdQ905DDLt5PIszp9JFq0SPqBVjEy0m6ZFhsqOTcJl7JS0D1HwMt/
         Ik1saT8pa2bjIwzhgD2UmcfIzFv3cvZ5ac2tmAd07zMamCPKRfkkY+MS7e0In/2VwL16
         xU28CMpOW5QTKkn/8zRDZO33Ym7VwVYgQL3rIAC8N78tX0o3pcF95yjAgNFk2+wCFj6i
         diYy4+BgbQ2tlBGYfWZdvHgVn1GWOxr/lETD1dAsR7c2Iw2BnoNOcs/Lq2VOnbUmFJ4h
         l3qgqdbrYGkcaV3/WTUwwkWDZNjOJC0DbEdYd/qAyBCeZsPTxcBw++vvmGIhr37sy9SZ
         tKig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bxbBe6cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si2346501qtb.382.2017.09.20.11.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 11:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bxbBe6cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dujsq-0008VG-MR
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 14:38:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dujrz-00084R-PY
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dujrw-0008ST-NH
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:37:11 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:45350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dujrw-0008Qo-J3
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:37:08 -0400
Received: by mail-io0-x22a.google.com with SMTP id g32so5685335ioj.2
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=N0Qe0/tosYxI3tOzxjW+LwERlX/PRXuaKAfoO7/vG3M=;
	b=bxbBe6cv3VrGr58o6U8qNO1tQJJFLizCP8nNJbwoYyX18UpwoO8EzkT2aqOFt4BKpl
	yFROvNrAvP/cN9ictRwvDSlplfqyYM5Vq7JhHpdOIHfoGLpDr8aWTse51AvjZFkFK/dY
	vvHY02yly43ySqGALXIOmFMQ3SINlEhB++HII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=N0Qe0/tosYxI3tOzxjW+LwERlX/PRXuaKAfoO7/vG3M=;
	b=mOMqsFYFCQ2pWupvr1AmSaZSlNiz9x5FSEQcx66l3MMjgJy1jj8g8KYKRI7GOLEQcU
	HK0shqx03jE03BCt5mUpxaQ0TmGru+2hYtetmjht0Xprv5sYh3/r2p3kdQuqn4LgT8jz
	X2ZvM4z8a5eCwaMG7UsDbw2p8ywcVjia6X42DKYXVV/1QfQXg9fuNR+andzV+ilgian1
	tQEV+DtcZmBloTTqp/2uRrwP/GSalgjRbtLrguUCP7FH1Ur4+tXsk3WTt2ObNqsMsDOB
	03lzDrqrmObRGpzEL6xdWq/pwEegu14dxvCLeBPodv8pRlS1wt2sGdvXnwlqjeHoRfU5
	ugZg==
X-Gm-Message-State: AHPjjUhL14cLAFSeeLk738uBYsu9Fov3wB+w7ES7/Ap4GB/RQ2xeY4oD
	prP8xDi/iYA73FcMwuUDMh1ixw==
X-Google-Smtp-Source: AOwi7QBUXxbxRk9ZlInhvVk0jkekzbjWRaGAa8V2q847X8WmzchpjI4fcnY6aookucpBRgoyJ1CZ2Q==
X-Received: by 10.202.80.146 with SMTP id e140mr6665278oib.147.1505932627633; 
	Wed, 20 Sep 2017 11:37:07 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id 207sm288565oib.10.2017.09.20.11.37.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 11:37:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-19-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <362cf79b-6d11-53b0-a396-f010e47a337f@linaro.org>
Date: Wed, 20 Sep 2017 13:37:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-19-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 18/19] nvic: Make SHCSR banked
 for v8M
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
X-TUID: Y0eU5ST6YF21

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> Handle banking of SHCSR: some register bits are banked between
> Secure and Non-Secure, and some are only accessible to Secure.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 221 ++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 169 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
