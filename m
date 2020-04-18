Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1215198lfm;
        Fri, 17 Apr 2020 19:15:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJZr3TrQPGntBt7MUQzLY1YSLW1QjC0R5NNqzKUMgiRsynf96/4d+NSQ6D8KDOqwQDG5amG
X-Received: by 2002:a37:a348:: with SMTP id m69mr383002qke.31.1587176129173;
        Fri, 17 Apr 2020 19:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587176129; cv=none;
        d=google.com; s=arc-20160816;
        b=qH33PO/KB9GvUb4Z4IbWHQVRroiRw7A9h54wblyKf3tW6HGyZJ2fyhjWoyMDPAElyw
         UceyVkSxgl6DB2Gg0CkYKX57dOPZBcWtHsghesz+s5zndhxDY5uSRdjvruYTLx9p+kz5
         l+bwtpwKIEmw1Rgf4qIQMYXDE2oi5yLGu6BfsAqpFz4NgfWtI9TwdjuX2cP/zPPiOX+X
         +qKx+pGoda20eqCqDmP9xOa1iNzQcvfmDs9l0vfvrMhB9e/+nzQZ0z8JtzdKvgxLOOFh
         fZyYNHv7raSUEPdD2wXIXsQNXu54VXk5QZHYq2M8XOCPtDBaxzrm7n6xNkP4xMIhKVHJ
         sK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VLmJVVq29tBgzf1IpTYg4RT+apdN1fHpXJQ10TTYBpw=;
        b=hTUgm5oJ34xq6035KBigSKcJZ4/C527YWXVfAXBLjTE0ZjMTNDn/gOmMIsOyiO4RsG
         r+Yd8K9kSW6zRfnmTDxXyOL72ub6ZkKs7YhxMSH7lNbNJ5PcgfwQNVULXFJUXhVKyhfG
         d1WYi/zMwcUTLwrLN/fncUqDDfm7XtjlncEdgRRREmRnY0wGVuY36NXwqlC+uQREIguM
         i8o/aZ+bsPWK065okcBUsNhd+sKukigf106cluV9vie66I9ddzEI38tLYuYQU93W7OEY
         Q/bFdnSshDzz1crwhTAGx3wUVCGXz/iXkGVT92E5QUxcO5kk1NlwDb+EgGMwGvo/gB29
         AjQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qVfohEoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si13967551qtp.195.2020.04.17.19.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 19:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qVfohEoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPd0v-0003zu-HO
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 22:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPd0S-0003yr-7G
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPd0O-0006Qg-Bb
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:14:53 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPd0N-00066h-RJ
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:14:52 -0400
Received: by mail-pf1-x444.google.com with SMTP id x3so1946599pfp.7
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 19:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VLmJVVq29tBgzf1IpTYg4RT+apdN1fHpXJQ10TTYBpw=;
 b=qVfohEoNUyqt8veriBpI+x2Q9Rvtn87OYA8J/gCGHntjRe/pUpqUZ/4aU1IapDBAGJ
 llBDHCslo8MgSO7yoBtufqOWu0j2ax3nSHz7EVurDuobjKBYpYWnrtFS/B0vRcyd4a1g
 r7id2sM+2twDWZzO/Io7azjw3OFgDLCy5quJqwoUhWNR3rBIyV1Wr/bbB5n3s5Q28K3S
 vAqk+T/qCqdD6+13C2PDtsFomDPYqhcqWhuxPrfcBdMhNV5lhqICeKvEzAesKULDN1w9
 xtiFvms3WZ7phZdYXQjVJ1kBOY1tbO+yz7Ejj/VBx0lpFqevgpGtBHy/+ieYRP1W+MtI
 ceHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VLmJVVq29tBgzf1IpTYg4RT+apdN1fHpXJQ10TTYBpw=;
 b=rVIVn3sWQ8+gaWp10AQeDsrvKFCSnUeCWfH+4dBdXb0cX/fGomJKAIPYWBNkEyNz1R
 /SdkpKjwzCtsFEoXNRwjp+3pkv9HQzN2FT/CUqsTM/TbU8NgLEf1ect1APlzXwjJ0JMs
 ne1aMduXZoL/8iRwvxWGNqjFNLldCOrd669hunUmEcPkWr0KesHkz/wK/zQdcz5F+aJN
 Ga/QJta6YLpgUaMVoH5XIAa79m+JToyQ4xxg8qMTjSZDG41yr/rsHvUjUYvmHcZK7cAP
 Au1MY+75nxxonGmJCvwtjFaYiBVBk7J7vrXBBK3psoVSXgzyRe6+LVVIirLz9ccskQoM
 WaUw==
X-Gm-Message-State: AGi0PuYYLcLRmQCGIEj1rsp0ZX7/kn8lhC4t/rIftnTwYP3T+DUkHsM5
 vJopLhsuvNLFAAxbH4siVBeZat4IqJA=
X-Received: by 2002:a63:de41:: with SMTP id y1mr5846590pgi.176.1587176087154; 
 Fri, 17 Apr 2020 19:14:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w13sm5791059pfn.192.2020.04.17.19.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 19:14:46 -0700 (PDT)
Subject: Re: [PATCH 03/16] exec: Add cpu_probe_watchpoint
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-4-richard.henderson@linaro.org>
 <CAFEAcA97saZB=8qbHxfJiNWXN4F916-ZqjaLt=-fzUzKcNmUFg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5581beac-5912-f5a2-fe6d-4b23f1c35133@linaro.org>
Date: Fri, 17 Apr 2020 19:14:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97saZB=8qbHxfJiNWXN4F916-ZqjaLt=-fzUzKcNmUFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22onCWCttqyU

On 4/16/20 5:08 AM, Peter Maydell wrote:
>>  void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>>                            MemTxAttrs attrs, int flags, uintptr_t ra);
>> +bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len, int flags);
> 
> Could we have a doc comment for the new function?
> 
>>  int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);

Hah.  In the process of doing that, I notice that
cpu_watchpoint_address_matches actually does what I want.

I have added documentation for cpu_check_watchpoint and
cpu_watchpoint_address_matches and have dropped this new function.

> Clearly the insn emulation needs to do the right thing for
> guest architectural watchpoints, but should a gdb watchpoint
> also affect no-fault-load behaviour? I suppose making them
> both behave the same way is probably the least-surprising choice.

In both cases we need to interrupt the execution in order to actually honor the
watchpoint.  So yes, treating them the same seems the only reasonable way.


r~
