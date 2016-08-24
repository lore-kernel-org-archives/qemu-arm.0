Received: by 10.25.21.156 with SMTP id 28csp377756lfv;
        Wed, 24 Aug 2016 07:59:26 -0700 (PDT)
X-Received: by 10.55.39.146 with SMTP id n140mr4184563qkn.103.1472050766256;
        Wed, 24 Aug 2016 07:59:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 14si6556576qtn.142.2016.08.24.07.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 07:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcZeH-0003n6-Nh
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 10:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bcZeA-0003k5-4b
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 10:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bcZe6-00063U-6x
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 10:59:18 -0400
Received: from mx5-phx2.redhat.com ([209.132.183.37]:36414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bcZe5-00063H-Uq; Wed, 24 Aug 2016 10:59:14 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u7OExBJ2051443;
	Wed, 24 Aug 2016 10:59:11 -0400
Date: Wed, 24 Aug 2016 10:59:11 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <1271571364.5255352.1472050751092.JavaMail.zimbra@redhat.com>
In-Reply-To: <566a869d-1042-0bb7-7a4b-928efa5ea676@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824043048.109542.39014@ex-std-node742.prod.rhcloud.com>
	<535318f1-8178-714d-7487-5aeb0661280b@redhat.com>
	<566a869d-1042-0bb7-7a4b-928efa5ea676@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Improve buffer_is_zero
Thread-Index: eQVplIa9Mc7oVhOuBx9wmQFf9gfPfA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.37
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: peter maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	famz@redhat.com, qemu-devel@nongnu.org,
	vijay kilari <vijay.kilari@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1OEmsQG/9yD



----- Original Message -----
> From: "Richard Henderson" <rth@twiddle.net>
> To: "Paolo Bonzini" <pbonzini@redhat.com>, qemu-devel@nongnu.org
> Cc: "peter maydell" <peter.maydell@linaro.org>, qemu-arm@nongnu.org, famz@redhat.com, "vijay kilari"
> <vijay.kilari@gmail.com>
> Sent: Wednesday, August 24, 2016 4:53:37 PM
> Subject: Re: [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
> 
> On 08/23/2016 09:38 PM, Paolo Bonzini wrote:
> >
> >
> > On 24/08/2016 06:30, no-reply@patchew.org wrote:
> >> ERROR: Use of volatile is usually wrong: see
> >> Documentation/volatile-considered-harmful.txt
> >> #44: FILE: util/cutils.c:289:
> >> +        __asm volatile("vmovdqu -0x80(%1),%0\n\t"
> >
> > Other errors can be ignored, but please use __asm__ __volatile__ here or
> > just __asm__ (I don't think volatile is useful).
> 
> I had to add volatile to keep the prefetch in advance of the loop.
> I suppose I could just add the prefetch to the asm block...

Probably easiest, or maybe add barrier() too.

Paolo
