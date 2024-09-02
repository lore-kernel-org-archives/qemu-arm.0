Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1218248njf;
        Mon, 2 Sep 2024 13:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWy+pkvoTJmq9vGCUuEWqUD09deV2u8o/LTPjNisyz7JHi8MVrPLsbsCUz+yKmBBBK0c/ZpqBVugJ38zA==@linaro.org
X-Google-Smtp-Source: AGHT+IGGIkAJ181hNPKOn5WPcZgNiXziD1D8wlY5hAlrussBLRTrieBrMgMKS7b4PrX39I9hZ5/2
X-Received: by 2002:a05:620a:1926:b0:79c:ad5:cd7d with SMTP id af79cd13be357-7a81201464dmr2552410985a.23.1725307259556;
        Mon, 02 Sep 2024 13:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725307259; cv=none;
        d=google.com; s=arc-20160816;
        b=dTvfALu2doNKNy3Yyl1d3KET9YFKkNK1H2JuJtsjIIBEzizii/ugIOZA8V4btEvBAZ
         jgoefp0YWrgI7YP6XOgD9EBOAQpgFjq8abJFU3ynp/SdrDfC8nG4/wXy0zTmL6Rh26f/
         eo45A+u/V+Z/yqBqls9HIKpSw6h30k6y98DXEYTNC7VwbryYGY2p5NcLOr4Jk/3ZcNt6
         ZvI1tZeXR8o6t2r5IrwMyMJyFiwOhbqolHF82GkCCxN9QOAEz7yJd+GuPr40F9hfMlG3
         mHpxxPKvxpEWbUJnF3eQcn8vU7jXYYMhUCIFMhRmGMb3wyTZOz6wu4vOqrCS9mtEHNLX
         uQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3MMrtHA5sT2aNyDhcNj28OxY3n+8qln5d9m2QgKTyow=;
        fh=ALOxJvXo7SIw/tDyYye1D3LQraA46lA8q52bUkGfsCI=;
        b=XWt8TNI+4SJcn6AJAD35xVqpp048zG5Jck4zWz31xPXKiXWhTYXaT6vdLNnxuz8qqE
         /1phofGvaXAIgH3q32pGciY7+eNke+gSU5jbKzbayMj+HCHZy2ycX1+kyl8srPBQlcsB
         rtYdg9e8z7yIPGAewij+pTy/VnEf5QkH9FZ8zApRHSiC87++cd3SHfWUF5gT6dfmbu/3
         WBJecOabHVU8gdCVgFbZhQSDSe49Rojtuh6VsVC5icJUI6Qrypc5zUa38w9q1HBrIhpI
         0UtXRSx7ZpTK03ATxYIPDgyuP5s4fn2BSsXBnnib74NrgbjniATIMH+K/EcI8t5hMHBV
         jtfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzySVdN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d82ef4si1110716285a.441.2024.09.02.13.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 13:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzySVdN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slDEC-0000NO-Da; Mon, 02 Sep 2024 16:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slDE6-0000L2-3w
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 16:00:40 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slDE3-0007GI-2j
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 16:00:36 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f3f25a1713so54481571fa.2
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725307230; x=1725912030; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3MMrtHA5sT2aNyDhcNj28OxY3n+8qln5d9m2QgKTyow=;
 b=HzySVdN1xZk2UYwGBRb92a9e3or3Y48s8usETkpk76urRKZNa+K9Csfq7k0v/qlTHW
 xnOppwGHV5l02SA7LOZhs+s/tcd6qCZahNSvAZ+cHVgqXTeTrOBcz2XlpZFihRK9o8L7
 lJaeJV2vtobQnVhDVDqxNqDxbUiMYA/uNY3QekJxzSYWyTeBfGkVriUwJYhEjFzByuF5
 GoQ98S312Wa90XxhuFqoZnNScTG1BHV2kSmMN8uKICqBSAYsN68vRf8MYab91Ue5CMnV
 7HIq5//4fCP+Pmg9C9Rp2JbsoY3YHFUopKl0hclJrMPqLrhjYdiLEfTcT0V8a7hiU6BR
 JZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725307230; x=1725912030;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3MMrtHA5sT2aNyDhcNj28OxY3n+8qln5d9m2QgKTyow=;
 b=GukbK0Ip0nT1OaOyysasJEw3aYyxHc5zrtHvyZeobD3tlGviTuSG/4zbdUQwHZJkXK
 Ehc/DK24Hua15n5NiaOnUNymkwwwo82cMAugluonUJ9RzpkqJufFK5YeymmjIQ7PEBTW
 wi+Qn5dE0eVh/WHjn6Nh9tOoaJi4nLaV/CQ8yxRzbvKSBURNl5HDvTbKyKuRE+B6By5R
 S9PP/ZL/WctFpN7e6V6PvkYCFvm9svVO/WteFTBM7aoN3HlLKvu2YwiZ/jvHY+O0K0Ro
 4HDx0io8Ufpaf1E2/maz54Mt3IO3QCiMaJWKso+iR8F6UOJ+8/pNlfMkIcpaSiKxSqie
 91Lg==
