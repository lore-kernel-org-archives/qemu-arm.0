Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2038330lfb;
        Tue, 20 Apr 2021 04:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZD/hnKQteHheaOkHGXijfcZrdtDQa5gTg84/4Y5aUs4FctrV5zaoqZjcSxI9yMTJDdRtY
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr18822841vsd.27.1618919556271;
        Tue, 20 Apr 2021 04:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618919556; cv=none;
        d=google.com; s=arc-20160816;
        b=q0+S4oKyjPK3ToCcS8M6HGsc0SzZ34siRC9AraAvfpkkj+EgFY0C6knDLBcPhGgYN1
         cUiSAa+USw3CxkgiVIEhvqP4aGnjZS/2MX+9Il4zxoYiD27BEqh3cfFXNzCX2WvFYPsJ
         k55WtdI5419oINmBrjSE72jPzTn0140fWuDIyiHg8GP1WbKpavrZdkwALAOGFlzmCIyU
         JjJdgCWb8aqxMHn1G9ortw3RqkpXgNHO477MvRVAf1I9uiu0dIGp2hLcn4QOSM/GYwZC
         OgAonfpCnxyKtkzJIf+hbk/ehDIPU15He8jRyfd2nNPuS9QzBJG65VfYxCsuHJzkV9Fx
         sRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1d3Qs8pqU6VaS54jRrLe9JgDdsVxdpFZv1Y1nX+qd+c=;
        b=v8KMCNQViquaz5Ves6nS+0Tg7GfPTk71A5pNIXnNtkKYa+zLNtUto+3DQtvZ6wyHUO
         DOv9TmgdOefVXnuAcoovB/f2wB07rRc1ed6FHlySB24Y7aKN90NX3x/8F0eZok6NRojF
         F34CmTwKxtvBGVvcFf//U7jiyZ8H83yBYgZ5a8k0n6TScJ1nCpQLOpMpwnv9slQO7F2+
         G3Ufw0CUwqQTSgpn+ts2+Naefjjx00m3ouYxdLpN8s8H6zWrPWDl8FsagKK6pdduSirh
         b8xFYFshxEvn44EL2bU7q4rgOiEvoNJOJkuVv4ogBL1ZictwahbjCirEyw1S+RH99RJD
         ac6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f4ItVPK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z129si1347889vkf.33.2021.04.20.04.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 04:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f4ItVPK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYovj-0001yl-Jb
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 07:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYovL-0001xf-Nv; Tue, 20 Apr 2021 07:52:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYovI-0006Az-3X; Tue, 20 Apr 2021 07:52:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id e7so28329517wrs.11;
 Tue, 20 Apr 2021 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1d3Qs8pqU6VaS54jRrLe9JgDdsVxdpFZv1Y1nX+qd+c=;
 b=f4ItVPK4f7PS4KOd9hrhgtJcMuxoi62VPMIlFg7JeW9TWWjtbn/0HxEUx/0TA9HdM6
 AGg7cI4H3hTIiZt78zz47VdAIQOlCl++sp9cCRWjF32DwxrznTpC2Y6RyZGaQ75bkx1J
 javogyjcTwYViKXxABBoE6FQQIvZRwuBHeUXFS9dl7c/0bYMNhj6SEosDw/lsTkSuoS8
 nrEEKAaDTK77roi8AYQSoATKrT9gIMJjFKmjYBK05xY3mHj4qijr0n0bHgZ0KRqei9E2
 3ZVw3AIQc05vz6pxIfr91KntqBPLjKb5Ck8uW7+3YGbWbyi806EAFwGlSQJnn0DO3dRP
 zFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1d3Qs8pqU6VaS54jRrLe9JgDdsVxdpFZv1Y1nX+qd+c=;
 b=rPyomnlo0hr91BsvWENYMtdYMgm3cMxWnZGPpk+zLW6cOCKkCWWIcXVMXiWTPzcT66
 HssbVeKXfkN43l17qO1w7uaNFxLue0fVr0pzPwe87yAUM0PjpOkcBOdeTYKZCX2E6h7t
 hcSApnwYmFVTplmoRXGTdobUBd+VBKSo2kr003gjf/qkBso7ZlSTZJuZKwGwqsUkHO21
 MIQpYdjvfXMkAwhhPIiF7fi/XAEQwCk3LXzaXMjleogliWdNlw1fdT9XLJlQ7/4llr2/
 6g9O6/C4GVCNsj0J9en7tKJGRxem0nCrmWLekg6zUc9LmuMVUBcfxu3LpVCQva2wlINa
 lawA==
