Received: by 10.28.71.155 with SMTP id m27csp2215497wmi;
        Thu, 12 Apr 2018 11:22:45 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/5QgYcyVP9zfDaLncN02HsycLoauoC3PdtHXyr0o9FJZti5IsJtDFq8YWCw9mELdxm9zlx
X-Received: by 10.129.155.4 with SMTP id s4mr1064309ywg.18.1523557365634;
        Thu, 12 Apr 2018 11:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523557365; cv=none;
        d=google.com; s=arc-20160816;
        b=eBpadWtcOEsiy+MyUNz1XTfR/pfUYridTHI6hT9pajy7juu432n6LND/ZEMv7Mb/Dj
         I20UziHgx4VxVNDTxQYiOCExejCFcF6n0qp23wDXML8jKO85B9y6sB7Wj/lFeDMIQUl4
         T5NAgO7gyJCXmH6uZ4snYfRV/3+hw7QZawFR/QptaoqEljr5AUr3ZyMTq0jCHws+OHaC
         TnBfGGvjEDCyzUWsPSkZrPx/xC73wViBvYDTOqiRNpoEO5Qh/o41rrHeTk+ZVjq1J3+i
         cc6BwKx4cYUG9nmICuVV2c7wgsYbeJcTuuIk5LVtIABC+OurnSA5V9p8mIu97vx+a4IT
         RlyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tXb9/C7RCuxevs5ouM+fQNZqNHEPZI8gB22Jow3Ooew=;
        b=LRmggH5/gCIaq3/kHhk/k22hRTjfuhv3fnX3wHDJLOJUvzKN1quZkcqtg7Btwxl+pq
         xYCKahj4+W58jabNCHk3O4GIJPKFI1q6uIFzH6rIuE77oIRiXSC9WV/4Ql9sQ+phKMqC
         vwzHn1jVhAPC0wa2H1PZjz18rjr391LBX3S/JsfOedKLe0O54OkwlpxBpC9i9DpZTRRb
         GhsE4CspypqOm1ul9vm/Qe4NAaqtcS/BKTLFPrklP5TuHp6U4HJQ3vGAK2dghAt13EhN
         kSlwCFxinG0x871cNmYhjixtIirgEGfabV/f5KaHL+obHGMG3xeoYgfWR7+jrDEyKYj6
         orpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdBg7QTn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si5405860qtg.258.2018.04.12.11.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 11:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdBg7QTn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6grt-0005qm-53
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 14:22:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6grj-0005q0-1s
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6gri-0007Tp-8o
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:22:35 -0400
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:38850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6gri-0007TO-3Y
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 14:22:34 -0400
Received: by mail-ot0-x236.google.com with SMTP id o9-v6so7093120otj.5
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tXb9/C7RCuxevs5ouM+fQNZqNHEPZI8gB22Jow3Ooew=;
	b=PdBg7QTn7L2Td1NmU5eoWZDS3RQwP2/BfNCjNdyIGu1ACWNeQxZvVh365dJ/ugun5N
	lxTCwf6Oo3gFxKhpmQIRH7QTHQI6wGau8y4oQWcobjqYIG+B1QQe8Lb/uEsdWRdkbWRW
	voWKsGUVWdHl/oS6p+aixamxP9daTVbtYLbjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tXb9/C7RCuxevs5ouM+fQNZqNHEPZI8gB22Jow3Ooew=;
	b=Lvtehqe5xoUMULPj9g+4BGKKIRoOVY5KtOWSJwIFenfD2i+2VkHxDvISce8xDN/kyW
	rKWPztyh/dzVxL0MGdooIIRL/2PjC8z+FXxlmgrjC0XGN68uPKICZgDrWv3C1B/xRIUa
	JjeOsnpO6RtnxT7/gUmuJe1LALbCWX1maKiUxAmeHIJTHSAXMrcs1E6AflyvhHYiRf9D
	G/NcFXFyJaX+6+tmPqSn9o/YSTK9nYzmyjViALXLGS9Bb9/XAqoACaCjImXB88peu6sE
	V4GQjRkvjKdd8hIzSKu6UmJa0S1iTDj8CgQoeojFYoypwNzFmO8Udm+HoMFT6xoUyM+R
	U7kw==
X-Gm-Message-State: ALQs6tDZC8RKhWCzINtkxaSivKZ8fXtbAn+uMB6ZP8gohMi4iYvLF7SW
	BNOUHHFKbot/lxPC/mx5/Flf2VmyfObIEJ6yldVJzg==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr1497317otj.294.1523557353456; 
	Thu, 12 Apr 2018 11:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 11:22:13
	-0700 (PDT)
In-Reply-To: <1523551221-11612-2-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-2-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 19:22:13 +0100
Message-ID: <CAFEAcA9LVUfmHGor=OmnXf0Dhj5zP_e++WELKwtx0Ru7VcRA-g@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [PATCH for-2.13 1/4] arm: reuse
 arm_boot_address_space() in armv7m_load_kernel()
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: noUN2GPh1lH2

On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> reduce code duplication by resusing arm_boot_address_space()
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/arm/arm.h |  2 ++
>  hw/arm/armv7m.c      | 10 +---------
>  hw/arm/boot.c        | 16 ++++++++--------
>  3 files changed, 11 insertions(+), 17 deletions(-)

This minor duplication was deliberate, because hw/arm/armv7m.c
is for M profile cores only, and hw/arm/boot.c is for
A/R profile cores only. I don't think that saving a
single if/else in armv7m.c really justifies blurring
that dividing line.

thanks
-- PMM
