Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4149922wrs;
        Tue, 20 Aug 2019 08:59:54 -0700 (PDT)
X-Received: by 2002:a17:90a:aa90:: with SMTP id l16mr696919pjq.73.1566316794059;
        Tue, 20 Aug 2019 08:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566316794; cv=none;
        d=google.com; s=arc-20160816;
        b=z5q7ZumzNXqCIJM53FgF0vI9p3ZqbNl9ws7pgEOepe6Tv7f33GfDXGoLN0jE3YnWe4
         z/oRzJk7TwubFR7uJYM045Hmv+14B9vvK5GTIflKJPT7bgd3aF5YU+bJGaevdteKCLit
         EEn9Nq2RfVMDqr8X5WqE1AeZ4kyUQSHU7sOz2jPZJLGbCQLCRUa1Zpq46dapUgNDIF2c
         8M7Ix3LHzls0uwz5eIXQ/8UUqC1yD7Jb+s29fmzUl19ztqF2XjTSMMXgF9fWZkiQ3Esv
         d/cQkZnRPidgX223u5wwvDtH8hzVqrXjESVNfeRsjOWo1b2kNUEtAmG1w6ER8EogrBYS
         QxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=GjDE62/c3Wz3dk2WQ/hznAktymAzoNipjn6QtKQK/mk=;
        b=Efbx3BVaY/SX8mVQG99NrCxRtnwIAadJ49d1NjMpTBwJT3hp9zA7ztEaD82PuPDu17
         nCAu72Hlow0SoQlWMGF4+PNiNp68j/yo9j8rb7mRVZORPuAKZwq0fkrb3JV7YgmOwLwQ
         aKSKowGGtBXZ0IlcMOnw0XQdPkhd+RDHcT8hf+Iyg2MuTtq5Wh5Cc4wEzQ2QBGAUwnrz
         oOq0R775kUR9c6e7Mx924qQs+b/4C1i9iotJJgj9zQald+dQVqAgfJ72V9/jF7KekJ1p
         CpUwuYG3GMhfioBMdmfLCpszt1k0f4Gud16t1/erKvNY7HNQJ5GFfSn0kudkC8nnQUqI
         onuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ImxOm+/O";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j10sor589641pjs.10.2019.08.20.08.59.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Aug 2019 08:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ImxOm+/O";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GjDE62/c3Wz3dk2WQ/hznAktymAzoNipjn6QtKQK/mk=;
        b=ImxOm+/OznSmsWW+Wb9YGCQ99TBDDic8kSIdh6GbDgvZhzx/Fis33V0cadGpwYywxV
         mteseV+9/DqXxgnWqmgNKberIo4qbxgUHSGODOFGZjEXK4rZsnzQn2P+pI7+8LH20uyB
         tK8d1UxyxDg/FoLXFICb8AMxZMycmj4fEWR4oN+c/mjI3VGtpRJ2424DNfJMu0QjBph0
         elhaeehY+rtkGiJk8FIAibHDZlgo5+UfoizC/wGirXSxfgEU1J17AEWSq6VvnotNKZha
         A4ezBlZTT15mcjZlzhN+0Gn/F3CdofWbJpW6hUjyCfUJ7jU6MrQu8DFA9549mftYr9ME
         2UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GjDE62/c3Wz3dk2WQ/hznAktymAzoNipjn6QtKQK/mk=;
        b=PLic/AwNXcg7QhHKi7AA7GY/QAUTYBlp2IyVuryVk4n3iwIdzz1853ihnqrSpAEhjf
         FA52Zyu2U2o+BLwXVlQwkg+Xj7Fkc0alO2xhtC54lEW5x/NhTnalbE1zL4JJUp3fBQ3t
         b0YtSt7TYkzGrn47KzEu0L++/L6YyPWd7orc4Trd/JALX9JWEnp1qUWvnzNGkZ/ATCQJ
         KvDBuNkjHYtS9Dpy8GCdh6eNx7ScKpGJGhnWwJ82nPh2+05KgxNkbtHVIP8e6h9C5b3m
         TYFYsq/GAxKhS/7XirnRQoxLT+pRmxMl34MN7I0bbDf/TCj1XaVoUsFpGsefZn7fNDit
         uYvg==
X-Gm-Message-State: APjAAAVmgMKLIKmjz5/qyJN294+ik4cSSpOf+Uiso4BLHkXuA8oneS/j
	lWkcwpf2+zOdzy5UgA3QV7LlJLjSULSdpw==
X-Google-Smtp-Source: APXvYqzkJ+BnHRFqVHJtwG/wmCSQGCiQFuIDGJSqIfQiWEV2Gw39r28XG5GOF6ckWAdumkM578+Udg==
X-Received: by 2002:a17:90a:8591:: with SMTP id m17mr733884pjn.100.1566316793536;
        Tue, 20 Aug 2019 08:59:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v145sm22283043pfc.31.2019.08.20.08.59.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:59:52 -0700 (PDT)
Subject: Re: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Dave P Martin <Dave.Martin@arm.com>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
 <20190803210803.5701-5-richard.henderson@linaro.org>
 <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7c739082-c1d5-ad03-0020-9776cf08694a@linaro.org>
Date: Tue, 20 Aug 2019 08:59:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 1jGysGKbDTbk

On 8/20/19 8:39 AM, Peter Maydell wrote:
> On Sat, 3 Aug 2019 at 22:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These are all of the defines required to parse
>> GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
>> Other missing defines related to other GNU program headers
>> and notes are elided for now.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> What's the authoritative source for these definitions? I
> tried looking in glibc, binutils and the kernel without
> any luck.

Presumably the true "authoritative" source is an ARM document, but I don't have
that handy.

For binutils, the defines are in include/elf/common.h:

https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=include/elf/common.h;hb=HEAD

The upstream kernel is also lacking the defines, as they're part of the ARM
patch set that is still in flight.  The defines are still not present in glibc
as of today.


r~
