Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9629190njk;
        Thu, 2 Jan 2025 07:45:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcH/WMU8F8ITbYdFPwbEF6afaW+qn5xolY8O+LBgTmKK5lcNcX7ycrsNMjiJ7sKXyYk4RaA3DmYmIDsw==@linaro.org
X-Received: by 2002:a05:600c:510f:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-43668b7a284mr420551995e9.31.1735832742245;
        Thu, 02 Jan 2025 07:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735832742; cv=none;
        d=google.com; s=arc-20240605;
        b=T3UfdciWUMsbbdPmQFoUUcu6dB5idk4w5cKma790Lghx3ZTAqKzcCLjpFTBio9zu1G
         IaMrZuP2qsDGqZP5v5TNLLzHUL+ZtM55MJrqlvz0Moitah5gjoiE1yj3nvxaK3dmieAp
         biF04vxAA6SkpyXH8FwfGnQLbpUlmCQhdhK9GXlr++MXT+w1cNpuqpm3+b+F7F+EZe+h
         fpj1s3jm67UZD+tHuD2bBPkD4cp7l5fzuPhoY4Io6CJJkCCYAG+VDxXdzIYnsP7Lyhoo
         MlcO+adFddj/v1SUJ4ZsaVdnFv/BbqQkqlup0zLwklN/Fc17XwBbcnAXd+QXc7uv45dB
         mFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I0iKHpbk6qBGova3yIEiu/n5yntrZm075ycMLgR7tJM=;
        fh=Bmp/Zp5FDTTED192UtMTyBO2iwsFbMLcWKQJfnqUcM8=;
        b=KQY9xQPxt8KdjteTlNfB0Oi6xLyypf27FpqWEHR1Nk43ZnsBMeAkU0/hHszOvKtfS2
         LntrdTqO8WeNMWoLvXJNaR+t2OhVbQcMj+SYUh57n0cS2LZXp2thpeR6NcYRAt4wxuvA
         rxJsn+tob/2HwaUBOpkYS4bRvdBz6r/wNea2dOQAPIavt/YnD//6HHL6pXJozUMfWd1j
         sU2JgncWmSD2RV6C92ZVzSzR5BONi65bn6oemK67S20N0uSi9nkWKpeDwZBgpvgI0k9z
         hyDXAZ03CU6VGpJctrv4+ZVX/3wOS+Emqmu9jbTwXBdSl0/CmGsM6SvhmwPpus5HKwLm
         ZB9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmaVDWIX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4366127ed0asor71761465e9.12.2025.01.02.07.45.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 07:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmaVDWIX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735832742; x=1736437542; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0iKHpbk6qBGova3yIEiu/n5yntrZm075ycMLgR7tJM=;
        b=nmaVDWIXtEZriSE/17ArKeKI2S+T6yWikoM7bXrybD+FGf7KlKn4pmxQWtnXjymj+U
         SZUT0+kZmSEnDdpl3++qQhPa3vUwGqnbJO+TddQQsJFA8kNy2/E1k8sZMPI+yejn8Wgk
         xb3XbVUAUoS1eqi/dg8elE4GYucO8SCA3DEAX7sjkkbq6Af9PglCMN6PHb7FtvE6/PsX
         KcGPYmki8oVbwfhpDHJNVKmarlj/iVr3PtjxKTqyUb2matdqtiDlrdsHiJk/4FnyIkM3
         L/76nyxAQY7E33HZushhHSy3w3iw7JkvfVBCNNNQbTcAzv9t4LbjqbS1M+LsVfBImFY9
         PQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735832742; x=1736437542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0iKHpbk6qBGova3yIEiu/n5yntrZm075ycMLgR7tJM=;
        b=wUd0h4FbgEP2/Uxa9/mTGL1ldX6xCMq6NVl7VuGKAZNSh+DNQxIIQ5hoOIBIK9ArEi
         FAo9At6gYsTC5gpryHSEJHLQKWn2O8dfj7fdNlVGOJwmCnQPSH2Ntw7Ta3ErC3OLBCKD
         iFEfJXgwwqPfTU/zVBRHnP0+pKSvUp5KMabrq4FAARGJmNFLC1Vq2DNwzUUFaBtEKQoo
         A63TXJriDH3OmiqETqNO54tvmeHEFdFIThaE2NZeHfIVLW4+PU1/XGFCX9J0SyVKkYTq
         XTD+hlmEAZlKg/Z5Lj93hRYpvE7eHb5zWqhtWIyA/AX0joXf3jOQH7NHMsobkp9m1wTt
         gcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaPAUWctepg0RX7ErD6u+PiUfkIwdat2XpPLLPoObwd2y+iwzXeCS4A1lkYAw5FI8typP87Z67DdUuvQ==@linaro.org
