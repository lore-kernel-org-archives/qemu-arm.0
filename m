Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp871178lfp;
        Tue, 14 Sep 2021 10:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA+zkPaqS+/Z3r5pajinUM3SH91fR3KTLx7A2V3ztJQVVJ3GF/8H361iINwMiwfcVH7yn+
X-Received: by 2002:a05:6402:27c6:: with SMTP id c6mr20257730ede.111.1631638963810;
        Tue, 14 Sep 2021 10:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631638963; cv=none;
        d=google.com; s=arc-20160816;
        b=gYEYtX6wSV/UwJEP7zojhiYZFfQeiMBMu5oBhRL+gvBSUF6vSZjOU6eLe0fAymf5iH
         D5eyHa/c9iqCBfEpGQNplk9jxLlJbEeNpNsdQEy6a5edk4Ww1/Rbpw2yhcHfQIocb3/u
         rKrJFUZHrQbA4aHIv3wSupVmKsf9chO/PfYOjmkFNuWBoSZ8fHbIqKkl80n14Jmzn2m4
         HTwszQymGdM/U47pp28Ddk/JBiJUMsA2fgU69KtHjo2BQysiAGKxdlH2Q7lzAaoCN0Ze
         yNiiymWCTsUK/gmOgcQr1RoqmCm5TjAGPDfLnzB0gS4OxRq6VJ7xy+Bs4FZD1SO+uoic
         2E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kkIDLD9CAOhbVHN5WBQLyfGlMRaq0nuzR36iSZPAuPQ=;
        b=eVhBTaW/Kvyy6wCfXQ9S0nnGXVxRbKIwOA9wy3EDwxznf62dFKYvepV8ueTOXu3rah
         81TMSAxkC7w4guPw03kckxRERkctwzaf+vPmemkdH6rOXnSPQ3Zl3iDkDxP/+EDuUf5h
         it2ukWeqaPA50Jxexo+PVchfexRoq42Sgj2h4tVFH1VTbxvyo5n+0oGBs26+bZrNMvG5
         uPUhOmf1crn2tC4Dqx1flFdsG0sEyjRxCgpPW6wKFsl1uqA8w9YN5DbQcpaGcjI3PZO9
         DENW9wT55DdyJAK7kK7asXy/DkiNQU55sP3bovWLHeqECQ+3BMFtVDkYLtH8a8HrRDAA
         O5xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g4mAySIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si10702878ejt.16.2021.09.14.10.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 10:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g4mAySIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQBpS-0005ge-PB
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 13:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQBpF-0005eN-6r
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 13:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQBpD-00060K-0k
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 13:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631638946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkIDLD9CAOhbVHN5WBQLyfGlMRaq0nuzR36iSZPAuPQ=;
 b=g4mAySILQ/ZbGTAkWcpYrTtHo7Id8eYtKPjjPlDglZFVIEFC21Df+PCICZbmH1i/1MOILm
 lXKq1c04Lb1C168wo5FI8dIIfQcIr7UXBJLBdNnRj7BytMbey8GRnj1e/pjvl4qn1xJdSh
 VexXEjkkYIMNkPuW83WRT3RmstbZ2jU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-bycjpi1wPpu5uBiB6PUJhg-1; Tue, 14 Sep 2021 13:02:24 -0400
X-MC-Unique: bycjpi1wPpu5uBiB6PUJhg-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so931600wmk.2
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 10:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kkIDLD9CAOhbVHN5WBQLyfGlMRaq0nuzR36iSZPAuPQ=;
 b=apskcTp+rgyrLNBgtg/v/p0b5ioPiofR3SQOguA+o7CmKbIl2cINZs3gGFv3PXcChm
 smcpgdCT5rbAmEHx7/7gT0ieD73sQiPlHVWWrhNk6C0l/+3XZ+VaXthGE+D0hM06FELr
 OUfdYLz0Wnl6oQ7UFSTFDOTlc7QjryKddDl+JxUSac8/cp/qrWCqk7r6U28yyQgOd4L4
 OcEnBkmi9VZ1M9KF1o+xr8W4DHBThPJC5MHV+jCs0Qz0rqAk/vOnpuULRadIoFTW/mLg
 0/MdypQkx+V35kCrZZvhTURWQUgtA+b/i0xLI0I3qG/zdy2yusjcAZmpAwE0KlhoL1TS
 Ec2w==
X-Gm-Message-State: AOAM532pogvNeXflcUWlPfuFoFGZJNnloBEc9WKpyMuLJM/GDTW19U3J
 Iab8FrdXC7u64HYEsXt3mcKUh6c0KfYTpEHka7X13u2JZVS4HfNBx5gNqGFruorVIRM6327YsB/
 Ib6E1qTtc1GU4
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr67714wmc.41.1631638943535;
 Tue, 14 Sep 2021 10:02:23 -0700 (PDT)
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr67619wmc.41.1631638943057;
 Tue, 14 Sep 2021 10:02:23 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k1sm10860003wrz.61.2021.09.14.10.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:02:22 -0700 (PDT)
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
 <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
 <YUDPECQJraD3thwi@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a127efbf-8953-2ec5-9ba0-badbce949264@redhat.com>
Date: Tue, 14 Sep 2021 19:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUDPECQJraD3thwi@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5A0Q1QphPcoq

On 9/14/21 6:34 PM, Daniel P. Berrangé wrote:
> On Tue, Sep 14, 2021 at 05:56:09PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
>>> This will allow us to reduce duplication between the different targets
>>> implementing the 'info tlb' command.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  hw/core/cpu-common.c  |  9 +++++++++
>>>  include/hw/core/cpu.h | 11 +++++++++++
>>>  2 files changed, 20 insertions(+)
>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 4c47e1df18..64fc57c8d9 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>>   * @has_work: Callback for checking if there is work to do.
>>>   * @memory_rw_debug: Callback for GDB memory access.
>>>   * @format_state: Callback for formatting state.
>>> + * @format_tlb: Callback for formatting memory mappings

"... for formatting translations of virtual to physical memory mappings"

>>>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>>>   * @set_pc: Callback for setting the Program Counter register. This
>>>   *       should have the semantics used by the target architecture when
>>> @@ -136,6 +137,7 @@ struct CPUClass {
>>>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>>>                             uint8_t *buf, int len, bool is_write);
>>>      void (*format_state)(CPUState *cpu, GString *buf, int flags);
>>> +    void (*format_tlb)(CPUState *cpu, GString *buf);
>>
>> Doesn't this belong to SysemuCPUOps?
> 
> I can't really answer, since my knowledge of this area of QEMU code is
> fairly mimimal. I put it here because it is basically serving the same
> purpose as the "format_state" callback immediately above it, which was
> a rename of the existing "dump_state" callback. I assumed whatever was
> there already was a good practice to follow[1]...

Since it involves physical memory, I'm pretty sure this is sysemu
specific. Beside in the following patches you guard the handlers
with '#ifndef CONFIG_USER_ONLY'.

Good news, there is very few changes needed in your patches, for
example the next patch:

-- >8 --
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ab86224ee23..9d2bd2e2ef4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6732,6 +6732,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"

 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .format_tlb = x86_cpu_format_tlb,
     .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
@@ -6765,9 +6766,6 @@ static void x86_cpu_common_class_init(ObjectClass
*oc, void *data)
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
     cc->format_state = x86_cpu_format_state;
-#ifndef CONFIG_USER_ONLY
-    cc->format_tlb = x86_cpu_format_tlb;
-#endif
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
---

> 
> Regards,
> Daniel
> 
> [1] yes assuming these things is often foolish in QEMU :-)
> 

