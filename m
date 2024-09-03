Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1445490njf;
        Tue, 3 Sep 2024 06:53:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3rcnRqWWIHZuyPV6SeuQdLiE3UB3I26W+JKZxnSdcGI6k6nKJxfKKWlOwudSLmSbUlYQEVzELN6wqYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFvRhtMK641Jp7d2yEEFSwhu04MLKkZajeJkFNo/Png89hLdJ0Zr5ZEKhr7iud+2YWqDUHx
X-Received: by 2002:a05:622a:1f0b:b0:447:eb43:5d0c with SMTP id d75a77b69052e-4570be3620emr145645281cf.59.1725371629089;
        Tue, 03 Sep 2024 06:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725371629; cv=none;
        d=google.com; s=arc-20160816;
        b=GDQ+sbzt2wOQI6DA4MIyglR9U4uuil2NiMYRZPVQgEiWd4Z25p+tWn4m7emnVRgLmD
         fKKOxklTwbig2vUQcYCL6FyGz/q0azLGj7/eaitbYwmdNXb9IahqCOStHLLf3CNAJt4H
         zqqB1qleQ5xtkny8M1IE8Uw9mDpex0dWe+ksyW9mNG67ZUcfaskJzfGqDTx+3PVnr/l8
         iaJKrKjKmlXdSrh+eL1m/88DVAXmFg33UmIaYqg+jGyKMfedlH+U9PEzOIZQBvXF/3G7
         kqGbbIkEOEXMbuKnnJZCCE2UDH3/8ATAy2nr9ryUkSwaYeoYgF1Qmsj9NUoZPKW99+UE
         wOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5+6UOoqDtdqPF+il6F/TYHpc4wmTMnw5HKm4F9lxz9Q=;
        fh=HwpDYETxA7omGOTeJjoZVXtj9BnO6P6Z+DeobiRuCHk=;
        b=bxv4SU4fLZCYth5ZA1W52pqXWtL3cEvjXGGkMdx72tizvr7NafUecvqDwJRonM0RAP
         5YRKYZ1YK4FrfCsVyIX0DvdmvH+DrBrobYSmxcPEx+QNpTMmPhg0H4wHR2KgS0Sueta4
         E7kTM/efVf4t9EKsebOii1ojNns0siZ93ljM4iKkgy/2E22cM7iC5eEH+nYqlL6Cbsi+
         CVNpUnY/jbscWWwpI1joFGvO04vDeOU0jZ8oapEoqSansnOSDmgjzBQKuOUQmroFgsFN
         89XT25s81oeDbLols0OZwrfMKkm9QH2q3bj1Gjsy3IBW9F7OY72fYzMvYKwEqucCq1XO
         70eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSszVzDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682db53f7si92814061cf.548.2024.09.03.06.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 06:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSszVzDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slTwP-0004rp-CV; Tue, 03 Sep 2024 09:51:38 -0400