X-Gm-Message-State: AOJu0YyEKXTMkjcqJNxZcmG5ru63U64A4PlLPEWbsie+ksCoktozu/LF
	3OAc3KiOBMbB+OSNoOc+Kvov4BkLq6CaZ+x4oExCpdPIhmqjiKo5Ujtto4et/DHpDA==
X-Gm-Gg: ASbGncuCv0uFAFO8skhmW3BFzBSlNe/5HoJB4w9MteE21xN1SfQX9DexBnlQH9XUJUr
	JEMYq/k6SIwfayPeUh6lskLubHDELZYuFBN5yMk8UxFMMxT8d/aCazW02geGIYO9F6dTI2Ik0yu
	vgTTUPDA38TTIMN8khb/iJ1Ysd8xHG+7sBREiF+WzjPgH7rzTFXPE6MKlXt2COAagMb/z0zVxjG
	qAc3woJUoUY7sD9dEfnmoizol+P2PLFtH2+fKauUQ5yZXUSAOCQt5f+HH2e9LLhAPM/bRc27rE6
	puC/IxX1R6FYFz06Xsvx7X/e
X-Google-Smtp-Source: AGHT+IFSdiP0ZnvrN/R6WsQYtbw755StXi81jfxmL3mBMtibibjXfw6ENS4t4n6OOaFErEjOKKlWvw==
X-Received: by 2002:a05:600c:3ca1:b0:434:a350:207c with SMTP id 5b1f17b1804b1-43668b5e22fmr353247235e9.23.1735832741599;
        Thu, 02 Jan 2025 07:45:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm460632015e9.6.2025.01.02.07.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 07:45:41 -0800 (PST)
Message-ID: <cbec584e-64bb-49c3-a4d2-27f321514e11@linaro.org>
Date: Thu, 2 Jan 2025 16:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] hw/char/pl011: Check if receiver is enabled
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
 <20240719181041.49545-11-philmd@linaro.org>
 <CAFEAcA-ibEzUWFCxA3iQLUoHwZeGnD5kM6c4Ni3BbgaoAs1gKA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-ibEzUWFCxA3iQLUoHwZeGnD5kM6c4Ni3BbgaoAs1gKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8suy6QKPT65i

Hi Peter,

On 29/7/24 17:51, Peter Maydell wrote:
> On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Do not receive characters when UART or receiver are disabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/char/pl011.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index c76283dccf..0ce91c13d3 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -85,6 +85,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
>>   #define CR_OUT1     (1 << 12)
>>   #define CR_RTS      (1 << 11)
>>   #define CR_DTR      (1 << 10)
>> +#define CR_RXE      (1 << 9)
>>   #define CR_TXE      (1 << 8)
>>   #define CR_LBE      (1 << 7)
>>   #define CR_UARTEN   (1 << 0)
>> @@ -481,9 +482,11 @@ static void pl011_write(void *opaque, hwaddr offset,
>>   static int pl011_can_receive(void *opaque)
>>   {
>>       PL011State *s = (PL011State *)opaque;
>> -    int r;
>> +    int r = 0;
>>
>> -    r = s->read_count < pl011_get_fifo_depth(s);
>> +    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
>> +        r = s->read_count < pl011_get_fifo_depth(s);
>> +    }
>>       trace_pl011_can_receive(s->lcr, s->read_count, r);
>>       return r;
> 
> I have a vague recollection of a previous conversation
> where we discussed whether tightening up the UART-enable
> checks would break existing only-tested-on-QEMU baremetal
> simple example code. But I can't find it in my email
> archive -- do you remember a discussion about this or
> am I misremembering?

The previous conversation is:
https://lore.kernel.org/qemu-devel/CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com/

I understood 'my first assembly "Hello, World" program' has to keep
working, which only uses the TX channel; and the boot-serial-qtest
is fixed in a previous patch. Now I get you were thinking of a wider
baremetal example code. I'll convert to GUEST_ERROR log level,
similar to the TX path, since it is still relevant for developers
who plan to run their guest code on real hardware.

Regards,

Phil.
