Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4764440wrq;
        Tue, 26 Jun 2018 01:57:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeNMZ3Sj/8OYTOuTyktZkFZQHLx5g7YrBamZw1YvvFx3Ux83dqlQJJFMU/TD1WHMXGgj7w3
X-Received: by 2002:ac8:b45:: with SMTP id m5-v6mr508883qti.335.1530003424795;
        Tue, 26 Jun 2018 01:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530003424; cv=none;
        d=google.com; s=arc-20160816;
        b=dByoOT2Kk9cn6G8j2jhPdIPf8QJFc0kcaVlYWcDrwdQMJm64qpG8MyvfAXC+9bbh/j
         q3ixXAD7o4GutpUU5p6Z6DeOwypcmxVDoRMNfNnVFykrsSaYilqt+lhyzgi5wDCvOsUo
         W/MCNgbr4lpIfEAksDuiCL5Ko3KJdshz6f3Wlv1qC95XdUoevB/eeHboJlDbvuJSJEaj
         FWmFgor8IFFEJYpzIwfE6xPi8FC8l1nqFyuXkmTdDcjfdy2RrXImuuBnyXpCPAgN0Ux5
         9ZjG2P4IhuthxURf7v3pNcs3YWuuETig7pNWfscHC7RLBN4LtOPDD+gnVj2FtKXwlyVP
         VcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=MNzoO9y5Zk/kRYDd12/kbwgkoL5vh6aVBkFmAxp+9TM=;
        b=sBX4pMAkUBVKDFKxdUwCzjra0ps0Oq45L5gWhX9QNLLFH9MwOglgdOG/BTEGb3I5Y6
         eJhJp+EuINa+Bw4snszj9zp2yBzgC3tRDeYgjGD58ijFzn4fy/AXQREKNUF3xyKPmblk
         akqBr5wFugjsJfIj1GUbfxA2BrtyAd/8wr+e+wYR0xD3LsO3OWb7mFIkS0ZzE9Xp7/MD
         TM5193LaLYGGaKS6glzln2ux++tdHtq2YN1Ee5qzli4HaMZ2WUV6JsO/0wC+41WYzej2
         gIQK0deCUNId7nsYgLwPeOq5aS5ixUelF6hR22zN+EdAqHDxAmuXizZC6kEGNW7ZrgRh
         HE/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v81-v6si1095347qkv.189.2018.06.26.01.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 01:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXjma-0003ty-Aj
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 04:57:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjm6-0003sZ-Dv
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 04:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjm5-0007Sx-JI
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 04:56:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXjm1-0007Ns-KL; Tue, 26 Jun 2018 04:56:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 063A181A4EAD;
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40FE42026D6A;
	Tue, 26 Jun 2018 08:56:27 +0000 (UTC)
Date: Tue, 26 Jun 2018 10:56:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180626105625.2396944a.cohuck@redhat.com>
In-Reply-To: <79c0775f-49b5-1d79-a4f9-234941854e4f@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
	<20180626104001.617d4ea9.cohuck@redhat.com>
	<79c0775f-49b5-1d79-a4f9-234941854e4f@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH v3] loader: Check access size
 when calling rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JO7fl2ERC9wB

On Tue, 26 Jun 2018 10:55:09 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 26.06.2018 10:40, Cornelia Huck wrote:
> > On Fri, 15 Jun 2018 11:49:05 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> The rom_ptr() function allows direct access to the ROM blobs that we
> >> load during startup. However, there are currently no checks for the
> >> size of the accesses, so it's currently possible to crash QEMU for
> >> example with:
> >>
> >> $ echo "Insane in the mainframe" > /tmp/test.txt
> >> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> >> Segmentation fault (core dumped)
> >> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> >> Segmentation fault (core dumped)
> >> $ echo -n HdrS > /tmp/hdr.txt
> >> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> >> Segmentation fault (core dumped)
> >>
> >> We need a possibility to check the size of the ROM area that we want
> >> to access, thus let's add a size parameter to the rom_ptr() function
> >> to avoid these problems.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>  
> > 
> > Grmpf, this conflicts with "s390/ipl: fix ipl with -no-reboot" in
> > s390-next... do you want to rebase it?  
> 
> Really? Where is the conflict? I can rebase my patch to your s390-next
> branch, but the patch looks identical after that rebase. As far as I can
> see, the patches only change different parts of the ipl.c file.

Yes, but the result does not compile :)
