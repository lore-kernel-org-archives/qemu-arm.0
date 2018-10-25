Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp883728wro;
        Thu, 25 Oct 2018 08:56:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5foHB5ABHbEGXvCjuyMjo58QbU9chjP+sBnkLh3rCOQYiN7pIfT3rQV+mka9K0EV0F5Pjg6
X-Received: by 2002:ac8:3835:: with SMTP id q50-v6mr1986918qtb.91.1540483018857;
        Thu, 25 Oct 2018 08:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540483018; cv=none;
        d=google.com; s=arc-20160816;
        b=TBowmcezN/2EVXaBATNvfyCslMSpltAt1EzprWP1y0QLrj/yElsJx8qnbkvZHpQahJ
         G8UZt8JgspYHudOZPf0rFK50PUs3DbPyvE4GxtKQ7G1SVVuL8ME5lp/DLb1YaUW20qgV
         mZTvJn7uvDMfrCxCpj5aSx80aAptA4L7f/iUIp123BPzr2m8fGxmDHIf1b3K1WT6nLG8
         lci1291qawfD1ppkfQTXbmk/wOH09fWpMGSkS4WhoUsjd0E4OqT6jun+R09adHFEdsyb
         kSmYnhAfZ3B/D0nnkRKuRTYNVUE7JnNXs1X/QI6qxtC5lUdJ5kXD6fwOn5L8nWGfY9AS
         tD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature;
        bh=XI6wGSSqrRTsD2QxM5a7oMPkt+kXJkAKbIgq3qrWF10=;
        b=nXccbWFKthZy9BqlzNoA5eAcscPe8nGOlNxP/+yP5imLPG8LZgGipMVSVsBBo2exyx
         R1WQbx9rG3Kuseq6Rs27xwbeqtbN2wxnyKO7H6kF2q/DETXixYboMXc6lgNyrOy0Zvaj
         6hnMMquKJaTjLF6nPUMebA1I4Si/2L48EpoWTDPKPRsQ6sy5lMiyXnMqU0BHgEcbaB+/
         p8cqLW+05ogA9oF0s7f6DwBVLkM5ZMtGPmLKXiJrbee1dkIA+7NLTYUI/wUqMbFwk1Wa
         0bczc1lkrPWnTjpp6Pcpz33FtmHrvNOVArtq9mH1PgirQggtfs8T37iJAgHZhjdfKWSw
         nvaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=wBHXIy2l;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="P5j/s3Qg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t21-v6si1219602qtb.34.2018.10.25.08.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 08:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=wBHXIy2l;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="P5j/s3Qg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFi0I-0003U0-9L
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 11:56:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFhI3-0000kJ-EN
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 11:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFhHy-0002qw-IR
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 11:11:15 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gFhHy-0002qW-BA; Thu, 25 Oct 2018 11:11:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A239221FC1;
	Thu, 25 Oct 2018 11:11:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Thu, 25 Oct 2018 11:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=XI6wGSSqrRTsD2QxM5a7oMPk
	t+kXJkAKbIgq3qrWF10=; b=wBHXIy2lqgcy8FZGngDPQYmVbC0O6T/YkGeBHzWK
	VsHq5J5BZPv+vKLmMuIwJenaREEgIio81Wg/xuiBfT4z46yNHjodGP2veMS0YRLN
	hnORTzWenIs2Zh64IV0pMQIP32JNJsiOs9LHTYrW5PVPXBwciF76lyH9Bc6zipB+
	ktU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XI6wGS
	SqrRTsD2QxM5a7oMPkt+kXJkAKbIgq3qrWF10=; b=P5j/s3QgUdgUcfPCYgORze
	hdICuRijniIIKiPV4otAI7A5sb+aTYON4rYWuVNTzEG+NlQBUOh/nztnO9joFkKp
	Fhzw5y30jqCYw5lH63LTxT242mZ0rWbnkWRirbcJjbu9F9I+cTAXDKChD7c44yuc
	CxpaXbf9lpUJRNNuuKsmjQKpZMP81WigbJDxESikUS1/KnnllUv6fnIZYvCcPzDx
	w8MK71EyvxMFbSmd1GUoWbQ8G1EJpi8ByIXYCBAENtYQjwpPyL50sOk25HflzSxm
	TihnUTFQj1Vur9lQkO5USl5NHNDhxonN/iavOYN5Z/b1fyZk2d904XXQmnjW0cZg
	==
