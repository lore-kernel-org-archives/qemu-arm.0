Received: by 10.223.172.38 with SMTP id v35csp1209888wrc;
        Wed, 13 Sep 2017 08:58:41 -0700 (PDT)
X-Received: by 10.55.86.134 with SMTP id k128mr27179655qkb.56.1505318321574;
        Wed, 13 Sep 2017 08:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505318321; cv=none;
        d=google.com; s=arc-20160816;
        b=IfwRRQnSNnoULu1Z/hDKPJIPpabOlxbgq/rla8qDH4TFgcXwlVYZMN0czyiR0fnm04
         GbqTzyLmopF+OrLu53VLo2dXQBbgubuCPIUBEc+JtCOh1bW8etjHk5e5yuKmvV3Wjhbm
         bJOC4qjlhsmKrZHgWpiO8XsIgfRdRkGeYFzB9T4M0ntFK8dVUMIhIKs3A62c76/r7ZHz
         eRKTn9j+iDw8Aox1XpOi9Z/7jTPt4fFrBTAf+Ny1y44icyk3uQ5+VSqEoLgewC+rcBhu
         7Z+7ZeXeaVwa454GLxDh3yOX9uWASFZAQ4iebI2wBPx4rbU2vLCTTlZhwvxw1AcsRq9r
         Qj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Akl2uFUSU9ah4guD5rZgWvIevka664gd9mk6LT1WB5s=;
        b=V4h/pr2/ZOkyG/g2xzbkBaI0t4F9NxsiGg+b2D/ksuGARDWB9iBCBbDM/UcL+Cl94+
         HYVaalbZtVKpycjxD2tD0k3rDTuE7DjS1zcHl9S4sbIk1gW3bfIWsiI48ezOKJatvuz5
         gBlR7AcjtL5hpZVyca9qCegDchIkzpG3XGxQi6d3wYUJxUs0/DWTD92EJ3ats8mdjq6E
         az2CIOf9Htst1QByqUcqgW1s08bfYV0ph63RHx+YhzyiVsyiH8vnixG74JIxpdfZZjAz
         suy59+ttcIObAlv4oJlxa9Ueg2KBSLRZ45eaG2VKP6XmvW+t+MChYi9s0xWhRmGwZLuG
         Y7AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WvgcKOqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si4604591qtd.276.2017.09.13.08.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 08:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WvgcKOqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsA3j-0004Yi-AT
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 11:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA3N-0004NZ-3C
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA3M-00021w-E6
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:58:17 -0400
Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b]:48068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsA3M-00021d-8D
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:58:16 -0400
Received: by mail-pg0-x22b.google.com with SMTP id d8so1151316pgt.4
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Akl2uFUSU9ah4guD5rZgWvIevka664gd9mk6LT1WB5s=;
	b=WvgcKOqE91HA4+2WQXr3gVJeanI9LcQGrZGNBaUQxjYjND3a0QfqxDDTFD0aMoo0+k
	2fm42lxDH9rilZscGIHAox9ynuyn+7+So1zjqWxwWbcmU6RLuUacg9aYdYjiQp6h9pJN
	iiTsRndUZEMDEFDI9LqYlH2FPxfck3cAm+j+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Akl2uFUSU9ah4guD5rZgWvIevka664gd9mk6LT1WB5s=;
	b=Osku3r9b9vBEyc8er30FS0xAzyKFhu6J3kkK3GFebwS7/QqaH3A9Jp3/5cv0izyNmz
	fH2YE2WJopx7REUkVUlaGNtnoWeKVaHMylpOP3wrJoFaRH2hwhVLj/nXvsha9D+96YbM
	D9fe838zS7akhPjM9szhmV20Qo+cv9KbsDGm68I8OnNgSsKyrXTenWZzEAfx+Fnk5YGs
	xSFP9oymRRq7yl35q56DhgpDMnMNAWeK3rMGrtb4Iowr8857a5XtiddVpDLCydwOveGV
	zNYCMFTBjHZzcxCmF67i2JK65ZYSs3WUsTD9FgSfbICxO1o3jveDLOmiFl2oqUqFBrRn
	nQkA==
X-Gm-Message-State: AHPjjUg1315DW52EgTKdEAdSTAzQEj0DMvLXpM6Z6dEOoHvFa0fbVoZI
	1oL6dPM9z3/BOY6K
X-Google-Smtp-Source: ADKCNb4I3dK5XBBNoSHH+M/gOXca7B0cIZcV5PD6fzXpT+QipwdmIaLGVXU4C06D6/d+o0qhDusKrw==
X-Received: by 10.84.217.86 with SMTP id e22mr20722525plj.41.1505318295308;
	Wed, 13 Sep 2017 08:58:15 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	d186sm12371548pfd.117.2017.09.13.08.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:58:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e485a4-6557-717c-fa18-7e46033f8f73@linaro.org>
Date: Wed, 13 Sep 2017 08:58:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] nvic: Don't apply group
 priority mask to negative priorities
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
X-TUID: IX4TEhtlo07a

On 09/11/2017 06:52 AM, Peter Maydell wrote:
> In several places we were unconditionally applying the
> nvic_gprio_mask() to a priority value. This is incorrect
> if the priority is one of the fixed negative priority
> values (for NMI and HardFault), so don't do it.
> 
> This bug would have caused both NMI and HardFault to be
> considered as the same priority and so NMI wouldn't
> correctly preempt HardFault.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

