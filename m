Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1253929lfm;
        Fri, 17 Apr 2020 20:12:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJd8CL7TY4iQHpLSfEENDiGJ/Qipqsbl7VILxsA+6Ca6NVgqoN0pKOGBQ49niJB/ychpSYp
X-Received: by 2002:a05:6214:1853:: with SMTP id d19mr5636279qvy.150.1587179531625;
        Fri, 17 Apr 2020 20:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587179531; cv=none;
        d=google.com; s=arc-20160816;
        b=YzMfl9bEGmEsmuYjZjbPJesmLIIs4N1b6V5SzrmTHNOcqbWOpjIvjVpkrpJNFOcFhm
         l9MwLrdP3+nvmeYjlzyws27odk1t0WNJCuOeHnlgHUSuTesxmgLOS7xDMi/uek+2WahW
         JRSEbw0cMArvwvLJunxjQQScPsZumuik/hNaPe0CprlmEQQMq7IJzzdGUmpWofQFu45U
         Z0Y8DR9wqWIHoCcIQdMBfuZYxVJEetrJLLbc/ekYXc4hnIhUqFgL+9b5Mzjlks7bsDYj
         NgwzjgQome/MKEU6cAjduaJOZbmnKfqNrmL/mq47mlLK0IA1s1U/kMCJiV1y/8Y8wHFl
         UkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LhHyVCgPfmdkG7ZBw218O16oDYMzcqMLZ1VwY44L4RQ=;
        b=HMk2b1YR7pBhYYQyjGmfYDRDMlrOWD93xpe4QE986Gu4gXH90WqTUUd1AOmhB50DEy
         nDxehSQbZjYE2asmW368jvgpcPtw9hVvu22ezi/35h1tZyXtQwHuAs6uVCion2nNETN0
         p7xe9oSxhzhz5pYCzu+IbtEg3Hn7vvOd2V1NxaxRbbEp9WqDz9Ac+1nkgNxSmBiNwj9/
         PWy+JXC9eK93BXVZPAcQLWSlDqstuuwiTenkgjcZ+n+/i8/rDbmlQw2UtUDKmDa8VZA/
         FMWYxIwa2hCkLLyYg2JNbfvb7lcfvUhgWo45QFUfH6N1Ke3aBCtTxJ9GAW5n5NYMAaSy
         Fulg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EB5X+PeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q91si7409280qvq.149.2020.04.17.20.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 20:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EB5X+PeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPdtr-00027Y-2b
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 23:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPdtV-00026h-2H
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPdtR-0002qz-QJ
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:11:48 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43211)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPdtM-0002eF-Ce
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:11:41 -0400
Received: by mail-pf1-x444.google.com with SMTP id u9so1991050pfm.10
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LhHyVCgPfmdkG7ZBw218O16oDYMzcqMLZ1VwY44L4RQ=;
 b=EB5X+PeXzZjaIWd/EqIwHG6H+9UmOd/EV8unTpaxFD7M/Uo+fwvu2j6/sSedatkt5y
 RL7szB8fh4aoWViyZVxpYE8HCsyvJWSJniWXtIQsOAA80gljoZfl4D/+ogC7KHfCljKL
 46GnKLb9tSEXNGv8FXx1hVUvdez/as6IKn8csKA1x4b/5wm/kJx5bkkII3ZVLXwKWgqV
 FvYcXNUu1gliUtfuXTIDD09mw4p9YSBk7LWX/vbnuzsesnrqp9slRfB+4Iv3e7YrUwTe
 rUtSdqSjY8/Cf5NGzBCSvwL7HgXInikUqmsIGzLtbX8bmOa9N/QB4Ep/3gRUtlYlt5f0
 nnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LhHyVCgPfmdkG7ZBw218O16oDYMzcqMLZ1VwY44L4RQ=;
 b=R6y0CalfuYcEKi9JQa/MJCriZ3b8ZexiaubDV9nvFpfD3GwMhH2RcIYJEm/LwllAx/
 p1nsnc6smyD18pdnkp/RboUODaMCJFQ2k5bRbZ/kgecSo5rBLOJImr7oBmkLzpLrwoIi
 wiSO1apg8QXdOW+GR88P9fSjAUGy8ALoKS+1RxyGtsAYg8+VfiQeCYoxcpCB7pxSDVAx
 BVj/vTpz8UehBFohBJXqprKHjtCt9QTVAQ65mArzGed9IxFckyeeKSO9s1cekI2y6DYQ
 UlByhme6edXuCNGv3yB+N+c2PpcN9DJu9PTgDMmHHDxjsIfcLS5nWH9hLSkDH5qr/Enb
 NCvw==
X-Gm-Message-State: AGi0PuYEy527SI2g4Nt8SbXScrYgOfI/I5c6LNMSE1sYsuALAV2+pGeH
 rEYXCzJVex+u/Gv+nSJmP59tCv0t0pM=
X-Received: by 2002:a63:7d5d:: with SMTP id m29mr5937968pgn.65.1587179497777; 
 Fri, 17 Apr 2020 20:11:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id n17sm13135415pff.81.2020.04.17.20.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 20:11:37 -0700 (PDT)
Subject: Re: [PATCH 06/16] target/arm: Add sve infrastructure for page lookup
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-7-richard.henderson@linaro.org>
 <CAFEAcA8F2Qmdh=9RXFhN9_WPjhjhai9iO2Cn0dL5UAGV_r4AGw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f954cef-763a-592d-28d8-750959f3a43e@linaro.org>
Date: Fri, 17 Apr 2020 20:11:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8F2Qmdh=9RXFhN9_WPjhjhai9iO2Cn0dL5UAGV_r4AGw@mail.gmail.com>
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
X-TUID: 4ss7ObNbCbTI

On 4/16/20 6:03 AM, Peter Maydell wrote:
>> +#ifdef CONFIG_USER_ONLY
>> +    memset(&info->attrs, 0, sizeof(info->attrs));
> 
> Could just write "info->attrs = {};" ?

Not quite.  Correct syntax would be attrs = (MemTxAttrs){ }.
I don't see that as an improvement over memset though.

>> +    int16_t mem_off_first[2];
>> +    int16_t reg_off_first[2];
>> +    int16_t reg_off_last[2];
> 
> It would be helpful to document what these actually are,
> and in particular what the behaviour is if the whole thing
> fits in a single page. (Judging by the code, the elements
> at index 1 for the 2nd page are set to -1 ?)

Yes, that's right.  I've added some more detail here.

>> +    intptr_t reg_off_first = -1, reg_off_last = -1, reg_off_split;
>> +    intptr_t mem_off_last, mem_off_split;
>> +    intptr_t page_split, elt_split;
>> +    intptr_t i;
> 
> intptr_t seems like a funny type to be using here, since these
> aren't actually related to pointers as far as I can tell.

They're used as array indexes.  If we use "int", the compiler keeps
re-extending the value.

>> +    memset(info, -1, offsetof(SVEContLdSt, page));
> 
> I guess this isn't conceptually much different from zeroing
> out integer struct fields, but it feels a bit less safe somehow.

It seems easier than setting 9 fields separately...

>> +    page_split = -(addr | TARGET_PAGE_MASK);
> 
> What is the negation for ?

Computation of remaining bytes in the page:

    -(x | TARGET_PAGE_MASK)
  = -(x | -TARGET_PAGE_SIZE)
  = TARGET_PAGE_SIZE - (x & -TARGET_PAGE_SIZE)

We use this all over qemu.


r~
