Received: by 10.28.4.212 with SMTP id 203csp3192996wme;
        Mon, 7 May 2018 09:50:54 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrPgJCkPU5FkYqpljQ86obPlMy7F48LUeHY9PzejdmvVN4URgIauQ2oVsP0bp+j11Qg2sFH
X-Received: by 2002:ac8:2ff6:: with SMTP id m51-v6mr33844577qta.265.1525711854687;
        Mon, 07 May 2018 09:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525711854; cv=none;
        d=google.com; s=arc-20160816;
        b=isq/a3HbYu/XsGIovS4LVHjMSoWI7koUHc6Xg4UK+YLvzl4GBsSTZ123ArDemijz66
         9bmOwieorIJguBYezLUPl6xoM0kz+VgFuGKTm352TPdLtqLXFUwKuhYgO8yT/eH7xzIn
         vCLSSdtpYVF2QLvyGbRN5XyfnAQw2P7UgKi4izCukmolbNR4cCf17LgkyGayLx54Aqfn
         vFqEHFshTsp7fpNdeJJ11jxjiX/Gm03v9zTRIDACpsfHDt52/uPwfbbifSTyQjR5fWNf
         d5wijnAqnq2O6aCrW0Ky8dEzVNT/r6eQFU1yd0HR/iuwm2mIp2cOnPeSVpcouqKxlIlH
         I8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=JO/n+QxJa7hTgDXta7xz/QKPuieMc3hPk52ikPEjPjA=;
        b=tyLcP47m6W7tSvJ6xmySi/zKmebYci/lzyLG2GqM6Q9gap94hhwGXHu1xFkLxXMq4i
         GbaTDMnLwNLGNSwYyPx94Dgw+no2W0ie+qot5o+9ljq5TC5+e5FBef2i65VEP0IgqBcJ
         BPy3pCSE2/Uhh6bB+++g1utVTyRaQC4B90ZUxcQ2r6GY2+NIKYWNCM9FsbJG5iumfDRD
         3Go4rrFFSevwaSsiiru0igdXh1Mb5mUTlPNaXQx0IuTdLGHjc4VAnRRMlEIU2BMgjCx2
         XUK4gCBQXZG1dDjScAd3EYal+ISNFjBzuAhuY+8HJo3C9WQGoO4T7iE9Wb4dJwM/Qx7V
         E4sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h39-v6si3010812qtk.13.2018.05.07.09.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 09:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFjLi-00007B-74
	for alex.bennee@linaro.org; Mon, 07 May 2018 12:50:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fFjLb-000071-EK
	for qemu-arm@nongnu.org; Mon, 07 May 2018 12:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fFjLY-0001mr-Bu
	for qemu-arm@nongnu.org; Mon, 07 May 2018 12:50:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52802 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fFjLY-0001mA-6U; Mon, 07 May 2018 12:50:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1377401DEC5;
	Mon,  7 May 2018 16:50:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB7F215CDA7;
	Mon,  7 May 2018 16:50:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B147B1138645; Mon,  7 May 2018 18:50:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
Date: Mon, 07 May 2018 18:50:35 +0200
In-Reply-To: <20180507135330.GS25013@localhost.localdomain> (Eduardo Habkost's
	message of "Mon, 7 May 2018 10:53:30 -0300")
Message-ID: <87h8njtnok.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 16:50:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 16:50:40 +0000 (UTC) for IP:'10.11.54.6'
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
X-TUID: JYCuC4HO3IFP

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>> >> On 26.04.2018 13:45, Markus Armbruster wrote:
>> >> > Thomas Huth <thuth@redhat.com> writes:
>> >> [...]
>> >> >> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>> >> >>      qtest_end();
>> >> >>  }
>> >> >>  
>> >> >> +static void add_machine_test_case(const char *mname)
>> >> >> +{
>> >> >> +    char *path, *args;
>> >> >> +
>> >> >> +    /* Ignore blacklisted machines */
>> >> >> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>> >> >> +        return;
>> >> >> +    }
>> >> >> +
>> >> >> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
>> >> >> +    args = g_strdup_printf("-machine %s", mname);
>> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> >> > 
>> >> > This runs test_device_intro_concrete() with "-machine M" for all machine
>> >> > types M, in SPEED=slow mode.
>> >> > 
>> >> >> +    g_free(path);
>> >> >> +
>> >> >> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
>> >> >> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
>> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> >> > 
>> >> > This runs test_device_intro_concrete() with "-nodefaults -machine M" for
>> >> > all machine types M, in SPEED=slow mode.
>> >> > 
>> >> > Has "without -nodefaults" exposed additional bugs?
>> >> 
>> >> After testing this with all machines, I had to discover that
>> >> "-nodefaults" does not work so easily: A lot of the embedded machines
>> >> (especially the ARM machines) simply refuse to work with "-nodefaults"
>> >> and exit immediately instead. E.g.:
>> >> 
>> >> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
>> >> qemu-system-arm: missing SecureDigital device
>> 
>> These are all bugs.  --nodefaults is supposed to suppress *optional*
>> devices, not mandatory ones.
>
> I'm not sure I understand the requirements.  What exactly is the
> definition of "mandatory"?
>
> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
> is useless because it has no any device to boot from.  How is
> that different from a n810 machine not booting because there's no
> SD device?

I propose:

* Stuff that's required for QEMU to run is not suppressed by -nodefaults

* Stuff that a real machine has soldered on is also not suppressed

* Stuff that can be pulled out of a real machine may be suppressed, even
  when that means the guest won't run

Does that make some sense?
