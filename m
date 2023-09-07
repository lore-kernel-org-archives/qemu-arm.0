Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp58701ejb;
        Thu, 7 Sep 2023 16:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd3nOXhvU9I+9AmIgyrxpZzFpJZHXLQsyOzmUQ8suU7hA3tn+tj4digaHMH4HTQDI+L0nn
X-Received: by 2002:ac8:7d4d:0:b0:410:9b45:d7ed with SMTP id h13-20020ac87d4d000000b004109b45d7edmr1240697qtb.56.1694130651704;
        Thu, 07 Sep 2023 16:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694130651; cv=none;
        d=google.com; s=arc-20160816;
        b=LWe7s9Afup/ac9mCKbtrIxFPq/yi0y1VIlT1LzeDK/+KjsyZ7GSAVeyrONxdBFT3ae
         zRnxsSkBtuYoKXiyL4iKK/qjmyv1JvOaTgXjTXRukT3mEK0blmRy7Yu0lDowlLcyLV0O
         lrxBi7sBYN5HxSamCtuipBXcQ1oKUBCLmFg6ic+Vxo7u818eyR7iNCUmyGMQ+/6+sRdT
         iuxzcRQWK90vZCwfXm4d9dSmKW5f2DmpDAMXEI1pQGHuhCq9eYM+V8fE6s4EFzKiUCIO
         uo+CYyqNXX7TR+Ox2Ujqtp6B4ge5LsLCHYfRMSORR6OSjcK1ywm/a8jGi5PrYDMritdo
         mAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eGvucSUm4qFvKXLIeZFGZYfDq1ItUQUoCdA2ibrpk6w=;
        fh=FFLd8H2YAgUuuaKYWnF7a+S/5kq2UZ6CUBZpaG7nLWA=;
        b=nashnBg6qSiRbuKi+BiReq72tCqG7ydHiv/E9AQEj7mFzTAsNFul7QWTeWwdhTffBb
         +2TDeLvs7HwmdwXRJUS04rv8d/C5zW2WWaQ4J61W/xyDANOgd6Wk2GG/5R5uHUcsgX60
         Crwaw3k+U4DGIyNkRjSVSZJsZxkZtfLD/3dspMl4boL2QvK+0yt2rkm68vI05rMk47+e
         5A9vXqBPjGKEHeL0cPu2Zs7r3IDb3aoge66xOPqjdATX3nTmZt4qrLGy9xeD2gF0bWlP
         f3wbGkdW0/H7dsiAonAtrnvLAWHaFjI1+jIezadeYsG+XKE5jVJQ0e2D5LHSJ3IDhxN4
         s/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/3GpQ61";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020ac85f91000000b003e389c10fd6si473705qta.742.2023.09.07.16.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 16:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/3GpQ61";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeOlN-0000PW-2G; Thu, 07 Sep 2023 19:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOlJ-0000Od-PF
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qeOlE-0004dw-7R
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 19:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694130607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGvucSUm4qFvKXLIeZFGZYfDq1ItUQUoCdA2ibrpk6w=;
 b=g/3GpQ6123++yAylPECO3YHi8K/hrw0OwsPqB3NDajsdJvRSKLQxNq59LGtgs89/n+frc/
 qm7ME76IbRHjB9/dqZ0xUAM8GRJulXbUTre5dFJRQ4PhHTxgLjj6yljpd0Fb8qoH+pJe32
 Q5rm94VEsFwDX1VT3Rgfo0MZMU8cOCM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463--uH7YzfbMq-TxayblpnO5g-1; Thu, 07 Sep 2023 19:50:06 -0400
