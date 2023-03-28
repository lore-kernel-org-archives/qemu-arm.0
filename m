Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2517908ejb;
        Tue, 28 Mar 2023 02:53:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2LGpj98cSSl2Aeao2ol8lDNQy1JHECT4UkaWH26k5iSZAYpLAROhNanVzMqblFIR3WRZa
X-Received: by 2002:a05:6214:d05:b0:5ca:6c32:f35 with SMTP id 5-20020a0562140d0500b005ca6c320f35mr23175191qvh.39.1679997237133;
        Tue, 28 Mar 2023 02:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679997237; cv=none;
        d=google.com; s=arc-20160816;
        b=zWikSps/HZIlG9GHOB5gBMAH+XgmBPu9q4QaS5I4oike9zzKPRcWXrD0yTM4i5a5Bc
         HGU3DDpCOej3nHtueJj3iNORgwcCNo2jECU/mko3k19sNNYcfbhBl25YHxvv5K4I5vNX
         yJxGxcn+WVoBQYXqJcYYIWMYsGHXtVMJuRDjFXyMuQxh4lcQCAnPwQn8nMtOYkPyDc++
         W45KWr8FPxXDrOvcqqrtBrm+obJiFUtoMwvBvFtWzoZkmRN5kzYUCcb+YsgGiwdO2ch5
         kV38g4hPUkvsws4FYU5/1T8t5iv30+rqb73YHGuV5FqADI6Bq0NEXu1C2nQvIN1g/2iW
         RegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=1FcOmAqGKl0iCiph5dgwKVEWQCxxQ7Ncw3d2Y7DSN3I=;
        b=Wu+8/F29vjGKGu3Poqp81Dcc0wfkMSQSzp5d+PAW1jKE6YELzon3vbFwLND+rk5ufx
         cAy6o3k9PWPa4X96T/cyNrdmAERvgTDP1rBgOSnG+SFaqO7OeJISlNGT/a7ZEt9woz+F
         Dytyv4XDuoaPVt9RUfVr99HwsSPX725gcDAWwY/7aZQ9eOOMyGocCGva36S7NkvErAIt
         azr6sSH9K3PbiiJcyho0wvaJMooGDv+QZnc74wZxyHrtNZTjVLoCHmVpq67OcHsW7n/M
         XcEI4Ag7S5zsBRqOk42lDl7xwiyFgzJEKzZnn++ic6I/0k33MKSe5HQA5p8Q5Cd4Fj4v
         K/kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bc7wrmKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05620a0d8400b00720354ad796si21475340qkl.277.2023.03.28.02.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 02:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bc7wrmKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ph61R-0005pD-9m; Tue, 28 Mar 2023 05:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph61P-0005ou-2k
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 05:53:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ph61M-0003bn-JT
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 05:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679997219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FcOmAqGKl0iCiph5dgwKVEWQCxxQ7Ncw3d2Y7DSN3I=;
 b=Bc7wrmKF6WoHWPHMQF2yAmujfXqX9rQ80FRf1d/5JT45n4V0dUvUKkKmsIvrB33/4+plJZ
 zj089J43xKg+Bot2v23r22xYxQ1Y2T0c8fBZQ+F900AL6nxqJ/nTV4u+SGaxgHDGNoQPio
 Z9BDbbdGYqMYfat4q1i5Mzhxng+Lxyw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-LXyk8IgJMTeJ2H1FOE73GA-1; Tue, 28 Mar 2023 05:53:34 -0400
X-MC-Unique: LXyk8IgJMTeJ2H1FOE73GA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5ABD884621;
 Tue, 28 Mar 2023 09:53:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5681415139;
 Tue, 28 Mar 2023 09:53:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58A4521E6926; Tue, 28 Mar 2023 11:53:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com>
 <87zg7x2wca.fsf@pond.sub.org>
 <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com>
