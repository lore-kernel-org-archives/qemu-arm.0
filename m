Received: by 10.28.71.155 with SMTP id m27csp5982513wmi;
        Thu, 5 Apr 2018 05:26:54 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/TowNmE9Hih/IyRHLQYBMHVzc2XddPFD5bEnt1GBe6DdUpc89pCNNRSt/zkIFncSNtb7LQ
X-Received: by 10.200.39.39 with SMTP id g36mr30705809qtg.227.1522931214084;
        Thu, 05 Apr 2018 05:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522931214; cv=none;
        d=google.com; s=arc-20160816;
        b=H5uhitzNVDwjVf6BOFJKo1+R3IL8L8a06aroo1ODqvEXuKPljX7QkH4IqjTx0uq6bN
         v436mL1voIfLd+OIbBZGXpl0FDC0mmk80+rTC6Vgiojt+rTpJwEz92LjxtIC5t9DEY74
         PXffciJ8BhyNZus/9juhcnGPrVP8KbHuSmJMUWEE4hjkuC+qzBgnZaEsvhb1C8XjteUD
         A6Kq9xzvo86zJl94Z5enAC8q/cjK5znwPZOFdi+n4+TYjKQWgNkk/c5Di0+xqYeOJ+ww
         T+rT47HmZ3DQCkbA/CklUWijbqruopu0ienUmGWSMi/PLgF8EFNurZR+oQOpA+VMsBDN
         /eVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LsTzod3w2qMw0WE3GODwWbft4Zy5YzhFn0/TuXXRLAI=;
        b=YmDnTIbrvS5RmoUiR4znPqWI7TgmIhPTpR+hi/QzKC4lL1oRTe8oLrwtW30I3aznju
         +GpgCBSZ7AMJ4HqiTaTdZYYcLmruRcAZEB6xmBvkiigaiMqGgp3VTMblbad7cgHkKWCS
         sngaAodBqIn0630A8Fm+53w9wIIfP0nw6os+OaMS068L07JAiPOBR9fDR0nNJwVqJ+yY
         gmI1M5keUigE8f5mO++j3Vb3qK170xdoXo6tvAXokAgQ0CnujHnRD8oIRPkhTzb4boT2
         9mVlaqbnvqHHb02RgOLjt5pFeit8/YN7RRMscPUs4kJlhdVwq0EPda4ftqaVIkJKCGq+
         ZyAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NQW47TLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si8828816qtr.15.2018.04.05.05.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 05:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NQW47TLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f43yf-0002kv-Jb
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 08:26:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f43yW-0002kH-9Y
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f43yV-00013K-EK
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:26:44 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:43548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f43yV-00012I-8a
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:26:43 -0400
Received: by mail-ot0-x231.google.com with SMTP id m22-v6so26928382otf.10
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LsTzod3w2qMw0WE3GODwWbft4Zy5YzhFn0/TuXXRLAI=;
	b=NQW47TLe76Prt+F2rn10KpUkVhnygg8EcgwUVkgVFbHdRvR8+eU+3M5W91ztBFJfFD
	JYv73WmGhXcYUXB4hYKlCDI+xTf6PxFcDxS42YdFBqGCdZ4PBJjtJwtj3+SpuK2KF2Z9
	m6xA7/iunpLfdy/ewwNFrEVuw7gcd26zrk1Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LsTzod3w2qMw0WE3GODwWbft4Zy5YzhFn0/TuXXRLAI=;
	b=dTMk6+q9vBV9LrCJTcNcGaa/Ue+7s3Y5Z7NhFBMHM96FwWLbLgi/jjtKvF0bhGpo6R
	ZJH6EkVdQ0pgsIkyBcmPwLBg7eFCtYSpL1HWYaAerjqkaw2gE/DUOBnP1SFCHs/Z5DbL
	aTTh1RVvAfIMOs2bIAcbDXEVXH9oA6QHAR48gjDkGlbkKUlb+N90ChMn/lcQdCPF6j0R
	mUAWQyrPiOYEPhUz9E67ZT4fcWbRYYYNJtgHagQEfW2Jin6aAAzoQoeQkF7XhfhefjQB
	pOZN+v8Do74xmE0rvFsCo26OARgFsCoOgAkAmUUGh15ilJ2uwU4vYccMIlAeKq/Dgtqk
	xZfw==
X-Gm-Message-State: ALQs6tD8YrxJVQLI0iMYmHt2U98GbKtGeSlDqF2hjCYFqOqPtC1B2Rgf
	JzRaNg+memNdJaFQW2/ryRvzrNqlmvAoYr/Idp0ebA==
X-Received: by 2002:a9d:285d:: with SMTP id
	h29-v6mr12771555otd.205.1522931202447; 
	Thu, 05 Apr 2018 05:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 05:26:22 -0700 (PDT)
In-Reply-To: <1521841386-27498-1-git-send-email-onursahin08@gmail.com>
References: <CAFEAcA9G3xVjmjys2R4-NXRHiZwLVLRO7ZQDZ0AhNMHHFhHV8A@mail.gmail.com>
	<1521841386-27498-1-git-send-email-onursahin08@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 13:26:22 +0100
Message-ID: <CAFEAcA8M-Q8nWnP1VWtuz2RpVs7_bZhhVfE4fcCzaU5tsnfGtg@mail.gmail.com>
To: Onur Sahin <onursahin08@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Check undefined opcodes for
 SWP in A32 decoder
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P8XeVgnMzEJW

On 23 March 2018 at 21:43, Onur Sahin <onursahin08@gmail.com> wrote:
> Thanks for the feedback Peter. Removing the redundant check on bit
> 23 and adding checks for the "should be" bits as well (bits [11:8]).
>
> The following patch should make sure we are not treating
> architecturally Undefined instructions as a SWP, by verifying
> the opcodes as per section A8.8.229 of ARMv7-A specification.
>
> Best,
> Onur
>
> Signed-off-by: Onur Sahin <onursahin08@gmail.com>
> ---

Thanks; I've applied this patch to target-arm.next for 2.12,
with some minor tweaks to the commit message.

-- PMM
