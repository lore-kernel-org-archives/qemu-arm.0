Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1747121njc;
        Thu, 22 May 2025 03:15:19 -0700 (PDT)
X-Received: by 2002:a17:902:c202:b0:231:c89f:4e94 with SMTP id d9443c01a7336-231c89f4f9amr282515295ad.21.1747908919437;
        Thu, 22 May 2025 03:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747908919; cv=none;
        d=google.com; s=arc-20240605;
        b=EC8zXs1LsoRx+hkFOrkhTLif3AP9TQRTeZUbk1kQJk7+5GymHIjL2hrijohMICUsfr
         /MLxdi8YWkE+QGvG8K2AaxcH3smbDIdswPt31bi7gOOhYAPwD9rR3rOZIRjZhsdYDvZz
         T5CQnPsYcZoHvQ9REhteMF/Fc3fpYh/79yXHyDJVYemEHZa8lV1+rK0pe3mx9m0461lG
         xeVkaZlWGIF3DTVxwe0RCfTt9KkJK/9kK9p9qjVsJxsFI+e1Lnt77TxXEODyZHZxMdbq
         O/MYVOj4SEZ+s1sIRXx/nkSKLIMkRs0/L56CNjpImDMBg7iGSw7EI0ZrnmuL66vTbvBd
         qjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nE79lOCjGyV1qdnP886Di7odOMDmNNG0tEBkSKelc/s=;
        fh=YoDZrl5RRkFynPhE04bhxrnJRcn9/iTKvIGXs+Y5J6U=;
        b=eA3wjV2y0gewriWg1GxOAkl5VRou1gh0JNqQI/bqFxXt6VfxbOZ/EuxKJcvWM8h9Wk
         3PZflU95zxjM1/PIEr3TxYm0d/TBzS2o3dZ5V/GIyVyH9VDRhF87GfThgCwsPm3SPtc7
         R68dL1nATIgJJByDLX4HeBIxC73F+PAAyTu2aojW4ZS4YiRLK+vAuVMyavnbLgL9/TQV
         lHURnKXcpInxrtWHJjnAL7mNezyAWoGMu6Qp6pFR95AfZ6ZH1yBJ05OY6ieF9zq+aQra
         RRKOZ+3/AX1/vYEYOsgm4wIwsd2fhlDgPDb1rfx0OS7eLM52z979geSeRifjarjzD+M9
         fY1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Wr3o5B2B;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2319aa80113sor95351105ad.2.2025.05.22.03.15.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 03:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Wr3o5B2B;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747908919; x=1748513719; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nE79lOCjGyV1qdnP886Di7odOMDmNNG0tEBkSKelc/s=;
        b=Wr3o5B2Bvh2TV7rV+g2ws791PW+kzWio/g7wpmkbGG0QEW2nFrPVhsAA/mrys2mIf/
         jGGTpwJL1TAXBmqY4QUNeIIcVTfat4E1zjCL5Dz8fGjxynsgOlJwkPoGNwxbgf1QMYb1
         ic16qH/4W4i5fz0/dxqJCCB3pzV7imfDlvE6GKgQEXLU3nWg6on2D0bGAPyKd5b3/elt
         Eue7T1+KJDJGXUC4r7JsmJO4joD16HFMi0nGpMWgsRF/CgRoYcZLEzjTrkfWa2Ms9KGA
         lZSST2XWai69JJJ7pwWAxoQRFmNvxZVGDEBpXzaVtTtMLToVF6VYIJX9tPtr19ajd/oC
         2ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908919; x=1748513719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nE79lOCjGyV1qdnP886Di7odOMDmNNG0tEBkSKelc/s=;
        b=XcSsRn+UvNMmJm5Yo3gX0pFwTYwsLoiTc1U4/N3axCUPgb0VKpvmn+t5UWOvAI9DOs
         CEEMaFH47IURc3oLMK+FbiC929S6uZ08UKR+borBxot2mhGVwiEhysCn0NwDNG7rISFq
         P4rYVquOsHr2PsUxACHKRVW/I4vbW6mAvMDBFMsh9oZGdINxhIMw/IX78H/Ze4T6hAXJ
         uRv8rXz3hv0yl1+er3E6S7judVEZhLjYjQ8XN0RefcB1Gubz3ZJQRDFC/zWWSudxZn6Q
         XR6WevyVumJX5rtbr2b7Gn+t2jQTzdaBQzNkwMiXWjkHCI1pn0oY+FuYSf3NW0Zw3ihO
         3KuQ==
X-Gm-Message-State: AOJu0YzrWzNmG5tR0bQh9weFALyEYzCPYT42jkFqhhGoNGJi83Y7bq1H
	9PaCJZiBzc2vxevHapk7KGXTkk0GwiPmwxDEFqQEJs+PIeREoxpl2H2LVxqLp7L7BjoVcIQpeSZ
	ugwjt
