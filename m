Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4172833ejb;
        Mon, 6 Feb 2023 05:10:37 -0800 (PST)
X-Google-Smtp-Source: AK7set86w8QgH6DxfYUGFVv2wiPv8BZVb3zDKOpVk0tfjPNaSTdJTUIQbxDkjOMraD49N84CZx7U
X-Received: by 2002:a05:622a:1743:b0:3b9:a754:30db with SMTP id l3-20020a05622a174300b003b9a75430dbmr35403715qtk.13.1675689037112;
        Mon, 06 Feb 2023 05:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675689037; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ0TVMHlP0RvYnvBUC2IgmH708fdoeC3TLyerRafDBMQqfqE+0JJ/t2l9vd3aolAjG
         Rzv7lJ4OG90lMy/mWt2jVr/lb/87lAuJNzzDUNNqRV/jNyXbHbe7qAAygseJ8qQAL2h5
         eB9rsa7hkGvFqDEuzQCZntU9LfzWW1rnaOSVHH+M4G5CtRPjPipqMAsk2u56HFBG/kdz
         hee+bVrhF7jDBFNkee8px/DOd1OE02HgWWyrLh6C4PYdChdbz5SL9JWPOEF8JanhA3ZZ
         PYnAa+i/fslbsxrtss1JHTNONc2mP/7eZdqa0Gls0DYtZSR9eS8A2LX/c1377E/pwmvZ
         pwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ueZ4lJNVVaAm6E2RadB+Higp5mUiTZD8EnTQrCVDZNw=;
        b=peeH2ep9UgOetloUrdWq6xLXvV8Yru4RfUPFmtjArc/slKmO4x28/mc0EUzHXlAw+2
         F4RZyHbjXmMyOSjye2YoAj0EIg0OTuBr5s+l7HLWhw5nMQOwUOuVUmk10PdprYilcrU/
         G2T7djnn4E4tzMxq6hTd0cTBvNIdBkHE3WuFOM47vVerznrRgFJXd84cZo/2/9+xl3Aq
         CBaquH5J+TRtDriRLcSMEpEqnrYzW88lCahf0QjYFlyyH3WvJVf7RyymEPaD2kKGaZaV
         jG5VNGOEE7RpLsRBhTWHQWHU15k6qXI5srnjgd4V6tJX48g2Dvzop+MkEE49+aZyySDM
         gezw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yyckfplm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u124-20020a376082000000b007201d5b5f49si8251871qkb.661.2023.02.06.05.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 05:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yyckfplm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP1GT-0003ds-2e; Mon, 06 Feb 2023 08:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1GO-0003TD-GI
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 08:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1GL-0008C1-JC
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 08:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675689025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueZ4lJNVVaAm6E2RadB+Higp5mUiTZD8EnTQrCVDZNw=;
 b=YyckfplmtrFTlg5Tqnw0TQ0GsozfHxMRwyzHMWxzAjX32nKJ6B9JdTHbCpbMcMQZ8mhFRy
 J21CVX6jmxlKViTHJ/jQY4NsQMSMez9DvUopCtitvMWG5bTBuSttGZ731FR9G9n8xao4wx
 hVBqIIcaRoiQKOrn4i7c9Kl8mx4JBrY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-GdPUXEyZPCiiw4T5QT-rYQ-1; Mon, 06 Feb 2023 08:10:23 -0500
X-MC-Unique: GdPUXEyZPCiiw4T5QT-rYQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 g9-20020ac80709000000b003ba266c0c2bso1190975qth.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 05:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ueZ4lJNVVaAm6E2RadB+Higp5mUiTZD8EnTQrCVDZNw=;
 b=X0KoD68/eboZi+G7ahRiqx3PZ2Mrl6tcGTDv/yuFDN5jZyGAEp2xm+Th4xqlc0CZSZ
 gzUukJPabY5tMv6Xaakb2Jv6xYTV7t/9n3B7HeOwT/NjGqjTHtp8e5OgfPcLW43Z98Ky
 PYP3WWGPU0QwJskX71ni202pQqKQ06PF1D8sLwxv4u/OEx8RysHc+IhLg8KxXGp2s0h4
 i/0rtb5yQ3yuHhq9zOcYXf1thWorAFEPQRBOWiz/KpCrnSQiePQ0TAwkgqStxtuxWl34
 7LphlDFi9LnIaSoXkRzpIB8+9xDudLRWuqOp8eo+CHbCwFSfeVRIBvdOuW8Nz9Z6V8zp
 A+Qg==
