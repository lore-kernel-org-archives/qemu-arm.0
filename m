Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C04ACCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:17:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtJv-00013b-BY; Thu, 23 Oct 2025 07:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1vBtJt-0000xZ-7N
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:17:25 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1vBtJr-00063E-41
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:17:24 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-373b7e07182so355470fac.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opnsrc.net; s=google; t=1761218239; x=1761823039; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJWYBEk/V4d9wpSFG/g1KRLHkm47ZYXjvJVAJan0qOA=;
 b=HnKbFrBVu/N8tTmG3HidTnopSYYJpKI6S9eWC7K/QJwd725sXq3/VX8q250XSi9+aE
 JMD15reu2ueCHxdMS9XmrQtwFQG6/fzdfdEIiZ6Xmh3fVNAhhgn0ANdRQKckYzadJ4Tl
 RXbNfgPAaRqZ/BOo8QsH/5sBRmj/4iJMjmD5e9zZL9+ZEExbubwZEUKA0i68Au3rEbjb
 OXrEwkEx4CpPP81AtsDCxKg/Yehqrp5hAtMC+WXdrl/QjmGj3QKg2JS8Uihra4o8VEuA
 3VJy0XqDY6YLO9NzHJLK6jh6VsfV52XM9oJDP2FmCMwLpwJc/y/2pnk0W4ch5x95lfm3
 Ip+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761218239; x=1761823039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJWYBEk/V4d9wpSFG/g1KRLHkm47ZYXjvJVAJan0qOA=;
 b=QeFHbioJvDvHEdxiaV3kEK19LE7DbDbebyDUl5i3U8ofZTSvZaqwhk0XXZ4jbkooGI
 a2kBGGKmUrLf1vFJKu5hhhjtIE6G/nx0XyPD9bwVTSFtycwr73BzCZwt5TEBbdk5xuTb
 PYAdExPtK0/1wxRMXA4EAz69Gee1MxNid1a3eWFkAoy7IKXOC+33qKqkCf7sU4aX5EMi
 YerrS3WQTw3chX4nYNNRAtZ5KI1VhzIJpHxZNCYT05a/F6EMILmxa8b1Ww0s6Zpo7wgd
 rEJpshiJTfLfeFPdd/mbOL7osjMR24KMzuhoki+KrbGPFCO/rbHHZ+HftKiQEThsP63k
 LRlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBWi9dfxsz55zidt7rSiXjiKPtiBjIEha62HG6FJMyr/3bbuzhs5DCkiCVykpzZwnkYPYh7wTl+A==@nongnu.org
X-Gm-Message-State: AOJu0YzwD8yEu4yZvU/zzRDVwsNTSrwKWxCvqKgB7fMcMcwmMdu2CJwc
 qpWcKk2zuPufmtxZgJwx+1q9BcVlMeXx6cjVCO5Zzm6a9wLur7FD01vm4LOxlz/wQgj6FOlhjxe
 77zV4Siix2x0Z58nBlRWdGC9FEPfIb7L9Ty1cl3Akzg==
X-Gm-Gg: ASbGncvFNvfC5F/vPDFT2SpBSgc8p047OVdpvQxuVLQE/LH9U9N72X3td2bgdq6SEfU
 k7YyHsDkdm5AC1g5ZtvqHou//UQfR/WzlSUctSVvLMM85BoNiad9AOByzHEBr6NZW+weWHLnbYp
 W2l0BgWPM+lDH9eIvx3rfGbbdq/g0qMblEAAGq1x9NA/8WpPxI59OPryHdPatV7AUOfJAtNK7U4
 IXluTCYnMnRHOXn+1J+k4bcmGgK/bmv0TnfGW7f2xQ4G6g9Fs1JRGjfAde0Hn8VffwdkCXXc7y9
 DsyGhxUXirDnu6EcpHpvVpP4oz99+IM2BEGKCzZO2Q==
X-Google-Smtp-Source: AGHT+IGICgurpd3aMLuZ1wxCw3RNpOzkGRQbLMtX0qb9usCEuRGzqnsd0LmxJeXXYle+k1jmQANreIsqiuovY2tthfI=
X-Received: by 2002:a05:6871:1ca:b0:3cd:aa60:c2ce with SMTP id
 586e51a60fabf-3cdc5aa5472mr875723fac.45.1761218238908; Thu, 23 Oct 2025
 04:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-6-salil.mehta@opnsrc.net>
 <a03ed205-b61a-4bba-9f25-83663b7d8a86@redhat.com>
 <CAJ7pxeYurHLqj8GnLrfznmofMpsaw91GeZ3KMyucL0B_gn9gPg@mail.gmail.com>
 <CAJ7pxeaUfUeXwtTVheCTxej-aCTCx0n8-XyAKaFneVUjcWL_7w@mail.gmail.com>
 <beab3dd4-0c19-441c-a9f5-ecae9e791753@redhat.com>
 <CAJ7pxeYEpJGhtL1-3qFEJYTzL-s19fF-it6p5dkq=fg384wBpg@mail.gmail.com>
 <fa5d5a65-616f-405a-a5e5-f8b70ff32193@redhat.com>
