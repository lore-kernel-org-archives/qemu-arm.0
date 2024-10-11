Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp544420njb;
        Fri, 11 Oct 2024 10:25:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8Uvld3PoMaX2atlyMQxpxYwV4Mx6zVXJHtMhSdOfVNKK3zaVYrxmetI04vahgD6Lg1L5Ml2iEGbOiJA==@linaro.org
X-Google-Smtp-Source: AGHT+IE8c+S7Pwi8Fqt1d7Fro2ZFLhlbWSjSeG/cwpFmL7MQFyl/ACffjySWNAkjc9c/F4wm7Ekj
X-Received: by 2002:a05:620a:29c3:b0:7a9:ae0c:b6d5 with SMTP id af79cd13be357-7b11a3792b9mr565237785a.9.1728667519918;
        Fri, 11 Oct 2024 10:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728667519; cv=none;
        d=google.com; s=arc-20240605;
        b=ATv4F9TTE9VYa2lVUoBz89PAM3DeiRU2Ox4I858yc5MnIB/EygyIdDlN+kagwkjeGe
         8RC8b5mM/A2HGCNrtdQCq8MZ3Mr2tcs/aov9z2FJHv/5EAe3BGgFm8s7YIq1GcruMJiJ
         +WcgR/s+tcQ6jg8+WjhuuIYazWYLHm7vPywmO80mhc5JbcFp7q5sEYryztWEiF1z5X9K
         R8XhMnpt/5va1ZpBeEBIuj5cSXmg57ZakITsixhOFkSF/889SNvzxcQtQSSKmlHTac+K
         vWhFJMRTH0xuKBrOWvZ8qg6nTkP+uXRQ1UaYdnN8Yvk+qts2ZgXqYtf1fj00U5knpUaZ
         3mOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=bNu6mg4j5/zNLXqNoI9txETqrFRXTZ0Avb4+PoNfWd4=;
        fh=lcqDTNz3tLLSz/cNBJbIA0EMLKF6VFQYmk6sZoVzsoM=;
        b=DP42j9ROtNtKKuIMHJO7L7/XKC7sATO5siae/Q1olei9HJ8RaSW4nhD7JEcwwR//zY
         LpoYggqcVi1uKkrOXpw+6LYQGg2xNZSV/J8K+4ZZ4iJLidxnxIAuSPy5krPJTlnmW3TF
         ImXltjCjEp5UZf6EscpUxF9P4+KeOM6CvFc89PpT3iQN1A0fIcJ5M++Yd+qeihS5eUSP
         j4tFCS3GIZQnPhk75dTMKqBH8/7/aK3V7BvZf9hzuQrtHP6vAAfYsME09Tr8qxuyjTg+
         bN48fI+Fn7oFDL73LQjLZUCCg4gs2t9ZYDsGW0Bo8wyfukiVtvrIS54ShDXsNAmdaKRs
         iY7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g442yeW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4604288127bsi39963161cf.390.2024.10.11.10.25.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2024 10:25:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g442yeW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1szJG0-0005Vx-NZ; Fri, 11 Oct 2024 13:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1szJ7w-0000wP-GO
 for qemu-arm@nongnu.org; Fri, 11 Oct 2024 13:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1szETY-0004dO-JP
 for qemu-arm@nongnu.org; Fri, 11 Oct 2024 08:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728648627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNu6mg4j5/zNLXqNoI9txETqrFRXTZ0Avb4+PoNfWd4=;
 b=g442yeW3VqAhYtCXI5pH6ualIdm6DDyxMQOOYW+HmuExWKSLN2Lq2VxjkCwar39RFoAQHI
 k3Ww6ERIEjiQRB0UPHsL3blNM6CJKrs5OPBSvfmn+L0OeQxhi5MLqjkMrZW5QokjQeQ09+
 QBAPf8S9N9w3vi0yTLWXfROtzl99uB4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-x4HWJi6YPa6tVORfVH2WOg-1; Fri, 11 Oct 2024 08:10:25 -0400
