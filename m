Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1410684lfg;
        Fri, 20 Aug 2021 08:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze1VN3c/DDu2Rxcwdqkyf8GoxfXR9ea6s081FbkJ5mjia2kgTpAHpO1ODdlCURUp5AoZrm
X-Received: by 2002:a1c:7902:: with SMTP id l2mr4570774wme.71.1629473496280;
        Fri, 20 Aug 2021 08:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629473496; cv=none;
        d=google.com; s=arc-20160816;
        b=wD70oAmbRlhjSWFeKVdbobxXtsdm9HpQGUVYS5vG8I4zC+tYsHP9sB6Ox32R/NhvNT
         OjeGcx8IzY/5Bv2R7lJP7XAJf0EhSAyxj1leQvknlbM7wYfLkUHjz+qiAoYs4/Du5n/z
         q8/aiVj5QANpoSK7H7ycEYu3wNEF6b5gmoAWt40Ybd4C9l4Vtj7tsuE90Ax7WKRu0uAL
         y18xjb4eeY2EvsoN5LcJsCH8XWcaLGVJVA5LiK+elXpCJ+ANqGY6cbN4L4VOsQHAxgVg
         TjRhuzMcTC0bTs/5Hn8YuJQlwlGtcR/FXyAN1YQgCVCvytkY2jxB5YD6ipcun8Th3ggX
         TCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FILXXiWO5cOUkVJ9TND798eiI9oYRMJLevesj8EVdyk=;
        b=Q15Hzj61QBC4V9tIOcaTx+VCzyWuMDEH52LT95DgA6EAqOvnf3Up5vQP1WZaR6jdWv
         GnSdWEfJ/gxsrZ/E2azoaCRBKKyXqDzKyiufIcJZhmDnZ3vwTPQysk6Mb/YDrVnJsVRB
         IPUsT04BMdjGAJATfk6j9WZlaLvUAcMg5ZkGjWs46Mun5hRtpLfhcWnF4D2DPnTKiqJ4
         WNhQXQXm3XpuOgZM7kW+NGewHk8ugqOvCp1bzWBoQvzzpHDms9hnWvMs/+f90oYi7MA7
         aOdbpeXWBz+KhXvJpe/NcB4kx5Qy+mfxiSRPSXlBt/xe9p2tBRAeiqNlML/tk618y6KA
         WtcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Zx+/koFw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si6254872ejf.623.2021.08.20.08.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 08:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Zx+/koFw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH6UZ-0005Wv-D1
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 11:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6UP-0005WQ-GK
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 11:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6UM-0005uu-PP
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 11:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629473481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FILXXiWO5cOUkVJ9TND798eiI9oYRMJLevesj8EVdyk=;
 b=Zx+/koFwhszWGhedRaCp/vx06rR8vVfzTEAnHC6+vrJIi+VYpNsQrmgghui6P/7LxWSsQD
 5bORYlF6k03vo7ojOktnJSDlrvi6W9He2L+JmtaB1VXhdSylhsxkx6EF10AMnUcJKI/SxS
 son93JbtpxJbk+CTaKXPVPN3f8ObSvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-20zthVLCMAS2Ug5AlqK5IQ-1; Fri, 20 Aug 2021 11:31:20 -0400
X-MC-Unique: 20zthVLCMAS2Ug5AlqK5IQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n20-20020a05600c4f9400b002e6dc6a99b9so2512972wmq.1
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 08:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FILXXiWO5cOUkVJ9TND798eiI9oYRMJLevesj8EVdyk=;
 b=Jppr3DjGxtc6KALmzsC2ndxz6KeJM4eH6cWrDqjjUbXq+55CpYA2mKxuLr76GQnEAj
 PXmObSvNxjlrhwYe5mSSq3WjQ/z1SSxrEQle3j7EATUJXjKZYtROTu531YXRO9OoJEcC
 hpHHQcGIo9NJQSBy7ZTk+eAhd2PZejWcfvuzmza2FWCWvjEG6vdszY56RbLaTvGzKK7p
 br0QBy4ahdZ8CWFmyEFYrkbsBrU4sDJxjU3+8jzBLiEqOVHhACqTRsYdMWVzej49SVuQ
 zsdji/CAp2adX3sIMV3GIwrBN4CcYB1+T6tuZ9lw3GmX5AFfGzwPU1pxQXyMk2+6r46q
 Rdeg==
X-Gm-Message-State: AOAM5324UjCryv+lYLCuRb6eyEWYr7/S5E422q4z4OPtwK4zBzeO8I5f
 nmv20UHfM3SHapAEiyxKvOc/vjMcZ2go0WTrLvbUdjXA3upKL8waNMUhBHjP/YIHdP39/ucH7/r
 VnkVJzun5FXPZ
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr10837383wrx.366.1629473478983; 
 Fri, 20 Aug 2021 08:31:18 -0700 (PDT)
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr10837352wrx.366.1629473478761; 
 Fri, 20 Aug 2021 08:31:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z137sm11001824wmc.14.2021.08.20.08.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:31:17 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0ce3c23-d1b3-0853-ef5f-defb55b441fb@redhat.com>
Date: Fri, 20 Aug 2021 17:31:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BsafhYNGe7lY

On 8/20/21 4:39 PM, Peter Maydell wrote:
> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 20.08.21 16:22, Bin Meng wrote:
>>> Hi Philippe,
>>>
>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>> <philmd@redhat.com> wrote:
>>>>
>>>> Hi Bin,
>>>>
>>>> On 8/20/21 4:04 PM, Bin Meng wrote:
>>>>> Hi,
>>>>>
>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>> with QEMU head.
>>>>>
>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>> allocate memory
> 
>> -m 40000000
>>
>> corresponds to 38 TB if I am not wrong. Is that really what you want?
> 
> Probably not, because the zynq board's init function does:
> 
>     if (machine->ram_size > 2 * GiB) {
>         error_report("RAM size more than 2 GiB is not supported");
>         exit(EXIT_FAILURE);
>     }
> 
> It seems a bit daft that we allocate the memory before we do
> the size check. This didn't use to be this way around...
> 
> Anyway, I think the cause of this change is commit c9800965c1be6c39
> from Igor. We used to silently cap the RAM size to 2GB; now we
> complain. Or at least we would complain if we hadn't already
> tried to allocate the memory and fallen over...

Ouch... I remember having tested -M raspi2 -m 8G etc... to verify
the error messages, but didn't noticed the memory was allocated.

static void qemu_init_board(void)
{
    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);

    if (machine_class->default_ram_id && current_machine->ram_size &&
        numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
        create_default_memdev(current_machine, mem_path); // <- alloc
    }

    /* process plugin before CPUs are created ... */
    qemu_plugin_load_list(&plugin_list, &error_fatal);

    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
    machine_run_board_init(current_machine); // <- Machine::init()
                                             //    checks RAM size

    ...

$ qemu-system-x86_64 -m 1T
qemu-system-x86_64: cannot set up guest memory 'pc.ram': Cannot allocate
memory

