Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1746678njc;
        Tue, 11 Mar 2025 03:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT/GQ1SfkVoZqB95GJhk/hHALFOlVtfygietwg88dTLEzbtcMl11O6Ui/vjseMXYt/Aqnzzp/YoZrMyA==@linaro.org
X-Received: by 2002:a05:600c:548e:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-43cf70a2d2bmr82589575e9.16.1741689219539;
        Tue, 11 Mar 2025 03:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741689219; cv=none;
        d=google.com; s=arc-20240605;
        b=MvZLJAlDWLUg+nXciBQaJm5cVoMPOvFDNwKPliN0W4Wnc8US4JfIfCx+aAsL4yZ8g9
         MUu4EuSymc/kyMu4mvsE7VgvkoIZMdlyrj1+X2ZK3iBHjGykwMF85mbVHD99EfX/JKxP
         ksFFq1LbkEZ2qfGNzVstFDUOxeLmJDCMiYdGBriO7kQ7CPrAAPEhWAsv5Fpk1CSGTEF/
         eGOvGsQbZTQUbe1BEV5MofxYEQPdh3F70Uk/oBuDoWGMXvxeo+grq1Dz3HXowBxqkPC4
         pyoRyTzp1WXes/F6XcinpzEKmt4ct0VFM8ShbnNI9GymVkOkGQgB7KNyqGg7JUf0QfrY
         5Dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2QFtVKFksrTIIW7ncRbooBuWmo0GjKVw9rVLv+Zl9VY=;
        fh=c5HwW50IbMm2O+GbE7zv4eA2KrAM7I0aj5FtdzSQsDY=;
        b=fHbQ6G/u1IbJZ8qhctoHdOuo5QwaiVwmGkrOcnz3RYQED9XVZwsUR91OCQsXQt8Rv5
         f7pvWac70NKMF/dPX5Z20latY24vdJ0fNjPoRblazIpmsEGbwxm1pW+9l+XNxiH+AJyl
         oOhACdTI7b55UwdoNfjSylPsks1gQC9q9snAOdNUKfFYXCKciQ7m7EYBgR9Cvh8WF/Lp
         WNEA3hhIkKtnpUN7dX5h5GawTvZqgEh9K8GT2oihwQUB5UFeBNTIBJgKqE9uqCnGc8dN
         uqWyK+5Sw7u7gaWRlQTu5IMnkDk+bjO31ZGG9haXvY0DMJUL65KkXvHtyRsXSWFUz4UH
         C7PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2cwSYBd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d00661977sor9120195e9.8.2025.03.11.03.33.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Mar 2025 03:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2cwSYBd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741689219; x=1742294019; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QFtVKFksrTIIW7ncRbooBuWmo0GjKVw9rVLv+Zl9VY=;
        b=p2cwSYBd/cXUGKRqL3jMvtOohrIGetBiF+STAQfAPKE5AKmexhYhFc57d+84eS2Qkh
         v7tdp9NF/HtDc0t3poMSfH6wyNn3kN0GNzjyDa9JSZh4C8SGwAzWljgA4ZcPRZdRUqZa
         ZMeIzweT9/wRYcQ5emga4efSHF1s9T/p3XFxbx3uPQv9iSr6rX8H2Y3XroyFgrJrUFeK
         2k3h5M0j1Pz3pBmq/Y/xVJ+P5MOSnSYnlfNe4OJ6CaZpoF4RlodZIRjbm0OBeMlpwatm
         zdhvK4s7PHiCWxDjY+nXZ7LMDw3abTOEuKcmJZt43yKfapVSZYXLvwoXl0QBesstAT7f
         8xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689219; x=1742294019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QFtVKFksrTIIW7ncRbooBuWmo0GjKVw9rVLv+Zl9VY=;
        b=uEFIYxOb/LVwF/1ffC7A8Yizu8HARJhQx4RmtRnhRt+4FZLkizHfzjsVOTrdWmsD6Q
         6/PUd9ZlJfhRKfSGcoqdOu5f6naZTOGHhODV+ywfp0cmw1SjadNCkPOn5U1EVo7ho9Mc
         AnBFFRKBVki7t8LlKzjPJ6I6Je4VNxJMtw3HrqOrQlAUD7R9jQ24v5I/5D9v8A1O8lwy
         sTiaaGO7L4Upbr9S9xUc8b9DIAdefz2ZCYKpRs4lIAm9rTuF/qR+5aCznFbgg4zFU953
         ukFiB8XN8LTtEmkrem8JulQhRJelnCkKirQiCsmwodPL6U5q1QGipR9Q+/jyV5hSUJuM
         AsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhqNRxK6MD+lErPT+vluyUtE2Clni+Cw6hsPG3/ILLlOJUKfU1V5atAcq0O+dYbE3Ldq9U1Qbuj3CX5g==@linaro.org
X-Gm-Message-State: AOJu0Yy1tYNJo2oTXmZ/jH1djUU7t/9XH2KXLOCpJpK/AHPUcnGipmn+
	Tx39H1wdnufKDZAt83RUA/78ox3vZW3CqgjoxFEReTQRGD0dasWb7NbKq+A7EK3vSg==
