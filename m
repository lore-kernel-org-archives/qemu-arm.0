Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1991038lfo;
        Fri, 5 Feb 2021 05:04:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBLJatHw1uA1XZu3Rft3lkel9Jdus7PUePu2o2EiLAgv9fNzcVDK7eARb5pSPmS6BAoLfv
X-Received: by 2002:a25:6544:: with SMTP id z65mr6474956ybb.202.1612530283085;
        Fri, 05 Feb 2021 05:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612530283; cv=none;
        d=google.com; s=arc-20160816;
        b=x3KPvhO1LMzDaY+BojFrMQJUxD5YLT1DEZetGtrh490YLPvSsvThQ/4YnaGW/RBB3Z
         Lki0xrVkM2re/8SpqcZ3WB6A/bCMcjE5W2Xq+3DpLX+UjRrBh+NYvSX9MXNlHx6CsV13
         HZMh2V5ap9oJKvhOlZi9r3kWxjC3PEfMGW23JLmuYl40eaZz0LEbrBKcBatiw/lxBXE8
         Ez/rLDQ3aXM8yKJXVoNZhmJWGp5wI/36wZ9XpgpU2XIzwjtRV9TcJ8A1tDDBaJxFIRR+
         c25QZtXp58/bhLm8n/2lCo7qBfnFM88yvOw3GYqyuiIiYQSkTHQN1egAH9m/3Opd51Ie
         9E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=96htHRhshsWeCA5TkZVO1dA4434YdbQRfCp/KdBRqac=;
        b=YfmcUQFQBy8Kdan8jGbRvbGYkMVIMiVsP2/Kv5mCLepVfvv6vAFy9+aonN9WBH5gnj
         mlGo+jeM3wmEBhR/Ys7PNUBaCfjj+TpGBY/LrItoKKe0i4khgwibKnI8bDulF5YlaICG
         ACFTe/jT+NULskfD/ym4gpbyTOXDaxEYiu3HcLBKzj5xmPvlGN1MdvgLmf2aq3m5ShXw
         nednQIkQStRBHkhsqXjF6n/GmH0UTZpiZgJjXSA2n6bjx7FWn3htIRx8sLYXYMuJD+5U
         x/aI/cFChFl5qo5Jn8pDlwv5pEmj1uyNxIzMOWR27SCzGVAoctoznSbx06525XMj8YxL
         c4Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B+o9no3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si8263608ybe.71.2021.02.05.05.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 05:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B+o9no3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l80mw-0004Su-F2
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 08:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l80mH-0004SA-7g
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 08:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l80mD-0008Sh-QS
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 08:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612530237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96htHRhshsWeCA5TkZVO1dA4434YdbQRfCp/KdBRqac=;
 b=B+o9no3/E4FuSHM6K8CKbgtnY6PvcaTWytJyhZw08DmcwWzbGyvFSx9CWSdK3dW/S58I87
 8AIrRW3aqo1U+uUWYREfhfGJOcpqhveLFDGA45PT4lH/7ZURJhWbnNG28TZcsBedEG1v+G
 n5J9NhqXisPHZ7d3McEtxwy1rVC8mI4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-CbslqLuiMLylg-ldn81OZw-1; Fri, 05 Feb 2021 08:03:55 -0500
X-MC-Unique: CbslqLuiMLylg-ldn81OZw-1
Received: by mail-ej1-f72.google.com with SMTP id aq28so6721750ejc.20
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 05:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=96htHRhshsWeCA5TkZVO1dA4434YdbQRfCp/KdBRqac=;
 b=U/5D0GmoZslCEBLiwqXFVAV1dT+9NIXTKXd61/Krl1ZJfHVbvcQhmBZCaB/SowU8sB
 N5weYSkxJejrW1JBk2YVTivjfhqPtoap+EFtdD5HlTRFjONqla6hIgL6pwgd/h9PYi2+
 OUG57bsFx/Hi0DG1VPJ517axfXmrkXmKxUxRhKWnbh64S/HonVYvjaNKsNsz0oFhaTeR
 vzv5w2/W41wjiR4Pdk3ZZmTyePUCEPiG4QZuij33oivSrXB0wjXO54Y/oHi7pe0pHfC9
 7w3WUy+8yhwIUM9bYbJXaB+2/cGOa2sCdESD21sGm8gO5yoNqqSf2UGYV7zh+4fWeOBP
 QQKQ==
X-Gm-Message-State: AOAM532Lk0gKlThUZlQNbPSOXKILNq/+bRoC5u1gdIqlojuloJG0fazm
 Rt8R+Epzqgk9ehttBg/t/5Tdsw9ZNL7NNcK171pT4cAuk71celGh+XMu3jG8U86RQrAx7azvmd7
 fcQrawALf5tAU
X-Received: by 2002:a17:906:442:: with SMTP id e2mr4017614eja.9.1612530234102; 
 Fri, 05 Feb 2021 05:03:54 -0800 (PST)
X-Received: by 2002:a17:906:442:: with SMTP id e2mr4017590eja.9.1612530233859; 
 Fri, 05 Feb 2021 05:03:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm3837016eje.12.2021.02.05.05.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 05:03:53 -0800 (PST)
Subject: Re: QEMU v5.2.0: object_new_with_type: assertion failed: (type !=
 NULL)
To: Bharat Bhushan <bbhushan2@marvell.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
Date: Fri, 5 Feb 2021 14:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EUSDSuW3PAma

On 2/5/21 12:48 PM, Bharat Bhushan wrote:
> 
> Hi All,
> 
> I am using QEMU version "v5.2.0" and getting below error when running on arm64
> 
> $ qemu-system-aarch64 --version
> 
> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> 
> Running GDB give below information.
> Is this something known.
> 
> (gdb) run
> Starting program: /root/qemu-system-aarch64 
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> [New Thread 0xfffff703ed90 (LWP 5212)]
> **
> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> 
> Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
> 0x0000fffff73e380c in raise () from /lib64/libc.so.6
> (gdb) bt
> #0  0x0000fffff73e380c in raise () from /lib64/libc.so.6
> #1  0x0000fffff73d0bcc in abort () from /lib64/libc.so.6
> #2  0x0000fffff7b7c058 in g_assertion_message () from /lib64/libglib-2.0.so.0
> #3  0x0000fffff7b7c0b8 in g_assertion_message_expr () from /lib64/libglib-2.0.so.0
> #4  0x0000aaaaab2b880c in object_new_with_type (type=<optimized out>) at ../qom/object.c:711
> #5  0x0000aaaaab2b8870 in object_new (typename=typename@entry=0xaaaaab50a668 "container") at ../qom/object.c:744

How can you not have "container" registered? libqom is a core part
of QEMU... Cc'ing Gerd for the module initialization.

> #6  0x0000aaaaab2b9ec4 in object_get_root () at ../qom/object.c:1674
> #7  0x0000aaaaab2a4c0c in get_chardevs_root () at ../chardev/char.c:50
> #8  0x0000aaaaaaf9f2b4 in chardev_machine_done_hook (notifier=<optimized out>, unused=<optimized out>)
>     at ../chardev/chardev-sysemu.c:45
> #9  0x0000aaaaab3d4ae8 in module_call_init (type=type@entry=MODULE_INIT_QOM) at ../util/module.c:106
> #10 0x0000aaaaab235000 in qemu_init (argc=1, argv=0xfffffffffcb8, envp=<optimized out>) at ../softmmu/vl.c:2916
> #11 0x0000aaaaaad9e084 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:49
> (gdb)
> 
> Thanks
> -Bharat
> 