X-Gm-Message-State: AO0yUKWp8tEABK6/aQ29jPGjybm+val05wJSauUnYnWbbCpbcDh3NCEG
 HItsNOcXg6lIN26EkfQ/XA+pzC48lc7U9oWB4q7Dbm1WR8BcRLDY7rOSUYmVCJcxDZqHiIsfNMh
 BedY1Y+rCkTPb
X-Received: by 2002:a05:622a:1006:b0:3ba:1360:ec0a with SMTP id
 d6-20020a05622a100600b003ba1360ec0amr12700692qte.41.1675689023204; 
 Mon, 06 Feb 2023 05:10:23 -0800 (PST)
X-Received: by 2002:a05:622a:1006:b0:3ba:1360:ec0a with SMTP id
 d6-20020a05622a100600b003ba1360ec0amr12700662qte.41.1675689022948; 
 Mon, 06 Feb 2023 05:10:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac87fc1000000b003b9ba2cf068sm7267520qtk.56.2023.02.06.05.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:10:22 -0800 (PST)
Message-ID: <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
Date: Mon, 6 Feb 2023 14:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
To: Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PiguJV/lLEuu

Hi,

On 2/3/23 21:40, Richard Henderson wrote:
> On 2/3/23 03:44, Cornelia Huck wrote:
>> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char
>> *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    OnOffAuto mte = cpu->prop_mte;
>> +
>> +    visit_type_OnOffAuto(v, name, &mte, errp);
>> +}
> 
> You don't need to copy to a local variable here.
> 
>> +
>> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char
>> *name,
>> +                                void *opaque, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +
>> +    visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
>> +}
> 
> ... which makes get and set functions identical.
> No need for both.
This looks like a common pattern though. virt_get_acpi/set_acpi in
virt.c or pc_machine_get_vmport/set_vmport in i386/pc.c and many other
places (microvm ...). Do those other callers also need some simplifications?

Eric
> 
>> +static inline bool arm_machine_has_tag_memory(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    Object *obj = object_dynamic_cast(qdev_get_machine(),
>> TYPE_VIRT_MACHINE);
>> +
>> +    /* so far, only the virt machine has support for tag memory */
>> +    if (obj) {
>> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> 
> VIRT_MACHINE() does object_dynamic_cast_assert, and we've just done that.
> 
> As this is startup, it's not the speed that matters.  But it does look
> unfortunate.  Not for this patch set, but perhaps we ought to add
> TRY_OBJ_NAME to DECLARE_INSTANCE_CHECKER?
> 
>> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    bool enable_mte;
>> +
>> +    switch (cpu->prop_mte) {
>> +    case ON_OFF_AUTO_OFF:
>> +        enable_mte = false;
>> +        break;
>> +    case ON_OFF_AUTO_ON:
>> +        if (tcg_enabled()) {
>> +            if (cpu_isar_feature(aa64_mte, cpu)) {
>> +                if (!arm_machine_has_tag_memory()) {
>> +                    error_setg(errp, "mte=on requires tag memory");
>> +                    return;
>> +                }
>> +            } else {
>> +                error_setg(errp, "mte not supported by this CPU type");
>> +                return;
>> +            }
>> +        }
>> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
>> +            error_setg(errp, "mte not supported by kvm");
>> +            return;
>> +        }
>> +        enable_mte = true;
>> +        break;
> 
> What's here is not wrong, but maybe better structured as
> 
>     enable_mte = true;
>         if (qtest_enabled()) {
>             break;
>         }
>         if (tcg_enabled()) {
>             if (arm_machine_tag_mem) {
>                 break;
>             }
>             error;
>             return;
>         }
>         if (kvm_enabled() && kvm_arm_mte_supported) {
>             break;
>         }
>         error("mte not supported by %s", current_accel_type());
>         return;
> 
> We only add the property for tcg via -cpu max, so the isar check is
> redundant.
> 
> 
> r~
> 

