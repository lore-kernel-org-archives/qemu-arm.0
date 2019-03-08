Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8254083wrx;
        Fri, 8 Mar 2019 03:29:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnJ9gM6vCqb5ciEiQ1aOETnSuDaNux+RFPsCldLYfuZFg1E99MbN59mtN0xswo9hOOfxKx
X-Received: by 2002:a25:af8a:: with SMTP id g10mr15658096ybh.486.1552044596014;
        Fri, 08 Mar 2019 03:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552044596; cv=none;
        d=google.com; s=arc-20160816;
        b=Tziuup8cePqlXPhg0/19ptoA+taZL9NTZlFRIn+pojAO4MmBABfM9YZSipbR5cPpj/
         BuWiVqC/CZ6jYIQ6gRdCGg5ZVtfOgOcxIyorFjRoByQLYPk4xIzQUj0/sWKLCreDFwN7
         Zh3C2xahhxPZEfntl5SjK1r/tQYyD3890X7fhCvKEUkHuMW+8REmgPrEA1y35SPGH5HK
         LdtXwOUeWGf8K0Oz0PWWGFxV6YdapBkhcUC6WknLjB7c+jDvIOGtgG1zkc1HkK1fHSfF
         2pgpIYc4LTyIC8217H4RJgTgzBcoHdZKlbpajqFZ6mNVZLcjsxW+LstxW81AFxaL8a57
         QHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=zxpgYseq4VglVQPsfcY5mCntzPiIvlx6E7zd+2Md0qk=;
        b=RW46eye7SZv6W7P3Alf2OJZDuDArX+BNKrYQdTOeZa+1VkCCzB4dMqGCK7FIJnwWZy
         9N7PiOT8dMzZyZzk5Vrgf6S1pVhT6bEWvvDZ/5I8mIjBxeKZxYJDB7fhInyad8Pj2YA4
         p0rOF2mxMJttyKQJWTj1YlQFNwS4LW/uRX02iBsZtEDJv4FItN1gTYzovXerF7vbQjc1
         ve37K1ez5UHyP0a8KDiIQam2658cw22036Qzo/bYLvaw9jMOXTej+yEKg1D7ZcaU0VIH
         q6ZTe8vGoPQgRiTC6/tRl4DPA7EaNyIcHGpnRvRmmwPVkAdvqqfPTD82F/sQc5N2uutY
         BbMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y70si4298268ywa.70.2019.03.08.03.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2DhI-0002Vk-Pi
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2Dgy-0002Lb-TB
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2Dgx-0000FI-TJ
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:29:32 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2Dgx-0008Sl-N9
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:29:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id e74so12201632wmg.3
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 03:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zxpgYseq4VglVQPsfcY5mCntzPiIvlx6E7zd+2Md0qk=;
	b=Sj7zvgkxXrVwb4XVk4XxsiIOwQX2JE1UTgbl1tynwe+Q3gp7dNy1p7mvFDQJU0vhrm
	zSk6U4nVNL9LHezWJAIwUNjhWazTC7rLjP4X0V9MXwt+83fG6yCVrq5L+1EEs70+g01F
	Y7sod8oexXLHoZDm7wpbW3e5D7aNoK4KR35ix9USV6ETlXZa3mKqpKK88jPc7xKmjGFE
	3XK8hIwTGEvQ4BBTDuGIP+BKwLRqkmtdb1VcY63TZNJSttpTN84YaDhz5kMAtI+N6+gN
	faNWYISjBrbriL56/n53ywoK0GrptcOYEP6mZIdlI0X1uWcRWif5AFMlPG41cJ+GYEZL
	Au/A==
X-Gm-Message-State: APjAAAV0rVkUsyqk0wSNf4J5SL/hQd1cNmbnldsJO1JAu6/cOSJvbq2O
	O/2GGCvQw/BjKJPgyqKKgi8uTg==
X-Received: by 2002:a1c:be01:: with SMTP id o1mr8799546wmf.60.1552044568527;
	Fri, 08 Mar 2019 03:29:28 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	132sm9947300wmd.30.2019.03.08.03.29.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 03:29:27 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-11-philmd@redhat.com>
	<40a49a86-3010-da90-41f3-0f4a1705bca0@redhat.com>
	<ad4255d0-455b-d850-9c10-4839c1bbbf34@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9dc406df-6c19-efd9-f74c-9a1263dc78dc@redhat.com>
