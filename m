Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp756679wrp;
        Fri, 15 Feb 2019 07:42:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYLlDc8Pj/rqD7SwhZbEl1/PDWoMzqpofaspH+tXmg9Sl3lRleYUAyZ6F5fXrFPFJjGbMJx
X-Received: by 2002:a25:2fc2:: with SMTP id v185mr8776852ybv.392.1550245349468;
        Fri, 15 Feb 2019 07:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550245349; cv=none;
        d=google.com; s=arc-20160816;
        b=gqhFtyQ4jN/Ml8ItRIkWKatx66hftQ+rJUnA/YJ86hFxfndGeUMGMH+TCiwPXjHDCB
         xC4r9p59fwsZHRC7O3lRwzXN8NqCZfFz3cebOoxmJb7BTKCefFfQtyB5OkN8mLbCs3K5
         G8Zas3xHNIfwZ0AEuiIcN6KYOPnbALF8cEgHGoOjrLorwls/DjwPuY3hsdP9pJdznQ/d
         L4Yj1rPrYz6C1QebfM3Zu477RwH9FhDm2JoH4l24RMjs0adE8bd35S5M40FolFUQwIf3
         mDZGAEmJfAcHl2JYLNhUMQ2u9FsQ9PWelIjwOiq3CvFYYgXyhu1/1EqXOH4CGwVbXPnX
         kwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=fak2wXPUVfDP72IpC4l+fzAoe0QoNYQgTxJpTdtfvF8=;
        b=ygtjU9nc8UJcV4L8iXS0bRXNpqf7rz7a6VRynqKH2bIszL4TOhPISTaG3TfdAF4nkZ
         7piER9BOy60UPuT3LLvHLZOEvpiseSgE1DNVGGvuw9DFUzjak0dyRODPaSiB8Spt+PHA
         eFAwVHIEf3Jx/xqrOWG08e++OXsrMAtr6iAvbiAWRlYWprJVV+bNuRf+WOicJBLbXx95
         0JBwHJlUvyAwpbv3EfR2TbZ1QO1kV+5i1HLp99vCKwHOEfSfL9Ww3kqGtNYFsEACzv1P
         k2/EevWB2FtPwTuC2TYjk2XuxKSXXOzhY+c5aoaz4yZPOOQg3DiZKn1wySBLY2358bG9
         NfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h184si3556727ywe.297.2019.02.15.07.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 07:42:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gufdE-0006w6-Tk
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 10:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gufd3-0006v3-I3
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 10:42:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gufd2-0005fy-IN
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 10:42:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gufd2-0005ev-CS; Fri, 15 Feb 2019 10:42:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36C187AEAE;
	Fri, 15 Feb 2019 15:42:15 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E116819C65;
	Fri, 15 Feb 2019 15:42:12 +0000 (UTC)
Date: Fri, 15 Feb 2019 16:42:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190215164209.54a6f747@Igors-MacBook-Pro.local>
In-Reply-To: <2d99aca8-5ed0-bea3-4a4f-7b2a8e89b049@redhat.com>
References: <20190214140714.15738-1-imammedo@redhat.com>
	<4d8518f7-5272-fc18-d5c7-20c4cafdf7e8@redhat.com>
	<20190215123317.6903b818@Igors-MacBook-Pro.local>
	<2d99aca8-5ed0-bea3-4a4f-7b2a8e89b049@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 15 Feb 2019 15:42:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] memory: use
 memory_region_init_ram() instead of memory_region_allocate_system_memory()
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, jan.kiszka@web.de, atar4qemu@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJ40eOuDper1

On Fri, 15 Feb 2019 15:48:43 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 15/02/19 12:33, Igor Mammedov wrote:
> > On Thu, 14 Feb 2019 19:11:27 +0100
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > 
> >> On 14/02/19 15:07, Igor Mammedov wrote:
> >>> Also some boards (ab)use memory_region_allocate_system_memory(), calling it several
> >>> times to allocate various fixed sized chunks of RAM and ROMs, which is problematic
> >>> to map to a single initial RAM Machine::memdev backend and is currently broken if
> >>> -mem-path points to a not hugepage pool.
> >>
> >> This is certainly a good idea.  However, I'm not sure why you would need
> >> a memdev property on the Machine instead of just allowing 1 -numa node,
> >> which is what really is.
> > 
> > using '-numa node' would be confusing to user when he/she is not interested in numa usecase
> > it also would enable numa fdt/acpi parts generated automatically (fixable but then again
> > it adds more to confusion) and in the end there are boards that do not support numa at all
> > (s390x).
> 
> Fair enough.
> 
> What about -m, too?  Then you'd specify a memdev instead of the initial
> memory size.
that somewhat what I've planned,
make -m X translate into -object memory-backend-ram,id=magically-get-what-board-uses-now,size=X -machine memdev=thatid

one more reason for memdev vs device is that -numa now uses memdevs and so far it
doesn't look that non-numa initial RAM would get immediate benefits from using -device
on most boards (well, I couldn't come up with any modulo backend/frontend consistent usage)

> 
> Paolo
> 

