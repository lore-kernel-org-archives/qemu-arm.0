Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp936584ejb;
        Fri, 17 Nov 2023 22:41:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBoaZsxnESuuBaYYT1XLWEm//RzQN185B7WGAWPG7EEuaIqScrICBVfCV5YoOOHTFHS2wI
X-Received: by 2002:a05:622a:58d:b0:421:c3a9:1e43 with SMTP id c13-20020a05622a058d00b00421c3a91e43mr1900987qtb.56.1700289696901;
        Fri, 17 Nov 2023 22:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700289696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBr6gAPiNUYLMgrllyNNfeVKayNjrrrexE/o7ZIdftpSl0WZzIk59enohPIGab4kxw
         mj6ZL3t3OQ5LreJ6mVky5TGdycPNN6Q7qWM92a/c2cmjO7dyXru5YVpiEoAFnR5C5wSy
         scBvEPn2uwqogzVc/Cj7e33BygxECSdgmPDxxJeynGOjdAJgNsTFBF1StvdifWTvz071
         0N4Q9PHv7op4zFtHfhiUis491ulxQSzD7RMwOReHu4SvLvAvG7EAU4Yc0cp3JQDuKXoa
         39FyX2k9Zhy92lK6I+rAki4gHs0LJYBacK0QxFFqn6d8QKwu7iJy1TI+mbdo7fXeZWsF
         /wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UnpuoslZpH27s0YVxL2DOtr7qbZMS0LnrfN9VuXqNhs=;
        fh=a7pXOaTBsSHAOcDhqYGjai0RHNA6jEApxyxU387OqdQ=;
        b=tjJ/zn9/9ngxcQ1lJ48STJHd2TKWMBRJCRsqgmNYxJsUnQTHBQiGkRcdegyOUZOT07
         dsGAjZVdWBXB+UvgtTHecmBx4U+nmPiqXebB8/VyF5s+qmZktOemPRoqj8yAbnpD97q8
         1w013EjSBApv0I8mjimgw/RnCvE/oXdXCz69pLVA+G8cZIBKmqTUq8kVPO1dzv3cX6JG
         hyZ/LJomoG16zKWA+o9goLzEANlDxnfW+vJ8T+jScT6EUGGp7EaP2CgKVh6H+OyS1VpE
         6sRHAacR7jFV1fg4P++8gcTBa2ODM0YdVQzsFj2Kih/QNJu8WCStKTxZLABq8SOq/V+N
         dlfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ch62wGsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020a05622a051000b00421ba41b2b5si3133459qtx.192.2023.11.17.22.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Nov 2023 22:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ch62wGsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r4F1D-0000Y2-Rc; Sat, 18 Nov 2023 01:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4F17-0000XE-5l
 for qemu-arm@nongnu.org; Sat, 18 Nov 2023 01:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4F14-00065D-SB
 for qemu-arm@nongnu.org; Sat, 18 Nov 2023 01:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700289676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnpuoslZpH27s0YVxL2DOtr7qbZMS0LnrfN9VuXqNhs=;
 b=ch62wGsIrGEsH/co9+zVX+94Z//Fn8ZJPy+xVSZdVKdLUM+RXVjiD/xAKjmLAqbQHk1PdL
 6navSfMjjsJMLFwS7bk9wvwwECAeJCW8PS/VYlbWK5fcrp9Ibl2z7kVATyQqJYmvhowzAx
 0a1TWjUzkT0CPSxDIQ7XcUt0jetxhfo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-YVRm6j_xP9effrcfi_LNYQ-1; Sat, 18 Nov 2023 01:41:14 -0500
X-MC-Unique: YVRm6j_xP9effrcfi_LNYQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6b5cac99d3dso3777411b3a.2
 for <qemu-arm@nongnu.org>; Fri, 17 Nov 2023 22:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700289674; x=1700894474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnpuoslZpH27s0YVxL2DOtr7qbZMS0LnrfN9VuXqNhs=;
 b=gG+Sc8sVSGBknjNFVfk/xlgbwjoLfV+IhEHS2yG26Mp9ragwltIYhkHpQlepjtvLiM
 lu4sJOSddabNxvNC5aAHjwvSghXcM799USdmbVr03Gtsgai1E1TGLxVrQ/P/2fqw6L4P
 Z6A46VqqPWVawPTXhskZqR4Oq0CseKByKSsYt0m7qkETY+yzo2MzLDM1dNAz6EoZbzdb
 8w3dGiyw6DmSESy9HJvV3sbKMrJr/n+ypZtaCfG9rbZxkrEJv3NVOMHQtif91WcetrNx
 0mhgzBpAH278A/eqgFis3bg6B/ws86PX3KCijLilOgs2Uh6LZJE6YQVdupezgWWKHEyZ
 mT7Q==
X-Gm-Message-State: AOJu0Yzk/fPhb3Ylfq1TdF+lh7mbb8pi+He92ky9KLS3cJ/ZvKUsMaOs
 jKVGFbmKJi5VoeHCbvJttYgmplSRg8BZN5k/ZiOdjKfxtLLVX+KDQ7EJ6vhRCCrVWgx0uNeNCDt
 /aDoFz5lb5nw8
X-Received: by 2002:a05:6a00:1886:b0:6b6:5ed4:dd42 with SMTP id
 x6-20020a056a00188600b006b65ed4dd42mr2252004pfh.31.1700289673282; 
 Fri, 17 Nov 2023 22:41:13 -0800 (PST)
X-Received: by 2002:a05:6a00:1886:b0:6b6:5ed4:dd42 with SMTP id
 x6-20020a056a00188600b006b65ed4dd42mr2251911pfh.31.1700289671951; 
 Fri, 17 Nov 2023 22:41:11 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 s19-20020aa78293000000b006b22218cb92sm2365475pfm.43.2023.11.17.22.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 22:41:11 -0800 (PST)
Message-ID: <e638c40b-fbf9-4495-93aa-1443877b553f@redhat.com>
Date: Sat, 18 Nov 2023 16:40:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
 <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
 <7252553e-9ab3-4c8e-a867-55c57d0178ba@redhat.com>
 <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ebaa5c70-e410-465a-a94e-1a254506a81e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: XHni/IQLouLX


On 11/17/23 17:34, Philippe Mathieu-Daudé wrote:
> On 17/11/23 00:26, Gavin Shan wrote:
>> On 11/17/23 02:20, Philippe Mathieu-Daudé wrote:
>>> On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
>>>>
>>>> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
>>>> repost them, please base them on my tree. I'll follow up with the
>>>> branch link when I finish my testing and push it.
>>>
>>> Here are these patches queued:
>>>
>>>    https://github.com/philmd/qemu.git branches/cpus-next
> 
> Oops, no clue why I wrote github instead of gitlab, sorry =)
> 

No worries, Phil.

>>> I might queue more patches before the 9.0 merge window opens.
>>>
>>
>> Thanks for queuing these patches, but I don't see 'cpus-next' branch
>> in the repository. Please let me know if I checked out the code properly.
>>
>> $ git clone https://github.com/philmd/qemu.git philmd
>> $ cd philmd
>> $ git branch
>> * staging
>> $ git branch -a | grep cpus-next
>> $ echo $?
>> 1
> 
> No need to clone, you can use in your current cloned repository:
> 
>    $ git fetch https://gitlab.com/philmd/qemu.git cpus-next:cpus-next
> 

Thanks. It worked for me.

Thanks,
Gavin

