Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1148749wrq;
        Fri, 13 Jul 2018 14:49:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeHe93EDUhKw1djpjaEe6Myrtl1jvQYhQZPacop838FUyLq7iBHpYdw7VR9AJZTl2fp1iwW
X-Received: by 2002:a37:1fdf:: with SMTP id n92-v6mr7251295qkh.333.1531518581954;
        Fri, 13 Jul 2018 14:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531518581; cv=none;
        d=google.com; s=arc-20160816;
        b=IJl/qZ9nDkehPMFqeS9FqM9la6Cn6T/1bBoBfAnmiH3ptKHXsrqK3fnqNbcupZBpIc
         oNl7zjJ8jjxgZWlxJCyQQVxM4Y0VoDCU8yUEEz+zbUXzf7X/4dd9sFFryLoO0fgSDznL
         Dh/1aNEpG3lKtbc4co6wlq1HsneF+ESk9kNunYpxe0nTORGC09B9gVOZy596vDWeDOOj
         05+U8USI9SOjv+Pdly0Koughwlefzp5i0fhM2c4sXntUEJ8RnbvKbrGksbKZWn474m/g
         kBdQuswt8/tHosImnE1irfk9r1i9sN+SGzdMM0f1qqAbakZoqA57Dh7LMqlBM2YgCMW8
         c2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=hoSM/jpexTbr5z9VKdb1aRIvDdyGDOQQiwu/ka/fL7w=;
        b=ybzgiTby7Tmp5wXaCmTJTzxL3IhBJSuyEN5Ptux+xjaqARl6J+upXhG3mzgwm8pSNn
         OEe5NjG0kriGVEWbdPy0muCpaUMxwI/aiLZ36jS4tbEuOaKXRJ9PfdGzfmd+4+nbedJw
         CsRQpwLZUSO7L/IN++iny0dKAxTeqG2Qlen87wqs6iLXiwt+mn8OI6NgN6DYgiAKRd2b
         fUCplgNflLRcxRgE9+39Lndc3q1zkaX1SgeAWEKBwRAEemgHiyNp0vjLgs0IXfCabB4S
         tn1aVAGwIOqD3x3tR/kevEIbB/zD+IeaiHUdD75xc5AIg8m64iHXV1toAeDal6BBz805
         7/fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f59-v6si4724329qva.48.2018.07.13.14.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5wb-00048S-FQ
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5wC-00046N-LD
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 17:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5wC-0007Lq-1a
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 17:49:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5w7-0007Fm-Ht; Fri, 13 Jul 2018 17:49:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2F7630820DA;
	Fri, 13 Jul 2018 21:49:10 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27A5C608F0;
	Fri, 13 Jul 2018 21:49:09 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:49:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713214908.GY31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-8-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-8-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 13 Jul 2018 21:49:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 07/16] hw/arm/xlnx-zynqmp: Fix crash
 when introspecting the "xlnx, zynqmp" device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dG1uEtvevb1P

On Fri, Jul 13, 2018 at 10:27:35AM +0200, Thomas Huth wrote:
> QEMU currently crashes when e.g. doing something like this:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'xlnx,zynqmp'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" \
>  |  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> 
> Use the new object_initialize_child() and sysbus_init_child_obj()
> functions to get the refernce counting of the child objects right, so
> that they are properly cleaned up when the parent gets destroyed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
