Received: by 10.28.4.212 with SMTP id 203csp3742954wme;
        Tue, 17 Apr 2018 05:12:44 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48KbubhkYLghidqicZP29rRK+oXsSA5njc9/XEoRzghP4X7Egwi95NvkkfJhe1NKif4WgDv
X-Received: by 10.129.48.207 with SMTP id w198mr882595yww.247.1523967164098;
        Tue, 17 Apr 2018 05:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523967164; cv=none;
        d=google.com; s=arc-20160816;
        b=seg9kPydVAaqljzY0cPr+5I+H85R5eXJL/16PwBpfcVFFeXqniAOHDWXR8+xbBEjtg
         2Uag6ZyqzMF7YsAVfN6K5E/A5SUvkvHrUnScvwcuuCBntjN44mJ5xZN4neYZBegeHyua
         adJwH83LU9rbzLrEX74so8AYbuFaCQsYtjLeO5Zy5JOeduS8dKnlYDurSM/3gVUpG501
         YiVguPjXFgjMAlsO2hu/wn4ipqksJJaYkPqZ2qmpG2KJ8hUfZS+C/iqNS8aUMeQD11nr
         VPGskZOzgivdDST3ttH0p9uzXSgzOMK07fvw+ntpXp2DVBygFTWF4aaRDNhlXLiS7nkA
         QFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=kBgl4WfbXkZoAcIX0B7Uzq2fE1fh9XiffSHjinbIwOE=;
        b=vXTaRG3pojSDlzD4kONruGixvPNOcAYY1o4VHcgSKZ84nV+lehxavdCG5X2nzMIRxx
         kVZ8CYcgq1NzqeHLHKnTLAl3wTVe283ZjSyldtyZCjzauuSL7pvU0AkeuBBUZy2Soumx
         5/3z6S2Tw3Dors6Y6hHrQRjpzcH6HqwEIKTxLwT7eZW/7Ju6immVOhPnIHvxm02oOzr7
         jozfsbVuCpVHGAzP77HIfi5L5MRx9nu3PMI6eE5pdVoDYX+hzGpe3TpKcLCACzupWsnN
         8dfxJw/SUGpU6VDg3bFflo+p7Lddgkpp6awvHhzl/+Zwskk/I1bvaFY7albC/sV6rDu2
         rFag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si3885756qkb.121.2018.04.17.05.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 05:12:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8PTX-0000em-M7
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 08:12:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f8PTQ-0000eM-8I
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 08:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f8PTK-0001oj-Gx
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 08:12:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50196 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1f8PTK-0001oM-Bp; Tue, 17 Apr 2018 08:12:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A04CF8DC37;
	Tue, 17 Apr 2018 12:12:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72023111DD02;
	Tue, 17 Apr 2018 12:12:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 50C0011386D7; Tue, 17 Apr 2018 14:12:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
Date: Tue, 17 Apr 2018 14:12:12 +0200
In-Reply-To: <1521452376-25099-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 19 Mar 2018 10:39:36 +0100")
Message-ID: <87in8qf2w3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 17 Apr 2018 12:12:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 17 Apr 2018 12:12:19 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BJWIV6WxFr4A

Thomas Huth <thuth@redhat.com> writes:

> Many device introspection crashes only happen if you are using a
> certain machine, e.g.:
>
> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> { 'execute': 'qmp_capabilities' }
> {"return": {}}
> { 'execute': 'device-list-properties',
>   'arguments': {'typename': 'macio-newworld'}}
> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> Device 'serial0' is in use
> Aborted (core dumped)
>
> To be able to catch these problems, let's extend the device-introspect
> test to check the devices on all machine types. Since this is a rather
> slow operation, the test is only run in "SPEED=slow" mode.

If the device works with one machine type, it has a decent chance to
work with others, too.  Thus, testing each device with every machine
type is overkill.  I appreciate having overkill as an option :)

What I'd like to see for a quick "make check" is testing each device
once.  That should flush out most bugs.  

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  In case someone wants to help with creating some bug fix patches
>  during the QEMU hard freeze phase: This test can now be used to
>  trigger lots of introspection bugs that we were not aware of yet.
>  I think most of the bugs are due to wrong handling of instance_init
>  vs. realize functions.

Yes, that's a common class of bugs.  There's little guidance on what
kind of work belongs where, and plenty of bad examples.  Some of the bad
examples crash (as you found).  Some work fine, typically because the
device doesn't support unplug.

Bad examples breed more bad code, so we better fix them all.  The ones
that work are harder to find...
