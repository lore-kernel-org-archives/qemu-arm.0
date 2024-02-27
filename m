Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2578806ejf;
        Tue, 27 Feb 2024 02:15:25 -0800 (PST)
X-Received: by 2002:a17:903:41c4:b0:1dc:6b99:a547 with SMTP id u4-20020a17090341c400b001dc6b99a547mr11805976ple.47.1709028925413;
        Tue, 27 Feb 2024 02:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709028925; cv=none;
        d=google.com; s=arc-20160816;
        b=KOAPRBCaLi+Sx87lHdypxGpKSdJbVGPSAeoiANyKouYDBX3xkAEA/CIKtAR3Pft/o4
         4xSXIPFJhbyagUmDKgbioLw30B9wX6dXXdYghpxmM19D+iH0l9WbvifJF8kRUA4AiQqS
         hE7UTlJStMFgTh95yqaZ5XckBmGMPo2zeqO7UlhAbjzHHJlLQtDsYX0QPQWIPvkuqLpn
         YqTgAOQNT20sFZSHRktaVjSCrdxAFyhUsubgRELQDtrv/iVvv3zSkNNnWSyPIf54mEcb
         KmCGWBJrPvaEth3dvYk1v8MnxNFQwQQbvuZTm/+6bcEIL0HD85B0JgwlnwuvBgOsjOQ6
         UPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fx9hfe20Iig0ZK24L+ZonhivY18ZcsqsCbKd+RliBUI=;
        fh=PL8OQMSxlLqhqev64mxlSU/Mp63SKv4MY+SASJSiwLg=;
        b=vCfClKTjYtSLtW+ISq8at7HgWFiGMaPMWbVEqDWSTmpRSQ1G/3eUV91jW/umWlgmZr
         22sq4Sn8bI+0roFTP+7hDjkTpKgB5wyCrIwRP/JIwzcNPzDviMYbaGuGx4G9OOL4Rriu
         fI2dyTuXSpjQnCzQMyPOqOR/dzSDf3DwbVXnvXyaFfHnNoc03LTDczxFKg5Hy3aLvAbf
         qJwc6EXDsCYF31Uk6CMm7ZwA3ILARFYhYDJho+VDE3tbp2mKSlAFkA7XslMt/lG5yQlI
         w7c/eH2Cay9J2XJ4qUNOFa92e/w4y2/ksLGBiVsqM+f5k/ErjzPJVM5WPkZ2pjL7mE03
         DU7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=dh06M+QW;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d8-20020a170902654800b001dc48458e5esor4178027pln.1.2024.02.27.02.15.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2024 02:15:25 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=dh06M+QW;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1709028925; x=1709633725; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fx9hfe20Iig0ZK24L+ZonhivY18ZcsqsCbKd+RliBUI=;
        b=dh06M+QWTqRNQTs4mZrdW9RZoh5CCEhf/9c6DQvpEmsLs0+PZpjvYX+VpWzq8L9JLX
         py0LPFObBLW4dJbODMK0QGTh+cWiz033seudnT1PDlq9r6LK7vHr7x81zW1D9czHvWJD
         vJkZkjkdLo0XG4su8TyrlsKBep0UWL2pTp48uLd5jdb/g2sM1swdvbmZVEgoxjw9XT0Q
         BimQbJEwKvrzx+obBLi20ikInF8A8b+uKl+bySV5yLFs5q5HK5JmhnOrZMil3Ki5zmjB
         SIOKfNKjkt8jaUTMqUH1i/MdUJGI1tH5K93VPKxACs5F8xUyeZJtWy4nEtzGbsb5xcF6
         smAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028925; x=1709633725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx9hfe20Iig0ZK24L+ZonhivY18ZcsqsCbKd+RliBUI=;
        b=QaIbKsqd0IX08aZw7YWQAzvToASHE1pIs8jG48EQGvcOLZqRaN8amTCG9/OciJZmJD
         C5PLPasS38KDrPL6fQc7h4xpaL2Tv4Dmodyxel/JQFw9PK100FXmOs/dMbrLez4/8j+c
         y5NYxX0bbPV5vMtZG/LCa8+D4l4Nh5nHurzWQSUG7pLA2XjkNcWXazgfvsjwY+abVy7D
         TfNGSnwhKPQxvsHOCyrtZgqUW//c5cNClfGA34d8nF5BoxxdJPIanyosDgeNhMbdqS6E
         bLuRXaWf+ufnxdVZ8fZ5RnNMDz90TjyJKH40xPOY+d6krhjOv39NGdPYEh+YS/P6pyfR
         uXHg==
X-Gm-Message-State: AOJu0Yw/WV7Qd61cPm1/nhNredAuRphcoUs077wvTkUML2hrK5XxLBTD
	dX3RqUFR00Bwac6nksyMs4cl79aK+vNuowS2Uz4RfiqLuziiqJ/EmAz/zdZZzANo5EdOUKvKwrz
	i
X-Google-Smtp-Source: AGHT+IGGyYlErA9kk8nMdcFcEbGt4QH298QVBJTxJGbBkIKqaaIPTH8dfJ9RDIhR8DJM5hC3k8xACg==
X-Received: by 2002:a17:902:d587:b0:1dc:ae92:7e9 with SMTP id k7-20020a170902d58700b001dcae9207e9mr4236692plh.62.1709028924773;
        Tue, 27 Feb 2024 02:15:24 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id kn15-20020a170903078f00b001dbb0348733sm1193150plb.67.2024.02.27.02.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:15:24 -0800 (PST)
Message-ID: <485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com>
Date: Tue, 27 Feb 2024 19:15:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/27] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
 <20240226165646.425600-22-alex.bennee@linaro.org>
 <b7aac53e-cde5-4596-b0fc-d39f52d4ceb8@daynix.com>
 <878r36dxsv.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <878r36dxsv.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uEPVt1e4EOfo

On 2024/02/27 19:08, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/27 1:56, Alex Bennée wrote:
>>> We can only request a list of registers once the vCPU has been
>>> initialised so the user needs to use either call the get function on
>>> vCPU initialisation or during the translation phase.
>>> We don't expose the reg number to the plugin instead hiding it
>>> behind
>>> an opaque handle. For now this is just the gdb_regnum encapsulated in
>>> an anonymous GPOINTER but in future as we add more state for plugins
>>> to track we can expand it.
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> Hi,
>>
>> Mostly looks good. I have a few trivial comments so please have a look
>> at them.
> 
> Done
> 
> <snip>
>>> +        g_array_append_val(find_data, desc);
>>> +    }
>>> +
>>> +    return find_data;
>>> +}
>>> +
>>> +GArray *qemu_plugin_get_registers(void)
>>> +{
>>> +    g_assert(current_cpu);
>>> +
>>> +    g_autoptr(GArray) regs = gdb_get_register_list(current_cpu);
>>> +    return regs->len ? create_register_handles(current_cpu, regs) : NULL;
>>
>> Why do you need regs->len check?
> 
> Not all guests expose register to gdb so we need to catch that:
> 
>    TEST    catch-syscalls-with-libinsn.so on alpha
> **
> ERROR:../../plugins/api.c:459:qemu_plugin_get_registers: assertion failed: (regs->len)
> Aborted
Certainly regs->len can be 0, but why do you need to return NULL in that 
case? Can't qemu_plugin_get_registers() return an empty array just as 
gdb_get_register_list() does?
