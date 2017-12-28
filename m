Received: by 10.223.134.117 with SMTP id 50csp5609408wrw;
        Thu, 28 Dec 2017 06:47:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBos4IiJLDIxg5/87KWG59Nud5Nz+9IAeATYS1/h2JE8L0m7Wy79geM/Tb1uQnrJul2kSBJcJ
X-Received: by 10.159.207.145 with SMTP id z17mr31667236plo.269.1514472434502;
        Thu, 28 Dec 2017 06:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514472434; cv=none;
        d=google.com; s=arc-20160816;
        b=XpIfNcN0OH76hFm/M+m6NA93fVi9gHy+gKExPD4Sxv3HRyVgGOvpztR5kKnoeCQRRi
         /5ibDCJT1YihBeNKYCaT+UadZD6LubaoRTBQRfTT08fiUiLkwUiNu88IFhx0VbLwQgEz
         Bmd/J315IAgMs+WfXnGDWrSXP7UOKO2sWWyTXltDh1mVUdK6s7li1PmxSDRY+LJYSwsi
         6akRgLr3dMzU7SW5oKzIths/wq0ePe7WIj0Uvi3VVub4YAQW5nerr+HUZU+7CyO+zX8F
         /4Lv7fD/bJGkTiJE5Gw+0rzBpsxq87Io1jWWL7YvqbWEIeHOKvinASHgHb/mU9wrZ9aA
         eTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:arc-authentication-results;
        bh=lmVxI8KuJB+9eyZZLjsW6gKKb73rMLGHPYME6V5TVgo=;
        b=G9ZSI9eKrsp8fS1YKUdKFK0TmKAjksbaKJiBTONEXcSWFDaXkh8JBDs+t7UGGke6yj
         OMmWQxk9+zMqJJ9ykAcH9hn/j7yKCPakSHRS1GCdvsZZdKLZLMQlu/8EvTKsqhl9L1Vo
         JkBxfijGv0HS9dSxBSRErkB1wZPHnFFLLiyoCnXisWXF9mfVOWH9iaiG/PqXpcTch/+6
         9brtUS0Xw/OuyQU/4KRRmIrRh+0OTMtQwBZuEn8Ixc3jZd9Uea8XT9+4qhm38MTNU075
         KIbkz5REtsCPaO4/EnFFj3gOakvY7eZEW7z0Zn+k1z28P043g1dCRCZ3FX+N1d22TAD1
         saOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g2si24055717pgq.609.2017.12.28.06.47.14;
        Thu, 28 Dec 2017 06:47:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753354AbdL1OrM convert rfc822-to-8bit (ORCPT
        <rfc822;francois.ozog@linaro.org> + 5 others);
        Thu, 28 Dec 2017 09:47:12 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:58178 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753131AbdL1OrL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 09:47:11 -0500
Received: from DGGEMA404-HUB.china.huawei.com (unknown [172.30.72.57])
        by Forcepoint Email with ESMTP id 9E2154F5F0A26;
        Thu, 28 Dec 2017 22:47:07 +0800 (CST)
Received: from DGGEMA503-MBS.china.huawei.com ([169.254.2.193]) by
 DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id 14.03.0361.001;
 Thu, 28 Dec 2017 22:46:56 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Igor Mammedov <imammedo@redhat.com>
CC:     "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "mst@redhat.com" <mst@redhat.com>,
        Zhaoshenglong <zhaoshenglong@huawei.com>,
        "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
        "mtosatti@redhat.com" <mtosatti@redhat.com>,
        "rth@twiddle.net" <rth@twiddle.net>,
        "ehabkost@redhat.com" <ehabkost@redhat.com>,
        "james.morse@arm.com" <james.morse@arm.com>,
        "christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
        "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        "xuwei (O)" <xuwei5@hisilicon.com>
Subject: Re: [PATCH v14 1/9] ACPI: add some GHES structures and macros
 definition
Thread-Topic: [PATCH v14 1/9] ACPI: add some GHES structures and macros
 definition
Thread-Index: AdN/6rBDLOgXxVO6R+eIC1eUrtXgZA==
Date:   Thu, 28 Dec 2017 14:46:55 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201A3F2BE@DGGEMA503-MBS.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.50.220]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7pkWDX/DCAaR

[...]
> > +/*
> >   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
> >   */
> >  #define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
> > @@ -474,6 +493,39 @@ struct AcpiSystemResourceAffinityTable {  }
> > QEMU_PACKED;  typedef struct AcpiSystemResourceAffinityTable
> > AcpiSystemResourceAffinityTable;
> >
> > +/*
> > + * Generic Error Status Block
> > + */
> > +struct AcpiGenericErrorStatus {
> > +    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
> > +    uint32_t block_status;
> > +    uint32_t raw_data_offset;
> > +    uint32_t raw_data_length;
> > +    uint32_t data_length;
> > +    uint32_t error_severity;
> > +} QEMU_PACKED;
> > +typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;
> > +
> > +/*
> > + * Masks for Block Status field above  */
> > +#define ACPI_GEBS_UNCORRECTABLE          (1)
> () are usually used with an expression and not with single value, so drop that to be consistent with style of the header


Igor, sure, it is. I will drop it. Appreciate for your point out.

> 
> > +
> > +/*
> > + * Value for Error Severity field above  */ enum
> > +AcpiGenericErrorSeverity {
> > +    ACPI_CPER_SEV_RECOVERABLE,
> > +    ACPI_CPER_SEV_FATAL,
> > +    ACPI_CPER_SEV_CORRECTED,
> > +    ACPI_CPER_SEV_NONE,
> > +};
> > +
> > +/*
> > + * Generic Hardware Error Source version 2  */
> > +#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    (10)
> ditto


You are right, will drop it. Thanks you very much.

> 
> > +
> >  #define ACPI_SRAT_PROCESSOR_APIC     0
> >  #define ACPI_SRAT_MEMORY             1
> >  #define ACPI_SRAT_PROCESSOR_x2APIC   2
[...]
