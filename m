Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1023366njb;
        Sat, 1 Feb 2025 04:58:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvAxUPxZvN63rxfc2kySpC6T8gtv10j1qO8uM5QbM8whBxQ2QZOOsgYgCMjpe3v9UQ67lHhod2zaU6bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZYRVstxtRjn9LniPvZIS4KtccYm/46OseKTiStOZRLGF0TargJd6jqkIbPWzePYmJgTgi
X-Received: by 2002:a05:6214:250e:b0:6d8:8cb0:b40d with SMTP id 6a1803df08f44-6e243cac7c6mr234287396d6.39.1738414718080;
        Sat, 01 Feb 2025 04:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738414718; cv=none;
        d=google.com; s=arc-20240605;
        b=Dehjc6aJfgrP3nFi4NrEps1O8kq1HYs2t2F5mnn4C3k75niL+LhR3AErULT0yQVF75
         MKeIDfOWPledJPNqG8+jFIMWgcTAxbwlaE9qUxU05RhiONrB46phTd90VflPDg0+ue99
         e+NmpHbpFVBmqSSr0mhlbV7RwHT8JJS85z2SpuXjDSCn1uHfgPWBUqL2sTb9rDpSWu45
         iWviIWpQ0sGXDE9wbWRAMrjalXofSJv161BfhPXgMamq9bZD1UgkZLChJG8R1OYpqanE
         kH/CQ3FO8N7jE2sTpqVrDuCELdb1dNAX069LXt6FcE0keOKhFTJb5ct2WrssV0mpkJto
         cVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-id:mime-version
         :references:message-id:in-reply-to:subject:cc:to:from:date;
        bh=6U39Yl34OxlQ86geUS0Vyj6MIvzWF5A6E+SJ1n+dlEc=;
        fh=do9Ci31rNF9xCKtObuiDvrCpE2VYNtnQUH3S5OJelHE=;
        b=JXWv6nqX0GXZmZ4JLQmRbvqCsHDeWO2Ui1tPttltkGtcL/a15HuioTvfOCl26QwMQg
         B9UAqSNTFvRokvH8mAJp3WYt6pznzdEUsxtpjhUjC3d9YEbCKUnBaIMpDKZ6ncbqdaNH
         z3DqivdLrh4lkroHOG315GfENn1ToiylJKHuTQ4GXAWNdNZ/DKMupR1W37GbAz/jZobz
         3Sg/oFAKozLfQSxxD6Ffr8KnrNjUdVckkyN1+nLkBP3QU9xAxUAKxd0aWGsSfYMH7Zdc
         X2rS5YQWq2da8RrkWoG5J7Ev1DWAfy2Djzcw+A1Wmf9vQzKQy3DqOWYeSA9X0mu0oKyp
         v8iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549a1faesi55354966d6.323.2025.02.01.04.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 04:58:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teD4Y-0006td-Vi; Sat, 01 Feb 2025 07:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1teD4X-0006tN-Vy; Sat, 01 Feb 2025 07:58:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1teD4W-0006jl-7U; Sat, 01 Feb 2025 07:58:05 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1CB194E6005;
 Sat, 01 Feb 2025 13:57:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id NbOq-EX56cOw; Sat,  1 Feb 2025 13:57:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2CC544E6019; Sat, 01 Feb 2025 13:57:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2ABEA74577C;
 Sat, 01 Feb 2025 13:57:56 +0100 (CET)
Date: Sat, 1 Feb 2025 13:57:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@lists.libvirt.org
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of
 DRAM
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
Message-ID: <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-595375333-1738414184=:33237"
Content-ID: <41e0dd69-157e-7e24-7b0f-bec2d0eef23c@eik.bme.hu>
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9bn9uEBjvixN

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-595375333-1738414184=:33237
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1d22ae7b-5e8f-9543-38b8-cba62d89b36e@eik.bme.hu>

On Sat, 1 Feb 2025, Philippe Mathieu-Daudé wrote:
> - Deprecate the 'raspi4b' machine name, renaming it as
>  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
> - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
>  respectively 4GB and 8GB of DRAM.

IMHO (meaning you can ignore it, just my opinion) if the only difference 
is the memory size -machine raspi4b -memory 4g would be better user 
experience than having a lot of different machines. Or if you want to 
emphasize these are tied to revisions maybe -machine raspi4b,revision=1.4 
could be used. You can say that -machine help listing different versions 
is easier to find but if it's the same machine with different options then 
this should be a machine option, then you can use -machine raspi4b,help to 
find the options specific to the machine. Memory size is normally set with 
-memory so that could also select the revision as a convenience if this 
is tied to a specific revision.

Regards,
BALATON Zoltan

> Philippe Mathieu-Daudé (7):
>  hw/arm/raspi4b: Declare machine types using DEFINE_TYPES() macro
>  hw/arm/raspi4b: Introduce abstract raspi4-base machine type
>  hw/arm/raspi4b: Split raspi4b_machine_class_init() in two (1g and 2g)
>  hw/arm/raspi4b: Rename as raspi4b-1g / raspi4b-2g, deprecating old
>    name
>  hw/arm/raspi4b: Expose the raspi4b-1g machine on 64-bit hosts
>  hw/arm/raspi4b: Add the raspi4b-4g machine
>  hw/arm/raspi4b: Add the raspi4b-8g machine
>
> docs/about/deprecated.rst |  6 +++
> hw/arm/raspi4b.c          | 91 +++++++++++++++++++++++++++++++--------
> 2 files changed, 79 insertions(+), 18 deletions(-)
>
>
--3866299591-595375333-1738414184=:33237--
