Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp728177ejz;
        Fri, 22 Dec 2023 23:17:16 -0800 (PST)
X-Received: by 2002:a17:902:c185:b0:1d4:11ae:52a0 with SMTP id d5-20020a170902c18500b001d411ae52a0mr2530887pld.120.1703315835738;
        Fri, 22 Dec 2023 23:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703315835; cv=none;
        d=google.com; s=arc-20160816;
        b=dfBY8ooC8tCYFC02+Gzy1LzE5ATgPeVAqJjPAuAsm3Pjw6eo8sty3b1UnkTa0dwO23
         kSoLEFe+jyYDWhHVCvuJk9LhKBvY/0oJJnZ0vOzAJ1S391Ii+CrSqI7YaBxg7uLiGjp3
         M9b8yeFfu9KHOuUM5zjkgcrxR+RBgacnTNN0BRDZAa00jvl8KhNubPQ5kBfjaJplHOSk
         GSzjzzwJHUl6TPF4CzuVcPPEIgsQ0ePJZYUR4GpE7fNqE8C2IJpTZwEQT4B7lMLjUMsA
         VuP2bJ2MBOhav9ORpdqEjMyqEYBafvdebiZOL94fipJk/l72FJ+xp4uDSALpe2aMysG7
         Lssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fVeSKwzmq9V2JL2neLcUCfxQ/2XOS0YKJUymFPDuUW8=;
        fh=Ap1S1QO/QXKIKdpwVW1p5XsQxq4zbg4344FudsJZG7I=;
        b=Aya1P7xjSKXmfa1Z/li5rd8BC71AAZ42ccXFUxayheMoNFe3lqNuAjN4oHvNJNW+qB
         Wi8JcOYtupXqlPt02v2wIbE6m9iPod1QtFNkZSfPM1tlBhdWEJUGV/dESPhatZ6QoMkx
         Re5/45F5qhaayKvEonH/PijfblTSnqpDXB+BSWyq1mAZNtu2UGFFGfp5cbc+rYdWKA76
         z3wDPUn2fojxaxXN/hBcagPa6T6Fho1E9RPxnVcqIVrn7cnTIrvtHEmHdkqpLme1WFl0
         uwgNJM/hFNBKI2+uIGJlOQRRMYgRwTuCvy4c4eIPbDRD3uPGB7AW4JyQeYfdgfx/PQAY
         ji5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=YuxHZOVl;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jg7-20020a17090326c700b001d33cf2a8f7sor3022850plb.8.2023.12.22.23.17.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Dec 2023 23:17:15 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=YuxHZOVl;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703315835; x=1703920635; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVeSKwzmq9V2JL2neLcUCfxQ/2XOS0YKJUymFPDuUW8=;
        b=YuxHZOVlg7DpyiGeLeVfNTtzuWiAfsOPVdMuF0MA4UBgCRVHCBdCSPCaLHS1mBnO8C
         JlkerJuqVUNIvj8r1pYeDfreRvVJITVz9dQspANe2jYG2aiAAnixKXp0w/3q81o3r/by
         AZcOamUWzQaz+cE1JAxJ5GkGgcehhopg/kOgjci3RswwZvV5fmFPCjXp5fJwy6cnpX/2
         HVBxon3Z55ClFvq17uBeJcjeTFlPE6Mdxadrra2PL38Ii9ip3OJwB0uYrlUbSYXktRBq
         0dI/d+i2H1kjFq+aeoC/8jAi6YXJ/qJvWuVXq8absJ0WaL00ct7uZqpFlTef+/vLRJ7d
         jUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703315835; x=1703920635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVeSKwzmq9V2JL2neLcUCfxQ/2XOS0YKJUymFPDuUW8=;
        b=Rj9X+dXc2raPTbHd0uy+g+eeKhcCVkbGO98PxHOpTsNKCaU10WVhlV1girN2qX1+Fh
         MagqAIbKY8JOOkDkrWAX2Ur1nPSU28CVJ8SN5wU8InODn6Kf+WturZD3YBfBFUOBsZAT
         GtNGEYjwbMaEtj+J6nYfejSUbLz3aq7uWGLyzC5xBjngL8MMh6f7ZCCMWwpFR0USeHwB
         Bi6vAUC24Ez5xs/kAOelgr6mDXkjNGbEdXfOhT/uLoyTuSKr+9J7YBMq41KmZdL6J6aR
         Ylwv1cVRRNWdn5t+mRYelCxX521+aiauGVloWMg30pXq5v+t8flJDbY6u47YW3WFFXiM
         YOTw==
X-Gm-Message-State: AOJu0YzgXu7AMlrntFnNPNPyN1JRY7dWCK9CXtPU7C/UVLZG1Jui45lo
	c1KCaiDYL6efZHrfk6e+LD9kcpYhaB5l3BYg+DkkW+RdU+OgLg==
