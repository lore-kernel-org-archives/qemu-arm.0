Received: by 10.28.4.212 with SMTP id 203csp3807974wme;
        Tue, 17 Apr 2018 06:16:18 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+JcwUcgqklX05MushnTTpmUbt5OrkeW7nKWWslei5CEoLdcJ0KdsHFmofEb4A0cXtXnFep
X-Received: by 10.129.99.130 with SMTP id x124mr1112779ywb.505.1523970978303;
        Tue, 17 Apr 2018 06:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523970978; cv=none;
        d=google.com; s=arc-20160816;
        b=ZSgFF+f7tgxnt747DHImchtgnlGLNCdcij+HLkli4nEBCO76/lFgNVmCMMES8RywmV
         /d14eR5WSSU8bHp4kE+bPfdwYCidgCbKG1XXoQw1DJMU4LvnhIyyasjXQtjt6N62TAoM
         9mDdDGHudCYBTkb8UIFsetBXEs71+kKwovl2tbe5IRoeNpIHMc8C5Yuru9matJX7Xpta
         y4SFhllYZOvRhkn1l0MAA1/JFu8ldFrwONOjdA64TqHdaXhGC/fn3XQ0qaZVyzBpJW/h
         DtThVv1G1HV8NzlWf+e6jbBU8KHmGZjWJQTu6ogHxrXZzRoRwcp2jlDrWLwXuW8FZScQ
         aocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=DhOt0yYjeFPnx1NrATUeXrrK+PwPgtDbjb6l2TNKZLQ=;
        b=WinHEKMhPQ+CJlL2dfhe+5dskxG/K/gYrAOvWAUCOLnP1BPLRvhzYwIMRTxhmahXqb
         MsiaaKWxtuNl1vNyyQofIJInBCLaZAjkZ3t6UTgVrYoEXj5T69Eu1iAxZ3ueaPHZhCAL
         QdB2mVT8q5UsswSh8zHYqQCrZVgziobb07xNXO6LdyYQ7RINf3+oplZh6+rviN3lSKdZ
         IU6c5sMBNMd+aUZ4j8qEdmwXsi1WjxN9vZIzwvOftI4dHES7N1j61wMKwO0/PEKXt26R
         6U48fYpdnHfBvpYDKcLW6rsqfvhBOAjMhBmHhEmZgJRHJQJ25n1ieeGkzLE0Q3kiujUO
         XD8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v44si4230885qtv.370.2018.04.17.06.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 06:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8QT3-0004ow-Ql
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 09:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f8QSt-0004o9-KC
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 09:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f8QSn-0008S0-W3
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 09:16:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49266 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1f8QSn-0008RM-RI; Tue, 17 Apr 2018 09:16:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F9F7406E973;
	Tue, 17 Apr 2018 13:15:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 682BE214138C;
	Tue, 17 Apr 2018 13:15:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3EB2E11386D7; Tue, 17 Apr 2018 15:15:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<CAFEAcA9pTyF=xHz_2Dt3XqQrUnKrPthFP+zpjV8ba2PVM-s7iw@mail.gmail.com>
Date: Tue, 17 Apr 2018 15:15:50 +0200
In-Reply-To: <CAFEAcA9pTyF=xHz_2Dt3XqQrUnKrPthFP+zpjV8ba2PVM-s7iw@mail.gmail.com>
	(Peter Maydell's message of "Tue, 17 Apr 2018 13:52:38 +0100")
Message-ID: <874lkadldl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 17 Apr 2018 13:15:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 17 Apr 2018 13:15:56 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pdzr4AC6IBCv

Peter Maydell <peter.maydell@linaro.org> writes:

> On 17 April 2018 at 13:12, Markus Armbruster <armbru@redhat.com> wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>>  In case someone wants to help with creating some bug fix patches
>>>  during the QEMU hard freeze phase: This test can now be used to
>>>  trigger lots of introspection bugs that we were not aware of yet.
>>>  I think most of the bugs are due to wrong handling of instance_init
>>>  vs. realize functions.
>>
>> Yes, that's a common class of bugs.  There's little guidance on what
>> kind of work belongs where, and plenty of bad examples.  Some of the bad
>> examples crash (as you found).  Some work fine, typically because the
>> device doesn't support unplug.
>
> I've been vaguely wondering if we should start to recommend that
> all devices have a correctly implemented code path for destroying
> them post-realize, even if they don't actually implement hotplug...

Possibly crazy idea: make devices implement *cold* unplug.  Not really
useful in practice, but it would make the destroy path testable.
