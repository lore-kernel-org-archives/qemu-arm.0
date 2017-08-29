Received: by 10.223.188.70 with SMTP id a6csp6165787wrh;
        Tue, 29 Aug 2017 09:04:44 -0700 (PDT)
X-Received: by 10.55.20.212 with SMTP id 81mr6009265qku.213.1504022684248;
        Tue, 29 Aug 2017 09:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022684; cv=none;
        d=google.com; s=arc-20160816;
        b=NUB9AcP166ZIlsodXkVb651NmyRYsNpeMfbImb4szX8sJmuTxDN5XLkimIMuI8NwRT
         ulVCPSG7Yigc29qsB+EYYv1vlNNteqgiKBLMjzVcb7lnSzyNuDl7DOqM8MkdCoxL87WN
         yQZrFZawawfAOuZN+261EuYjzZ8nXBnAxz9ZMQrv53+blSe6D1leZCIlwkNwI+he2yzy
         fC19k+1vKOmDw80YR6pnBRmOwinoFG7IhwAUol9mEStjSDJTFWwH2TCxxt6JcnyrwKM7
         xYzXaWIsWJAhHLr+ZZ8EI5mebpdk//8aZAwLcWiAtxlCeydNv/CqqtzyAPJBfJdWGc4+
         S0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8UBmNmw5bz0k4tqdgk2sZeW+QEoyzT2JUfup9LkW6Jk=;
        b=HrRBqkZ3zgoldgnYQm5io0aPlATGZpgP665K15I+K8WMAMVsPTTcFRyUgW7hjwEpq3
         F6KkK4YcGUGow0U7dgLyD7KJWLjPY8zp65Yv8hiqm9lEt/AmkdvYi9v+CyTkLHLAUALC
         WXNZXjfrjb6PrxRclG3g5Izqz6xbh1Cj2K36t6AX1ymYR5kkb66eFODTWDZN2HVXKGWt
         ScKR+1hY1uVEIq0YzEVNoTt0vmJw1e2fwc60+9hv+iLmHKZdKFfgNKT7PDKwNFK262jp
         yabB16KMBvOiDYNbMEKaIOMfKjxcICBkDTdH74cX8YlKdc/jjW0/Ho62W4Q9hQDT9Rb8
         z0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZWBZ2LXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si3269536qky.270.2017.08.29.09.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZWBZ2LXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj0L-0007Eo-Oo
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:04:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiyA-0005hU-9b
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiy6-0000dE-Ea
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:02:26 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:36647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiy6-0000cf-8r
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:02:22 -0400
Received: by mail-pg0-x22d.google.com with SMTP id r133so12001802pgr.3
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8UBmNmw5bz0k4tqdgk2sZeW+QEoyzT2JUfup9LkW6Jk=;
	b=ZWBZ2LXex5VIpNe/0zaVUsZo+JLTHa6/gBrNKZJQYcUyORnrLqFsofDAEK2Gf512tR
	JCrL6DJS2X7TV5/qLRy/g9Iz3J5XEb/kVr8CG8kS8H67FOuMOQWYfTiwjPId94LBD6GY
	7ZG/RSizHVyEyQa3IjNkS1vUB0sD24K3pIPg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8UBmNmw5bz0k4tqdgk2sZeW+QEoyzT2JUfup9LkW6Jk=;
	b=WU3smHADBdon5d9VVGbHTGn8xlEDfCTWuC4cs6Y/TZSSefixAzGzaY4cx7tivzu+I9
	3+sU15ZKCG5OceHHkIDS6ATYuCxj+j23Pyh4uQX6wCykZj2fCiSDuPOVNFa1/NojIoKT
	okvGHpWMs9UGMb4YUCXmCC0LZtcxmcfX2KHcHV4feznVI6ChwU69dSn4PD+dE8ViCBBj
	AVCVuY9psmgSOVgn1Kjx/AGBdDYgPuqdVUwF+v36Yh/EE0xvEd5PdVs3EqP20eYeA+wh
	4v3XAWWY8vdbd0KyU5Zrre7WjTzYYC4NsRSwmi/nnDtaLK38aXpP6ylXeGD+fdFYPxGC
	PUhQ==
X-Gm-Message-State: AHYfb5i6iXvCZqVZNPkWikj9hVY3PhIETrsa+TR9AYRJs2fBz2rLdqLh
	D1YuOW/XF+ToEeeK
X-Received: by 10.84.215.206 with SMTP id g14mr997730plj.345.1504022540962;
	Tue, 29 Aug 2017 09:02:20 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id 73sm6640788pfu.3.2017.08.29.09.02.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:02:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-12-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f8b56f1-7bd3-6485-37f4-02de5af5f90c@linaro.org>
Date: Tue, 29 Aug 2017 09:02:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/20] target/arm: Make VTOR
 register banked for v8M
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
X-TUID: rA79zd51fFyQ

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the VTOR register banked if v8M security extensions are enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  2 +-
>  hw/intc/armv7m_nvic.c | 13 +++++++------
>  target/arm/helper.c   |  2 +-
>  target/arm/machine.c  |  3 ++-
>  4 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

