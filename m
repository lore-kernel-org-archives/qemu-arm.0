Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4546062ejc;
        Wed, 18 Oct 2023 03:55:05 -0700 (PDT)
X-Received: by 2002:a05:6512:4016:b0:507:a6f8:b373 with SMTP id br22-20020a056512401600b00507a6f8b373mr4831502lfb.54.1697626505689;
        Wed, 18 Oct 2023 03:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697626505; cv=none;
        d=google.com; s=arc-20160816;
        b=OCIq8LoU2AmdbGS/Pin67imkrNSlUsIiJ2yz4C4evwNJbw7JSS3sysXkTNCe4fM5eX
         jXED/KfjJRgAktPLRTSdsuHyud71EKt3ZAy4tudIc49nlyJb/l6/Ifp491eS+itTQBW9
         e8kgyKHlPkaD9+EsV38Aq7Dpd6WEzBjgG7bOI7cOwpChP2whP/uHEpwOg3vyc8uq1X80
         rRffDzHzuETsmBYjKHjRriX3xfUKVstT/AwR6F1gBE+g1uiMs7J18sKHk3gr9IwmuMmJ
         I4DSDrO0rkqvXTAuLwGBz2wOuEpzbNArqAz6YnftU7hDshi5wFRG78010pgic5EKhsD/
         +Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=gJAq6wjCN/0A5JHDD/JJKaiB8GPeRFQcLAeqWJFUKAI=;
        fh=/5ZtQHYkpIXxL3VkMeHz5IUTCJ7ezmKosDWiVPD8a94=;
        b=mQbN71UZCJhhk0LG16MAUTZiaEWFr5CMDw0AlDToHxK9cWxOq0FQEpAM2e+tyOWiDg
         QJTBdRpxnTD9AN1Yp5OJNVAZEUpG4zDu7MUM0dH4VtO3fQqPTn3w5GDdhY13LoDQ1QBC
         VffMqazrChdi8+62JSq3UBX6kmCjYUKjxVv3h9thKAw2TRUzqKyXQyKAv/Ewao1GVkOA
         5pIeoFgaV8jh0hddzdTdYwqPSLchfYHPqwUqyb/iK9AI4det1KgMoMWhdYOO8hmHSja+
         wAXQ5myFlboA+61UsRPNYxJqDlnQzRKhw2pbbTcZlPT5Np+oIqaqK+goCJVd+v+BRoXi
         wacQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajJYbmTn;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay20-20020a05600c1e1400b0040793bfd113sor1028811wmb.1.2023.10.18.03.55.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Oct 2023 03:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajJYbmTn;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697626505; x=1698231305; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJAq6wjCN/0A5JHDD/JJKaiB8GPeRFQcLAeqWJFUKAI=;
        b=ajJYbmTnRs7uLh2FNzy1trpOvh0QeMYemJoAJHSPJ/lyjCEgQ97BjeW+FrCPabqpVG
         AU1I5ijCNesDN9bEbDpQ301uZD8DuxUwtRl9dgBuBji1VbzPluiLuGiI/iVkGy9fgcw6
         AkX8uerK2KP5BS3/pf/1mPP5U/APL8pgDdNtpoLOTc5jmFiL8KJOTXQQtSrbn4R4JECL
         e0nRgCTZW6JZDlRyf7bWu/ewVzeOUDgxPIhdNTagP8wVY6omAbMcxIlgxu2efK/KuQ/l
         tkyzXgyVj3IPOsxC9JNb5JgPVUyh96xOqC6+17awnzHh1JmtbMd5W/v0YNlknN2VHEjm
         UkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697626505; x=1698231305;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJAq6wjCN/0A5JHDD/JJKaiB8GPeRFQcLAeqWJFUKAI=;
        b=MbHk7kaY5635gX8KewUiRtDEt60kcyNlYI7edAWjnDpteF6L3VnlItykg2X9r8odDF
         Q9SHY3t21OLQ1q9cGGjIF3REo92fYM+zvu+rmffFGDnqL0X4O8P58jetmwxQ+yoVEvMb
         hH6cH12QYBCwshonMCtOBxtvd3mw9ZpPKiuaaCufysWn00FERDGjDLouXqoirKUWNgGa
         72M21PROXgoBSh80vpBxgHfpVYgg7hCxwjkZeuHIucG7yFl/u2QB6cKYtb6uPTdlhglN
         Loy24/4o9Mx0ZtenS6G5uRq0spwC0s/nvujXr5M09jvVtlBah6h3S+1l92vvo6hXbtg8
         Wh4w==
X-Gm-Message-State: AOJu0YydPuHl8EUIt1qwlMGlAbBAczhIPHyQoymVpmTnZOtxjxYNQH0f
	Vf+LqaYfZ/LLdP7syJuytHr4G9U6mvgN8UBNN1F3gw==
X-Google-Smtp-Source: AGHT+IEqfgqsvdYWeYXh8Oh0DeEgOpfCUmxQsfggDViLPnUQHau4gQgeFtDwIKtrfBEy4anEhtw3KQ==
X-Received: by 2002:a05:600c:1f96:b0:3fc:1a6:7764 with SMTP id je22-20020a05600c1f9600b003fc01a67764mr3699351wmb.16.1697626505020;
        Wed, 18 Oct 2023 03:55:05 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-165.37.6.1.tellas.gr. [37.6.1.165])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b004068def185asm1380592wmq.28.2023.10.18.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:55:04 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:51:18 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>, Eric Auger <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Richard Henderson <richard.henderson@linaro.org>, open list:ARM SMMU <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Bcc: 
Subject: Re: [RFC PATCH v2 01/78] include/qemu/compiler.h: replace QEMU_FALLTHROUGH with fallthrough
User-Agent: meli 0.8.2
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org> <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183699.git.manos.pitsidianakis@linaro.org> <871qdsb4qd.fsf@linaro.org>
In-Reply-To: <871qdsb4qd.fsf@linaro.org>
Message-ID: <2q0zq.6gn2tubfhjrk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: xJbFK0qh7OGh

On Wed, 18 Oct 2023 13:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
>> index 3ce5f6507b..bf26fadb06 100644
>> --- a/audio/pwaudio.c
>> +++ b/audio/pwaudio.c
>> @@ -1,29 +1,29 @@
>>  /*
>>   * QEMU PipeWire audio driver
>>   *
>>   * Copyright (c) 2023 Red Hat Inc.
>>   *
>>   * Author: Dorinda Bassey       <dbassey@redhat.com>
>>   *
>>   * SPDX-License-Identifier: GPL-2.0-or-later
>>   */
>>  
>> +#include <spa/param/audio/format-utils.h>
>> +#include <spa/utils/ringbuffer.h>
>> +#include <spa/utils/result.h>
>> +#include <spa/param/props.h>
>>  #include "qemu/osdep.h"
>>  #include "qemu/module.h"
>>  #include "audio.h"
>>  #include <errno.h>
>>  #include "qemu/error-report.h"
>>  #include "qapi/error.h"
>> -#include <spa/param/audio/format-utils.h>
>> -#include <spa/utils/ringbuffer.h>
>> -#include <spa/utils/result.h>
>> -#include <spa/param/props.h>
>
>Was this an autofmt change sneaking in? osdep.h should always be first
>per style.rst.

It should have been mentioned in the commit message and in a code 
comment. libspa throws errors because the preprocessor changes 
`fallthrough` to our macro definition. I do not like the reordering. My 
other thought was to undef fallthrough and re-include "qemu/compiler.h" 
after the libspa includes.


--
Manos
