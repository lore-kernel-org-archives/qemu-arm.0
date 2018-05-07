Received: by 10.28.4.212 with SMTP id 203csp3281035wme;
        Mon, 7 May 2018 11:22:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZofwyY5h/NTW7dBzV+DZvJf7ETm1l9+D31AWNX/lS6PlgMPUF605Lvfs7k8KGGUHhLKNwAX
X-Received: by 10.55.40.68 with SMTP id o65mr30487302qkh.33.1525717327552;
        Mon, 07 May 2018 11:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525717327; cv=none;
        d=google.com; s=arc-20160816;
        b=ib2HLcHtH9eHD1KFHY17crX05v9a8x9kh22Qr3w2oV6EwIbB+Bjt1w+ANZ+fLILu1J
         Ze9Gchlubkhl1q6mWjmoX7M9yyJNTLbTxrWXScYJvkeDxG0A2JuKtIQ8P13wy7uHt+HO
         Ca9REQ+ImwZ7SnjzCoI8hPLebYfBTgjpI9nKtDiLpZgEyycdDo75vD55xe+P8R1wmYAI
         K6zIP6ViNmyn//WTLgpKZcL37wFM9bPTSbPGoQq6eDy+2758RW+cYj7omK+3ASW8sV6+
         4l+2SHoZORViu58iYrcK2ZL0T8KuM1epcgCWs8SUqZeCheglqmpCdEtQaLd8c+ii7KuR
         Txbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=S33vjVKMNw0U7aRSfCkkU5hpIPX5CmDrW44b7AbAs9I=;
        b=j7MODDcz/Zmq9f1EgdtLsOwlrWYnpdELFxUQ5XQiiA/Y2iTXNdZDm4bNtLP6Y9ZV/Y
         Z62Kody96hhVZPguvXU5/SPLWiRh43KxDS5Ps2gjkdWPyoqBK9d5pYr+iy1mB76HMffF
         Z/ROH55npJqBqIptihlT4QrmHuHKxrq+ty8Bb/zoWZw9vOkexAv2slzlW+DWqniRgxh/
         7Jpxp0uvKzK+IKxwU+AQp6iME+F9ToW++j/mHyRUpnh/+Pd7/XLSL4UtkHfKRCING9gJ
         tBFHBPToNI9qESYvZ2b0+l2LMUFj3/1Z/GcSu1yWAEmPB52X4YmRghdPNDs2njhse/Ip
         iQFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20-v6si2650484qtm.289.2018.05.07.11.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 11:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFklz-0006TZ-2D
	for alex.bennee@linaro.org; Mon, 07 May 2018 14:22:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFklV-0006RL-Du
	for qemu-devel@nongnu.org; Mon, 07 May 2018 14:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFklU-0008AW-77
	for qemu-devel@nongnu.org; Mon, 07 May 2018 14:21:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fFklN-00086r-Gc; Mon, 07 May 2018 14:21:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67B2430B96CA;
	Mon,  7 May 2018 18:21:28 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B05CD68D93;
	Mon,  7 May 2018 18:21:27 +0000 (UTC)
Date: Mon, 7 May 2018 15:21:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20180507182126.GC25013@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8njtnok.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 07 May 2018 18:21:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH] tests/device-introspect: Test devices
 with all machines, not only with "none"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEx9E2mnG4JW

On Mon, May 07, 2018 at 06:50:35PM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >> 
> >> > On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
> >> >> On 26.04.2018 13:45, Markus Armbruster wrote:
> >> >> > Thomas Huth <thuth@redhat.com> writes:
> >> >> [...]
> >> >> >> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
> >> >> >>      qtest_end();
> >> >> >>  }
> >> >> >>  
> >> >> >> +static void add_machine_test_case(const char *mname)
> >> >> >> +{
> >> >> >> +    char *path, *args;
> >> >> >> +
> >> >> >> +    /* Ignore blacklisted machines */
> >> >> >> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> >> >> >> +        return;
> >> >> >> +    }
> >> >> >> +
> >> >> >> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> >> >> >> +    args = g_strdup_printf("-machine %s", mname);
> >> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >> >> > 
> >> >> > This runs test_device_intro_concrete() with "-machine M" for all machine
> >> >> > types M, in SPEED=slow mode.
> >> >> > 
> >> >> >> +    g_free(path);
> >> >> >> +
> >> >> >> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> >> >> >> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> >> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >> >> > 
> >> >> > This runs test_device_intro_concrete() with "-nodefaults -machine M" for
> >> >> > all machine types M, in SPEED=slow mode.
> >> >> > 
> >> >> > Has "without -nodefaults" exposed additional bugs?
> >> >> 
> >> >> After testing this with all machines, I had to discover that
> >> >> "-nodefaults" does not work so easily: A lot of the embedded machines
> >> >> (especially the ARM machines) simply refuse to work with "-nodefaults"
> >> >> and exit immediately instead. E.g.:
> >> >> 
> >> >> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
> >> >> qemu-system-arm: missing SecureDigital device
> >> 
> >> These are all bugs.  --nodefaults is supposed to suppress *optional*
> >> devices, not mandatory ones.
> >
> > I'm not sure I understand the requirements.  What exactly is the
> > definition of "mandatory"?
> >
> > A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
> > is useless because it has no any device to boot from.  How is
> > that different from a n810 machine not booting because there's no
> > SD device?
> 
> I propose:
> 
> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
> 
> * Stuff that a real machine has soldered on is also not suppressed
> 
> * Stuff that can be pulled out of a real machine may be suppressed, even
>   when that means the guest won't run

Makes sense to me.  It looks like the only obstacle for
tests/device-introspect and device-crash-test is the first rule.
"Guest won't boot" isn't a problem, but "QEMU won't run" is.

The first rule is easily testable, too: running
"$QEMU -machine $MACHINE -nodefaults" and not having a working
QMP monitor should be reported as a bug by automated tests.

Do we have an up-to-date list of machines that break this rule?
We can add this to
<https://wiki.qemu.org/Contribute/BiteSizedTasks>.

-- 
Eduardo
