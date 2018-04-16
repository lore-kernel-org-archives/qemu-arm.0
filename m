Received: by 10.28.4.212 with SMTP id 203csp2858187wme;
        Mon, 16 Apr 2018 09:46:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49osh2lms1N+5aysnx2wmjmcuyQhCqOSq/Pe8rYkFs5OMm8vSVscF70Mi4lwDqUqhec598i
X-Received: by 10.13.255.198 with SMTP id p189mr10999755ywf.472.1523897202867;
        Mon, 16 Apr 2018 09:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523897202; cv=none;
        d=google.com; s=arc-20160816;
        b=Fs0Tuz9DoDMSW9OOaKXZo2DuOlqElJ6hQWkR2e29cxRXdw4KKItSZam/JcqEV3aCnN
         1h0MkMl0ojJKsjgLNvPRHbUoSDimHqSaPGDZu+G/CqKq1+KI4OwrHPKt2curreLfDNDm
         f5IuAq3GuTlyfK0exOxWOWLFIHirMpi0MbKNs4YIKtsOQoGn/JVct2eCn08gZUlD4072
         RBQ+Be8wwBAwz0YjW9WpDHacbsLZiFURTkA63qQXSkb1phRplq2pZb9CrcOur/KuRDni
         V16x4iJRV2bPY7ZvZT9J6XiUC5LLudHKpou1ZuHJzeEb2WPKnuvx6WKyDcfxm+d9NUbl
         zrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VeQI/TT+0jK336RzVQ3SqMGew7z/hTY5oq00cWjnQDU=;
        b=O3bh829ie18UrO8pOWLl+HVExe+zdxytwasJTX4bi6Ga1gdZF6WQR0O/af7I0+qI5i
         2xwrqz1PoFWOu04VgdiOEJeOSAwxV5KZS0iJ73u26UZSXbvsgI6w/B86z6NLdMSc3wEs
         wjHCQ0BnnvKpU8xjFueAF1Ti9OOi7NXwB1Ssmv5vGVtEjFS7Q7/CoMMr2LPgfZjUOXpF
         MpMJ07YMf1KXKdJYw4OXDd1jo7lsQ7DkQj/vThdciI5NXLYdad2CvMMo0yRSAx0CvY1H
         Uwebahj5LEBhZig3mBPvg4NW9ZbhO/SuSAXGT0Ry8IYtBT1S7d8BsKHhPBkEjcmKJvXp
         DNPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U3n2K1oE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w25si1281180qth.136.2018.04.16.09.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 09:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U3n2K1oE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87H8-00060l-EP
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 12:46:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87H0-000606-RU
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87Gz-0002MK-W1
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:46:34 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87Gz-0002LZ-Qk
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:46:33 -0400
Received: by mail-ot0-x242.google.com with SMTP id m22-v6so18112988otf.8
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VeQI/TT+0jK336RzVQ3SqMGew7z/hTY5oq00cWjnQDU=;
	b=U3n2K1oEEwtOVqvtWPRwHi+m6zL1O8f9PJ0OyEVjVW0WpbbqJmJGbeaxAuZCAbPxn2
	h+lX+MxKK7nJa2QhLMpO2TCYm7qcaYaQqgM7DEbqeum8KbqAtbyn/z+UaLsatYKY3v/h
	S1i5R4n+8YSQCgq1dQ+ru5mp9XBsFvjj2PpFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VeQI/TT+0jK336RzVQ3SqMGew7z/hTY5oq00cWjnQDU=;
	b=S3RnnmaYWo5ubFaKPmBQhX+PFq2e1+ubpw7/Tb5ExTE9u0cuDp0u8A94QYY4F+9kJf
	197320kgdwlti2boRkRkbKbs/isWqtekvBEU7OJbxpD0SrwgQoAEmCJYYHWlvgfmp8Rt
	e5xJXMofQEtJrJAPSDiQbx7yyqGFIa7yPfe9jQTAbNYKo0kb96bSgPnysWcmxwQTUhqR
	B8cqodXMRQyzM9dJbdHRdwabxtFZ5PUXG8dqNOd+WbpMlfvmgE3Et61CKFK3QVpOirLw
	0ELMZz/P0leY26AgaBOg6cn9Vbqhe84CSHrXpiIU8sE4DS3bgKoNdLj5cRS1GFuui0bH
	zanw==
X-Gm-Message-State: ALQs6tC2Y6F6Yymp1KzXMmJobbknvHZRyyR2NY4Kf9OeAPb98MX1RLrc
	23MSzYTHHHoO/vMYR4h0NR8yRK8ZPjcvzDZQoLrGDg==
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108-v6mr11395770otb.308.1523897193026; 
	Mon, 16 Apr 2018 09:46:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 09:46:12
	-0700 (PDT)
In-Reply-To: <1523518688-26674-8-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-8-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 17:46:12 +0100
Message-ID: <CAFEAcA9HJSjumMzL7N6BuS+VJiEuFXRd6iuEPmqaSNjb4F8JZA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v11 07/17] hw/arm/smmuv3: Implement MMIO
 write operations
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHHpZhUhac9Z

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> Now we have relevant helpers for queue and irq
> management, let's implement MMIO write operations.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

> -int smmuv3_cmdq_consume(SMMUv3State *s)
> +static int smmuv3_cmdq_consume(SMMUv3State *s)
>  {
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>      SMMUQueue *q = &s->cmdq;
> @@ -269,11 +270,170 @@ int smmuv3_cmdq_consume(SMMUv3State *s)
>      return 0;
>  }
>
> -static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,

You changed the name of the argument here from 'value' to 'data', which
is why the diff has come out looking a bit awkward like this.
Better to be consistent with the name from the start.

> +static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
