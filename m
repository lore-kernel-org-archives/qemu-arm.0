Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9632922lff;
        Fri, 17 Jan 2020 02:48:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaTQczx7jvopEK7x9kWnu+PZv8oOZmBqeWY/OPZLdbk9HKRPH7UcwkGYnACfZjf2DK7Jsj
X-Received: by 2002:a05:6830:10d7:: with SMTP id z23mr5661875oto.114.1579258094318;
        Fri, 17 Jan 2020 02:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579258094; cv=none;
        d=google.com; s=arc-20160816;
        b=o34csXNpFWSLHx7epUEtFoGDVx9d0vxsVnxvMnBuEoftPJw8EtlOZf1BWY20GcqaWT
         lTgsRQjQRM9/2KvbIiiHudlctS77FPLUxpCmYAbEcLnhJDHyMPv33BoFA+dgq5ll6NKX
         OsmjN6xhlQnOdGZnqFpkBQMrfA1f9vbYZMjnzxuC6azZ2xJawx2UnEwhGWDvLEsVEKoy
         6eYm7nO85VICTZZ2H87Yquk1cJNQ5KBMFx5h9ymo+dinq/c8fSMBpurMJv9Gat9LBlro
         HiisQ1UClgzxcSRIEMAxmwzkV10RH+VXtcBaIvwf3xdoAbcLRrsb6cEWgKCfTyCRqOvS
         BDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=hD36Hvsk8Da5qF7t4uKSQN1+UVGUEWRTCtZNWppmGCs=;
        b=oKVJqeTcs3k1yg+bZyoQKjLBzTe6DNXP5G6Ol0o92WoU0Kf6DBo0Xx4nSBakN9JUXt
         cwBrmokgrNZEkJNRzDE69HgxRJU59gVtQWq90+6M0ekR9NIIarjiR+OIMDJ/P193dcY1
         MYhPfavw8nxeHvq6iM0C93/YzZkG1+H6dEVeOIvQitspfxrPOLbe0eheLWw+MD1IM9MM
         aTNuiikygrJhA4rK555RrUJl6tH0M9M/KIlKKlcdUQOJTAMOhHhBZeGVdJOZdyo/sPvE
         goqt0dw20uiO6ir2Gm5Mg5zcbVGZZj67MxRKl0VZKz+d2QE05F//nevnBSdMUS1wcCXA
         2nJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n11si13788843otk.290.2020.01.17.02.48.14;
        Fri, 17 Jan 2020 02:48:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgAQKsN (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 17 Jan 2020 05:48:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9649 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbgAQKsN (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 17 Jan 2020 05:48:13 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 01F3682DCE72C510EE0B;
        Fri, 17 Jan 2020 18:48:07 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 18:47:56 +0800
Subject: Re: [PATCH v22 5/9] ACPI: Record the Generic Error Status Block
 address
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-6-git-send-email-gengdongjiu@huawei.com>
 <11c62b51-7a94-5e34-39c6-60c5e989a63b@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <de0dbaaa-01aa-aba7-df9a-ddfb9a2164b0@huawei.com>
Date:   Fri, 17 Jan 2020 18:47:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <11c62b51-7a94-5e34-39c6-60c5e989a63b@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: GMlnbJLk1MrU



On 2020/1/17 15:39, Philippe Mathieu-Daudé wrote:
>>         table_offsets = g_array_new(false, true /* clear */,
>>                                           sizeof(uint32_t));
>> @@ -831,7 +832,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_spcr(tables_blob, tables->linker, vms);
>>   -    if (vms->ras) {
>> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>> +                                                       NULL));
> 
> Testing vms->ras first is cheaper than calling object_resolve_path_type(). Since some people are spending lot of time to reduce VM boot time, it might be worth considering.
Thanks Philippe's comments.

Do you think it should be written to below[1]? right?

[1]:
if (vms->ras && acpi_ged_state)


> 
>> +    if (acpi_ged_state &&  vms->ras) {
>>           acpi_add_table(table_offsets, tables_blob);
>>           build_ghes_error_table(tables->hardware_errors, tables->linker);
>>           acpi_build_hest(tables_blob, tables->hardware_errors,
>> @@ -925,6 +928,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>>   { 
