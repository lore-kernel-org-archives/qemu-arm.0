Received: by 10.25.221.202 with SMTP id w71csp1813225lfi;
        Fri, 4 Aug 2017 02:53:54 -0700 (PDT)
X-Received: by 10.55.26.14 with SMTP id a14mr2315469qka.4.1501840434096;
        Fri, 04 Aug 2017 02:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501840434; cv=none;
        d=google.com; s=arc-20160816;
        b=BmFO06xnEdCn+BB2BZTVwtPK3ndeoALf87BJ4A/wBTsXcOhJwn/bCMyJS14Y/fBF8B
         SZNPlKuti9a3sAg4e/rycZu1vhqyASxyCaFgJmLmbdzpCm8IvjutVm1AZtPdbM/bYfvv
         amHglmvpTkh29mKlhUN2Iw4PKQY1aVbIIF8RNWSOf80r/eYwY+vGHGQQyS5ifDsSdYZk
         Q7zl40QyUoBAMOh9C6X2kqqdLDPckgpjbTwq3tqxW85i32k6Q6wuwznn7X4PgDX7S+wb
         ypqi0Zj7NbqG5EoEfBqxHyM/aay5GfMslIbyO/qwJggkF6wZ82pKdZwgbqkUIjHvKY6I
         YMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3Kj1LLb0YQb03/w+zMdJmXB1I6ZYr2cM2kNuDiJGtBw=;
        b=0I+Ju/a8aLIVVmU8fWTbCm8BMAcMrIJ5G7CkzlvPWEU56jkpJe46DryjKaihTYkqyx
         lPTCiUMm61eIqxitNzWjLUTqbvpflV4uWbvmPmDAS6ZEMoSyGmzHoEjGj6wcISYbAfxb
         P1135lXPqhD9lse/AKypSf4iBE0OB0z+cTj7BA0yy2WKipKaJFsATengqaJQr1Nce9x7
         0c+DrEqggjEYiUQ0rze7iVUoRl+L/25twHYOMie4J5JZGU/E94fLFZmcEbnIhCeI+i+G
         23obS9UpVmqI7GK0vefTDsheo5rh4YqIqJhrYTnFov2T1vxGMNm6PU/A6wcYeuqw5RDz
         xK1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=T2JKQj4g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si1206229qtc.459.2017.08.04.02.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 02:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=T2JKQj4g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddZIl-0000yx-8n
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 05:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddZGl-00089m-GN
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 05:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddZGk-0005bs-Fv
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 05:51:47 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ddZGk-0005bC-6r
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 05:51:46 -0400
Received: by mail-wm0-x235.google.com with SMTP id m85so15385670wma.0
	for <qemu-devel@nongnu.org>; Fri, 04 Aug 2017 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Kj1LLb0YQb03/w+zMdJmXB1I6ZYr2cM2kNuDiJGtBw=;
	b=T2JKQj4gRCnj5BFMFu2BYhzyybd5N/CE+L6X49i7OvaMSVM11tq/asDc5cFiq9yDR/
	DxFhZ7UO1ZruLHQ+DJbsKHOwYTffZ23jx/4PzFGHSfVrLV8yGslvK97mIHFMV80UXkHr
	f0zCYmThCsZdgR3Hxh8fL5MqopRFlzDCzjvEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Kj1LLb0YQb03/w+zMdJmXB1I6ZYr2cM2kNuDiJGtBw=;
	b=muo5FFmFvIalNinayYllmciHKhT+5kDO6wWRsWYIH6OsuH4Sum4RjIzNeTt2c42E9w
	qRV4UvLUBMmr0S0Wi46Htt11obCHlWeVB+jcSzC6Cs811+2vn1Jcq+HhfUZhi2pOTKGA
	Tg7+LtPLiJe6BdN1uFHpONeTribwAZca6c8tK80MtXm85gzbg02Pm/bani2Yi58L3UjY
	Mn+P2P36WV5zx/F7tGbcpX2JG2MfG47LgO7bUAzquFmgkipZC1LzydONSmVs5FwV4vtd
	ZdkzRGLYfwN+sY017lbHpMzYRaqW87Of6C75qFbj97TcdWSC4yyaqygqeHpqzgFr6giu
	R5+g==
X-Gm-Message-State: AHYfb5jc6lMYEPaW5KZ6pnfBI3isI1ts6kcnIbZDIGNTpDBLG2K8zXBO
	JJQ79kpq8kMutmEns4qm1ej5aCuBWNHe
X-Received: by 10.28.105.28 with SMTP id e28mr894891wmc.42.1501840304998; Fri,
	04 Aug 2017 02:51:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 4 Aug 2017 02:51:24 -0700 (PDT)
In-Reply-To: <91f1649d-ffcf-85c5-b83b-644ad1875fcd@twiddle.net>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-11-git-send-email-peter.maydell@linaro.org>
	<91f1649d-ffcf-85c5-b83b-644ad1875fcd@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2017 10:51:24 +0100
Message-ID: <CAFEAcA9PsNQHxm-wVwCEFJq_NuenkQhLp5SiwSQu02eJ=S9EWQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH 10/15] target/arm: Don't use
 cpsr_write/cpsr_read to transfer M profile XPSR
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xtd+h7Fw4q5+

On 3 August 2017 at 23:13, Richard Henderson <rth@twiddle.net> wrote:
> On 08/02/2017 09:43 AM, Peter Maydell wrote:
>> +        if (val & XPSR_EXCP) {
>> +            /* This is a CPSR format value from an older QEMU. (We can tell
>> +             * because values transferred in XPSR format always have zero
>> +             * for the EXCP field, and CPSR format will always have bit 4
>> +             * set in CPSR_M.) Rearrange it into XPSR format. The significant
>> +             * differences are that the T bit is not in the same place, the
>> +             * primask/faultmask info may be in the CPSR I and F bits, and
>> +             * we do not want the mode bits.
>> +             */
>> +            uint32_t newval = val;
>> +
>> +            newval &= (CPSR_NZCV | CPSR_Q | CPSR_IT | CPSR_GE);
>> +            if (val & CPSR_T) {
>> +                newval |= XPSR_T;
>> +            }
>> +            /* If the I or F bits are set then this is a migration from
>> +             * an old QEMU which still stored the M profile FAULTMASK
>> +             * and PRIMASK in env->daif. For a new QEMU, the data is
>> +             * transferred using the vmstate_m_faultmask_primask subsection.
>> +             */
>
> The second comment seems sort of redundant with the first now.

I felt that the migration-compat stuff was sufficiently subtle
that it was worth retaining the second detailed comment as well
as the brief summary in the new first comment.

thanks
-- PMM
