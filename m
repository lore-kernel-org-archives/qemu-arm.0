Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp53622ejb;
        Thu, 7 Sep 2023 16:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjUnTIK45nn3/B343iYqZJqbewkVo+qJnwv/KOCou9Nvyk6Mr2Wtt9URRKEcxMB1P1CJq9
X-Received: by 2002:a0c:f3c3:0:b0:651:6edd:c6c2 with SMTP id f3-20020a0cf3c3000000b006516eddc6c2mr748615qvm.3.1694129830451;
        Thu, 07 Sep 2023 16:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694129830; cv=none;
        d=google.com; s=arc-20160816;
        b=hHWlGBPcoYRw9c9s9XS5Pk55FbItMcv4C5choyaFUdwRzplZyYUCsaxlc8SNpXcfNV
         8LgOUC82yXHNEHId+8rRkVBI+wzJNauHty5aUjuAiQY85kF7pqBq8tGuzg7l6SqPZVbD
         2/MvnZUit2fPq6p+zALhBiXDMUHmaA7EjTPjzoNF/FrnoeivTl6Z/SIQMtSYLmeQBYvG
         NA1wsC5MB3Jjh29c9/pdXoIQHZjT2KWpGUGDQ7xnUrhZPJax6UKa+Mdja+EgMuMBExD+
         7t4WPUsvUpnSL3/1Fsc2s3h3YwrC08RWmCOeK39MFlXHOfziCpdgawasEq+GaHBEwDcv
         PdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zu2K1dMy8vm8K0rvVM1RHy2lhBh8qmZ9yitufa0eHac=;
        fh=FFLd8H2YAgUuuaKYWnF7a+S/5kq2UZ6CUBZpaG7nLWA=;
        b=UX8GkJxkU63DbFiSXFWjoH3FZlvPb5LzwNrcrFWRGJDQ3uxgezT8qDi6g8qJy3IAcI
         TMXyQjhs0DLgtIPT4dicmTkJb4hmlEC6HiQxNTPCQQrBUnCJeXSi0Gg+Qk3ci75T7ncA
         asnCq/hG23jrtRmZfgw6eBDvFNvKtvDCbwby1neuTijFJI68UIZq6bSkQ+Ny2sClWIxY
         b18Oc2Uh4eb7fMkKos8APZy2YiqY5kc14eikVqjH6S4W954jRvawqU85qo49mHOAv34s
         +uBFJGS3CS5nk2IytdIhcA7Dk9KTlKibGSQj7MC4RXWluPScRFWLCke9IdhZTiLmEWox
         NPFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eqkQKAjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020a0ce189000000b0063217340105si373759qvl.536.2023.09.07.16.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 16:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eqkQKAjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeOXz-0003cA-7k; Thu, 07 Sep 2023 19:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOXw-0003bL-Mg
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOXr-0007N1-Rh
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694129778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zu2K1dMy8vm8K0rvVM1RHy2lhBh8qmZ9yitufa0eHac=;
 b=eqkQKAjdcr6YLVHrLZTEsLGc+RYIPTDM2sRx0/m1x57+PFJ2J8ySXugLPCSGbT5HegtQAu
 U8XVqMEaz2ibTG1Ve368YuMK974u4/xa8ZkTirOB0MQtv9MpNaS/016g89q4hu6Z8HAVdz
 39o+rMMEczFTfGErxQddhuQ2fXwACz0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-m_mQoHBpPiyHY4GCmhHYNw-1; Thu, 07 Sep 2023 19:36:16 -0400
X-MC-Unique: m_mQoHBpPiyHY4GCmhHYNw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-26f49ad3b86so1897688a91.3
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 16:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694129776; x=1694734576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu2K1dMy8vm8K0rvVM1RHy2lhBh8qmZ9yitufa0eHac=;
 b=UTFm3MUYtzIMdMLtzycbkhzTcUNdYcWMv57CZuPH815c3lwC5iwj8G7wWjA4foEd4t
 TN2Ij5ggVJa//h3s4ywleqTepot2lWV/ECSmZ9eLrtgWEmFt6yJ6gw9xpLdRqSAMzRti
 c3SVMuu/KZrez8uWNT+daH1F5FjtGDhQf/dAb1c+cABesRMcvOTA5fE16CSR4tLYpUgU
 mesdCNFsoBge5Zzm88blaLWow4p7jHcUbdxftXxXYitxNrjmD2i13EuJ8PsHh6pnYll3
 ENi5EG4AKgqDMe3NILK7+wZ9GaQaS9S4K5euBMbxKd87olNuvjlUPVnSc8TvFQHx2USR
 FC6g==
X-Gm-Message-State: AOJu0Yyxke9sfBIsf2q9RoHyMG4GXHvx2OTMuy0KuWf11PFNO48EqWTZ
 Mhu9aSc0Ab1wAFE6tDznbgFwXJr7JR5I5Vj02cLPv7mnVgtabnHg9ktdKAO+hYObO3+xjFbK0dZ
 7aP4COLH2ty/1
X-Received: by 2002:a17:90a:660d:b0:269:13f0:4b9a with SMTP id
 l13-20020a17090a660d00b0026913f04b9amr1080090pjj.7.1694129775752; 
 Thu, 07 Sep 2023 16:36:15 -0700 (PDT)
X-Received: by 2002:a17:90a:660d:b0:269:13f0:4b9a with SMTP id
 l13-20020a17090a660d00b0026913f04b9amr1080022pjj.7.1694129775359; 
 Thu, 07 Sep 2023 16:36:15 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 mj11-20020a17090b368b00b0026fb228fafasm1929825pjb.18.2023.09.07.16.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:36:14 -0700 (PDT)
Message-ID: <6ae8a82d-44ee-f002-ea44-d3f0f5808c1c@redhat.com>
Date: Fri, 8 Sep 2023 09:35:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 01/32] cpu: Add helper cpu_model_from_type()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-2-gshan@redhat.com>
 <923ad3bf-4663-248a-aaf2-cd596d5ec0b2@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <923ad3bf-4663-248a-aaf2-cd596d5ec0b2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 8XWR885+db9O

On 9/7/23 18:54, Philippe Mathieu-Daudé wrote:
> On 7/9/23 02:35, Gavin Shan wrote:
>> Add helper cpu_model_from_type() to extract the CPU model name from
>> the CPU type name in two circumstances: (1) The CPU type name is the
>> combination of the CPU model name and suffix. (2) The CPU type name
>> is same to the CPU model name.
>>
>> The helper will be used in the subsequent patches to conver the
> 
> "patches to conver" -> "commits to convert"
> 

Thanks, it will be fixed in next respin.

>> CPU type name to the CPU model name.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   cpu.c                 | 16 ++++++++++++++++
>>   include/hw/core/cpu.h | 12 ++++++++++++
>>   2 files changed, 28 insertions(+)
> 

Thanks,
Gavin