X-MC-Unique: x4HWJi6YPa6tVORfVH2WOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d56061a4cso383706f8f.2
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2024 05:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728648624; x=1729253424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNu6mg4j5/zNLXqNoI9txETqrFRXTZ0Avb4+PoNfWd4=;
 b=P0EbNdmEoFHiQxA6H6huiHaQh2DxzfqSzZ3El+9lI5W1thQ0m45llb8ymHzUZJ3c01
 lYY9CAmvOwyNdR73KSqYDayeJBtbfkGQmgQ2+nXFcSSdH4k2yDEm75re7LwX5afnja7f
 4y2LL0saWIe9oWaDbyCaeeTFDyINcaU4ouCC43Adm8HISbXOeGa+TpaloIEDWqKAv4Bx
 Gn6R3sSTDn8qVyb/r1GCiO2pYSRnI742GUANBJlNfTG4x8jH7kTYJ9c4CvAWr5CMgnDK
 /xH9DT2bZy/MxrFVY0D0gjWLQyVCmdj29v+Dk6SXF2ErCihgaLjN6dc6OqDkRpVZo8f9
 DZ/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuhz3KD1DsN4CE3eC2LUdMUJOLVfK0qypHtGMrFavtIOLKucOR0IS1+u59ED3vFtoE9TNLEflcqQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywi/2/Ptz4viPQTOdE6D0N+8LK1O4v9LlwZe5Gdpkrmi4JksAu8
 +p78QhYvsx2WacVLCdQnTMSuWSOlj4QQ27UHJgDY8Xm8lDzm/MW7VIrp0WgEtu0QyAIGdLBkLDu
 iSGApDw5GpIYQYnQkPB4BT3k2lY6NkNb2V+yShxY+60a+xmDXpA==
X-Received: by 2002:adf:e54e:0:b0:37d:45f0:b33 with SMTP id
 ffacd0b85a97d-37d55184ae1mr1695891f8f.9.1728648624425; 
 Fri, 11 Oct 2024 05:10:24 -0700 (PDT)
X-Received: by 2002:adf:e54e:0:b0:37d:45f0:b33 with SMTP id
 ffacd0b85a97d-37d55184ae1mr1695874f8f.9.1728648623946; 
 Fri, 11 Oct 2024 05:10:23 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6d0071sm3749921f8f.62.2024.10.11.05.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 05:10:23 -0700 (PDT)
Date: Fri, 11 Oct 2024 14:10:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Annie Li <annie.li@oracle.com>
Cc: miguel.luis@oracle.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 dave@treblig.org, mst@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 zhao1.liu@intel.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 eblake@redhat.com, armbru@redhat.com
Subject: Re: [RFC V2 PATCH 02/11] acpi: Implement control method sleep button
Message-ID: <20241011141020.61425d7c@imammedo.users.ipa.redhat.com>
In-Reply-To: <120fc3a4-7601-4307-800d-bfa2637df81a@oracle.com>
References: <20240927183906.1248-1-annie.li@oracle.com>
 <20240927183906.1248-3-annie.li@oracle.com>
 <20241007145950.0e53023c@imammedo.users.ipa.redhat.com>
 <120fc3a4-7601-4307-800d-bfa2637df81a@oracle.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.15,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OHuSAhe9uIAF

On Tue, 8 Oct 2024 11:22:33 -0400
Annie Li <annie.li@oracle.com> wrote:

> On 10/7/2024 8:59 AM, Igor Mammedov wrote:
> > On Fri, 27 Sep 2024 14:38:57 -0400
> > Annie Li<annie.li@oracle.com> wrote:
> >  
> >> The control method sleep button is added, as well as its GPE event
> >> handler.
> >>
> >> Co-developed-by: Miguel Luis<miguel.luis@oracle.com>
> >> Signed-off-by: Annie Li<annie.li@oracle.com>
> >> ---
> >>   hw/acpi/control_method_device.c         | 54 +++++++++++++++++++++++++
> >>   hw/acpi/meson.build                     |  1 +
> >>   include/hw/acpi/control_method_device.h | 25 ++++++++++++
> >>   3 files changed, 80 insertions(+)
> >>
> >> diff --git a/hw/acpi/control_method_device.c b/hw/acpi/control_method_device.c
> >> new file mode 100644
> >> index 0000000000..f52c190352
> >> --- /dev/null
> >> +++ b/hw/acpi/control_method_device.c
> >> @@ -0,0 +1,54 @@
> >> +/*
> >> + * Control method devices
> >> + *
> >> + * Copyright (c) 2023 Oracle and/or its affiliates.
> >> + *
> >> + *
> >> + * Authors:
> >> + *     Annie Li<annie.li@oracle.com>
> >> + *
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >> + * See the COPYING file in the top-level directory.  
> > replace it with SPDX-License-Identifier like it's done elsewhere  
> Nod
> >  
> >> + *
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "hw/acpi/control_method_device.h"
> >> +#include "hw/mem/nvdimm.h"
> >> +
> >> +void acpi_dsdt_add_sleep_button(Aml *scope)
> >> +{
> >> +    Aml *dev = aml_device("\\_SB."ACPI_SLEEP_BUTTON_DEVICE);  
> > drop "\\_SB." here and below as well,  
> Make sense here since the scope parameter is "_SB", but for the "_SB"
> in acpi_dsdt_add_sleep_gpe_event_handler where the scope parameter is 
> "_GPE", I suppose "\\_SB." is necessary.

Check the spec onhow name resolution in ACPI works.
Anyways you likely won't have dedicated acpi_dsdt_add_sleep_gpe_event_handler(),
on respin

> >  
> >> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C0E")));
> >> +    Aml *pkg = aml_package(2);
> >> +    aml_append(pkg, aml_int(0x01));
> >> +    aml_append(pkg, aml_int(0x04));
> >> +    aml_append(dev, aml_name_decl("_PRW", pkg));
> >> +    aml_append(dev, aml_operation_region("\\Boo", AML_SYSTEM_IO,  
> > use some sensible name for opreg  
> will do
> >> +                                         aml_int(0x201), 0x1));
> >> +    Aml *field = aml_field("\\Boo", AML_BYTE_ACC, AML_NOLOCK,
> >> +                           AML_WRITE_AS_ZEROS);
> >> +    aml_append(field, aml_named_field("SBP", 1));
> >> +    aml_append(field, aml_named_field("SBW", 1));
> >> +    aml_append(dev, field);
> >> +    aml_append(scope, dev);
> >> +}  
> > also above and below lacks any documentation,
> > add comments for relevant spec references, like we do with other ACPI
> > functions. Also perhaps, it's out of order, reviewer has not clue
> > where from above registers come and how it is supposed to work.
> >
> > if you invented those registers, there should be a preceding doc patch
> > that documents them.
> >
> > Suggest to reorder after patch that implements above registers in hw,
> > and also comment here where to look for them.  
> 
> Thanks for the feedback.
> 
> Thanks
> Annie
> 
> >> +
> >> +void acpi_dsdt_add_sleep_gpe_event_handler(Aml *scope)
> >> +{
> >> +     Aml *method = aml_method("_L07", 0, AML_NOTSERIALIZED);
> >> +     Aml *condition = aml_if(aml_name("\\_SB.SLPB.SBP"));
> >> +     aml_append(condition, aml_store(aml_int(1), aml_name("\\_SB.SLPB.SBP")));
> >> +     aml_append(condition,
> >> +                aml_notify(aml_name("\\_SB."ACPI_SLEEP_BUTTON_DEVICE),
> >> +                                    aml_int(0x80)));
> >> +     aml_append(method, condition);
> >> +     condition = aml_if(aml_name("\\_SB.SLPB.SBW"));
> >> +     aml_append(condition, aml_store(aml_int(1), aml_name("\\_SB.SLPB.SBW")));
> >> +     aml_append(condition,
> >> +                aml_notify(aml_name("\\_SB."ACPI_SLEEP_BUTTON_DEVICE),
> >> +                                    aml_int(0x2)));
> >> +     aml_append(method, condition);
> >> +     aml_append(scope, method);
> >> +}
> >> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> >> index fa5c07db90..0b4f1b432d 100644
> >> --- a/hw/acpi/meson.build
> >> +++ b/hw/acpi/meson.build
> >> @@ -17,6 +17,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_CXL', if_true: files('cxl.c'), if_false: files('cxl-stub.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
> >> +acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('control_method_device.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> >> diff --git a/include/hw/acpi/control_method_device.h b/include/hw/acpi/control_method_device.h
> >> new file mode 100644
> >> index 0000000000..87f8d6fd59
> >> --- /dev/null
> >> +++ b/include/hw/acpi/control_method_device.h
> >> @@ -0,0 +1,25 @@
> >> +/*
> >> + * Control method devices
> >> + *
> >> + * Copyright (c) 2023 Oracle and/or its affiliates.
> >> + *
> >> + *
> >> + * Authors:
> >> + *     Annie Li<annie.li@oracle.com>
> >> + *
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >> + * See the COPYING file in the top-level directory.
> >> + *
> >> + */
> >> +
> >> +
> >> +#ifndef HW_ACPI_CONTROL_METHOD_DEVICE_H
> >> +#define HW_ACPI_CONTROL_NETHOD_DEVICE_H
> >> +
> >> +#define ACPI_SLEEP_BUTTON_DEVICE "SLPB"
> >> +
> >> +void acpi_dsdt_add_sleep_button(Aml *scope);
> >> +void acpi_dsdt_add_sleep_gpe_event_handler(Aml *scope);
> >> +
> >> +#endif  

