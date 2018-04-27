Received: by 10.28.4.212 with SMTP id 203csp170698wme;
        Thu, 26 Apr 2018 17:33:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqpGbMiyE18jC0gMWo5egax/ipHWwgX5BeUul3R/mNemRz7HQ8yKbcNiNOQSBGv6UNHep4P
X-Received: by 2002:ac8:2ff6:: with SMTP id m51-v6mr174194qta.265.1524789186920;
        Thu, 26 Apr 2018 17:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789186; cv=none;
        d=google.com; s=arc-20160816;
        b=lmJ59+Xb9cVCNvuYW8ry+Yl53Klf73yHsxTCD47D52jkr7PeDT9ZSnFtxKWYn5awOj
         HZr9rxFMJN72nme8/I7g5ENZAlIy9tyWnUJ3PivprMRZoiUPGUSpnJ10UZLPAixIRYml
         nX6TSbUzB4G6ZjNxV3wCPBU8ip1PqlctFx9tCn3kgzakozHhklNsHOioVZV38C52OIdp
         9RmHotkKBm5eLAyPU7rOAWymiB9LPJDi2WbX23tWmxvShHNv3i5XPuk4Rr8UFI2YaEuX
         Su4Lu0UBAoDAd9EginYD3Z4rUO8lI924kbPInHiydXWp/WccSWjU1CkdhM7YIAzj2QC1
         a6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=2FvYCfvvIGDvqPL38LTbsWJSOSQqIeDItTR+68GiojI=;
        b=hMXCNSlQxc7sNCEMhxq5cqSzxArKh0vz8+YZTp/LO+qGkXhbHPgRcYK60ALYmM7Hgw
         Bf5aWEhGWq7QD9LU8eIL2NcA9mPQgE3281DpZxGhRUM8G4Bz0tPIRM3g811vYG4vssCV
         +cO2xKtik4xc5AsqH0+hvj5p2fLN4bE0QsXc9uDikUNGOBjLDYI24dxU68JAUruHsjIV
         yRm3d+bNI23gsU6HwbRoRQWYRN+A426NSn4t/+uA7hDL4cil9qRQyu2nlq2bbPcNADVA
         Mpekc3T28FyGoUz5d6lmlX0IsmUlMcUcI7A733kJhw+ipL767kDT88EGQyHRA3XwKs3c
         Y3xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a62si105413qkd.282.2018.04.26.17.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrJy-0006jx-Ab
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:33:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fBrJI-0006hn-2n
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fBrJH-0006pZ-56
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:32:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53966)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fBrJC-0006o6-LQ; Thu, 26 Apr 2018 20:32:18 -0400
Received: from smtp.corp.redhat.com (int-mx12.intmail.prod.int.phx2.redhat.com
	[10.5.11.27])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A103188CC1;
	Fri, 27 Apr 2018 00:32:17 +0000 (UTC)
Received: from localhost (ovpn-116-93.gru2.redhat.com [10.97.116.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 412BD1C326;
	Fri, 27 Apr 2018 00:32:17 +0000 (UTC)
Date: Thu, 26 Apr 2018 21:32:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180427003215.GU29865@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 27 Apr 2018 00:32:17 +0000 (UTC)
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: viAi+/W3XYEW

On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
> On 26.04.2018 13:45, Markus Armbruster wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> [...]
> >> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
> >>      qtest_end();
> >>  }
> >>  
> >> +static void add_machine_test_case(const char *mname)
> >> +{
> >> +    char *path, *args;
> >> +
> >> +    /* Ignore blacklisted machines */
> >> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> >> +        return;
> >> +    }
> >> +
> >> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> >> +    args = g_strdup_printf("-machine %s", mname);
> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> > 
> > This runs test_device_intro_concrete() with "-machine M" for all machine
> > types M, in SPEED=slow mode.
> > 
> >> +    g_free(path);
> >> +
> >> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> >> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> > 
> > This runs test_device_intro_concrete() with "-nodefaults -machine M" for
> > all machine types M, in SPEED=slow mode.
> > 
> > Has "without -nodefaults" exposed additional bugs?
> 
> After testing this with all machines, I had to discover that
> "-nodefaults" does not work so easily: A lot of the embedded machines
> (especially the ARM machines) simply refuse to work with "-nodefaults"
> and exit immediately instead. E.g.:
> 
> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
> qemu-system-arm: missing SecureDigital device
> 
> So we'd either need a rather big black list for the machines that do not
> work, or simply drop the "-nodefaults" tests from this patch.

Or we could try to test all machines anyway, but not consider it
an error if QEMU just does exit(1).  Can the qtest C API give us
that information?

(Or we could simply let -nodefaults aside by now, and do this
after we implement this test case in Python.)

-- 
Eduardo