In-Reply-To: <fa5d5a65-616f-405a-a5e5-f8b70ff32193@redhat.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Thu, 23 Oct 2025 11:17:06 +0000
X-Gm-Features: AS18NWAMDKvdk11IzAj_EjqCCe8eeIgV6YFd8IufHo1HI04c-yM3AhG5gQvOK_Q
Message-ID: <CAJ7pxeanrOU4cuf-JLgR-v7kMLqkrFUUvb95bBpx9mPy1BcsdA@mail.gmail.com>
Subject: Re: [PATCH RFC V6 05/24] arm/virt,kvm: Pre-create KVM vCPUs for
 'disabled' QOM vCPUs at machine init
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org, 
 jonathan.cameron@huawei.com, lpieralisi@kernel.org, peter.maydell@linaro.org, 
 richard.henderson@linaro.org, imammedo@redhat.com, armbru@redhat.com, 
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org, 
 eric.auger@redhat.com, will@kernel.org, ardb@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org, 
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, 
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk, 
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, 
 vishnu@os.amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com, 
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, wangzhou1@hisilicon.com, 
 linuxarm@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn, 
 lixianglai@loongson.cn, shahuang@redhat.com, zhao1.liu@intel.com, 
 Keqian Zhu <zhuqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=salil.mehta@opnsrc.net; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Gavin

On Thu, Oct 23, 2025 at 1:58=E2=80=AFAM Gavin Shan <gshan@redhat.com> wrote=
:
>
> Hi Salil,
>
> On 10/23/25 10:35 AM, Salil Mehta wrote:
> > On Thu, Oct 23, 2025 at 12:14=E2=80=AFAM Gavin Shan <gshan@redhat.com> =
wrote:
> >> On 10/23/25 4:50 AM, Salil Mehta wrote:
> >>> On Wed, Oct 22, 2025 at 6:18=E2=80=AFPM Salil Mehta <salil.mehta@opns=
rc.net> wrote:
> >>>> On Wed, Oct 22, 2025 at 10:37=E2=80=AFAM Gavin Shan <gshan@redhat.co=
m> wrote:
> >>>>> On 10/1/25 11:01 AM, salil.mehta@opnsrc.net wrote:
> >>>>>> From: Salil Mehta <salil.mehta@huawei.com>

[...]

> >> guest$ cd /sys/devices/system/cpu/
> >> guest$ cat present enabled online
> >> 0-3
> >> 0-1
> >> 0-1
> >> (qemu) device_set host-arm-cpu,socket-id=3D1,cluster-id=3D0,core-id=3D=
0,thread-id=3D0,admin-state=3Denable
> >> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (2): Ope=
ration not permitted
> >
> >
> > Ah, I see. I think I understand the issue. It's complaining
> > about calling the  finalize twice. Is it possible to check as
> > I do not have a way to test it?
> >
> >
> > int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature)
> > {
> > switch (feature) {
> > case KVM_ARM_VCPU_SVE:
> > [...]
> > if (kvm_arm_vcpu_sve_finalized(vcpu))
> > return -EPERM;-----> this where it must be popping?
> > [...]
> > }
> >
>
> Right, I think that's the case: QEMU tries to finalize SVE capability for=
 twice,
> which is the real problem. I'm explaining what I found as below, which wo=
uld be
> helpful to the forthcoming revisions.
>
> machvirt_init
>    virt_setup_lazy_vcpu_realization
>      arm_cpu_finalize_features
>      kvm_arm_create_host_vcpu
>        kvm_create_vcpu                       // New fd is created
>        kvm_arch_init_vcpu
>          kvm_arm_vcpu_init
>          kvm_arm_sve_set_vls
>          kvm_arm_vcpu_finalize               // (A) SVE capability is fin=
alized
>
> device_set_admin_power_state
>    device_pre_poweron
>      virt_machine_device_pre_poweron
>        virt_cpu_pre_poweron
>          qdev_realize
>            arm_cpu_realizefn
>              cpu_exec_realizefn
>              arm_cpu_finalize_features       // Called for the second tim=
e
>              qemu_init_vcpu
>                kvm_start_vcpu_thread
>                  kvm_vcpu_thread_fn
>                    kvm_init_vcpu
>                      kvm_create_vcpu         // Called for the second tim=
e
>                      kvm_arch_init_vcpu      // Called for the second tim=
e
>                        kvm_arm_vcpu_init
>                        kvm_arm_sve_set_vls   // (B) Failed here
>                        kvm_arm_vcpu_finalize
>
> (B) where we try to finalize SVE capability again. It has been finalized =
at (A)
>      Fianlizing SVE capability for twice is disallowed by KVM on the host=
 side.
>
>
> >>
> >> I picked the fix (the last patch in rfc-v6.2 branch) to rfc-v6 branch,=
 same crash dump
> >> can be seen.
> >
> > Are you getting previously reported abort or above new problem?
> >
>
> Previously, the VM can't be started. After your fix is applied, the VM is=
 able to start.
> It's a new problem that qemu crash dump is seens on attempt to hot add a =
vCPU.


Thanks for confirming this as well.

Cheers
Salil.

