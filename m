Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2091957wrq;
        Sat, 30 Jun 2018 13:26:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdbmYRdVcnfOyDCUZH0fCoTh00gM2uc0yWVZAzn3WcSAdaP1I+EHbKFmdUGl7HSDJCg79XT
X-Received: by 2002:a0c:f250:: with SMTP id z16-v6mr11558483qvl.204.1530390397631;
        Sat, 30 Jun 2018 13:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530390397; cv=none;
        d=google.com; s=arc-20160816;
        b=pXKrrUook5M2avHwNmz8R0ibda3oSUCcb+VvhYjwwGieCp8hruOW0aE/m7OxwiBWc4
         txR9MSSZWtrNvKRRLtJVLOBFQ9B6QLfPDsoHYbKTUE0KdorEBL29swS5jdc3J4UWNaKN
         M0lpv39XgZpoRidlDy67+rDnGblq0h4JVpn/YZlC0zNU9UBY0GzC62TyzWcw/LQQq6ih
         6iVfQakO8JCTSdfUUV1edB+v8FSe9kpnqvJrt18VlQCRNWB9uT7KllevzPT2AUWG+5ax
         c3C4QqPx80dL0rMyP94jT41+wRXSUdZYIHZwWvc3RatoFqmCudj0+bXO98kInKyybtsm
         jGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KRw6+UmFGt88tBKemvQj61v4LMXL2TdKgLABAQB7+c8=;
        b=BzbO4XJVC+9PjWZnJbGBLNene2TIc/iYkP2WPTPP0lGsZAyN4w1TMA5s1+QlemCfkT
         7CtMMJXujK1EqJvEMWi36baEIV41A/TRS1LlZVgem0M8f0ImkcomH4h38pfVeZ35Wpho
         DK3nsePmWnAORWPRiLPqbnYHXSeSzsVfvIwkW5IcffArVSXymh4C4gOIa/EzL9yxmERl
         ttApayA/TLCGJx1TKNSKzV9Oq4bedyT8TtIS0QSsPd4E64pcw9pCjVepWonyYcgo5lBH
         qU6OK05xiJRSHtj08DqsYbY0GNcfXUqbiBJCPC3XPhVL/wxZbfAJmcansIIoFyAxiU/G
         BCFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GmLVFJI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i42-v6si12219403qvh.71.2018.06.30.13.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 13:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GmLVFJI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZMS5-0006zO-4p
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 16:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZMRr-0006z5-I8
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZMRq-00050v-GV
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:26:23 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:38778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fZMRq-0004zt-AZ; Sat, 30 Jun 2018 16:26:22 -0400
Received: by mail-yb0-x241.google.com with SMTP id i9-v6so184880ybo.5;
	Sat, 30 Jun 2018 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KRw6+UmFGt88tBKemvQj61v4LMXL2TdKgLABAQB7+c8=;
	b=GmLVFJI04lLl+v6vztNShD87fuSYYg34Jpjnut240yT9HW1IKLxAvq8A4iWERNgNiI
	+GvuAaHdKfIA/wLjr0VSHUXuL2xAAADbe+/ijYUVP+KTV8+FZ8I4SXg5SwTCgh2YikJx
	FbCE0ohFB2ZF5SDnicZ18/ko3oTqLA8OExsLf9Q5wvdeX1cVMGsr4kD7V895b8NRT9TR
	FQSijWpvqpEmsnfmMWdLw5qxuyJKxPqaKyfBx+jrdhzFOso1YvtIRCmWhpafAKfTqTKS
	ayfwLyeY7jJ+Ha7v7nUfsLfr3+Bx0a9vufDnX7uk8yvS8xGKygXaXTm9SuPLM6Eg+wP7
	nDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KRw6+UmFGt88tBKemvQj61v4LMXL2TdKgLABAQB7+c8=;
	b=CLBrTcluiuWJV+yLhuDf4cqH1W2tMlvrN5BhpSOm8pa/LbRXRcGRsG6D0CtkiQPnOd
	et5kpaYn0q99SrlwBJ3J4YeZgKpUldOumYd/UBcJL4di6KekXiwE4ln3i3mRJLwLiPpi
	lO9M0iKuJzexvHuelrVSkHHCg/1w1tuklkqK+JdGMwn/fddJXtY7dIcrs5OBdSELoVHR
	/NqWYRCU/Xum9U8Jz8L9OOktbnaQnRf4+Uu4HbhPGy1pHRVzZ8c1icCb5O+MOQ3dbi6w
	y7LQCdv5RNjxDWKKyzu3FO5shGO4yHgHmt9cqr8ng7Foz5sEyxEgQbRD9uEETuXyBUnc
	HWTA==
X-Gm-Message-State: APt69E3RF9gK5+pLzwxUK6wgQ6v7J8iJEKdB6BfZRMqWDTJSQ8fgnlKg
	aZNcCreytLD8V78fqeffmJKKp897eAnuGCFNx6E=
X-Received: by 2002:a25:fc5:: with SMTP id
	188-v6mr10027272ybp.239.1530390381406; 
	Sat, 30 Jun 2018 13:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:620b:0:0:0:0:0 with HTTP; Sat, 30 Jun 2018 13:26:20
	-0700 (PDT)
In-Reply-To: <CAFEAcA8u=R_wCbnuiAbzHCm_6r+Q7zMij-tCEDkNnLcaoi9jBw@mail.gmail.com>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
	<CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
	<CAFEAcA-dNr76uh_x98Uz_7h3xWxgd2Q_WdB5OSZVo6K9kruB=w@mail.gmail.com>
	<CAFEAcA8u=R_wCbnuiAbzHCm_6r+Q7zMij-tCEDkNnLcaoi9jBw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 30 Jun 2018 13:26:20 -0700
Message-ID: <CAMo8BfL6Shx8Lu9ejSt5zzLkfc2kipBzkS_56PCAF7WFeDm2zQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Patch Tracking <patches@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jgJHclZ0QECq

On Sat, Jun 30, 2018 at 1:10 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 June 2018 at 21:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 30 June 2018 at 20:42, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> On Sat, Jun 30, 2018 at 12:20 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>> I'm observing the following failure with xtensa tests:
>>>>
>>>> (qemu) qemu: fatal: Unable to handle guest executing from RAM within a
>>>> small MPU region at 0xd0000804
>>>>
>>>> Bisection points to this patch. Any idea what happened?
>>>
>>> Ok, I think I've found the issue: the following check in the
>>> get_page_addr_code does not work correctly when -1 is in the
>>> addr_code in the QEMU TLB:
>>>
>>> if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK))
>>
>> Yes, Laurent ran into that and I sent a fix out on Friday:
>> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=52914
>
> ...oh, no, wait, you've hit the other bug I sent a fix for:
> http://patchwork.ozlabs.org/patch/937029/

Thanks, that last one fixes it for me.

-- 
Thanks.
-- Max
