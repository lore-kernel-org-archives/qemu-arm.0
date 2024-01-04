Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp75825ejo;
        Thu, 4 Jan 2024 05:22:49 -0800 (PST)
X-Received: by 2002:a05:6a21:33a7:b0:196:577a:168b with SMTP id yy39-20020a056a2133a700b00196577a168bmr590405pzb.22.1704374569255;
        Thu, 04 Jan 2024 05:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704374569; cv=none;
        d=google.com; s=arc-20160816;
        b=HARmd5w8YUL7Ib+pif9KiS2Wh1imHYa+/hn8ZioivdLBJWWOw4ZgHrGGKn+XV16w4R
         qY1mqZG5ZfPYNvctJIDalLsLDu47Ht/h9wSgCjqXbC9/Lt5jcczYlOtUBFBkK7XhlgbV
         LEBwBNO1i27rNpCqrfc9jecgAZqTdrhZ/WYw/jr64gMU7KR0OBJhEE/IkLMq9pOyrqz9
         JynZWo/3axzHZy3hP3tlR8WzlN8700rKQAtG4guDmmshs1If9xtuZghE3iDjCv3ea6Dv
         whLPPBjgYPPNCS59y7HsbGqF57/EBGFJLTLk58DJ+ulw+HhiEfjp+PivN3ce+gqwB/gz
         kDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+UaUoSEUxULvKOz2jhQuoYpr4rLktnoBGVluoHHYMOU=;
        fh=gN9yGj5remEraU3fcPloYL4dXFqAuDa5qzWKs2Fyz/4=;
        b=dcokB5318UsbOMNoPZjAGx8iZOVRt0rVT2WXPITa4r6ECcGlwN2o8Ng9tn2J9Yn8yJ
         7DwFX5akprme//3MEzBF39q69oATdZaKbazHUwgRz1X4KheOU1XhuZiT/Od4HxwdPez+
         JWXihSv+LmY5ntMZusW724bX1T3XfXfR3yFQftJyqHqyS7gB2VfGfag9WskNETm+nCqS
         ZcKbvrY1NrcnN9H2n33/R0RUfNhuKuVtKCfra2I5SJGud+mECSXANMu9URVgj1EwwXSL
         UP8fNIATLoarre7b2DPkKrEDNewsXH6c6u0036lnKM328DYjnCcGogdzH/QmAggMprlc
         yZNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=KsngkOVC;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s42-20020a056a0017aa00b006d9ff12f6d5sor2139596pfg.9.2024.01.04.05.22.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jan 2024 05:22:49 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=KsngkOVC;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704374568; x=1704979368; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UaUoSEUxULvKOz2jhQuoYpr4rLktnoBGVluoHHYMOU=;
        b=KsngkOVCJav/M6saQgHc3e2LBIYk12fpOUwWLsRDcn/kfRNicGsM+a7Zju+k6qJUz1
         C3oGU/t8DaoxMN0iy7n0K2uoeLNcJNyKJz+GU4luOWNyq7648m9V1gMxE5+TkI6+hHlA
         mdT4Qo/3gYkbrryB5UNZplz4iRfP/9Q+a49zWKkgyxPHWrSeKXp8SuhWy4nYraGWC76+
         Pih/C20bOS5QvAKr72kYuJSjZ2dtVKQ4vNek/Nyv8jHhVe6GjvaN8nE24mGYv8QpcnBL
         ED/5Sdwr2QaDA0g4ZGwxs0AJl5L5WFGtk68DqKvUTSJjM4R6RFjj1zzNkcvx45GZcDwz
         9rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704374568; x=1704979368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UaUoSEUxULvKOz2jhQuoYpr4rLktnoBGVluoHHYMOU=;
        b=aXzjLEyaa9nYYKxs5YxBnkIthz7GT+ZYj7xS7FDbw2bFlnAyFKpLyHjruKYeS9OLnA
         Ejef4sKZqJX/J04gWlOxnjgVHr8EmgLSOoinx9g/cJIA6ISYFSSyGGtcwOXAthQ7U6KS
         h6pYUXvZKk50go/FIiC8JdZuQlqsicrXWQZIYr4xcY46NmJ7D6L+S9rXtZi9uPeK/Qr0
         I/vvUKekHRsp+3g2xTz4mLO3XkXQzDmVlXVRG3YVNzg5Rw/5decbyuJTyT8vS5DaTCz0
         R4p9FacTxVz3v0hH+tSpSK1ZMoAza5IsNeNIuSof+zZPdNm62PJYSvKz9bxoHipg0TkW
         67JA==
