Received: by 10.28.4.212 with SMTP id 203csp406990wme;
        Thu, 26 Apr 2018 23:32:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpO0V3DFpwmRPLfSJmXj6LNhZaGpC5zAZQGYa0Lu6b/BSZzlLxZHf3lomH6j77pQxdiy8yZ
X-Received: by 2002:a0c:d1f1:: with SMTP id k46-v6mr916330qvh.58.1524810757694;
        Thu, 26 Apr 2018 23:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524810757; cv=none;
        d=google.com; s=arc-20160816;
        b=bHtLy9n/WcQ9qxkIVitC6pFflWX9ftQ0Fws0hkpxd4nTWE/iANqi0V9pTmHxjNrSlz
         zKmSiefRMje5TbG5txJV20HQ4RQpGi8dfb/s4TVyL9zqdKjhC+d2BHvq2nIc6spn5qxe
         IrFhsfmKu7APrlFW73DhjpJyy/gDJ6xT082Sc7At35HkC3bII1o1bqwZ5wOXJrUNNTo+
         Xs+jBBXX/XF/OVzt4MzrmngjEo9fnfX1WWbMLejOfz1Ui0hpx1UiPuUAW/h+9hPiD4G6
         eXkz/UqSv8gq2oBVhMoMrWPdrZOXI8joPisc6ZhgldAUWeWCJ6kE7B/cdz6dDEdW29Uc
         A4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=HAwPIFr4tcNLqTUAAmerWjvBX+H7QuxyMvZ7HRwKHKg=;
        b=sMqUKnrsT/r6wzA0/16m1jw5ReAE6SyiiuHcmiE6l7QEVgIDpzzlrzHYRMtE0JXdSM
         S8YuLQ136p4pnXNFSEU8QERC95/hiED7F33B2MMzGDDgKnwByjRdlnuKR9NtxHIhq6E4
         zImJiWxtRmstSjduGgzVSkdhfAhORl5mKGwl9CPXL8SGrJ51z2NWnW1cjt9NYpGKiS2j
         Cjx7dYki2QG04mNaPUBt/96qEUfajB7Cd0SjWHoYCdQkeMlfTkfMbFDKLAW1JdpG8OeD
         1Tpq56KUii0e9JNxRzgXbvZz9FrCDS9t808FxI+Jy8ZsASxa2t3FKF/+yUorcLpDRQ3a
         soYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si679265qvh.200.2018.04.26.23.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 23:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBwvs-0004gi-RF
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 02:32:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBwvM-0004Sh-T3
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBwvI-00073v-0Y
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:32:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47846 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fBwvH-00073f-SP; Fri, 27 Apr 2018 02:31:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 516C540858CD;
	Fri, 27 Apr 2018 06:31:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B15F215CDCB;
	Fri, 27 Apr 2018 06:31:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0C1AC1138645; Fri, 27 Apr 2018 08:31:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
Date: Fri, 27 Apr 2018 08:31:58 +0200
In-Reply-To: <20180427003215.GU29865@localhost.localdomain> (Eduardo Habkost's
	message of "Thu, 26 Apr 2018 21:32:15 -0300")
Message-ID: <87o9i5uplt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 27 Apr 2018 06:31:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 27 Apr 2018 06:31:59 +0000 (UTC) for IP:'10.11.54.6'
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xAn5N48ntEEa

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>> On 26.04.2018 13:45, Markus Armbruster wrote:
>> > Thomas Huth <thuth@redhat.com> writes:
>> [...]
>> >> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>> >>      qtest_end();
>> >>  }
>> >>  
>> >> +static void add_machine_test_case(const char *mname)
>> >> +{
>> >> +    char *path, *args;
>> >> +
>> >> +    /* Ignore blacklisted machines */
>> >> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
>> >> +    args = g_strdup_printf("-machine %s", mname);
>> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> > 
>> > This runs test_device_intro_concrete() with "-machine M" for all machine
>> > types M, in SPEED=slow mode.
>> > 
>> >> +    g_free(path);
>> >> +
>> >> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
>> >> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
>> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> > 
>> > This runs test_device_intro_concrete() with "-nodefaults -machine M" for
>> > all machine types M, in SPEED=slow mode.
>> > 
>> > Has "without -nodefaults" exposed additional bugs?
>> 
>> After testing this with all machines, I had to discover that
>> "-nodefaults" does not work so easily: A lot of the embedded machines
>> (especially the ARM machines) simply refuse to work with "-nodefaults"
>> and exit immediately instead. E.g.:
>> 
>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
>> qemu-system-arm: missing SecureDigital device

These are all bugs.  --nodefaults is supposed to suppress *optional*
devices, not mandatory ones.

>> So we'd either need a rather big black list for the machines that do not
>> work, or simply drop the "-nodefaults" tests from this patch.
>
> Or we could try to test all machines anyway, but not consider it
> an error if QEMU just does exit(1).  Can the qtest C API give us
> that information?
>
> (Or we could simply let -nodefaults aside by now, and do this
> after we implement this test case in Python.)

Or we could fix the bugs.
