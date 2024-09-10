Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1168785njb;
        Mon, 9 Sep 2024 23:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHh1g68uNiPET1v5QyTXxwV+ysSa1bJwwy2GzP1VffAVJo7+sHhflEx+cKSAGp5Hy3iBLaEFdYIHysvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGYqjtw3Jc3AO9qzi/8IprRanmJRJvgw//Zj0wg5WYXPKkCLoLjQjsK+q8RLebdcn+FnnIw
X-Received: by 2002:a05:6214:2f01:b0:6c3:6cf5:d567 with SMTP id 6a1803df08f44-6c532ab60e4mr173631526d6.7.1725950553294;
        Mon, 09 Sep 2024 23:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725950553; cv=none;
        d=google.com; s=arc-20240605;
        b=XDJzeQHDW0MwBNnEYsWxTIai7AD09VsjjvD5pvv443rS/iOIfQzE+wR5PM5fBBHCyc
         JNNDUbuOPZOTfm7UuDHmTlaGkH9PkAqi+Fy34mujBwUFOe3MTLIOdAtb0NfHz4VHrHNZ
         126TmuFOPANhScOPv2PLdT4LvV+DMyOQJXt1fUJdFcdxk8WtYugvLiqVzkWsvghaSMbd
         4ajaWnZzHF9Z1petY0HTOshg0PUR6brvx11fgH6z2A0dibgIm5PG7qit60TcuGQLNCvr
         nbx25/79EtvfBrdboSOn6uqWXqvlJGTJDF7eizvhhb6TbHMj//faXRutxOmtGjrOTSM4
         3igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=M4qYcpdlEoqoKVVCpDmHiuas93mcN63TDG0FJ09qrZo=;
        fh=t33xcwnQhlp5KUJ/wNvTI0aRFMc3yt2hiJ2QLqlVarI=;
        b=ENQP520skcI3tbzFQ7rZonUhMsb1AA9Abdvo02cFIvpcMq7BXwPFMYJTHqtIwP7jtY
         S2cV2SZs66ylvn977IT5sha+rurrls5XPPna9bE4x9V+0xqX5k6B+6DGCn4PYzCEchz+
         6Yax8xcceDX7MKa8/MyNVQ5joZwpkDkLg2ZbjfPvMcX2Zdg0jGdD8TY1wCw2ayX2SfZC
         8i3ZQQxonmLcrCDC+XaZGWASBm1guvlocZPzkJcA6X8jLMrBFT1bs98giAjp1orxSpDG
         FdnwejUdGGIq1VkiheU1HSaFdXx+cAJgHMO6R55uHx72p1s43O/orCMa8WnMN8ftvxpy
         uVNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUHSnTIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534330200si72405046d6.29.2024.09.09.23.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 23:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUHSnTIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snuZz-0004Qp-Rs; Tue, 10 Sep 2024 02:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1snuZy-0004J0-9C
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 02:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1snuZw-00069g-GN
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 02:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725950533;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4qYcpdlEoqoKVVCpDmHiuas93mcN63TDG0FJ09qrZo=;
 b=FUHSnTIvGeIMtErMFr0ar/Gq0+F0ADl/fr+oly0c1RBEgTnYXni54mlSt8q8WBJ0EBOvj0
 1C+3xEAoG3WgKXA7PPmdYZQpofH9nsRpS+dr5Sfa9T9L6oOwxw+ge6JZ0W0vU5Ng7NxOZ2
 aGJoZgUd7lZp5eQO2JbTtMvFY/wMrEM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-UxEwgnazOfetdk96rCx2uA-1; Tue, 10 Sep 2024 02:42:11 -0400
X-MC-Unique: UxEwgnazOfetdk96rCx2uA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7a803adfe52so863417585a.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 23:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725950530; x=1726555330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4qYcpdlEoqoKVVCpDmHiuas93mcN63TDG0FJ09qrZo=;
 b=RvEgfeJj9lY3Oia2f7gkLRCSYgGbLvsQvvEay8SJAl8KYf21vstxXd6SIZjr4JKiLE
 CsVvVqSiHJK0ameG4kBBCErrifk0VTfDKCw0aSx/Jk9/xrXycyew9CdnWY0VM3VLzpBw
 Z0oa2fsYktpVmYqKMK9xypci+7/F1XeB7tBvwOilLZCsWg/8lV7lWKbRnVt5jr3HWyO9
 G4ytjMHskbRQ+IvUobkNYa5VIGlszlg5zv26W4FI/Lb9AuU1MbZ3OoetYyXJdok/lpDt
 UEDUwFwRV3P8Omf3zVWuIlnHXE/OL5shGsbhNKal35edOEwV6KZrfXl3mTqETIZ9qZkX
 7bGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRZS+gzm9pjdvIWANYwnxRU3Qqea9uhhJS4Qzgj58ewy5cvg2JTkDaP6qKXw9qWJ9tq1QeTrNi1Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz0FGJfWlf6g6mGTsWHdpRjO0q0/ph2h1x769DHzaKXMFV57YOP
 OScVLS6551cXIdbFYwJDSywch8p8LP/iwOBjoDZVrlIPfVSBrMcLq0lLk9DTh/HzsKEJ8WEunJX
 7Ryc1Y1jfqDu5T1j5u7jGxaA+AbglopaZwWK2dOn++STOepAA7Q==
