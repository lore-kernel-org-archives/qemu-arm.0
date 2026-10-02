Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD0ACA5FD4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 01:05:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCRiP-0007eZ-On; Thu, 01 Oct 2026 21:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRiH-0007da-5V
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 21:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRiC-0002EV-Kg
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 21:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790903118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfzSr9M4NonLeNy7xs2adYXrLZZ6EwDKmwFESBpV9/o=;
 b=W5/3Bx4Phx72y8P88S7JGLBfib0NrKrcewsU17BFPPVM0j4znrSnmxgRKmipEpxyAVToku
 Pqz82hJxS+YeXrfK86sXNqArfSBe8Avone8tfs6TXuRFawDkBOWWdk9rKyX3+yzGTzy4RK
 zJmLAsB+yUmRz5UqohMGI1gQ3MCDif0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-oIkMxG6OPf6oMnj9SVME-w-1; Thu, 01 Oct 2026 21:05:17 -0400
X-MC-Unique: oIkMxG6OPf6oMnj9SVME-w-1
X-Mimecast-MFC-AGG-ID: oIkMxG6OPf6oMnj9SVME-w_1790903116
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3a6e2f00130so117279a91.2
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 18:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790903116; x=1791507916;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YfzSr9M4NonLeNy7xs2adYXrLZZ6EwDKmwFESBpV9/o=;
 b=umUVTXiJCpvvXhoR5uyqGPEuSb2VHz/MaN4Nyt1qOIuzL5bFlJ0bpeXvQPfCPVm+kY
 oo2jkHiTsn57cgroa13mUOj73l1KBJO83E4uk1Vx7BvN1ReAR+/sqdumRIFojAkx2tS/
 MVVTJ0vjXtk9VsVgMVkFX48gu59IBWPRGx+3eFlzIRrCCWMAxqTlK9DKS3tR8eFsu+Ve
 /xovO5u2b9nbAgJhcDYHtDtixSCrTVjfZPDjmn1md3DgJeoHxn3kTqwCDa4WdMwwCwYb
 5ddsMXPJfrIAJov1EaW+DyRDWKX/5dLlHKICycDzQ6lXAqcVQrYRIafQpwd+GtLtfeAV
 330A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzOztt/XjputJe49Qd1jDep2u8EVS/rl27gJIJa2KssqYnBgVLSABe7kZ3TgV0YrcA0ZLWCAYDq1A==@nongnu.org
X-Gm-Message-State: AFq9FYKD6/kYOADKenvX5Ody3bII5q/++lW3LOpI2j1HRpxdSCCh+g+b
 Pr1mGPnR2XtJlpwemqKa3oXSH2owkNpTyhkfu0a6vwbW1bTQPAt0kWyXTduOl/Y6livQTFgi0TI
 IiFhr6NG0RULVV2eOMZSKbnIEQuSjd+2q9g9e1e96xQ5mksgAB0s0tg==
X-Gm-Gg: AYBFou2d7mnO+2YYM7fEr7IbFs+1BC2UWHIjWRyYDMyaDHGCFoM8djP5WoVXkx1Um8h
 BV82zC8MvzdEKPksY7K8jyNutN2JkIfX+7Ty02Z9gq3wh4TUVjFa0FmSE8rxW68UaBh53FFQSq6
 jAtyhUs5o071nq/DiawK+OpbUSfIZH/3qQHqnakE9Muqk1Ii/ksno5IE9cO/wzyOO+T7mvJuczk
 0bTmLz5NYer5L50l5/wLFu4/YzxMaCt6yLo1X0RMki8L63KYBYmywzrMz6Teg3Wa7jss8OMg24m
 wkBMuN3sIfDt6CcQdCNIkcslexqrNfowNaxMfY2QybdbKg21dBFezc9vhJkBoI6RX7SX8XCEwmx
 sFjJSayYYm5pEiznxtINUSVnBvcV7SFGVPZ4pj76T5Q==
X-Received: by 2002:a17:90a:dfc6:b0:3a4:eebd:2410 with SMTP id
 98e67ed59e1d1-3a6ce993df6mr1096510a91.37.1790903116285; 
 Thu, 01 Oct 2026 18:05:16 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc6:b0:3a4:eebd:2410 with SMTP id
 98e67ed59e1d1-3a6ce993df6mr1096480a91.37.1790903115746; 
 Thu, 01 Oct 2026 18:05:15 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a6e7401d04sm198743a91.14.2026.10.01.18.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 18:05:14 -0700 (PDT)
Message-ID: <d04fe4a6-4418-48b9-b2ed-cce6278e0081@redhat.com>
Date: Fri, 2 Oct 2026 11:05:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 07/24] target/arm/kvm: Create scratch Realm VM when
 requested
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-8-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-8-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GL4J0hOYAv7PwVsYzs0L6VgLYGTtmtTBxohQmB1uCwM_1790903116
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> When a Realm is requested, create a scratch Realm VM by setting bit 8
> of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
> for the guest PA size.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b4c6da1fb9f3..d86e66e056b9 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -108,7 +108,9 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>                                         struct kvm_vcpu_init *init)
>   {
>       int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    MachineState *ms = MACHINE(qdev_get_machine());
>       int max_vm_pa_size;
> +    int vm_type;
> 

@vm_type can be initialized when it's declared.

        MachineState *ms = MACHINE(qdev_get_machine());
        int vm_type = ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL;
        int max_vm_pa_size;

   
>       kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>       if (kvmfd < 0) {
> @@ -118,8 +120,10 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>       if (max_vm_pa_size < 0) {
>           max_vm_pa_size = 0;
>       }
> +
> +    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);

() aren't needed.

>       do {
> -        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
>       } while (vmfd == -1 && errno == EINTR);
>       if (vmfd < 0) {
>           goto err;

Thanks,
Gavin


