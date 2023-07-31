Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2157537ejb;
        Mon, 31 Jul 2023 06:03:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHcmvm56SEJg4xXJvDcq+rJ405RRdeCLrn0itPlsLHnCbgH0WPZD4tVxtRFmIua21UMGSiK
X-Received: by 2002:a0c:d604:0:b0:628:6879:ee48 with SMTP id c4-20020a0cd604000000b006286879ee48mr6920395qvj.50.1690808630877;
        Mon, 31 Jul 2023 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690808630; cv=none;
        d=google.com; s=arc-20160816;
        b=kUCRCceE/XQ9Ckyp3kJGUtXoTJBiMqqaKJjQ6C6RQnDjAWpvQmcDW6YwLU7P6ZSDY9
         /QqL7u0x0cUhn2LYKCHbnwf72+6aP53j5Nx63EYmvWRTLX+deloqO0STFHUI58pI48fG
         mlKThZSTYBAXLyaMSgjYWDpYrjoZOmMgBoqGlrkiiuwEKLb3F3rj8thyBO9EL9eLQyG1
         r5b/eQJau3TVa0o6gDjalDgH1CwJG1fSvSIAuaQIX3gdZaeKWLbxWEMfO9CD6F6D7HNv
         oqTWFqYCoLT23alHZ5HDbVnU6HjMJXG5fXUiF+Tj2UknxGJkT3/5u39pfzwPO8K1OB1k
         WKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EZg3dj7fZg1WDALPDyeGDR0/qrHkWE2blrqwfx5+n9M=;
        fh=8xO7M/cxk3lS4ZAeSfab6/ScjrTIdhNbCWev05W/LTc=;
        b=Z9fdihIP4nuISjVn7dNKsZFW/FA86Foc4rUlsqIs+V/sf/WU3vwk4Ep4BePgiGdpj8
         ZPjDw35+BwEI96s0Hg5xy9a6ep70D4XDEqKB/6XmtbtnnHP0szlSGAtENnv6vCMs6GyR
         OFKsmIH4ew3PVoWfEFLDHib2zSdCKtJ2YQGq7A+nyELe+A6fVU6Tb0rihJMeZ9x07BpM
         rzEr2C8ieZNpWvJHsvmdJRxpV+90kfNc1ZhQrVgszVDmNDPVbbCd0nWIG0jsGTERcg1B
         ib3bFK1ox4uvJkl4IW0xht0riiFZAF5W+M4Rkjo4/mZ0IBCTwTaF94ZT/le7nPcqhMAM
         jasg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/0WgAJu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a0cf584000000b0063d214a16absi5809540qvm.535.2023.07.31.06.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 06:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/0WgAJu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQSYc-0001BX-Hd; Mon, 31 Jul 2023 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQSYb-0001BH-A0
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQSYZ-0000sZ-Gw
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690808606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZg3dj7fZg1WDALPDyeGDR0/qrHkWE2blrqwfx5+n9M=;
 b=I/0WgAJutRJdp5wh4tkzW0QV9ClqboUJUTU79egRwMSgEJqmPEd+Y9WU+iDkU0M3LPGpdW
 40xKGkuCbrVWXV8fcb1Dnp/k0kajRLoIYS1DwUB5+XVXCFOd/BPnjW7UXrtfXXDv1i2ORu
 cI4G8cWfeVcq7czEtcZjuEtnlhol9FI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-KAL754jKP7iMfJVX5TnoXg-1; Mon, 31 Jul 2023 09:03:25 -0400
X-MC-Unique: KAL754jKP7iMfJVX5TnoXg-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-687167290fbso3405178b3a.2
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 06:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808604; x=1691413404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZg3dj7fZg1WDALPDyeGDR0/qrHkWE2blrqwfx5+n9M=;
 b=E3JVNaiezAv1zqV4evBIiNA8n6grSYkhtYsgxaEN/ScfrIFWe4cpmysLIEszrPIP4d
 WdO/5BRLiqaLU6BTRhJV+bHdYjN6CkHJi9UUaKEb9KLg+uEuxHB4aGDm/Xm+PerruTkf
 2ZX8jPfBqJxy2sJRkQDRfBkTWgJTwK57A0SjIVEHg9tl+QI8kyP25Aru8s7XiR4kvo3k
 BKT1YNCuDyROT5AE0yc4abMYCffQfR/2NF90Pp35MOnjsSNvwf6q4HISSiSbJZ9ENjB+
 RqAHzNwai9CBHJ9h8kAAW6l6tMK//KoXnBOUwx93WQfMN1YRAu1VOnWdv65I6KlJTfz2
 TuLQ==
