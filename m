Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3138890lfb;
        Sun, 12 Sep 2021 14:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf3dgcrdza41UPXvcRsAw+GzJ+ki1JukZT5VVciLFvkGYb5641h92W8Je7k8xKs4NXwk5u
X-Received: by 2002:a92:130a:: with SMTP id 10mr5459714ilt.186.1631482851433;
        Sun, 12 Sep 2021 14:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631482851; cv=none;
        d=google.com; s=arc-20160816;
        b=ipzh8a5awJlfR2MSKNZqGj0B90mWdtDP2CpltTXesqYvUsobliXgv4Nfu/sTsEuOVP
         A9S8ZcZXrNJ4BOPHL0bHIy6Av9SxCqhig7yQRJbGH8+3Up9ntJq5F7kQlXC+dRcco6Go
         zYSCJ+iIbJlcaPzM0qC/42PbzVm54g22qMgelRGun7nA4PwIEJC3EW6DXmNFhKD6JCLN
         vC4NWyLzho/5i9xk+Ws1FXIiKpum7gpgtUZCdnDuQCzIeRu3wL2+FPKWbPTH9oaMDBsT
         CMRKlRmzVO46a9l2L0nDWJ/nuebavJ0REs4qm/87vOzSF+xF6Z/b4Cyc1q0E8dMmjQY5
         PKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Gs/rr619HA/mLlpz+21h2yiWM58yXjlYbARG0zCdf0Q=;
        b=IZxqrAa38JwpSlfHuB3l+XbttDmWeiGm8PB+aho6D5bwjDGRv+O9qLPMxFDejp9+Si
         pBKIhc7+g89nZJAUGw1OFVfl8ctqTIo20k3nnp1iHAAYc3+2Q1JkSg3TuzdnserDo5wt
         P63M4mnN/5yQX+JIjW2v3kYH02cI53GDbZrjAAjNWG3O6nR/+veCwMisDSLkBsjG0PLR
         1CSKi3Ckh28OgTNgSqLBzbu/LHHjW4CFJZUoIVdKdgJmI7lSOviU56/MY1lwGVTB6yFU
         CHT48Ju0yFAciwqIP7o9n2cOLRmUOWYbCtkSpCHm0rR0soAOOPi+6U2mgyuMaYwVpx3g
         9pEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zKWZe0EV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si5216814ilj.16.2021.09.12.14.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 14:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zKWZe0EV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPXDW-00005d-RA
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 17:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXDK-0008Uj-Su
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 17:40:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXDI-00042D-1q
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 17:40:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k24so7517029pgh.8
 for <qemu-arm@nongnu.org>; Sun, 12 Sep 2021 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gs/rr619HA/mLlpz+21h2yiWM58yXjlYbARG0zCdf0Q=;
 b=zKWZe0EVP7wra+rbqFVUwO5cSNMFDjnjtdnTRQDL4psF66ZWo/y1feq7pnZea8dbdh
 haOpUNAhkFAL+r8pQtyPmBLmCCYEwT39uizMHM0EE8TBKGnD1TIlcDJYiG+hfqb0vJjL
 3FMalbZCgTVI0aRn3lJkDh/FeVS1wXByIm3kYgGWhOIEPaySWCRoHtwoYi2kv7xnLOVI
 P3EjMSoiX0Gal1/QnTCRn3rM7UW7I0WNPBg14iqiaFFdKD2a1+QCBqPz0Miw58rHRUXN
 7kv3vtWhzq33yCXUrqeDaMsV9fISveG6dl7duhbPCbfAgjiRh94WihDgCydQOtTRy+XQ
 RJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gs/rr619HA/mLlpz+21h2yiWM58yXjlYbARG0zCdf0Q=;
 b=tBiICHe8fz3I6FW366v+xQQs4E1ee1rqlqScgnDDUKj4RDjQBdVzvtrd/Cc3GxiGh9
 YqlYbHp40gzgCLo7FQEugytbn6l79L17dozM+Y0RMtFL1UJJdj1EpmKNUBScnfVICVdZ
 JD/f/IVuTw9ypr2AntBAkPM5R4aAQkPQ1o1Um5x1J8Eq4+xdt6IRnjPzuvxu9KOfeKfN
 wB+fKO3YaYXTNqaAptr8WK2ndrvhD3IHy8XgUzrG2yVLwtzB3N1rMiZes9Wmakn7HeRP
 ToJVn1x+vVmzU1gtiMTovAXMzAs6Z4Ufv/Ht08iJq8Xc+xgHnExmljA8oYPqHugL2jKZ
 PruA==
X-Gm-Message-State: AOAM531E4aTz0EeYyUzXT13zKSFw9MH+eu5h1F/xEHGJaw0cggUArRMV
 bQX7b9/icxoaAoEOvpCyI/yP6Zg8nKacUQ==
X-Received: by 2002:aa7:8014:0:b029:3cd:b6f3:5dd6 with SMTP id
 j20-20020aa780140000b02903cdb6f35dd6mr8231971pfi.39.1631482833839; 
 Sun, 12 Sep 2021 14:40:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h13sm5344626pgf.14.2021.09.12.14.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:40:33 -0700 (PDT)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
 <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
 <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e0879b6-23c0-8f14-fd96-4d72f1d640c1@linaro.org>
Date: Sun, 12 Sep 2021 14:40:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ql7sTHyxbr/H

On 9/12/21 2:37 PM, Alexander Graf wrote:
> 
> On 12.09.21 23:20, Richard Henderson wrote:
>> On 9/12/21 1:36 PM, Alexander Graf wrote:
>>>> I think the callsites would be clearer if you made the function
>>>> return true for "PSCI call handled", false for "not recognised,
>>>> give the guest an UNDEF". Code like
>>>>            if (hvf_handle_psci_call(cpu)) {
>>>>                stuff;
>>>>            }
>>>>
>>>> looks like the 'stuff' is for the "psci call handled" case,
>>>> which at the moment it isn't.
>>>
>>>
>>> This function merely follows standard C semantics along the lines of "0
>>> means success, !0 is error". Isn't that what you would usually expect?
>>
>> No, not really.  I expect stuff that returns error codes to return
>> negative integers on failure.  I expect stuff that returns a boolean
>> success/failure to return true on success.
> 
> 
> Fair, I'll change it to return -1 then. Thanks!

Not quite the point I was making.  If the only two return values are -1/0, then bool 
false/true is in fact more appropriate.


r~