X-Gm-Gg: ASbGncujZUOHSXGfQ4TtvaX8C6rL0oxOIkqthsBOpGvRcxaeTeIVBhbk2OncR9ANqN3
	9qSdQW4RlXGIh0z1uMYZEiE736MNNqVs3LUV05FKASr/NyHIJreAnio6+4MmMclUsZv2+dXAvSd
	0J82QsuQ78FYRtsuk1a2rb7wSIP7Rq8G/CyONpnLdHH+5Tv4UVWCaHCtHxA2URJe039j7kyJWn+
	eL8L0aJOVokrqYIiCZnzuyhk1mA4Wv/Xw+Kon8PUeYWSTxCVV8pynCCj0X2gN+DGTojE2oW9IE/
	FDLK/CzfVCs6mdXvF7o7snX4E67elXllQ8pLqaLw2lUs7lM5XBQaJkP3iDqy2A==
X-Google-Smtp-Source: AGHT+IF4s9YI5DvyQgh6tB3Yvz2Hcyrl7FSFcLoAYNFBWcUFkAmi4CYHEsufvajmACRCJVDiKFmIdQ==
X-Received: by 2002:a17:902:f707:b0:232:11dc:d95f with SMTP id d9443c01a7336-23211dce734mr249639045ad.4.1747908918689;
        Thu, 22 May 2025 03:15:18 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed57adsm105901965ad.240.2025.05.22.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:15:18 -0700 (PDT)
Message-ID: <f01e6f6a-23c7-4f85-a981-62313d5f73ac@daynix.com>
Date: Thu, 22 May 2025 19:15:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] gdbstub: Implement qGDBServerVersion packet
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,
 Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-20-alex.bennee@linaro.org>
 <0e6cb7af-37eb-4e8d-b342-ecfcdb639f10@daynix.com>
 <87zff56juo.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87zff56juo.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uFSaaoCMkzTC

On 2025/05/22 19:05, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/22 1:42, Alex Bennée wrote:
>>> From: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
>>> This commit adds support for the `qGDBServerVersion` packet to the
>>> qemu
>>> gdbstub  which could be used by clients to detect the QEMU version
>>> (and, e.g., use a workaround for known bugs).
>>> This packet is not documented/standarized by GDB but it was
>>> implemented
>>> by LLDB gdbstub [0] and is helpful for projects like Pwndbg [1].
>>> This has been implemented by Patryk, who I included in
>>> Co-authored-by
>>> and who asked me to send the patch.
>>> [0]
>>> https://lldb.llvm.org/resources/lldbgdbremote.html#qgdbserverversion
>>> [1] https://github.com/pwndbg/pwndbg/issues/2648
>>> Co-authored-by: Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
>>> Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
>>> Message-Id: <20250403191340.53343-1-dominik.b.czarnota@gmail.com>
>>> [AJB: fix include, checkpatch linewrap]
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    gdbstub/gdbstub.c | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>>> index 6023c80d25..def0b7e877 100644
>>> --- a/gdbstub/gdbstub.c
>>> +++ b/gdbstub/gdbstub.c
>>> @@ -28,6 +28,7 @@
>>>    #include "qemu/cutils.h"
>>>    #include "qemu/module.h"
>>>    #include "qemu/error-report.h"
>>> +#include "qemu/target-info.h"
>>>    #include "trace.h"
>>>    #include "exec/gdbstub.h"
>>>    #include "gdbstub/commands.h"
>>> @@ -1597,6 +1598,18 @@ static void handle_query_threads(GArray *params, void *user_ctx)
>>>        gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
>>>    }
>>>    +static void handle_query_gdb_server_version(GArray *params, void
>>> *user_ctx)
>>> +{
>>> +#if defined(CONFIG_USER_ONLY)
>>> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-%s;version:%s;",
>>> +                    target_name(), QEMU_VERSION);
>>> +#else
>>> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-system-%s;version:%s;",
>>> +                    target_name(), QEMU_VERSION);
>>> +#endif
>>
>> I sugguest passing "qemu" as the name property.
>>
>> I guess LLDB developers chose to explicitly have the key-value pair
>> syntax so that users can have one unified logic for parsing and avoid
>> the mess of HTTP's User-Agent; there is a proposal for Web that
>> introduces key-value pairs in a similar manner:
>> https://developer.chrome.com/docs/privacy-security/user-agent-client-hints
>>
>> If we embed more information like to the name property, users will
>> need to have an additional logic to know if it's QEMU or to know other
>> information. Instead, we can emit:
>> name:qemu;version:10.0.50;
>>
>> and we can use something like follows if we want to tell more:
>> name:qemu;version:10.0.50;qemu-mode:system;qemu-target:hexagon;
> 
> I think we are getting into bike shedding territory here. GDB does need
> a decent way to communicate about supported targets and when it comes up
> with one we shall implement it. But I don't think we need to give too
> much thought to this custom response for now.
> 

My suggestion is to pass just "qemu" as the name. The example with 
"qemu-mode" and "qemu-target" is a demonstration of how additional 
information should be provided, and I don't think we need to provide the 
mode and target information now. We can think of details when adding 
such information.

Regards,
Akihiko Odaki
