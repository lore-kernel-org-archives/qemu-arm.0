Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2802426ejb;
        Tue, 28 Mar 2023 09:59:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350aepWhw0/N/3GGKzwWIO+bDmgZarqWwjf/s776I8dqNeyemCvD1f5nDjPaKDBw+ThVi5t+h
X-Received: by 2002:a05:6214:d84:b0:5a6:9028:7b89 with SMTP id e4-20020a0562140d8400b005a690287b89mr26297675qve.35.1680022759219;
        Tue, 28 Mar 2023 09:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680022759; cv=none;
        d=google.com; s=arc-20160816;
        b=m8d0BwSosU2323jP91ZTCBZEiUkh8nUZY4qGNfCrMql2JNkUztg97XC/NK5oJdHX+F
         vFi4X+BBsrgWP5+YMCgHyxM3w5Ddak+CRkDsA58K55coQYu+bFTVzq6iIKdEp9UsHrNb
         culwXsdGHoDL18fyDzjkJ8rFtL2H0NHBNDfw+VqakfG6184bnaGpNpUAxdhl1Bpv0Vyt
         oCs1QxpGKKFmhtYZV0rbzNIMxxAFM8H9AWToPcoT8lMmeNRcR/MJlpbGuCYTkmO6MSfl
         52R/rn4qMN70IWsfdKD/OR99xvHAc2H9r5UG/iWWvxb6nYQG698TDMdXF/KFDHfNHYwZ
         RV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=fzBMtKXlc4JDfuHrDq7UsszjrhTAq698GnqgTTtuYYs=;
        b=dOKRuhErfG2macjEDBzWgtKFvNyS2iEvu1pvk99JYvUPdzLQnJbKJZ7/R507Sqo72U
         8NoLfWQYc8Uumtq9vGGRUnWGPXKtvMVdFWq41lu9PM212sNgOHJ+D2rYAMJkvGGhdZjT
         mQDXE5OBo452wn8m9QKk+QGyZE/sw7DgKFNjb5iTAAKPuiWlaOdYLaXbMZK7cqZUSxyf
         hmaoJXd3Gq+cbVeqXVYjAKXfwSy6kj6iqNKtuBRyBVsdFUDyV7byn99z/TzL6N7bESAr
         DYCr6ViDTNM26MT5Lz+IiP304uEBB5w6HtP7HFePbY0gem7DIT9mdIJjCEm+Tf0YzZck
         3xFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJ8T5C6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a008e00b003ba1ccba50fsi5048827qtw.557.2023.03.28.09.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 09:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJ8T5C6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phCep-0006td-Cz; Tue, 28 Mar 2023 12:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCen-0006tJ-Db
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 12:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCel-0004vR-TT
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 12:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680022727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzBMtKXlc4JDfuHrDq7UsszjrhTAq698GnqgTTtuYYs=;
 b=UJ8T5C6mAYxGpP/EQRmVWUjm4jFiN7bfGRwKfnHzhyqZl6F+ATIhQHe3EvJL2TabgZ/Oza
 +FPDaECjvfil35k1WRu3haco2SwT2lcGC2z6KDDJluXv+BOgWeyrSWWMP/YQq6X87+QQsR
 uWypawqiakDmbuckPRzsWso7iQazLuw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-e_sCve1qMeCVejWG3WMA-Q-1; Tue, 28 Mar 2023 12:58:43 -0400
X-MC-Unique: e_sCve1qMeCVejWG3WMA-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 679AE1C05157;
 Tue, 28 Mar 2023 16:58:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3F2202701E;
 Tue, 28 Mar 2023 16:58:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24AEA21E6926; Tue, 28 Mar 2023 18:58:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com>
 <87zg7x2wca.fsf@pond.sub.org>
 <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com>
 <87v8il19sz.fsf@pond.sub.org>
 <f00b7e27-4c9f-226d-d727-241430be1d4c@gmail.com>
Date: Tue, 28 Mar 2023 18:58:42 +0200
In-Reply-To: <f00b7e27-4c9f-226d-d727-241430be1d4c@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 28 Mar 2023 09:54:13 -0300")
Message-ID: <87a5zwx16l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: nZrBWtPwFWrc

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 3/28/23 06:53, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:

[...]

>>> I believe we can improve the ARM boot code to not create ms->fdt at init(),
>>> leaving it unassigned, and make get_dtb() return the machine FDT on a common
>>> "void *" pointer. That would spare us from having go g_free(ms->fdt) to avoid
>>> leaks and we would assign ms->fdt at the end of arm_load_dtb() normally. I made
>>> a quick attempt at that but the ARM init() code is a little tricker than I've
>>> anticipated. I might have a crack at it later.
>>
>> Do we want a quick interim fix for 8.0?
>> Have a careful look at the untested patch below.
>> 
>>> Thanks,
>>>
>>> Daniel
>>>
>>>
>>>>
>>>>          }
>>>>
>>>>> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>>>>        qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>>>>                                           rom_ptr_for_as(as, addr, size));
>>>>>    -    g_free(fdt);
>>>>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>>>>> +    ms->fdt = fdt;
>>>>>           return size;
>>>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 50e5141116..54f6a3e0b3 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>                                          rom_ptr_for_as(as, addr, size));
>>   -    g_free(fdt);
>> +    if (fdt != ms->fdt) {
>> +        g_free(ms->fdt);
>> +        ms->fdt = fdt;
>> +    }
>>         return size;
>
> This looks better than what I've been proposing here because it centers everything in
> the same spot. It'll also make it easier to change/remove it when we have the chance
> to take a look at the ARM boot code.
>
> Just tested it here and it works fine. Feel free to format it into a patch and send
> it. I'll give my r-b.

I'm going to send it as v3 with your S-o-B, because I'm stealing most of
your commit message.

