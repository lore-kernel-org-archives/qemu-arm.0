Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3806579wru;
        Mon, 30 Jul 2018 06:56:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcyYgdvVB3g4Vyuv7AqVAiboBX7YfHsRbavgYp8J5YNjUp3aaSUcs6DthcNphKkiI2etSS1
X-Received: by 2002:ac8:26a9:: with SMTP id 38-v6mr16746327qto.291.1532959017958;
        Mon, 30 Jul 2018 06:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532959017; cv=none;
        d=google.com; s=arc-20160816;
        b=dFuJbmwx45pbdtWOLG2HGxB/KVBLXqwA8lDiG93C7ztbGd50hmX+/GuwwgSimK+axn
         xMGKt10mUCIvUTCeD+wuaIjiRN+/bXRlOUccGZo9k7EwfaN4jEJTeNovT4Qfd6HmEx6K
         GkfEzFlBEMcaS1zV2EZnDUzj/Afs4Mu6S8IKKeFHLeh2b5SksKGX1pEAADbWddiLfTdf
         tXGxLogltnV9x/gxV5oIytUY4U1Uz3ZbZIug0skbpUUHBibKFbj2aDSGB4s5loDZ0wvi
         clbOoF/p2TYR4V4gw0Z1y3d+AehUObA6MpG4rpvCHMR/+QKeQfvLkDzaRQcVSP5A8kmM
         WG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tIa2rs+NrwDseOc08Iu8nFdquRunFQbGly1n5mPKRhU=;
        b=IqjI4lhp5GeIRsrydZNP7b0zHwl3NMeXX8qz83rZMxQSpjBY/Lqti3vdpw/URPLbtM
         3eHzlP2fvVM7Y6RkoaCW/RSoWqWvqKwJjZ8bT0YjmqBN5tSeShQYxRP1zVk5JHzGupcs
         ntN4fPL3zq3ejO395Y86X3JPg0hUO9EafXsd6fFVDZ1i6W+c07t+qph9cgr0FiHUYcsc
         SujM7xseFqwi8PhqrGLTQt96nfUNugpx0ZgjR7Z1jMvROsMtNwMGDJanMplyVy2Bj6Vu
         0hzV/Qm1bxYgcuYGzHVdqmcsZ+Z7+K+lnMNZ7w++fH7cU/UQplUBbYZAuE8Ykg4iTcjq
         AcRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TzJWbSMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si6045973qtc.19.2018.07.30.06.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 06:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TzJWbSMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk8fP-0006XI-OM
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 09:56:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8fF-0006W3-So
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 09:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8fE-0005cv-W7
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 09:56:45 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fk8fE-0005cp-P9
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 09:56:44 -0400
Received: by mail-oi0-x244.google.com with SMTP id b15-v6so21346393oib.10
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tIa2rs+NrwDseOc08Iu8nFdquRunFQbGly1n5mPKRhU=;
	b=TzJWbSMHHnUw1qL+mE6aYTHI4DJKD/WNZZ34nmFggqp7XWPjfAL2SrXprwK7ZU50Dy
	KyZRlk7YxvJMK40vDU83y2i6o4Le9ccEk1zTxXt+MEZGmBJskbC0qjqvtiw9yBsx1EHc
	iCpO6Z1NpvScYZ/twnh9PBSAe/niXWzUEzFE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tIa2rs+NrwDseOc08Iu8nFdquRunFQbGly1n5mPKRhU=;
	b=VkQnl+V3U+aXtMWpYkHiYSHLETk9RRBsa8mByesRe8mPHWHxfu2zESIIwcXguoi/9E
	VqhDTYXnbFvei/rUiz+pqDGc0mqKRxgG03y5S2egDsMnu4OFPco4RnF6LAxHsOIF9Qc7
	tEdZXu/IzAm8Uri0QJH+UceF4OO4dIQfvKu98T2SDiiNsTLBN1BeBBsE6hmrWpnyjYRC
	JJmv7kfLRYHDU4Td8Anfapjm3G8FQcuKLkxPPQrr3qTEXeDTBxHfL0uEVXtbl0gCCRx1
	W28f1YjR2qLnICTYYTYXY3GVoqqrfof+cMa0MK5/GCWr+wLNPZrmfVb/NqFgBFibeR+3
	Y4RA==
X-Gm-Message-State: AOUpUlFBEPXCGqGOFhxuFRWiHex9n9eGL95RHk9NGEkTmj8jPUPUQZd0
	tjmVfgYLu3MinzRu2LniT9I0T8wphouoAhe+yzHJBw==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr18916699oig.13.1532959004081; 
	Mon, 30 Jul 2018 06:56:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 06:56:23
	-0700 (PDT)
In-Reply-To: <a69b9ba5-1973-0d37-0cb9-0de4e4f21a91@redhat.com>
References: <20180724153616.32352-1-peter.maydell@linaro.org>
	<a69b9ba5-1973-0d37-0cb9-0de4e4f21a91@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 14:56:23 +0100
Message-ID: <CAFEAcA8Us98KNcjOA5pPmUTxBxGBEHQvJo9+T4fkEMR45HbxFA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0] hw/misc/tz-mpc: Zero
 the LUT on initialization, not just reset
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: niuT2yaqAwK4

On 24 July 2018 at 16:45, Thomas Huth <thuth@redhat.com> wrote:
> On 24.07.2018 17:36, Peter Maydell wrote:
>> In the tz-mpc device we allocate a data block for the LUT,
>> which we then clear to zero in the device's reset method.
>> This is conceptually fine, but unfortunately results in a
>> valgrind complaint about use of uninitialized data on startup:
>>
>> ==30906== Conditional jump or move depends on uninitialised value(s)
>> ==30906==    at 0x503609: tz_mpc_translate (tz-mpc.c:439)
>> ==30906==    by 0x3F3D90: address_space_translate_iommu (exec.c:511)
>> ==30906==    by 0x3F3FF8: flatview_do_translate (exec.c:584)
>> ==30906==    by 0x3F4292: flatview_translate (exec.c:644)
>> ==30906==    by 0x3F2120: address_space_translate (memory.h:1962)
>> ==30906==    by 0x3FB753: address_space_ldl_internal (memory_ldst.inc.c:36)
>> ==30906==    by 0x3FB8A6: address_space_ldl (memory_ldst.inc.c:80)
>> ==30906==    by 0x619037: ldl_phys (memory_ldst_phys.inc.h:25)
>> ==30906==    by 0x61985D: arm_cpu_reset (cpu.c:255)
>> ==30906==    by 0x98791B: cpu_reset (cpu.c:249)
>> ==30906==    by 0x57FFDB: armv7m_reset (armv7m.c:265)
>> ==30906==    by 0x7B1775: qemu_devices_reset (reset.c:69)
>>
>> This is because of a reset ordering problem -- the TZ MPC
>> resets after the CPU, but an M-profile CPU's reset function
>> includes memory loads to get the initial PC and SP, which
>> then go through an MPC that hasn't yet been reset.
>>
>> The simplest fix for this is to zero the LUT when we
>> initialize the data, which will result in the MPC's
>> translate function giving the right answers for these
>> early memory accesses.
>
> Thanks, that fixes the issue, indeed:
>
> Tested-by: Thomas Huth <thuth@redhat.com>

Thanks; applied to target-arm for 3.0.

-- PMM
