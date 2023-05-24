Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2759284ejb;
        Wed, 24 May 2023 12:01:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jGRz6BFVOL6OK3f2sEixUo/dWCMb60QetEXbdMXD9DY/dbm7BUZmjWJAyyodBw5DdBDrb
X-Received: by 2002:a05:6214:1d0d:b0:5ef:865f:e5c9 with SMTP id e13-20020a0562141d0d00b005ef865fe5c9mr31454083qvd.29.1684954891820;
        Wed, 24 May 2023 12:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684954891; cv=none;
        d=google.com; s=arc-20160816;
        b=LWtkRneB3LEcAwT70nxX8Gs+fhPGKYXsBBcruDQLYwVsijp9vQtArWCNK116oemdpz
         IBk2BGyOCHmiD1xBMLENc75rsDfSrWhK6yLpLSwScrUBflWJx6z5ZH9BC4vaovn5NbkM
         liG4PWjQk8tiqdr4+taJTs7ZxcDO1hjY4VDAObDfrnVXTtybt02z6ojCdZTdQLx2EP8d
         JtuC64jdIxHneqef5vyJQkPl15yAlpLGM1kjg61x11gU0gtP/O350KmpbmecBOQVB9Ug
         6NbJvtRVQ145nAtqZ5uie5XpzuAbvSon3dXuXr6D7UvfgY7P470JKwDUogm67FbXgZM8
         Iwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FtLkIAzjTkJ+aVYj7imKJKMmgu33aX0vxDAXdscaFFE=;
        b=dhSnAX3Hh11oSbAzJYsrYK1PUwrIeDF5T5uuYMsHH1iY3vKVYFg5oWRenPvaF9+953
         +ioTQSiYhqO1Z9Kf4uSfBeqITiBlWkM5dAw5WXbMVVsHzv49ts5PxIYflETzkglS6ba0
         uhxveDTZIFD0EtsS18iniKglDEdoFndNUx1SwC6DFi0yqL46yVlT4I/HMZUDjGKO6KNq
         +MO1JxV0TLlZt1Nq1zeQ0YL48/T6pLLN2to+ftp28D4zJxsMj44HaC2mYx6yydrOacSy
         Fs693m07lZaeMCNAZALURryXS+zoNfkswCPjm/GxQ+RFDpLcw3sC9BAgDFPix1jCDjGV
         bi7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIHgACVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020a05620a06d600b00757726dcd97si6645852qky.243.2023.05.24.12.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIHgACVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tjP-0007AZ-Nz; Wed, 24 May 2023 15:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tjO-0007AB-BO
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:01:06 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tjK-0005uB-Ii
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:01:06 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ae763f9c0bso4875165ad.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684954861; x=1687546861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FtLkIAzjTkJ+aVYj7imKJKMmgu33aX0vxDAXdscaFFE=;
 b=cIHgACVJ+iolKcvWVX5j8jZodVxEMxftC+4FErPZw0s89kqSiUs/trtvRstLO4GZvj
 F2c1K6b7GHtwIIYAZSdQaDE+HIVemNF66SijLS/j+pnyPa3mgbO5Op900+Kxf3J094VN
 AaQxJf35nI1jSk9144M6Pzv9fHUHmslSGPstJHr4Ppqbi46hOitPbsQsvVrpoceTy04n
 Uwrk00Ke1Q3w3n/MvVmoN49okWplqOFge3IeV8CLOfNrP7VWp7fGmJ9ndThFXWuJYorn
 Fa8p5+4UYQHb70eOYSp6BZfn1xY4ILWRzULS5+YuXwR10Ppa432dM/4jTxnCra44dmU5
 lzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684954861; x=1687546861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FtLkIAzjTkJ+aVYj7imKJKMmgu33aX0vxDAXdscaFFE=;
 b=lSn+sk5aycRCCKJwxNdqbx6EcWmjnuBsttsd6QqXgzqLfyQCUdB3bo9eoCqLGqAOi6
 1hvz2bPwJ2SylCPafacF271jvAT2Xhjd/ipH4CxnSzo7KtuEY5al1oBvFYJQ1kfEAHev
 4V6/XLkoyHBQzBm0ospkKMLA5EKZ53rQwcCLbhiva4IJVdB/28ArltxpfAduY6IElh5s
 8wcDnxjZNamrapXTo4tJ7yVjS3Q+hyIZBZMaswzBdy5VbZUN5eN/oLcQQZPX5BAh40e+
 KrMzDfimlaUXDzcaAGDNp0in/lk3xSmNfuDdBqeT7VnqpN/0UHLBY3YjnwhWSRxwuGZv
 5bpQ==
X-Gm-Message-State: AC+VfDxxYRxirZxzkDVnL/viUyL3ZDl9WhSeknDLK5O98G78jQ6peII4
 7PwtHrROPHKl6v7RsdCHzFeL3jTp/l+6ZEAZSFA=
X-Received: by 2002:a17:903:2343:b0:1ae:bf5:7a7 with SMTP id
 c3-20020a170903234300b001ae0bf507a7mr21597756plh.35.1684954860802; 
 Wed, 24 May 2023 12:01:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 bj6-20020a170902850600b001a183ade911sm9080278plb.56.2023.05.24.12.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:01:00 -0700 (PDT)
Message-ID: <78cc4cd6-f961-a271-6d00-b04d5a5732ff@linaro.org>
Date: Wed, 24 May 2023 12:00:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/10] hw/arm/realview: Simplify using 'break' statement
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: FVFbt2tRMoLR

On 5/24/23 07:58, Philippe Mathieu-Daudé wrote:
> The 'break' statement terminates the execution of the nearest
> enclosing 'for' statement in which it appears.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/realview.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index a5aa2f046a..a52ff35084 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -88,7 +88,6 @@ static void realview_init(MachineState *machine,
>       I2CBus *i2c;
>       int n;
>       unsigned int smp_cpus = machine->smp.cpus;
> -    int done_nic = 0;
>       qemu_irq cpu_irq[4];
>       int is_mpcore = 0;
>       int is_pb = 0;
> @@ -294,14 +293,13 @@ static void realview_init(MachineState *machine,
>       for(n = 0; n < nb_nics; n++) {
>           nd = &nd_table[n];
>   
> -        if (!done_nic && (!nd->model ||
> -                    strcmp(nd->model, is_pb ? "lan9118" : "smc91c111") == 0)) {
> +        if (!nd->model || strcmp(nd->model, is_pb ? "lan9118" : "smc91c111") == 0) {
>               if (is_pb) {
>                   lan9118_init(nd, 0x4e000000, pic[28]);
>               } else {
>                   smc91c111_init(nd, 0x4e000000, pic[28]);
>               }
> -            done_nic = 1;
> +            break;

While I agree this preserves existing behaviour, it doesn't seem like the logic is 
actually correct.  This will only ever connect 1 of nb_nics.


r~


>           } else {
>               if (pci_bus) {
>                   pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);

