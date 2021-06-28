Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4207600lfg;
        Mon, 28 Jun 2021 10:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+0RmhtwvjFWaUD04JxjngwcK9EKxs9VS5JfNeoisjFtm7LufEFRBpOwvZ4YseVYoC5aCN
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr28545134edd.124.1624902400631;
        Mon, 28 Jun 2021 10:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624902400; cv=none;
        d=google.com; s=arc-20160816;
        b=xu3LXJRlDWZis/8Z0WJ+v0pcR/YF/Ra0BGv/yg+tL8YCpdWuz1X0DVhLa27Y6Y2v8h
         FU63smIYAECJK8tUzxr4vT+M9cXj0f3rLXVkMQMzJHek1HUb1EHaLmurKV87mqeTBaLe
         vU9UMcKeYAX+1zKdiDM5cCo8RxFE+WzWx7CscfvdPW0+0bcek1eJvRtJs6NTt6ph8VhU
         KSJ7EyBylziMD9KQt9hsQ8npOVdTJlpBlT5BOnW5tE2/8RXzWR+jloD8EjM64H6ajPw0
         i2yoh0wWF8XzVMmo8k9sOZ5529o3vFCZ5m6CpEjuYXxLsyp3a/D3MCpOq/yNogtkeBFZ
         0SIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=fzB0T9drrXSZStojhnGkj/A07BYS2dTMADmi3yZe/IY=;
        b=Qq7EtuybaTMGe4fIlURozAIYS9mS7SqcDt9EiTNPHsSww+S/h+knkU5cdHsC13sOui
         qmGyOC1l9f38A8Wrweg3E423h+C5I1YlMnnikZGSYWoje9FZDj8fZVxgcyVAXpdxnH4G
         tEXrPVDLKnE7LmPy9cy6WTJnzgeEFTAOwurfW8BGmN8VmvXAYx+puqbxrXsxHVsnAurX
         mkClBP90AMJrmaBZ+RpAzDXFX+qnBQ2LwPGI6FqJufNoGLobCcIAb8nDhuTUiMfGoXLa
         S3yIm7OfBjN4o4MFgvay81D8Kz0IBdee7XVl6DHVh4+mx3pJAzD/PZNWrJf8WMY+WpMz
         CAIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phZrsWvH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si14114760edw.54.2021.06.28.10.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 10:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phZrsWvH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxvLB-00034V-LG
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 13:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvKC-0002Me-2m
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:45:36 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvKA-0005th-AS
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:45:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c15so9343587pls.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fzB0T9drrXSZStojhnGkj/A07BYS2dTMADmi3yZe/IY=;
 b=phZrsWvHmwxOOFvo/LLxSFZjW/5YhHAFVjGSyhkOpcxulzYZSkEekkrG2LCz/vEqSz
 38iWEcwQcipN9xVdmuSrKN6SJq1pnnXViOvHM2nEEE0CkXhVWg7j6xPeUMVYPGRrRE4T
 6wjUTUHnTIPt2sqPdrYizEd+qCoJimuHUarHg1DnYlNr4+IxUiEgweejZQCxnYZJ+RNk
 /9RvBRRQFWhAXX94TReRhpTe7e23HBhVmBY/7SGw+J7dgf0DcbxHXnVa8xVygVJlfsG/
 bkvhtPJK6SN9aQXvxUyiEXVBwpEP/Md4IQXjiF2/QS1MPq4azjSpjtG80LyaGHTguHtd
 TZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzB0T9drrXSZStojhnGkj/A07BYS2dTMADmi3yZe/IY=;
 b=s/81RzwbbTZkQFs5z8fniGwGqph3tyMBs3qWyMAuNyxLQCQRP1azdKCiXnqzt78Jd1
 gMpT/iOv49kW57RDlp03jPPQ4PIiWrN5IuWWn22txlD5wCQEDc57zIRsrEXQ/mRF0jjY
 EgLTqS8M2D0DtKy3k0deskQ34u3WCxaSZQZXpUmvu3lNDrLnHjFMT/6bhdCsd3KdRhPm
 ZsTH1no0gH1ojDbsUhsKbTCEiTUOsOGJYt4t5UWJF4Q+DHqL8/kYS2nTSSAZsQpNBv74
 NpSihsTNqdL2Wd+rdGtW7gWjNKdotvXqMGmmVXHLgsL1wWuzPwGZjaANw4wJ0JlW65Q7
 iREQ==
X-Gm-Message-State: AOAM532wYQFVJ32AhHItOH9HAxv0MoQBXSAqgtEefpE5pXV8GBDPLChE
 1uYS0og14+5n8CgvqBUlYP3v5lsE0xelDA==
X-Received: by 2002:a17:90a:5305:: with SMTP id
 x5mr15961431pjh.135.1624902332704; 
 Mon, 28 Jun 2021 10:45:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k19sm15681982pji.32.2021.06.28.10.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:45:32 -0700 (PDT)
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
 <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
Message-ID: <42d6f71c-6d91-1ae2-bc13-39cb5a70b1cc@linaro.org>
Date: Mon, 28 Jun 2021 10:45:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPDIDwU0tH+K

On 6/28/21 9:54 AM, Richard Henderson wrote:
> On 6/28/21 6:58 AM, Peter Maydell wrote:
>>   {
>> +  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
>> +  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
>> +  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
>> +  # they explicitly call unallocated_encoding() for cases that must UNDEF
>> +  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
>> +  # the rest fall through (where ORR_rrri and MOV_rxri will end up
>> +  # handling them as r13 and r15 accesses with the same semantics as A32).
>> +  LSLL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
>> +  LSRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
>> +  ASRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
>> +
>> +  UQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
>> +  URSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
>> +  SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
>> +  SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
>> +
> 
> Could perhaps usefully be nested under [ ].

Actually, it looks like there could be a couple of groups that sort [0:3] into 1111 and 
1101 with { }, then further into a couple of groups with [ ].

Anyway, none of that is required for function.

r~
