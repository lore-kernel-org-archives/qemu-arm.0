Received: by 10.28.71.27 with SMTP id u27csp2940888wma;
        Mon, 22 Jan 2018 07:37:28 -0800 (PST)
X-Google-Smtp-Source: AH8x224Y8GD+wwpFc7xjle42Y+D1j5+lZtYX/9wVMOX6JNW/EPueWp9ZkQbLAQt9OBF9hqPtdzLR
X-Received: by 10.129.165.11 with SMTP id c11mr7788563ywh.311.1516635448031;
        Mon, 22 Jan 2018 07:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516635448; cv=none;
        d=google.com; s=arc-20160816;
        b=DIQRQMPPl2k3574+GQfJCqVPjGfe9nWjIucR3H5fVBYLMBvZll3JgtnT0RmpDGiyQa
         foWGBlDlVzci+iM7EzbMGxcHApbw2F61d1/62T4JdziHqzLhfTHymz/RFdD+A7qtUm9j
         YJll1WMJI/HxzFcnEzvs/28qPdpWoL0eASHNmB8BjOn3EH3cWuX5ly/2XgiX9Vh+Cc7j
         BlOzqH5FfXolz8MNPOwV8f7eFV6woNn0XSqCNwx1P6YUoTCcHcYCfp06UzrCqqLoJDTR
         cFtbpZIgBfq25lDLCgEXFhpstTkZ5SG/vxkYGx9rUZf6lvDHsEhGeGf1Qcd69Bzz4X3x
         6F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kl2uRAr30V3/gVg82KiXkbWgS/leX9Ib517JH3FbVrI=;
        b=flqFPjeYN+zUSd0+q6ZvR5FDbnGSpmCaspPZenzOMnUXMRd4/PTs6BghF/VmoHO1CY
         3vDmQnTwjivcsHo/a9P4Jw6Ho1NedcsiKHVXwrtsb2VH+WsNkbEwBKuMuCzWvmmp6/Ap
         6ReL0ESAL7HS/gISVt1unvZGp2FjSfTOnxTpb4aLgKjSVGXoTSF7G67fd1N1AUYKfFIX
         AoOx5UfDk0HnSsrx6jegG+EOJC9cWQ9QjHC+BhwDzsQJBm1NtTuAmHW/0IDI+DomBP5l
         NoZJETpnyaGIYmvVyGz9FoNdt2p7s0MKczI/utcEdcRQnKNKawT+vF5YFHIFn/nAZzOh
         tL8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVIKandq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si2089ybm.226.2018.01.22.07.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 07:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVIKandq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edeA3-00060n-Gz
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 10:37:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ede91-0005fZ-OF
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:36:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ede90-0001wX-Tz
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:36:23 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ede90-0001wD-O2
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:36:22 -0500
Received: by mail-oi0-x241.google.com with SMTP id m83so3731191oik.8
	for <qemu-devel@nongnu.org>; Mon, 22 Jan 2018 07:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kl2uRAr30V3/gVg82KiXkbWgS/leX9Ib517JH3FbVrI=;
	b=gVIKandqaYK1p2NDkygkkHk8GrrTaPbmED7smhjEYmaA4Cr7wq6KCkCcgq2nznYirc
	4ziDi37XDC8xTtnQqlsrySFBio1t5uAc0OQt4epRnUtxe0tHjyQGSCQfFzkWReYGFuC6
	+FRIHu5d7OOOR5VY2FG9oMQUFwVyy7XbcZm58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kl2uRAr30V3/gVg82KiXkbWgS/leX9Ib517JH3FbVrI=;
	b=shx+DhbxwRVIxfIk73Y7v3cBdvlQmB5FijzZMMmS0Ug13iVYyMwS93uJ6SBF8bJqqW
	X4khrBWJM1IyoYBYcP/MQ8Kw5zPixA71B3vi84qNeLYfsrAkwumTVZFGqt2BEhWV4/rv
	/PDcwcTOsruZ9X1R7X30vrH2jT32k5VTa06WYpc7+Uffobtl1lk4VBEirc/4EqKq8sBe
	XGOe45BAIdGUvNGxZ+tqnoBtvX1YxBIKA3TPAr5vA6fvG6z2nuXyEeRf0h4+kPuvQoHO
	U3+fsHiRMSMOaSoBXLpFkxU6tjIvrqnMkK6zzPkPFLFgTAgDbtJvNIRL1nyUf2wqyNSw
	fjLw==
X-Gm-Message-State: AKwxyteJcftzuUjBYxd3R1A/pmLnbDQA9erzWqwt9Ki71phffPwCKUa5
	yrIK2Hh4otn+MTMGgtOI2HUoJSy3N7ZXdUUOOvLwTQ==
X-Received: by 10.84.77.6 with SMTP id v6mr3764118oix.8.1516635381902; Mon, 22
	Jan 2018 07:36:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 07:36:01 -0800 (PST)
In-Reply-To: <20180119145756.7629-1-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 15:36:01 +0000
Message-ID: <CAFEAcA-zY_MO6Tati1ybi3VQ8dZis-=P6NsNRGT7t3xxjNN0GA@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH 0/4] arm_gic: Various fixes
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EloqKNXz2TQ7

On 19 January 2018 at 14:57,  <luc.michel@greensocs.com> wrote:
> Here is a patch set for issues I found in the GIC. I found those by
> writing unitary tests for the GIC, and compared the result against
> real hardware (a Zynq UltraScale+ board with a GICv2).
>
> The first patch prevents the GIC from signaling an IRQ that is in the
> "active and pending" state. I encountered this bug in a test where I
> split end of interrupt and interrupt deactivation. The GIC was
> re-signaling the IRQ after priority drop if it was raised again, while
> it has not been deactivated yet (and thus was in the "active and
> pending" state).
>
> The second patch returns a correct "Idle priority" value when reading
> C_RPR if there is no active interrupt.
>
> The last two patches fix issues around the Binary Point Register (the
> group priority computation of group 1 IRQs when C_CTRL.CBPR is 0, and
> the non-secure view of C_BPR when C_CTRL.CBPR is 1).

Thanks for this patchset, and in particular for the detailed
commit messages that made it really easy to review.
Since there were only a couple of minor nits in the patchset
(an extra assert, a comment typo) I'm going to take this into
target-arm.next and fix those things there, rather than ask you
to respin the patchset.

thanks
-- PMM
