Received: by 10.28.71.155 with SMTP id m27csp3449000wmi;
        Tue, 10 Apr 2018 00:42:13 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/r3gTeLzevNs+AIoUqAtpUSUI57O/OPRGUcFTfC3cW6AlYaaZGxofwSqqs1XuuMCWgtKo7
X-Received: by 10.200.71.18 with SMTP id f18mr43639235qtp.166.1523346133249;
        Tue, 10 Apr 2018 00:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523346133; cv=none;
        d=google.com; s=arc-20160816;
        b=wvq/PDNyumIsughwBxgYCdnAeo9+QtHOMkXJjgPZgKj40jwPVFtDTqCg0AlkHtuMff
         ag3rwTAmHlFAtQ00SqqruUBNDHb74rbuNmrYWYl3rUliRbf6jpwXvcNNL40QGtQa1MmN
         xInYRIW0M4jrlEo6FUrBJ7ZppkqkVEXmSNau11B3NsxBSfYBTPU7dQGzwLFERmXi5HGy
         IYQiPL98yb2D8qSRgtSqiEhc1uRHi4tl+qxszt7Nq22wQzdLNjcyuHVCbpI6FcdlcU8D
         Ugbqpba18H1h4flUdhgXm26YtEuUXXLm2WgVloyMCx7Zqjxrl5RBjrySULMZcslo02em
         Wv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to:date
         :to:from:message-id:arc-authentication-results;
        bh=q3dStekWfweLwRwgqfR4txBazSjpI5I0uXtILXYX9Zg=;
        b=dy02gy2a7GllYbfky2NMAepRl0pbTM/zwpcwo+sX0lCndMhMp+1go6qkHaWZf6w+FN
         +MSjvUNX2CXP8lo/bv0A/3IJmvdM6T3SO6f39yA+X5Nh8KHC6Pextrwz11zyleg7420i
         oRelaO11KGfL5NtUeJEwBCyW4J9E3yVVQEMWwM7gRD4Mll3/UAwHSafDHY3yMcRy7J/B
         bN3UG8iZHZ29r7qHM8EzSp037qiqHRVEygalvUTE9/TP4Pee0RAeVyCcSXW8n0GUk2If
         ABIVQ5oKCdYPpVmqddPHS3aIIPf7rPFWXRNztdTvu98uERfBNOB698JgyO/VDbKIJuOd
         mG5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g76si127095qke.10.2018.04.10.00.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Apr 2018 00:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5nuu-0007h3-O3
	for alex.bennee@linaro.org; Tue, 10 Apr 2018 03:42:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1f5nuh-0007fK-FH
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 03:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1f5nud-0001nM-Ej
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 03:41:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54764 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1f5nud-0001mt-AD; Tue, 10 Apr 2018 03:41:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42ECD8011462;
	Tue, 10 Apr 2018 07:41:44 +0000 (UTC)
Received: from inaba.usersys.redhat.com (unknown [10.43.2.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37CD56353F;
	Tue, 10 Apr 2018 07:41:34 +0000 (UTC)
Message-ID: <1523346093.16671.23.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
	<berrange@redhat.com>
Date: Tue, 10 Apr 2018 09:41:33 +0200
In-Reply-To: <6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
	<20180409155634.GO18283@redhat.com>
	<6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 10 Apr 2018 07:41:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 10 Apr 2018 07:41:44 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'abologna@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cfeE5K4ETrSh

On Mon, 2018-04-09 at 11:29 -0500, Wei Huang wrote:
> > > Running mach-virt machine types (i.e. "-M virt") on different systems can
> > > result in various misleading warnings if -cpu and/or gic-version not specified.
> > > For KVM, this can be solved mostly by using "host" type. But the "host" type
> > > doesn't work for TCG. Compared with "host", the "max" type not only supports
> > > auto detection under KVM mode, but also works with TCG. So this patch set
> > > "max" as the default types for both -cpu and gic-version.
> > 
> > Hmm, generally we aim for the config provided by a machine type to be stable
> > across QEMU versions.
> 
> I understand this principle. But in reality, under KVM mode, the default
> config most time doesn't work. If end users specify cpu type manually,
> it still doesn't work because the host CPU is vendor-specific design
> (e.g. "cortex-a57" doesn't work on QCOM's machine). So we end up with
> using "-cpu host" all the time. My argument for this patch is that "-cpu
> max" isn't worse than "-cpu host".

I figure the people not explicitly specifying a CPU model on the
command line will probably also use '-M virt' instead of versioned
machine types, which means they will get a different guest behavior
after upgrading QEMU regardless.

Defaulting to 'max' for '-cpu' and 'gic-version' makes it convenient
to quickly and concisely start a guest; if you care about guest ABI
at all, then you are already specifying everything explicitly on the
command line instead of relying on defaults - or using libvirt ;)

-- 
Andrea Bolognani / Red Hat / Virtualization
