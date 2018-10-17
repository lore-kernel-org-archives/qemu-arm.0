Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp17949wrt;
        Tue, 16 Oct 2018 18:32:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV614ffm8fxI54UaFoZtDad+LxW5sedoRhpenkQywlXfUefPiqHzvDpicq6YaWPwneyzevEB7
X-Received: by 2002:ac8:7452:: with SMTP id h18-v6mr23342815qtr.382.1539739948533;
        Tue, 16 Oct 2018 18:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539739948; cv=none;
        d=google.com; s=arc-20160816;
        b=kUperQ2POqMw4+oSgtS6NxLdn3MNcYy728VAfEwT4f3eXEY+6rHdluSckJ41OmyxzF
         XLkoQPalIqCf6EP7Xkuv817eQBeJj61U8RQJiI6orNapGWp0GZbsXfvdNxgSHCYVzXzQ
         PAVMZGgHSvlPGd599y1oBSAIkHAU5DlsiwTYSO1fTHMlLW9/jgfwc+m7giUWKTpbpkVB
         N0QkA48OpfD8uLZOLKvlx+nwgfbRMCA56ieAKu0O4sXsKK1DgYu1Ddgg0+PeJmUgI+uV
         +vIGSePhAGVJ2Z08/C2p6urtl8v8rRja1dj03BwFHfgGooOhxAU9peca5tsQe+sbGQMq
         Sn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ohNc8mEzLkiXBPhOE3rRK2Bz/vrZU+ngs8Hb8ty9RIY=;
        b=eo7naaXR1T70IBhHq/X4WoDbOWqhALY4az+nTAvs8d+zxVMc/Kd7DP0fQ3bX+Kn0jH
         r8KcMekBu0PMetynQQome0JTgfiivqQly6W9yRSzm77fcXwXFRJOsAUhZZZ6zPeEaA7x
         seEQW4gsoS6Qyuw8sxJlqPQ5WpTtgRCtYIJVNooBbRUWweq9dSG9sxCz8LPNQMr17aHt
         WhxYQCXhbA5IQhH6fEAVoFcUp4qvy4Ax6R3rqkuBv6vISfk8CsTybSFZxV7e4ZqJarAL
         M/tbl1weBmWB3ZD0V8KJl4Nlk55103xQ32OLqOvMSQavVefBOwl4TeQepxJdBbHVFo7c
         uScA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NV1rWx9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2-v6si3415500qtk.102.2018.10.16.18.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 18:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NV1rWx9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCahI-0004Qs-0C
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 21:32:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCahB-0004QA-66
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 21:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCah5-0007dH-Ml
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 21:32:19 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCah4-0007ca-RS
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 21:32:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id r64-v6so12323145pfb.13
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ohNc8mEzLkiXBPhOE3rRK2Bz/vrZU+ngs8Hb8ty9RIY=;
	b=NV1rWx9OOikpGWTBCGpXDhUOZXItw22rgYPqJx1T+VTXo1AXC5sqfOkdsAjw2q5CwF
	A3Qg67+7wkMAVRR4A37VCXPO/lopzXmdmVGCudvZ7ZYIQK0MY9UDp9Gqitg3ei7Pngr/
	n54xEIrfrH3COv9Uzr0nKI0E/Ho2BiVV+rDaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ohNc8mEzLkiXBPhOE3rRK2Bz/vrZU+ngs8Hb8ty9RIY=;
	b=OdXmX9mSJ2Rxt+Z93B3HO/ksmf+RSTfjjnC6fuuRTR/+97WlbhbaYxWeO2uRRXvRIY
	ZpUmbcaCsuSjFHJBBb98738+Bdvm6q5ZI545SKs0xPN55IEen931RYgmYzMaJBUvVsb6
	eCBi4G/aRNO90Q0nL6PK5McKEvbx96Dvm/pLeXSmomJEGehrIMerbx48F/kgaruLJl7x
	pX+C9rZJQ1Ypbdu2JkBvCkLohv/L/MIGHah5GqHwLgOx8946L+Aq6MD54iQobvL90yMz
	a6nVk37vEIz04FKkeCTShQUXPEVVsoUapr4s76MpMF8MV4I65coy0/zaGYflAbg9eaZR
	3how==
X-Gm-Message-State: ABuFfogZCxBYAisRndrdE7kvxzGudKus4zEDT9vTbL2xpO1iAYXEKueo
	RTpgrFDoyiNP55GEIYejq0Uckg==
X-Received: by 2002:a65:43cd:: with SMTP id
	n13-v6mr1310037pgp.185.1539739933634; 
	Tue, 16 Oct 2018 18:32:13 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	k13-v6sm19444164pff.30.2018.10.16.18.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 18:32:12 -0700 (PDT)
To: Peng Hao <peng.hao2@zte.com.cn>, peter.maydell@linaro.org
References: <1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7847659e-4514-6f4c-a0d7-7434ed486227@linaro.org>
Date: Tue, 16 Oct 2018 18:32:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm : add pvpanic mmio
 device
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQ0nmdWLod14

On 10/17/18 2:23 AM, Peng Hao wrote:
> +++ b/hw/misc/pvpanic-mmio.c
> @@ -0,0 +1,76 @@
> +#include "qemu/osdep.h"

New file requires file header w/ copyright and license.


r~
