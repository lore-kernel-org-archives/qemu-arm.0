Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2698522dle;
        Thu, 13 Jul 2023 06:01:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHcckgDymDCigBxFgNtgmfTnWWQ1Ny9ML55ktqTsibUjan2Irp08dMaS34OkLR2sgDnov2u
X-Received: by 2002:a05:6214:c6a:b0:62d:e73b:c4ab with SMTP id t10-20020a0562140c6a00b0062de73bc4abmr5621249qvj.1.1689253271001;
        Thu, 13 Jul 2023 06:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689253270; cv=none;
        d=google.com; s=arc-20160816;
        b=l5W+K2oWZp9MtaVAQBSUJjZJUzV0B+29K4TdRDbYyP+sjhQuc6x3OKCURcxBIb658k
         YvAiKebl11T2df+BB8+LZQeT5dU2QJodQeAr0ilZMgZqIZ10xui3MfhM1PjrcImDZd4D
         ReWtgFhPxUVFrYtSpyxKJrX4FRymNNWKwoRorTnJOYcJ35QQ92/YoQmlsKN945DRJY6a
         d0+JD98FHimL6oLmavs+l8f/qqlvwoXdQc5emo01/+hNNaZqCCGvTuUdHXpFSOZXiSHW
         UQbUlt56I4VEL8MGYSl85pGbPKkXdOVlAATSbe8dN78k3xBcIdICGDVZCNVl8c/qh622
         7/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3KVspK4Yi5j3UqTEjGhaqzh33UwKcUOEgAdtql+oH04=;
        fh=pn3LlZhgu+sbT94yItJDJiGB6vU2uVMcI/rtlc9RJ5o=;
        b=orju1dK2Ko30ovmxmSjAS+qnp4jxCocatNGQAchCgDpDRl5BJJ64x2DZTx+rgvYaB8
         0BsmYGeyWieSVVTC7GN267Hz4APemqUUortE1vzwqg0TqeL/lBBxKDOf9kGzkPzUpsK/
         Mzi6tZH9gmXGMh02t5IBCdTR7WAFE77waImT+5gz5sWC5B3FVQ4U6XR3qJ5JTpRavjJs
         ZxJtVR2wT+CjRz0ZQSZRSh6KNB4XffZnFZC1RqTCcVYqljdUx6q52Q2L3Y8yCcx1+mvN
         IkeIAw/v484XnzIn7dPIAJ6gOizKfgO+nI6M5XUxbLnMBRhty+4f6RXWZeoRWM2ayr1o
         A2/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W1Mm5mc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a0c9d48000000b0061b7b4c78bdsi2940548qvf.558.2023.07.13.06.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 06:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W1Mm5mc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJvw6-0002y2-1P; Thu, 13 Jul 2023 09:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJvw3-0002xZ-Kk
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 09:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJvw1-00083M-UM
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 09:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689253241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KVspK4Yi5j3UqTEjGhaqzh33UwKcUOEgAdtql+oH04=;
 b=W1Mm5mc5oPU3xnX/tLOigqRHJsXQmyNXaBPjqF+GjaSq5J8Os+F+cXaM7KbFnM5Kit3OIw
 3MmXMioHKdCMyRilTO/kYXOGSyR9nkTcotzoxC4GQqf2sWQKuV7mO4E4x9OlFalKHDX/Kt
 JWwOxFYSDf3UOmxSE+Oim8AubbBkiFU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-xl5tOk0bPkylHSKodgWT8A-1; Thu, 13 Jul 2023 09:00:37 -0400
