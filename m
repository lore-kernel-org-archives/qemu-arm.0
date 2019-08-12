Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp307080wrs;
        Mon, 12 Aug 2019 02:06:48 -0700 (PDT)
X-Received: by 2002:a7b:c632:: with SMTP id p18mr27081221wmk.114.1565600808925;
        Mon, 12 Aug 2019 02:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565600808; cv=none;
        d=google.com; s=arc-20160816;
        b=xIg5HUrfE1z0jG28Mq8sfRPbjioOM+z/CDql6BixqAgEpJ270DqanfnxddBsjH54Q8
         mbi/0XcgWraYi4BcjM55MaRDcJOamDEdkyTrO1lO6bCySVd6S9H+YvH+PgScgQpBco28
         TrPFtgM8/vNa2PsNwsC8wpBo2LCpDRf+R17mKcO6CgfU/6m30pR3j+qjhXUiP5xaw7lR
         /a5QYc0j6MMlfq9CWPOahE4tSMCYlYFd0HRzaUGV2+UBLBfS7RiJRB6bXneqabwTG8R/
         tN5yenxvZ9tD+r3PDY4kAbQcDzQ7izgzbRZ7kF+BDmRbp8Gux/YMcQSSnziVKNu2hCcG
         1KWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject;
        bh=wKqdeSy5cdJsAd0+kNh6JU5posSCQfpFR60EsLy/x8Q=;
        b=akQEP7W5QxwWCmPuPfXLMK0k448alWbuhcbsNM2Oekz7QnsSHVIWjRKmCzvSvYrBL+
         61Pv+TunZOIrLR4z1r/MyTgOsuh7mMg+hFLpcoioH/X4sdU3jGSPzCaBstvSGtv5xjUC
         XhgSorGJXshdthuFIN9DHOkZd9MsBeIP1mQoloXurmtSl2e3riQChNYbMAydXEwRClcn
         ZOhfYgl9VOsDi8o8yKMuRiedO237oWXlO7eHtm2pLc0LbM0wAgm+01qGJGQwEvZuJRJr
         gXSh/v6IOI9amjjUktJpT7aARSzY+XbfuJuwuoAjOt71zIEUjkFE1jRZ6t8ZEzOi+eQm
         Byyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n10sor10397510wrm.42.2019.08.12.02.06.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2019 02:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wKqdeSy5cdJsAd0+kNh6JU5posSCQfpFR60EsLy/x8Q=;
        b=l3ajxFBwTNnux95PDrHDjuVwzQPUhPC61EWd0wpibrIQEsqt6pP/7yhNkmkiZxRmlb
         BF8UEU8I2rf7pI9pPPCC9K1bv6GhDXBEJdNZPBXgzOak6t7GeUaIlcl113qq5Vi3JPs1
         p5rdsVIW16VM6QcYOxG6iuU5Pv/swff+aBtMMHL0O5OmUHe7lbXb86BK4CaBsxpo8gPs
         akRxoVVTwz3pGGoNh7kQDVH1wsLg0Jz1uVwjM8/R/QjrA8h7WjsK3eftWpLoVo9FeDJL
         UOrL99LXfb8w/anDq9TzGwxcGt5msdpQW7YBXDp3qoIwyDFcwGoRKPSmZyi0HViuufkM
         Nahg==
X-Gm-Message-State: APjAAAU1WdDVJbG1cDMCzmkoBTNIXL+B0E9u5B9VTtpYPe8rDbKRa8ci
	cz904LpKzjqP97rGHgtcN+GjIw==
X-Google-Smtp-Source: APXvYqwAZ+N+qMbIdr3nvwt3VQkXcX5P+GGUcqUBOg7s/jBWCpBwPlYvraK2v9gE7Ba5T17EOCFFSA==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr30281115wrq.276.1565600808708;
        Mon, 12 Aug 2019 02:06:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (225.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.225])
        by smtp.gmail.com with ESMTPSA id e10sm27592952wrn.33.2019.08.12.02.06.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 02:06:48 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Support disabling TCG on ARM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Jones <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, Thomas Huth <thuth@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
 <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
 <07662a67-b4cf-e681-fffa-98a03a26e0fb@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f410698e-7f8f-f81b-50f7-40b401d76ac1@redhat.com>
Date: Mon, 12 Aug 2019 11:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <07662a67-b4cf-e681-fffa-98a03a26e0fb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eDsAVYBAjjp3

On 8/9/19 10:22 PM, Philippe Mathieu-Daudé wrote:
> Hi Peter, Paolo, Alex, Thomas :)
> 
> On 7/2/19 4:08 PM, Peter Maydell wrote:
>> On Mon, 1 Jul 2019 at 20:49, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> [...]
>>> $ git backport-diff -u v3 -r target-arm.next..v4
>>> Key:
>>> [----] : patches are identical
>>> [####] : number of functional differences between upstream/downstream patch
>>> [down] : patch is downstream-only
>>> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
>>>
> [skipping patches already applied...]
> 
>>> 004/8:[----] [--] 'RFC target/arm: Restrict pre-ARMv7 cpus to TCG'
>>> 005/8:[----] [--] 'RFC target/arm: Do not build pre-ARMv7 cpus when using KVM'
>>> 006/8:[----] [--] 'RFC target/arm: Restrict R and M profiles to TCG'
>>> 007/8:[----] [--] 'RFC target/arm: Do not build A/M-profile cpus when using KVM'
>>> 008/8:[----] [--] 'target/arm: Do not build TCG objects when TCG is off'
>>
>> I'm going to apply patches 1 and 2 to target-arm.next for rc0 (since
>> 2 is helpful to redhat downstream and taking 1 now reduces the
>> amount of code-movement patches you'll need to rebase). Patch 3
>> doesn't compile and 4-8 are rfc.
> 
> The remaining patches can be applied without conflict, so no need to
> respin (yet) IMO.
> 
> Paolo/Thomas, do you mind reviewing patches 5 and 7? They are kconfig
> related.
> 
> Peter/Alex, do you mind reviewing patches 4 and 6 first, then 5 and 7 (5
> and 7 can wait for Paolo/Thomas' review first).

Patches 4/6 were tagged 'RFC' for late 4.1 inclusion, so can be
considered normal patches once 4.2 dev cycle opens.
