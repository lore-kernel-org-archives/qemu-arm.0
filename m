Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp909648ejc;
        Thu, 12 Oct 2023 08:53:41 -0700 (PDT)
X-Received: by 2002:a17:907:9715:b0:9ae:705a:8451 with SMTP id jg21-20020a170907971500b009ae705a8451mr20559579ejc.25.1697126021382;
        Thu, 12 Oct 2023 08:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697126021; cv=none;
        d=google.com; s=arc-20160816;
        b=a5jOZAVHSjR8Gp7iLfitqZ4XJf0MNqa2MRHejJaquKxHW4ftFVepx7Rv5qYYlyEfRs
         q+rQEksY7VaISte9daUYCw6Js5/1Vf3zuHtXQTi0jkxZT0+hh3IhL1llXxK2jEE72Gq1
         tFhJqNU69XuCJ8ABy7EaEQ4a0Jq0uL9OYfE28CSbhbMGbTT+5vBC962pOC9+N+W1IavN
         W1viDlfoXbsJDSTTnXS/AQNLx5UHVvDBlhgaigVno/M5h3jonStXdwKqP30WUw7zn4DL
         7nYXEitopuhJnfeGZ03D7KoThv6RFjz/6yxi6+QuHHyI57tyTa8OD4+TD4MJ4R8T5iUL
         Ke5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q+xORZM9Yq9cP7wH5c3U+ZvE+B2XoO1bTQHG5hQkecs=;
        fh=ovd0F/xMYUGzFGoSoczNgPZOEykr/FBab/SK3NMMjV8=;
        b=tzta6iWQizbtcVORG/1ohphpe1JCVUfFDKSgTeTVF7N2Zwl2MRPHTWBWmqHQOFDaaL
         E56e2Z72wjwQMAgMO3T/N9CXKy1QAfc/qIiScyUHSPwYSrmijMRrrsHj2LpxZ1+Nf/zk
         MfBPosbzur/MPUEA9fYqIJ9x8bTZBbbCW14cQ2pE3z4U0TEOcQkVwyzBKsf6hAvi87yS
         SgLr7wuqmCQ3BBaYPDKCLBCZhczCWDUVLHUG6NfOyWBA5D4VB5K0C93vXe1+/yIgdgCo
         RO+W16tLN420TQAqtiUNg2PzDPXYOKDDtgEKssvb4KtyY9JMlOD+M/XRFGf60XmtCSJX
         2g/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsYO5ppL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j19-20020a170906105300b009ba2b0d9acesor4006387ejj.4.2023.10.12.08.53.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 08:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsYO5ppL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697126021; x=1697730821; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+xORZM9Yq9cP7wH5c3U+ZvE+B2XoO1bTQHG5hQkecs=;
        b=HsYO5ppLzPw9FXlZAZ8muA5O1kYF881sJyaUiypjSWJZHiPUDV3JU03kQ94JzNO1DC
         lPM+r0Vr45tS2la0hyXZrBbrO4c3HzwQLB794v8soAM19itxR1p47lvjP6ROP1t5OFAG
         GuYE0iOV+BmdvYOgcJykEPtZ7kyscEhzz6/kEEegW22RTXVTV+qZqH+HCk6tWTMsqcjP
         MIwsNS9Q0fvkn7Oerv2WzZvx9EyCtoWi/vyeRPLS5ju1wU8zaLOnKjYL29GeiVMyJzaQ
         slK47H3Oy71SRqwfBH0OKxMyp//OCPP+5TsAyeXO9Toy00xGj+9oD8KfBgEnsEljBy4G
         8row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697126021; x=1697730821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+xORZM9Yq9cP7wH5c3U+ZvE+B2XoO1bTQHG5hQkecs=;
        b=Yft97v2foOz6+qj+HgOiUPFerqUZsvz1kpRcOsT+slr5BTm0FXqYN2i9WhtvII9v0N
         38nzKmiQT19wEzFoL0g4AYodr4APltA5Z6so0L/PUMhoOVL4sENGp+pE58Mdm4OpCEMp
         vIlCHAqZ27rAZlKh8y8S78CFSp8FlApJXWgfi80NceSNtNwr8ViNSWjbOpizLP8zMYp2
         YfW6HMXzL7Q+tP+7TN9v5F/yXg/Q7uBGhp3v4UGTvrzdQFEEeKezE3U4l1dBqwT4VTVd
         rfb19PMhYhIFf4bPwWpN9L+tnysIHOCYSGBKhL48dibH9Cb9pYbD70bS/nAB4FDoF5cK
         OQ7Q==
X-Gm-Message-State: AOJu0YxXSKPhvsd3BdLHvABBFmTqp9RVOnNnrsG4dOrG2DV9HRzEXFYU
	qQ5D6MTy2HwZHE+umMlYWzYJ6f+J
X-Google-Smtp-Source: AGHT+IFuAq+uu+hWxZ+IQ/Zyfegvh2aLCli5ylErNQSfiiRZjFECcQPS7rMWXrUuPA9BQrJuTanLEw==
X-Received: by 2002:a17:906:4a03:b0:9b2:be2f:e31a with SMTP id w3-20020a1709064a0300b009b2be2fe31amr23197563eju.31.1697126020933;
        Thu, 12 Oct 2023 08:53:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id h13-20020a17090619cd00b009ae587ce135sm11162276ejd.223.2023.10.12.08.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:53:40 -0700 (PDT)
Message-ID: <358415d4-f8e6-5374-522a-7aa5cdb83485@linaro.org>
Date: Thu, 12 Oct 2023 17:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from
 XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-12-akihiko.odaki@daynix.com>
 <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
 <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 489d9g2gRuaV

On 12/10/23 16:45, Akihiko Odaki wrote:
> On 2023/10/12 22:43, Philippe Mathieu-Daudé wrote:
>> Hi Akihiko,
>>
>> On 12/10/23 15:06, Akihiko Odaki wrote:
>>> GDBFeature has the num_regs member so use it where applicable to
>>> remove magic numbers.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   include/hw/core/cpu.h   | 3 ++-
>>>   target/s390x/cpu.h      | 2 --
>>>   gdbstub/gdbstub.c       | 5 ++++-
>>>   target/arm/cpu.c        | 1 -
>>>   target/arm/cpu64.c      | 1 -
>>>   target/avr/cpu.c        | 1 -
>>>   target/hexagon/cpu.c    | 1 -
>>>   target/i386/cpu.c       | 2 --
>>>   target/loongarch/cpu.c  | 2 --
>>>   target/m68k/cpu.c       | 1 -
>>>   target/microblaze/cpu.c | 1 -
>>>   target/riscv/cpu.c      | 1 -
>>>   target/rx/cpu.c         | 1 -
>>>   target/s390x/cpu.c      | 1 -
>>>   14 files changed, 6 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 3968369554..11d4b5cd0c 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>>>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>>    *       its Harvard architecture split code and data.
>>> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
>>> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 
>>> 0 to infer
>>> + *                     from @gdb_core_xml_file.
>>>    * @gdb_core_xml_file: File name for core registers GDB XML 
>>> description.
>>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the 
>>> CPU to stop
>>>    *           before the insn which triggers a watchpoint rather 
>>> than after it.


>> Why not remove SysemuCPUOps::gdb_num_core_regs entirely?
> 
> It is used by targets without XMLs and ppc, which overrides the number 
> from XML.

Right.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
