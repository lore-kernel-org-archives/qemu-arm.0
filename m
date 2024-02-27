Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2595279ejf;
        Tue, 27 Feb 2024 02:58:53 -0800 (PST)
X-Received: by 2002:a05:6a20:2d0c:b0:1a1:261:ac3d with SMTP id g12-20020a056a202d0c00b001a10261ac3dmr2165893pzl.47.1709031533307;
        Tue, 27 Feb 2024 02:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709031533; cv=none;
        d=google.com; s=arc-20160816;
        b=NCdrvphzIgIGLylSgcJsz9MKoecWM4vm1zQfUYkEn5o2PHUoddnHRXoQvoS+kIpYi6
         97TvfnJjookyI0omv0dXl61dDg2r1Th8xjUs63ZrpoyXZSnrpWHj3bJXVeMwGO3QwB7P
         CNBwQoV3ISzRguMtaV/WPIHnp2dBHGZsZ2LmqtiUG+PAH2ZRzjkQHFYyoaWlbmkTyaIJ
         +omnakc6TDgHtczfgxS/rmges3hnrFk97BUTrLoWTt2c2XB8iW3nzoAjW2f7943U7AqT
         Lmb32RciM2lkWnyG1iL4tu4XZLAsCge+T6Mix0t3kRr2CroJ40tV/2aNfODURYv27H0C
         4EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TsDmIcNCrVwkgpZ3Rq+Sniy+ldkymAQlv95cwgKc05Q=;
        fh=PL8OQMSxlLqhqev64mxlSU/Mp63SKv4MY+SASJSiwLg=;
        b=grGv3U3Fdx7rLCk7F37aJcVEGhW2QRIkOLLa2+oiwbGn/y7XNjJRhgQOYRw/w/X/nO
         vF8oLgukcWQ1ffbAyrCIeJb+Oav2847cmPrNYG55j6c/da/6b9j+jvu6sZERq8slYICt
         QSoW7ZIoHFLUDpHH1eoHhCIR7xboWFnD3YMtrNu0S2EcWGwVWbk5CIt3H1N/4AmI/+dP
         UeCkKhYghsk5r8v9ZOwEK38SW2NaUo/zKuo68F4dC6Lddp7l/Q9ERQbsJSHj1eLMgPO+
         ocox0frJse3eAdZO4umQraLKRTR8vzGxehojMACdA6y3RzYxAzcKfcL6wVLe9y93QVzz
         m0ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DK8avPhE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d4-20020a170902654400b001dbcf653013sor3015087pln.7.2024.02.27.02.58.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2024 02:58:53 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=DK8avPhE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1709031532; x=1709636332; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsDmIcNCrVwkgpZ3Rq+Sniy+ldkymAQlv95cwgKc05Q=;
        b=DK8avPhEvIWCDQp2kodl6q4n2CQHEdNYL+7F1icsXC8ude8d0G1rfwsgCLVuFiLfgK
         35Ly71VY2TDpb3ghFfBVWunc807UbXhouJGqC1lPpFbn8Lr1vkjI3MXZgLfq7KsUUOWd
         8KEfumoDLl3i2xNUg5iRyPj6qIiFNh8LjwLqdUsIb6MXHUcy7K+vSgDnOqmUL3ZapmPg
         CL5IMQpX2uV/azq+tF5KxnGtWeHJRywQLFV22B4WOFIPkliniIVlVNynXAXabf0DRuWZ
         9auv1Opfrif77BL4RtsI5p5r2msuExwgYNoCrD6AV/TQbtE16Sb7670iDesZNNfU5RMl
         bJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031532; x=1709636332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsDmIcNCrVwkgpZ3Rq+Sniy+ldkymAQlv95cwgKc05Q=;
        b=fFelHldADPcjpeC8rPnaoEwTVuz/WDt4roNMJc1s87V+zu9zsdDR4RGhqPQZwZPdvq
         eY2tO/f9vjBOISuP4pqM9v94q1i1mui3sQ8aqr1zzpVLleBehqNOhCjDeTXp5Q2/Fv9w
         w2qS7myvmuv1NyjODC3R6vZbi9buvzj0kc+Ylc7uZDA8nfHpZm3L7NphFHz35MUAfujr
         SrtDACEQ7H14MyxUF+wFC/1EbmDTxPDnTpEniGSpjIbgULKGEfT8+u/NWHUl76aN0M2a
         qyOZapuwV47+F+nc00USOoKZ6bimVwYpn3ZEvlhHnXKwLb5Oks4vgAAa7b9HeBrbcR7E
         xr1g==
