Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1422452lfg;
        Fri, 20 Aug 2021 08:47:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFZkzyXTRSJLTvHkwJM7uhk3ON3fW48INDk5J+FEFqgZuvlDX7OAuHwO++wrQGnzQvLTC4
X-Received: by 2002:ab0:1468:: with SMTP id c37mr3093661uae.28.1629474437931;
        Fri, 20 Aug 2021 08:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629474437; cv=none;
        d=google.com; s=arc-20160816;
        b=NNBupxfxj0Jc/PegBpuoR4i+ju6WWckmvn7EJEitMwoAP0dEu/jNip3/8nAWkc+hqF
         CkHbhKi/I8k+Y2425DUES8R/W0pYUSbrH4dQSS89/LIhwBrll52yAo5FpOTzP9729kfW
         5zIkQst8fBNC3HiOlPIru89LQAi32hj2bvdoiLPjICnFSVk55M+LFBoVuV7KDXa59M2j
         bsCXKCXARSL6GIUUVeZE3akYIXcKdJUGjQcWukEspGi8QH2jDqoFRPSYHU4L37fky5N8
         heRntg2zQHDSQHVt5ttsRwFrqAnPPa8jCWRok6EjZHJZqJ1/hK+cQ2L6B88C7VLz7BxF
         222w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=4WlcJXE7AYcsMiyRDv7a/mDSfhXNDS3YYokGDRbiSsA=;
        b=sghLSEaXWnPplvROXWAF2C9LpR7Qo+ld8qKnckgiJsKhG0iaNcuj83uoYxLGm14N50
         3me9lP/5tpNMufoKtXmUrABsYq1XmeirnIbncLumgWkXqOrKZfuKaZbr2QVXl904oQbW
         Vac2QbKjS1kUXyhh93+K/ttvBqGVZQyxzbNdnYLsK/+U7OQopJ4cjeZRMOuGmvJuEMNP
         fUthAPPySXhSaeLYLXgkKChh/yLdo5ZIRIcdZq7cytAgC/+PdMuIRgs/ykLqsIQ/Nprg
         c072ymJjoJL8aC8TgMQCIbwF9ejN3o/4LGEY/hyQzkGDSQjsYvkUt8DqyfEKhmz7sSXJ
         3W4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fbHvo7JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si3100777vsi.253.2021.08.20.08.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 08:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fbHvo7JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH6jl-0002lr-4S
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 11:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6jb-0002lU-9F
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 11:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6jZ-0002um-RL
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 11:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629474424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WlcJXE7AYcsMiyRDv7a/mDSfhXNDS3YYokGDRbiSsA=;
 b=fbHvo7JNrqQ6qPRVmxIRHn4uHEAtTprhVKEPBJnD63aG4d89t8jvN1C7SUYFDDS9PdpM9F
 nB2BoQJ4ASyj1ifOojs7XjoljLrvoRAyzpGqDrch4gtdhszqOmc+Sck2KWMefvqvukmZPf
 TTEK2i4AhGShIoE3nEEehnS9V79aQe8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-5EujuSPwOw2poUWNBUJLlw-1; Fri, 20 Aug 2021 11:47:03 -0400
X-MC-Unique: 5EujuSPwOw2poUWNBUJLlw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1952863wmc.9
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4WlcJXE7AYcsMiyRDv7a/mDSfhXNDS3YYokGDRbiSsA=;
 b=X7wS60hxFHqjl7oT6qw5TQwoXZnN9jPvvoPwvbn4K4ivHivPpDnsfxcmBGLZ5WeBuQ
 oP62GJQE9txZo532pNkLlp18kcPp10pIK/xwzm/KcHfo89Lj5zipSAiOvSTi/RSbY7ns
 EtwyegQhfO66rzJ5sn7Fo6Jcta5+HrHxPVn8SnXYjW0zlavJ39sz3TuNyaXfF6TZAQx8
 mMoWjml8JvRn207EI5Gp4EKKuqonOTCoveifwXf3PtT/WYZrIfFP8MUFih4XPbFfFfcg
 aRlwpqSQeMa3+0CCUH6fFmSCATAvku8QUILN1W8J3IRN+rxKsBbyXvG2YogusrK9NADH
 8fVA==
X-Gm-Message-State: AOAM533rD+Gi4cddYy8J37S4Yn+QS0iYbhtAC1KAWpsQInRKMyYSTDm0
 a7vaitnPl3O7GBiz0QQP5nB77q4sORcJJolGIshZKi+mF4YaEntxIfFhwEmCxuHruhQzG7ZmyxU
 eEj/ete75ziqVIbZjjO7w8mu5rfpi4du0eKRBK+LLQ/TEgRDfdFV8KNqWwHES
X-Received: by 2002:a1c:2202:: with SMTP id i2mr4672356wmi.78.1629474422547;
 Fri, 20 Aug 2021 08:47:02 -0700 (PDT)
X-Received: by 2002:a1c:2202:: with SMTP id i2mr4672329wmi.78.1629474422290;
 Fri, 20 Aug 2021 08:47:02 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id h11sm12374713wmc.23.2021.08.20.08.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:47:01 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
Date: Fri, 20 Aug 2021 17:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820174402.47a14625@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F23+OsU8dKiW

On 20.08.21 17:44, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 15:39:27 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 20.08.21 16:22, Bin Meng wrote:
>>>> Hi Philippe,
>>>>
>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>>> <philmd@redhat.com> wrote:
>>>>>
>>>>> Hi Bin,
>>>>>
>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:
>>>>>> Hi,
>>>>>>
>>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>>> with QEMU head.
>>>>>>
>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>>> allocate memory
>>
>>> -m 40000000
>>>
>>> corresponds to 38 TB if I am not wrong. Is that really what you want?
>>
>> Probably not, because the zynq board's init function does:
>>
>>      if (machine->ram_size > 2 * GiB) {
>>          error_report("RAM size more than 2 GiB is not supported");
>>          exit(EXIT_FAILURE);
>>      }
>>
>> It seems a bit daft that we allocate the memory before we do
>> the size check. This didn't use to be this way around...
>>
>> Anyway, I think the cause of this change is commit c9800965c1be6c39
>> from Igor. We used to silently cap the RAM size to 2GB; now we
>> complain. Or at least we would complain if we hadn't already
>> tried to allocate the memory and fallen over...
> 
> That's because RAM (as host resource) is now separated
> from device model (machine limits) and is allocated as
> part of memory backend initialization (in this case
> 'create_default_memdev') before machine_run_board_init()
> is run.
> 
> Maybe we can consolidate max limit checks in
> create_default_memdev() by adding MachineClass::max_ram_size
> but that can work only in default usecase (only '-m' is used).

We do have a workaround for s390x already: mc->fixup_ram_size

That should be called before the memory backend is created and seems to 
do just what we want, no?

-- 
Thanks,

David / dhildenb