X-Gm-Message-State: ABy/qLZs12POY5n+IHtvtO8DXL666FQ84vZpwxhyc/J7brX9ZrumsoMI
 A7YLkXZ+PkhQ187b2HNdCyMV6qNXj6kqT9UftdIHbZ6TehxOkZRRwF6fVSNAPgE7p3UnS+DhRVJ
 pAlSns/d1Fl86
X-Received: by 2002:a05:6a20:32aa:b0:137:3b34:93e5 with SMTP id
 g42-20020a056a2032aa00b001373b3493e5mr8347036pzd.59.1690808604166; 
 Mon, 31 Jul 2023 06:03:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:32aa:b0:137:3b34:93e5 with SMTP id
 g42-20020a056a2032aa00b001373b3493e5mr8347014pzd.59.1690808603735; 
 Mon, 31 Jul 2023 06:03:23 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a62ab02000000b006826c9e4397sm7601291pff.48.2023.07.31.06.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:03:22 -0700 (PDT)
Message-ID: <c86779f3-3d27-c67d-efb4-e1a664b2e5c6@redhat.com>
Date: Mon, 31 Jul 2023 23:03:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] kvm: Fix crash by initializing kvm_state early
To: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 philmd@linaro.org, shan.gavin@gmail.com
References: <20230730234840.1989974-1-gshan@redhat.com>
 <af597a7c-5580-ffc5-d435-dd7e0ccc63d2@redhat.com>
 <CAFEAcA8Uc7S4oBzKi_9AGCEkNdeZX1U73bvit6RmQo8_A7QLoA@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA8Uc7S4oBzKi_9AGCEkNdeZX1U73bvit6RmQo8_A7QLoA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VnmL4mxW9hFh



On 7/31/23 22:39, Peter Maydell wrote:
> On Mon, 31 Jul 2023 at 08:18, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 31.07.23 01:48, Gavin Shan wrote:
>>> Runs into core dump on arm64 and the backtrace extracted from the
>>> core dump is shown as below. It's caused by accessing @kvm_state which
>>> isn't initialized at that point due to commit 176d073029 ("hw/arm/virt:
>>> Use machine_memory_devices_init()"), where the machine's memory region
>>> is added ealier than before.
>>
>> s/ealier/earlier/
>>
>>>
>>>       main
>>>       qemu_init
>>>       configure_accelerators
>>>       qemu_opts_foreach
>>>       do_configure_accelerator
>>>       accel_init_machine
>>>       kvm_init
>>>       virt_kvm_type
>>>       virt_set_memmap
>>>       machine_memory_devices_init
>>>       memory_region_add_subregion
>>>       memory_region_add_subregion_common
>>>       memory_region_update_container_subregions
>>>       memory_region_transaction_begin
>>>       qemu_flush_coalesced_mmio_buffer
>>>       kvm_flush_coalesced_mmio_buffer
>>>
>>> Fix it by initializing @kvm_state early. With this applied, no crash
>>> is observed on arm64.
> 
>> As an alternative, we might simply do nothing in
>> kvm_flush_coalesced_mmio_buffer(), in case kvm_state is not setup yet.
>> We don't have any notifier registered in that case.
> 
> Yes, this seems better I think -- conceptually kvm_init()
> probably ought to first set up the accelerator state and
> then set kvm_state last, so that other code that looks
> at the kvm_state global either sees NULL or else a
> completely valid state, not a possibly half-initialised
> one. (We should probably also NULL the global in the
> error-exit path, though I imagine we're about to exit
> in that case.)
> 
> Is somebody able to write/test a patch for that today?
> Ideally we'd fix this for tomorrow's rc...
> 

Thanks for your comments, David and Peter. v2 was posted for a quick merge.

https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00702.html

Thanks,
Gavin

