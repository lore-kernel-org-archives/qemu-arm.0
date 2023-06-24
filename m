Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp192329ejx;
        Sat, 24 Jun 2023 10:36:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DQXlO+U02CBVRN7yvvObbh60j/vSn4qviKxWaOs9i9WNO9vPAvALva6/HgGoDjjf9WtyN
X-Received: by 2002:a05:6a00:3393:b0:666:eaac:993c with SMTP id cm19-20020a056a00339300b00666eaac993cmr29201352pfb.1.1687628179663;
        Sat, 24 Jun 2023 10:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687628179; cv=none;
        d=google.com; s=arc-20160816;
        b=NMEryVirToUho98oua+xGbPR96++dlN7ywlRcXfatzH90gOyGLeQAfhm7v+pOmhXuy
         x/kUwKieeRWUe7M+qNPN0U16bv/nrMipenwsXFyrA+tPAhmFqFP/NO8S5Eer2vuM/Iiq
         vvZJST1w/4tuiPPLk7eh0TL90sXzhfYeep3W8WhTY4CmQn7/9zqVTXjCRSoG3tnWJByG
         pAddgZ36Yuh1yLd/XcyZplWu3zGr4NTW1RimBuWNt4UE0lRTadQeB29qWiDf8N+YqAxC
         YnptoAG/IMyIrF5InV8pILHyNBzFeXyPammegLIWe5TmFaiyklzD1LbjHqa/T6+ctz1R
         LdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=GhpHbFudMkeMeL5ABLFV8K3ZpIKOcpmqDKumUJnakQo=;
        fh=/5zk0VVE+j9sZQNgDK5V/dRBxdtS6cJ8jCB5utvJHPM=;
        b=V1/HmVNBp03qVjsZn/XqlPBhr/6DHFRX0qNvy06UjUlamQClXPHgSHKWZaSKpEfcc6
         T3ksS9Ciw3ccS8WwBPBcLJi1H/OkwTnzKsk6Pey6q+VhcabPOEaLtnVgJEkYIJqIIvU+
         A4prgKtMwRjFaThqz8fNC81NVdGpqx7rCXGB7a8gqm2e8yAS6LTCM4FB5k6RQM4rreKf
         fVnov2Db+og+fU+siaaEgwRLm0Xnc5gh8OXFGfKlq4HY5Ebq6xJ0F4NalpAuQOk/41SG
         ynEAhF4kokz68eSlzQnXFYAWo80Uh6cqjW4MuVraUXub38U7cqaHqG4QxUNqaaSwiLzu
         MwpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iHZDudCm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id t22-20020a056a00139600b0064f7150b45bsi1650724pfg.352.2023.06.24.10.36.19;
        Sat, 24 Jun 2023 10:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iHZDudCm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbjFXRgQ (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Sat, 24 Jun 2023 13:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFXRgO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Jun 2023 13:36:14 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E15F1BC6
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:36:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f9c2913133so22741985e9.1
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628170; x=1690220170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhpHbFudMkeMeL5ABLFV8K3ZpIKOcpmqDKumUJnakQo=;
        b=iHZDudCm+6Lkz6SMlioiaWU3ZPrAVeeGWydDo5XpuHV/O83QDieJ2MW8sBwc0RnJ6n
         LCyc81zygqlx89kqYh6y73/3CFk7tQWmRPaEg0IWMGey5OqegmHYQ884T0up8Qih6qtw
         X91F/O84ZOuvkgqRnEXbb0eSlQvy+5Gun1bFmcC96S2uKTlpsxgRhLma5RxvpNjRGq+2
         eDO6513hnE4ZqdmdJjRuKKPa5ge9tgFASVn2oo+300iSfP5maJ62wBUynRf7i9NYTjc6
         xdYlov0lRWMIvUULtV6NAO9JsfOyDTaiIaPiJgFXnYEpiaqfkMjDaWpUqrHvp89eWXy7
         ObVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628170; x=1690220170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhpHbFudMkeMeL5ABLFV8K3ZpIKOcpmqDKumUJnakQo=;
        b=AI6OaJimkwgD58KZJptl+tNHM1G4zqMrtiJ+Q00cEcy0oJ5GtmNvWXtdRDd8k8hoTw
         iiyEgfNwMRC4VU6zui7rQXlULoJKD5crww/CTSaBAdgbEDnSrDQwwnYoTMKt0RqAtZQr
         ehMNu3/5lm9xkgx+Ll4TuIN6M9Ekw/iktS0Il8HwncP7AsRN052gceYEq8+fbHy9b+JM
         UPI/Rx95gAPdpc28yUQ2hsjs+NI3YKVLRyv+N8O2OobE+IoUBwxMfWN9h1yB7SssJXeU
         z7o5IvI83b8S6PxRbkbexv1MHFs4AOekWbSZZXhCOazwldaSdwqngCvilCsx0JEre5Aj
         HEOA==
X-Gm-Message-State: AC+VfDyCOWVYYzaMBy12PuCXEuyTlvaqVGOBGcjJ5g1xOhbjZqz/zvGI
        i4t5uQI7jVfWimbLJXdElfLWdA==
X-Received: by 2002:a1c:e90d:0:b0:3f8:fc2a:c7eb with SMTP id q13-20020a1ce90d000000b003f8fc2ac7ebmr17083071wmc.5.1687628170299;
        Sat, 24 Jun 2023 10:36:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.150])
        by smtp.gmail.com with ESMTPSA id d9-20020a5d6dc9000000b0030ae53550f5sm2590762wrz.51.2023.06.24.10.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 10:36:09 -0700 (PDT)
Message-ID: <c52475f6-253f-05cf-186f-5b9e17da1dac@linaro.org>
Date:   Sat, 24 Jun 2023 19:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/16] accel: Rename HAX 'struct hax_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To:     Richard Henderson <richard.henderson@linaro.org>,
        qemu-devel@nongnu.org
Cc:     Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Durrant <paul@xen.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Alexander Graf <agraf@csgraf.de>,
        xen-devel@lists.xenproject.org,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-8-philmd@linaro.org>
 <2c0a97af-be7e-6d83-5176-ef9980c2faf0@linaro.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2c0a97af-be7e-6d83-5176-ef9980c2faf0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: BFqUuVTvLgM9

On 22/6/23 19:46, Richard Henderson wrote:
> On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
>> |+ struct AccelvCPUState *accel;|
> ...
>> +typedef struct AccelCPUState {
>>      hax_fd fd;
>>      int vcpu_id;
>>      struct hax_tunnel *tunnel;
>>      unsigned char *iobuf;
>> -};
>> +} hax_vcpu_state;
> 
> 
> Discussed face to face, but for the record:
> 
> Put the typedef in qemu/typedefs.h, so that we can use it immediately in 
> core/cpu.h and not need to re-declare it in each accelerator.
> 
> Drop hax_vcpu_state typedef and just use AccelCPUState (since you have 
> to change all of those lines anyway.  Which will eventually allow
> 
>> +++ b/target/i386/whpx/whpx-all.c
>> @@ -2258,7 +2258,7 @@ int whpx_init_vcpu(CPUState *cpu)
>>
>>      vcpu->interruptable = true;
>>      cpu->vcpu_dirty = true;
>> -    cpu->accel = (struct hax_vcpu_state *)vcpu;
>> +    cpu->accel = (struct AccelCPUState *)vcpu;
> 
> this cast to go away.

Indeed, thanks :)
