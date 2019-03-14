Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp799508wro;
        Thu, 14 Mar 2019 05:43:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLUeMwOmhe6QNgb+vqYUknx0hWHkqnXWcReD8hjeVER04JyxYvjMD/oQxe39w0hrx+A4rK
X-Received: by 2002:a81:457:: with SMTP id 84mr38265934ywe.340.1552567420683;
        Thu, 14 Mar 2019 05:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552567420; cv=none;
        d=google.com; s=arc-20160816;
        b=HNY+hfJ4axi6Cs0vPam/chJrN3XFp8Ie5rpPixPCnXebQkL8/MzgZYNiHYAuvTC+A+
         +76awhIZb4QnJqii/2wLBLnSc/doNI4NXxOu28MT/8HcR9RW1v9bnK9mtMoEG7H/ca0b
         8M7twJaWkWlMJnCnngKyRAbQkvHGVrJ5qU3XCm7+WAg3AcIkPniW2wXA2UUz+8RPiMhc
         fcijtfeuWujiw5rlFW1jQGHbpZB1uBTI9vDR1aDJxhPLWGNDiorMPITK3W9INN252tAL
         8gv+HCRvsZd/nffjgif4SVBTMNbL+7069d3ERkNfGDHUJGSu9sWIK9OHVjlHVysIO3EP
         paZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtT5vdU8vcwApj6YJdhgP9aaPjGqjICO+Y4Jgq7uQO4=;
        b=Nh/yyQ3yK4wpO8dQxgKxpJiCCvmRASeRuY96Ip4ibCGrKbkeDKUIvqu7fmnXGecEM4
         9MqYJxI4jujYySI1p3icHbRl9fqYSGocNiIdMcBPE1CuTMLMeeRS5KHX10G20V2Kr4XV
         UPFks2Y/F3HL0bRWd4wUMPfgtU9IlPDKHAIDpKLc/tPTOL8MOTOoaPOpsk8QUMp3CDry
         sKzn+BMi/VN0M4HW6OL3yDNEOz1/rQqLrGzAtlb/Ml4xEZLWciDppFL3LngxY4K9xEh7
         PXYDoGPvCFurSmpqKD6Xsrpe1qfWnfIQWe8ZYlhosDcRMBkAoGm+WG7b4EtdFZsBMYGH
         2Z7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Et6IfTCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t203si907135ywb.285.2019.03.14.05.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Et6IfTCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Pi0-0000DQ-7H
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:43:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Pho-00006d-IQ
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Phn-0008JK-VU
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:43:28 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:46220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4Phn-0008J7-MP
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 08:43:27 -0400
Received: by mail-io1-xd33.google.com with SMTP id k21so4870262ior.13
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rtT5vdU8vcwApj6YJdhgP9aaPjGqjICO+Y4Jgq7uQO4=;
	b=Et6IfTCzvQdGDUFGTeHBAZjSuQnuk072wf/mgB4cUKitxGkAUh2WjAAKReSfeiPYVS
	Jve592EhaKLex1Sfnfq0bdqB9KsgBbcz3NertvCLXBKWhSJOH7ZCxOVo/hrtlHs8peYG
	EfoIXkh1Fubye/PqkJWJQJGyFluWWxSmNIeI0l1lETy5bLSy/01eTR0VOVG+SZjHGAqu
	kOGxfXgce/V1KfY0QSVom/VEOFkqGue0uYrLJhj0+iPf70SVLd2+8Ce/hVfPRgDxViP3
	ZuCyvXRuX3REMMp1L1myPVqsBr3SeUQdsAM7T6utfemYbe5loHlW3LaNC118MgRkzfI1
	qowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rtT5vdU8vcwApj6YJdhgP9aaPjGqjICO+Y4Jgq7uQO4=;
	b=E7leXzb1JhR9+f7oO3vMr+RWvqka7K2gBbyNmlRkKI88tHIK2AbkaRBvC9zFgxvJKH
	haNBbwLjrURzG9BKuigoNrt7eMll5mQGdoXe0ak+nTJm28lqawiJlJneWVhT8PN3rcer
	Q59FYsP/g/JuxWCH76Cf0WshPFwhTy0O+OZB/62N3wXSxjloHSq5ZZZdl3qCWL3BPmXE
	YVO0q4jnwEhh5942l+1MdkPjOp8U7QRY7bIcSec00Y7VaLxgV6DAhmEzeOgFqoCej6+c
	Ly3nY79dGd/KceB82UG1zB6jaobxghXFlXCxSk5y7wqdv2vrEuUMk+BYZ8YeJqQJayVk
	S/Hg==
X-Gm-Message-State: APjAAAVFIYhgDe/RMi6uNK69yQcCHp48tLz5kkc/OV4tanqAHyE4MTuN
	J1klnISFMIf5oW6QHYxJPessmnHgTx/aVeIYVlawDg==
X-Received: by 2002:a6b:7202:: with SMTP id n2mr12967755ioc.82.1552567406837; 
	Thu, 14 Mar 2019 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
	<6d9dee31-6072-8d90-0fce-b4966d5f76c9@huawei.com>
In-Reply-To: <6d9dee31-6072-8d90-0fce-b4966d5f76c9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 12:43:15 +0000
Message-ID: <CAFEAcA_+aJfC4LvMM339TO19kcMTH-Dwy2uRNow+sxFkStJPBQ@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d33
Subject: Re: [Qemu-arm] About Revert this patch: arm: Allow system registers
 for KVM guests to be changed by QEMU code
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BOfEzT8Iw+hu

On Thu, 14 Mar 2019 at 12:24, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> If you think this patch will introduce some issue, we can add one function write_part_cpustate_to_list()[2] to change the specified
> register instead of all the registers[1].

It definitely does introduce an issue, but we need to address
it by working out why it breaks something that I wasn't
expecting to break. Then we can fix it properly. Looking
it this is on my todo list for this week.

thanks
-- PMM