X-Received: by 2002:a05:620a:488:b0:7a9:be53:fe3b with SMTP id
 af79cd13be357-7a9be53fe7fmr404916885a.14.1725950530503; 
 Mon, 09 Sep 2024 23:42:10 -0700 (PDT)
X-Received: by 2002:a05:620a:488:b0:7a9:be53:fe3b with SMTP id
 af79cd13be357-7a9be53fe7fmr404914985a.14.1725950530053; 
 Mon, 09 Sep 2024 23:42:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a9a7946b0csm283674485a.23.2024.09.09.23.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 23:42:09 -0700 (PDT)
Message-ID: <146a6f6f-a1bd-44aa-a86e-985484eae65c@redhat.com>
Date: Tue, 10 Sep 2024 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] smmuv3 event 0x10 report when running virtio-blk-pci
To: Zhou Wang <wangzhou1@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <447984db-8c52-c911-d7bd-6616edaaefa5@hisilicon.com>
 <CAFEAcA-qBKn=42SYwU1X_7QrwWZYA1G1Hbf-iUP4GOFu0LwLzw@mail.gmail.com>
 <cbd29bc4-c5ab-22d7-8a3e-fd7646f16fd5@hisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <cbd29bc4-c5ab-22d7-8a3e-fd7646f16fd5@hisilicon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dNV8HYg+FkTY

Hi Zhou,
On 9/10/24 03:24, Zhou Wang via wrote:
> On 2024/9/9 22:31, Peter Maydell wrote:
>> On Mon, 9 Sept 2024 at 15:22, Zhou Wang via <qemu-devel@nongnu.org> wrote:
>>> Hi All,
>>>
>>> When I tested mainline qemu(commit 7b87a25f49), it reports smmuv3 event 0x10
>>> during kernel booting up.
>> Does it still do this if you either:
>>  (1) use the v9.1.0 release (commit fd1952d814da)
>>  (2) use "-machine virt-9.1" instead of "-machine virt"
> I tested above two cases, the problem is still there.
Thank you for reporting. I am able to reproduce and effectively the
maxcpus kernel option is triggering the issue. It works without. I will
come back to you asap.

Eric
>
>> ?
>>
>> My suspicion is that this will have started happening now that
>> we expose an SMMU with two-stage translation support to the guest
>> in the "virt" machine type (which we do not if you either
>> use virt-9.1 or in the v9.1.0 release).
>>
>> I've cc'd Eric (smmuv3 maintainer) and Mostafa (author of
>> the two-stage support).
>>
>>> qemu command which I use is as below:
>>>
>>> qemu-system-aarch64 -machine virt,kernel_irqchip=on,gic-version=3,iommu=smmuv3 \
>>> -kernel Image -initrd minifs.cpio.gz \
>>> -enable-kvm -net none -nographic -m 3G -smp 6 -cpu host \
>>> -append 'rdinit=init console=ttyAMA0 ealycon=pl0ll,0x90000000 maxcpus=3' \
>>> -device pcie-root-port,port=0x8,chassis=0,id=pci.0,bus=pcie.0,multifunction=on,addr=0x2 \
>>> -device pcie-root-port,port=0x9,chassis=1,id=pci.1,bus=pcie.0,addr=0x2.0x1 \
>>> -device virtio-blk-pci,drive=drive0,id=virtblk0,num-queues=8,packed=on,bus=pci.1 \
>>> -drive file=/home/boot.img,if=none,id=drive0,format=raw
>>>
>>> smmuv3 event 0x10 log:
>>> [...]
>>> [    1.962656] virtio-pci 0000:02:00.0: Adding to iommu group 0
>>> [    1.963150] virtio-pci 0000:02:00.0: enabling device (0000 -> 0002)
>>> [    1.964707] virtio_blk virtio0: 6/0/0 default/read/poll queues
>>> [    1.965759] virtio_blk virtio0: [vda] 2097152 512-byte logical blocks (1.07 GB/1.00 GiB)
>>> [    1.966934] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
>>> [    1.967442] input: gpio-keys as /devices/platform/gpio-keys/input/input0
>>> [    1.967478] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
>>> [    1.968381] clk: Disabling unused clocks
>>> [    1.968677] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
>>> [    1.968990] PM: genpd: Disabling unused power domains
>>> [    1.969424] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.969814] ALSA device list:
>>> [    1.970240] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.970471]   No soundcards found.
>>> [    1.970902] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
>>> [    1.971600] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
>>> [    1.971601] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
>>> [    1.971601] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.971602] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.971606] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
>>> [    1.971607] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
>>> [    1.974202] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
>>> [    1.974634] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.975005] Freeing unused kernel memory: 10112K
>>> [    1.975062] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>>> [    1.975442] Run init as init process
>>>
>>> Another information is that if "maxcpus=3" is removed from the kernel command line,
>>> it will be OK.
>>>
>>> I am not sure if there is a bug about vsmmu. It will be very appreciated if anyone
>>> know this issue or can take a look at it.
>> thanks
>> -- PMM
>> .

