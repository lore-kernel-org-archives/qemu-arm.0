Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1259380lfc;
        Thu, 11 Jun 2020 02:14:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7qXOOeeJue4dxHmFJ5mUOZKnG7uVpKPDqsTgOdZScMARTiAegLnrNDShhXUBGfYIUsOnn
X-Received: by 2002:a25:7793:: with SMTP id s141mr4345921ybc.171.1591866878022;
        Thu, 11 Jun 2020 02:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591866878; cv=none;
        d=google.com; s=arc-20160816;
        b=R61cq5j0VbyHG9OyN15TVxaG7kCM8jJDsNcse48CttEm0KFWQ9MHpToyTgON+eVv1X
         VEWLHN9CVvNTafOdfzw6ut9Y9TWWQUFuyj//QhVx1gD31x6RJbrkFw3KJgsgdPuVugai
         eXvr/HXcgDt+m25jiNG65vyFTci35I4/hQmz5kUitrHBwil9Du/7qRhLj/aWaXnH70vU
         nNtu9XuB5PvRJiqS1otww768DPIkAqjeU3dR0/9ZuhbKF6G74JcEp52bXVU5mBgdrGgc
         vtqKTMwSbKVyobIPCeOM1Q4HKglJuM0vn1TI5QMmhXPsfSRMuBUmRHrm6kZcUmlXPLVS
         7Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=P8c1wxI9qT72Dg+EUCoyPxu2yI/s+ts/sEYQpOuBIkg=;
        b=IIu0lRUuEfudfalyJlwJV/2KJqWZdrnBowkFBSOkic+PcRfL18+Y3ySyx/LQYsvEr3
         h0LbjbOxL71fwCcwTgIWC7DZyB+OGWtAfu4ubf7IaqKfDrp92eAdILki5kh3kR3akRtJ
         CV17x5dGmaku24TpW/RdyxW/pGQrBmmdco2IDhF4i4Tr7ylTCZir2PRKma6MpK9AbeP6
         hDHvYNYLS+44gzdobFKNU43PMdGjKBkt+Hp1jtsVJKHCseKuxtlt0X3fwp2IC217hqfp
         b1WqUFBEmTGowACbzM4OunaKNlZvt9VZbH7bsEa6ncwrRpw3ILBNQDODrA6fzIel+Y19
         UCYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ofb87nLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u126si2085518ybb.376.2020.06.11.02.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 02:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ofb87nLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjJID-0005wD-E2
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 05:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jjJI5-0005v5-PG
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 05:14:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27080
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jjJI5-00010N-2F
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 05:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591866868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P8c1wxI9qT72Dg+EUCoyPxu2yI/s+ts/sEYQpOuBIkg=;
 b=Ofb87nLmMURBkJp3xV7GUVAG4+zrPS96GdyOjju8jHIMZGhrfcgOJmse+4GK2PPu4EBdsp
 AzoaQ8b3qrRUIHosS55kOObMzDG133bItM/e5ukkcAZ77WZSf8Chz7nVgj9XN55w6b2UId
 yRaTSAzZAQyfxUNsgecgXB7YQaDfsJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-gOKvY7lXPAyyfQoQl3PTBg-1; Thu, 11 Jun 2020 05:14:24 -0400
X-MC-Unique: gOKvY7lXPAyyfQoQl3PTBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE52835B92;
 Thu, 11 Jun 2020 09:14:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA558FF80;
 Thu, 11 Jun 2020 09:14:22 +0000 (UTC)
Date: Thu, 11 Jun 2020 11:14:19 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Subject: Re: Core dump happened when starting a VM on arm64 server
Message-ID: <20200611091419.e2rfcurztmlajlwr@kamzik.brq.redhat.com>
References: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kFzqrk1/e2B/

On Thu, Jun 11, 2020 at 04:46:45PM +0800, Haibo Xu wrote:
> Hi,
> 
> I met a qemu core dump issue when starting a VM with cpu feature
> "pmu=on" on an arm server.
> The commands to start the machine is:
> 
>   ./qemu-system-aarch64 \
>            -cpu host,pmu=on -M virt,accel=kvm,gic-version=3 -nographic
> -m 2048M \
>            -kernel ./Image \
>            -initrd /boot/initrd.img-5.6.0-rc2+ \
>            -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
>            -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
>            -device virtio-blk-device,drive=hd0
> 
> 
> And here is the stack dump:
> 
>  Core was generated by `./qemu-system-aarch64 -cpu host,pmu=on -M
> virt,accel=kvm,gic-version=3 -nograph'.
>  Program terminated with signal SIGSEGV, Segmentation fault.
>  #0  kvm_ioctl (s=0x0, type=type@entry=44547) at

s=0x0 means cpu->kvm_state is NULL

> The root cause is in the arm_get_pmu() operation which was introduced
> in ae502508f83.

Actually the root cause is d70c996df23f ("target/arm/kvm: Use
CPUState::kvm_state in kvm_arm_pmu_supported()"). ae502508f83 used
the machine kvm_state, not the cpu kvm_state, and that allows pmu=on
to work. d70c996df23f changed that saying that "KVMState is already
accessible via CPUState::kvm_state, use it.", but I'm not sure why,
since kvm_init_vcpu() doesn't run until the vcpu thread is created.

Philippe?

Thanks,
drew

