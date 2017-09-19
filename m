Received: by 10.223.172.38 with SMTP id v35csp5275139wrc;
        Tue, 19 Sep 2017 12:00:23 -0700 (PDT)
X-Received: by 10.55.154.4 with SMTP id c4mr3397172qke.131.1505847623318;
        Tue, 19 Sep 2017 12:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505847623; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnTtdzo9IKJ6E88rQcVhrwS4r9B1/sIPaezBU4e1FaBvZdsDZO8Mk8vgJISr6ZSaiX
         zP72+PkQE3mNHaBgsMTRWhY6RhR4NueqrYnywqyJBb657OR8Ii4Qji1XnZQdQMxdtN7s
         xSAQgcor6Ax28LiX/sU1t6dZv/p9LOHLa4I/ZBrv/UQimX1gFL/ib9hIgQN/KqgzJ9WJ
         yibcJW3oBA31mOrXE1pDl7xzV87YY51ymvcsCqyFKm/AnyRBeRbzDTmEC0UlDrcmIm4u
         HdLHZmyBPXGr3tyjd8p2gmbS4oXeYWFhpkmRGlOpbcB23eBnDufqgTVZMwHEw+1Cwbat
         O4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=YgA7wiQCdqLVqmj6dARbExycL4RfW7cQIjtFbvLZ/8M=;
        b=VvPDYHuG0fLxFNnhElrezUa9u/1/a7CP0HY5TQS+/IKEON87QU8l93oXz5Wk18Tmsd
         rxlINrkUwQxxTpxaSlR+EhsyJ2IewUtnE1ITgWT1mkPzsQ3K7e/6NaVYyDR8SVrf2rB9
         64yPKH5KqfBzF8WViijXxI/UiZ4cxYsc5N/ptjLoFQHp5mqSySSNl3W5nmLEn+ii0sbW
         5kVqhD6UCjYQFMLC5EWP6daDfoudehZUaojDVIxyuQwv53wuV1ZT/NU/aHl2ApFblVUO
         GChm8QvaoLAPKkeJnpUgXEM/CgsNE/37JzyJMLVAAPD67rsMebyiM0NcSI83asshxpLJ
         2w8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDeRGKfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si7044qta.404.2017.09.19.12.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 12:00:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDeRGKfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNkr-0003yi-2T
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 15:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNkg-0003wh-Qi
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 15:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNkc-0004Ln-RY
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 15:00:10 -0400
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236]:52681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNkc-0004LP-NW
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 15:00:06 -0400
Received: by mail-io0-x236.google.com with SMTP id i197so1388564ioe.9
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YgA7wiQCdqLVqmj6dARbExycL4RfW7cQIjtFbvLZ/8M=;
	b=CDeRGKfBHOQCVSfnBTnOTWGyU8JnL9he+GVieApyhaNrBx3+ExudQnyiJzvppenyPG
	e0OIB8KdAamPLwEshx99U/+LbAx5XlpI4ZoJ0q0wnJl6yyNm5+IY7bLZ3vjiUH2smHlv
	3W8cXdJir2Cw3er1ZKucDufivYmFZhRsh/Els=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YgA7wiQCdqLVqmj6dARbExycL4RfW7cQIjtFbvLZ/8M=;
	b=uCeTfWZE+X4i0a2TkLxakXqPEinlb9aK1Cz5Z5YlEulqhSBr2n72+/+VR8pouXJep+
	rWaOM2WRCj/+xzGRsL/ImAX/h3Nf1bYEaj2JtzfdomxzY0V3R09v2eaIXX6IPdNmiBt4
	RMGwchzP6Nv9mfTQPRNwp7yQRd9/T3VTAzuQXzvnoluvO/TwLCY2wS+7EQbY+TeMA+wM
	1ijMi6aRcwddVGyMsnMcNiDvzWIJYd79FPAK6zjuSBoy5rg8mMSLPnXBFi8ibyYavzTz
	mT/1SyRvyyjrsE8csZH0/2VJD2qwFgO//k9Pvgqc1SRtryW+FAD4O7QZuFANHfUi7Ak2
	Cuwg==
X-Gm-Message-State: AHPjjUiDQlCj1DcD1ln941ugjiW/QeH5eUGF7f5GTpVYHg8nRFlzEw2S
	bLLWtftHL020x2K3/hqtZv9hMg==
X-Google-Smtp-Source: AOwi7QAlP6se6aZDc3j9E0ghk8TrlpGs8CydK9CQKrgmQHH/xHCOe76QzqD+XHQ1/WQg4TTiajuTJQ==
X-Received: by 10.202.234.3 with SMTP id i3mr2564121oih.318.1505847602430;
	Tue, 19 Sep 2017 12:00:02 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id r5sm9258oia.16.2017.09.19.12.00.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 12:00:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-15-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0414513a-a050-f16c-94b4-24da7dd49972@linaro.org>
Date: Tue, 19 Sep 2017 13:59:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/19] nvic: Disable the
 non-secure HardFault if AIRCR.BFHFNMINS is clear
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
X-TUID: wkq4B8s0C7VL

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> If AIRCR.BFHFNMINS is clear, then although NonSecure HardFault
> can still be pended via SHCSR.HARDFAULTPENDED it mustn't actually
> preempt execution. The simple way to achieve this is to clear the
> enable bit for it, since the enable bit isn't guest visible.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