Date: Tue, 28 Mar 2023 11:53:32 +0200
In-Reply-To: <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 28 Mar 2023 06:34:28 -0300")
Message-ID: <87v8il19sz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +54DJX2KdJRk

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 3/28/23 04:01, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>>> At this moment, arm_load_dtb() can free machine->fdt when
>>> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
>>> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
>>> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
>>> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
>>> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>>>
>>> After the command 'dumpdtb' were introduced a couple of releases ago,
>>> running it with any ARM machine that uses arm_load_dtb() will crash
>>> QEMU.
>>>
>>> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
>>> of freeing 'fdt', assign it back to ms->fdt.
>>>
>>> Note that all current callers (sbsa-ref.c, virt.c, xlnx-versal-virt.c)
>>> are assigning ms->fdt before arm_load_dtb() is called, regardless of
>>> whether the user is inputting an external FDT via '-dtb'. To avoid
>>> leaking the board FDT if '-dtb' is used (since we're assigning ms->fdt
>>> in the end), free ms->fdt before load_device_tree().
>>>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: qemu-arm@nongnu.org
>>> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
>>> Reported-by: Markus Armbruster <armbru@redhat.com>i
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/arm/boot.c | 10 +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>> index 50e5141116..de18c0a969 100644
>>> --- a/hw/arm/boot.c
>>> +++ b/hw/arm/boot.c
>>> @@ -549,6 +549,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>               goto fail;
>>>           }
>>>   
>>> +        /*
>>> +         * If we're here we won't be using the ms->fdt from the board.
>>> +         * We'll assign a new ms->fdt at the end, so free it now to
>>> +         * avoid leaking the board FDT.
>>> +         */
>>> +        g_free(ms->fdt);
>>> +
>> 
>> "We will" is not true: we will not if we goto fail.  Leaves ms->fdt
>> dangling, doesn't it?
>
> We can postpone this g_free() to execute after "if (!fdt) {}" to be sure that we're
> not freeing ms->fdt right before 'goto fail'.

Yes, but what about all the goto fail further down?

>>>           fdt = load_device_tree(filename, &size);
>>>           if (!fdt) {
>>>               fprintf(stderr, "Couldn't open dtb file %s\n", filename);
>>                 g_free(filename);
>>                 goto fail;
>>             }
>>             g_free(filename);
>>         } else {
>>             fdt = binfo->get_dtb(binfo, &size);
>>             if (!fdt) {
>>                 fprintf(stderr, "Board was unable to create a dtb blob\n");
>>                 goto fail;
>>             }
>> 
>> If we succeed, we'll assign @fdt to ms->fdt (next hunk).  Won't this
>> leak old ms->fdt?
>
>
> For all callers binfo->get_dtb() is returning ms->fdt, i.e. this line:
>
>               fdt = binfo->get_dtb(binfo, &size);
>
> Is equal to this:
>
>               fdt = ms->fdt;
>
> And this is why we can't unconditionally do a g_free(ms->fdt).

Uff.  Not exactly obvious.

> I believe we can improve the ARM boot code to not create ms->fdt at init(),
> leaving it unassigned, and make get_dtb() return the machine FDT on a common
> "void *" pointer. That would spare us from having go g_free(ms->fdt) to avoid
> leaks and we would assign ms->fdt at the end of arm_load_dtb() normally. I made
> a quick attempt at that but the ARM init() code is a little tricker than I've
> anticipated. I might have a crack at it later.

Do we want a quick interim fix for 8.0?

Have a careful look at the untested patch below.

> Thanks,
>
> Daniel
>
>
>> 
>>         }
>> 
>>> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>>                                          rom_ptr_for_as(as, addr, size));
>>>   
>>> -    g_free(fdt);
>>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>>> +    ms->fdt = fdt;
>>>   
>>>       return size;
>> 

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 50e5141116..54f6a3e0b3 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    if (fdt != ms->fdt) {
+        g_free(ms->fdt);
+        ms->fdt = fdt;
+    }
 
     return size;
 

