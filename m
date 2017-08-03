Received: by 10.25.221.202 with SMTP id w71csp1226848lfi;
        Thu, 3 Aug 2017 15:13:50 -0700 (PDT)
X-Received: by 10.200.37.27 with SMTP id 27mr440447qtm.247.1501798430203;
        Thu, 03 Aug 2017 15:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798430; cv=none;
        d=google.com; s=arc-20160816;
        b=XImm+P1LOEg69ONGy5H1lriJzk3aUEEJ+r1YVRVspI5epq0KkUMsmLELv8JDr9pzDs
         UMbi6cHKnXIL1/YZ09wfKuhRzI/ovVPvATDqUTEiaHjovuQ89irIYcxX+Sd2EHdt3bVn
         x6odNK+yHxR4JLPWhpzZOfps/AkZCEmaW7TpBCzSOcrh5CWdUAFKp8Do9IvaMWKrAJem
         SdAjiCWuYLL9+DGoP87DKMfmcD7FmRi8Nu1sep+Ez61e6ZljU9HHFeonQy90CU8NtHuL
         l9JxjmikFRKPS4ay1tH3xqL8vZs8U90BWm5viEnzMBBnpM2GA4fCE89CtnIXfbROsJGb
         APdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XoA5lIoK7V0trv/sXsrkvd+2gS8SiJXFVCxxeqjZGG8=;
        b=tznF1y2FBDNWospOUecVeiS9WwH5synmXZMfm98cYAumTXYKsP3wlEgz+I/u26Vh7w
         6iZ0DLCc4tmawLY17+IwQu2u6KNLJ0XtdOP1bjcwq9wfFUvEUjB+fipB+lutZr1bD8nB
         c4EQqYcNqA5eSx52+oSZl7HpEQCZcvfRVmqJC+qaSbubaspCk9ktHZY4GnEussO8coj1
         6yVAjqpkl/lWmgZQOCiJ846Oo+hLiBX/ir/ZiW/TiOeF2cMdvosofsJxYOxp5p3D5knV
         ZnmDzGKefOZDAKeMjuiNuoPuCohh6krOdafu2umpYkKMfSYWyyoGdeq/lDhhb4O/JBdk
         XCyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=qMatTaga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a5si23907853qti.555.2017.08.03.15.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=qMatTaga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddONE-0004r5-Hy
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:13:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddON6-0004om-FK
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddON5-00065X-HJ
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:13:36 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:34331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddON1-0005yS-5I; Thu, 03 Aug 2017 18:13:31 -0400
Received: by mail-pg0-x243.google.com with SMTP id y192so15863pgd.1;
	Thu, 03 Aug 2017 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XoA5lIoK7V0trv/sXsrkvd+2gS8SiJXFVCxxeqjZGG8=;
	b=qMatTagaPlsMOTT+zXfR+L0FPozBXVpD3eYfd+lJZfIgYof9Ei9B5ARHI9rSRyrtAm
	NVWwCaVG/usceZ6EjdoK1GDlvvPncoyDdwrHiNXbN+Ns2owWFh1M+cSuZJ/1WWYyir1a
	0hu1cz0BP8g2s5nN6sgyhIrP3TLHuO3ASoFcAZ74Z4DU7nV74V7jSV3ic+hT+BbmCZ5V
	lZICbHFuyhZQY8FJTmUEr9HYQwJYH3WEw9wOTyySgeeJCZrIMpqBGog7CrJxQ5JNuwOD
	F2E0GIOq6ym39Xx938urQahE5pie1vWa6sV8BTuOpW0aToxCH45YHJ5z+0aXWFQ4N1aX
	AWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XoA5lIoK7V0trv/sXsrkvd+2gS8SiJXFVCxxeqjZGG8=;
	b=KuNxd21Tl55UV33P3HMueZLMIvjctOBo2mWQfz1P9x35anG7eVX5FIg/CIKGN7FJ2v
	wT5lEiMISp7y8tN6zgatBodpDssq2341MkRA+DWQpxrzBq03nsv9zhugbpFu33geRN5f
	JmUGKSitpGGwkMjVfn+R6IxAGujBeKnIA6kFVnjv779vfYVVsvXBz6i+xkHteYwWWs+M
	6mb3bawsdShEMDf/bM2/OFTE0s2fHgvP6+wnKcctSDsCVDBuLlite3AX/UlmnG3h3w9l
	dER0gvbp2EeQnRoBhJSzBwMuNmyNcV53ZlGHKi8qazY13SVRXUgSkh2BP+SmJ6K7ODL/
	VQjA==
X-Gm-Message-State: AIVw111lnSe3RaG+/FjbPSzgY9xOp9GAy8Hy4LnsXDIYbDJ/CwUaPeA3
	wtE1Gu9a6oKJvg==
X-Received: by 10.99.134.194 with SMTP id x185mr284245pgd.210.1501798409933;
	Thu, 03 Aug 2017 15:13:29 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	c12sm1141pfe.154.2017.08.03.15.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:13:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-11-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <91f1649d-ffcf-85c5-b83b-644ad1875fcd@twiddle.net>
Date: Thu, 3 Aug 2017 15:13:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/15] target/arm: Don't use
 cpsr_write/cpsr_read to transfer M profile XPSR
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CocXR7rj64OH

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> +        if (val & XPSR_EXCP) {
> +            /* This is a CPSR format value from an older QEMU. (We can tell
> +             * because values transferred in XPSR format always have zero
> +             * for the EXCP field, and CPSR format will always have bit 4
> +             * set in CPSR_M.) Rearrange it into XPSR format. The significant
> +             * differences are that the T bit is not in the same place, the
> +             * primask/faultmask info may be in the CPSR I and F bits, and
> +             * we do not want the mode bits.
> +             */
> +            uint32_t newval = val;
> +
> +            newval &= (CPSR_NZCV | CPSR_Q | CPSR_IT | CPSR_GE);
> +            if (val & CPSR_T) {
> +                newval |= XPSR_T;
> +            }
> +            /* If the I or F bits are set then this is a migration from
> +             * an old QEMU which still stored the M profile FAULTMASK
> +             * and PRIMASK in env->daif. For a new QEMU, the data is
> +             * transferred using the vmstate_m_faultmask_primask subsection.
> +             */

The second comment seems sort of redundant with the first now.


r~
