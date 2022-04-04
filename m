Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp91411lfu;
        Mon, 4 Apr 2022 03:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4wC5TFLOjoKIGD6XhECsY5SbhEnJ6cQ7tC/greJADmx1Zc7K/4UpDPloTou1oiZJf7Fiy
X-Received: by 2002:ac8:7d06:0:b0:2e1:d1c4:868 with SMTP id g6-20020ac87d06000000b002e1d1c40868mr16692121qtb.143.1649068911868;
        Mon, 04 Apr 2022 03:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649068911; cv=none;
        d=google.com; s=arc-20160816;
        b=FAjBKBsShfAt6+k0E/DD5ovNhNCva4n3MRpysBQ0owsi1XSVibi9N2/RU6gNf/NKsV
         k2NY/8Xb8ZZnhUaKX+mqcLqsZx78hKqIpmhs3NDIV93xxQiAAWzx0cgVwxjAScAU2zPy
         GiSIML5p0dAcZj4o0kajXhyFaE2QSczk6C9xeCiXkEwTgrCt6KSkrgCXMDh6KPu2YHvK
         B4vTAuzWp2t/NbbhMbEVW6W3v5OEDRSxgqe6scrleoqhE9dJ41LSdf9dakOdYNSnpase
         VUzDjb/ZhvnX29OzFcEfqJa5yYxAiJGl5wxXyyAG3LPw5xou2eP0cRSfnv9ZkINsI2p9
         vW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=MqzDLJGYw+usGsxo2diJ6VcxT8NxmHvltmdS8kakso8=;
        b=uKNFRHCVGxOh21PIHr1k2Lf+1xBpFSxXHE7ghCm72+sGLdYqQGKSjPm1T/tnLJLRkS
         3T+P1aGT7rSY5aKVuYYwj2ad40HkpMxtf8k5A7Q/9Ykgt5VbjXkja3+Xt27dVgWIio4m
         Ae3OhAiMbLMVF0UhA9N230HU++GJzciXAV2K/ewUdiIzjw9Zin5hYEJftVnlq8O5C0Fn
         TKMqPknIKnCwkiuu1tgbe8aYMVpbtDgSl1QYv0rek1O+3EZ+vDw7lvSJWNUt++M9JNqx
         Xco3bIaIEn/Seq6b369TAvIGBBKYwBs9V2Y0lu1349LuWrXBR8ER9bls3wTIxRpfHqc6
         +SHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KcUGeuMR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020ad45c8c000000b00443c8df304bsi1862203qvh.529.2022.04.04.03.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 03:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KcUGeuMR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbK9f-0001PF-Cz
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 06:41:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbK8x-0001Mo-CQ
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 06:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbK8u-0004VP-Ad
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 06:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649068863;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqzDLJGYw+usGsxo2diJ6VcxT8NxmHvltmdS8kakso8=;
 b=KcUGeuMR0L9NwOjAnLaIAjapktgOJDQU/Xk4EsW4vPNJ0W2R8ZRX/lIsqBqR/wkbGo4sfP
 1Dukt6CPOjIibijF6PMkZ4snvXx1MA5rHeI4xvfmxCb3sCmr1DZ0opkQ2CMOV7c/WKmA1M
 emdlZPYFikjC7EAHPq9SwPJSCwdwrYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493--zRPm2sZNHGEU9ZHVjVIUA-1; Mon, 04 Apr 2022 06:41:00 -0400
X-MC-Unique: -zRPm2sZNHGEU9ZHVjVIUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689BE801585;
 Mon,  4 Apr 2022 10:41:00 +0000 (UTC)
Received: from [10.72.12.126] (ovpn-12-126.pek2.redhat.com [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7788E40F1C45;
 Mon,  4 Apr 2022 10:40:55 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com> <YkquNlUvAHC+sLh7@redhat.com>
 <YkqvGsdcnupeTMZR@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <896753a5-a40d-74e4-56a8-a46153e3ee26@redhat.com>
Date: Mon, 4 Apr 2022 18:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <YkqvGsdcnupeTMZR@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jE7j7uForn2X

Hi Daniel,

On 4/4/22 4:40 PM, Daniel P. Berrangé wrote:
> On Mon, Apr 04, 2022 at 09:37:10AM +0100, Daniel P. Berrangé wrote:
>> On Sun, Apr 03, 2022 at 10:59:50PM +0800, Gavin Shan wrote:
>>> This adds cluster-id in CPU instance properties, which will be used
>>> by arm/virt machine. Besides, the cluster-id is also verified or
>>> dumped in various spots:
>>>
>>>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>>      CPU with its NUMA node.
>>>
>>>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>>      CPU with NUMA node when no default association isn't provided.
>>>
>>>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>>      cluster-id.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/core/machine-hmp-cmds.c |  4 ++++
>>>   hw/core/machine.c          | 16 ++++++++++++++++
>>>   qapi/machine.json          |  6 ++++--
>>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>
>> Missing changes to hw/core/machine-smp.c similar to 'dies' in that
>> file.
>>
>> When 'dies' was added we added a 'dies_supported' flag, so we could
>> reject use of 'dies' when it was not supported - which is everywhere
>> except i386 target.
>>
>> We need the same for 'clusters_supported' machine property since
>> AFAICT only the arm 'virt' machine is getting supported in this
>> series.
> 
> Oh, actually I'm mixing up cluster-id and clusters - the latter is
> already supported.
> 

Yeah, @clusters_supported has been existing for a while.

Thanks,
Gavin

