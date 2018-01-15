Received: by 10.28.173.206 with SMTP id w197csp2660545wme;
        Mon, 15 Jan 2018 04:24:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotLQcNbEAwhC1VZXK2BEoTq2n61en75xcxqmw9DTPuGiOHOBRXad3KH7GZZYoVhD1JQ271N
X-Received: by 10.129.85.15 with SMTP id j15mr21792761ywb.57.1516019041829;
        Mon, 15 Jan 2018 04:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516019041; cv=none;
        d=google.com; s=arc-20160816;
        b=yxaayq85tOWLPDQxq6b+ths+05MZnQl4r0i8yfQQhvWLh0nRpwXygJWSunMfqCnb9Y
         NCKLT2o7kyUe497M4XKN47hMXXitZmQ5+i2G+PqpTw5kTtTA4hL+9GCgsaNDpIkdHaOs
         mgPI5As024UDrzoF0ogqALcYOaGBoX9Mh+uRSXqg2VAe/35kBjSMErNLYNNjQDhtKJQw
         4MjNYmyXJXxwP3zR4mjJRsg57+TxkEC5O+xmuDb6Rx85YyGmmHSVVA+Gj2GLi8b8gv7X
         NmlzRdWiycFNbmOq0NquxUy1lc0OK9E32IP0mcDIqgN86XtEcAg5vQt9nZwwJzibt/SI
         HCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PW2VoJV0XebE7XQH/EQxKZBXY5oqPIsW3HmtqWM1AiA=;
        b=IW4pAhUQT3DmTcvxrNG7OYJ2VETiyOq4iJBEifxVqGcBTTjdLxSF4bz9uLyfXfKPyE
         drOHa0Mgz6OOhZBkdz79F1wUH4zPfmwbIpWjqkZNvZaoiKbCqFFRrA1SB1YzfoOoUqbT
         PMFppqQNRz/C7g1QZmX0Cah9z9Gk6ndMCH4ZTd/DBD1LHGQcdmrGwhoRZQ7NFVk4fNS0
         kfgOeDTq4ZyHuMxbUqtz0F5Y4d/HnuBgfmI8YRyQ4Bhvv8jslfxG9Cfa3GlvEPJacKHA
         rY4SGK2teJUmn8WWdj1zUNZmgzLgFe8DetIC1qGeHSSpgaUacHu4KyDnvLvAvHh0Qpig
         3JEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9HS3HME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m187si1207305ywd.618.2018.01.15.04.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 04:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a9HS3HME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb3o1-00069Q-8H
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 07:24:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb3RT-0005Fz-N0
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:00:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb3RS-0000ID-UU
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:00:43 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:42178)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb3RS-0000Hw-QR
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:00:42 -0500
Received: by mail-ot0-x242.google.com with SMTP id s3so10416828otc.9
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 04:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PW2VoJV0XebE7XQH/EQxKZBXY5oqPIsW3HmtqWM1AiA=;
	b=a9HS3HMEKb9HyJA33Xitzp33/p58RE5jGoSRRr8z9krGeNfNQTUZbshmxUp4YWnY+f
	duob9KJPcVOKKaVf7dM2jqTi5yY1EMfwWgyPDk44sba3VM0/SJWemfWpZuiixXbn4xyw
	Sb28lS30sGF5Iz5GHZ5fblnTxIbDGoRHqALR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PW2VoJV0XebE7XQH/EQxKZBXY5oqPIsW3HmtqWM1AiA=;
	b=WPOCK1DVGXTbPUl3UU9pmH7iowKvOiqI6SWIH4VioK6EkQEhIhwusQLvCy0mmTInEX
	hz3/Qg7PXa2WpbRbZM/BvX+ZUAinOYausp2AL+7q1bKkhyTukYP/cSumxiueK+we6Nc6
	sQGDrUlKa9cjOdEO+UXnk4PEvYv5Rx3/zLnNChghCi0Ei8LfmPaYFPkNBDycNbMvOwTg
	sq+AOYCrJdpusVw747si5tExU4eTT74tVXX3UYrvb4qa5mV+SWlTii+zX7qoZxqU+ll7
	QEDX9g5fldvI66qYic7n261E8Gdy+swc+m7Cv9jrsccCdWpWGaU2sBh6F3UL2C3fwUsA
	QSXQ==
X-Gm-Message-State: AKwxytcee4culQONUKcnk8YGXhyj6Jmk1v2QvBXiTSoZHgdR4jS+hx1m
	AtN+/E92MsgFXNplZ93hLjh2ZQ5qHfPYrdWZHHHD4A==
X-Received: by 10.157.2.8 with SMTP id 8mr2105371otb.116.1516017641983; Mon,
	15 Jan 2018 04:00:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 04:00:21 -0800 (PST)
In-Reply-To: <20171212143922.cl7wyhupqdopqcdj@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-2-git-send-email-peter.maydell@linaro.org>
	<20171212143922.cl7wyhupqdopqcdj@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 12:00:21 +0000
Message-ID: <CAFEAcA_SyTvkvrzi1c=wuO9O=e4nocnzw-wnuvr0TRZQkmnkaw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/virt: Add virt-2.12
 machine type
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vnh48Beu4qKW

On 12 December 2017 at 14:39, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Dec 08, 2017 at 03:02:06PM +0000, Peter Maydell wrote:
>> Add virt-2.12 machine type.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/hw/compat.h |  3 +++
>>  hw/arm/virt.c       | 19 +++++++++++++++++--
>>  2 files changed, 20 insertions(+), 2 deletions(-)
>
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks. The rest of this series has issues but I'm going
to apply this patch to target-arm.next (minus the compat.h
change which has already gone into master via another commit).

thanks
-- PMM
