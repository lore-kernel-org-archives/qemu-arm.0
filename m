Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1534924wrx;
        Sun, 17 Feb 2019 10:19:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZbSAiLwVQWGewdsQQhSpyCdD9VroS9AmjLg9pkMC44uVaeSW24Rk1U8lL4xSJbhGqoRFSV
X-Received: by 2002:a25:e094:: with SMTP id x142mr6671174ybg.270.1550427575348;
        Sun, 17 Feb 2019 10:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550427575; cv=none;
        d=google.com; s=arc-20160816;
        b=c/BEmEo8vTtUM/6q1SbTHmlHO2bRqe+s+vMJRJ5bd9umHq9q7WZcmJ4YFNwix7PiAc
         dArf2AsplSPhq5AyYKeRA4tEbS0Kbgi4zhXfnnSQbfimkj3FBKV+/q04L3InQae4QRiY
         Y3MeZPQ92KYd4HVLVKnHAsvmkR7/Wmj23V3vJmoEBx8keI9kaARFzrS5z5aEsm/L+0Jv
         xswy60+gr3JfAAmFAR3iVL1Vd2WG45MTBJe+mUjUXsUq79BTl5b2wOMVh9WkBYoZb8xK
         dogFbNniDpoOzA0ruS7n14uljVhLCH9t87Ee5ja1vjr2cpeLIVZkyNJGlWcez8RGciki
         I7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=bFPZNxQyAODQQpJqyaSuXkP0XCbwiOIdNpdbtsPMR80=;
        b=L9SHMd/DJ34YYoHFAvQq59RRq23krHLbAqVEUX0nyM/dMsoD3NzSRPNBs499QFLSEE
         2diON9wCvMLdmNE87HKefGrDzlbbhUpml1LpeVSFSkxFVR/7RgryMkpsE2Lo6ESROGu6
         u8uO60N28gRnzc1a4mUwrG+/MwHHbWQ9FNQaKCRP6NY/fyHpWYjxSyEDPacU25p3foCs
         EV6YSxluAzWHtQOpY0i7PXN72Jr1cU/mXNdVRDESBt85AudDjK9EanqLuaqHhxW0WEt/
         TVdihqb7M5U1E7pRGmTt20gLpjkrgXcCdORBpcgZuTmZ6yiN6Z2M/XqhD/TRM01boJrZ
         Q81w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cu2eDoXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w193si562599ywa.205.2019.02.17.10.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cu2eDoXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvR2M-0006Ti-RF
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR2D-0006Ta-HR
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR2C-00084n-5Y
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:19:25 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvR2B-000832-Qe
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:19:24 -0500
Received: by mail-pf1-x444.google.com with SMTP id n22so7368913pfa.3
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bFPZNxQyAODQQpJqyaSuXkP0XCbwiOIdNpdbtsPMR80=;
	b=cu2eDoXs0cmaVmPj0Pk689hofzxgDr1xsYCuk5Ez+f8BSU/CN2Pj3R/llacdcls+o0
	aVMGtY6967Uu/OVganQUz8Jl32p6k/ZDqQpgaqIX8+B1RFzyh3xfW/+UVDQ8XgpMadte
	pYU3mH9GPzx99KaRA9GK5bH25bYPXCR4jsK2IyKS4TS8v2drGZAt5M2gvU6F6PGGDcd9
	O951smix4k3iho4R4+kGuI8L2dcqsD4XcxLqjdqjO3gYCS4hOXK6IPYvGzmqSgDTijuk
	hem/vlInmz8y+IJi+jv5Xpf2mkBEm/9OAu2iGY/azPBGOaAhh3jcqzFHo61PIVwEYVKF
	EySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bFPZNxQyAODQQpJqyaSuXkP0XCbwiOIdNpdbtsPMR80=;
	b=o/kDiqFOwBZh+SR+9kAZJRC+Aa+uaUk3HIx8Inbf2lBejvLND5KDkem35qhjPqAaPP
	muxEEzYMT4UduumujrFhWvNz8nohjwg8KiJ1TOZ6xREtqoPveHt6CVK3aH/wu8PiBaid
	GVX4xxwspQIfAH2hCQ4ywjoh92Wv3C27pCaQoEhuxPl6uTboKxza+LkLD8dqs1dCCUwF
	BpRRpGw/BoXGaQujbnZ22K8o+Jtl75GZc+TY9NSwGXVUxwHqtS9JyHkqAMc9xhJZcplf
	wIn9ZQyVWq+NPQEwZw2hXEeJbUTO3PKU9eUOlfAZDZCOeII6zgR0KXzG8dNMWQ3lIEhu
	j9yQ==
X-Gm-Message-State: AHQUAuYX7iyfz+jhu5bGcLUdUqw+WgSpKPMBL7rVRun0tlPdGeV7UQXN
	tDVGfU2/fF2RFhVXyrwqzH0+iA==
X-Received: by 2002:a62:e04b:: with SMTP id f72mr20587165pfh.41.1550427562917; 
	Sun, 17 Feb 2019 10:19:22 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	a20sm11675745pfj.5.2019.02.17.10.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:19:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-12-peter.maydell@linaro.org>
	<4e8fa2b1-5cfe-152f-8fab-13bb8e3ff440@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <21030ec1-6ad9-0c0b-f654-e3071e83d463@linaro.org>
Date: Sun, 17 Feb 2019 10:19:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <4e8fa2b1-5cfe-152f-8fab-13bb8e3ff440@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/14] hw/arm/musca: Add PPCs
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
X-TUID: RAMrukGW6gE5

On 2/17/19 10:14 AM, Richard Henderson wrote:
> On 2/14/19 4:51 AM, Peter Maydell wrote:
>> +    const PPCPortInfo devices[] = {
>> +    const PPCInfo a_ppcs[] = { {
>> +    const PPCInfo b1_ppcs[] = { {
> 
> static const for all of these.  Otherwise,

... but of course in subsequent patches you put non-const things in there.
Nevermind.


r~