X-Google-Smtp-Source: AGHT+IE2qcKXnKmpB1RRi8yUtOVicdjGkr1cCF0wyIMqCYKcKNevv9IrPCgqmGcAICRnjyEm9kdEmw==
X-Received: by 2002:a17:902:b492:b0:1d4:20f3:3dbb with SMTP id y18-20020a170902b49200b001d420f33dbbmr1971647plr.73.1703315834914;
        Fri, 22 Dec 2023 23:17:14 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.248] ([157.82.207.248])
        by smtp.gmail.com with ESMTPSA id jc14-20020a17090325ce00b001d07d83fdd0sm4524824plb.238.2023.12.22.23.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 23:17:14 -0800 (PST)
Message-ID: <3d5ed76a-42bf-4b54-9d11-c8833b410c97@daynix.com>
Date: Sat, 23 Dec 2023 16:17:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/40] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
 <20231221103818.1633766-38-alex.bennee@linaro.org>
 <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com>
 <87y1dmxsf0.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87y1dmxsf0.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3SpzMmMCrOiw

On 2023/12/22 22:45, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/12/21 19:38, Alex Bennée wrote:
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
>>> v2
>>>     - use new get whole list api, and expose upwards
>>> vAJB:
>>> The main difference to Akikio's version is hiding the gdb register
>>> detail from the plugin for the reasons described above.
>>> ---
>>>    include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
>>>    plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>>    plugins/qemu-plugins.symbols |   2 +
>>>    3 files changed, 155 insertions(+), 2 deletions(-)
>>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>>> index 4daab6efd29..e3b35c6ee81 100644
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
>>> @@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
>>>    QEMU_PLUGIN_API
>>>    uint64_t qemu_plugin_entry_code(void);
>>>    +/** struct qemu_plugin_register - Opaque handle for a translated
>>> instruction */
>>> +struct qemu_plugin_register;
>>
>> What about identifying a register with an index in an array returned
>> by qemu_plugin_get_registers(). That saves troubles having the handle
>> member in qemu_plugin_reg_descriptor.
>>
>>> +
>>> +/**
>>> + * typedef qemu_plugin_reg_descriptor - register descriptions
>>> + *
>>> + * @name: register name
>>> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
>>> + * @feature: optional feature descriptor, can be NULL
>>
>> Why can it be NULL?
>>
>>> + */
>>> +typedef struct {
>>> +    char name[32];
>>
>> Why not const char *?
> 
> I was trying to avoid too many free floating strings. I could intern it
> in the API though.

It is nice to save pointer indirections whenever possible, but it's not 
so worth that it matches with the cost in this case. It requires extra 
code to copy and will be real trouble if somebody comes up with a very 
long register name for special registers.

> 
>>
>>> +    struct qemu_plugin_register *handle;
>>> +    const char *feature;
>>> +} qemu_plugin_reg_descriptor;
>>> +
>>> +/**
>>> + * qemu_plugin_get_registers() - return register list for vCPU
>>> + * @vcpu_index: vcpu to query
>>> + *
>>> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
>>> + * frees the array (but not the const strings).
>>> + *
>>> + * As the register set of a given vCPU is only available once
>>> + * the vCPU is initialised if you want to monitor registers from the
>>> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
>>> + * callback.
>>
>> Is this note really necessary? You won't know vcpu_index before
>> qemu_plugin_register_vcpu_init_cb() anyway.
> 
> Best to be clear I think.

Ok, but I still think it's a bit verbose. You can just say it's 
available only after qemu_plugin_register_vcpu_init_cb().

> 
>>
>>> + */
>>> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
>>
>> Spurious space after *.
>>
>>> +
>>> +/**
>>> + * qemu_plugin_read_register() - read register
>>> + *
>>> + * @vcpu: vcpu index
>>> + * @handle: a @qemu_plugin_reg_handle handle
>>> + * @buf: A GByteArray for the data owned by the plugin
>>> + *
>>> + * This function is only available in a context that register read access is
>>> + * explicitly requested.
>>> + *
>>> + * Returns the size of the read register. The content of @buf is in target byte
>>> + * order. On failure returns -1
>>> + */
>>> +int qemu_plugin_read_register(unsigned int vcpu,
>>> +                              struct qemu_plugin_register *handle,
>>> +                              GByteArray *buf);
>>
>> Indention is not correct. docs/devel/style.rst says:
>>
>>> In case of function, there are several variants:
>>>
>>> * 4 spaces indent from the beginning
>>> * align the secondary lines just after the opening parenthesis of
>>      the first
> 
> Isn't that what it does?

Sorry, it was messed up by the email client on my side.
