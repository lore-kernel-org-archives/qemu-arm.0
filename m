Received: by 10.25.21.156 with SMTP id 28csp248568lfv;
        Wed, 24 Aug 2016 03:29:27 -0700 (PDT)
X-Received: by 10.55.177.197 with SMTP id a188mr2703801qkf.75.1472034567064;
        Wed, 24 Aug 2016 03:29:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e75si5794996qkj.333.2016.08.24.03.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 03:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcVR0-0003VD-Ja
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 06:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adamrichter4@gmail.com>) id 1bcVPJ-0002CF-LT
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 06:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <adamrichter4@gmail.com>) id 1bcVPG-0005dQ-FL
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 06:27:41 -0400
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adamrichter4@gmail.com>)
	id 1bcVPG-0005co-Ak; Wed, 24 Aug 2016 06:27:38 -0400
Received: by mail-ua0-f195.google.com with SMTP id 109so944814uat.2;
	Wed, 24 Aug 2016 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NfnPcLq0DAbcMUPtkCqrAtIyGJnZzd6GcPN7JSCeOvY=;
	b=jb+BDex7+JJPu+LSoEDNsCAvH9vTv/xp/X8H2RAAsVJ0jCZXUwy3wD625ZPXO9kMej
	pokRsso3FOCUGYRG/5kObqOWgOqGxJ2CMbEzZx0cAKqvTIrCsjkCVHb3m67mWhg9mjfb
	A16mv7i9wf+3cU5aJQHbeXFGynYlyRSW/0LGCgEtu3z2M1PT/T6Hc+2g/I6Twx4ut7a5
	/lSOxzU8MZ28Ybo0qCCE7s3TEw+5u+xdZYv3zr/VOeS/zh7A3KZ2bMjV9cPxTnxXc2pG
	vAjRy8IYba67yrZRCvFKOqQp+B55K1mTyNbF6oYYjxcQ7JzeHMxq/CBQ8JzXXwWmeWd6
	ukUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NfnPcLq0DAbcMUPtkCqrAtIyGJnZzd6GcPN7JSCeOvY=;
	b=YqP5IcRqZGHVoaXlEpqHGaBlW4uuho1CJl4Tglxn1eSRFCXWeRO25fVApI28i/3jJw
	lPmBRMx6naUdjwWZAcfZzgZkSnNiFRce5ey7ErhzilYd1U06n7My0SofSp0PpbnGj7Od
	+RyrYKZCQK+DaNA7L7I8ktGMX/zqjXg2E+vnyztNuicKUx4lHbVJoR1bOgs9qFVy3R3F
	q4/zidfP2SN7etDw53CcXA0CgfudSjnRbV+MUjhMauX1zM26zjDL2JTsyEpXYcUpE8MN
	eyUJhqVL/h211ojrTSe2L33GN6bzxEgAxs8TkF+5sdwBhWN0Vwp8kv0lF8jBLD9Ztt2O
	fr0A==
X-Gm-Message-State: AEkooust78pyHJcwXLJRA14iw0h+b95fVKROiaVn0AyNMh/23LTmfq2CmrHCgEwGfHj486Ohlr7XVO4NMbIoxg==
X-Received: by 10.31.85.196 with SMTP id j187mr1246224vkb.12.1472034396332;
	Wed, 24 Aug 2016 03:26:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.80.198 with HTTP; Wed, 24 Aug 2016 03:26:35 -0700 (PDT)
In-Reply-To: <20160824083457.GA2032@work-vm>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824083457.GA2032@work-vm>
From: Adam Richter <adamrichter4@gmail.com>
Date: Wed, 24 Aug 2016 10:26:35 +0000
Message-ID: <CAGn-Tghj6gSgqD1s3ynb0zfodNwruhvMqK-P=7p0jvYVJc4ykQ@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.195
Subject: Re: [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: peter.maydell@linaro.org, vijay.kilari@gmail.com, liang.z.li@intel.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKncxLzlVyog

> * Richard Henderson (rth@twiddle.net) wrote:
>> Patches 1-3 remove the use of ifunc from the implementation.
[...]

I am not a qemu developer, but I wanted to write in support of
removing the use of ifunc.

I filed a glibc bug at
https://sourceware.org/bugzilla/show_bug.cgi?id=20480 that I actually
found from these ifuncs in qemu that results in an attempt to execute
and unexecutable page, under unusual conditions that were arguably my
fault but that could happen on other systems.  I have only attempted
to implement a partial fix for this, and I think a complete fix would
be difficult, and the scenario that remains unfixed involves a
security policy that would probably be popular for systems hosting
virtual machine (prohibiting mapping pages simultaneiously writable
and executable).

I hope that that consideration, combined with the micro-costs to
readability and portability of using and ELF specific and perhaps
currently GCC specific feature might tip the balance against the
savings of a level of function call indirection that I assume the use
of ifunc was intended to provide.

Adam
