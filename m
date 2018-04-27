Received: by 10.28.4.212 with SMTP id 203csp174072wme;
        Thu, 26 Apr 2018 17:38:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrag2g/VgRRkvtkIO0+jcz2mU+yeMJX4ligtycB1cRFGT6JmgnEV3q836493QPNa9SAIw70
X-Received: by 2002:ac8:2a37:: with SMTP id k52-v6mr180969qtk.333.1524789517886;
        Thu, 26 Apr 2018 17:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789517; cv=none;
        d=google.com; s=arc-20160816;
        b=JsxY7eu+znX/12xtpApdUTRMkI7qY4qALv8CgOLu0rSOh9ad9eIw7HKlB7UHMEePsl
         X2LM7G9hB6p0FLoKW1YtG9UGX7iD1YSvxjfw/58BaRxiA26qdqZZGP9Br3jxhcVtY40e
         ztTXxiS7hKrX0W3kateL9CFusV9gm2PsYeuQ9b9XukjNE4dgUgbzR8JSqTK30kIxhD28
         LixdOEnUgWTT3MmOxHN+91ud5BArsRI/t+tkTpxP1etBwi5Vj4Ex7QwsnIQaSilKWzZk
         F1EpbhmUxP+lGrjOoxos02ti0naWM8QxfBBAS6ePTSCs05oYOHcjQu/t9vKJDuOZENQm
         GnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=K6AaHWCxPG9pjI+8rb10WjvmQiGrdIKUqWxg14H7R3M=;
        b=vxArF4SeUO16UBCGJLSOZWPIQ30LLq+44BHeTI4PFRZCbxDChR3TrT13M7Th3FPpFl
         GSS64BOBzr8O9L6c9S6t+q9T27wXnE/TnkW25KNYSBpQpvOr/SnwfJoRbrA6GUCca9s9
         jQrqn4IFa6Y8IeTfKovwIGGfXwCroeiriSCGiEt3MqnUVNC5pm5skfda/xoMZVDUUVd1
         LQ0yB/bS9NyCS9n7JYBKvP9QnBK61rBr3yYVZiGYa2K/ByaLYaovmc+ZKs7Xk36Xaeew
         ol1YTLyGX27CBhH36hx+mWsWBJGqdHLbg+NcSmzPcEiEKFelqTZnbe/uDO3Lj7RQBMbX
         UAlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z190si135893qkd.16.2018.04.26.17.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrPJ-0003Ej-Ar
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:38:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fBrLA-0008Oo-9b
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fBrL7-0007Pn-7h
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:34:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fBrL7-0007PT-0K; Thu, 26 Apr 2018 20:34:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 384F985543;
	Fri, 27 Apr 2018 00:34:16 +0000 (UTC)
Received: from localhost (ovpn-116-93.gru2.redhat.com [10.97.116.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0F4817D58;
	Fri, 27 Apr 2018 00:34:15 +0000 (UTC)
Date: Thu, 26 Apr 2018 21:34:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20180427003414.GV29865@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877eou2nek.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 27 Apr 2018 00:34:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGGBm6L7lRlD

On Thu, Apr 26, 2018 at 01:54:43PM +0200, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 17.04.2018 14:12, Markus Armbruster wrote:
> >> Thomas Huth <thuth@redhat.com> writes:
> >> 
> >>> Many device introspection crashes only happen if you are using a
> >>> certain machine, e.g.:
> >>>
> >>> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
> >>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
> >>>  "package": "build-all"}, "capabilities": []}}
> >>> { 'execute': 'qmp_capabilities' }
> >>> {"return": {}}
> >>> { 'execute': 'device-list-properties',
> >>>   'arguments': {'typename': 'macio-newworld'}}
> >>> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> >>> Device 'serial0' is in use
> >>> Aborted (core dumped)
> >>>
> >>> To be able to catch these problems, let's extend the device-introspect
> >>> test to check the devices on all machine types. Since this is a rather
> >>> slow operation, the test is only run in "SPEED=slow" mode.
> >> 
> >> If the device works with one machine type, it has a decent chance to
> >> work with others, too.  Thus, testing each device with every machine
> >> type is overkill.  I appreciate having overkill as an option :)
> >> 
> >> What I'd like to see for a quick "make check" is testing each device
> >> once.  That should flush out most bugs.  
> >
> > That's already done with the "none" machine.
> 
> I was too terse.  We test each device with -machine none for every
> target.  Fine if that's quick enough.  If not, we might want to reduce
> redundancy there.
> 
> Actually, a worse offender in the "waste everybody's time via redunancy"
> department could be qom-test.
> 
> > Anyway, do you think my patch here is useful and has a chance of getting
> > included? I.e. shall I re-spin this as a non-RFC patch? Or shall we
> > rather wait for Eduardo's python-based tests to get included into the
> > repository?
> 
> I don't mind having make check SPEED=slow run more extensive tests.
> Assuming we actually run them at least once in a while, which seems
> doubtful.

The infrastructure for Python-based tests might take a while to
be included, as I'm busy with other stuff right now.  I wouldn't
mind including this patch, as long as you don't mind seeing it
deleted after we reimplement it in Python.

-- 
Eduardo
