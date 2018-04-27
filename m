Received: by 10.28.4.212 with SMTP id 203csp965141wme;
        Fri, 27 Apr 2018 09:30:39 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrNxASfxNrU2I62aGUVO6Q8ltO0/5vnHW+FKsuA/B3ejzcx1Gk4d4MsJIovIwYuI1SuRWe5
X-Received: by 10.55.167.195 with SMTP id q186mr2437511qke.296.1524846639558;
        Fri, 27 Apr 2018 09:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524846639; cv=none;
        d=google.com; s=arc-20160816;
        b=rUQNnahngRmf72FZyMko3AcLHfHl9PhwUkSC+shGuEmjwWR3/41m+/6ZwUuuGmpQDo
         8971S7C5sggJlFr+QiABYEJ29S71RcSvj1ueDpq9ep7Lb81rIfoLQM8s7S3TyUsInhaP
         wpcloeS+fmtxGg0GcKmsQufhc4ik/Nkng2EGP8N1IXE3WYYOig+Bfjov0R4ZsSG+WMYc
         nGJ1JE8wfcUmooA6mwmwuJb/QCi1BzJ6GKaAKH9AezyjbPBhJVKdbzTihxXOu6KBK15U
         Tp4Fnbuy5KDvUJmg76KmccibMW0LCKFAUETMHpIKjIkSmjGOMeB4WKKbIYFcGGJNwgvQ
         j6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=06z7ERgT3uPGgFBaLi6G4XGiIW33xJQqPnHKmhZr7AY=;
        b=AW9rw27kQsla8Ov5FU7DpdJkK9Imbe+UxoMT+s0PAoH5k/YYGgTHncYEXIsq8nVY9Q
         MoiVp44JSI2eWGxjQSJHPZ/OXdGqTVhB8kfDbD5h7QVdmOgLcq/0mKQ1OuPgXAwsFepo
         LhB93PZNYi/8joCQgDiCP8oLjV0oFKgX5U/FzNlrNxgw4jNe2gZRcbUNd6QansE1s6Ql
         HEYlKAennzhh4GY8M9adoXpJQuOTUMe4nmHvuJrHl7eZSiMrl5nIzlQ4XSzBbw80rRTa
         v71wC5/m+rhfbamLDv05xUpkP7n1agKK89dCBmHwOZrY+vFVmCoGmNuoVejLyRTIPkh6
         sFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n21-v6si1762345qtl.84.2018.04.27.09.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 09:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC6Gd-0003jI-39
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 12:30:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fC6GX-0003jD-B7
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 12:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fC6GS-00078p-5h
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 12:30:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37864 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fC6GS-00078c-1x; Fri, 27 Apr 2018 12:30:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C564D818B126;
	Fri, 27 Apr 2018 16:30:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD5D215CDD0;
	Fri, 27 Apr 2018 16:30:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 394F11138645; Fri, 27 Apr 2018 18:30:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
	<CAFEAcA_VAckXDgARe5dJdxe9N19quUD5Dn+Dseuj=itLbFmG0g@mail.gmail.com>
	<40c06711-f9a0-3440-9a47-8230cbcb3d55@redhat.com>
Date: Fri, 27 Apr 2018 18:30:18 +0200
In-Reply-To: <40c06711-f9a0-3440-9a47-8230cbcb3d55@redhat.com> (Thomas Huth's
	message of "Fri, 27 Apr 2018 12:24:57 +0200")
Message-ID: <87muxoehnp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 16:30:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 16:30:23 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel]   qom-test
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YglKLgcg0UrT

Thomas Huth <thuth@redhat.com> writes:

> On 27.04.2018 12:20, Peter Maydell wrote:
>> On 27 April 2018 at 07:06, Thomas Huth <thuth@redhat.com> wrote:
>>> On 26.04.2018 13:54, Markus Armbruster wrote:
>>> [...]
>>>> Actually, a worse offender in the "waste everybody's time via redunancy"
>>>> department could be qom-test.

Supporting numbers:

$ time for i in *-softmmu/qemu-system-*; do [ -x $i ] || continue; QTEST_QEMU_BINARY=$i QTEST_QEMU_IMG=qemu-img MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))} gtester -k --verbose -m=quick  tests/qom-test ; done
[...]
real	3m27.427s
user	2m7.141s
sys	1m44.354s

aarch64, arm, i386, x86_64 each take more than 30s.

For each target, we walk /machine and qom-get every property.  The test
passes if qom-get doesn't crash, the values we get don't matter.

For x86_64 alone, qom-test executes qom-get more than 45,000 times to
test almost 9,500 objects.  It gets the properties of more than 5000
qemu:memory-region objects, more than 2500 irq objects, almost 300
smbus-eeprom objects, 110 IDE objects, ...  It's nice we can test
qom-get doesn't crash on any of IDE's properties in 110 very slight
variations.  But most of the time, one of the variations would be
enough.

>>> Shall we change qom-test to also only test with the "none" machine in
>>> the normal "make check" mode and only do the full test with all machines
>>> in "make check SPEED=slow" ?
>> 
>> We definitely want something that tries to instantiate every
>> machine, because that does catch bugs.
>
> Yes, after having a closer look at this one, I also think that we should
> *not* change it to run with "none" by default only. The 'qom-list'
> command results in quite a different output depending on which machine
> you run it on.

Only running "none" is too naive.
