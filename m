Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1850797wre;
        Thu, 24 May 2018 06:14:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIH1jWEBoTMpNSktba6JFfKagR/LuwDBJorklWfBiRhgE+/H/iuLMzw4+tSbwzCcI+G+tSD
X-Received: by 2002:a37:6747:: with SMTP id b68-v6mr6272959qkc.108.1527167697996;
        Thu, 24 May 2018 06:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527167697; cv=none;
        d=google.com; s=arc-20160816;
        b=wGgfCdXavHfOQJsae1aqA9tRgYiKym4jKhWTrBLOlAmsEz4P+QTGQovE6en7oxxqf8
         6maqQ2MjSNuFEM2BPAxu6eTeMd0Vp+N7oNY8TZuHTqJzOZBlJEdBQhq9znoTNB0E5U5J
         wrlPWPSxKOHrfMcX7tVMFawrAptFnPDNWXjqkCOccsY4N8yd9gM9eZHXQtaWFFPHTPW/
         TQVQfEydlgsDuQjIdJ0hXgeXfbyi2SP5YfczVE2m6Cl9FXx3O4LWy3yPKZyefcKvboFS
         VRZTZPwaRal7+BHeW4xNtDrN0D6ZYBURFAFSJMRZikbpu2vbbxtehLdOy5r75hAqJdtD
         OEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/UR+PwFFJfOxXQsEtEh991bxMxtQdjDmUdGBHp9b2YA=;
        b=QB0gnFxX+kW2XPosNr0BWbwUiK4W7BjXgstRd8BBG5hKXt4WC/b5L7qR38klO1H3wg
         zb6JdjU/JLD3yTNhSC/o8E0J1wg+GLycce+/aevHt3OragltedQ8qxGqjVcpoxaeErEU
         ugNqPrZw2m/ck66ju/J+4Fjy/gHhXyg30qEJDQi3DVzypeouBIwEUybupbyUSqPUut/S
         8fkXHX3MF9nnOdkA/XcDhRTV/LltGAC1I3ImSUvM/Nw66M3iMhmbPt/qoupLatC1B24B
         txZb2mcjwdXz5yZDj4eX/FC6AVGWT6FxmuZfOY9nmWwlbWeHtQgOpd77Ky8b+lPnq9st
         EsJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y5KoYyjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q88-v6si2007917qtd.264.2018.05.24.06.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y5KoYyjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38655 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLq53-0006sh-Ew
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:14:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLq4r-0006ps-BI
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLq4l-0006dy-Ra
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:14:45 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLq4l-0006dS-NE
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:14:39 -0400
Received: by mail-oi0-x244.google.com with SMTP id p62-v6so1375259oie.10
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/UR+PwFFJfOxXQsEtEh991bxMxtQdjDmUdGBHp9b2YA=;
	b=Y5KoYyjvTZnbN+ISj/c9gUq7VFShUDX3nP1SI6DX9SL2E9GaOK6VR6en47Ldn7QGbW
	0RrK5eZ1jvFSggpYjMXdtBwmgL7XkfkLd915qHg59h4U+2jKZdWn28O84O7e8Zan7kwm
	CHkkX4LYzxajFaxLg9HId4Go4nxier1uNNRU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/UR+PwFFJfOxXQsEtEh991bxMxtQdjDmUdGBHp9b2YA=;
	b=uWM7oStWSfaHdN9tMVqFAoVH6D5SlGLqNWxx1bEXql75cqjpb+1rGU64Wd+8vD0TVV
	5lB+Lvem5zd9pnNcrlZbzqHufcjf4/8NkXGp+C5qGXDluDUAaM0ka2BwLPqEyo6rSq/x
	XvHW64n6rGIX6eqWmmZ6aPzG0+Sd8Hw0yvAF1ysS8Y2uLI+R/haEKqC5lVdElPu3MEOu
	stoSF/RXjmjNgHzjj7vwTLFzwBY9Q6lpIpAG+XVYYnC3RORCwE8tK1yVKGkLsK1cjc15
	sDcwE4Xj6xWSf7czjiVnoDiOL8azyeQLV7FOK7C3AdIkmpZEwbhcja86+jNg2H1x/lCI
	9viQ==
X-Gm-Message-State: ALKqPweALDGzZgQzfO0r2Yo+An+/tH02X5jDfHpDfglYrTQqxL2QCagZ
	1cYAcoDY7nFxeRIjLxhF7REhfMgRML6dM+91qGCRbw==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr4073164oig.102.1527167679022; 
	Thu, 24 May 2018 06:14:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 06:14:18
	-0700 (PDT)
In-Reply-To: <acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 14:14:18 +0100
Message-ID: <CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3RWDGz6nCBS

On 24 May 2018 at 10:04, Auger Eric <eric.auger@redhat.com> wrote:
> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
> With that change, is it supposed to contain only the states of SPIs or
> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
> shouldn't we also shift field?

The semantics of the gicd_ipriority and other data structures are
set by the TCG GIC implementation, and include blank space at
the start where the PPI/SGI bits would live. See this comment
from arm_gicv3_common.h:

 * Each bitmap contains a bit for each interrupt. Although there is
 * space for the PPIs and SGIs, those bits (the first 32) are never
 * used as that state lives in the redistributor. The unused bits are
 * provided purely so that interrupt X's state is always in bit X; this
 * avoids bugs where we forget to subtract GIC_INTERNAL from an
 * interrupt number.

thanks
-- PMM