X-ME-Sender: <xms:CN3RWyCOCFecrPik8qXsmpMEX8VnNIJuvv7CjMATslgC9GoFh7D2yg>
X-ME-Proxy: <xmx:CN3RWwUGTAzDdx6R20axzhLPnK3KBkxovXJl5y1KAmMiBZObMKXqEA>
	<xmx:CN3RW0wErKDheIBfejHf_gOO3z-j-w1B_UxqzrE1C3VarHdvsfv5pQ>
	<xmx:CN3RW2NlBPssxYVSbCyZZiHugXKbgs21qlBfvVyNCLsl1x_-qIC2AQ>
	<xmx:CN3RW96aAA9r3SXha6YjrOBIdplHJtGKUhP9JuGtdH3BFwreJjV1Vg>
	<xmx:CN3RW_NPpdSrNa74eAa_QaOdZ5tKRi5Syi1ddjDgBHeCCsIKchrCcA>
	<xmx:Dd3RW7qFJd5F-ixkxBWYzl-OBS9ajk5Gx0JdJ0beJgmyt34eDfL5ew>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5B308E4AB8;
	Thu, 25 Oct 2018 11:11:04 -0400 (EDT)
Date: Thu, 25 Oct 2018 11:11:03 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Message-ID: <20181025151103.GA19931@flamenco>
References: <20181025144644.15464-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181025144644.15464-1-cota@braap.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: [Qemu-arm] [RFC v4 00/71] per-CPU locks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WgU2QZBmeCA/

[I forgot to add the cover letter to git send-email; here it is]

v3: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04179.html

"Why is this an RFC?" See v3 link above. Also, see comment at
the bottom of this message regarding the last patch of this series.

Changes since v3:

- Add R-b's -- rth: thanks for all the reviews!

- Partially bring back the approach in the v1 series, that is,
  do not acquire the CPU mutex in cpu_interrupt_request; use
  atomic_read instead. The lock is not needed because of the
  OR+kick sequence; note that when we do not have the BQL
  (i.e. in MTTCG's CPU loop), we do have the lock while reading
  cpu_interrupt_request, so no writes can be missed there.
  This simplifies the calling code quite a bit, since we do
  not hold cpu_mutex across large portions of code (this is
  a very bad idea, e.g. could lead to deadlock for instance
  if we tried to queue work on another CPU).
  Setters still acquire the lock, since it's the cost is
  very similar to that of a locked atomic, and makes the
  code simpler.

- Use an intermediate interrupt_request variable wherever
  this is trivial to do. Whenever there's a chance that
  cpu->interrupt_request might have been updated between
  reads, just use cpu_interrupt_request to perform a load
  via atomic_read.

- Drop the BQL assert in run_on_cpu. Keep the guarantee that
  the queued work holds the BQL, though.

- Add a no_cpu_mutex_lock_held assert to run_on_cpu; note that
  acquiring CPU locks can only be done in CPU_FOREACH order,
  otherwise we might deadlock.

- Remove qemu_cpu_cond leftovers; it's superseded by cpu->cond.

- Export no_cpu_mutex_lock_held.

- Do not export process_queued_work_locked from cpus-common.c;
  at some point we need to drop cpu_mutex for other vCPUs to queue
  work on the current vCPU, and process_queued_work is a good
  place to do that. Add comment about this.

- Add helper_cpu_halted_set helper to tcg-runtime. Convert
  the TCG targets that were setting cpu->halted directly.

- Fix cpu_reset_interrupt in cpu_common_post_load, as reported
  by Richard.

- Fix a hang after making qemu_work_cond per-cpu. The hang can
  only happen between that commit and the commit that completes
  the transition to per-CPU locks. This would break bisect, so
  fix it. In addition, add a comment about it, and add a tiny
  patch to undo the fix once the transition is complete and the
  fix isn't needed any more.

- Fix a possible deadlock (acquiring the BQL *after* having
  acquired the CPU mutex) in cpu_reset_interrupt. This would break
  bisection until the transition to per-CPU locks, so fix it
  and add a comment about it to the commit log of the "cpu: define
  cpu_interrupt_request helpers" patch.

- Add cc->has_work_with_iothread_lock, as suggested by Paolo,
  and convert the targets that need it.

- Add a patch to reduce contention when doing exclusive work.
  In my tests I've only found aarch64 to benefit (very minimally)
  from this; for other targets this patch is perf-neutral.
  In aarch64, the problem is that frequent global TLB invalidations
  require frequent exclusive work; sync-profile points to unnecessary
  contention on cpu_list_lock, which all waiters wait on
  while the exclusive work completes. To fix this, make the
  waiters wait on their CPU lock, so that their wakeup is uncontended.
  The perf impact is that the scalability collapse due to exclusive
  work is mitigated, but not fixed.
  So I'm including this patch to raise awareness about the issue,
  but I don't feel strongly at all about merging it.

The series is checkpatch-clean (single warning about __COVERITY__).

You can fetch it from:
  https://github.com/cota/qemu/tree/cpu-lock-v4

Thanks,

		Emilio
