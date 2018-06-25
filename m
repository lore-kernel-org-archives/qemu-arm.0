Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3709341wrq;
        Mon, 25 Jun 2018 04:48:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfKx3YOR1ldZuk7+rVPdUvDIlgzG/aLbp/KX/xJDDC5Z5ZeoHBoFxTgPX0RWrdBpTVil4qG
X-Received: by 2002:a0c:b5e9:: with SMTP id o41-v6mr10184937qvf.189.1529927310032;
        Mon, 25 Jun 2018 04:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529927310; cv=none;
        d=google.com; s=arc-20160816;
        b=AznO1YgyccHv8BDjtcCCdG8ItKSu4qbvYgRAp5y7wPa8xyxP3TLp8DqZK8KaQrLY6X
         W8v+188znoPeM2uua/I7kJhm9QxwJTJKAc+mBl5U3QEhoFlqKpdfEFeqXqVCyvt8jy/T
         ubhuKJMWjnlPhbRhEb1ePAd0zy8EkWoGpXLL4OJWStW2Xt6gKGjW+dG6gAiwHEqPDKNJ
         ALJ+VnOPbI9VBsU+YpJ8mv9mLdmIMvXXSUxiPMl7kYmCfH8I41MrGCymAt66pSxcEkx1
         HQeZt6CKkGR0VPTIPH59X1B1Wm14ckOs8b1lckuYeAUtCMcKutUAm9q3ge09IYX538Cn
         SCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9YSWx+sGUCsWXgQFStSzdJgz06ECjUzAaslYD+E22MQ=;
        b=VTEJGvW9d4LjB4OmEQ7KI+0OGtNUABbX/J1BjdDY2DNhdXkcOZSv/PZwWY8S61CWZf
         DOSgybmPbHl/+Nut1hKPaKP0k4OgiZnCEWL7zWY/U0buz5X6Thpf9VtyZdLHzSRcMIM1
         quCItLcmElSqfc8aADB5YUKLmOORCS7GQvIbPLBjA1rHR52OlBWDQWqOafNwWYNNrEVb
         KWExKblqnm7UooH7m3vRiY3b9OkM2Idpwi/E2sX8S/eKMQe/waCkR0R4Gj1KDt8JEno5
         1V9EHCMy//V6mQV4tmyTfiE08XxD05JdJa11seqC1vS2X9YuR34DibDnKTA59Vg2j4Dc
         UKRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jw5KQfWt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si2437063qkc.259.2018.06.25.04.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 04:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jw5KQfWt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXPyv-0004ju-I2
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 07:48:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXPyc-0004gj-RL
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:48:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXPyc-0007Gi-74
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:48:10 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXPyc-0007GG-0P
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 07:48:10 -0400
Received: by mail-oi0-x243.google.com with SMTP id 14-v6so12177603oie.3
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9YSWx+sGUCsWXgQFStSzdJgz06ECjUzAaslYD+E22MQ=;
	b=Jw5KQfWtN30CAm9r0t+/grCpk2/hbLRMR8d+v6pMg7GJRXfbXOUo9LVIihoK3tw52k
	yF3nWcY7fLVf86b0HcgIKrusLcpa8OUan1BjpZinS5W0MPvRLIjKh9rprmGpaTCt4mLY
	AFib1TIM5xY2V8Qu99zLi+ICWrhZ5+QbOo6g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9YSWx+sGUCsWXgQFStSzdJgz06ECjUzAaslYD+E22MQ=;
	b=tMl/vUHIo+oSl8nB3Eu9AvJKhsFnLHOm0h7N3ctt1t2dKQS5CQeL4tEpcTwi78cb3J
	pj6+pPbaJ+r7C8NHVqYcTUdzOqjIn1L5DORr0Jn09JGQHl6mu8DRtlbuXvFvQCkk8ZEP
	bDsgHs6vFJAvEliXgKjQHRn3sWnSA4CwfuKQSA+CaaGFwbz58PHAazD+GSJVzZW2Q8Ck
	utZY2ZhBhxzD9psTQQAW/3DC/ecXhOzS8RgGBPoGjSCo1e0ZMJoDmH2pjGGc1WzM40zf
	TE9m9oWnVBUHhfLxCmjiWOcqpyLtM1L8gFwMHgynYinPhV0zUHsfOKavflsc06LhwZeF
	6mPg==
X-Gm-Message-State: APt69E2l15kh+ECSYaTy16E9wsw2wkDytShUpi5qUD61uZZbU6wMxzrZ
	c6qZ+4/qII2b7POJJmQmAsCzwLwrPltKFWUGXJkIBw==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr7030643oib.252.1529927289264; 
	Mon, 25 Jun 2018 04:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 04:47:48
	-0700 (PDT)
In-Reply-To: <20180619093124.24011-4-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<20180619093124.24011-4-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 12:47:48 +0100
Message-ID: <CAFEAcA9XhPug6bdPo6Z3-t_1ALVyqQQx=AiGrgWsKfX9CMedQA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2 3/7] vmstate.h: Provide
 VMSTATE_UINT16_SUB_ARRAY
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qf1usWGkzwJ7

On 19 June 2018 at 10:31,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> Provide a VMSTATE_UINT16_SUB_ARRAY macro to save a uint16_t sub-array in
> a VMState.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
