Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp327409lfp;
        Wed, 29 Jan 2020 01:04:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfVWuP2hvQ8X32SntU8/9JKpbIv86AtOE2FXSkkC3tSopMFU8RYCPn4tVGl4fPK/tLREjy
X-Received: by 2002:ac8:6f48:: with SMTP id n8mr26369285qtv.295.1580288669613;
        Wed, 29 Jan 2020 01:04:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580288669; cv=none;
        d=google.com; s=arc-20160816;
        b=bj0grjNokazfKa7lk/tKDFJs1wR0B5H8pJx01NwygEifnrRSpCp0qAKJ1b7/aMUKvX
         DuzewhE+lu52WZjodJrIIh5ysdeh4N8rjiq/UeE1oWM7SH9MmDprv9Rq7H81p8/Ivp7e
         HkC8i7gae80dGql66UVRVod7mUlLlaU1PsHW4lJG31hrdNW70EQqOSGSIAUv/io9nI5R
         qG83Nmugwop7+YjuLId5ejYU4U0jFvaIM71uPYAsvFhASf/D+GPGHwIqVFQhcRhkm70m
         haxGGkBp/ZRa4mtwk88ml2Nf1zhtREbyXAS0gt01lmBo4ChKeybVDQp87bgFBN5E8WTo
         Dwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=1nPCkPNB/2sK+McgCIUHBjs7Vir8oqllrr6aIw22ris=;
        b=NwwguXGdlxJ6j5n+Ui9TjtMRj+yVuKoUWvRevQIvRwyTD5uu4nU7feTR3Hg9MUeQ+t
         BX6GHI38++FR+oxnC5nMXQBmFFHeFB6umvlPGtHHsB5qJK8pMiv8PRA3SiMAfVeAFgrV
         jZme+n0NiPYqQ+9p+avzG9nxOtKJ4wFZnzvT8p1TIQPooPOLLsE0HFZet4CjIqYqTVyt
         1jVT8afakkH+VItTisOnb5O+mNP7lbERLyLMC/IhIvtsbLzV/ul/kUHqkN3FcuJFucFB
         1Bk9VIE0zAIy5yvPRVi58m8GA3QZc7c2c/ES4QQt3+XEgPhwTajWlYpywRORJVYlc78V
         Abhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=VhQIWJf3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si1019764qkg.280.2020.01.29.01.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 01:04:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=VhQIWJf3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwjGu-0007jJ-3L
	for alex.bennee@linaro.org; Wed, 29 Jan 2020 04:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1iwjGk-0007dS-8u
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 04:04:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1iwjGj-0005Xq-24
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 04:04:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:45378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1iwjGi-0005Qf-RH; Wed, 29 Jan 2020 04:04:16 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B4AB2070E;
 Wed, 29 Jan 2020 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580288655;
 bh=CMVfSWl+2XIT/jE0iJpRVzU7bkl12YJtNotQ4aZTpPk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VhQIWJf3o8U8wrj+cAI9pZfp77ocs6I2lQhUfo/CMYa5c9lwhny94UIMs7Etis/dO
 T5P/mTDJmnumpwg0oTihaXiCSOMdhQ4Zfdm7d9wouhygNhQm6psj+6BYJvW6J7OHSd
 NvU6XJ6BF4j14a6Twa7QieQMiyM6cugRE+Avtc9s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1iwjGf-001zDK-K4; Wed, 29 Jan 2020 09:04:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 29 Jan 2020 09:04:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
In-Reply-To: <7f6e29e6-1df9-4513-79ba-b53873b0735e@ozlabs.ru>
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <7f6e29e6-1df9-4513-79ba-b53873b0735e@ozlabs.ru>
Message-ID: <544f261e4b9c97f1d3a5fb64cef42ba5@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: aik@ozlabs.ru, gshan@redhat.com, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, pbonzini@redhat.com, drjones@redhat.com,
 eric.auger@redhat.com, jthierry@redhat.com, shan.gavin@gmail.com,
 qemu-devel@nongnu.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 jthierry@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: re3La3WEXSI1

On 2020-01-29 02:44, Alexey Kardashevskiy wrote:
> On 28/01/2020 17:48, Gavin Shan wrote:
>> but a NMI is injected
>> through LAPIC on x86. So I'm not sure what architect (system reset on
>> ppc or injecting NMI on x86) aarch64 should follow.
> 
> I'd say whatever triggers in-kernel debugger or kdump but I am not
> familiar with ARM at all :)

All that is completely OS specific, and has no relation to the 
architecture.
As I mentioned in another part of the thread, the closest thing to this
would be to implement SDEI together with an IMPDEF mechanism to enter it
(or even generate a RAS error).

On the other hand, SDEI is pretty horrible, and means either KVM or QEMU
acting like a firmware for the guest. To say that I'm not keen is a 
massive
understatement.

         M.
-- 
Jazz is not dead. It just smells funny...
