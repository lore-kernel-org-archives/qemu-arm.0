Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp876255wro;
        Thu, 14 Mar 2019 06:52:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhPiFRCj9wIkBwWkP4ePSOXXByMGB9+F6Bm07wED66GqzPiaSZ+gcik4AhYiehFksRpi/F
X-Received: by 2002:a25:7d05:: with SMTP id y5mr40798216ybc.439.1552571525813;
        Thu, 14 Mar 2019 06:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552571525; cv=none;
        d=google.com; s=arc-20160816;
        b=swDwXPzEcdKgKXvTOtT9J49OogGOqr8JjaH3U15T697siDngcM0X/Wn5ptmRvHirlD
         nuwkOPHUx5Q5/hfqiP1oe2R4EYHzMgGHoNEGYqVMKFTgVvXtnKyb8R7BDyHAtKvBSycy
         4kSw3tVHgOVnJCJAcMvzf6gPUcblth3du66w9qn6nCFdWfGEUjcAv3uOMnllbutpJzgG
         yNIR77MRL/mHCF0YeXHb8PoUN6sTtfCDaN2X+Sj0NJ4GwvZjd8WoSdy9xEFaH2IJKyy+
         o+LspgJvWXlHRgJrka9tdlFxgfPdCuZ/gFD6ezhFNbNUq8vAafblHytOdOeR8i/j5V1/
         nDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDZ/P8tU6k3AfozJpqGhMMYupYTACxYlgm/Myk+Pvk0=;
        b=NbdoiXJ5jLL6DxWjlkUzO5+1T0tAaokc2s8PL75rsdtohS+hUNhko/PmpSoARfbGuk
         3YwBtdCzQFAc0iVqnkX7f1XT/UHcBWCLMC+7Vc9RQyVvMhp6Ya+j75KhgLhPhkw4siAE
         xtewrydSy60VQTnq771anlL12LzNdSrZ8ACyKL3hgf4F7OAzU7JtkQkysa4hmr/OrvNu
         tA9T0L7K1SnT3ur/m3+Ye7btg6VLTp6jgIGVNsZrGQtCcntznldBpEqtmlgTaRM0T6px
         3PAPDtj2Fg2Ct5reu95i+O2PRAbGckeUAQPxNNZ6Od82IzECYHZQGYnnDc7CZb+nl2nq
         aSJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z1gr1kIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v138si8398134ywc.138.2019.03.14.06.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 06:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z1gr1kIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4QmD-0004y0-6O
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 09:52:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4QhW-0000Ig-9k
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Qbs-0001rs-6e
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:41:25 -0400
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:52198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4Qbr-0001qx-9n
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 09:41:24 -0400
Received: by mail-it1-x143.google.com with SMTP id e24so4697392itl.1
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XDZ/P8tU6k3AfozJpqGhMMYupYTACxYlgm/Myk+Pvk0=;
	b=z1gr1kIbhYkdvAxvZEl+9Mh4TBFXXS5c5stZ6yluaJZ1vp+H0l71AF+8tqhBKnvz7I
	p8Qo7kv9nYLesR/sLaMLtJwZC7PwTXuOdRYQTb7/1mKeevuzfSZD+Nbq3mRm+668JSKF
	MfIfIEAyC3nen9x3O+jtN0/AdTlMl5+ZSqf7Z6aFsVZ2WLf0iCn0pFNDgoUZOmvINtOH
	FpLCtEvt5rAbsV+VvxYspsf2a/ColA1KuZvurh1fCekZdyeBatlayg+WZv8oIrRbv2PU
	qSUUHnmljlrW8JXlSd95HppTYnNLh/326zW1OwMuqeCKxiNwhaLnAiEn8/f4hqPVO0vV
	7LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XDZ/P8tU6k3AfozJpqGhMMYupYTACxYlgm/Myk+Pvk0=;
	b=gLJyay1JvWwNebxIV3Vvfa3uuUnUBdnl07kk3V14VgDAzffAF5w4UmMpy+Y9WGB7ow
	IyIhKp9vZ8exrnNOHxI4zo1bT7yEmGEL46kMpXgsO3ZcGBCsE4+LRdHjgAI/aJMbwHrj
	ZHuQm81PFJgJH5CHM1RH7zNzMN4Jmvhf4fGRLpZa1pvF/37iBqkQkPJRyDWHxh3FtZho
	B0B/nxNa826apqRTED8mNOFAX62j4rjOIZjnDvd1xYminiN+6orBzRLu/5dI1qgJKljt
	zodSqMQ+yHPTS7dHjEdh2iAFEgLH1CzvmWqp4inpEtqRpXBOcv62Lar5epwacfJGrE5S
	YH9w==
X-Gm-Message-State: APjAAAWo/oKv91mRmwXkwcyvvXEJ/U/OaVKVk81twyOVh7CQGH0een/H
	qkmNioqug6mRcLH5zETatfLBKFxmxL01kze71QpOBg==
X-Received: by 2002:a02:6f49:: with SMTP id b9mr27782350jae.143.1552570882401; 
	Thu, 14 Mar 2019 06:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <1552395177-12608-1-git-send-email-gengdongjiu@huawei.com>
	<1dc2936c-6180-c743-fd88-aef3dea5dd6a@huawei.com>
In-Reply-To: <1dc2936c-6180-c743-fd88-aef3dea5dd6a@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 13:41:11 +0000
Message-ID: <CAFEAcA_Yo6CQH-0OZnhACsaZ8UgE=zUPOxoYFschuwOPL3_Yjw@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-arm] [PATCH V3] target/arm: change arch timer registers
 access permission
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
Cc: Wang Nan <wangnan0@huawei.com>, larkin.zhanglixin@huawei.com,
	wuyuming3@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, linqiangmin@huawei.com,
	qemu-arm <qemu-arm@nongnu.org>, liuyutao2@huawei.com,
	chenguoping@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tAUt2cTmym0G

On Wed, 13 Mar 2019 at 02:42, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> Add "Reviewed-by" from Richard because Richard has reviewed it in patch v2[1], thanks.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg604509.html
>
> On 2019/3/12 20:52, Dongjiu Geng wrote:
> > Some generic arch timer registers are Config-RW in the EL0,
> > which means the EL0 exception level can have write permission
> > if it is appropriately configured.
> >
> > When VM access registers, QEMU firstly checks whether they have RW
> > permission, then check whether it is appropriately configured.
> > If they are defined to read only in EL0, even though they have been
> > appropriately configured, they still do not have write permission.
> > So need to add the write permission according to ARMV8 spec when
> > define it.
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>



Applied to target-arm.next, thanks.

-- PMM