X-Gm-Message-State: AOJu0YyoTNLQYaB7phdzBCWp4jIU+hoejMtEA/D9x3U8Z143FrKhO+02
	19mXMspYwP6Bl93wx/5+ckmFbSgf5olz7PfZjjkAo6Uo41O0XNr4kS/isxdGrmHJgs2l1I7rj0J
	g
X-Google-Smtp-Source: AGHT+IE/xiDOvK/3wPL4R00Ude4nZVASCnxuRQ+do4oShLbadK9+gnNEMWTWVVSbYfenFG/UxyRKTw==
X-Received: by 2002:a17:90b:4a03:b0:298:b9e3:691f with SMTP id kk3-20020a17090b4a0300b00298b9e3691fmr7038770pjb.23.1709031532662;
        Tue, 27 Feb 2024 02:58:52 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.206] ([157.82.203.206])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090ac88300b0029a4db713b9sm8183679pjt.39.2024.02.27.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:58:52 -0800 (PST)
Message-ID: <20e4981d-6378-4293-8625-7c24bb499f41@daynix.com>
Date: Tue, 27 Feb 2024 19:58:43 +0900
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
 <485e6093-54e9-4ce4-ae01-c44525b202ef@daynix.com>
 <8734tedwun.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <8734tedwun.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TKaiKnR5furS

On 2024/02/27 19:29, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/27 19:08, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2024/02/27 1:56, Alex Bennée wrote:
>>>>> We can only request a list of registers once the vCPU has been
>>>>> initialised so the user needs to use either call the get function on
>>>>> vCPU initialisation or during the translation phase.
>>>>> We don't expose the reg number to the plugin instead hiding it
>>>>> behind
>>>>> an opaque handle. For now this is just the gdb_regnum encapsulated in
>>>>> an anonymous GPOINTER but in future as we add more state for plugins
>>>>> to track we can expand it.
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> Message-Id: <20240103173349.398526-39-alex.bennee@linaro.org>
>>>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>
>>>> Hi,
>>>>
>>>> Mostly looks good. I have a few trivial comments so please have a look
>>>> at them.
>>> Done
>>> <snip>
>>>>> +        g_array_append_val(find_data, desc);
>>>>> +    }
>>>>> +
>>>>> +    return find_data;
>>>>> +}
>>>>> +
>>>>> +GArray *qemu_plugin_get_registers(void)
>>>>> +{
>>>>> +    g_assert(current_cpu);
>>>>> +
>>>>> +    g_autoptr(GArray) regs = gdb_get_register_list(current_cpu);
>>>>> +    return regs->len ? create_register_handles(current_cpu, regs) : NULL;
>>>>
>>>> Why do you need regs->len check?
>>> Not all guests expose register to gdb so we need to catch that:
>>>     TEST    catch-syscalls-with-libinsn.so on alpha
>>> **
>>> ERROR:../../plugins/api.c:459:qemu_plugin_get_registers: assertion failed: (regs->len)
>>> Aborted
>> Certainly regs->len can be 0, but why do you need to return NULL in
>> that case? Can't qemu_plugin_get_registers() return an empty array
>> just as gdb_get_register_list() does?
> 
> That seems more troublesome to handle the other end. NULL is nothing is
> a fairly common pattern here which makes short-circuiting the array
> iteration simple.

I'm not sure why you would want to short-circuiting array iteration. 
Iterating an empty array is often simpler.

In any case, the same logic also applies to gdb_get_register_list(), so 
you should change gdb_get_register_list() to return NULL instead of an 
empty array if you think that's more reasonable.
