Received: by 10.223.159.74 with SMTP id f10csp2687517wrg;
        Fri, 22 Dec 2017 12:30:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBosL4cInbbKdyC6LiY7RxzXl8PhVuuUAt8SmpBnjQWy2Ap3XP3mGD0GVVBWRpu5cZrG98PHw
X-Received: by 10.37.54.22 with SMTP id d22mr12689970yba.443.1513974655174;
        Fri, 22 Dec 2017 12:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513974655; cv=none;
        d=google.com; s=arc-20160816;
        b=ONKV4vBg3eS9KcZrHVkeITGqWVNuAwf15sWM4A9oExW5keF5jsKXL8VpvBlp/mNYV8
         g0kKh+/KwtvmGUARvqNPCogLgB2b+7KLEECVR6agAqjtlvFgfhzdvubabCxUSIrl1r2i
         yQAUtPE2FuANjvwAEVvr3FiMpBH6zgX3aVdb0fViuQvyLa6+eK2XDrYtLkAuFJNRTKNZ
         aXJo7zFxsljz8m09nYbiyD+CS0qt2iAS33SQ933z4z/t4lD6uMPEkUKKp9op0YHEGBio
         QJqH9g1lZaMHPGsaBjNtnPq7yI+pqgGTk5bXZHl1hsKcc1XA/Sh5KAcJNHi4ubPQbIjO
         8MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=EuWbI5gurFGhdf0Vr9nyuKJn1GqA7rsqkh3Nt0kCtZY=;
        b=UBeOVvouhMEJeEekvQdAXqnDhdgwmAVoy1oyIT+UP1OdApkkVVAadCPuDWH7n7t2kP
         PkqaKOWDm8RHY9PQWXFdBaQTo1P7qVY422RC3HkT5RRuttN8cP+sWkqTvoXpLMVDs8oV
         gfmuhYXKhGwI8fP9jdLcUcivAbgdMRZD3NoHE9ETZAJYbc1AeEAccGDNsfNsdmAWno/j
         kRVK7acZzf82rcuCOAWbAvwalWBAcFj6ay76kq2aM4NfuhEumjhFS8BIiDuLlnhawDot
         uczVXLTbyzfA6V2+RcpaZdFxpbkTew1YXYgelPvQAZSQIqUJoeTwIqMZB+vj+Mv5Te0H
         fg1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si4312483ywe.572.2017.12.22.12.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 12:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSTy2-000256-GZ
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 15:30:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSTxt-00024V-1S
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 15:30:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSTxp-00065G-3l
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 15:30:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eSTxo-00064N-Sl; Fri, 22 Dec 2017 15:30:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6CAF1555A;
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-74.ams2.redhat.com
	[10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF047C83C;
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C9BD61138645; Fri, 22 Dec 2017 21:30:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
Date: Fri, 22 Dec 2017 21:30:37 +0100
In-Reply-To: <CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	(Alistair Francis's message of "Fri, 22 Dec 2017 11:57:20 -0800")
Message-ID: <87a7yah5ea.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEX/1vChJ73e

Alistair Francis <alistair.francis@xilinx.com> writes:

> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>> Second thoughts...
>>>
>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>> [...]
>>>>  #include "qemu/osdep.h"
>>>> +#include "qemu/error-report.h"
>>>>  #include "qapi/error.h"
>>>>  #include "qemu-common.h"
>>>>  #include "cpu.h"
>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>      /* TODO: update clocks */
>>>>
>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>> -                        __func__);
>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>> +                     __func__);
>>>>  }
>>>
>>> This one's different: we neither exit() nor return a "failed" status to
>>> the caller.
>>>
>>> We get here when the guest writes something funny to a certain
>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>> a user error.  I doubt it should be reported with error_report().
>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>
>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>
> That seems like the best option to me.

Suggest:

1. Keep converting fatal errors (the ones that exit())

2. Keep converting recoverable errors (the ones that return failure)

3. You can leave the prints that are neither alone.  You can also
   convert to logging or tracing, as appropriate, but that requires
   understanding the code.

Makes sense?