X-Gm-Message-State: AOJu0YwoSja1HuwAihq73GIjo72h+Fa9MqaJIGBvenyxrK0cokrULLGB
	ztBytRl1l8/nhYuBCtk4Ur0E4G1AGCKqWVLRwUWynjm/sVgt/w==
X-Google-Smtp-Source: AGHT+IFokc8I4M12wpRZbGFseRS03dNmYQJFm1uTthsqLJ9zrTgE2OKJgGw72Fa3MExoY1OmaCb7cA==
X-Received: by 2002:a05:6a20:1445:b0:199:247a:1044 with SMTP id a5-20020a056a20144500b00199247a1044mr201672pzi.17.1704374568632;
        Thu, 04 Jan 2024 05:22:48 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id a25-20020a634d19000000b005c6617b52e6sm24378620pgb.5.2024.01.04.05.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 05:22:48 -0800 (PST)
Message-ID: <4cf878c6-0adf-4c97-b404-446d8a3dabf1@daynix.com>
Date: Thu, 4 Jan 2024 22:22:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-39-alex.bennee@linaro.org>
 <52cac44e-a467-4748-8c5b-c9c47f5b0f79@daynix.com>
 <87cyuhguf4.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87cyuhguf4.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HIXEQ05GkfUp

On 2024/01/04 21:22, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/01/04 2:33, Alex Bennée wrote:
>>> We can only request a list of registers once the vCPU has been
>>> initialised so the user needs to use either call the get function on
>>> vCPU initialisation or during the translation phase.
>>> We don't expose the reg number to the plugin instead hiding it
>>> behind
>>> an opaque handle. This allows for a bit of future proofing should the
>>> internals need to be changed while also being hashed against the
>>> CPUClass so we can handle different register sets per-vCPU in
>>> hetrogenous situations.
>>> Having an internal state within the plugins also allows us to expand
>>> the interface in future (for example providing callbacks on register
>>> change if the translator can track changes).
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>> v3
>>>     - also g_intern_string the register name
>>>     - make get_registers documentation a bit less verbose
>>> v2
>>>     - use new get whole list api, and expose upwards
>>> vAJB:
>>> The main difference to Akikio's version is hiding the gdb register
>>> detail from the plugin for the reasons described above.
>>> ---
>>>    include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>>>    plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>>    plugins/qemu-plugins.symbols |   2 +
>>>    3 files changed, 153 insertions(+), 2 deletions(-)
>>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>> index 4daab6efd29..95380895f81 100644
>>> --- a/include/qemu/qemu-plugin.h
>>> +++ b/include/qemu/qemu-plugin.h
>>> @@ -11,6 +11,7 @@
>>>    #ifndef QEMU_QEMU_PLUGIN_H
>>>    #define QEMU_QEMU_PLUGIN_H
>>>    +#include <glib.h>
>>>    #include <inttypes.h>
>>>    #include <stdbool.h>
>>>    #include <stddef.h>
>>> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>>>     * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>>>     * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>>>     *
>>> - * Note: currently unused, plugins cannot read or change system
>>> - * register state.
>>> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
>>> + * system register state.
>>>     */
>>>    enum qemu_plugin_cb_flags {
>>>        QEMU_PLUGIN_CB_NO_REGS,
>>> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>>>    QEMU_PLUGIN_API
>>>    uint64_t qemu_plugin_entry_code(void);
>>>    +/** struct qemu_plugin_register - Opaque handle for register
>>> access */
>>> +struct qemu_plugin_register;
>>
>> Just in case you missed my comment for the earlier version:
>>
>> What about identifying a register with an index in an array returned
>> by qemu_plugin_get_registers(). That saves troubles having the handle
>> member in qemu_plugin_reg_descriptor.
> 
> The handle gets de-referenced internally in the plugin api and
> additional checking could be added there. If we pass an index then we'd
> end up having to track the index assigned during get_registers as well
> as account for a potential skew in the index value if the register
> layout varies between vCPUs (although I admit this is future proofing
> for potential heterogeneous models).
> 
> The concept of opaque handle == pointer is fairly common in the QEMU
> code base. We are not making it hard for a plugin author to bypass this
> "protection", just making it clear if you do so your violating the
> principle of the API.

Now I get the idea. Indeed index values are not guaranteed to be stable 
across CPUs.

Why don't you pass gdb_reg_num as is then? qemu_plugin_register has the 
name member, but it's unused so gdb_reg_num is effectively the only 
member we need. You can even cast gdb_reg_num to (struct 
qemu_plugin_register *), but I don't think pointers are more opaque or 
future-proof than integers.