X-Gm-Message-State: AOJu0YzyYkxNNPMoyTgCT8CMeb5hgeLSiAWxDhNxpRSnH0oLBRY8XmuC
 MNZ5B3JSjJZBk/Dw3IKLViVlLMURVMj8dl9gRLZWCCxnSOI7IiPI64WzKVPXprs=
X-Received: by 2002:a05:6512:3352:b0:530:b7f4:3aaa with SMTP id
 2adb3069b0e04-53546bb5f64mr6125636e87.52.1725307229981; 
 Mon, 02 Sep 2024 13:00:29 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac472sm1728954e87.112.2024.09.02.13.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 13:00:29 -0700 (PDT)
Message-ID: <6c9429e2-90c0-423a-812f-33f98fe1bdc8@linaro.org>
Date: Mon, 2 Sep 2024 22:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/boot: Report error msg if loading elf/dtb failed
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Changbin Du <changbin.du@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240830105304.2547406-1-changbin.du@huawei.com>
 <7c67704e-a067-4b6e-8acb-51b33cf17ee0@linaro.org>
Content-Language: en-US
In-Reply-To: <7c67704e-a067-4b6e-8acb-51b33cf17ee0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: K5H4GKkbNbz+

On 2/9/24 21:55, Philippe Mathieu-Daudé wrote:
> Hi Changbin,
> 
> On 30/8/24 12:53, Changbin Du via wrote:
>> Print errors before exit. Do not exit silently.
>>
>> Signed-off-by: Changbin Du <changbin.du@huawei.com>
>>
>> ---
>> v2: remove msg for arm_load_dtb.
>> ---
>>   hw/arm/boot.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index d480a7da02cf..e15bf097a559 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info 

Note that header error is also silently ignored and could be logged:

     load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
     if (err) {
-        error_free(err);
+        error_report_err(err);
         return ret;
     }

(untested)

>>       if (ret <= 0) {
>>           /* The header loaded but the image didn't */
>> +        error_report("could not load elf '%s'", info->kernel_filename);
> 
> "Could ..." (caps)
> 
> "hw/loader.h" is not well documented, but it seems load_elf*() returns:
> 
>    #define ELF_LOAD_FAILED       -1
>    #define ELF_LOAD_NOT_ELF      -2
>    #define ELF_LOAD_WRONG_ARCH   -3
>    #define ELF_LOAD_WRONG_ENDIAN -4
>    #define ELF_LOAD_TOO_BIG      -5
> 
> And we can display this error calling:
> 
>    const char *load_elf_strerror(ssize_t error);
> 
> So we can be more precise here using:
> 
>    error_report("Could not load elf '%s'", info->kernel_filename,
>                 load_elf_strerror(ret));
> 
>>           exit(1);
>>       }
> 
> Better (but out of scope of this patch) could be to pass an Error *errp
> argument to the load_elf*() family of functions, and fill it with the
> appropriate error message.
> 
> Regards,
> 
> Phil.