Date: Fri, 8 Mar 2019 12:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ad4255d0-455b-d850-9c10-4839c1bbbf34@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v2 10/18] hw/nvram/fw_cfg: Add reboot_timeout
 to FWCfgState
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9/5fdd1B5ia

On 3/8/19 12:22 PM, Philippe Mathieu-Daudé wrote:
> On 3/8/19 12:04 PM, Laszlo Ersek wrote:
>> Hi Phil,
>>
>> On 03/08/19 02:32, Philippe Mathieu-Daudé wrote:
>>> Due to the contract interface of fw_cfg_add_file(), the
>>> 'reboot_timeout' data has to be valid for the lifetime of the
>>> FwCfg object. For this reason it is copied on the heap with
>>> memdup().
>>>
>>> The object state, 'FWCfgState', is also meant to be valid during the
>>> lifetime of the object.
>>> Move the 'reboot_timeout' in FWCfgState to achieve the same purpose.
>>> Doing so we avoid a memory leak.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/nvram/fw_cfg.c         | 4 +++-
>>>  include/hw/nvram/fw_cfg.h | 2 ++
>>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> Currently, there is no memory leak. Right now, the leak is theoretical,
>> and it would depend on the fw_cfg object being actually destroyed.
> 
> Actually my first motivation came while using valgrind, there are a
> bunch of warnings related to the fw_cfg device.
> This device is not hotpluggable however, and we don't test it in the
> device-introspect-test.

IOW this device makes finding memory leaks in other introspectable
devices harder.

>> I think armoring the fw_cfg implementation for such lifetime actions is
>> valuable. But, that definitely belongs to its own series, in my opinion.
>>
>> In the "hw/nvram/fw_cfg.c" file, I count:
>>
>> (a) two "specific purpose" g_memdup() calls, namely in
>> fw_cfg_bootsplash() and in fw_cfg_reboot();
>>
>> (b) one "generic purpose" g_memdup() call, namely in fw_cfg_add_string();
>>
>> (c) two "generic purpose" g_malloc() calls, namely in fw_cfg_add_i16(),
>> fw_cfg_add_i32(), and fw_cfg_add_i64(). (The one in fw_cfg_modify_i16()
>> does not matter here because the previous blob is freed in that function.)
>>
>> Your series deals with (a), namely with fw_cfg_reboot() in this patch,
>> and with fw_cfg_bootsplash() in the next one.
>>
>> Your series deals with neither (b) nor (c). The
> 
> I did a PoC of (b) and (c) but it is a more invasive patchset indeed.
> 
>> fw_cfg_add_(string|i16|i32|i64) functions are called from a bunch of
>> places however, so if we really intend *not* to leak those copies upon
>> fw_cfg destruction, then we'll have to track all of them dynamically, in
>> a list for example.
> 
> I haven't think of using a list.
> 
>> (And that necessitates a separate series for this topic even more.)
> 
> OK.
> 
>> In turn, once we add dynamic tracking, for those blobs that the
>> fw_cfg_add_(string|i16|i32|i64) functions allocate internally -- as they
>> are advertized to do --, then we might as well use the same tracking
>> infrastructure for (a). In other words, it should not be necessary to
>> add the specific fields "reboot_timeout" and "boot_splash" to FWCfgState.
> 
> OK, I'll drop these patches from this series.
> 
>>
>> Thanks,
>> Laszlo
>>
>>>
>>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>>> index b73a591eff..182d27f59a 100644
>>> --- a/hw/nvram/fw_cfg.c
>>> +++ b/hw/nvram/fw_cfg.c
>>> @@ -250,7 +250,9 @@ static void fw_cfg_reboot(FWCfgState *s)
>>>          }
>>>      }
>>>  
>>> -    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_val, 4), 4);
>>> +    s->reboot_timeout = rt_val;
>>> +    fw_cfg_add_file(s, "etc/boot-fail-wait",
>>> +                    &s->reboot_timeout, sizeof(s->reboot_timeout));
>>>  }
>>>  
>>>  static void fw_cfg_write(FWCfgState *s, uint8_t value)
>>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>>> index 828ad9dedc..99f6fafcaa 100644
>>> --- a/include/hw/nvram/fw_cfg.h
>>> +++ b/include/hw/nvram/fw_cfg.h
>>> @@ -53,6 +53,8 @@ struct FWCfgState {
>>>      dma_addr_t dma_addr;
>>>      AddressSpace *dma_as;
>>>      MemoryRegion dma_iomem;
>>> +
>>> +    uint32_t reboot_timeout;
>>>  };
>>>  
>>>  struct FWCfgIoState {
>>>
>>
