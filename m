Received: by 10.223.172.38 with SMTP id v35csp964828wrc;
        Wed, 20 Sep 2017 10:35:59 -0700 (PDT)
X-Received: by 10.200.42.99 with SMTP id l32mr8734515qtl.121.1505928959802;
        Wed, 20 Sep 2017 10:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505928959; cv=none;
        d=google.com; s=arc-20160816;
        b=RvJAxWp5xOPnG1WT6dJ+Mba/LrMbkupsXtbOBEZPX4Lb9g1Qx95uzPxu5uYYiE22yX
         kM0T9jZPyq3FslOQxwWap160FtB6C/ryOosmAonEi7ZZWmLEgsPwkd44uRNbI2LSIco8
         2RLDCTwUmT0F9Fu/lEeupq++stZL/whMjIDAPGT1B7i0N/2xoY/xDvkvXwe0oW9Al2kn
         unmKLfoFDT6knPrdQVB6j1WeaFRCNafPVzrbKGIeRY+JsDKR2kChDMrWtkh4mgv+ImvO
         sOcBWKxPgPZeONrycaZetDUBGHqSIuiaOTvyJif8XnlB73PFD9z8UqHVAvq8GG/gVrbh
         Xaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ZSZVdBwHed+y+0xyn11toDrUQ+YgO2JSf213scHH+sQ=;
        b=g2CijVzNODiux3QUV5Z3pliJyneU7ukXBnzCy33J0P3moZflYMqyfkk/d3Kt43uJP4
         NL1AHE5sNAVhd5p6AnJkxuJQtJEyfLBqB48b8h826hTvsS1Rf27rU8D10U+f7e4yr2Ot
         CH92/zq90kbm/99w8Qh4+sC6ScxnjKcpso4GL+KtJeAgLo5yJRLsZwRo06yD0fHnGUZM
         ssKF249T5BKXXXzxgKN09X0KL1DhkF3suvl+GZdRkfO/hXH6MCrQzVbDwNv11sQiF515
         B67jy5e/JD2x3/Z1c7IvoAr80CWELdMaT8njgwuD4d2hqaYXu/G+xU5IKCkE9d7IJ6Tt
         nbVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aHqbNAw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l50si1590433qtl.0.2017.09.20.10.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 10:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aHqbNAw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duiuj-00018s-FO
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 13:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duiuW-00018T-W6
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duiuT-0006O9-NL
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:35:44 -0400
Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f]:54742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duiuT-0006NZ-8W
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:35:41 -0400
Received: by mail-io0-x22f.google.com with SMTP id h66so5208733ioh.11
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZSZVdBwHed+y+0xyn11toDrUQ+YgO2JSf213scHH+sQ=;
	b=aHqbNAw7IUYxLex1nBs/KnVATRSQgHc4s80JTM2pjwOUDtpIefJ6K7J0ciK/3EVqHg
	kK4sjtDzExdtEIsUVtIMJEnUGINVUV4O1LEL+uPamCsod0cegBh6Y+6IjEilzTbLK0/H
	L20Bs+KBu9EVL5yxt3/y6HZsNQTNh/ITK1zyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZSZVdBwHed+y+0xyn11toDrUQ+YgO2JSf213scHH+sQ=;
	b=eRBW5Kj7rwYnFfhDxuxJ3r0cal5+tW8bK0YuHryx9H1P2zrPhISQN4bsMIJHaG58k0
	xs5dslAnPo/Y4+I6fC3Sa8MqklMeSRe5uIfMOlv4Q1itghVXYbk7b19v3l3iRKrZzLnP
	Tu5MMEtHQE7uASW/yVPJypDMfKLbd75NbK1gAMPooxkrmt3dytpOgBsBX9OBtlebK3mn
	X9pRDWlbbbiCCGzmjTlIG9JSSe6vQa/1aIbIR94FH2PRGjRJi9QqAq5G0pgKXRTFm2b3
	mhp5Hzqg6OwvofzVlkYm7rco5TXslyMr2/NbyUiwYRchKxpLEJ0R8MN7zNv3hZe+cA03
	uPLw==
X-Gm-Message-State: AHPjjUjW7nnVTduv0MH5LKtyGXcT/YKxpxk+qXby8rwQLnBbdHlKzsoM
	1fO581psdgdXgXFFx1HmFB5N1g==
X-Google-Smtp-Source: AOwi7QA1dslYy55osmWEAoQmstcueqEbPdMDvXLhgA2Lmar43Uh/x8qFiP9dUJ9ykXRsvgUsPjNdlQ==
X-Received: by 10.202.93.136 with SMTP id r130mr7421423oib.144.1505928940331; 
	Wed, 20 Sep 2017 10:35:40 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	y196sm1568704oia.44.2017.09.20.10.35.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 10:35:39 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-17-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25250048-7930-e084-9ab7-c899e4f9bdb8@linaro.org>
Date: Wed, 20 Sep 2017 12:35:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-17-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/19] target/arm: Handle
 banking in negative-execution-priority check in cpu_mmu_index()
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
X-TUID: Il9eCo5SCCJ1

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> Now that we have a banked FAULTMASK register and banked exceptions,
> we can implement the correct check in cpu_mmu_index() for whether
> the MPU_CTRL.HFNMIENA bit's effect should apply. This bit causes
> handlers which have requested a negative execution priority to run
> with the MPU disabled. In v8M the test has to check this for the
> current security state and so takes account of banking.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 21 ++++++++++++++++-----
>  hw/intc/armv7m_nvic.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

