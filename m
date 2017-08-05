Received: by 10.25.221.202 with SMTP id w71csp858204lfi;
        Sat, 5 Aug 2017 09:52:08 -0700 (PDT)
X-Received: by 10.200.8.217 with SMTP id y25mr7809975qth.235.1501951928469;
        Sat, 05 Aug 2017 09:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501951928; cv=none;
        d=google.com; s=arc-20160816;
        b=g63/EcL8fHNmAdulpvna5afN91N3uaoT1AdVW+m1pwp+Mj4S3ekTsoGsfHn1b/z6Hu
         q2mQF7P5EboxdGZQe7pUAXCgcnlvhI44bPtLD5U6wOVgegPsPyCzs4hD0B5sajH9nMDq
         ErlARWLw8hB4i1hbb5PtogOWWA+du2mTdoblK9RnOaZ8nOWXvrRPn3cCaGS06Hop/Ciq
         69rGqv2BOz8BfZ2Msx95pmrA1hGusSq5fmEIz0v3Jlhy1S347AEPE3I1BH2KfbxWVWhL
         JIR+QztZhGs4BEQyY+hnaALcMEhadYlbTdH8Q02posebEn7xtVHvjJyhMLOS+PjFpbKh
         uacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LJ45qLcsThY5Vctj4iwE8GoGw+aOaOztX6iVhqDdEgM=;
        b=VjFHsYebVsBpVFqAw4a6eB5h0Clj3d7ROZG+g0xC8EPTbrN0y/bMKSuFvetJu1QTSO
         ZLj4iBfyn9W7PoAPhr9F1pRlSvUQ8QH2MdlAzQ29BZ5D7/G25n30hTEpH3oJypK6x+Ii
         WCaS25Pfoy5tDEIQIMJtWM9KJaonSUsyErvmb3WdbTSt6xEgjKEktSEr3myNJ2+2EGJA
         3Jif8epbdT54U4dwhdkVKQGeWUKQue4EYycvhYZOgOZ2llPcTe4Lr9wu9OFEkKE0/5aC
         J5JsFtAuTIQi5c+jSLSo3DTOIw2ooWxcP8h3C0h0v2apOWcnz4wkvxGr2BFuZ2AQWcwu
         8cZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=En9sBRcv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si3645703qte.467.2017.08.05.09.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Aug 2017 09:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=En9sBRcv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1de2J3-0007UU-Sm
	for alex.bennee@linaro.org; Sat, 05 Aug 2017 12:52:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1de2J0-0007Tv-F6
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 12:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1de2Iz-0005GQ-5w
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 12:52:02 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:36341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1de2Iy-0005Ey-Uj
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 12:52:01 -0400
Received: by mail-wr0-x22f.google.com with SMTP id y43so26134137wrd.3
	for <qemu-arm@nongnu.org>; Sat, 05 Aug 2017 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LJ45qLcsThY5Vctj4iwE8GoGw+aOaOztX6iVhqDdEgM=;
	b=En9sBRcvLAhnA53c3WenmVU6Mf3tSXs4FA0c7ErRORRiUSB2q9r7Zg3DupcgSEil1t
	sSuV7uTIB/XdmDmoudnym6r7j71sgJeut92IiniV4IPUCmJIDGOYPPue8Dy5EOc3QWog
	KlyycrmkcJfsbe8smHL/0uZZJUtGKGuDO2+Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LJ45qLcsThY5Vctj4iwE8GoGw+aOaOztX6iVhqDdEgM=;
	b=PW8ZWJzGM2GNih57QTGuOw+Wy6d0ylEwkbP3wAB89WnQT2bYUNqz/kQfMclqBs6qPd
	7hfc/xfqAr8CqTK2mpGTLwjbXPyL4hPkeW/TYP72b95/zP0bfEcijsPJ5I/+R5bpcTTp
	GpEYVoIhwAVITMpV6JkvWoi6OoU0HDMRTURlOL0MXte0KdRzveaC4q8TYkqgGxjoluRX
	PQ74vQzlEkco3ypy2HOSjQI1xPs/vndicyBP8FL6kJHkJfCkd7lRdc70ExyAWn82xQXk
	BOd9dw3Kgv+nAO4imNh9lgG/CbArCiDN08zdKtMe7I4aBcHDTVAQATtxrK5LdJSYeulh
	FnNQ==
X-Gm-Message-State: AIVw111jVpmzAkMJqcs9poYuW1vI0Y/JcIFhdc3qqaDUrVxgSm+cGsEW
	mT/IXPBNvIQ3BpTwLcHIgXA/rtuOVupC
X-Received: by 10.223.174.242 with SMTP id y105mr5079170wrc.262.1501951919332; 
	Sat, 05 Aug 2017 09:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Sat, 5 Aug 2017 09:51:38 -0700 (PDT)
In-Reply-To: <20170805010622.GZ4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
	<20170805010622.GZ4859@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Aug 2017 17:51:38 +0100
Message-ID: <CAFEAcA-nx-zUa8zJv3dz9UiYg9oUQQpg8gSCYLahnY4xT_9Vpw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH 2/8] cpu: Define new cpu_transaction_failed()
 hook
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ssN7s97/mQNb

On 5 August 2017 at 02:06, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Fri, Aug 04, 2017 at 06:20:43PM +0100, Peter Maydell wrote:
>> @@ -85,8 +85,10 @@ struct TranslationBlock;
>>   * @has_work: Callback for checking if there is work to do.
>>   * @do_interrupt: Callback for interrupt handling.
>>   * @do_unassigned_access: Callback for unassigned access handling.
>> + * (this is deprecated: new targets should use do_transaction_failed instead)
>>   * @do_unaligned_access: Callback for unaligned access handling, if
>>   * the target defines #ALIGNED_ONLY.
>> + * @do_transaction_failed: Callback for handling failed memory transactions
>
> Looks OK but I wonder if there you might want to clarify that this is a
> bus/slave failure and not a failure within the CPU (e.g not an MMU fault).

Yes, we could add
"(ie bus faults or external aborts; not MMU faults)"
just to clarify.

thanks
-- PMM
