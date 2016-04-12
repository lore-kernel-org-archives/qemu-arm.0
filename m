Received: by 10.25.208.211 with SMTP id h202csp2163674lfg;
        Tue, 12 Apr 2016 11:46:07 -0700 (PDT)
X-Received: by 10.140.98.163 with SMTP id o32mr6013865qge.46.1460486767691;
        Tue, 12 Apr 2016 11:46:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g126si25465938qkb.106.2016.04.12.11.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Apr 2016 11:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aq3KB-0007i4-96
	for alex.bennee@linaro.org; Tue, 12 Apr 2016 14:46:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1aq3K7-0007dS-TO
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 14:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1aq3K1-0003OB-Pz
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 14:46:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1aq3K1-0003O6-KD; Tue, 12 Apr 2016 14:45:57 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF07E63154;
	Tue, 12 Apr 2016 18:45:54 +0000 (UTC)
Received: from localhost (vpn1-5-159.gru2.redhat.com [10.97.5.159])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3CIjpSK026414; Tue, 12 Apr 2016 14:45:52 -0400
Date: Tue, 12 Apr 2016 15:45:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20160412184551.GC26803@thinpad.lan.raisama.net>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Apr 2016 18:45:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, maciej.rozycki@imgtec.com,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	miodrag.dinic@imgtec.com, gxt@mprc.pku.edu.cn,
	leon.alrae@imgtec.com, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8qcjlXBTNE79

On Tue, Apr 12, 2016 at 02:58:03PM +0200, Aleksandar Markovic wrote:
[...]
>   4) Updated code for all platforms to reflect changes in SoftFloat library.
>      This change is twofolds: it includes modifications of SoftFloat library
>      functions invocations, and an addition of invocation of function
>      set_snan_bit_is_one() during CPU initialization, with arguments that
>      are appropriate for each particular platform.
> 
>      In order to be at the same time accurate in relation to floating point
>      arithmetics and consistent with a particular platform code, following
>      principle is adopted related to invocations of new function
>      set_snan_bit_is_one():
> 
>      1. If a target platform doesn't use SoftFloat library, nothing is added.
>             (cris, lm32, moxie)
>      2. Else, if a target platform's signaling bit meaning is "1 is
>         signaling", explicit invocation of set_snan_bit_is_one(1) is added.
>             (mips, sh4, unicore32)
>               (for mips this will change in the second patch of this
>               series, but this very patch leaves mips features as
>               they currently are.)
>      3. Else, if a target platform explicitly sets other fields of its
>         float_status structure(s), explicit invocation of
>         set_snan_bit_is_one(0) is added.
>             (ppc, s390x, tricore)
>      4. Else, if a target platform doesn't explicitly set its structure
>         CPUXXXState, explicit invocation of set_snan_bit_is_one(0) is added.
>             (alpha, xtensa)

The CPU struct is zeroed by object_new() when the CPU object is
created, so the field is already set to 0 by default on all
architectures. You shouldn't need set_snan_bit_is_one(0) calls on
CPU initialization on any architecture.


>      5. For remaining cases, nothing is added. (Those cases explicitly set
>         their CPUXXXState/float_status structures to 0, and thus implicitly
>         perform set_snan_bit_is_one(0).)
>             (arm, i386, m68k, microblaze, openrisc, sparc)
> 

-- 
Eduardo
