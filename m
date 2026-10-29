Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDA606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O8Wp5Q4B
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOzf-00066K-Tx; Thu, 29 Oct 2026 08:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMOzb-00065O-Pj
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMOza-0008Ji-Ch
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793275945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldXofnG5HIs9aTX5OBQJ35UmUymT0t9Ke2E8FTM24PM=;
 b=O8Wp5Q4BOgJQuFAi9XlTGxjA2IN+DRseFeQijI+vwaMPoofeGRmqcjr5HFZkoJdjSEzqSk
 VcXls/ksHAtUzbWP4GTZdU4jrZ1S41L38Af7nkE8Gs1tQg/pH0cZfPpmeyVZzn1v4D3PwX
 7BLYnV3s+HuNomWtuL1T8rILnFpX96o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-NGRmfwGlN0yKa03lNInYIQ-1; Thu, 29 Oct 2026 08:11:05 -0400
X-MC-Unique: NGRmfwGlN0yKa03lNInYIQ-1
X-Mimecast-MFC-AGG-ID: NGRmfwGlN0yKa03lNInYIQ_1793275864
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3ad7030e886so2296346a91.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 05:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793275864; x=1793880664;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ldXofnG5HIs9aTX5OBQJ35UmUymT0t9Ke2E8FTM24PM=;
 b=SvGPL9u/2XyT6vfj1W867TRx7ekjbjToutWs+v13ITRHMcwKWzx6vqcygHsz7+7sAH
 VKcAjmi3+7gxzyTj9j8DN7KjJA7uVWrhbXRwN1oOe0L99l307/AAu0UCRXfAPRaKRs7P
 t3IY+2jeI2SxeG9KeRtAufAwnBBchSXU8R3HsCgODeJPNjlZr4odBtskbDD0T45g41Hi
 kCT5JKrLXL9nZTxtcBMKajQ4puBvWVy3xIllfJ4q1A0LosAZQ3B4T5Mc/izLGvIuLG1g
 W/jz5eOWNgEV2A3ViYYCbU1/53NO55p9j6KnZhqzi+cZ9VOjP8Qm/O7nfteXhOif8fQE
 DFig==
X-Forwarded-Encrypted: i=1;
 AKwUvBzewX/Bq4wkz4mHQ5p3E5k6FmxkEnd0f4Stjy/NLlKZxJpQcanAy+JMUP34MpnQcfVr4xNXVav6ug==@nongnu.org
X-Gm-Message-State: AFq9FYJOzsmA0aeWtqKy9NEp9PpmCcCsTKn8ugWPI4bIW9qain/xncPy
 eEPUsc+3g9ntLJFg3uVtn0xQWVt8gA+DXiUF4cPuf/e35R7BbkpLKHv+54dclncTA+1pIKKtVQS
 lHowh6rW8N+wDMTCKhDyer+58qIYxkSXI0FU8Y7AFq7VirvpeCj9bXnIn7gqf4M1UckRDNZCiTe
 KD+4dPEzQ1YxyhwK8UqM9BBwHHANM+
X-Gm-Gg: AYBFou2ZbSmndEHSyjTYgs4QQQP9zVp7LFJNd/fXrZrq+k35Y10XkD3xGD5WiVStz4f
 ob0GjFxfAu24sBjCqgyK/l2+iOWwhVct1Ez2bgoz73QAneHupXLpN6FypO5cjutOSM4lFbto5sM
 o5sUz8NCgEPV+MKv0YranltsglyGyV/4nLKjDFXC4W+Ak+gIBfVLJV/1Tqou1rYUYQV27V3corJ
 qQU7pz+8JE595En
X-Received: by 2002:a17:90b:3b8c:b0:3ac:d79f:8229 with SMTP id
 98e67ed59e1d1-3ae58145332mr4225176a91.61.1793275863943; 
 Thu, 29 Oct 2026 05:11:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:3ac:d79f:8229 with SMTP id
 98e67ed59e1d1-3ae58145332mr4225136a91.61.1793275863505; Thu, 29 Oct 2026
 05:11:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-8-eric.auger@redhat.com>
 <31abc997-8c83-cd34-7fdb-5dfeccaad26d@redhat.com>
In-Reply-To: <31abc997-8c83-cd34-7fdb-5dfeccaad26d@redhat.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Thu, 29 Oct 2026 17:40:47 +0530
X-Gm-Features: AclHuK8Af7qIyNR8NLM41mprqag1lmRF3rdFXQJiFG_-nm4BySvrCNzqm43T36I
Message-ID: <CAJg9KkzDDWs+f5cdsVz2DieE5dofM28JGGYFoeqo0N9-P3YUJg@mail.gmail.com>
Subject: Re: [PATCH for-11.2 7/9] target/kvm: Pass an Error handle to
 kvm_arch_init_vcpu
To: Eric Auger <eric.auger@redhat.com>
Cc: Sebastian Ott <seott@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, peter.maydell@linaro.org, shaju.abraham@nutanix.com, 
 khushit.shah@nutanix.com, richard.henderson@linaro.org, pbonzini@redhat.com, 
 skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 7746591750@163.com, 
 maobibo@loongson.cn, harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OOHo8bx4EUwiN-Qaz_uc1LE6iK50t1A_R5MfUYMEoU0_1793275864
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Eric,

> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 8e89a6c665..5d72cbd9fc 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -493,9 +493,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
> /* Synchronize sregs with kvm */
> ret = kvm_arch_sync_sregs(cpu);
> if (ret) {
> + error_setg_errno(errp, -ret, "Register sync failed"),

               ^ typo here and

> @@ -504,6 +505,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
> case POWERPC_MMU_BOOKE206:
> /* This target supports access to KVM's guest TLB */
> ret = kvm_booke206_tlb_init(cpu);
> + if (ret < 0) {
> + error_setg_errno(errp, -ret, "failed kvm_booke206_tlb_init"),

                             ^ here


Thanks,
Faiz


