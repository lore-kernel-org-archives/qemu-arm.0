Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2182140wrd;
        Fri, 24 Aug 2018 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYZSNbqupG0x32+KIrh1sgX1STnDV3bsiZBh8/EEJauYscOMChyoxuZFnTbTXNOZ8h+Wjte
X-Received: by 2002:a37:a811:: with SMTP id r17-v6mr998520qke.81.1535107203188;
        Fri, 24 Aug 2018 03:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535107203; cv=none;
        d=google.com; s=arc-20160816;
        b=UWPshxvuo4iSjZJ/0g+RsRk/kIuXKG0WtSMk/YSjD4rJMYH9GWXqDShBmnBWu3i9A7
         +5HevwzOq05dHjN8Wo92gxI6HjSLsP4soGLXZOx8bH55Ajf0AloqOSKWp0Xxr7vgnwZw
         dkMHcmidM/cvQ1u79DeTTmX5Y9grWTmzgxghAjnVQlPOkNuYygXCdMsk7IgN+d8++GhR
         pLlrAnigGO4y/MWQ4xy2R9Gmin3+aQuTuij0XIJKTDTsABi+Y6EIIqd4zsgcXwLJh/d0
         F/KxmBPv+26NzyPuNVsxCja2mZlJy5QTPpMdHXE9xKYtv8Gdi8uu1MKWkeROiHPODbMM
         606A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bHHX9sfoOr78nmmMp3kDmCISvnF/xBjeIAQ/e/0NhQY=;
        b=0S9U9WUASk8WAtw+/q8UQwtZez/DlTbWekUFPejMvDGsySv3djhgP0NH1+rQYVEbtP
         DV5X2K4y5Zsy/PO5dCtTRhE7Ui08y2ZKquhnwNrqUJKVn1rsR0r8OiPt8CKdzZ7NAXvG
         YgdzssP7d+gWScnhIkpb/+Q7ny6nGiZN64BEJTeHXjmFIh9FfQ4q6V90+PG977K5K7Au
         lMG5d+Y4d0/YyI871tt1CBhvQbvTFi4RmEhbS3rySRggiBiRK7JYptKSod6W4jPjFuqI
         N02/asXWZHXS3J8XAVOj+zfMnFpSbXf9vdhdsnBW0JEoWtCw6U18y6+heMC1Tkv1Bjga
         LrYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WkxZ5yii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f56-v6si3514615qte.179.2018.08.24.03.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 03:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WkxZ5yii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft9Va-00087U-PA
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 06:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ft9Ua-0007U2-UL
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 06:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ft9Ua-0003DJ-1j
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 06:39:00 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:38189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ft9UZ-0003Cp-Qy
	for qemu-devel@nongnu.org; Fri, 24 Aug 2018 06:38:59 -0400
Received: by mail-oi0-x241.google.com with SMTP id z185-v6so14088722oia.5
	for <qemu-devel@nongnu.org>; Fri, 24 Aug 2018 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bHHX9sfoOr78nmmMp3kDmCISvnF/xBjeIAQ/e/0NhQY=;
	b=WkxZ5yiio8W9Dt7Ewr1Qow9wpjO+ReJJQNLBAognvLJJPsiNPohiqnNnG4xnOEtjRt
	sNpJZyANYxzJrXqoV8uGFKZGzCMoSjTB1QWUxGV7+xY0vBxaNKO/7VUEKlc0fXBNMJPZ
	W4vvd8e3zS3B4qVCGpKyf6bm2x67a1Taja3nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bHHX9sfoOr78nmmMp3kDmCISvnF/xBjeIAQ/e/0NhQY=;
	b=fEKQWRlgjd2yIsPoCV/hidywkovEeWblUnuwcknYuf3eG8Rb4Y+WnPY5YYIaG4r+rh
	WGdIbf8WHtBZ5Bro3Tezq+R/bAR74cgz9N6uvZXfmuhSlnb9fOAF991VkNaaugoZIlkG
	V6mlUn72EpTQGxdnP9FlpDcOCQMfrwyEURvz7zZmWjhrRms7OXHMAvIMkuUmGgsJKKBX
	3LNhCXCz77UBg2HAuLsvjxIJDkDU0Xu7WiEWHH98S+/mDPEtgR11EDNBxzfGZLSfxqer
	CVHCpYzy/KY+klQxMRWLOdseICHLza7QIHLvAFUinlAsduVoIib4ufF5wcCtj4hQpxtF
	h3SQ==
