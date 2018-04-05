Received: by 10.28.71.155 with SMTP id m27csp6104925wmi;
        Thu, 5 Apr 2018 07:22:51 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49iM4vvjqVMIOq+BOqnhwhR/p9LkUFF04aJHMojhecQKyUO99nPbEi1C42DakYBGfh72+7z
X-Received: by 10.200.63.6 with SMTP id c6mr33141970qtk.286.1522938171732;
        Thu, 05 Apr 2018 07:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522938171; cv=none;
        d=google.com; s=arc-20160816;
        b=FtJ0cjbRMLhsQ7gzvHfQbWZ/XS1Q+ZxCH+a705Yd9YZDlqo1EVIvwKW0+Qbw21tcxs
         auoXwMCed8T/2Cz+Uv4FsJi2pO9xdrjXZK1W3IrovGKebIDbFZkSP7DCp3zXsFSjOWCk
         bcg8u0a61yz2JzEfibAPqP4PSqyFIOcA9gfygLuc0pvgIT2UGQhSGat6qQWnw3MiAvg8
         p0SqM/1mD2z5wCczYjaZCgEi/FMNGQoRIDb3FQw6PnCxweKCBUcTQ+u4/FiNyod89YrG
         wBMBc7xMOI/ZQ5iuGJtuFACBWQ7jSIgScC26jTejP8+ud3BfK7dbjyx+VNoYm4YdLOOY
         1+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Aw4XBJS7dnM4lRARE4xeg5tN9DTwWD04TUxYEs4TOVg=;
        b=A7jX5T3Uvq7PHkqVO1hIBPupA9XoohVPuOcOOoEDj9XP9v6hEY5cytWPR/yOY9AXNP
         y7ObZtAJUt8FreGi+0H5b5j8MoCIz44mjtk8Pdd2bSZm6aYsTPnc5E5VeqKUmlYU10AR
         HGtXyclxfK6gr8Z/Hxc8MLIORAGa93um3OHpbq60oR3nNLvldwfHRDBaSPkf3grz/Bqj
         bDj2059iFEkIuqF4a8Ph7fkE28+H6YwycT2d/mjeCr7rqjgINzfEZNLksx0uzUp0PaJa
         W01bFkBEQ/n4MP20J1cXrK1oDDIq0qyLyNgV9dvkH4phKEEsSgVKMsomzgJ2BzlKcL3o
         gx0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ON59mIwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c185si4117955qke.21.2018.04.05.07.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 07:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ON59mIwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f45mt-000283-8p
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 10:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f45mj-00027P-AU
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 10:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f45mi-000420-8W
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 10:22:41 -0400
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:42719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f45mi-00041Z-2x
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 10:22:40 -0400
Received: by mail-ot0-x230.google.com with SMTP id h55-v6so25845378ote.9
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Aw4XBJS7dnM4lRARE4xeg5tN9DTwWD04TUxYEs4TOVg=;
	b=ON59mIwAQcSSn+LkiZzl0XMVbXxGynmCghGpyF67X+bKamO63QwH6BCO4WFWv8OhaS
	AOE7lML36CZbIrcy6mxBQWdlvWCxhRbF3T9lkYQBrqNiHl458OHvoSq6Zd6YWZWiQvIG
	E0J5DuwbEHzqagAmHuPVhisslYp8gxFSJdYfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Aw4XBJS7dnM4lRARE4xeg5tN9DTwWD04TUxYEs4TOVg=;
	b=nsBklavdQc7qmRWxdtoq4qkaLVM5h9EmsS1+MWEfoglSBZbIh9XqPYRPCT2Ggqm1ob
	+u24MyavHNCXCxkO5JIc3uk/lfJ7uCPG6yjiboYKZHLKWlZrqLjzgm5q4pLMmhADHCbI
	W2J8oH2nwHeZm0hHHGONTvFkof+YQG1jGSsvok1F5W9z8bRbNSdHeKBPCeVZs1VgeMCt
	fAjTcnUEfdyovkjrzt33BnY+GY5QosvBWRGgLZw+6Vwjoy0cVARAtyidQ5FXHjyFDU8l
	AL1CEZQjFRXWxArzUXou6x+hONZCCojmRVp6/wBWsqKmLpj6qSkroMOt0dmpRuRBs6ns
	o3FQ==
X-Gm-Message-State: ALQs6tAliIMRhFuXWBSeQgeZ691rRoJlFq+gBYOFl06RFTlyswnEYJd7
	w3uuBu4tvArGB7I41cjvE4iv0T4rWBuuJVkcrFzlYg==
X-Received: by 2002:a9d:2ff2:: with SMTP id
	b47-v6mr14577099otd.316.1522938159254; 
	Thu, 05 Apr 2018 07:22:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4048:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 07:22:12 -0700 (PDT)
In-Reply-To: <CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
	<CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 15:22:12 +0100
Message-ID: <CAFEAcA_JYyHj6NGJahGPQ9p9XQz6rkmhWMfheW96DzkciModDA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oICO8yOceLuy

On 29 March 2018 at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 March 2018 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> On 2018/3/20 19:54, Peter Maydell wrote:
>>>> Can you still successfully migrate a VM from a QEMU version
>>>> without this bugfix to one with the bugfix ?
>>>>
>>> I've tested this case. I can migrate a VM between these two versions.
>>
>> Hmm. Looking at the code I can't see how that would work,
>> except by accident. Let me see if I understand what's happening
>> here:

> I was thinking a bit more about how to handle this, and
> my best idea was:
>
> (1) send something in the migration stream that says
> "I don't have this bug" (version number change?
> vmstate field that's just a "no bug" flag? subsection
> with no contents?)
>
> (2) on the destination, if the source doesn't tell us
> it doesn't have this bug, and we are running KVM, then
> shift all the data in the arrays down to fix it up
> [Strictly what we want to know is if the source is
> running KVM, not if the destination is, but I don't
> know of a way to find that out, and in practice TCG->KVM
> migrations don't work anyway, so it's not a big deal.]

Shannon, are you planning to look at this for 2.12, or should
we postpone it to 2.13? (It's not a regression, right? So
we don't necessarily have to urgently fix it for 2.12.)

thanks
-- PMM
