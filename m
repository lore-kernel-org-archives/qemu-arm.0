Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1635890ejx;
        Tue, 27 Jun 2023 13:59:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3b82:b0:4fb:7be5:4870 with SMTP id g2-20020a0565123b8200b004fb7be54870mr4499117lfv.46.1687899561583;
        Tue, 27 Jun 2023 13:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687899561; cv=none;
        d=google.com; s=arc-20160816;
        b=oUABrNvXDqcXKknWLfvT+unwvmq7E82Ag1I7v2Qf4yjzx/wUYRYFPMjkvED6Q+22nd
         6AUCXXnjsM9/4JISepZNsStC0PYC7GZ/9dXcsbI+8acy0trGkw+DEkTYxR8pnYrJ2xCx
         2eh34fkxTWV+rRgQvZSTQtsi3R1pK31i+DgIpb6P64wcLVCPQaOxcdyPouSkqbrxQZ8U
         tVR7pfyJAs79BIbjPcqwi7GchZGACTDqdADuZyhyriU93FlTRpmlTHmV6XU0+5Zgbxwl
         CSdfeq/azGUf9hSVeB/NP8tH7wJBCRewB9a+mUDyKe0WHpmvrOwGC7HPK6vGyHJ7hDYv
         NPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Yidl49e7SEX3FKciW4n8kmUz7l6Uk5DcFSetIMs3Dr8=;
        fh=4AILt7Q4TWcCR04y9mUImqy6AthRYWx3XXHCQgkVA/4=;
        b=M+8dnDdguL/IcUqcaqECZZTyf1aLGPE9prYxP6uTx4Iad2gxclGGOXQm51p+iHww4q
         aLbCGLhFwg5fAJ7MKNKDh9bJXND0qB2iSvIDGjMFOhzSHuPhn7IjI4poQy+m8L96Ivac
         DV8eLxCajMCWH6+tuA018OPMfueipkCHCADMhVzzrDx9adoZbK7+f+dQdV3BmfYWOtrp
         hKr0wmeaMIOyN59U3kzf33gmGstx/LpCTzllQOKqHB1LNWE4g7HY8QnCvXlJcwlYEvDM
         pjh+BwAEeLpEtYxz82rZy+I4Q7L6rRk1knXUpJPA0DR6O3nPaLm3htRloO9r9YIgzQs3
         VRYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Um1/Yn6f";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t12-20020a19910c000000b004f86507b79esor2817920lfd.9.2023.06.27.13.59.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 13:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Um1/Yn6f";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687899561; x=1690491561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yidl49e7SEX3FKciW4n8kmUz7l6Uk5DcFSetIMs3Dr8=;
        b=Um1/Yn6fcwXhs+v5nF9abuOe/DteLuM6gHG4wm53p/5DWMCsmSd/lg0V8kfM06o81j
         tGoX/R+HusSbZ3DJNdILm5ezm8IH9HDxn5jQWk7l48/7uY9+NBzQkpftxbB2vWt0q5r9
         Bqlk9T8hTnlOkdAooDNQkUJlshYvHMl3tBHVrZbi3Y6FcfHxkCXIH6yvowfCT9nkU9UP
         sF91vx5/o9JVUyE+X0EOHzi0kU8exs/p7LcjdWK5ItGqKEFZybYbXJ/iMgCDuNxHPplo
         nrkZHgc2LfInUfzBkkYpL33POTcMyL29g1nkncupN8FaoJGMxNaMfMRWjmz9nCUi0sl3
         7FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899561; x=1690491561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yidl49e7SEX3FKciW4n8kmUz7l6Uk5DcFSetIMs3Dr8=;
        b=jOofMTryIA0gW8XCYzmem26pDRWhF6u/5ku4E64L2E832h38Pb+AvjnE17w+CPgyC/
         OzHUh6GAIHgcORokxKOp2RbcA0nPWcrKr+UiaU0AVa05WVVSzTWdejKFTdrdM57pUVcQ
         769jyqRUQ7yoUEJI6+lBlPwBTrPlcUi3fY+LIMUg3LUDupCP5usKr4X4p4JPssxnRGTr
         ZJ4X7vWIarM15ZhoQalhS5XoJr0dIHEisvTzmNqp8uzyR0LCfHL2w0BeZUf2R55i84x+
         W/XdU3gb/yEOUbJ5jW0j328O6kcejf/ooWbgpU5HG8bOjEGX8IKwJnV2m0bIM0m2Cw0z
         jtmg==
X-Gm-Message-State: AC+VfDy+Kl4W1YkM7nrb1FB4bIMSeYRy17oIpiCJYlmRj3u9EZNsWcmt
	YQ6FZmlGgVrkogCFMH8uG1C71XR+52RILCedMB6GiQ==
X-Google-Smtp-Source: ACHHUZ7pcyWiHq5LsB0xZ5pckygbSRtDI/tEu5aa716RQG1EEuWA2HvBlLFwojgpVZG3HS9Inpprbw==
X-Received: by 2002:a19:ca16:0:b0:4f8:5ab0:68c4 with SMTP id a22-20020a19ca16000000b004f85ab068c4mr16012708lfg.59.1687899560874;
        Tue, 27 Jun 2023 13:59:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id b3-20020aa7cd03000000b0051be5bbce23sm4113903edw.35.2023.06.27.13.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 13:59:20 -0700 (PDT)
Message-ID: <d662e5eb-5716-164a-9d06-a105d2ad94a1@linaro.org>
Date: Tue, 27 Jun 2023 22:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 32/36] gdbstub: Expose gdb_get_process() and
 gdb_get_first_cpu_in_process()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-33-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1l9BoRXRLsdO

On 27/6/23 18:09, Alex Bennée wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> These functions will be needed by user-target.c in order to retrieve
> the name of the executable.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20230621203627.1808446-5-iii@linux.ibm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  2 ++
>   gdbstub/gdbstub.c   | 16 ++++++++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index 33d21d6488..25e4d5eeaa 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -129,6 +129,8 @@ void gdb_read_byte(uint8_t ch);
>    */
>   bool gdb_got_immediate_ack(void);
>   /* utility helpers */
> +GDBProcess *gdb_get_process(uint32_t pid);
> +CPUState *gdb_get_first_cpu_in_process(GDBProcess *process);

It would be nice to have documentation for public API.
Can be amended later, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   CPUState *gdb_first_attached_cpu(void);
>   void gdb_append_thread_id(CPUState *cpu, GString *buf);
>   int gdb_get_cpu_index(CPUState *cpu);
