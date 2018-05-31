Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5833372wre;
        Thu, 31 May 2018 04:58:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIl5nIn+6dxT7XBFVeo4pPJpnGsDXYyr0drWpkeZnlVxU7RJARpBJ949jfKAXBcA+JbGwNB
X-Received: by 2002:a37:b8c4:: with SMTP id i187-v6mr5932935qkf.412.1527767889912;
        Thu, 31 May 2018 04:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527767889; cv=none;
        d=google.com; s=arc-20160816;
        b=XZ2bozVINompMZOpr4KSt2JIs8o9QehBGx3z3xpab4YrF1ta2/d6BKoEJPJogbI1Ra
         CjSXbn1xZSGFOJ5XQfBnET+arzJ/VIKzXlJVoRgx6V/Zc0T5EunvzJlOelW3G9lK4xmC
         Q0z3Iw2hbK9BEdrZrvosWzLTegJkNc7LQG6MLS88w4YV8e83cHFxOQnerpwwgbmbfzao
         wL11MJ4MaKDGkz1fZiiXIc/yDk9CvWUGU//+SgmdHteMjtvudPuFkp46/GHOhakgu4U6
         vctYGHjpcXUz816U+9nSB+0olVkvutxKw2maJQ6YyhYbgd5dEJ5xEDMAAXSVXpeE94Ul
         w+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZhrGevGMVeZE324P5eizVZdyany5/6rCHj/inl26ZfY=;
        b=zLjtjCZRcZMmAW2QKTrDU631lhk0VCTTG6MuKA9asFpjgN178xM+3Z+CG3zusr9l7S
         YkQ/RdQOjgafGjE9DXBMLqhA8vpR4hnWYnNB8dLEeH5UEyz6SQFHa9Ouq0JOaNKCFfPG
         fgndH9Baf+MMm8KQhwB3q32C/0FfvBmMUGW1ckGVN5ScXvEZOHxneUq/2BSmGHXOuFE+
         kEdnaqefbMJNfHfKFt3Dx/Kn3q2Ia7ut4PO6KUOJ/Ix72RIrqFpBs7/09n2GqM+dWG0N
         F8ihT+uLKqqr6tR/Qw3mbG6C3Ll+7DEQAIR0FfIoT99k5KJsGT7CP0gxCdfSRys7JIP3
         j4LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTWAy09/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h12-v6si4098612qvj.54.2018.05.31.04.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 04:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTWAy09/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOMDZ-0002EN-EG
	for alex.bennee@linaro.org; Thu, 31 May 2018 07:58:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOMDQ-0002EB-8C
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOMDP-0003Gx-JO
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:58:00 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOMDP-0003Gi-E0
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:57:59 -0400
Received: by mail-ot0-x242.google.com with SMTP id t1-v6so24969543oth.8
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZhrGevGMVeZE324P5eizVZdyany5/6rCHj/inl26ZfY=;
	b=kTWAy09/Sz0RRQEpBOWOvO8wUh9BZ9VMDLFn5gHK494vUDJv3bvoeCLY6239cCkNIo
	nE77nzymn83kIiLQR/mHHnv39aPS3wFm8719AFSQdRLfqt5LUt0RZ5b2hA9pWYhD5Hne
	PA8wNAswyTxaHqT+x80Tl1xs5e9pf5AZRSBBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZhrGevGMVeZE324P5eizVZdyany5/6rCHj/inl26ZfY=;
	b=LzU04unBIdVwITx7+EJ9l4r45PydRT4dzk4iVtQTL1RKeYSeFgqkzXzT47ZttEtRBg
	gqvT/4ZVkhOifD+WWqwdy+Li1lRnKnuV/GSFheUvjXT2er8UAn+4+hSUebqA0xm4FTRd
	GqS+aNGOfmpJmQgUfkpUlXaiLIYxB6KwTxLIF+0EinJeHFcHiIKkWRm8QVlVfwuDnVuJ
	E1VwYCd/9MjlRXOW/Sppp648wplAWp+Lk+zOB2NX06dSsxCAKhlXF/UPEM5826d0teUc
	a0dmE2FvRL4pLzXEVQ83Pet/VwB+giPtJ2PydbutbeUb08XODO+lVZWOK9ya/l/ZDVZ+
	+RTw==
X-Gm-Message-State: ALKqPwd0k5WR6xmP6D01DgnGHd2yikmWGq08sHpX6se972PEJi3D5jUq
	5a1FkFUiETEmYRwW5Z8TNkRWPXdBihiEEiGc2Oohsw==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr4687859otd.210.1527767878497; 
	Thu, 31 May 2018 04:57:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 04:57:38
	-0700 (PDT)
In-Reply-To: <CAHmME9pLYSwBQyus7vKu1zb48EF8D-X7vW=nuf2AV+xGN5ERbQ@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
	<CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
	<20171212151605.v2eoestysaogzymm@kamzik.brq.redhat.com>
	<CAFEAcA-t7XFxizUQMdo_JYTLet_a8ZL-Omg54gLOQC-=o+vjuA@mail.gmail.com>
	<CAHmME9oda=T6C53BYi-Op3cWbG2auBjVDoUWuiJoCyxxR298fQ@mail.gmail.com>
	<CAFEAcA_Ut0hjQ=25anhHtGgyY92++eTgyBwY1KbqRbLUeje0Hg@mail.gmail.com>
	<CAHmME9pLYSwBQyus7vKu1zb48EF8D-X7vW=nuf2AV+xGN5ERbQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 12:57:38 +0100
Message-ID: <CAFEAcA9aVLZtzyF7eCjgJOosmCdemOUWjH1ekx+wiZRHLyAmeA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qH4QDTQcMgE4

On 31 May 2018 at 12:48, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, May 31, 2018 at 10:32 AM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> It stalled on the fact that adding the second UART breaks
>> UEFI images (annoyingly, UEFI iterates through UARTs in
>> the DTB in the opposite direction to Linux, so if you add
>> a second UART then it picks that one to use rather than
>> the first one, IIRC). So it would have to be an awkward
>> thing with a new machine option to request the extra UART.
>
> Can you just add them in the opposite order for UEFI then?

No, because that would break Linux guests. We don't
know what guest software we're running (and indeed
UEFI typically proceeds to boot Linux).

thanks
-- PMM