X-MC-Unique: xl5tOk0bPkylHSKodgWT8A-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1b8a4e947a1so10698425ad.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689253236; x=1691845236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3KVspK4Yi5j3UqTEjGhaqzh33UwKcUOEgAdtql+oH04=;
 b=P+neBwGQoz1ICOtgF37G9nDi14t9+TV0JpRbq6iSmVU25KcIZIkRqYElYWRiF6NLr3
 xy4/ksQQcHKLdSTTCTs9RkARJrKvLnVDGq0KOptoFKwgpVB0GmliDg77qaMWKJeQ/HsA
 E28Ov6xSuk0bGpLC3CUMh4MrNm1YROXOGlDP8lkbkuPOyN3rWbGcWm7iB6zX+dGRMOum
 OgNleJH73jeVj5pwX+odWQLvBY1oAPkBiLZT8NBIRYabouXxdaFIrktdVYpTWFRiQ3Dm
 4SFDv2NshWBjscBRGgOXXP7ZeS6vNxRoOZxstmfs+M9OnUGElM/l3ZfMBGJrUl9MEO+w
 +wmg==
X-Gm-Message-State: ABy/qLaSCz+GQuHYwMHemiVT9sL67y1GCBZPQZYPOGHMBO1EwEAeGqc2
 JaT0sFRSqqJBoaGfJaGQtycWxiae+J6hIH4VAf8feVUlpSwZP3CiqRuqHs0/ksolbQd/kLNyVMT
 Az2cr2yzxobbE
X-Received: by 2002:a17:902:e80a:b0:1b0:3d03:4179 with SMTP id
 u10-20020a170902e80a00b001b03d034179mr2195891plg.6.1689253235962; 
 Thu, 13 Jul 2023 06:00:35 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:1b0:3d03:4179 with SMTP id
 u10-20020a170902e80a00b001b03d034179mr2195816plg.6.1689253235081; 
 Thu, 13 Jul 2023 06:00:35 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902904200b001b8013ed362sm5863643plz.96.2023.07.13.06.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 06:00:34 -0700 (PDT)
Message-ID: <12d0c82a-f9d7-03d0-f2cd-0fead92d3156@redhat.com>
Date: Thu, 13 Jul 2023 23:00:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
 <2e1fbb6c-e7b4-df42-c64c-59de47f05981@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2e1fbb6c-e7b4-df42-c64c-59de47f05981@linaro.org>
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
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OsPjamD+eciQ

Hi Marcin,

On 7/13/23 22:44, Marcin Juszkiewicz wrote:
> W dniu 13.07.2023 o 14:34, Gavin Shan pisze:
>> On 7/13/23 21:52, Marcin Juszkiewicz wrote:
>>> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>>>
>>>> I see this isn't a change in this patch, but given that what the user specifies is not "cortex-a8-arm-cpu" but "cortex-a8", why
>>>> do we include the "-arm-cpu" suffix in the error messages? It's
>>>> not valid syntax to say "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
> 
>>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}"
>>> string from names:
> 
>> Peter and Marcin, how about to split the CPU types to two fields, as below? In this way, the complete CPU type will be used for validation
>> and the 'internal' names will be used for the error messages.
> 
> Note that it should probably propagate to all architectures handled in QEMU, not only Arm ones. I do not know which machines have list of supported cpu types like arm/virt or arm/sbsa-ref ones.

Right, there are more boards eligible for this generic CPU type invalidation. I will
cover all of them in next revision. Currently, the pattern of prefix + suffix, used
to split the CPU type name, can work well for all cases.

[gshan@gshan hw]$ git grep strcmp.*cpu_type
arm/bananapi_m2u.c:    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
arm/cubieboard.c:    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
arm/mps2-tz.c:    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
arm/mps2.c:    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
arm/msf2-som.c:    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
arm/musca.c:    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
arm/npcm7xx_boards.c:    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
arm/orangepi.c:    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
avr/boot.c:        if (strcmp(elf_cpu, mcu_cpu_type)) {                                       <<<<< needsn't CPU type validation
riscv/shakti_c.c:    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {


>>> I can change sbsa-ref to follow that change but let it be userfriendly.
> 
>> Yes, sbsa-ref needs an extra patch to use the generic invalidation.
>> I can add one patch on the top for that in next revision if you
>> agree, Marcin.
> 
> I am fine with it.
> 

Thanks a lot for your confirm, Marcin.

Thanks,
Gavin