X-Gm-Gg: ASbGnctyvMGjJhmMj0Yd4Juk73fkDVCvhIdtgQaPJ/Yp6+cxOa64RI8nZ7/fZA03GS5
	BAnZH7rE3QwgNKrdkaEQ8GVVYFDvakykAef/Dvs1PyaqGZKSZ4utU0NouHEDFtRuAQfsX14vFbn
	7xu6wfoYcHfDdYHy2vOqeO8jxioJGX53bhdCnhjzdPJTmzG7nEEyS/OKufvwerH5+vsFNaEme9W
	SmLW+SEPehgkEHMJAVptqUUefhVqkimKu7oqC8T/u/C9mMfX1rMmZgTuKJR7sGnvHz/3RRBsbet
	IY121mqFaDjYDlpdZa4XdRc3pf8vvn2TnHIJWimMgq3eF7U6aRJgRiFwpB3NwIy3fm5k8NOhWav
	giGf6C4+uEpab
X-Google-Smtp-Source: AGHT+IGlJpmdAOdxvpIbYtu9RKe8uiKUc0CzNCRKFtZKVm8z6ag72Sb69Sf/uVgQF1yu3AieIp23KA==
X-Received: by 2002:a05:6000:1845:b0:391:2dea:c984 with SMTP id ffacd0b85a97d-39132d063f2mr12953094f8f.11.1741689218851;
        Tue, 11 Mar 2025 03:33:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1031e3sm17454870f8f.82.2025.03.11.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:33:38 -0700 (PDT)
Message-ID: <6f4a3582-f3e2-4f0c-8ab6-eeddd1064793@linaro.org>
Date: Tue, 11 Mar 2025 11:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-arm@nongnu.org
References: <20250310012825.79614-1-philmd@linaro.org>
 <CAFEAcA_fRWgntwbiFiDJqAkthR8vBzrkLOLkp5GeHD9O8xTMCA@mail.gmail.com>
 <CAFEAcA_kEndvNtw4EHySXWwQPoGs029yAzZGGBcV=zGHaj7KUQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_kEndvNtw4EHySXWwQPoGs029yAzZGGBcV=zGHaj7KUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HFFT7mldn/Er

Hi Peter,

On 10/3/25 18:28, Peter Maydell wrote:
> On Mon, 10 Mar 2025 at 14:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 10 Mar 2025 at 01:28, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> Hi,
>>>
>>> This series add support for (async) FIFO on the transmit path
>>> of the PL011 UART.
>>
>> This hasn't made the last pre-softfreeze arm pullreq, but
>> I think we can reasonably call "don't do blocking I/O"
>> enough of a bugfix for it to be ok to go in early in the
>> freeze cycle for rc0.
>>
>> I've applied it to target-arm.next.
> 
> ...but it still fails 'make check-functional', though in a
> less easy-to-reproduce way than it did. The problem turns out
> to be that when the guest kernel is doing its earlycon
> output (which is by polling, not interrupt driven) the output
> can be corrupted, which makes the aarch64/test_arm_virt test
> fail to find the "Kernel command line:" output it is looking for.

Thanks for keeping investigating...

> This seems to be because the pl011 code and the chardev
> code disagree about how "couldn't write anything" is
> reported. pl011 here is looking for "0 means wrote nothing",
> but the chardev code reports it as "-1 and errno is EAGAIN".
> 
> I think the chardev code is actually what we need to fix here,
> because it makes basically no effort to guarantee that the
> errno from the underlying write is still in 'errno' by the
> time qemu_chr_fe_write() returns. In particular it may
> call qemu_chr_write_log() or replay_char_write_event_save(),
> both of which will happily trash errno if something fails
> during their execution.

IIUC when retrying qemu_chr_write_buffer(s, buf, len, ofs) could
write less than @len (but still writing few bytes, that information
is stored in @offset) and return -errno, discarding @offset partial
write len.

> So my long-term preference for fixing this is:
>   * fix up any callsites that can't handle a 0 return for
>     "wrote no bytes"
>   * make (and document) qemu_chr_fe_write()'s return value be
>      - 0 == wrote no bytes
>      - >0 == wrote some bytes
>      - <0 == a negative-errno indicating a definite error

This would be an improvement, but not fixing ignored partial
writes mentioned, is that right?

> I had planned in the meantime that we could deal with
> this by squashing in this change to the last patch in
> this series:
> 
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -275,6 +275,9 @@ static gboolean pl011_xmit_cb(void *do_not_use,
> GIOCondition cond, void *opaque)
>       /* Transmit as much data as we can. */
>       bytes_consumed = qemu_chr_fe_write(&s->chr, buf, count);
>       trace_pl011_fifo_tx_xmit_consumed(bytes_consumed);
> +    if (bytes_consumed < 0 && errno == EAGAIN) {
> +        bytes_consumed = 0;
> +    }
>       if (bytes_consumed < 0) {
>           /* Error in back-end: drain the fifo. */
>           printf("oops, bytes_consumed = %d errno = %d\n",
> bytes_consumed, errno);
> 
> 
> which makes the code handle both "returns 0" and "returns -1
> with errno=EAGAIN" as "try again later".
> 
> But even with that I still see the check-functional
> test failing on a clang sanitizer build, though without
> any clear reason why. It's intermittent; running the
> test like this:
> 
> (cd build/arm-clang/ ; PYTHONPATH=../../python:../../tests/functional
> QEMU_TEST_QEMU_BINARY=./qemu-system-aarch64 ./pyvenv/bin/python3
> ../../tests/functional/test_arm_virt.py)
> 
> I got one pass once but mostly it hangs after printing
> some of the early console output. A debug build seems
> more reliable, oddly.
> 
> I'll try to continue investigating this this week, but
> in the meantime I'm going to have to drop this series
> from target-arm.next again, I'm afraid :-(

No worry, I was prepared for another issue :)

Regards,

Phil.
