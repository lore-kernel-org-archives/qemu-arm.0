Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp203901lfg;
        Tue, 23 Feb 2021 03:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlgjCTfVgenrXEQBq4JvkHmoH6klOyA+BVW2fLuGXDftoDoRevRZB5XAnguE05Zt0fHgXZ
X-Received: by 2002:a6b:e002:: with SMTP id z2mr4654269iog.80.1614079445443;
        Tue, 23 Feb 2021 03:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614079445; cv=none;
        d=google.com; s=arc-20160816;
        b=LOPJ9Rrcu/6LSW1SVCs6TIzLQuDoHfGvlZfHRXlmHMEn/pES1jAQwZZt9awvf0+MLq
         CalIN1hTODLy+26lZQrNUSCpYej391IhvrsSfZvkSPpfaE29/qxpMvfikO9aOO8jh52T
         2OZCvZX8syBHMy3oTSGgdDfqTkWoqc7eUJxsj06SJKpZuIYUS/sGWlJ7xKvCQSMkv6kf
         UW2rB+d75qysDp26xXG+Rj+9MIWWdo71T8sQYOsk5vH1mvQsZO4VM22AKyrCpfFD+nOH
         Sz95XGLqyrYR6lffkm+wNZxs0FcdsyXT4w3y9Hke+jeMfsM0/p+ZVHm6T+vCcwaiQ+hT
         oT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fqXHpRX9rxmTQG166I9+zJJichU2jtp55FS+xZ4AgUs=;
        b=kprjh9cvMJpxYqeJZaDD1Loy335+rEU3frtuD2yt0hl+TMBmVySYT7z07XpC9BgNki
         Jwe8HGXICzGGd2oRsI6+O+qskNjTkgBAgpiQjZU0Lpez4HT2zWYlH2/iNb4Gaw8+6QlD
         7gg3j6lKCSQElULPsXQrx+XNEhtLfV9gxUDqI2kSukME9KvYOF7tMf0xEeVLtnMLyiq5
         sQvTyUxW8ZxOg+RpUampQw2SWTr66cKdPsKHKmF2aVdMHkIBFko85BpEpIucEwj5c4wj
         FwCitfMp/fvFV9ESdQxDU16aUJZurC4tushskAR/qR5MrvZ2d51HpEI8si7OcVdqyZ76
         0lFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V8QhmDZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z84si10241074iof.27.2021.02.23.03.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 03:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V8QhmDZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEVnQ-0005RG-ON
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 06:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVnI-0005R4-Em
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 06:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVnG-00037y-B8
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 06:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614079433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqXHpRX9rxmTQG166I9+zJJichU2jtp55FS+xZ4AgUs=;
 b=V8QhmDZDsPRLyTSyb4mSzCxKqXi6SB/3ZtA3vEAgYj72RrcHSKMloGp1O/D+O/1K0AZYA8
 ykrjqbI4m8gTMx4W27z0OYgH9aWKxasnAaz4xYCibOUsu3UfUFpMegSNr176l+uKpb22Kz
 gRIwQhoCchkCDgLIxfuvUXgqZvz4tFg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598--Rn9Arc5MGG04eHl0SPO4g-1; Tue, 23 Feb 2021 06:23:50 -0500
X-MC-Unique: -Rn9Arc5MGG04eHl0SPO4g-1
Received: by mail-wr1-f70.google.com with SMTP id q5so7193830wrs.20
 for <qemu-arm@nongnu.org>; Tue, 23 Feb 2021 03:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fqXHpRX9rxmTQG166I9+zJJichU2jtp55FS+xZ4AgUs=;
 b=WyjHjTcuTD6/QsXXk79U9AJlN7pR5MoIYhk2V3d4IIUZ2+XdkUTp9GbGnb3fUbLgfO
 ANqsfu1HcCPoDzalvmPFiHouMhhi0nxg43yLoZU1GBSAILKqsRp6m8NeKE4zHzMmXcP6
 251TUaGIBWU5TX1jVrRlZrT9PMOMRE8ETdlNsLP5ZsCsdAYJ48QuciLePoNy2ZHr7vMe
 XV5vPZlumgsRFC49Mem0Reh1VjQI7agU9Oaev66WCmv3UkKUKwzu7VnwmrMPTrl1G2m0
 N7NKjCdSInjVldcqnMv9el2Fu/HZlS5E3sM/17xs89mMhI3POaBrXvt2joRWpwb9BQJM
 FNCw==
X-Gm-Message-State: AOAM532iXjl3MkYtp1nS3a/zMGKtq7SFY+FpKBrcPnXaft5HIFuLor/h
 abaPEVqS/dxw+poyvzdp158EGmV3HB8xe/2Ps8ofDBOK5nIwcZ50hatxUZewNLQ4u2g2PjhI5gK
 0kDmicLSkpZOq
X-Received: by 2002:adf:e444:: with SMTP id t4mr15063432wrm.97.1614079429564; 
 Tue, 23 Feb 2021 03:23:49 -0800 (PST)