X-Gm-Message-State: AOAM533ytd3Z6XJbrL9nQCKTB/FW+A30Uo666rEEbAC3atZZGRveWi9P
 ooPHTdKmYLkzVh7WBXmQajU=
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr20438291wrx.19.1618919525641; 
 Tue, 20 Apr 2021 04:52:05 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r19sm2698923wmq.33.2021.04.20.04.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 04:52:04 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <1df78911-9858-b747-b22b-7e5254cd3cac@amsat.org>
 <CAFEAcA_TuKCJ31xsv_j49oQfOFuEipmMnsNb2czPZRMPTN=wxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb3cc932-5111-c388-2770-3c1110dbc89f@amsat.org>
Date: Tue, 20 Apr 2021 13:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TuKCJ31xsv_j49oQfOFuEipmMnsNb2czPZRMPTN=wxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Arnd Bergmann <arnd@arndb.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dtx0o7T3k8m+

On 4/19/21 3:42 PM, Peter Maydell wrote:
> On Thu, 25 Mar 2021 at 18:14, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 3/25/21 5:33 PM, Peter Maydell wrote:
>>> Currently the gpex PCI controller implements no special behaviour for
>>> guest accesses to areas of the PIO and MMIO where it has not mapped
>>> any PCI devices, which means that for Arm you end up with a CPU
>>> exception due to a data abort.
>>>
>>> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
>>> like this return -1 for reads and ignore writes.  In the interests of
>>> not being surprising, make host CPU accesses to these windows behave
>>> as -1/discard where there's no mapped PCI device.
>>>
>>> The old behaviour generally didn't cause any problems, because
>>> almost always the guest OS will map the PCI devices and then only
>>> access where it has mapped them. One corner case where you will see
>>> this kind of access is if Linux attempts to probe legacy ISA
>>> devices via a PIO window access. So far the only case where we've
>>> seen this has been via the syzkaller fuzzer.
>>>
>>> Reported-by: Dmitry Vyukov <dvyukov@google.com>
>>> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> v1->v2 changes: put in the hw_compat machinery.
>>>
>>> Still not sure if I want to put this in 6.0 or not.
>>>
>>>  include/hw/pci-host/gpex.h |  4 +++
>>>  hw/core/machine.c          |  1 +
>>>  hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 58 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
>>> index d48a020a952..fcf8b638200 100644
>>> --- a/include/hw/pci-host/gpex.h
>>> +++ b/include/hw/pci-host/gpex.h
>>> @@ -49,8 +49,12 @@ struct GPEXHost {
>>>
>>>      MemoryRegion io_ioport;
>>>      MemoryRegion io_mmio;
>>> +    MemoryRegion io_ioport_window;
>>> +    MemoryRegion io_mmio_window;
>>>      qemu_irq irq[GPEX_NUM_IRQS];
>>>      int irq_num[GPEX_NUM_IRQS];
>>> +
>>> +    bool allow_unmapped_accesses;
>>>  };
>>>
>>>  struct GPEXConfig {
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 257a664ea2e..9750fad7435 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
>>>      { "PIIX4_PM", "smm-compat", "on"},
>>>      { "virtio-blk-device", "report-discard-granularity", "off" },
>>>      { "virtio-net-pci", "vectors", "3"},
>>> +    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>>>  };
>>>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>>>
>>> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
>>> index 2bdbe7b4561..a6752fac5e8 100644
>>> --- a/hw/pci-host/gpex.c
>>> +++ b/hw/pci-host/gpex.c
>>> @@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>>>      int i;
>>>
>>>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
>>> +    sysbus_init_mmio(sbd, &pex->mmio);
>>> +
>>> +    /*
>>> +     * Note that the MemoryRegions io_mmio and io_ioport that we pass
>>> +     * to pci_register_root_bus() are not the same as the
>>> +     * MemoryRegions io_mmio_window and io_ioport_window that we
>>> +     * expose as SysBus MRs. The difference is in the behaviour of
>>> +     * accesses to addresses where no PCI device has been mapped.
>>> +     *
>>> +     * io_mmio and io_ioport are the underlying PCI view of the PCI
>>> +     * address space, and when a PCI device does a bus master access
>>> +     * to a bad address this is reported back to it as a transaction
>>> +     * failure.
>>> +     *
>>> +     * io_mmio_window and io_ioport_window implement "unmapped
>>> +     * addresses read as -1 and ignore writes"; this is traditional
>>> +     * x86 PC behaviour, which is not mandated by the PCI spec proper
>>> +     * but expected by much PCI-using guest software, including Linux.
>>
>> I suspect PCI-ISA bridges to provide an EISA bus.
> 
> I'm not sure what you mean here -- there isn't an ISA bridge
> or an EISA bus involved here. This is purely about the behaviour
> of the memory window the PCI host controller exposes to the CPU
> (and in particular the window for when a PCI device's BAR is
> set to "IO" rather than "MMIO"), though we change both here.

I guess I always interpreted the IO BAR were here to address ISA
backward compatibility. I don't know well PCI so I'll study it
more. Sorry for my confused comment.

>>> +     * In the interests of not being unnecessarily surprising, we
>>> +     * implement it in the gpex PCI host controller, by providing the
>>> +     * _window MRs, which are containers with io ops that implement
>>> +     * the 'background' behaviour and which hold the real PCI MRs as
>>> +     * subregions.
>>> +     */
>>>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>>>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>>>
>>> -    sysbus_init_mmio(sbd, &pex->mmio);
>>> -    sysbus_init_mmio(sbd, &s->io_mmio);
>>> -    sysbus_init_mmio(sbd, &s->io_ioport);
>>> +    if (s->allow_unmapped_accesses) {
>>> +        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
>>> +                              &unassigned_io_ops, OBJECT(s),
>>> +                              "gpex_mmio_window", UINT64_MAX);
>>
>> EISA -> 4 * GiB
>>
>> unassigned_io_ops allows 64-bit accesses. Here we want up to 32.
>>
>> Maybe we don't care.
>>
>>> +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
>>> +                              &unassigned_io_ops, OBJECT(s),
>>> +                              "gpex_ioport_window", 64 * 1024);
>>
>> Ditto, unassigned_io_ops accepts 64-bit accesses.
> 
> These are just using the same sizes as the io_mmio and io_ioport
> MRs which the existing code creates.
> 
>>>  static void gpex_host_class_init(ObjectClass *klass, void *data)
>>>  {
>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>> @@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
>>>      dc->realize = gpex_host_realize;
>>>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>      dc->fw_name = "pci";
>>> +    device_class_set_props(dc, gpex_host_properties);
>>
>> IMO this change belongs to the parent bridges,
>> TYPE_PCI_HOST_BRIDGE and TYPE_PCIE_HOST_BRIDGE.
> 
> Arnd had a look through the kernel sources and apparently not
> all PCI host controllers do this -- there are a few SoCs where the
> kernel has to put in special case code to allow for the fact that
> it will get a bus error for accesses to unmapped parts of the
> window. So I concluded that the specific controller implementation
> was the right place for it.

Yes the changes are simple. I'm certainly not NAcking the patch,
but can't review it neither :( So please ignore my comments.
