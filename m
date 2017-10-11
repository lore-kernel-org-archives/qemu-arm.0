Received: by 10.223.197.9 with SMTP id q9csp429414wrf;
        Wed, 11 Oct 2017 02:58:15 -0700 (PDT)
X-Received: by 10.55.165.213 with SMTP id o204mr18704777qke.313.1507715895042;
        Wed, 11 Oct 2017 02:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507715895; cv=none;
        d=google.com; s=arc-20160816;
        b=JahnZBAsFU+5Q4rCJlNPBClQFb1P2dk4iYJ8jzLJBhMNkCgLdjHm/vxbBLCCZTtOLO
         7sqLollS0gxRkpegWoUugZlcTp6oN8a1XDNZLaS+fkk1vTsQwOZ26+2PHeTFxWws8Zlb
         DNlQWCRoQA+YGveqyM+y6+uIOvsbZEoAPns/RZ+NO/+40n0n3kDdLwDaG/u/CfRxPKM1
         cJ26uHzGw8UeZ33NrZ6pwKuWUJA+85W0eo1fxlWcx/iUdlJfjklRx9kAm2hbKUr0ZC5u
         Yp6c6YlYFvyU/AODc5IEl0pmo3YNj/nqGQtlFxSQZtfR6E59I3I+CR+TBrQxM44UZ+cq
         7poQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=B6QACrYgmsTInIIJz0RWY3mj4gB7eMru+hGJ5VYLljg=;
        b=ZYSIHUHjoy7tPJCd3vK1G2RX6zV7R88vkBlUBcp28YviKSoHJsar6ldfk+whUi8rkA
         ELdebdF0j30Tu15nizyRlPoEuNWjEG+aZQ3HyAlg91a7U10DRYvAk5DhI//101qXizcM
         Sb4+w2tZRh97MGnoy+O1mcRs3RHUZF8bBdeMoSqRAV79YskgmtE1v605XvZVXejUe+mj
         OK0UIPcxqN3e09jGASoAML5/13+a+mF6pmEnmI/RoTXkufpchofesYN4vosyQCmVoCzX
         lajdWZ+H8D7a9u9MwFiRE8gmvqV2w9/1wj1Ez8jITSDQZUjGkRIlIX5k/bBlwr1VqBvz
         8Z9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6VD7Dpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si106750qkv.348.2017.10.11.02.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 02:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6VD7Dpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2DmG-0002fF-3r
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 05:58:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2Dm8-0002ex-PR
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 05:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2Dm7-0002AQ-VP
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 05:58:04 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:45356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2Dm7-00024l-PC
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 05:58:03 -0400
Received: by mail-wr0-x22e.google.com with SMTP id k7so836096wre.2
	for <qemu-arm@nongnu.org>; Wed, 11 Oct 2017 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B6QACrYgmsTInIIJz0RWY3mj4gB7eMru+hGJ5VYLljg=;
	b=W6VD7DpyMX0RbHj4AabC/FZUE5Z0A+eJM/UfDlO/Vt/+eWbJnxZyNc5ORGpC5SKKK3
	zSz4m/E3x2VXRVUVq2kZvTPjMPneRYU7S0aAFx1g7bv5dP1+TQmEiyF0v1ak+oukf6/+
	rdUbnhZsR0hZGLD0oOo3hnrcA5AMlUKKaJg0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B6QACrYgmsTInIIJz0RWY3mj4gB7eMru+hGJ5VYLljg=;
	b=jon+yusOneWn83MirzK+x/45itsORbZyCrcK1HOBMrcy1sMo9Jd+o9D3pJhdCMPvGN
	7kodVjpNKQTz1r85xpa3U8ATR3qCZrdFk9q45tyeyjTKQ6vgZiuBlfKyp3PlSC7fo7fe
	iekNc1HdD58514+aWbmsSy/m/e4S2nfgpqfOqSPoBTSCwu5YVDtv4+pbu2gqQNgoaFEs
	nxYp/PB1TLWkFM9ikk2ssoWz37Bzcm+W28rlp/Ih8QFPdGc2K8W+AnYFLmcfFtHpt1+0
	zwpULXruwAV7taqL0tMYg9FIpDVtbj5HWc4CAxr7qDE7eG2nLtwO3sXxuwBN0q0pIohp
	N0Hg==
X-Gm-Message-State: AMCzsaVDHzPeI858UATFwxvV8+qCDZztS+z50pBO5zhmY25v5R2q/rHG
	aObM5GJfqE4fvwpH2I2z12v32pnwu+zCXghIJqKaqg==
X-Google-Smtp-Source: AOwi7QBkINXodo7VSBq5X0XjSKqJKIVut1FVglxTIL6uFgvjJ715UD2M+VCra3CPk7aLczvBxIowVK7oxrRso9767Ws=
X-Received: by 10.223.197.13 with SMTP id q13mr16881315wrf.272.1507715882728; 
	Wed, 11 Oct 2017 02:58:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Wed, 11 Oct 2017 02:57:42 -0700 (PDT)
In-Reply-To: <3bab968b-3476-55c2-ba7d-ffd2b902e532@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-9-git-send-email-peter.maydell@linaro.org>
	<3bab968b-3476-55c2-ba7d-ffd2b902e532@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 10:57:42 +0100
Message-ID: <CAFEAcA8OzWu9KqA4MuTYst0o4K60wythCf0u7UuPHjp0q7NAxQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] target/arm: Support some
 Thumb insns being always unconditional
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AXGsycKJaIcM

On 11 October 2017 at 03:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/09/2017 06:48 AM, Peter Maydell wrote:
>> -    if (dc->condexec_mask) {
>> +    if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
>>          uint32_t cond = dc->condexec_cond;
>>
>>          if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
>
> Don't you still need to advance the condexec_mask?

Yes -- that happens after we've called disas_thumb{,2}_insn()
in thumb_tr_translate_insn().

This patch just makes always-unconditional insns behave
as if the condition is AL.

thanks
-- PMM
