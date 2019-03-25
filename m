Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3903748wrx;
        Mon, 25 Mar 2019 07:07:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQaw3uyfvDdF/LCoJd2GtbU2eKtOlGvyI4JVybGn93UbWKcufK0cHEh9Wgq+sswqSz5/LI
X-Received: by 2002:a37:4f04:: with SMTP id d4mr994571qkb.38.1553522864861;
        Mon, 25 Mar 2019 07:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553522864; cv=none;
        d=google.com; s=arc-20160816;
        b=cxCJpUDrcxu85OYCfzZKDmhnukz4c2VANy2P17iwcOaT163yCjtPHxpr923AnoFzXU
         gZrPS6kzQK9vSriuEo2fr0UY/O8+Tr7Xbqi7fuGHwNJ9jyc35bkd3WN5P6zy7L7d5veT
         lB8iXDgaeeyrFkQQiVJAFunFrLXSh+dogCOefmjoqmHav+vemSX/TFLGo6ubhlF2DVzf
         xnyK/5brqnfB9l32jLgJeAIFCEjvz48k1jBLDQkmO2X5QZw2S+0XNOfSAbWWnJV5mgBR
         gUShZB2QagTOMjBZoNF/XeNxPt9kVIXJFqRG6EhqsrNh7UPfN6OBGpMgZwCYDwMygFe4
         bT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YEo+rYYaNqMslSIcXczWUMzIQsmf7Pzqa1kKD8t6grA=;
        b=z9fAs1f+vQv4p1xbtUz99crSU9/pNkX9yrlrWc6w7nMU+6BNcEdg9kfP8l3umIK5UE
         x9pP3MnDGmmKKPe4MGdRCURBlK/oMk2AGKP46R064BqT8dcMrO8NUwgOTgT3v52hGLRw
         fsavaz5BX5ew0PoYZVVvyh1GELZ10d9hEZ3vNVGP0lT1GgZsjKlVm7AZjsXiplaU8+IJ
         2hDGc9ebemWvw42RFaF4TWEjNS1mJ8z0n8VnQjCRq3CrQZt0g1ed85z5lNtA1waOaLGG
         4VS9P8pN6EVDkEIDu9vOpzDokEowQFtYlSSJGSp9wwQp4ABfxl1fxeGujMczgpF0EYDV
         12dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j1si1415934qkl.174.2019.03.25.07.07.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 07:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A348764B;
	Mon, 25 Mar 2019 14:07:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-188.rdu2.redhat.com [10.10.120.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0A671001E69;
	Mon, 25 Mar 2019 14:07:31 +0000 (UTC)
Subject: Re: [RFC PATCH] hw/arm/virt: use variable size of flash device to
 save memory
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Zheng <zhengxiang9@huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wanghaibin.wang@huawei.com, Heyi Guo <guoheyi@huawei.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
 <CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c3222303-4a88-c53d-e027-c534098cfe37@redhat.com>
Date: Mon, 25 Mar 2019 15:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 25 Mar 2019 14:07:44 +0000 (UTC)
X-TUID: SRItmg5Ze9D+

On 03/25/19 14:11, Peter Maydell wrote:
> On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
>> using persistent UEFI variables on QEMU. Actually we only use a very
>> small part of the memory while the rest significant large part of
>> memory is wasted.
>>
>> This patch creates and maps a variable size of flash device instead of
>> a mandatory 64MB one to save memory.
>>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>
>> This patch might be insufficient since it also needs to modify the flash size
>> in ACPI and DTB.
>>
>> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
>> in size when using -pflash.
> 
> I don't think we should do this. The board should in general
> create the same hardware visible to the guest, not change
> it based on subtle things like the size of the image files.

I consider this question/behavior board-specific.

For the "virt" board, I agree with you (Peter), simply because that's
how the "virt" board has always worked.

(See also the tangentially related series

  [Qemu-devel] [PATCH v8 0/2]
  pflash: Require backend size to match device, improve errors

at

  http://mid.mail-archive.com/20190319163551.32499-1-armbru@redhat.com

. This series still lets each board decide the question for itself, but
it improves error detection and reporting.)

Thanks,
Laszlo

> The reason why the flash images must be 64MB in size
> when using -pflash is that they are the backing store
> for a writable device. Suppose you have 1MB of data in your
> backing image that you pass to QEMU and then the guest writes
> to the last block of the flash device. The new data
> written by the guest to the end of the device has to be
> stored somewhere, so the file has to be large enough
> to cover the whole of the flash area.
> 
> thanks
> -- PMM
> 
