Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp474213ejb;
        Thu, 5 Jan 2023 09:28:39 -0800 (PST)
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id h6-20020a05600c350600b003cf803bd7ccmr40052530wmq.33.1672939719764;
        Thu, 05 Jan 2023 09:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939719; cv=none;
        d=google.com; s=arc-20160816;
        b=k2pmfxYLQ2s2pdCB0eTsnP+Uo1f3LjhYvfWF6H8xqUV8JN9VHEqzMDalORoUGtNbjI
         o+fLkpJW/9NNgIf6i4yeIfAzmUPZ0i6liyHVlqJQxMBvlmAdcGWkYCsIexjEi5zHER9S
         B89/VWTfP45l5x0dDF6Ntz2/74VLp/ZDaQKMthU/rRsT1fhl5RNhGWraS7ltpQzGYqb7
         Ymfa2fZB7hQUuBChP1nzh5yQCPdVt1r9uG9be6kcO7+/6ubhbVxD+C4iJvWpZqrM3FtX
         xD3MBxVdB0rTJa61MyZxo5etYMyb2zanv8ykvQY7IHrS1+73f6480YwMqqBxpGNNF4Bq
         IRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xLc3h8yqPnvvcE3JzSjb8mPuQCKVOGDC88RCNMEdEBI=;
        b=BBOTb03xHGGZh4028jvp93r5oZ5oqWuj0ltqsBQT7Wdld6lHmYrcVRCpF3+ghvFKjA
         Km+bRMhthVER7liJNbnvE76gDtfBohpAzZETRWqjbXSjKcEwosEjZRURAifC8hPkrm4U
         LQcnoklGbXlC8CiDMiEkghClgt8NXecbXCrzyrlY+ieH6x/8E/XGhlVvouZg6F1oyVn2
         MT6SGB0rY+Q5qkhFdZLur1fV83D3+5dt9babbEe7PScIPz4kGj+nAohqIdmxI+bdZCq4
         kXkOYwD320r1R2Quke3kKJ8OsD2UvRcgrGsT8aVQD8BqQc44AGAr5Ykf3bG3VgG3rheN
         TXaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwSIzupn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1-20020a05600c294100b003cfad59841bsor853721wmd.21.2023.01.05.09.28.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KwSIzupn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLc3h8yqPnvvcE3JzSjb8mPuQCKVOGDC88RCNMEdEBI=;
        b=KwSIzupnOaRjU7pDIFTrJ/Gs8FzxZk9o6Ayv+7BqF+1P7MKPtPAaTjFNO+O7KncIRt
         wpSiNyWy5ibCAdKlsoxsvUsuocAhA1Ilz4m+xGOpeMNNw08vhqNjj5CN7GdyEb03PE5F
         tfZHnRGb/F6JGUuO1yo45zPTrcR2vRsa/T7+h7O+aWvqgCsTjPR/BP/T+mHO+mbIyJeG
         I5nxi4zOEeYJZz47k1CHN998L56TY0Ajc1dM68Dg8B9KFF3dh0RY3KaTQEdWKyX0P8IF
         FnAbNVkJxYC65weSWL9xpVKqBxRTg2eM7nkjv/T9WFuQ5eUNrk6xhY+bmQ88SKqjwRPo
         njsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLc3h8yqPnvvcE3JzSjb8mPuQCKVOGDC88RCNMEdEBI=;
        b=LUBHqbuiD/GP2Etoec8XSZAN0x6Ws5PrC/1DCvbvY8Us3xo4GsqUsJvDMQOVtKkO3Y
         XEzgQjGmuqCiIla5W+RDw9DXjuekOKi8ynuNJI7bQiCOMfm/x84/91Tau9sRlOESAST7
         capLI7HjZMSaQ2PfK2XZM+cXW4w9IKnENZyPkKSUHvPo+E4/CEs82gBbu2eaKOFhMvEn
         4lBaF48VHiLkug7vKYXP5wNd5wkQrIGj0ohwBWXJd5dmHEFKyTieZ/XJljRfuDtc5hsW
         fPS3qLlDbAWWV9KZxAGiqKInW24Rvsekz2QmLD8RSKhtuJW8gyT23dbvLvBs/TbG8d6p
         FZ/Q==
X-Gm-Message-State: AFqh2krgcuqh1NZmARHC9rouOvOMzkAvGs43kkKGgqpOGWZEHUFnnJ14
	qUnoRSPhblPUw26juV3YhV63n2M70+JIfQ25yys=
X-Google-Smtp-Source: AMrXdXsF0Bc9tPrumh0aEI/VQiagz31RjL4K54DzQvbwkaUt8OmYanPtii91U7p06dGyCd8PCxDItg==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id n19-20020a05600c3b9300b003d343ae4d10mr39659064wms.11.1672939719323;
        Thu, 05 Jan 2023 09:28:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b003d99469ece1sm3410678wmo.24.2023.01.05.09.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:28:38 -0800 (PST)
Message-ID: <7d8fc0af-93ba-c79f-4c53-0cb52db40fa5@linaro.org>
Date: Thu, 5 Jan 2023 18:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 18/21] gdbstub: don't use target_ulong while handling
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-19-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Yu2kuDElexAU

On 5/1/23 17:43, Alex Bennée wrote:
> This is a hangover from the original code. addr is misleading as it is
> only a really a register id. While len will never exceed

"a really"?

> MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 4547ca3367..c50c2f8e0f 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1192,7 +1192,8 @@ static void handle_read_mem(GArray *params, void *user_ctx)
>   
>   static void handle_write_all_regs(GArray *params, void *user_ctx)
>   {
> -    target_ulong addr, len;
> +    int reg_id;

'unsigned'?

> +    size_t len;
>       uint8_t *registers;
>       int reg_size;
>   
> @@ -1204,9 +1205,10 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
>       len = strlen(get_param(params, 0)->data) / 2;
>       gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
>       registers = gdbserver_state.mem_buf->data;
> -    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
> -         addr++) {
> -        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
> +    for (reg_id = 0;
> +         reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
> +         reg_id++) {
Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
