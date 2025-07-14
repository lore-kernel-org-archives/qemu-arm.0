Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D4C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 08:03:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubE9J-0003Nj-US; Mon, 14 Jul 2025 04:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ubDrr-0002RA-MY
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 03:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ubDrp-0006qI-Ra
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 03:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752479090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7o7jCDoC0+wRInZaPp9xy97Cy/R75nl2ffGEC6dV8ak=;
 b=PxlgDO2ycDq+pjQx10Fn0D3FsKOPzbpV9a81y0C77El/0qYnEUl6dkOnVnd4RTXtVc2ZMH
 SG3QEZltAekGxqntsG+aD1DumXPmzj+c/Huq966bvNgOJO1cLlno80IlYfBwWMavVOp009
 q8Nb0SD5kia8kRvxao3dlY6BcJN6FR8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-mNCf2qhHNzG3sqZpW8Jsig-1; Mon, 14 Jul 2025 03:44:48 -0400
X-MC-Unique: mNCf2qhHNzG3sqZpW8Jsig-1
X-Mimecast-MFC-AGG-ID: mNCf2qhHNzG3sqZpW8Jsig_1752479088
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-453018b4ddeso20166245e9.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 00:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752479087; x=1753083887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7o7jCDoC0+wRInZaPp9xy97Cy/R75nl2ffGEC6dV8ak=;
 b=nmiM9O45f6WD39wRC7ONwucLFTHmGwIqCp3R/h7p7y7bQdojNAHpyhKECiploZHTzJ
 00eg5BsPLGGT9lVf2OI5DrAUzfeDKaX9gOa5KauD79C3BasW15jSeTSD5/o7S4HWjCdH
 /ZhlHPyxDntFtR8RTGtOAiuBK9tMIYF4cCXeX1ooqv7Nd14VAHJMZEMCFbFJ8dUOcvLg
 YPSKcoFwnrSEc5ikowxIPNxdVoJh3QTKKidU5Pj/7PkU4XZ9rnSFaTMJQJ0WOcYFRa6w
 TxL9vkyoykr2O7tRku/YqzgcM/zvF6YpvD1p19bKsHTZo0qwKDeX/yhdy1t6rdDQYXQ/
 I9fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl1XQETRLfdzD/s7Z31LImfeKC7wykoE/ltLN+JvxRmxPj1XQlN4sJLxHzMxAnRv79F63ljWPRkg==@nongnu.org
X-Gm-Message-State: AOJu0YyiNfYCSLh8xev+ZsQeqSH3hg2j3P3cqXiIYkAhD2BwPXCutfDT
 mHtoGvX5k3R4tw8IlZ2yAXO1qkREyn/VgLsnZ5QcbnY93IZxxHZdQcR/V+BYpnABnOQ/jQlgXBg
 9bsvJ7m8NbkpUXeabOOXinorVXuYtih5/hAD/N70r0Kq6obUw6h2jVQ==
X-Gm-Gg: ASbGncswhP4ml7+HtriyM2P0UHtptzGB9A1b9UBlC3SLxMuCFqIn/GkjAlgBeZtuA5X
 39F9/KYMJn4YzSQjIiKrDtlsdtlyv04wm2AmTUxMK24srMsb1tqS84m2wiQvPIUWPApoygFinyG
 FHcnXUNJ7pJB1Q7P3PL+N5xBMnpmgXj+lDx4p7f6z7wAudrIDG/v6/JkWxRLE37F6UBBHT9dWK1
 StDHDxzGzRhWdWRJwuaMwjnYDeH8AwvOuPa6rzlNDWURAGVc3b2dbOrIsGQcPN4cwWSf1teeXdE
 x7A3tcUvCinweuha7w3g/UD9XR2aaaVo3l/yBOw5R5WpaVr5WY9yd/SjxxBKNXfgiMd9LEgXL/Y
 n8NUoYQKfAjA=
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id
 5b1f17b1804b1-45565ed62e0mr84961345e9.21.1752479087468; 
 Mon, 14 Jul 2025 00:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2AODneqfOHa9lhuR+GOgd4vFTQdjqsexw/UKHr0WI4vIu4Qc5LbbZYzb31Joaacq6TcfxZA==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id
 5b1f17b1804b1-45565ed62e0mr84961195e9.21.1752479087044; 
 Mon, 14 Jul 2025 00:44:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d732sm11870602f8f.52.2025.07.14.00.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:44:46 -0700 (PDT)
Message-ID: <dadf52b5-cdbf-46c3-9533-16ffcbd77793@redhat.com>
Date: Mon, 14 Jul 2025 09:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/36] qtest/bios-tables-test: Add a variant to the
 aarch64 viot test
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Jonathan.Cameron@huawei.com,
 gustavo.romero@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250708142437.1344644-1-eric.auger@redhat.com>
 <20250708142437.1344644-19-eric.auger@redhat.com>
 <20250711140014.0d79c004@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250711140014.0d79c004@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h2ZgaRxOTIi8OGWg-gZq2Wmkvb3u2Kq62A-qKK4UfHo_1752479088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Igor,

On 7/11/25 2:00 PM, Igor Mammedov wrote:
> On Tue,  8 Jul 2025 16:23:00 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> I'd merge this with previous patch
checkpatch complains if I do that:

ERROR: Do not add expected files together with tests, follow
instructions in tests/qtest/bios-tables-test.c. Files

  tests/data/acpi/aarch64/virt/DSDT.viot

and

  tests/qtest/bios-tables-test.c

found in the same patch.

Thanks

Eric


>
>
>> ---
>>  tests/qtest/bios-tables-test.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 4dbc07ec5e..357bcefd37 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -2237,6 +2237,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>      test_data data = {
>>          .machine = "virt",
>>          .arch = "aarch64",
>> +        .variant = ".viot",
>>          .tcg_only = true,
>>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",


