Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1685229ejc;
        Mon, 13 Nov 2023 15:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvgLLtVCQ/DV2zc4v+9xPM6YdVV+u6gzDIzZJeeg5dvLAeP8W3+8UFk9JoC2Y1SiE9ySAg
X-Received: by 2002:a05:6214:d87:b0:671:fb5a:4ad2 with SMTP id e7-20020a0562140d8700b00671fb5a4ad2mr748098qve.49.1699917861817;
        Mon, 13 Nov 2023 15:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699917861; cv=none;
        d=google.com; s=arc-20160816;
        b=sf7LYuumXMU8BONvBw/1AdkYntubcJpw8+YAlmJHP6gZ85x3zVyx6BfwSo/lVLl8tD
         Lpwgnilywvfn+0aazcrRZ1iekXwWouXXMUpX51lZGZcJLdr3i1pIhe+opKE/K5O557Un
         rOAqVRUGMUU85ZUbA3Zm3qEy/z/T6vYjN8gX5J4wGDDBhyQ7eB/s739wDLwkCUkshtTh
         JM5ps2HnQpz0qtArTGQjwp4hZdGVsXIopo3+nCTw1IhCg+a78nvBJOQvLcq0i5T96tcD
         ziNwC6zOe2u51AlB3kRytQudE9he0+ILgrvyQtRPUmJ4inEhd6Gm+LvrLKIvpwl+KeGK
         n/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OujD5ycfqz/svV9Ju/bsg82JbTieO3a6f7J8r2fIurI=;
        fh=9oVi/nj9UAEUrQ57vsoUXRmvoirMfEtGVeTXMQTp4D8=;
        b=dQgVPm5uFoAZB9/YicC1LeNQOWYsmSM9zakm1yTMW08nPD7fZ/OD7t6s+EoCP9vXSz
         82xIL4xraHRlwpqqrSAqM6oeXb/yAE7UzXLlA7HFN6GQnb6Se2H+AsMeNH66CSJnflHv
         PILNp6nOTMIP1RU9KkPey/c1Dp43U2QiBK+tvjEYWFB+uEmIcUMNIHGmN/6mqRNGp8b2
         4z0xFuQtsEkWFCPEiSF7H8IRU4iu8HQYTvuJ3jcKtsefRTvOz80uJJzjSwzo6KLQI+un
         a49pwGOdq20Lw2k6sbSwXezmGK9dPGFzE4pvwy4QUD0L6GYhDr/GIdq747C2ze0vTbS4
         RXfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGj+uUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a0cec8e000000b0066cfd0ec363si5497621qvo.418.2023.11.13.15.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 15:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGj+uUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2gHg-0006VW-Ui; Mon, 13 Nov 2023 18:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gHf-0006Uf-F1
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 18:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r2gHd-0002T5-Ff
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 18:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699917836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OujD5ycfqz/svV9Ju/bsg82JbTieO3a6f7J8r2fIurI=;
 b=fGj+uUNxy3cKXPJAr/Ylp03wX6v6EEjY/pg/xgLMy0DbF+B1wiVVP35nrq20kxdoo2Oh+G
 b70cS0jdCuCJY4aZ6ciwQ0FWtreZZLEzsmRsc3GZMfRREGHk8xrXrROrVS3lKEZhCkNG4D
 8QgNbjAAgmAfm6Bhzl9VuZZbFzHdQBI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-1jfu86unMWOPUogaCJ843A-1; Mon, 13 Nov 2023 18:23:54 -0500
X-MC-Unique: 1jfu86unMWOPUogaCJ843A-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cc70f8a58fso67327815ad.3
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 15:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699917833; x=1700522633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OujD5ycfqz/svV9Ju/bsg82JbTieO3a6f7J8r2fIurI=;
 b=cjPPfhpSsvBuuabH712y0UPnT1PUGetL33bNEYvrk+AkQ5s+s/dIhs2oY3sYH/P0ZL
 8uMNeqegtwfcPmpHH6Hqv5f3z5E4j83PNvEF0xuHyX3Bku9nAiYjjtjKo806PZZAJyTd
 2e7VZI/ILaMqEf3KPBOYoQd9korT4dmQSOeRfEokWjGTeovloV0020itRfvzIL4q0FxW
 t44FhKT8Zf5a/ef/W0nboDUbUG6ct2hJkDJGDKxAeI7fEdCIdNk7VaKV+Yx0Tbt2woo7
 XT+UP+UHghkTlZ3nrSJo783/7XGlG22hacbnUxf+RUiqYpG/lw6R4cRGA+Iq1kcX0mA2
 BJPA==
X-Gm-Message-State: AOJu0YzdsUyrLMPh7dz2NXp49RGiArabq8AxmVzvJ6S5o5jSZu+8o9MQ
 coloO2Ngvzw4O7RmCnCU0vgUVOudauIuvDqM3KgXg99IHS9L0WD79l+TijeLDrdZ/2ezYIPOgdd
 KGgnml3KQdq5M
X-Received: by 2002:a17:902:7d87:b0:1c9:e508:ad54 with SMTP id
 a7-20020a1709027d8700b001c9e508ad54mr564859plm.13.1699917833529; 
 Mon, 13 Nov 2023 15:23:53 -0800 (PST)
X-Received: by 2002:a17:902:7d87:b0:1c9:e508:ad54 with SMTP id
 a7-20020a1709027d8700b001c9e508ad54mr564807plm.13.1699917833077; 
 Mon, 13 Nov 2023 15:23:53 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170902dad200b001ca82a4a9c0sm4501618plx.309.2023.11.13.15.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 15:23:51 -0800 (PST)
Message-ID: <4f2b342b-bf32-4fee-9736-a3536ddf5d92@redhat.com>
Date: Tue, 14 Nov 2023 09:23:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-2-gshan@redhat.com>
 <20231106152229.02d6326a@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231106152229.02d6326a@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: uCzs3CVR/TsC

On 11/7/23 00:22, Igor Mammedov wrote:
> On Thu,  2 Nov 2023 10:24:28 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> For target/alpha, the default CPU model name is "ev67". The default
>> CPU model is used when no matching CPU model is found. The conditions
>> to fall back to the default CPU model can be combined so that the code
>> looks a bit simplified.
> 
> default cpu should be specified by board not by target internals.
> 

Yes, MachineClass::default_cpu_type used to specify the default CPU type.
I will improve the changelog in next revision to avoid the confusion.

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/alpha/cpu.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 51b7d8d1bf..c7ae4d6a41 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && object_class_is_abstract(oc)) {
>> -        oc = NULL;
>> -    }
>>   
>>       /* TODO: remove match everything nonsense */
> 
> Let's do ^^^^^ instead of just shifting code around.
> It will break users that specify junk as input, but it's clear
> users error so garbage in => error out.
> 

Ok. The whole chunk of code to fall back to 'ev67' will be dropped
in next revision.

> 
>> -    /* Default to ev67; no reason not to emulate insns by default. */
>> -    if (!oc) {
>> +    if (!oc || object_class_is_abstract(oc)) {
>> +        /* Default to ev67, no reason not to emulate insns by default */
>>           oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>>       }
>>   

Thanks,
Gavin

