Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1437410wrd;
        Thu, 23 Aug 2018 10:48:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYyGeL4c8zNQSeSxKovxsljj6Hb5qQVsBQhRvg8yxm0itdY8JN+74bXe1LCabezKUG1xnGZ
X-Received: by 2002:a0c:ae2e:: with SMTP id y43-v6mr9466946qvc.27.1535046484761;
        Thu, 23 Aug 2018 10:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046484; cv=none;
        d=google.com; s=arc-20160816;
        b=x5yaYgFLlXyOFZyCFoNyPNMs0iGkGain1upD/7fxCjRMOoTPz5yk96m2c/5JI4HuUj
         JOj6pRu4tylMRhl82Z5C3pdbDxudzDoGC4bpDjeJUJLXJ6ZhFz94wWVKaxCLDYJbwtIC
         lmts3aF4GFrmrsdGio8hePO7L2lE4TWD/3QoF8CS+5TVkocnY9pMkN8nLjca51btufY4
         cFDNeG9XyhV52LT/KEzU0CvxAet6WgmUQExT1YyG7rjzjXvcqUph+fEBLZmrvWst3wTI
         eEkz4EkFl6mqgmviWrtInI+iSAq44nFdBegl3icydV4JK6z05wd27cNS9dM23IxyxE03
         YUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gJOurcP0PPPw0nIb3X0Yivz16nYXe7wvIKGO7ANlJnk=;
        b=Sox66UJGAQoHf3VRnSNuNfQWB1UW1wJnqCSN3wt4oFcNMJ6ykH1rAQrVl5UmOHOkkD
         HQ6JAe0frg7xipLZCq5qQ3q2hr1ApX4V/u1irUOfmFU42T4plPcR+2ZtWBSBnaoLdytR
         ZKkesp/uL3mxFOufzywxuu3JvCvQfysHB5XovRmjLDWgU+JExxMDc7jZbF/aP4J6RCGE
         YXd5zQhlwtiFdDt55XTwKE/8PNoSdLaa4Pr2ewMxzV1fA7p+gdcqagQNi1eY1bD1v/BH
         LDpmAJgDhI1eiZWSt0m5p/GXo469uNSq5gZ5Gq0um5dRcgfAfYkLIwKnXMGQki21B+38
         6LjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gh5mu/GZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b13-v6si1057956qvp.272.2018.08.23.10.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gh5mu/GZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstiG-00081s-7s
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsthc-0007zz-OH
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fstha-0008HU-Oj
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:47:24 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fsthZ-0008Fb-4N
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:47:22 -0400
Received: by mail-oi0-x242.google.com with SMTP id k12-v6so10721637oiw.8
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gJOurcP0PPPw0nIb3X0Yivz16nYXe7wvIKGO7ANlJnk=;
	b=gh5mu/GZkuslIhPv9knZs2eEXc7adj+KXIhUJCfrCzieNyfXYGF7di1a0WgE95u1Tw
	j6BqDFIt5JUWofBco5PiTKJdpMTicOBc6EZ/Dz5df0dVBGr22xEfSQQaMiKRP5Uu1U0m
	TI4hKahEaf0BlYvzz+P/6znex61MR59fIDa7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJOurcP0PPPw0nIb3X0Yivz16nYXe7wvIKGO7ANlJnk=;
	b=S4RIFKcHHkO2M+ZF34VfQKlMa8ICqDj8RTy+7GIOWdATWBFBGawUTu1XE5pNJiFhgB
	7MVKzoHc9CK1qLYjBjlvHv+j83sXKl/3gErg1nd+b+ixjGnRUpeF1pSGlJBWKLJ/9IzO
	+hII9Ff7StmncKzTohUAw2Y0vBcvSgO5mT9uk5FyLWXwrNhBP9XMPHXmWmPpvCxWEtyS
	bpxejoycHd2d6UulEVVW5/iPAnRWSmG6jp7FXpvRC7hVViZjBIvErqpeK0GpUPeYkxwC
	v1ulCFWmWME8SGMIHNTEYNLhzpjgncV4K9pjj9dmQdEvLLaNWg1rt1/BUcK8oVKxCzoY
	kOlw==
X-Gm-Message-State: APzg51CX0QWgc5mkBQr3DsEw4LO+xNbltLMfI4iKpt9P0Qxggjm9ob2t
	nGXPgeQR5yugL2nEaAgJrPYbQ7zn1AUWaDv/JmH/tw==
X-Received: by 2002:aca:dd0a:: with SMTP id
	u10-v6mr9563544oig.171.1535046440602; 
	Thu, 23 Aug 2018 10:47:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 10:46:59
	-0700 (PDT)
In-Reply-To: <CAFEAcA-ZYqeWz9mVBvWNfvMThzJOzB7-HcQ=db3DzG9ZYrOi7g@mail.gmail.com>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-23-peter.maydell@linaro.org>
	<786e23f7-8492-477e-632b-10dc3ebd4576@linaro.org>
	<CAFEAcA-ZYqeWz9mVBvWNfvMThzJOzB7-HcQ=db3DzG9ZYrOi7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 18:46:59 +0100
Message-ID: <CAFEAcA9G-wvjUp8UuxXyr-NvAmyRca-a8Pu5FfHqhL0oCVsG+w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 22/22] hw/arm/mps2-tz: Fix MPS2 SCC config
 register values
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
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yq/gqPOctL6/

On 23 August 2018 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 August 2018 at 18:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 08/20/2018 07:11 AM, Peter Maydell wrote:
>>> +    mmc->scc_id = 0x41040000 | (0x505 << 4);
>>
>> Is it any less clear to say 0x41045050?
>
> It makes it a bit clearer that that field is the number
> from the image name, I think. (Compare the an385
> and an511 init functions, which I notice I also need
> to update to fix the equivalent bug there.)

...though I guess that's less true now we're using a
hex constant rather than decimal. So yeah, we could just
say 0x41045050.

thanks
-- PMM
