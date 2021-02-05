Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2126273lfo;
        Fri, 5 Feb 2021 07:56:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQhhIG2cdmPpnC2kPIM9RaEwCvjetFdbxw6npSFUDWLWgVeXIHui9RfmX79mpq5D3AezaN
X-Received: by 2002:a25:b904:: with SMTP id x4mr6387505ybj.189.1612540559870;
        Fri, 05 Feb 2021 07:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612540559; cv=none;
        d=google.com; s=arc-20160816;
        b=aFRx20snby8LzX9ahv+28seWSMNGtYJ/mr0uvtCPrnM1eK/QZCoRCjxGlp6wPlkHQJ
         8cUJonjkUWrRPr37pqGGjbrkRtCTBciIw1IidaM5SYZAignTud/Xn3u3ZejdvYP5jDVY
         hz0w62OKH45LVFRXJC7/VCBJIOHiOcdgmocgekA1yRRSWYWlWSg2eAb/VK2Zd1NVMUnc
         6WUn2zp9tvKTMxWQoE6zGk2vuteXESm/XlPxYEumm1IzYP2ydaoaC/XiXLrEDh/fkfeM
         Yac1h1VLycPSfD3f1/FkjZaq2jxofjhZLctNC6MLe+CmJSknQWLfMZBYK1AVLKKf5cKZ
         dmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EBOHPTaHlVcdxCJUmkboBJ4j8trrCSUtNP+rvlcQ5Wg=;
        b=ATFL7oaZCCwjGJeqWm7IGlo8nfdsY7zMjjjdnsJrALCwUgH52KGiX9ebMtuAapC11g
         PaIAofHpgrHNIvIdnTBK5Q3dM/c9qaXCnkaDL0629PVm95q1bYGW/CCeDECnA4PaFN5G
         JkqO7yPNdCZUsa0IKaaueWRrrabFonnTpwKnLQIZuNOtolbkiX+6iDPCY73qMqFowAhU
         NrIpIUYabJPFSUNpNzCV8kaxRbu958juuIThN4WstNx42qBsqqriyo856zgqvN/3rtbB
         R53tG/YlE7CVQJA2J+uDfIJoMyg6azF4kaYvJVoG/t5dj78peDVmY9S9UN6YMwdbgoJs
         nVJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VZEi5ki1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si9811329ybi.328.2021.02.05.07.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VZEi5ki1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l83Sh-00031c-6S
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l83SW-0002xq-Sa
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l83ST-0008JU-Q0
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBOHPTaHlVcdxCJUmkboBJ4j8trrCSUtNP+rvlcQ5Wg=;
 b=VZEi5ki1UblLU6veFkCngEaJDbcJUXpFHZzAWCehjRGS9RCaBaFn7PIpxJm/IE/UpJMok+
 Skk5IzAAcA0HYenpABstytoSIpvnF9CPaBEPM9Wq6wBeqDz0ZDAwZwfptsumgG5mDvVlZ5
 k8KUfDK1iw6zIHbIqaRV5atzvSamuNc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-ISpjC82EMRuXs1dXiwXbJg-1; Fri, 05 Feb 2021 10:55:41 -0500
X-MC-Unique: ISpjC82EMRuXs1dXiwXbJg-1
Received: by mail-wm1-f70.google.com with SMTP id x20so4020302wmc.0
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 07:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBOHPTaHlVcdxCJUmkboBJ4j8trrCSUtNP+rvlcQ5Wg=;
 b=pIcDzQza8f/9uISdZFMq3nWNkDN1wCGIxRm3l4zY23DnEAze98MLM21i6UBI1NEl+2
 KGSiqoOczuzfH5H9FI4gKtoM2hXNTUV59Nj48klbdflN8h3CUGDVBzAUihQ+mFgROsPi
 o5fBttDzhNTeQd7sK2BFGRZODnhbd3rznJE92ElA3nFZWEsqunVkx/ExPCG1KJiDHL/V
 VhIJbu1uOTgSpIQY1x6LirKRyvoBba8rKQJj1yy0fuMOrVvNRCJiYpt72VtS+ZkzKLdV
 WZF3iRmaHbOWmQpcb1eYXW1vKaIHZ824HyhydxoY8eUi5G2xJH8Ng5IH0RvLzl5/tlo/
 wejQ==
