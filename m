Received: by 10.28.4.212 with SMTP id 203csp523487wme;
        Thu, 19 Apr 2018 04:11:39 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrtpHaveLcs9wWa7MMO9dBT71oN94YndxtRB8Ru2QYGH8ThI06wFsJPnaMPNyBTYaDl0Ob5
X-Received: by 2002:ac8:18ad:: with SMTP id s42-v6mr5917424qtj.184.1524136299436;
        Thu, 19 Apr 2018 04:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524136299; cv=none;
        d=google.com; s=arc-20160816;
        b=nyJYoivblJHdoscmEl0hPmzWaxCp2lOjO0R/lc6OaFSGQrYy+77dzV33nDy+8vCCYt
         IZRuUBxR+yV2kq3KdmwBbEcSV4Y5IE3iecE56wkh+IR5i8dgXY7LavIvvK7+G4XGLbLS
         TH1US24ghK5j2zPHKM+Dx8KweJgEfTO0V7gEhbGPyBFyH5scHjPf14dCP9g2915WtLkx
         Q75lV4BRPfKli656rJret1xC93IZyQw4Sk2Sr0pXQl/VNjdM/KxBCqF/U2cWXHRbCfgT
         mSxilcWiLPNMf5weB3fWwWT+Szdi30hl3AtPfv5N1dcCMighaix8e//pJtBjX3WNRRmv
         xyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=S8wgRmEjMMXbtpNpn2W1VxKxVtPg1GPUor/xWXhonR4=;
        b=MmqLaXH0Gf9h4SE97lw93ACkbxQmUQ9VYwiw2PQyzSK5CC3CBGxJvaYF0k4SooFPAi
         ptWzWletPJRXLoOeHQDsGE24k4mnXEY3Xi/GxhGdq+Gc8nFvV54aZQYTNAH4Nc59w2CN
         o6FvmnvhkC+krpLuBmcRp/CicMGFzXEmq8wM/cQefBiOTSiXR5wDl2Yx1sGhSHFYQpmD
         m2o9qj+W2QSMqeeUxPpuQ6Aq7OxPzXCd6jxM9HNe1c/oBMBcBbdwRkThQqEOwWjzBS7g
         Ad0ui33hUQVC+NQobJvybKCqH/L+JW/0H35jOx8BZe3RKrECoTeoC0sf9+AgoKU3WLA1
         MOjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si698145qke.23.2018.04.19.04.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 04:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f97TW-0002rf-VL
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 07:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f97TK-0002rE-Dx
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f97TG-0000oq-EN
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:11:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48656 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f97TG-0000oV-9U; Thu, 19 Apr 2018 07:11:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09D39406803E;
	Thu, 19 Apr 2018 11:11:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D03910F1C05;
	Thu, 19 Apr 2018 11:11:10 +0000 (UTC)
Date: Thu, 19 Apr 2018 12:11:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180419111108.GM10259@redhat.com>
References: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
	<CAFEAcA9d=oEKfnW0Jr2vrSD8mu0xPbUYk6PAk7dxUqXjJUTooQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9d=oEKfnW0Jr2vrSD8mu0xPbUYk6PAk7dxUqXjJUTooQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 19 Apr 2018 11:11:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 19 Apr 2018 11:11:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] getdents patch for 64-bit app on 32-bit
 host
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Henry Wertz <hwertz10@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Agazcba5v9XY

On Thu, Apr 19, 2018 at 12:00:00PM +0100, Peter Maydell wrote:
> On 17 April 2018 at 22:53, Henry Wertz <hwertz10@gmail.com> wrote:
> > Peter Maydell has raised a concern about possible buffer overflows in this
> > code (which was meant to handle 32-bit app on 64-bit system, not 64-bit on
> > 32-bit).  I must admit I haven't gone through the dirent-copying code with a
> > fine-toothed comb... it appeared to work for my use case.  That said, the
> > code seems to be careful about using offsetof() rather than making any
> > assumptions.  In addition, the dirent-copying code appears to have an assert
> > that would crash qemu if it was going to write past the end of the dirent
> > buffer -- always nice to have plenty of sanity checks!
> 
> If you build the attached test program for x86-64 (which is a
> minor tweak on the test program in the Linux getdents manpage):
>  gcc -g -Wall -o /tmp/getdents getdents.c -static
> 
> and then on a 32-bit Arm host take a qemu-x86_64 with your patch
> applied, and a test directory like this:
> 
> $ ls /tmp/testdir/
> abcd  abcde
> 
> and run it, QEMU will abort on the assert that we don't run off
> the end of the buffer:
> 
> $ ./build/all-a32/x86_64-linux-user/qemu-x86_64 ~/getdents /tmp/testdir
> linux_dirent struct size 24 bytes
> buffer space 32 bytes
> qemu-x86_64: /home/peter.maydell/qemu/linux-user/syscall.c:10197:
> do_syscall: Assertion `count1 + treclen <= count' failed.
> 
> This is because the guest linux_dirent is bigger than the host
> linux_dirent, and therefore just because the host syscall
> successfully fit the record into the buffer doesn't mean we
> can fit the guest record into the buffer.
> 
> I don't see any way to fix this, because the records are variable size.

If we can't even get something common like dirents working with 64-bit
guest on 32-bit host, should we refuse to even build 64-bit linux-user
emulation on a 32-bit host ?  There must be many other similar cases
where the 64-bit guest syscall is going have insufficient space in the
host 32-bit syscall structs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
