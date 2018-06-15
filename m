Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp797825wrq;
        Fri, 15 Jun 2018 05:38:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLx4VbUlLh+6TL/A5MCgbEePBFfoTVoTnGR8mTz7ouh7fKC6XvstDAu2eNXPrO7alrNymQv
X-Received: by 2002:aed:37e6:: with SMTP id j93-v6mr1260244qtb.13.1529066280685;
        Fri, 15 Jun 2018 05:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529066280; cv=none;
        d=google.com; s=arc-20160816;
        b=dXCNUoy8+Dre96lPjsKNwMRzSbeSKQXyKtgz2ntrpJVYNyhfI+R1giqXewybVgaDB/
         x9FERhAKpQeut+cnSL4OWpA0TitwcEYdxCuVAGnZ9t+VcD3GfqiZnGjlYCQ5ueZxQn1D
         3nmK6z7QaodaEc7B3mgMgL1CfcZ5k9tgL3FByTCRw2MdbWI2zpr9Y/IHuB74fmWG25xn
         8pat1CNM1oWEfTFbEhkXLbsIat5unQw6+yUhKgeYkPxuJIMVQTTozPMBxvA7ZxR46B/R
         UA5srBU8V8EFGWkclnynxJe3fFEJKlatP1gF+tsmsBtvcjwN9dOBaoD3TSbCB8zRXKRD
         ZKzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UNzbr0b43py6Kn8lT6d5qqFAiJVy/eg9CupNSqWOo+g=;
        b=s2akOfptGSCFx/h5YCgs2It5RjeopeSn7L5ILcmQZyK6ekGRkWGEznzHQBwNTClPhy
         F7JfYZHAPkG4GyWS5+pS0wYKFx937MnydzX92fyKIeHfwX4P7wrja3umiNSQk7bYtKhc
         U/oqZU9Io1M8fH9UJQq849XypDf+Rklnpi3ni/T3e0/kfuMF1w/08tzUiDp2T2x+mW2U
         mhtNMrGhJXCJVpQYJ8KA+Goi7x3v1JV1IVXL70XD1wvC55KYgLcwzyZ7a7HKhIyIVCMu
         Ex/kxk/h4zAeh15755inazufa28kLN3/iziBpMOwWQjbz532CUDmXrScrxXH/IubpXg4
         WaTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z5PHpI7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 50-v6si7463791qvt.175.2018.06.15.05.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 05:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z5PHpI7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTnzM-0001yy-40
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 08:38:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnz7-0001vF-Jd
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnz6-0000zg-SQ
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:37:45 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTnz6-0000yq-Dg
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:37:44 -0400
Received: by mail-oi0-x244.google.com with SMTP id e8-v6so8670150oii.2
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UNzbr0b43py6Kn8lT6d5qqFAiJVy/eg9CupNSqWOo+g=;
	b=Z5PHpI7clvJZ2yGbCoMwfQh5lvxH1F5Za60WIEqQVub3IuJ84v+iJQ6t2F810gIeUX
	EifjxH5ncjeYUighBMl2ve0jIK/tO/V28faEQ9LWd5MWMhz1+uO9isyO2vE5Ps/o4m//
	MDpuBGYWpG+KaNB8vbmsJn6yMOlGhWy/aTeEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UNzbr0b43py6Kn8lT6d5qqFAiJVy/eg9CupNSqWOo+g=;
	b=rG0nPr+M9OJo22CN5YlIEXyuw1k7zz1Ohe9Y2Ri6psiItEke4AzVGCHons9ZXAZuqG
	iVNvzX7hUO7xDTicM2a6NVzc5Acaz3fp4ss8kNj4frmsXslKT+fv7aVhsuiwB8zOV7A8
	hZaJeOeTjKZO0O/2zFKitEyTSQM6JWXrNoHnqCEnAFpsEp+of2tnQz6MN5fdpmCE0Ko5
	izLHYS+vSk35YNy9HR6//VyF06iuusrElyZu8Po9WxPTxhgSI/p8pBZCMy4svXLa3Iz/
	FTUqK6jdzDubCyeYIL3tQ6ywzPn7StfCYLST80tBpyESGRXz6P9ceJI5jnJwOI9qlJSU
	gREg==
X-Gm-Message-State: APt69E0pAFfauRSLpkLABX16QffseidbXbAr2fj8jtmH2TWKZxbk5ooR
	soOVx6lyREr4Fc9LaWIqkktqdlbXyiz7TV2phc0r+Q==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr842280oig.102.1529066263645; 
	Fri, 15 Jun 2018 05:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:37:23
	-0700 (PDT)
In-Reply-To: <1527690380-9782-3-git-send-email-eric.auger@redhat.com>
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:37:23 +0100
Message-ID: <CAFEAcA_urHG9cDqeoq0ot8zEFR=9WW3qdp4sQtq4YQJvQz5SxQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Add virt-3.0 machine type
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ascnyg0mnGIJ

On 30 May 2018 at 15:26, Eric Auger <eric.auger@redhat.com> wrote:
> Add virt-3.0 machine type.
>
> This machine type supports highmem 256MB ECAM by default.
> This feature is disabled for earlier machine types and
> if highmem is off.
>
> The high 256MB ECAM region is chosen instead of the legacy
> 16MB one if the machine type allows it, if highmem is set
> (LPAE supported by the guest) and (!firmware_loaded || aarch64).
> Indeed aarch32 mode FW may not support this high ECAM region.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I think these patches should be the other way round --
create the new 3.0 machine type first, and then in the
patch adding the high ECAM region you can make it be
only if newer machine type.

thanks
-- PMM
