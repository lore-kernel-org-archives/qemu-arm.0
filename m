Received: by 2002:a0c:88c5:0:0:0:0:0 with SMTP id 5csp3076408qvo;
        Mon, 18 Nov 2019 08:26:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLctZEN3Z99E0SFA+yG17hxJB0ayJ2CRZ0oF+yWbt9uYcuiWQGHsJ4GV1Kid2yuJxMyAM9
X-Received: by 2002:ac8:3475:: with SMTP id v50mr28129064qtb.105.1574094418581;
        Mon, 18 Nov 2019 08:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574094418; cv=none;
        d=google.com; s=arc-20160816;
        b=z5qEciGRM6wa4U3/B4xwz84R1EYeiLVgwt9iEA9SqElOdtsCyFQEmK6WbzSA99c+J4
         NKYSmjjj1Y4ogpTv7CNezYet/bIITGKOT3wY5rTyDl5QeqPq9w8XeSExrgKsd7/91slz
         noVElQsAvLzGr6cD3XJaABR3qYGczrxqutDjMzqPh15W/kd7mgk2WrynTyWnGMEctUYv
         Crvcf0WkNMk/n1uDz2JG+gaGvVDcOSCwBh8l5SHkztKputsOdWlZo1ApTjbu9S2+Dugk
         fV9y6gUeHYcc2V6HZd8HIGAuLwwvVPWLKnwKtgiZGZ3zW3IVyPQZBSVL4DjhD5tyi8Vw
         j5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XIkGnW1aRZhqvnzNNKG7aAGx1vjkLpHYjgJTUtfIq7s=;
        b=UffwT7/1w+WS9RZtcNoaE2JHXNM/LhEMX0VxLgx7Kaqcp3Xi7VmmYfXZ22Jnbh0MD0
         XWXj4cDz6fBxreoF5kahbLp+/WiY61VBXi8/eYuSG1RoK/6CrGQGpafOdP8n5qtJZc9U
         GLtT/+v5L9YYPUMhiNnJsfLnXFLMlaH2rJGM6ok+kfkV+sE39QdGVfQ0ns8NDns6TukW
         /V4JhrSs+xDpeZHZLn0YsR7JMWp+qI7mxPEKyEHVEzUdIrIQuh+84CEco0lHVhEvEN8W
         KzgU2QyH7tfUVJLJ64lgv3XUWkIADR3WzAcLI9Packvh44s4dfbEMKfamBJbbUhdK8Kl
         29TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zQTzjQCf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si12121927qva.16.2019.11.18.08.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 08:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zQTzjQCf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWjre-0001mc-1I
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 11:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWjr7-0001j3-2x
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:26:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWjr5-0001KG-C2
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:26:24 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWjr5-0001Jj-67
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:26:23 -0500
Received: by mail-oi1-x242.google.com with SMTP id n16so15868826oig.2
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 08:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XIkGnW1aRZhqvnzNNKG7aAGx1vjkLpHYjgJTUtfIq7s=;
 b=zQTzjQCfPHL8cSUxxFIptzbn+pteWPqD0rc+uq29QAZYKZPTkbtvDpErjq0Rbh8nMJ
 KaN+cWOFwgrPfxUbtf1Tdt/TcQOCnSwLhJi8a5PBv0Gxz5Zy0oZB2I+qBfPmoWmfIV22
 XIoHho33pfS88oEBvJNsAWOOKQHtec4YjYiZElC9WAi05TDkz5P0x49FGjj/4oiUVfou
 msBMJCdeRZyTelz4RCkWBKL/EPI11T6mAK8p1162UrwtCJiXP4tZAZrJcLMdMfIMlc1n
 j/viMZkl0niBfC/pDIqzdcxKdgZ4Su6OC+gJqsrEStfjzto/l1FwBOosJ5C1tItX9o2N
 84FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XIkGnW1aRZhqvnzNNKG7aAGx1vjkLpHYjgJTUtfIq7s=;
 b=jnvWv7lCQeXkyHvMaA00T7zXGByvMKRufNG+goefXZkA5mq77fX34qf8A29BWgXaat
 14doxwtzds3WjCudf4ZOoGahHswaXTxYmJL0lwIsRgxeJe2fNsNOcDk1B0xOCXIkISOc
 UTKeWL0F8T0liFyYiEjfkDbJ4slUCnEc9uokm6XXGuDAK7NzKc8MnCJWl9Sjp1Ze+AnG
 HiPdu/3dUIZL5aSX+fUz3UFz2WCVMoaO9rsHq0dnKlKtZzOcc2QxLNZYaL6znk6tn3VR
 r9EJdLQtMBisM0ijeJY7Clsm8yfl5p3IQDEzM5KSMkdZ9Zgdrxb04UNzIdTSl2vUYKLk
 RzlA==
X-Gm-Message-State: APjAAAW2s4+1nyIE8twKnzv+Aq3HGI4oI3uBTK6CnqagnpQLOEPmXKOl
 wILzJ7gH0d5uXurmDtYoIuKhY5YkC5oykND1J5Qd/A==
X-Received: by 2002:aca:cf12:: with SMTP id f18mr19906448oig.48.1574094381951; 
 Mon, 18 Nov 2019 08:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20191017044232.27601-1-richard.henderson@linaro.org>
In-Reply-To: <20191017044232.27601-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 16:26:10 +0000
Message-ID: <CAFEAcA-36SCWn+FNgNiB_JbOJvYxpHa9S-gOVFH__xgGm2+cXQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm vector improvements
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMCiM9AGrvTf

On Thu, 17 Oct 2019 at 05:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The first patch has been seen before.
>
>   https://patchwork.ozlabs.org/patch/1115039/
>
> It had a bug and I didn't fix it right away and then forgot.
> Fixed now; I had mixed up the operand ordering for aarch32.

Since Alex had a nit on patch 1 I'm going to assume you'll
respin this series once we're reopen for 5.0 development.

> The comment in patch 2 about ARMv8.4-DIT is perhaps a stretch,
> but re-reading the pmull instruction description in the current
> ARM ARM brought it to mind.
>
> Since TCG is officially not in the security domain, it's
> probably not a bug to just claim to support DIT without
> actually doing anything to ensure the algorithms used are in
> fact timing independent of the data.
>
> On the other hand, I expect the bit distribution of stuff
> going through these sort of hashing algorithms to approach
> 50% 1's and 0's, so I also don't think we gain anything on
> average to terminate the loop early.
>
> Thoughts on DIT specifically?

I think we have two plausible choices for DIT:
 (1) don't implement it, since we can't make the timing
     guarantees it suggests
 (2) implement it but not actually change our behaviour:
     this is technically a lie to the guest, but it means
     that guest OS handling of the PSTATE.DIT bit etc can
     be tested

At the moment we by default do (1). I think we should
probably postpone doing (2) until somebody actually
asks us for it.

thanks
-- PMM
