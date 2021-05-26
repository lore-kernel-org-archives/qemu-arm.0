Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5646429lfm;
        Wed, 26 May 2021 10:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4FU/xmT5oPCTU8wD/Bln6wZ/iL2pI4DNqYTSqhayKkitFddeC5ee0eYN1j+7L9Frj3Ut5
X-Received: by 2002:a67:d902:: with SMTP id t2mr32888020vsj.14.1622050967688;
        Wed, 26 May 2021 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622050967; cv=none;
        d=google.com; s=arc-20160816;
        b=nHfhG2xmLUbxJ9SBRBKKLl3JYyW9CLnX+CLMCIXMoIDol9H1vlge9OSYF+LxOk5Ci0
         PyGfxCShs0rVeFvf40ZgmTCXInrBLr6WvKMJcF4QRLwpQCuu0OQk45NBl3JGXbG1KT8e
         LLCAIocX9666KR7OE7m1QicerFfhqjF1nCGJaT/b15elvd2PoItdZHGvD9DS//dAk1Sf
         ZKni31w+F4oWgu5V8YEY5m6ys2+M/Yt7/Ysd2JnpW1X4OMTRxJKswudBhcckMdVgwhfX
         ooQ5fMdbNUgw+4hrXJkjRDsIC9BFKQgZkz+4cv//z0cJ7f8ylTQEcwPt7tO3ymFs0eRZ
         kPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=g3072IN61z790QfiUDjHfQRP06QDH4SQGstDAQSUv/s=;
        b=SUG5X4iieaWZrJkxlVQnU6TRy5udXFr81D3bKxrMqos7cei2F1ogapFiWB0WudO2G0
         0j3bYqqIz15m6cCwBeqvFQYHJ+EmJ0v/z78eAjZuN8poxLsUg26elLWfrzl8jxpfepbO
         djTGHJFMlu/ktBRVRvqXhAZDkizAZnhdUmbkEXpOEzNeyIQV+GmtaUZu8f9YGE61h78L
         d3zemmwahpCVPKAcQ3vWVS1bNeHYA79Q/IzogO/fQiPpVzRF4z+Xc2UD3x4TNsPsgVO1
         bo+muIXB+aFYvg6OVUb+7kamRYCmIJO/gt3cr75KHe6I+p3hoYb5yFXlzFRVcOoSzzCx
         wXbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HeQpsUaL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si1121126vsf.136.2021.05.26.10.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 10:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HeQpsUaL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llxYN-0007Jg-1I
	for alex.bennee@linaro.org; Wed, 26 May 2021 13:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llxEo-0002Y4-Cx; Wed, 26 May 2021 13:22:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llxEg-0004Ne-7d; Wed, 26 May 2021 13:22:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so954893wmh.4; 
 Wed, 26 May 2021 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g3072IN61z790QfiUDjHfQRP06QDH4SQGstDAQSUv/s=;
 b=HeQpsUaLJGlIUyg0eDufZJQXf67Y2rfsF/rVmu9Da9mAgzS0JcYXyacvJTKjP25hji
 Rd5UILbP+vmysmJ6q/VlNBF0r7P/ZAx8IFP+3TC8gPJS8GqcxHTxGO5W7uMpwn0JKTZQ
 1kNIYxE+yac2bsN7kh/3bLSj7sESniyQtWMmwzASvF5R4t6eQ/ZfXtbCaaN7T8o6k3kR
 RCImbwOYp7/6tbM2Nz1F/qlXsLNxf3FntoLjy14x4tZQPawcq9kxSkHXP6qukewD1/du
 mMI3hI6dZtLgfLgq4IfdkzBMNq6KlNfooUEKYIJzVaKQWJBLftDHP7g/hjCJ/NvRQYVU
 kW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g3072IN61z790QfiUDjHfQRP06QDH4SQGstDAQSUv/s=;
 b=sTpUEgesYTIyKOpw1+dLXQr3wf+WgyCb4BzqzJlgaykHfUr2tFWYi4AB6Q7K/dB0QS
 evwabSm+7xWQuZUyYk2sXGAkxt5zxNvfjUUp2yVkozrR/vE70y5dIltTqYbsB4WHuf2X
 SbbXL0uqNtfTUNmMaQSSSq7thKc0ow4HryO4bfPjIEacbaKBxNhmP7mNEAfIHOe+1ZQZ
 jqJ4gOyuYVUB3MVGSXpzXzA9riIpJ0lIO+6aJq4ChdtkHNdl8bVAFq6KSPagAqW1mluz
 HYxjA4BHN4gf8U0xpTtAUHrRl6vUjCtqCyNrF70jjF+gzXBSnW3nsxmqlhT71jDed3+N
 YIeA==
X-Gm-Message-State: AOAM5330ew4Pd+c0orJcXDd4GUEgE6GN0KP/ijET3QPEPuW94Jfb2sry
 RKaRtKECphr7XQQPXNKdDoY=
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr4462503wmi.162.1622049743313; 
 Wed, 26 May 2021 10:22:23 -0700 (PDT)
Received: from [192.168.1.36] (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id x11sm20639512wrl.13.2021.05.26.10.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:22:22 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
 <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5a1389f6-ced6-3b09-ba9b-749e2db2de4b@amsat.org>
Date: Wed, 26 May 2021 19:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gByGURu0oe4D

On 5/26/21 4:12 AM, Richard Henderson wrote:
> On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
>> In commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops")
>> we restricted the do_transaction_failed() handler to the sysemu part
>> of TCGCPUOps, but forgot to restrict the target specific declarations.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/arm/internals.h |  2 ++
>>   target/m68k/cpu.h      |  2 ++
>>   target/riscv/cpu.h     | 10 +++++-----
>>   target/xtensa/cpu.h    |  8 ++++----
>>   4 files changed, 13 insertions(+), 9 deletions(-)
> 
> What do the extra ifdefs buy us? Surely the fact that the symbol is not
> present in the user-only, and would produce link errors if used, is
> sufficient?

Last month on another series you told me we should declare prototypes
that can't be used :) However I agree we want *less* #ifdef'ry, not
more.

The ARM declarations is fixed in Claudio's accel rework.

For the m68k/riscv/xtensa targets I'll see if I can move it elsewhere
in the same file (if there is already such #ifdef'ry), it is worthwhile
to move the declaration in another (sysemu) header, or simply do
nothing.

Thanks,

Phil.