X-Gm-Message-State: AOAM533mkffqBRip31NY1yydiX3PspjmxhSUAkn7t02jz7wro3gMBAYV
 rTNgdTHqTJOevOBSA1lW5CCNrZX7kC/1nyPN5/zfBjG2CK3z9okNXZsuxZDoBPymrBXlJAWGABF
 IG5leCp3TXbVH
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5815632wri.77.1612540539730; 
 Fri, 05 Feb 2021 07:55:39 -0800 (PST)
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5815613wri.77.1612540539547; 
 Fri, 05 Feb 2021 07:55:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z4sm12368776wrw.38.2021.02.05.07.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:55:38 -0800 (PST)
Subject: Re: QEMU v5.2.0: object_new_with_type: assertion failed: (type !=
 NULL)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
 <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b4137a2-5409-e021-1edd-a9dc0a69c2aa@redhat.com>
Date: Fri, 5 Feb 2021 16:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d7l20I8xZnId

On 05/02/21 14:03, Philippe Mathieu-Daudé wrote:
> On 2/5/21 12:48 PM, Bharat Bhushan wrote:
>>
>> Hi All,
>>
>> I am using QEMU version "v5.2.0" and getting below error when running on arm64
>>
>> $ qemu-system-aarch64 --version
>>
>> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>>
>> Running GDB give below information.
>> Is this something known.
>>
>> (gdb) run
>> Starting program: /root/qemu-system-aarch64
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib64/libthread_db.so.1".
>> [New Thread 0xfffff703ed90 (LWP 5212)]
>> **
>> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>>
>> Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
>> 0x0000fffff73e380c in raise () from /lib64/libc.so.6
>> (gdb) bt
>> #0  0x0000fffff73e380c in raise () from /lib64/libc.so.6
>> #1  0x0000fffff73d0bcc in abort () from /lib64/libc.so.6
>> #2  0x0000fffff7b7c058 in g_assertion_message () from /lib64/libglib-2.0.so.0
>> #3  0x0000fffff7b7c0b8 in g_assertion_message_expr () from /lib64/libglib-2.0.so.0
>> #4  0x0000aaaaab2b880c in object_new_with_type (type=<optimized out>) at ../qom/object.c:711
>> #5  0x0000aaaaab2b8870 in object_new (typename=typename@entry=0xaaaaab50a668 "container") at ../qom/object.c:744
> 
> How can you not have "container" registered? libqom is a core part
> of QEMU... Cc'ing Gerd for the module initialization.

The problem seems to be that chardev/chardev-sysemu.c's register_types 
is not exactly a QOM hook, it calls qemu_add_machine_init_done_notifier. 
  And for some weird reason machine_init_done is already true when it is 
called.

Bharat, you could try to set a watchpoint on machine_init_done and see 
who sets it to true.  Alternatively you can try to backport 
5a1ee6077b89ee9a803aaf8d1c98004701f63684, which gets rid of the code 
that is involved here.

Paolo

>> #6  0x0000aaaaab2b9ec4 in object_get_root () at ../qom/object.c:1674
>> #7  0x0000aaaaab2a4c0c in get_chardevs_root () at ../chardev/char.c:50
>> #8  0x0000aaaaaaf9f2b4 in chardev_machine_done_hook (notifier=<optimized out>, unused=<optimized out>)
>>      at ../chardev/chardev-sysemu.c:45
>> #9  0x0000aaaaab3d4ae8 in module_call_init (type=type@entry=MODULE_INIT_QOM) at ../util/module.c:106
>> #10 0x0000aaaaab235000 in qemu_init (argc=1, argv=0xfffffffffcb8, envp=<optimized out>) at ../softmmu/vl.c:2916
>> #11 0x0000aaaaaad9e084 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:49
>> (gdb)
>>
>> Thanks
>> -Bharat
>>
> 

