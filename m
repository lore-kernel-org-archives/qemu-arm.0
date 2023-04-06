Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp944201ejb;
        Thu, 6 Apr 2023 01:31:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoTDiMR0VgxS1OkWgdcOadRjtGpLg6bYUrLxtEtRtLkAYUzJ7pcgzZ0VdonhVNVjoNagH1
X-Received: by 2002:a05:622a:28c:b0:3e6:2d20:1716 with SMTP id z12-20020a05622a028c00b003e62d201716mr9526192qtw.8.1680769861996;
        Thu, 06 Apr 2023 01:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680769861; cv=none;
        d=google.com; s=arc-20160816;
        b=m1y2tj9ot5F3hpUv4SbaHWeUnayoaiW/S9m+lxxsDVw5RnIFm6ZoKFtgFN0HwwQVib
         8Irgj9RMgFelYmkT30gzPB8MyXTov2Yk7eK9E9Ex5Igbae+lEy9AGnLUnOcSe0Idh9iU
         EveNH4HWD8wvSk2kI69NLkUYfa4+fGenfh4sDqPYoiWgKkqZsNuQNWzC7SIUv5YdBehx
         WArOhBm7lLBuss5GmJ4tkGUBt1d1cNLhWL1xD6y+SJJsi5qkhbPJttE0bg8LCCIyX72k
         Gy9IMh5vTb8fHwaE06PZCYZ+04PGtD3SSNh83jarfqtK2YRA80XjJAPheoT5BxFEDYGz
         r6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
        b=YAHLMzC/fn89nL73Jn+XxXMruot3Och8TnKHO0Rl68oXv5UjPP+Lqpi4raiy5INY/p
         YGl6B/G9ce3oEpFPOzzsIdLq1wAHXQm7DPDO7gPkVgCbSwX83uGbC9kGg6xVMvBI7w/f
         wiuFgRTJc2dX+CITSwrKPW+6s/JHy5m4qlppiSgA8HFMQ+Jqu+dF491V0weB/yhPrmsT
         YVZlfXuq+T8KsA6/UCsWWmG1dvIAyTVXCoDiyx50//D4npG3MKNumEmmlcRgEFW+wSgU
         HaROu+hzBbbSPHRT0RQVTSzDKlai5fMyhkP9p80l/vrsa4ujChTk6IS52zc8RIJrTOoy
         mI9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fq5hrbME;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v20-20020a05622a131400b003c004e432f0si541223qtk.738.2023.04.06.01.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fq5hrbME;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680769861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
	b=fq5hrbMEhSr5sV2EYnGWDORJco4nvgQELjlwSO/41rdakmqlGvjgpENehimCW/VeH4zX4E
	E3+MFG9oYrgfH21vqyXP12eLTt6XkqWt+OpZlH0ND/A1Qczeq2sZn/vir4+eG5heyVdYfs
	eXQrftlGl1/oTebIvowhRfkevqjzYhY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-RJjQbyStMxi_qRV_jp_6nQ-1; Thu, 06 Apr 2023 04:31:00 -0400
X-MC-Unique: RJjQbyStMxi_qRV_jp_6nQ-1
Received: by mail-qv1-f71.google.com with SMTP id w2-20020a0cc242000000b00583d8e55181so17594405qvh.23
        for <alex.bennee@linaro.org>; Thu, 06 Apr 2023 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680769860;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
        b=u1haODVLqEsnD5bO7fY9YAE+zznyj229G6LoukvLAt9EW4zDHfPHmHZ/JeDvmshI6l
         LCVGWV6b07Y172//p7AjanH4SCY4289adReZZD7yb1biHGkhHkxY9XHsgqwB7GUPHCh8
         GYvthj47uj8qepRtafjNb+izNHfCnXyBsqYk8VstFlQ+NvnTa2L42+H63saEHz9JZ9e0
         bEqjw1lhkU9jS0iI9wwDPeiyszFnXY0gZS/mhVhsZi91AmzcLx1YAdaaRfEKFEogYQ0c
         WrEnUFIfdceI2RVpt6IbcFfkaSVD0qiHxsrIy+xL6ncpibmw27XLWz2Y0fIaL39HM9Of
         OuJg==
X-Gm-Message-State: AAQBX9cZPx9h7D/iV2zD5tnoYbGxyiMpc3Oo8IsX+WeqKTiT15JW0Evg
	gFKuo9q3cU/yXEDRxIA6QJnvm4qxAuEV57Ny/0NQn4r6Wl2YmBmepIzzB6TvjKreWQSuUEOPAFJ
	VSqQNr0MYhz0SwHfw
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id h7-20020a05622a170700b003e393aed104mr10590513qtk.30.1680769859912;
        Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id h7-20020a05622a170700b003e393aed104mr10590489qtk.30.1680769859542;
        Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de. [109.43.178.193])
        by smtp.gmail.com with ESMTPSA id b125-20020ae9eb83000000b0071eddd3bebbsm306099qkg.81.2023.04.06.01.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Message-ID: <82060846-281f-8c30-6938-7ad35a8c5548@redhat.com>
Date: Thu, 6 Apr 2023 10:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
 <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
 <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
In-Reply-To: <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gLvwUFpVcKuS

On 06/04/2023 10.22, Philippe Mathieu-Daudé wrote:
> On 6/4/23 10:04, Janosch Frank wrote:
>> On 4/6/23 09:50, Thomas Huth wrote:
>>> On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
>>>> Protected Virtualization is specific to KVM.
>>>> Rename the file as 'pv-kvm.c' to make this clearer.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/s390x/{pv.c => pv-kvm.c} | 0
>>>>    hw/s390x/meson.build        | 2 +-
>>>>    2 files changed, 1 insertion(+), 1 deletion(-)
>>>>    rename hw/s390x/{pv.c => pv-kvm.c} (100%)
>>>>
>>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
>>>> similarity index 100%
>>>> rename from hw/s390x/pv.c
>>>> rename to hw/s390x/pv-kvm.c
>>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>>> index f291016fee..2f43b6c473 100644
>>>> --- a/hw/s390x/meson.build
>>>> +++ b/hw/s390x/meson.build
>>>> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>>      'tod-kvm.c',
>>>>      's390-skeys-kvm.c',
>>>>      's390-stattrib-kvm.c',
>>>> -  'pv.c',
>>>> +  'pv-kvm.c',
>>>>      's390-pci-kvm.c',
>>>>    ))
>>>>    s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>
>>> Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?
>>>
>>> Janosch, what's your opinion?
>>>
>>>    Thomas
>>>
>>>
>>
>> Don't care as long as the file is not deleted :)
> 
> I followed the current pattern:
> 
> $ ls -1 hw/s390x/*kvm*
> hw/s390x/s390-pci-kvm.c
> hw/s390x/s390-skeys-kvm.c
> hw/s390x/s390-stattrib-kvm.c
> hw/s390x/tod-kvm.c

There's a differences for those: First, these devices have an implementation 
that works with TCG, too. Second, protected virtualization (pv) is not a 
real hardware device, it's a feature of the firmware on s390x that is 
exposed to userspace via the KVM interface. So target/s390x/kvm/ slightly 
sounds like a better place to me ... no strong opinion, though.

  Thomas
