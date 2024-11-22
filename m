Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5281389njc;
        Fri, 22 Nov 2024 02:22:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMpxJpWp64sTodTfG2p8Q4zkEqN8oaBlbJqKiVSAvfivF0hn8Z0ENiiQlK3hP+mJDkqH7k
X-Received: by 2002:a05:6214:f25:b0:6d4:1e43:f395 with SMTP id 6a1803df08f44-6d450fe7b82mr34523926d6.24.1732270937192;
        Fri, 22 Nov 2024 02:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270937; cv=none;
        d=google.com; s=arc-20240605;
        b=FEuWLWNltyfPUhCABK876OqRKxOSTttevEBT/71Pc53jr8gmh9tJXJei20rEU7y2K4
         sNIr/eysYsQtVfvNc1oFi1rhBTHbMqToXTD7fNJvRfNJNY4sPV/t48onE5DP0+uLRywR
         TNeVtzcti4LHY9jfsNe5F/JUX4sLPaRn1OHEiD1wuOIConxPEWDJqKzGcby/xkTcShVZ
         t21dGFH3BbgNiY+kpLrx5yYM79r8V8EdVGn+Z1zTDDP8bWBERK3ZvCLaWZw+jsfZYgf+
         hp6zgXCjwzwHFGnQT1qCq3jqJ/UN6Z840gNH5ox9gzdPpMTSAOMORiWfyYY2iUpYAQj4
         FaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Cb8SnSORACBT7qPzBaVKUO9uhqbBBHQdjPhvW6ES8Yk=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=casXeS8g0njbRQU5COujttgLsqHp+TDv84lp6c1MIwvQTeXnvgh2hWWlp0icIcXzH1
         1QZjp6tsH9YmFtN/UnPpTE0aY05F7SmpAg8AI+vuEJGl5eOBoD+ZBsyTk2nTNZiObzW+
         Mj+jLwEDr+7pvbQLTagMYa+rrlnJSpMqJLbX6EJaSi64MzfYCO9I2dt8t7cxNSzB/k5J
         ItIKZCM2aLWaGJloxyx555fAxm49hvIs+LNjGyMI5RgxTV0HTd1OzJIHzaQ+A4Au+ngc
         f2unx+J5XdnNuQCdm13DRuFSuG8Q/nOxIUTAqtnQOwnp/zIXMKRKACmFy0VVTCuW13O1
         FYVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxqr+YuK;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b8c31fsi16313446d6.530.2024.11.22.02.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxqr+YuK;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Cb8SnSORACBT7qPzBaVKUO9uhqbBBHQdjPhvW6ES8Yk=;
	b=dxqr+YuKRb3p3o3Eu48V9+dINe6ijUZ00qvLNUeKlPuP6RVHpMM7TA5UPE9FkzyReQlAjJ
	yf34wzqEEzdGilPGXLdLZDURhSjFM186+B+2V8fEa33CCcQSf2UksupKBXhWaaExP3DV64
	WChCt0xQSqWoJAO71c8kkRKh0AyuR6s=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-fzkGX3wXN6qMhUWA0jT9BQ-1; Fri, 22 Nov 2024 05:22:15 -0500
X-MC-Unique: fzkGX3wXN6qMhUWA0jT9BQ-1
X-Mimecast-MFC-AGG-ID: fzkGX3wXN6qMhUWA0jT9BQ
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6eeb889aeecso31636287b3.3
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270935; x=1732875735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cb8SnSORACBT7qPzBaVKUO9uhqbBBHQdjPhvW6ES8Yk=;
        b=SGBTm6ymGLjIHRt8vLN1VDpb+4ncK1++h6jsdktsbe+E8VISnSHDRpaCoXGI8Gl2ta
         fQupjRRyR0G77XkdrcWzSqINgVxlgRNsDDCRqdn0oY8fjJJ4aP8E8GIjFJPhNnj4kN0D
         kvbEUZM+VlLYMnLlPa9hbzVEIj3w2t3shFykF11u0BTW8NJFWa8lz8LVo7ctsNKcWTzO
         ijyhX9v0DqoaYEBAw2UlGrykFhbWmUPtfzCc3BLfd312oEjOv5AI7bUyOLEUnoNA3X4w
         iBxEpG6Jaysb5qBeRJxWZ+XrEsWHgbBDNsjVcUU048CAaQMHwb8q4a2zHQf+HwJO8b+e
         QjWg==
X-Gm-Message-State: AOJu0YxuA4G3EiwlQhB8+dIjINL2RhazvQKtNxN/WiqDa1FsRpSUNErj
	XxMhN0rAK9lW9/pW/HUGom1/Iz720+gcsakm36AeVF1D6LzRH/rlh5kVEiURNppyUPcMJdK+aE4
	dTCPmGNywvm57K/402DCA2akFhgJnB0B5cB4fXukGeDy1Gu+po4/vufV9PvVr8PGmJNbY1wzHc1
	av3p/o9ur7VNlwPlukWwDc/l0W+rNl5pOKkKZ+
X-Gm-Gg: ASbGncuF342jafllxEWawB1/z4sHT31XRQ1jBlILcsxa67Qg2TD5mPsv/5VkB5VZv3b
	rjNwyUfo7IBL6zdgXoFeIm27s5x3sr63xXAJ4dMh/F0BTAzRLP9bojjoJxWsHSHv0bdnO3iE1Th
	RGMowFJowhh//6FYs/AANZgEuBXByA3s86xJwzU09AzOKfkRhV9YDGOyOHAkt9SVJtOFstTLoGD
	yGHrbNGlfTiibn8S8uGl4zOisvm67mIJwUet5GnTmDT/GGbav1zIP3W9DCy/om76UVLQgQNgn0=
X-Received: by 2002:a05:690c:480a:b0:6e7:e1aa:ba80 with SMTP id 00721157ae682-6eee08a5a10mr29458887b3.18.1732270935200;
        Fri, 22 Nov 2024 02:22:15 -0800 (PST)
X-Received: by 2002:a05:690c:480a:b0:6e7:e1aa:ba80 with SMTP id 00721157ae682-6eee08a5a10mr29458377b3.18.1732270934879;
        Fri, 22 Nov 2024 02:22:14 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a853ccsm8155446d6.1.2024.11.22.02.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:22:14 -0800 (PST)
Message-ID: <6a4daf44-1a6a-4c64-ad54-934bbc2fda8d@redhat.com>
Date: Fri, 22 Nov 2024 11:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/39] tests/functional: update the arm tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bJTdU7NEBNdSG3l8AcKEyIRzUnSFIzzZ7EKVmDA2iqw_1732270935
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IY56OlTxH8fK

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_arm_tuxrun.py | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
