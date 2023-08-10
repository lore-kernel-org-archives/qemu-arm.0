Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp804533ejc;
        Thu, 10 Aug 2023 09:43:09 -0700 (PDT)
X-Received: by 2002:a17:902:8d83:b0:1bb:d045:ae8 with SMTP id v3-20020a1709028d8300b001bbd0450ae8mr2264508plo.7.1691685788883;
        Thu, 10 Aug 2023 09:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685788; cv=none;
        d=google.com; s=arc-20160816;
        b=wcw2VZEmM71l54nt6C+Zd9lDCV/Hy07gXKMxn2iebRaTazn/r9ZlyWvAeNAJr/dtgv
         Iuk7qFMIuV/JLzMcrmNCSvjN1POCdSReij1YYb1uhCfbb7X44xzSHh43RZDYbIGptkMl
         BQGlwkT5MwTMKZVcCtoWHTxsKVezw6THQp6OhmJ2qN9fH1pjwyNM+pHno7o2TuhhKNwv
         i2s6flYMxOxZYmwlZROEpXriLCKyO6eawzWHrdqDUV7O6InxJ6sYhO9QOajhksKKtw/E
         +8I+EbIYTmvktJntqWPK/Z0AUMOzlW+Z0br1jEuzYfN7J8af6UF3ghKC1kxF3mf16uAz
         8hTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ux9G2pCqSQqKT/O8E/3hs4nz5SeBo1jPeCjkfUXNBko=;
        fh=FNwz1qAdpmsCYdKO6ipOr9huvT/mCIfQ3rYSWdL8ZXs=;
        b=awwRAPKxi8TK16cOJx1IO6s65orqikZzrQjKx8S/v+X2DbhdlasGuEYW/Bp+x6hAHs
         rH3VnZN2pIl/9JkvXRz3+iSQUVVUOFMZsiYmTcQVuiQ4Fnogznjgj/TfMriFQr6Z3h4M
         NT7FOfD+eVYe9m9zkP6/Zp9NMqZtnYIGjBjHsDpXT9uwS/pC7RkhJoHXtPJxs0cfRyZK
         7XrX1r4c3i6KPswuxdFnTMNKQxmwopl4GLhj3vBcMuXDvMrxQPTNaNso0BW//fZdhRlm
         M5UTTS6+AswjpESTP3AEkFgj/T0O9tEzjvDmdMJrgdO8iL6IQg3tG7H8PcsCljkWpyYj
         /JGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrvPLxEK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d13-20020a170902f14d00b001bdb05cc74csor385568plb.19.2023.08.10.09.43.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 09:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrvPLxEK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691685788; x=1692290588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux9G2pCqSQqKT/O8E/3hs4nz5SeBo1jPeCjkfUXNBko=;
        b=JrvPLxEKX2qbeskbB4jeRl3DuYmm0vxQ+EkESDm6SBGx4JdlTXv704luVY7LRZtGX4
         8SI4p4KYWx04rpYw2eW3PT+9hGlMjysfRK8u04T1uUiDd3zxV3/J1A25Eq/kHO+IKoJh
         iavqB9tmBJ2XvBQgdYef8pnV48NTt5/COEGqMR5pAqFAl49uBabtTC/QGs0tMoAUlfLn
         UldAXmBY2XDC+Q6nuoSVL62+2HN80yjapsxSNA/ulXzRbzD3lamVi9Vliehxa+Jh7MPM
         CYq74qQ1KeMuibP7oVWjADxKffB/5IB/H2GG9f1Dn+79qFsONYxPrl2nYow69vZEdegy
         cjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685788; x=1692290588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux9G2pCqSQqKT/O8E/3hs4nz5SeBo1jPeCjkfUXNBko=;
        b=H3Wd6tbvh5LpiMT/vSbhffDdkPkDq8MArV4qyqgZafS1utawIhCCatJKB/wLiTDHLi
         BgyQBnasaK2BGJSr0c4K8g8gKKrolOWzuLUUk9y7Y62Pyd4i3fYza4wqWTnSsGls127p
         PmB3U1S+SGfP4jg47BoeBbXEvVKVU7fGbqqguTu1Liicny22PsaliMgt9Tylu90/Ozqx
         ALqMTlMRVX1LHLkuzh0arWqM1aASy0iImr6IaubxeLI+1T7qjJI16kigTpyFdkj1quwW
         uyBLanApVhb2upUQw/YUDVNV2pK7TmQL9ySIv5ifU5pdr1YMXIlZ5PbUgsORE5J1NPvN
         lHtQ==
X-Gm-Message-State: AOJu0YyXrRIY3qS/bbPO9ebJVDYENtSC2w5NCqrCWDknQJfnY27I+tB+
	DHEf3vK9KqbqX80FvydwpNiI60Kgu77Uuryta0zR/w==
X-Google-Smtp-Source: AGHT+IEqjKc5unTa6bKWScc+AC9ZO1lUJxwZavv0wI+govspMdZFqAvrkf/7flMM6BqgmCs3RjdBDA==
X-Received: by 2002:a17:902:d4c3:b0:1b7:e646:4cc4 with SMTP id o3-20020a170902d4c300b001b7e6464cc4mr2935303plg.28.1691685788180;
        Thu, 10 Aug 2023 09:43:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id ja11-20020a170902efcb00b001b66e3a77easm1996072plb.50.2023.08.10.09.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 09:43:07 -0700 (PDT)
Message-ID: <3fb6e5ac-5887-2947-b431-4a15394c347b@linaro.org>
Date: Thu, 10 Aug 2023 09:43:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] some testing and gdbstub fixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
 <87il9m3ld7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87il9m3ld7.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bw7fc/hG2JAA

On 8/10/23 09:35, Alex Bennée wrote:
> So 7 and 8? I would argue for 6 as well given that's a foot gun just
> waiting to happen.

Yes, the timing issues with 6 are nasty.


r~