X-MC-Unique: -uH7YzfbMq-TxayblpnO5g-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1c0e39e669cso21323885ad.0
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 16:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694130605; x=1694735405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGvucSUm4qFvKXLIeZFGZYfDq1ItUQUoCdA2ibrpk6w=;
 b=ClV2MgFOl1Maxcb9/tjo6oQg3EBvxedWkokJzARjvgbWXxYXH6umdNgWE6L6sYqkHj
 bg40HEf9pCN2EJpCxCgRNKLypiYvQn9dQNLR1fNsU00HgaQEAkPTxwq5rppdyPtEe4Ln
 XV141urxMir4b1q0csWPuqjpA2YjlnyVfUQrS8kc3Sxfvd/5Ycrxse9c5IoR4bn8kswQ
 1uUEJOVMHCz2ScInBSMFHLCFgn3MNRTU8PyjhnxHy0OXV81t7byR3kqhuV/Iq9RgfdiY
 OJo0Evk+0AT2wWTRplq9Y6ZOCsLjrkAXlqOJRaY0M7rp5WrZiNmg+YQUM0bQ4TnUyqn9
 JhiA==
X-Gm-Message-State: AOJu0Yw6hrpg9YRMxueBvvrqiuk4pLCAWWbVE9l7Fk7w4V+r12u+K2tD
 fBvlZq/Z37yPuTtMoyfY2wmbgdWUqYSxZ2FX5MFYhLydK/hdY4v6iIl6XyWwKqgIRFCVfYIirzU
 Kh4jt99ImUUvi
X-Received: by 2002:a17:902:f693:b0:1c3:83e2:d0c6 with SMTP id
 l19-20020a170902f69300b001c383e2d0c6mr184898plg.52.1694130605116; 
 Thu, 07 Sep 2023 16:50:05 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:1c3:83e2:d0c6 with SMTP id
 l19-20020a170902f69300b001c383e2d0c6mr184873plg.52.1694130604796; 
 Thu, 07 Sep 2023 16:50:04 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170902e9c500b001bb04755212sm287862plk.228.2023.09.07.16.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:50:03 -0700 (PDT)
Message-ID: <d4aebe17-c077-90ad-2b99-a856b3a4cdcc@redhat.com>
Date: Fri, 8 Sep 2023 09:49:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/32] machine: Print CPU model name instead of CPU
 type name
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
 <20230907003553.1636896-28-gshan@redhat.com>
 <5a87e81c-b28e-d117-7384-38945a2c5b8d@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <5a87e81c-b28e-d117-7384-38945a2c5b8d@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: nBVOdK5vv/Vd

On 9/7/23 19:05, Philippe Mathieu-Daudé wrote:
> On 7/9/23 02:35, Gavin Shan wrote:
>> The names of supported CPU models instead of CPU types should be
>> printed when the user specified CPU type isn't supported, to be
>> consistent with the output from '-cpu ?'.
>>
>> Correct the error messages to print CPU model names instead of CPU
>> type names.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> 
>> @@ -1373,11 +1374,18 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
>>           /* The user specified CPU type isn't valid */
>>           if (!mc->valid_cpu_types[i]) {
>> -            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> -            error_append_hint(errp, "The valid types are: %s",
>> -                              mc->valid_cpu_types[0]);
>> +            model = cpu_model_from_type(machine->cpu_type);
>> +            error_setg(errp, "Invalid CPU type: %s", model);
>> +            g_free(model);
>> +
>> +            model = cpu_model_from_type(mc->valid_cpu_types[0]);
>> +            error_append_hint(errp, "The valid types are: %s", model);
>> +            g_free(model);
>> +
>>               for (i = 1; mc->valid_cpu_types[i]; i++) {
>> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +                model = cpu_model_from_type(mc->valid_cpu_types[i]);
> 
> cpu_model_from_type() can return NULL:
> 
>   char *cpu_model_from_type(const char *typename)
>   {
>       const char *suffix = "-" CPU_RESOLVING_TYPE;
> 
>       if (!object_class_by_name(typename)) {
>           return NULL;
>       }
> 
> Don't we want to skip that case?
> 
>                     if (!model) {
>                         continue;
>                     }
> 

No, it's intentional. "(null)" will be printed in this specific case so that
it can be identified quickly and mc->valid_cpu_types[] need to be fixed by
developers.

>> +                error_append_hint(errp, ", %s", model);
>> +                g_free(model);
>>               }
>>               error_append_hint(errp, "\n");
> 

Thanks,
Gavin

