Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1194416ejb;
        Thu, 30 Mar 2023 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350YAWZlUMJre0OQ5TcU4ZpgDT+kPo9AiAp7VGHwOojhl2DwMp6IUVloyIVO33jPQdESlIWYN
X-Received: by 2002:a05:6214:dcc:b0:5df:4d3e:b8e0 with SMTP id 12-20020a0562140dcc00b005df4d3eb8e0mr11615296qvt.4.1680178228828;
        Thu, 30 Mar 2023 05:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680178228; cv=none;
        d=google.com; s=arc-20160816;
        b=JjNlQD9tnQ+jHIVG1ih1/vM5RJfNzJgPB+0SDOeDg87wzteZSEsK5fUoEx3JqnRnD7
         Egd7m+RMfkaC/JPlL36aNTAPCpf77eGs6vS0ct4/cescKcwYvRTrMElT54MWzfQbrW+x
         vEsT6etLRqWnHoGfW1IUA0OZ5ZuQ9pv8WAG8+UNgeCu8sqKiim9j8DZ/0hi9UHQ08jw6
         T7Pq61uQtnbRlOnF+uJYsKv+FfIbh3P5ZyuvZuS5peRJxojMwgl6cw7yeSLwifcnav/N
         dkdH9prKIvgManJ+Bvcg2JvaV7KbKxyLhSRFsyXdhw6LL74sWS5AM4ZlK6EJXNWGEfzb
         TrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eSwrjbjEtfQhB/Q3VIoA612PGO5lvJ8dps+42mp++4I=;
        b=SyjHTAchD/Cxd26L9n4rKp8VlfjJR1XzBKU9wU63QBs6x5jEIBSR+VUtvNv7FtZZY7
         W4vySfAxCxXLCl/FrVgQc5L98i5AODp5pQdnLGZa/0R9tAqxISxhnHvLy+eYgapr0ty+
         WVJ3jYevnC4Hf1JHWCB1j7++zOUaWOoa9+N9d84F04uQ/ukIVHNOj9LGihb+roGg6zWr
         SO6rNSORcDDxJz6dSw1C2Hd8hCo8aQLRI+MZQH6qEALNY3ZM21I0/Rjpw1kQLKJmc8PC
         HMS1EIhdvuWSxi70KQ2VRV77P6SlPuAsLvqjGFt+rUcap0nzp1L/tJUi3YyFNdWv/WJx
         yyXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TlFUbsFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pm9-20020ad446c9000000b005ae63b24e24si24789307qvb.53.2023.03.30.05.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 05:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TlFUbsFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phr6i-0003bh-JJ; Thu, 30 Mar 2023 08:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1phr6d-0003b3-Nt; Thu, 30 Mar 2023 08:10:15 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1phr6c-0006M8-3D; Thu, 30 Mar 2023 08:10:15 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17ebba88c60so19463576fac.3; 
 Thu, 30 Mar 2023 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680178212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSwrjbjEtfQhB/Q3VIoA612PGO5lvJ8dps+42mp++4I=;
 b=TlFUbsFgKDsDvXO2AkIoeM/CAxmhODcXjABFyR6a8R786BrY/Rn+LA2r6ATq0Pws3H
 s17IGHvuOc+8fbz1D4IB7LrUuQGnH94kgfF0mtWmwZMuWUQrKtHLHMrnujO21HLoGcLV
 kKgB1XPcP7Sj70LJkdfsi9m5dWueqvs+cMU2HGkLfQZ3P7n+yznInDV3b1PthBh8grfS
 MlnQWWADm12xq0ZhqOu1FCS7+/GGIrVX/qLfq6onD2AYlfOR4Bp/l7HAzKEybQdJzg1B
 xkU2VeyEZTTQ09i/R8u/utOY3FcvhwdhaL840poJVYePmejvW+oHIsRTr4SzrvC7l4Kg
 PHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eSwrjbjEtfQhB/Q3VIoA612PGO5lvJ8dps+42mp++4I=;
 b=f8KguNxUMxOxmrWErIxxsaUQb0UFw5qt3sN7E7tsfakrHg2rTQba1Sm0ZPPvkVvDjk
 FNZQb1zfxLMcpgOgSJKB4DhngZzMbHBSd+uYzgP3kX/B5NPyKggzw7PR+8+siyGvFIWd
 i8O/oIOEuoASsnLDS49QbtLOtIdV9jvs9stryL+s8F907n/3yUna3xr/GeLX/UlR0jju
 JjLwRJIQjfyo6YeB5bQFaKFvk23HaZ36/O5sQkD1PLfaUNpT2HbWzZHWHCZjyRiBcQlx
 NKqm6ZiSzQSJCBC70c6n+ZCklcAW3eMCQ0Z0Nsr+KVHzoFrGBmHJGbLBaM6XyvNzF1Wy
 RQwA==
X-Gm-Message-State: AAQBX9eGAwAy57Y8wN3qMMI6tp869XO2D851qtUSvmlpVnPK8VwCZxah
 J9ybA2ZTjo4e1VbUzXizqRk=
X-Received: by 2002:a05:6870:8a0d:b0:177:be6c:f4df with SMTP id
 p13-20020a0568708a0d00b00177be6cf4dfmr13772168oaq.46.1680178212235; 
 Thu, 30 Mar 2023 05:10:12 -0700 (PDT)
Received: from ?IPV6:2804:14c:f435:9162::100d? ([2804:14c:f435:9162::100d])
 by smtp.gmail.com with ESMTPSA id
 ta10-20020a056871868a00b0017197629658sm12671382oab.56.2023.03.30.05.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:10:11 -0700 (PDT)
Message-ID: <ee3d4b74-9e88-20aa-cb97-18d570043aa6@gmail.com>
Date: Thu, 30 Mar 2023 09:10:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230328165935.1512846-1-armbru@redhat.com>
 <20230330115830.gj5ntltek3auh4sz@mozz.bu.edu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230330115830.gj5ntltek3auh4sz@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: izaJo2ZukgMQ



On 3/30/23 08:58, Alexander Bulekov wrote:
> On 230328 1859, Markus Armbruster wrote:
>> At this moment, arm_load_dtb() can free machine->fdt when
>> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
>> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
>> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
>> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
>> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>>
>> Since monitor command 'dumpdtb' was introduced a couple of releases
>> ago, running it with any ARM machine that uses arm_load_dtb() will
>> crash QEMU.
>>
>> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
>> of freeing 'fdt', assign it back to ms->fdt.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
>> Reported-by: Markus Armbruster <armbru@redhat.com>i
>                                                      ^ Seems like a typo
> 
>                                                      -Alex

Yeah it is. Persisted ever since v2 :D

Nice catch!


Daniel