Received: from [209.51.188.92] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slTwF-0004qN-RR
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:51:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slTvM-00064o-Ke
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:51:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso60103465e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725371333; x=1725976133; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+6UOoqDtdqPF+il6F/TYHpc4wmTMnw5HKm4F9lxz9Q=;
 b=bSszVzDDf1VmN9iJ8fH9aluSWYtQhvC7w6lA1kgY/c2YrEPHHjrmQL/iQsiV/y0nat
 96Hj+iAeuB4/2tdHApVrSl+qBF2SMplyZjMBsNWo0GUM5ugDB5XHpq833GOg4zBjqw5/
 55OgbompzkugfIonQsOh+98LOSsd1rwacYb5OlCbcwgMd8D6CprOoHrnVmmRQhD9PtBE
 rcG4Vvyb+eVriAEcHCMKus0oyhUmNPR8JxyufkFPCy7VWVXZOT02TjH1gRl/4OCDcbd8
 olp70X89GcvQS/6UlDbg4MClFtkkZ39+m4ylHedx2/lhzAytMl+m/x6H5TC8tVQIC2I9
 u8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725371333; x=1725976133;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+6UOoqDtdqPF+il6F/TYHpc4wmTMnw5HKm4F9lxz9Q=;
 b=kL5yZ/AsgwpJ/d98BmVKj7V3LDts+mPj4E6DWZggXw0I8w8zyP7XyKLZE+djF0CJwS
 xfHIV3O1C6sHyVe5uXETMjrhsLpoimRZz+iPNo/dCQYob88OO02w8C8CQlT8U2SkDeeY
 8M7W3f7Gc5HTJz4S/MwTOesEWKX+/5qyDxNjr3W1NHV/KMtnm82BYnwLq2MRgStsqH0g
 v0iImmgJ/g+PHeR93y7rNiWQvsYN3mb/B1LFwCMFgkwTx9YBCiJqpUxMFfdh56s/j7PE
 FqXYjIJJpQKVvDRJH54HgNn3dHQuvxtl4cb/xqwqb38/vqskSrOZ0xNc5iLzX5R2SrNu
 XgpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnYy+5bpfVKJG2nSR1Apy2rVddlPY+puQQHGlNgzrrMSs3Lom/jxZHTpp9/8ja0FJFc8VvgWEG/g==@nongnu.org
X-Gm-Message-State: AOJu0YxlEbuHWH2pImttYNfO24kk3y7rQPP3dYFpSsl16JGcJqkh2fyd
 RPUlHlFAS1nQmaybI7ndVOv6uFIUX4sOYu04kDXSbMWBV6Cn2fSI0tBskFYOGhvqpETHd4SN1Q+
 ZPo8=
X-Received: by 2002:a05:600c:5102:b0:426:690d:d5b7 with SMTP id
 5b1f17b1804b1-42bb01ee5b3mr155397355e9.25.1725370808737; 
 Tue, 03 Sep 2024 06:40:08 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a42sm169043865e9.11.2024.09.03.06.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 06:40:08 -0700 (PDT)
Message-ID: <b1aaa5a7-f813-41b6-8dbe-de2279ce68e9@linaro.org>
Date: Tue, 3 Sep 2024 15:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/boot: Report error msg if loading elf/dtb failed
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Changbin Du <changbin.du@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240830105304.2547406-1-changbin.du@huawei.com>
 <7c67704e-a067-4b6e-8acb-51b33cf17ee0@linaro.org>
 <6c9429e2-90c0-423a-812f-33f98fe1bdc8@linaro.org>
 <CAFEAcA_TyjZMcQ+_aCKQvHVow7hB0Q_nZKzRSxPUA2S5EEyBFA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_TyjZMcQ+_aCKQvHVow7hB0Q_nZKzRSxPUA2S5EEyBFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g5ytc62hNnii

On 3/9/24 11:20, Peter Maydell wrote:
> On Mon, 2 Sept 2024 at 21:00, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 2/9/24 21:55, Philippe Mathieu-Daudé wrote:
>>> Hi Changbin,
>>>
>>> On 30/8/24 12:53, Changbin Du via wrote:
>>>> Print errors before exit. Do not exit silently.
>>>>
>>>> Signed-off-by: Changbin Du <changbin.du@huawei.com>
>>>>
>>>> ---
>>>> v2: remove msg for arm_load_dtb.
>>>> ---
>>>>    hw/arm/boot.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>>> index d480a7da02cf..e15bf097a559 100644
>>>> --- a/hw/arm/boot.c
>>>> +++ b/hw/arm/boot.c
>>>> @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info
>>
>> Note that header error is also silently ignored and could be logged:
>>
>>       load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
>>       if (err) {
>> -        error_free(err);
>> +        error_report_err(err);
>>           return ret;
>>       }
>>
>> (untested)
> 
> This one is deliberate -- if the file is not an ELF file
> we want to silently fall back to trying it as a uimage or an
> AArch64 Image file or as last resort a bare raw binary.

Oh right. I'll add a comment about it to clarify, thanks.

