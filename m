Received: by 10.25.159.19 with SMTP id i19csp615513lfe;
        Thu, 4 Feb 2016 10:38:12 -0800 (PST)
X-Received: by 10.140.221.17 with SMTP id r17mr11742528qhb.94.1454611091941;
        Thu, 04 Feb 2016 10:38:11 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f71si11778892qkh.97.2016.02.04.10.38.11;
        Thu, 04 Feb 2016 10:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 61BD54970A;
	Thu,  4 Feb 2016 13:32:41 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 794h0x2mnlkH; Thu,  4 Feb 2016 13:32:40 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 672674968B;
	Thu,  4 Feb 2016 13:32:40 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6768848531
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 Feb 2016 13:32:39 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UR44J-QN5xm4 for <kvmarm@lists.cs.columbia.edu>;
 Thu,  4 Feb 2016 13:32:37 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 7F7B4419D1
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 Feb 2016 13:32:37 -0500 (EST)
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
 (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
 by mx1.redhat.com (Postfix) with ESMTPS id 52D4F18B32B;
 Thu,  4 Feb 2016 18:38:06 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
 by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u14Ic26H001630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 4 Feb 2016 13:38:04 -0500
Date: Thu, 4 Feb 2016 19:38:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: marc.zyngier@arm.com, andre.przywara@arm.com
Subject: MPIDR Aff0 question
Message-ID: <20160204183801.GF3890@hawk.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Cc: qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: mX8uAOkHJxjs


Hi Marc and Andre,

I completely understand why reset_mpidr() limits Aff0 to 16, thanks
to Andre's nice comment about ICC_SGIxR. Now, here's my question;
it seems that the Cortex-A{53,57,72} manuals want to further limit
Aff0 to 4, going so far as to say bits 7:2 are RES0. I'm looking
at userspace dictating the MPIDR for KVM. QEMU tries to model the
A57 right now, so to be true to the manual, Aff0 should only address
four PEs, but that would generate a higher trap cost for SGI broadcasts
when using KVM. Sigh... what to do?

Additionally I'm looking at adding support to represent more complex
topologies in the guest MPIDR (sockets/cores/threads). I see Linux
currently expects Aff2:socket, Aff1:core, Aff0:thread when threads
are in use, and Aff1:socket, Aff0:core, when they're not. Assuming
there are never more than 4 threads to a core makes the first
expectation fine, but the second one would easily blow the 2 Aff0
bits alloted, and maybe even a 4 Aff0 bit allotment.

So my current thinking is that always using Aff2:socket, Aff1:cluster,
Aff0:core (no threads allowed) would be nice for KVM, and allowing up
to 16 cores to be addressed in Aff0. As it seems there's no standard
for MPIDR, then that could be the KVM guest "standard".

TCG note: I suppose threads could be allowed there, using
Aff2:socket, Aff1:core, Aff0:thread (no more than 4 threads)

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
