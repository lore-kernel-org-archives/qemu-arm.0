Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp919056njb;
        Mon, 9 Sep 2024 06:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWVlsGGjoj1LSCo85is6Sfq2HI6j8fSPdPIxJEev2ccq4s4B/lV7nUUBGWbE144QOxdLBRDuqcWnmymg==@linaro.org
X-Received: by 2002:a17:907:3f8a:b0:a8d:2d2e:90f3 with SMTP id a640c23a62f3a-a8d2d2e9318mr586515466b.55.1725888468749;
        Mon, 09 Sep 2024 06:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725888468; cv=none;
        d=google.com; s=arc-20160816;
        b=RTM99JWbwi0zY5HposPxAu9Gn6eSsjjPT0OIAe+EDEW/zyDpTcEqtdOPr880gT6vtj
         LnBnF3BxICeZbxewPKhzxVzTeKSL2n3lsk+Y/Lv2xLUkg0yh5VW+UwnAUfItipkEI+OV
         0hJesrC8QDiKdaLgZ6RCSd7dK2K4q8iZ/Wu6sf6wN1biuoQNufQVt+ZVHZVJ2poGFqF0
         EgTIcbbf7/N6KcV3yZHXK/WYzfh6UGhZh2Zhz/bPshGyfmUseFaUezzFLAhwWvjjAUM4
         TArhxzw2VnYk5yPXMv1kCucPl8dAhkHOBovI8NjKbPjr45OxLVRWdN6oMjhxm2Lqdb9h
         cg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lwbiLqDAs21UIo/+lcO0DfO38fNxtDnmTM45HG+vtNQ=;
        fh=EWL+Akm2g5f5BTLvekqncmMwZEHCyZnAVXM6AfuO7Ok=;
        b=CUKhSnjM/gXm8i5+Kh3ekIgD0vQrDW6/+tqxZAeXooUGQM+vnCsKLmNvWtfLQ3HLzH
         TjZSrDzpLLwDAOcFud5+VkkhUUj+mx68doTkCWKlcirv00tVPxqt/jt0waFHkIG0JfHr
         u6lJi4mbzNgWOawHRIUeAtDyPbhZ+ZJC4rc/CFSXXCUB/Rjlfzabb2Ivz6CCU9WkAofA
         RXQ81yAiWbwaFOF5jabThQJ5HzFaneJdpaBM5PkGM8Y8byKdsnptp203ES/p7eJRlkt5
         pN1P+xMM2TfYnBh61WZbpsVyGtSqIacXQPEBJESYRhns+gYFM46l+LzU8sgo/5tinN/y
         +Cbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOFsLAl9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25a28430sor153096966b.11.2024.09.09.06.27.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Sep 2024 06:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOFsLAl9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725888468; x=1726493268; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwbiLqDAs21UIo/+lcO0DfO38fNxtDnmTM45HG+vtNQ=;
        b=HOFsLAl990IJkJ0nsyK6sifaC1qj0ejBWDyyCViE+At6aRS6XJJqaX9z7s4bew+pIi
         TeAg+LB3YGGl5UOV3dxwN6nprXmE5AAYQVxAQsY5uVSEIyhO2tLVtDpYYg2VKFQdgpDf
         Zz4bcjAb3XmH+H8u71sPntIL9nkxyOOxWVRnrr98mIfHq+npH8CotXD37LZYjK30v+5v
         OR0826eSxxFnhjnDRabuKLIEKFIGAEL3d+0rc1wAqYTZQgzLEv5cswUmiOi+JG5xnCDK
         44IvEoC89adOMFqxU8LtNZgp/w8KY8Mod6QWlCJPc0U5FogBlTFNUp5V2fZh9Pe1dZEw
         JWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888468; x=1726493268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwbiLqDAs21UIo/+lcO0DfO38fNxtDnmTM45HG+vtNQ=;
        b=SvzoKkxsXjd2erLzFTzPvBMPKWhlgHA9m6nagwLHui6fMnjhRSJQGaOIHc3hVBVtfj
         vIlHM2QI7vk0P4ZAfBh0hB5lPVyTIlk4KuHCmt3sqJD1o8q6NW2bA2yEXAEJuat49JkN
         9q0JyiV9FjLgnKvDnoAmE0KbHFmzm6TBk7CsKLhRcqxHEDJPbH/DvhiTah2S3B4Ip4W1
         tD5fWoeFhEL7FujLWof8g+LSgqMdBn08OMTUkBP4Ls5cf5q5RhPa1jKaM4ScGUjPsghC
         OUov8dS9LD98mr0Vwfc4oyNWytQCPx0KlLcZTZezeNIka+Ott0knvMy4/WIRce18ROCV
         Q2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmbxjgC2/EBSRj+1OE7J5HCfQjF1OQjjxCaKRVgk00ZagdnhRH7bpsnl4ZDzJ64ABX4vLC3YtbQtkGPw==@linaro.org
X-Gm-Message-State: AOJu0YywMMNxlXySavQuD4szaU/3kV8NjFMor1KXIp9yQ0ROJhLIEcyC
	1RhFYTDdVpPgI4GnkIIfwfYo0PFgksAT8id1ejqK1KCZNM9bAviDcNX+ikDRsxK2OQ==
X-Google-Smtp-Source: AGHT+IGsvvtZ+fYyWG8LfK57boEZU5Z3ysge5KDFTVpy6QAWAJ3LNXjVpNCSfUwyRV6fDvtkXLx7fA==
X-Received: by 2002:a17:907:7f03:b0:a8d:5e1a:8d7b with SMTP id a640c23a62f3a-a8d5e1a9021mr240840666b.43.1725888468039;
        Mon, 09 Sep 2024 06:27:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr. [176.184.54.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cee72bsm346735566b.173.2024.09.09.06.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:27:47 -0700 (PDT)
Message-ID: <a75781ff-9798-44fc-90e8-0581dabc8677@linaro.org>
Date: Mon, 9 Sep 2024 15:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] hw/char/pl011: Implement TX (async) FIFO to
 avoid blocking the main loop
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
 <4bc83012-3b9c-4b99-8b6b-65f041652540@linaro.org>
 <CAFEAcA-x_avaFQcrWQj=-e8-5_C4NeWUNxgRqLqKbrJ2HpK4pA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-x_avaFQcrWQj=-e8-5_C4NeWUNxgRqLqKbrJ2HpK4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sUI0ZegypL9j

On 7/9/24 12:38, Peter Maydell wrote:
> On Sat, 7 Sept 2024 at 06:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 19/7/24 20:10, Philippe Mathieu-Daudé wrote:
>>
>>> Philippe Mathieu-Daudé (16):
>>
>>>     hw/char/pl011: Remove unused 'readbuff' field
>>>     hw/char/pl011: Move pl011_put_fifo() earlier
>>>     hw/char/pl011: Move pl011_loopback_enabled|tx() around
>>>     hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
>>>     hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
>>>     hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
>>>     hw/char/pl011: Warn when using disabled transmitter
>>
>>>     hw/char/pl011: Rename RX FIFO methods
>>
>>
>> If you don't mind I'll queue the reviewed 2-8 & 11 to ease my workflow,
>> before respining the next version.
> 
> Sure, that's fine. I don't have anything pl011 related in
> my queue that would conflict.

Great, thank you!
