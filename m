Received: by 10.28.4.212 with SMTP id 203csp3005892wme;
        Mon, 7 May 2018 06:54:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoGU2t/StymxHxotQDripXZUOKRJ1knkg3p+q5TcOwZy+Euwcs2CvQuWKincanCqpHbcNMw
X-Received: by 10.55.200.20 with SMTP id c20mr31603880qkj.382.1525701259956;
        Mon, 07 May 2018 06:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525701259; cv=none;
        d=google.com; s=arc-20160816;
        b=xwgvrnSNVPc4GlTa7LKikA1lap7aKBGP+rz/7NOMf7CMnQHWsOG8oxTv0EQV3hGYFp
         asm/MkrA98gVmdov1+jMWMR5bsYuv6yFZxyvwz+CGXIqVyjMCMaXjgV9mj+NvYRj2IgG
         xjL2VYLY7tCuzwepcCLJ7pB+fgIcDFewGVgAhIeZR9ZFmad9GJoMZmEfZ1VCAvfPOEvg
         dULTH+W3BxN27QNZWKtS2naC3fbxk3OejOqcZBnKEnC/KrHkrXr1jziCtgGR1+/g4Whe
         NSmFZogTEzIKVUX0nyVfSVmUM3R2lgbq008LZJ6mz7yqX2R2l39lmQAb2oCpgU3o0fcQ
         YTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=eWtmAX0gsfSYtp/+iEi2bm6V/N+wtRZZyGBXr8y2lUw=;
        b=l8Ao6tcn6RqSFrCYStRPSmrUqcOB0s10hAbXJtnpJ8y3cNcefPTEn1f5U3vHBrsD2Q
         vKQxs2UPE4VSoeCbTO0hHA1OjVwQ44DiqxpT4EEiia3fh4+3pvKa4kzqDsAPFuGJOV5X
         5HoHlXag0YXI4B+O4RqBaX1Rwjtb5oZhsza1uh+STNLBAQMRTAr/S1Bd+w9gh0p1i+Y9
         SoO11Y1lPN6U+LslrP8MKkJtglhd9M9F78QbQ/4spQXVhXYXdqTZOdwTz9/UqdCkthi9
         5EQLf7SXO9lfd+3tZTPN+fXOAHPPznWnPCD8gPVVF3zeNrLVPEsWP2wa3+dxDQF6Yu66
         cY7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w4-v6si1325129qtn.312.2018.05.07.06.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 06:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFgap-0007oZ-BV
	for alex.bennee@linaro.org; Mon, 07 May 2018 09:54:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFgaJ-0007mf-Ah
	for qemu-devel@nongnu.org; Mon, 07 May 2018 09:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFgaI-0007Ly-Gt
	for qemu-devel@nongnu.org; Mon, 07 May 2018 09:53:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fFgaC-0007Cm-4n; Mon, 07 May 2018 09:53:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84FC230015CF;
	Mon,  7 May 2018 13:53:38 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0873617B4C;
	Mon,  7 May 2018 13:53:32 +0000 (UTC)
Date: Mon, 7 May 2018 10:53:30 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20180507135330.GS25013@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o9i5uplt.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 07 May 2018 13:53:38 +0000 (UTC)
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
X-TUID: b9KoeV6pVm56

On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
> >> On 26.04.2018 13:45, Markus Armbruster wrote:
> >> > Thomas Huth <thuth@redhat.com> writes:
> >> [...]
> >> >> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
> >> >>      qtest_end();
> >> >>  }
> >> >>  
> >> >> +static void add_machine_test_case(const char *mname)
> >> >> +{
> >> >> +    char *path, *args;
> >> >> +
> >> >> +    /* Ignore blacklisted machines */
> >> >> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> >> >> +    args = g_strdup_printf("-machine %s", mname);
> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >> > 
> >> > This runs test_device_intro_concrete() with "-machine M" for all machine
> >> > types M, in SPEED=slow mode.
> >> > 
> >> >> +    g_free(path);
> >> >> +
> >> >> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> >> >> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> >> >> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >> > 
> >> > This runs test_device_intro_concrete() with "-nodefaults -machine M" for
> >> > all machine types M, in SPEED=slow mode.
> >> > 
> >> > Has "without -nodefaults" exposed additional bugs?
> >> 
> >> After testing this with all machines, I had to discover that
> >> "-nodefaults" does not work so easily: A lot of the embedded machines
> >> (especially the ARM machines) simply refuse to work with "-nodefaults"
> >> and exit immediately instead. E.g.:
> >> 
> >> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
> >> qemu-system-arm: missing SecureDigital device
> 
> These are all bugs.  --nodefaults is supposed to suppress *optional*
> devices, not mandatory ones.

I'm not sure I understand the requirements.  What exactly is the
definition of "mandatory"?

A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
is useless because it has no any device to boot from.  How is
that different from a n810 machine not booting because there's no
SD device?

-- 
Eduardo
