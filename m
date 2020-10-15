Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp797659lfa;
        Thu, 15 Oct 2020 11:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAWVuAlcJhTxXY0lmH00MFywtwipX1IOskuiAmkbAvOi1qFtuLwmYg7qtOm09brWyJbp6s
X-Received: by 2002:a25:fc0c:: with SMTP id v12mr6569999ybd.351.1602784953814;
        Thu, 15 Oct 2020 11:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602784953; cv=none;
        d=google.com; s=arc-20160816;
        b=YW9EiTb2bp2QXNBJhWK11uEbNFarRLMAISKVycFwAT3ekvhxoHxYkEB2hI2CchQylH
         IDOtCuls34CBh5G1XK6yyAMxr0tLB0IPJSHbNadrZSp5ETkST5A633fPmS/HQlbpevPk
         R5CJ1irsmcTu/Gp3tlNrCdCm4tQFIcVbJhDGXusQSZWQs08ErtJnJqB600yzGfPYl/TR
         Bfifs6tMf7ujnl013OaDguBbW5kcFV3bGU9IeZljGPvVVYSQxQw0Am9EiavPSpJBnsAq
         V24aFk6u+EhGatl/m2dgw4fazCHzGbd5uNVNWdYiKZ7GW31oTlfYUtFr/QzrDjx86x5L
         +tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Mag/Kcm/YoTzcvdAz05eCoVI8A8FD2AuRXcNnSFNPZI=;
        b=A0orSwH90UOFAXiMurp5Iw0UXeJckyD1/t78y/KNEY78QYesNUIihKiSJtvjXllwN+
         5C6PH6kbp2RTZRCV9Q3BT4LJGyzOYQ2P5bgwnQ9vvgvRPcPP66JODPaNvEN1k/FxAo3+
         lCm9EjR0o8+U3wtakij+qkZQAI3DK6Oy8XXJPeozlLgAUvT6UyWsbJYFkTp053HQhjvp
         bNkeaBVmaMEEbxz/XeSb7zYH02LAX3DFDtphZD5wfjQSv7xZpbisyjfcRG1PBIrTAaSu
         1t9pyoSfo8d6hxal/o14A943THVRj7IxV/fR1vycToRvhiP16LBF1z/QeARTfOKz/BF6
         aHEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKIwHSjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si4094016ybg.143.2020.10.15.11.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 11:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKIwHSjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT7aD-00067L-7D
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 14:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT7Zn-00065n-EP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 14:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT7Zl-0001xx-9M
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 14:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602784923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mag/Kcm/YoTzcvdAz05eCoVI8A8FD2AuRXcNnSFNPZI=;
 b=SKIwHSjJ1Gc/RA91l5gd5dxzt64xSEQ8tx2Er3ub8bn9DQrneVHCCDmqQWCUzG/m429tgn
 n6K2TzO3trQNF0HUCMU4jsJM+R1+ry9MUzDhPftCeRaWn+A9IAo9ntvWmPxSuMcpGEGyoa
 sVvXosewbcP+1gJ1dyHx7XfZWl1OyMk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-2LvA3gz0PVK5kQ-pdQmyOg-1; Thu, 15 Oct 2020 14:02:01 -0400
X-MC-Unique: 2LvA3gz0PVK5kQ-pdQmyOg-1
Received: by mail-wr1-f70.google.com with SMTP id 33so2441723wrf.22
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 11:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mag/Kcm/YoTzcvdAz05eCoVI8A8FD2AuRXcNnSFNPZI=;
 b=B+EkyuMyq+uSyfnESaOg0otniDXiWC1GmVzj70y+shS/RmyeMYGKze1DsczFbyRSOe
 gNQhD5lkrAWQGlJIJuG2LCOBmliS7E/RvEkEhKxuQraHuoQemXDUa4grdO/+l8s7xMox
 0A7H4HUeu9biUG3XJfoSHvxyv/rEpqZuQjm4vNOATxhKz/+MEG281b0P1hOhaeKylf/s
 Epuh5kqYeKMETCa+7ixRvpMrflLMBsjnAOmFsqUeiR8aMPhmLLCsfJ/FOzzFghaPFG2m
 4whCI11HL2ZnJX9WRYNR/jQIl1AqHw7ndHKzUg5jY0R/0mHGPQatRzzUhGuRrUMrNC88
 GhVA==
X-Gm-Message-State: AOAM532uaJ9TfDGLz0qVutJ7YQ7tBtQxTT/aiSqq8daO/eHyRH93F/zg
 QFPzbd8SMAqf04vf4cKbgq1DyyaBJJc0Zf1jJ5gkO7cED2zyf4k9QWU2KU7JpyqsUzB6KP8hC6q
 NixRl1GtU+V8Z
X-Received: by 2002:adf:eac6:: with SMTP id o6mr6046140wrn.117.1602784918898; 
 Thu, 15 Oct 2020 11:01:58 -0700 (PDT)
X-Received: by 2002:adf:eac6:: with SMTP id o6mr6046091wrn.117.1602784918551; 
 Thu, 15 Oct 2020 11:01:58 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id l1sm57584wrb.1.2020.10.15.11.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 11:01:57 -0700 (PDT)
Subject: Re: [RFC 0/5] NVMe passthrough: Support 64kB page host
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <0a1ae4dd-064b-49c5-0669-04219646f616@redhat.com>
 <d3ba4c98-67b8-0d38-378a-805fb02b3d40@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <920515f6-aae8-41fa-007a-701bdd6cdf1c@redhat.com>
Date: Thu, 15 Oct 2020 20:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <d3ba4c98-67b8-0d38-378a-805fb02b3d40@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +IZ0zg63Ln9h

On 10/15/20 6:15 PM, Auger Eric wrote:
> Hi Philippe,
> 
> On 10/15/20 3:49 PM, Philippe Mathieu-Daudé wrote:
>> On 10/15/20 1:52 PM, Eric Auger wrote:
>>> This series allows NVMe passthrough on aarch64 with 64kB page host.
>>> Addresses and sizes of buffers which are VFIO DMA mapped are
>>> aligned with the host page size.
>>>
>>> nvme_register_buf() path is taken care of in this series
>>> but it does not seem to prevent the use case from working.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/nvme_64k_rfc
>>>
>>> This was tested on ARM only.
>>>
>>> Eric Auger (5):
>>>     block/nvme: use some NVME_CAP_* macros
>>>     block/nvme: Change size and alignment of IDENTIFY response buffer
>>>     block/nvme: Change size and alignment of queue
>>>     block/nvme: Change size and alignment of prp_list_pages
>>>     block/nvme: Align iov's va and size on host page size
>>
>> Since it is easier for me to rebase on top of your series,
>> I'm including it in my work (fixing the checkpatch errors)
>> and will repost block/nvme/ patches altogether.
> 
> There should be one warning (line exceeding 80 chars) but no error. I
> can easily rebase/respin if you prefer.

Yes, warnings, no error. No need to respin.

> 
> Thanks
> 
> Eric
>>
>> Regards,
>>
>> Phil.
>>
>>
> 

