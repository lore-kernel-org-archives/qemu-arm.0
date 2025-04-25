Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4273074njd;
        Fri, 25 Apr 2025 03:35:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSZ1lSZUIz6miEbOrbkCc1/Qu45nQIPzVhgQQ5nqq93xH2kp8yIQ01Cg5BuaMcCjq7lU++Il3WVnYIjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGTne5WWZEI9sxVLYnJ+a0BGbPsHNdKDHMuN8+xGLq1S7ZMG48a/QCz88y3/8fUjKMElu8s
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id af79cd13be357-7c9607b24e8mr273119885a.56.1745577336032;
        Fri, 25 Apr 2025 03:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745577336; cv=none;
        d=google.com; s=arc-20240605;
        b=TYpabSbPnnKugI4tftcM4kgYBnsTf2rR7niuafmXHfALYrcq9eFkemw6vSirlRVJTL
         5PJl3HnlaX7yL6NDlvcchPYKiGHcpYQEbSPJtkJeUmw6bGWsh+uwTS0mjQVztSvB5eWz
         eyv9HB3dgkWBDPo8uoPwkx3NanCb5OgQ1Igmnsivo9LrPYqRhBFCkoFk6qTiruNMCvZy
         CUus6kVqp0d3KKr/gtnB4qwAokVvLeVyvNdFaeuyaJIpjEkcQEr2/TlnDM1pc7jFm0a/
         bNi2v9ObUvi1bn8/ms/qG0ntNfcvXrXfCq+aeTP9PLogsI3+8SD69CdSPmnVS/JMjnee
         OWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kA0W8cd4KB8E87d1e/uyPkx8dl85yv1pXirIFdrdRs4=;
        fh=6AiUuEqMyopiogf3tVvx2UYeeatW989M7xpKTDpqoZA=;
        b=NSrvZETdQocqsxPmSZV+CIMy7VnykgvFKTNQC1LKCucMzk0b65PELm4k1tOULVwR/s
         CLoroaVLgq+IJ6Kao3CTED7cW7SrytLaKg0p/JGYVFpv3IyiAcXWZ25bAURFmY3GKeIf
         iAzUcAvYEtJiMqY+iVfyd/pArrIARFJFwIhpboT/9gcwejbYf2x0hfE5EK2uguOoVy69
         HwsvAvxecMGUSZ8uRi5n8KcInoLXDB31jB2sXGwsOxYuOoM/cmtwiE4/1TXIJJQRZAxX
         ICbdA9AC9uzc8PNBh6hHmxLwg1XCauGyiMDfvYaCC6gTlEGKvVMSxXowDcE67zOHh1qU
         NHMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWrGFTR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d86cd0si348954785a.229.2025.04.25.03.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 03:35:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWrGFTR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8GOx-0000mT-KD; Fri, 25 Apr 2025 06:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GOv-0000m2-5D
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:35:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GOt-0007vE-5Q
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:35:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so1566614f8f.2
 for <qemu-arm@nongnu.org>; Fri, 25 Apr 2025 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745577317; x=1746182117; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kA0W8cd4KB8E87d1e/uyPkx8dl85yv1pXirIFdrdRs4=;
 b=uWrGFTR7GACL0lzklY90G+nqpJcF5QEHFmX3A/+Nwpdskvv3FJ0WNcB262nsVrDbP4
 gxIBQl4RnLsqGQjdtgzgrhz2y8oA8nOJpuNMPESiYD5CWj/mhUljhfXxZHDv+awHd6Mg
 eiB7kBK6/1P1MeEw12hmmt3ySNsK7dFeU2OBQiEPb4q1V6kiBaPLmGe6+6iZ6jNWhZXA
 1j8IDEyJHNcK6fqzsUNq+9e5Ebt1E97lNXW3NGOxP00lEwIRIchoymXVv3Ml3U93YyUw
 A/TFGm6c2P0ca68b2RZj8NFMpJfaGSaWBMai98g9iYGKcpDKqqj3igFnGXiUnvSkMfQW
 4NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745577317; x=1746182117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kA0W8cd4KB8E87d1e/uyPkx8dl85yv1pXirIFdrdRs4=;
 b=pB5cC8AR2HKqhLBQdMDffTd7RhwC41uukKYLrglued+F7Ia7Euk/Sz8VJ/x/gV1vji
 ETKsw7NQHIKxlMFYSmNYjbJ+hUw78RuaH95qARf8CsaBNpdH5QeQFpQ/Rqnv/VD3OLhm
 He/Kf1wop5LBllhQzrbMgk4s3mV6sW9tsNUVDc1SByHfKNPBfz80y2O12Gzpo9wA7S04
 HaXLQhExMmqhOWV0imrwgXvkumsdw8XVG645oZIloBWGwL/4ruoQtTSoh1Dq9pJvBIZH
 nLU+3Pf9tVop9Pojkg9vWe4/SRwAhbTmnt8DCtPW5ExFMXaRCfT8Gc/2NIka/sjRS4Zg
 unmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvgrHx8GsUk/loxrkcr54H/+wurbdbiaOGyZame+n71SCfVdbi/QnA3ARM0vLGe8xVagFb6y0Q6Q==@nongnu.org
