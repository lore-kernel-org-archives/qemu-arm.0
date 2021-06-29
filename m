Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp190625lfi;
        Tue, 29 Jun 2021 13:15:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIq02+2BGtju/MPQhbYCSRmBIAmnznFgFm/sh0BfoK44dYicWFo+Vq/fghepMU9e1lT4D9
X-Received: by 2002:a9f:3097:: with SMTP id j23mr14748514uab.20.1624997706577;
        Tue, 29 Jun 2021 13:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624997706; cv=none;
        d=google.com; s=arc-20160816;
        b=j3CN4vT/7xrbJVnv1tXol7KyxzZQ2SspfaKLvyW9QX2QSzBRhM6/M2VglOYVr9UIso
         kfvjF590Rkdq22UewuGC0vfP7YEafq3W5sM29qTLn1+6ULUGTJgml9qTxZcr0A2lJEw0
         F6uZJmUrutqow128YdgpW9taE4asxnZiqfUIlgOUK63iqEyFimnYPPaaaeBo4AsMo1pp
         w0kVhEa6ZywetqqYfVISx+LQnEbqAC9WYrc+gHQRT22SU/kHdpLX93BkkudrfNG4U8Go
         m8CNhAmpaajDPXorl6tsyD84jFX8mmMGgQY7O3w60OeAnATZh/WXxB1rK75s90MCx4dT
         fVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8E/xc9Z7CcNc/2meQ7zlLMcyngrEF8fHXRJO2Oago60=;
        b=PEwW5XqLede/zzJgzbOm30H73IaSLD71bWtQr69dMNSuPt5a6BNwy6yJ5paan/4o2q
         1gw70rvzXUsbHEXnzUVkYny8cUVtZZ+Qp65JTA9Ys6oJ86mkFngySAcMMC7VekeFDwKi
         rfpguPLRMcFVl7u1pYsdyMQhW3kGx8BXTBSRgCi+LLYSCFh67K5TJooZlGTzNjUscZaY
         ZFcRR77VxoGaG42YJX99fsu9kEhVlhWBjfEjl090/1seLgKVyQGUgLhsBlZfs+8LlriZ
         K1zm9w/1N4G7uZowjSbcr40zBHQucnY6iLIColaHe8UgGl+6wbRrRvvwoyXYfhxR8EP8
         P4vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dO6RiGoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si11621756vsq.247.2021.06.29.13.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 13:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dO6RiGoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyK8P-0004qh-Ro
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 16:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyK8F-0004op-LI
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 16:14:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyK8C-0003HL-T5
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 16:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624997691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8E/xc9Z7CcNc/2meQ7zlLMcyngrEF8fHXRJO2Oago60=;
 b=dO6RiGoqvTv28DtWR0l6M+jjI1p8OcnrHYwGH2nedp3ruhCWBO4DxrH79dHVi8vmF99wox
 VMEtvKD2kuSA4N2vC9nEnIwzJTPawcGLdcWX5TNiPdWXcey1tPdIuzxK5tz6aIcBxJuhOj
 pZeX4w3OtuRY+zxw2euZ9JkiYnLBM1g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-t1tNnt-eOmG90vbArI_IKQ-1; Tue, 29 Jun 2021 16:14:50 -0400
X-MC-Unique: t1tNnt-eOmG90vbArI_IKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q123-20020a1c43810000b02901e0ebb6227fso106418wma.9
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 13:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8E/xc9Z7CcNc/2meQ7zlLMcyngrEF8fHXRJO2Oago60=;
 b=VRwhGvLL9p4vZrR4FUeah8DrRQuhuAjjDPqbC7fMBVQg6LYSVX9S0OcNAu4qO/4i7v
 ZezuM14F+yJGlrzoFkYn5UwrSVC+HQVvNO6bkz1MpcpHaZ1MId3wHVSq3w619fA/Duek
 LcELwbfq4Yy0tkhl3/VNyeBamKrdVmoguYxxPAPtQJSNhUsXflnsfRvwaCLNxcrSuADc
 0EZ2AeB+NMX3lAVtsjlMvf7kkFjJ9a44ucHQm/2S5w2telVKqw1Ll3jTCF5oATnDc/RA
 xYyBvbglQX0mRj5TCRarpS6C2O9u6FC7eu/4DmVRnjxlW5JtOV0kq9cctnPbW35VGkhK
 hvQQ==
X-Gm-Message-State: AOAM531UliandTCfWeHrYt3oQquM/zOuUygtudwTfyZPaFEss1GeY5sL
 hQIwZ3+YHFxKNB1xzGfB9OQhmE9WA6UGfzcYi7iBhpIJqNRKJFvkEvthI6VXKcMOBklN0uMEOTd
 s76GFccYErgeJ
X-Received: by 2002:adf:fd42:: with SMTP id h2mr2107031wrs.262.1624997687558; 
 Tue, 29 Jun 2021 13:14:47 -0700 (PDT)
X-Received: by 2002:adf:fd42:: with SMTP id h2mr2107008wrs.262.1624997687256; 
 Tue, 29 Jun 2021 13:14:47 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t11sm19507888wrz.7.2021.06.29.13.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 13:14:46 -0700 (PDT)
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
Date: Tue, 29 Jun 2021 22:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IgcVyTu4jC1F

Hi Kunkun,

On 6/29/21 11:33 AM, Kunkun Jiang wrote:
> Hi all,
>
> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
> our original intention is to flush the ITS tables into guest RAM at
> the point
> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
> migration launch so let's simply flush the tables each time the VM gets
> stopped.
>
> But I encountered an error when I shut down the virtual machine.
>
>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>> 0x0000000000000001: Permission denied
>
> Shall we need to flush ITS tables into guest RAM when 'shutdown' the VM?
> Or do you think this error is normal?
yes we determined in the past this was the right moment do save the tables

"with a live migration the guest is still running after
the RAM has been first saved, and so the tables may still change
during the iterative RAM save. You would actually need to do this
at just the point we stop the VM before the final RAM save; that *might*
be possible by using a notifier hook a vm run state change to RUN_STATE_FINISH_MIGRATE
- if you can do the changes just as the migration flips into that mode
it *should* work. " said David. 

But sometimes as the commit msg says, the VM is stopped before the migration launch - I do not remember the exact scenario tbh -.
So each time the VM is stopped we flush the caches into guest RAM.



>
> This error occurs in the following scenario:
> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to
> the VM.
>
> The flow is as follows:
>
> QEMU:
> vm_shutdown
>     do_vm_stop(RUN_STATE_SHUTDOWN)
>         vm_state_notify
>             ...
>             vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>                 kvm_device_access
>
> Kernel:
>     vgic_its_save_tables_v0
>         vgic_its_save_device_tables
>             vgic_its_save_itt
>
> There is such a code in vgic_its_save_itt():
>> /*
>>  * If an LPI carries the HW bit, this means that this
>>  * interrupt is controlled by GICv4, and we do not
>>  * have direct access to that state without GICv4.1.
>>  * Let's simply fail the save operation...
>>  */
>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>           return -EACCES;
As far as I understand you need a v4.1 to migrate,
following Shenming's series
[PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
Maybe sync with him?

Thanks

Eric


>
> Looking forward to your reply.
>
> Thanks,
> Kunkun Jiang
>
>
>
>
>
>
>

