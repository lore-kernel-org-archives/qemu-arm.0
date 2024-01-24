Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp51416ejq;
        Tue, 23 Jan 2024 19:08:45 -0800 (PST)
X-Received: by 2002:a05:6808:1887:b0:3bd:5306:da9d with SMTP id bi7-20020a056808188700b003bd5306da9dmr1080298oib.65.1706065723641;
        Tue, 23 Jan 2024 19:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706065723; cv=none;
        d=google.com; s=arc-20160816;
        b=sG/4G532xpQgIgZtZt0Tb7RLyb2hWRfu6+pERjDhLc5+s6oXlLCnD5jB3bZM/8glx4
         wNummP6iitfIkldpbzMgFiH08g/9O6CJkwKAn+yPRj8QVZZIcRDZSrHf4MyMFr8E0DF0
         nflg6l5JToqasEQaimSQSbDcq8t1RoYXbcES7Molb92dkMF16zsTrDRoHnBFLwOroLFn
         hwMAJZHE9rxMj4yGx+1r08LzIFnx2M6F/i3rVsZCR1QaYOckdE5XCJXNH9kmFNzuHY4n
         OUD9t4y9cicOl+hlbn4pLuXDkIHBNonTPX1T3E/OM5m1rGB3ccJmplVaxLNQ5+exkR+5
         8tyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VFo8VE/oCNQcg7y+0hi3tk0ijg8Jc1j7rMhdDApnhJI=;
        fh=eJryPBtFtm0ZQMNOC2atImLqCe0fLKFvNJ2USZjzyUc=;
        b=Rfdegq8n0VKbOsvoRkRv6sNFoJvVAM2oq60UsT+K3RwP0jpGn/EW7EJYG5uv3DzdBT
         yiGz+eM9zZYLnly9sTz59Ul8mNZMsKsGyZ/HSKFQvgtFFyLj2PgyVoALkLACUxH+CzqT
         VoD/l//88vZdfmLWPAx1/ddNusGqphgXfkZNq+HTRrLLsVBw6HJLpg50PWDPEN5O+ZGi
         Dl9sI4TfYfKVmnZUn1LKAXdR67j2POCIW9/8DuqQ7sd27Jwlc6UPmDbCPR80/wMxsEQ7
         wU7kl1wGVa4e9X5Vuv6twJxcJDAwnbP5W33SZCITx63PmzQbDcfblO6WWGa24eMLzIuS
         8Xkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yiOZkpqQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c32-20020a631c20000000b005cdfa131dbbsor4144672pgc.10.2024.01.23.19.08.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Jan 2024 19:08:43 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yiOZkpqQ;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1706065723; x=1706670523; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFo8VE/oCNQcg7y+0hi3tk0ijg8Jc1j7rMhdDApnhJI=;
        b=yiOZkpqQ9U8g5320A+5BXzIrwf7fP815YMARecKuT0AQoS2cO3jYBl3wJ59CnbB0hT
         JnHrGxc8iWdYs2UGg5tMISdUqsIKpvrSPumEAZQztUNtkBdbGjvfNM5c33uOW9uvwvzR
         l8rPzlni64RSjpaE2AYPSzJAwlgfoSt0Q+scxDu5YkVTZqqaKmtl16REGTznf9NJf2Uk
         mk1E7qBLcMRtsPQdkK/4P9JTn+1rGttSKSVVtxUSeeujXwkgvz785kfQie2tVkcCTi7+
         UoDvym2KY/sl+wEAhmRo/eiyw6YNzB8l5j8BAs+Uy+h+/CMwDyL8VoOQhLG2PKLunuoF
         emUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065723; x=1706670523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFo8VE/oCNQcg7y+0hi3tk0ijg8Jc1j7rMhdDApnhJI=;
        b=WlX5thBF6GF5U0Gw0wsAdjtnWy01twy0Y5Q5Q+Gg9bxECzH+WEXZescaJVSvcjOPV/
         PgwcyMGJQBjeY5bPElFX+76GcFhlcgXuBm/8SMmpfKPKLR6BDzP0NWaTm9JErV5BDV4G
         MBbL+qYlv/U1C1nq9oMj2JGZp7jML94thpjtUvwJJxYl9MqS+NE1scpXg8R5v1icGA+7
         XmLQT4Ny0Stv5DzwwbUMtIKxsE74s7LbCHpF6DigGagrQ3/2c4MogmAKkjVPiINY3E18
         aCAnnIIdpxalUxz/y3dKnpt3R7f+6YbLb3JZgQmkHAEYbqKibCkHnFC+AI6Ks6GUyA9c
         7JPQ==
X-Gm-Message-State: AOJu0YzzAY81q8Pw+gOhkrBc7axBgIuGzHLD8sr97t03+dHyW2Erlmos
	WHyk5wu4l6GesnObvZtwCGVGWt0fNWNtnYAMHri3LF6aJoIFv9iec72qN/dwgbmzHKUXxKjcMSU
	5
X-Google-Smtp-Source: AGHT+IHfntglvY7cr85OSIKd+heawzghHZglxVkz5tGKJB42nnuYpbxcKdH1C6I7IIHf5nsB+5FoRQ==
X-Received: by 2002:a05:6a20:7284:b0:19c:53aa:53dd with SMTP id o4-20020a056a20728400b0019c53aa53ddmr210373pzk.42.1706065722914;
        Tue, 23 Jan 2024 19:08:42 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.200.138] ([157.82.200.138])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902c9cc00b001d7267934c7sm7127456pld.298.2024.01.23.19.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:08:42 -0800 (PST)
Message-ID: <15d2f958-a51e-4b87-9a70-28edf3b55491@daynix.com>
Date: Wed, 24 Jan 2024 12:08:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier
 <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss
 <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
 <20240123-b8d1c55688885bfc9125c42b@orel>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240123-b8d1c55688885bfc9125c42b@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: B9pewnXr/co8

On 2024/01/23 17:20, Andrew Jones wrote:
> On Mon, Jan 22, 2024 at 02:55:50PM +0000, Alex Bennée wrote:
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>> The effective MXL value matters when booting.
> 
> I'd prefer this commit message get some elaboration. riscv_is_32bit()
> is used in a variety of contexts, some where it should be reporting
> the max misa.mxl. However, when used for booting an S-mode kernel it
> should indeed report the effective mxl. I think we're fine with the
> change, though, because at init and on reset the effective mxl is set
> to the max mxl, so, in those contexts, where riscv_is_32bit() should
> be reporting the max, it does.
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
>> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   hw/riscv/boot.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 0ffca05189f..bc67c0bd189 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -36,7 +36,7 @@
>>   
>>   bool riscv_is_32bit(RISCVHartArrayState *harts)
>>   {
>> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
>> +    return harts->harts[0].env.misa_mxl == MXL_RV32;
>>   }
> 
> Assuming everyone agrees with what I've written above, then maybe we
> should write something similar in a comment above this function.
> 
> Thanks,
> drew

The corresponding commit in my series has a more elaborated message:
https://patchew.org/QEMU/20240115-riscv-v9-0-ff171e1aedc8@daynix.com/20240115-riscv-v9-1-ff171e1aedc8@daynix.com/

Alex, can you pull it?

Regards,
Akihiko Odaki