X-Gm-Message-State: AOJu0Ywp50hYc9vKXsBrk+KAtp/SKt/r86rw9WPRdCBelL9zacTpaI0m
 HBaqTiXaJoDk79lGF3HO+/lL1phZ6Gse6Ks6oXCGHIDI6SSoJigVxWm0wPcHQd8=
X-Gm-Gg: ASbGncuZFUyPVTj0WhjZmByCth3852t/G7JrijGiNyOGChl3D2ot2YbCp3E5uiAq23j
 mhoTvEVNarInKphajUcbpqy8z66zelabxnc1xDdVX+Kc5B1qveUpfTNM4MUdCwLf33mmZj62Yxb
 lc/1iIU/IdspibU7T+XxuayXbya2SD9ov3wEdtNb1KbpgGzKxXUrS16kJFsVpLFb1WTwHEsCoAC
 dK0FTUwx5SNwTye68J7tnclWip9V7usoGFqSH+OwrJ2sqGRSbREYu/sa7dTM6g25TP4j3KhYOJw
 9eN0z8DarCMS8CZIkBQONQK8k7qyS4IrbMoiPZJtaDVPDZvRtETZToO8jNPTKZu80cRXM44qOjK
 rXcsOjTqL
X-Received: by 2002:a05:6000:1a88:b0:39d:724f:a8a0 with SMTP id
 ffacd0b85a97d-3a074fae1damr1251690f8f.58.1745577317346; 
 Fri, 25 Apr 2025 03:35:17 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8c7a4sm2030455f8f.14.2025.04.25.03.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 03:35:16 -0700 (PDT)
Message-ID: <fa6f20a9-3d7a-4c2d-94e5-c20dbaf4303e@linaro.org>
Date: Fri, 25 Apr 2025 12:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] qapi/qom: Introduce kvm-pmu-filter object
To: Zhao Liu <zhao1.liu@intel.com>, Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, Shaoqin Huang <shahuang@redhat.com>,
 Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>,
 Alexander Graf <agraf@csgraf.de>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-2-zhao1.liu@intel.com> <878qo8yu5u.fsf@pond.sub.org>
 <Z/iUiEXZj52CbduB@intel.com> <87frifxqgk.fsf@pond.sub.org>
 <Z/i3+l3uQ3dTjnHT@intel.com> <87fri8o70b.fsf@pond.sub.org>
 <aAnbLhBXMFAxE2vT@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aAnbLhBXMFAxE2vT@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J1WSpxOUdH0O

Hi Zhao,

On 24/4/25 08:33, Zhao Liu wrote:
> Hi Markus,
> 
>>> This is for security purposes, and can restrict Guest users from
>>> accessing certain sensitive hardware information on the Host via perf or
>>> PMU counter.
>>>
>>> When a PMU event is blocked by KVM, Guest users can't get the
>>> corresponding event count via perf/PMU counter.
>>>
>>> EMM, if ‘system’ refers to the QEMU part, then QEMU is responsible
>>> for checking the format and passing the list to KVM.
>>>
>>> Thanks,
>>> Zhao
>>
>> This helped some, thanks.  To make sure I got it:
>>
>> KVM can restrict the guest's access to the PMU.  This is either a
>> whitelist (guest can access exactly what's on this list), or a blacklist
>> (guest can access exactly what's not this list).
> 
> Yes! The "action" field controls if it's a "whitelist" (allow) or
> "blacklist" (deny).
> 
> And "access" means Guest could get the event count, if "no access", then
> Guest would get nothing.
> 
> For example, if we set a the whitelist ony for the event (select: 0xc4,
> umask: 0) in QEMU:
> 
> pmu='{"qom-type":"kvm-pmu-filter","id":"f0","action":"allow","events":[{"format":"x86-select-umask","select":196,"umask":0}]}'
> 
> then in Guest, this command tries to get count of 2 events:
> 
> perf stat -e cpu/event=0xc4,name=branches/,cpu/event=0xc5,name=branch-misses/ sleep 1
> 
> Since another event (select: 0xc5, umask: 0) is not on whitelist, its
> "access" is blocked by KVM, so user would get the result like:
> 
>   Performance counter stats for 'sleep 1':
> 
>              348709      branches
>                   0      branch-misses
> 
>         1.015962921 seconds time elapsed
> 
>         0.000000000 seconds user
>         0.015195000 seconds sys
> 
> The "allowed" event has the normal output, and the result of "denied"
> event is zero.
> 
>> QEMU's kvm-pmu-filter object provides an interface to this KVM feature.
> 
> Yes!
> 
>> KVM takes "raw" list entries: an entry is a number, and the number's
>> meaning depends on the architecture.
> 
> Yes, and meaning also depends on format. masked-entry format has special
> meaning (with a flag).
> 
>> The kvm-pmu-filter object can take such entries, and passes them to
>> straight to KVM.
>>
>> On x86, we commonly use two slightly higher level formats: select &
>> umask, and masked.  The kvm-pmu-filter object can take entries in either
>> format, and maps them to "raw".
>>
>> Correct?
> 
> Yes, Markus, you're right! (And sorry for late reply.)
> 
> And "raw" format as a lower level format can be used for other arches
> (e.g., ARM).

Since you provide the ability to use a raw format, are we sure other
accelerators will never be interested in such PMU filtering?

I'm pretty sure HVF could benefit of it (whether we implement it there
is another story).

What do you think about adding this as a generic accelerator feature.
If a particular accel doesn't support it and we ask to filter, we simply
report an error.