X-Gm-Message-State: APzg51Bv77SqjnprpFWH0YxaUf6VzTkugLWDW1L4/xWvlQPY6J19yI/0
	e4Bo9O3peqiNJ/OprRsTZexWM28sWVua+/96iJMuQg==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr939613oib.137.1535107139037; 
	Fri, 24 Aug 2018 03:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 24 Aug 2018 03:38:38
	-0700 (PDT)
In-Reply-To: <26a33eec-3ed5-f05d-7c36-5b46eeba9612@huawei.com>
References: <1535039100-11248-1-git-send-email-gengdongjiu@huawei.com>
	<1535039100-11248-2-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA9DJ_GMkq1fGUjXJDu9GUM0cd6Pjm1HsXpm5rQ5n78Zew@mail.gmail.com>
	<26a33eec-3ed5-f05d-7c36-5b46eeba9612@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Aug 2018 11:38:38 +0100
Message-ID: <CAFEAcA8e77FvPCEKGb0eNoWf_NnQqoyMz3P_-=hJCC-PW3+2vg@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v6 2/2] target: arm: Add support for VCPU
 event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ps94Kl7qSQ/E

On 24 August 2018 at 11:28, gengdongjiu <gengdongjiu@huawei.com> wrote:
> On 2018/8/24 0:52, Peter Maydell wrote:
>> On 23 August 2018 at 16:45, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>> +static int kvm_put_vcpu_events(ARMCPU *cpu)
>>> +{
>>> +    CPUARMState *env = &cpu->env;
>>> +    struct kvm_vcpu_events events = {};
>>> +
>>> +    if (!kvm_has_vcpu_events()) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    memset(&events, 0, sizeof(events));
>>> +    events.exception.serror_pending = env->serror.pending;
>>> +
>>> +    if (have_inject_serror_esr) {
>>> +        events.exception.serror_has_esr = env->serror.has_esr;
>>> +        events.exception.serror_esr = env->serror.esr;
>>> +    }
>>
>> I realised that the effect of this condition is that
>> if we migrate a VM from a machine which supports specifying the
>> SError ESR to one which does not, and at the point of migration
>> there is a pending SError with an ESR value, then we will
>> silently drop the specified ESR value. The other alternative
>> would be to fail the migration (by dropping the if() check,
>> and letting the host kernel fail the ioctl if that meant that
>> we asked it to set an SError ESR it couldn't manage.)
>>
>> I guess that's OK? It's all hypothetical currently since
>> we don't support migration between different host CPU types.
>
> Peter,
>    there are two status needed to migrate, one is serror_pending, another is SError ESR value.
>
> If A migrates to B, A can set an SError ESR, but B does not support to set.
> when A is pending a SError and need to migrate to B, I think it should support to migrate the serror_pending status without the ESR value(the ESR value is 0).
> That is to say,  if A is pending a SError, when migrate to B, B should also pend a SError.
>
> or do you think we should refused this migration?

I don't know, that's why I asked. If we have a pending
SError with an ESR, and we end up on a destination machine
where we can pend the SError but not the ESR, does that
make sense (ie will the guest still be able to usefully
continue), or have we thrown away information that the
guest requires to be able to usefully use the SError ?
Presumably the ESR is important, or we could just never
bother to set it when pending SErrors.

thanks
-- PMM
