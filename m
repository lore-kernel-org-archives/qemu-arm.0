Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1566984ejy;
        Mon, 19 Sep 2022 22:29:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VPb3s5tL7QAeGazfYpdFyfRiYBXxufWv4+eW4tFB5thk/P4GtAuv0ts4YX4bYPiikwRau
X-Received: by 2002:a63:86c8:0:b0:43b:63ae:dc8a with SMTP id x191-20020a6386c8000000b0043b63aedc8amr1477733pgd.578.1663651797228;
        Mon, 19 Sep 2022 22:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663651797; cv=none;
        d=google.com; s=arc-20160816;
        b=Xm0fgBJbBJT+PK93WbAqI8g/RZzVK1nHBbghe+DVdMqMFhc8ITwwYHalifTEoowX7c
         VDjVw8oRmVt6Ofe88Aysy7UVFitX3kEFUs+typEeLfhfBUd54NSxwftX3CpKrsziw6kC
         BrNeRy4UPWJE/EX1SU4FfoZBNTbLMI0r6KwZNz/To4bOmMAu8+OL4l0Fj3ykxbgoD0rF
         md3v7W9CIFZjRhJaNJvsU4gHDS7umIbYAV7Vt+q2KWOmtM4osbFH+kHQd9Q7n3tk7dpJ
         /BrP8Jjg7rZbUbkO2TBYkOqXtsz0JyIL3hl1/9JwZqTXusEA3+zaVKDDymEHyI4rIGUU
         L07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:references
         :cc:to:from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:dkim-signature;
        bh=vLavNPct5HZ2zw6lCN44DF82TIWb7S+NcGLLhGiFgbY=;
        b=YHPs7Jq8f4aor8qRM3NdKolvOdbfXlQxVY4mRLCV+c3W5E+edl0jwsBlUicQ82ghQZ
         cu7EzxN6SGrK9jD7QBdgdaN5RE33Ec3wisplEE2YcKQ9lbQrfdke7E2mLTmLBp6oPNcT
         06Yib8NKldy5sAXCGNNuA19pwYRAqouS0TvZ2gno9ZWnm/Zo4ZsgaMQeU/0V+aC88rUQ
         jU/nr8uDL3TKJkvWdy1FgtXSYg6lyAkd45FO+V4Sm4nnhA52NUTEjjk+o1BzIWkwyL0V
         mQgFxUI3nUf6c6nE/Gn5fNg6Tk/T6ztfQZGFZYY/urMGg5OdoRzr+t7ToqZ3jpsevd54
         W23w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EK29FpxA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id q8-20020a170902f78800b0016da773130asi576839pln.221.2022.09.19.22.29.56;
        Mon, 19 Sep 2022 22:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EK29FpxA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiITF3z (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Tue, 20 Sep 2022 01:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiITF3x (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Sep 2022 01:29:53 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C6DDFF4
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 22:29:51 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e16so2406652wrx.7
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 22:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=vLavNPct5HZ2zw6lCN44DF82TIWb7S+NcGLLhGiFgbY=;
        b=EK29FpxAwJTevxxTP1Jl5+8Y1nnFTDF4cikh0gdLoXjAqssLIc3NK6aJqtIC/sl76l
         dQN74iwKJIJ8m0vzpT+oBMXb5MWlRMSIdHBzXKYK5Up+7xMeAWU2OrFa0PkuuSntFnfD
         X7ztP7+ETA8Fnzon/RDPQskBBm2PsWXO/DiTgFqR7DYzUYuJeytUDF0rJT4iCR/ALlAA
         RNwcv8k60hb5BUXFwIL4fqj+86FL8NznWTo23V8HDCS9Sc8g3g84j4YS3ADG95ZJ5qc0
         HY0W7gF2cKRT2O+FinLEbnd2WC7FWDJUGcCanGw3nw0m2niEWG4+ilLXeWs4pDnNwah0
         Td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=vLavNPct5HZ2zw6lCN44DF82TIWb7S+NcGLLhGiFgbY=;
        b=EGMiG9slGdXsSWmwGPvW/2hjOby5UzZrrWL5Bibto1JPOWD3oLL+W0HniLkRW6KW/c
         x/ZDRbQ6GhYPF8ATe8fqGSDCRToiaMOEVcO3nbIq/qkSdZBA1MVBRLE+1UWD9zIp62ez
         vBuQhwIt7ya9fGTldHfdsPdJiGaCzY4mWHM5cVSrruLQNrQ/ebk/EZ9j7RXfuFmWx+Zk
         oPQnnbxJF+SSWLRn1zT3bYJiiwcQCkn/Z3ow9cfFPDn+EgY4TsTTOGxHCGk16638m/jm
         oY1XD5OcN+MZA8cnFvKuRfzdE/43l5zvHiDPmE2GDQO4q1ysnhTV4Bp0XrjKTpma17m2
         kf1w==
X-Gm-Message-State: ACrzQf32MPZAxQ9oaeX4y8TSCZ/opOPIV1ZmErUGMuzvO/hT6EGnU7iW
        tHhjcMPmki+2ebKoGcP2/zY=
X-Received: by 2002:adf:eec3:0:b0:22a:d159:456c with SMTP id a3-20020adfeec3000000b0022ad159456cmr12283036wrp.463.1663651790518;
        Mon, 19 Sep 2022 22:29:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id t18-20020adfdc12000000b0022762b0e2a2sm510363wri.6.2022.09.19.22.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 22:29:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Message-ID: <63a4afba-546b-5c4c-94f8-c689b8fa0e0b@amsat.org>
Date:   Tue, 20 Sep 2022 07:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 9/9] exec/address-spaces: Inline legacy functions
Content-Language: en-US
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To:     Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        Eduardo Habkost <eduardo@habkost.net>,
        =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
        qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        xen-devel@lists.xenproject.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-10-shentey@gmail.com>
 <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
In-Reply-To: <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: M68W7k+zIazY

On 20/9/22 07:15, Philippe Mathieu-Daudé wrote:
> On 20/9/22 01:17, Bernhard Beschow wrote:
>> The functions just access a global pointer and perform some pointer
>> arithmetic on top. Allow the compiler to see through this by inlining.
> 
> I thought about this while reviewing the previous patch, ...
> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   include/exec/address-spaces.h | 30 ++++++++++++++++++++++++++----
>>   softmmu/physmem.c             | 28 ----------------------------
>>   2 files changed, 26 insertions(+), 32 deletions(-)
>>
>> diff --git a/include/exec/address-spaces.h 
>> b/include/exec/address-spaces.h
>> index b31bd8dcf0..182af27cad 100644
>> --- a/include/exec/address-spaces.h
>> +++ b/include/exec/address-spaces.h
>> @@ -23,29 +23,51 @@
>>   #ifndef CONFIG_USER_ONLY
>> +#include "hw/boards.h"
> 
> ... but I'm not a fan of including this header here. It is restricted to 
> system emulation, but still... Let see what the others think.
> 
>>   /**
>>    * Get the root memory region.  This is a legacy function, provided for
>>    * compatibility. Prefer using SysBusState::system_memory directly.
>>    */
>> -MemoryRegion *get_system_memory(void);
>> +inline MemoryRegion *get_system_memory(void)
>> +{
>> +    assert(current_machine);
>> +
>> +    return &current_machine->main_system_bus.system_memory;
>> +}

Maybe we can simply declare them with __attribute__ ((const)) in the 
previous patch?
See 
https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes
