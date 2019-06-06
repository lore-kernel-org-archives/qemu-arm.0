Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp7988149pjq;
        Thu, 6 Jun 2019 01:43:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwx3r9O9S2VZI6fkaiXyQVPGIUmB152xPqLzCORqU5BdFKW71khuMvsKQvEcZ/UAH75jtUq
X-Received: by 2002:a0c:9214:: with SMTP id a20mr21268974qva.195.1559810610958;
        Thu, 06 Jun 2019 01:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559810610; cv=none;
        d=google.com; s=arc-20160816;
        b=umuno4IxwutqWYXbJW2sUxUdXlDMf2rsIZw1lsiM1KFm03JltQVIRMEjBJzbDDLM1N
         TL08mVmDhsTkd5znsd3V1B1ThuirhyhRF3totK1IXp7ZrPJGfypTDLHxvpKSmnb/T/EC
         z4r/PP28cVzxYFphC/bIGlZEMyuvl6su+PyKzuQDYmT8sNcQyuwhXGjOQ5qxcj4je9bx
         18vUeCWkNzsCbMty5mygaCkwICLshwSw455dk91H2oWIq7oLSgGVSLoapyM5OX5Tq0mC
         +nREL8gL8luMqLaICAh0RSHhdbCpkd5GycZyNKx03vOO8CYU7YmznHZgAa59oWGRVhlX
         FuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=apjGCWFPOQy9L70tKGL8ZjhS6bA/j58M3lX5M1kF1Cw=;
        b=Jsep2vbe6zJ7FAMIWLuROzyGY2x4Jd/Aky1r35Z+mp2woLCN7d5J0vRGZt/W7MK0C/
         8FDlXP3O7fLIQinSoAUPdKFMXv9utzXB9SeGHIhE5fFZN3i7RnLovITZaRFQ2wuzQQbr
         GJ2nldJ7sAsL30cXuz5obm8xMyAGGlyipnQdoDCbpKAtsg99FA9H3dZxnz4V6zcYswmX
         AdXQuDDYWskeBK5CK0svAjBOodSSOFWIs9+n3E+L+fufC74U/eiaTyyHyIOfO83UleXA
         BQHAY5owrwCe7qi1xgeH69j9ed5T1Mou6as6l32aWvLp+K4phS+PTjs5P9KvdE+wlORw
         GlXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z202si1212793qka.166.2019.06.06.01.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 01:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYnze-0004WL-7V
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 04:43:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYnyV-0003m0-8F
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 04:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYnyT-0003EM-7O
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 04:42:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hYnyR-0003B2-7o; Thu, 06 Jun 2019 04:42:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 317263092641;
	Thu,  6 Jun 2019 08:42:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0045B18AC1;
	Thu,  6 Jun 2019 08:42:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8609D11386A0; Thu,  6 Jun 2019 10:42:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-5-richard.henderson@linaro.org>
	<CAL1e-=jYwL9bb_YVp28pf=R4Gb0+1MgxYLsO=2927W=CtUrQ-A@mail.gmail.com>
Date: Thu, 06 Jun 2019 10:42:12 +0200
In-Reply-To: <CAL1e-=jYwL9bb_YVp28pf=R4Gb0+1MgxYLsO=2927W=CtUrQ-A@mail.gmail.com>
	(Aleksandar Markovic's message of "Thu, 6 Jun 2019 07:45:58 +0200")
Message-ID: <87o93bhzq3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 06 Jun 2019 08:42:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 4/6] include/elf: Add defines
 related to notes for GNU systems
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cWr+VFR/kgtU

Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> On Jun 5, 2019 11:03 PM, "Richard Henderson" <richard.henderson@linaro.org>
> wrote:
>>
>> This is a collection of related
>
> Related to what?
>
>> defines for notes, copied
>> from glibc's <elf.h>.  We're not going to use all of these
>> right away, but it seemed foolish
>
> I don't think this an appropriate word for a commit message.

Calling an alternative you considered but rejected "foolish" feels
perfectly alright to me.

>> to cherry-pick only the
>> ones we need now.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
