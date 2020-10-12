Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp918751lfa;
        Mon, 12 Oct 2020 03:30:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz36DAHhRrke0Q0Qwh503l1KGuUvEqBsSt7/OHWFz1We0S9OnUfKxdUKe3fra6WBkqPN2os
X-Received: by 2002:a25:2846:: with SMTP id o67mr2270299ybo.164.1602498638485;
        Mon, 12 Oct 2020 03:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602498638; cv=none;
        d=google.com; s=arc-20160816;
        b=dCBF1lpPact3dw5sHe6B8rw8rHiRk8xIQv5L0IRpMFpFFoVUc5AbwFcyhHsfbiKMQY
         Cwktv8bZu9TQ1nNa6XNJILxRg1dX4sUv3mMk6Fxay1CATvj0Ekym5k4WhdRnB0nfORPG
         iDxqPUQ5NKb1LE9naLNRtFkwKSj4pF+xKu1nNpIyPw2dkPUUM3Kg7Pi0Tb8t4pZejSP/
         tmPwn7r6BorOPrdyWKXeJAG9H0n8QlnAaRA34uHYnqARHzaK4OTkGMKeDR1JhOAGKy3e
         wPEvijwgTVzTY2Qha/CloEXztA5KRhHIb9DYZ6riYmTS88LRoo9YAAf2QchPkszuHeWa
         I8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=b83tgxwLK8w4CCTGPKI2xyz1asH5diS3uWlaj2+uHZQ=;
        b=v4q/JbyeQAeYMEKpQEGyy0rMUsoXNfdEoA9c1//UuS8P2uXeZwgVLfhErTmU/FEMJ4
         D3ZwGtsymMskkobq1uZEIVe0CGzSTSMylMkIdgmNZzWFZwvjhyDskUJ0tXjrgPwvxuCt
         lixc+8r3jqA2+pxSR2XJAtseIItj7th3mJY/O2QGBb/xe6PH6sPUaEv+HmyEfrFf01xA
         qMJkUbNF1fSWujLz79OZxUp2HpMzzFfPQgwXl6DN2lV+UeYSkglFvV79DNDLC4EW50nq
         kAnqQhC/54F2QVQf0MXATCpkGO2WqFOsQ28GcN+tEAyhPdyBYrsHEUb1ASYFEtuXXAJI
         WbRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si8789632ybp.394.2020.10.12.03.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 03:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRv6D-0001ik-Sh
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 06:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRv5z-0001gf-J1; Mon, 12 Oct 2020 06:30:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49472
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRv5t-0006t7-NW; Mon, 12 Oct 2020 06:30:22 -0400
Received: from host86-158-109-18.range86-158.btcentralplus.com
 ([86.158.109.18] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRv5r-0004Y3-Je; Mon, 12 Oct 2020 11:30:16 +0100
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201006220647.GR7303@habkost.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a5b35b51-5fb0-eb7d-7c9e-c876d2e1fcce@ilande.co.uk>
Date: Mon, 12 Oct 2020 11:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201006220647.GR7303@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.158.109.18
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Purpose of QOM properties registered at realize time?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hy/xryVw9kao

On 06/10/2020 23:06, Eduardo Habkost wrote:

> Hi,
> 
> While trying to understand how QOM properties are used in QEMU, I
> stumbled upon multiple cases where alias properties are added at
> realize time.
> 
> Now, I don't understand why those properties exist.  As the
> properties are added at realize time, I assume they aren't
> supposed to be touched by the user at all.  If they are not
> supposed to be touched by the user, what exactly is the purpose
> of those QOM properties?
> 
> For reference, these are the cases I've found:

(cut)

> --
> hw/misc/mac_via.c=1011=static void mac_via_realize(DeviceState *dev, Error **errp)
> hw/misc/mac_via.c:1028:    object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),

This one was me trying to work out how to wire up an IRQ from a child device embedded
within the macio device - I'll send a patch to remove it shortly.


ATB,

Mark.
