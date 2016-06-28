Received: by 10.25.21.96 with SMTP id l93csp1772656lfi;
        Tue, 28 Jun 2016 11:04:37 -0700 (PDT)
X-Received: by 10.37.66.74 with SMTP id p71mr1451861yba.13.1467137077287;
        Tue, 28 Jun 2016 11:04:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186si6503991ybh.228.2016.06.28.11.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxNE-0004sA-Ll
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:04:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bHxCm-0008B8-1e
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 13:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bHxCh-0007hZ-BV
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 13:53:48 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:43693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bHxCh-0007hM-1d; Tue, 28 Jun 2016 13:53:43 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id u5SHredb014555;
	Tue, 28 Jun 2016 13:53:40 -0400
Date: Tue, 28 Jun 2016 13:53:40 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <312978165.2723879.1467136420274.JavaMail.zimbra@redhat.com>
In-Reply-To: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
References: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Add memory_region_init_rom() and use to fix imx board crashes
Thread-Index: ZPsrR4j7Q4O3AOMHdurkou9QhpJO2w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
Subject: Re: [Qemu-devel] [PATCH for-2.7 0/3] Add memory_region_init_rom()
 and use to fix imx board crashes
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
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RcSqKLrMxlHo


> We can then add an assert() in memory_region_init_rom_device()
> to prevent further misuse. (Passing NULL was documented as
> "I/O space is not supposed to be handled by QEMU itself", but this
> doesn't make much sense (who would be handling the writes?) and
> isn't used by any of the callers.)
> 
> This is for-2.7 because it fixes a crash in the imx boards
> if the guest misbehaves:
> https://bugs.launchpad.net/qemu/+bug/1596160

Go ahead and include this in target-arm (and since we're at it,
it would be great if you handled Cedric's m25p80 series when he
sends out the rebase).

Paolo
