Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1200667wrt;
        Wed, 28 Nov 2018 07:51:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W+MZ5f8r7GsS8wOTy+mhUh0oAdAtK5Jgb5KpOFmYf9BFApNB4I45e4kJxWhrhHp4fhQflI
X-Received: by 2002:a0d:c046:: with SMTP id b67mr2159893ywd.93.1543420276294;
        Wed, 28 Nov 2018 07:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543420276; cv=none;
        d=google.com; s=arc-20160816;
        b=jYa1SC97quSoIOe1uAWCIGoz6v51IAtSWscXYY3BjxaSIHl4YquPe7wVOiaNjjv9o/
         8aIHDwB3JVNykfsR9VOI0P5D8ZMEp+tr30bA8Tp/LnysYx519SKT0hKi+oFwXaSRUsyW
         ES9ZstlbsXjD6SBcYtA5qIfaKHAwc15L4kVgC9OftSmc/5GC7GrVax33EZh+GgIB1ZVL
         5TIUrxN2LRyBZQ69ByEIQiTfzN6S7EzP/Uv2yZli7urZYunbJBgp3VfzKOxWdvEy4cKa
         0OmeMzFIkXoWpYNFodUxjFn2ZK4KVnw1EiPlNmuec8BDTG3/qOCl46oGDmsArAHXe4ii
         E1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=p3GnGfz/2d6EpA3NKJR3FSoWyD/MY2TfojoNoIFPd8s=;
        b=g7sH9RM/whfBItJ01+LDtJ3bJ7sMjhnjWswGLw34DsAYUKsapNzWTVLKAiGDmaETMr
         E/waV/xwlBx99dlCueqCbWxTDv216HupcfnBxT3hc3xMrMcroH9udXnyGCkboQ4TRjLQ
         Muj6tm53n/z3FJuHgcy0GtSeSSE0B/jElZ/RDA5XYDJx2IowKMnNieZ/k20V5ats2GuI
         PsdOzusNjpuadSSnY9sKnPTylSVE6Zu4Hnlrd3ml0UWyyRAaTRQZJ77uaouOwpxxIX74
         zYHX5TrP82xrZwqYgXXZQi8/fo7GLt+pqRMcmcJN4ouwPWEwbubU13pRF7BsFGlZ3Tgl
         9EFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11-v6si4881645ybm.129.2018.11.28.07.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 07:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS27P-0004EN-Ps
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 10:51:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS26j-0004CY-CE
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS26e-0007Hn-Ea
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:50:33 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gS26e-0007H8-8S
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:50:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so21164524wrr.0
	for <qemu-devel@nongnu.org>; Wed, 28 Nov 2018 07:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p3GnGfz/2d6EpA3NKJR3FSoWyD/MY2TfojoNoIFPd8s=;
	b=P9q6tnYsUQexVIl+XAwpXVLv9fZhIzfd8aSRlfy0khyqgRWGUdk3Bo3mQIBLfg6lT8
	doRCa3WwD54jwaWK4ArilRNC/UIsB+mMMKqpnySc0Lhfu+wZFcsvefFIql6z6CeE7QWN
	boW/MrDyU/PKx6NpY2R1JyBA5EQ72CkhWtfZD0owoCVIAmDoHFXNlKP/udZHgmrEqsKe
	qenrfoj/notA8gGape2gEWGJwrawj+axa43pJ8P69HyUUnbCxKBKLx/D8k/QFHewTSTi
	GYnZBZ7h5YpBDhEGNVfq+WPqHJSVXKDjOrR00qBRXyjXz0TGpIU7Npl+BA0/6VAfyQ6Z
	C5Rw==
X-Gm-Message-State: AA+aEWa3eDW4WQ4tT071RUEP10GNw0GO7d25FQmgzsV7p539rN3ccCuG
	4Z+qCt7VMmGUSuuPVqnlQYBPrw==
X-Received: by 2002:a5d:5541:: with SMTP id g1mr32571161wrw.330.1543420227310; 
	Wed, 28 Nov 2018 07:50:27 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
	([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
	by smtp.gmail.com with ESMTPSA id
	j24sm11099152wrd.86.2018.11.28.07.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 07:50:26 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
	<2ac07515-10f3-ed38-c022-e583cd1cd36a@redhat.com>
	<ed0252f7-e74c-46e1-b47b-8d0c2e8dd73e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0d74ecc6-419e-0b93-c0a9-4a4ce37a7ca5@redhat.com>
Date: Wed, 28 Nov 2018 16:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <ed0252f7-e74c-46e1-b47b-8d0c2e8dd73e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper: Fix
 compilation with clang 3.4
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
Cc: qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MVdwQSioP3M9

On 28/11/18 15:39, Thomas Huth wrote:
> On 2018-11-28 15:34, Philippe Mathieu-Daudé wrote:
>> On 28/11/18 10:58, Thomas Huth wrote:
>>> Clang 3.4 does not know the "flatten" attribute yet. We've already
>>> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
>>> so use this macro now here, too, to fix this issue.
>>
>> checkpatch candidate?
> 
> I think we'd rather need a docker-based test with such an old version of
> Clang... (since there are also other issues like the double-typedef
> problem that regularly occurs there).

I was thinking of something such (broken code!):

  if ($line =~ /.*__attribute__\w+\(\(flatten\)\)/) {
    ERROR("Use QEMU_FLATTEN ...\n");
  }
