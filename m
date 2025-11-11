Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A913CCCFA1E
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 03:49:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIfNT-00043P-6d; Mon, 10 Nov 2025 22:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfN2-0003nk-TP
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vIfN1-0006cY-5A
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 22:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762832917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPGuui8SBGheFLhas8Pqh2/BAdq8ijPyxbdhQCyTMmA=;
 b=gbPcFLUAh8W0teJiLyXopArZs/stdzcwWIEG9pfxXuV6UkgxON80G03Uix2AAkfY/zxLGH
 cVlYtULuFeO2cXy+8lf4erpDkyxhs51iXwC99gwP63VnXIv/iMnKy7snurTNc26Knfvl48
 t6rrXf0bl+htD4PkjtXQqX9xFkIua0M=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-q6cOixrXP3KuX7docBbNAg-1; Mon, 10 Nov 2025 22:48:36 -0500
X-MC-Unique: q6cOixrXP3KuX7docBbNAg-1
X-Mimecast-MFC-AGG-ID: q6cOixrXP3KuX7docBbNAg_1762832916
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-343806688cbso3001575a91.3
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 19:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762832915; x=1763437715;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPGuui8SBGheFLhas8Pqh2/BAdq8ijPyxbdhQCyTMmA=;
 b=aebFH4yVnQlUVp3cvmkQ5+PzOk3UxeGFdY7Rg9uwulx28PDuPG7ys7OqMkwW7eh25f
 62DMqwuT/bNqT78gXyffrMlN3PsrHbz9iCEQWulvXU+jFIhXr+B6sDVEK+Toagcn9h3r
 JxJ2AfIs/x9ltlLW1aXdfbmbnMOLnsMvG4G8UBi7FLZO27jlkyUs0UzFXpG71P6C4Bz7
 9+k8/+WGlPoL06vQsUm2LqITJnX4QISKB8lp5BEwXQdVBFTfe/C8Fe65Mx6uE9QG8OLU
 wovxpCiXht9bzP1X/vY1juFOmTADmL5yMNHLSDYIzTz54jDs6Zqr+/HI25i/skHYxL83
 60VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGTQS7rFt2CKvK+7gKU5of5+cFTYlAEscxwjs7WpSs713Ci+nkoBBKc/FXNtFm74Zyk2jG4QcPrA==@nongnu.org
X-Gm-Message-State: AOJu0YzxW9H7yLtsEcC7QbDDSbusybDscTp1kQu1dy1fVbcvWn2ro93j
 nZ8MiY/Qi/IYT+jv+Odowv6BPEMW5fc8wVJmrDZjlZwmYNw2a8/EEQWw2GwIj1SihpDrGghpgI8
 ArQoRyA9XPcTskMJ+7bhhrSYkZ3Tg+H9ObVsvYihDRv2DCeW66zLJbg==
X-Gm-Gg: ASbGnctqbyMFiALeUwZP+15JHwjmkvRAwyXogYveFJgcwNp608Wru55CYDIIBxa59Ar
 08W8+fQ8bAULHgalVr488qFGG2CBy7sd95vzm0vBPfkZ0FgcbPCaS7GXUCzBC3+V81LtEKVekUc
 Floa94zCOEJV95WXYfExVhu/r5gZXQIbx4u+sylMwpIOUrH7kIQfqzZCrOh6rJP3w/G4KKY6l4R
 OBluWnvuwXJgdrJoyhLQuWyPGxuMl5yH7X18kpN7RS9aGrwRbyuVzhiuESgXD8doRlWJIExaoHG
 4uFPr0FLqB9B39xcNEFOJHWRKB6NzlDfpkmDDqWvFCAJl8nxXyc0eHjnVMCHgf+QTW7g/QQ0vrs
 d265RdXUFkeh+kN85hEdT5DDSc76hQGVnerXx5W4=
X-Received: by 2002:a17:90b:538c:b0:339:eff5:ef26 with SMTP id
 98e67ed59e1d1-3436ccffa15mr13252908a91.30.1762832915522; 
 Mon, 10 Nov 2025 19:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnKxR4YO/Yueh3AAqis1e3B3v5PvmTaEnhFUeFskrv14hlgyU+e/8flfbLu7iSKLnTEg0jqg==
X-Received: by 2002:a17:90b:538c:b0:339:eff5:ef26 with SMTP id
 98e67ed59e1d1-3436ccffa15mr13252879a91.30.1762832915066; 
 Mon, 10 Nov 2025 19:48:35 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343c4d2ddf5sm422091a91.4.2025.11.10.19.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 19:48:34 -0800 (PST)
Message-ID: <5320f1ee-a01b-45b7-97d5-e868a840ffc4@redhat.com>
Date: Tue, 11 Nov 2025 13:48:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] acpi/ghes: Bail early on error from
 get_ghes_source_offsets()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-6-gshan@redhat.com>
 <0398f3bd-f91c-46ff-9162-2d16db434ede@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <0398f3bd-f91c-46ff-9162-2d16db434ede@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5jjHLevoHh_tnvo2CbQU-Nfs92W7Ny4S4O2yUF8sN4o_1762832916
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Philippe,

On 11/11/25 12:50 AM, Philippe Mathieu-Daudé wrote:
> On 5/11/25 12:44, Gavin Shan wrote:
>> For one particular error (Error), we can't call error_setg() for twice.
>> Otherwise, the assert(*errp == NULL) will be triggered unexpectedly in
>> error_setv(). In ghes_record_cper_errors(), get_ghes_source_offsets()
>> can return a error initialized by error_setg(). Without bailing on
>> this error, it can call into the second error_setg() due to the
>> unexpected value from the read acknowledgement register.
>>
>> Bail early in ghes_record_cper_errors() when error is received from
>> get_ghes_source_offsets() to avoid the exception.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/acpi/ghes.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
>> index 527b85c8d8..055e5d719a 100644
>> --- a/hw/acpi/ghes.c
>> +++ b/hw/acpi/ghes.c
>> @@ -513,6 +513,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>>       } else {
>>           get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
>>                                   &cper_addr, &read_ack_register_addr, errp);
>> +        if (*errp) {
>> +            return;
>> +        }
> 
> If get_ghes_source_offsets() can fail, then lets have it return a
> boolean.
> 
>    if (!get_ghes_source_offsets(..., errp)) {
>        return;
>    }
> 
> See commit e3fe3988d78 ("error: Document Error API usage rules").
> 

Fair point. The caller ghes_record_cper_errors() shouldn't check '*errp' according
to commit e3fe3988d78. So we need get_ghes_source_offsets() to return false on
errors. It will be improved in next revision.

Thanks,
Gavin