X-Received: by 2002:adf:e444:: with SMTP id t4mr15063387wrm.97.1614079429294; 
 Tue, 23 Feb 2021 03:23:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm4521531wrt.68.2021.02.23.03.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:23:48 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
 <YDQ/Y1KozPSyNGjo@yekko.fritz.box> <YDRAHW1ds1eh0Lav@yekko.fritz.box>
 <20210223113634.6626c8f8.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98ed9478-240d-cd20-ac84-82c540bd3e21@redhat.com>
Date: Tue, 23 Feb 2021 12:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223113634.6626c8f8.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+g6T10wXFWO

On 2/23/21 11:36 AM, Cornelia Huck wrote:
> On Tue, 23 Feb 2021 10:37:01 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
>>> On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote:  
>>>> On Mon, 22 Feb 2021 18:41:07 +0100
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>   
>>>>> On 2/22/21 6:24 PM, Cornelia Huck wrote:  
>>>>>> On Fri, 19 Feb 2021 18:38:37 +0100
>>>>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>     
>>>>>>> MachineClass::kvm_type() can return -1 on failure.
>>>>>>> Document it, and add a check in kvm_init().
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>> ---
>>>>>>>  include/hw/boards.h | 3 ++-
>>>>>>>  accel/kvm/kvm-all.c | 6 ++++++
>>>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>>> index a46dfe5d1a6..68d3d10f6b0 100644
>>>>>>> --- a/include/hw/boards.h
>>>>>>> +++ b/include/hw/boards.h
>>>>>>> @@ -127,7 +127,8 @@ typedef struct {
>>>>>>>   *    implement and a stub device is required.
>>>>>>>   * @kvm_type:
>>>>>>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>>>>>> - *    computed based on other criteria such as the host kernel capabilities.
>>>>>>> + *    computed based on other criteria such as the host kernel capabilities
>>>>>>> + *    (which can't be negative), or -1 on error.
>>>>>>>   * @numa_mem_supported:
>>>>>>>   *    true if '--numa node.mem' option is supported and false otherwise
>>>>>>>   * @smp_parse:
>>>>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>>>>> index 84c943fcdb2..b069938d881 100644
>>>>>>> --- a/accel/kvm/kvm-all.c
>>>>>>> +++ b/accel/kvm/kvm-all.c
>>>>>>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>>>>>>                                                              "kvm-type",
>>>>>>>                                                              &error_abort);
>>>>>>>          type = mc->kvm_type(ms, kvm_type);
>>>>>>> +        if (type < 0) {
>>>>>>> +            ret = -EINVAL;
>>>>>>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>>>>>>> +                    mc->name);
>>>>>>> +            goto err;
>>>>>>> +        }
>>>>>>>      }
>>>>>>>  
>>>>>>>      do {    
>>>>>>
>>>>>> No objection to this patch; but I'm wondering why some non-pseries
>>>>>> machines implement the kvm_type callback, when I see the kvm-type
>>>>>> property only for pseries? Am I holding my git grep wrong?    
>>>>>
>>>>> Can it be what David commented here?
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
>>>>>   
>>>>
>>>> Ok, I might be confused about the other ppc machines; but I'm wondering
>>>> about the kvm_type callback for mips and arm/virt. Maybe I'm just
>>>> confused by the whole mechanism?  
>>>
>>> For ppc at least, not sure about in general, pseries is the only
>>> machine type that can possibly work under more than one KVM flavour
>>> (HV or PR).  So, it's the only one where it's actually useful to be
>>> able to configure this.  
>>
>> Wait... I'm not sure that's true.  At least theoretically, some of the
>> Book3E platforms could work with either PR or the Book3E specific
>> KVM.  Not sure if KVM PR supports all the BookE instructions it would
>> need to in practice.
>>
>> Possibly pseries is just the platform where there's been enough people
>> interested in setting the KVM flavour so far.
> 
> If I'm not utterly confused by the code, it seems the pseries machines
> are the only ones where you can actually get to an invocation of
> ->kvm_type(): You need to have a 'kvm-type' machine property, and
> AFAICS only the pseries machine has that.

OMG you are right... This changed in commit f2ce39b4f06
("vl: make qemu_get_machine_opts static"):

@@ -2069,13 +2068,11 @@ static int kvm_init(MachineState *ms)
     }
     s->as = g_new0(struct KVMAs, s->nr_as);

-    kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
-    if (mc->kvm_type) {
+    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
+        g_autofree char *kvm_type =
object_property_get_str(OBJECT(current_machine),
+                                                            "kvm-type",
+                                                            &error_abort);
         type = mc->kvm_type(ms, kvm_type);
-    } else if (kvm_type) {
-        ret = -EINVAL;
-        fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
-        goto err;
     }

Paolo, is that expected?

So these callbacks are dead code:
hw/arm/virt.c:2585:    mc->kvm_type = virt_kvm_type;
hw/mips/loongson3_virt.c:625:    mc->kvm_type = mips_kvm_type;
hw/ppc/mac_newworld.c:598:    mc->kvm_type = core99_kvm_type;
hw/ppc/mac_oldworld.c:447:    mc->kvm_type = heathrow_kvm_type;

> 
> (Or is something hiding behind some macro magic?)
> 

