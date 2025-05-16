Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2320764njb;
        Thu, 15 May 2025 22:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmSa1sIFtSq6cWWEBi7+IXztX9ab7C7a+GVhOPxuKDzukqWeAgXsBfOFSvJqp8gPYlQmmrh/2ydUVW4w==@linaro.org
X-Google-Smtp-Source: AGHT+IE/NOU4YyuK29BrvdxdrHD9eIOivt5zYc6jf78vQQIbcGyC8EBMv3e7tsJc65uogGuzjzxw
X-Received: by 2002:ac8:5e14:0:b0:494:6f03:3746 with SMTP id d75a77b69052e-494a0c7b014mr81343711cf.9.1747373347157;
        Thu, 15 May 2025 22:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747373347; cv=none;
        d=google.com; s=arc-20240605;
        b=E40Jq3ujElr7gZaEoJAAe+rTV7hjpH79vv0YdtgRjU0WWJYnOSEmndPyNaElp7JZmh
         EaIaMkMsU4QMicP30PB9+LreCOwOlcWGHar9Rjxz4tmU/ineVcE+sC2Xanq5dyeyrJYA
         9l3ikpSeZ3g5DFaMAZljS8aGsbvgNN03zqaFgZclzKW9TRvjkHDov7o+16F5D+GkGVFl
         wt+YRFTGHcAKxzg58Uyz3ucLJuhY3AHtkDa+ElFGAoRFRsVdD4qR73fPHtnx5s/8IeEA
         hem9w0TP0dfT8zlGuYuY6Q2v3ofJGZVVpqPCMtkFTeyt+NNUofMdyCOOlrBo86khyxq4
         ywRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0vZXAWGTdmcCiYm91a24aahiWHhOHG8aHh1fzG/CfWI=;
        fh=x+0MQ/059M17ng9LFMHP5fgWavcEjhZLwtEFb2kLhEA=;
        b=AG8+rHS1unk9UBTm0SGw4XdD85WA6FNKgOVHbSB27havUrvV50UVYYe25AauU+EuSX
         gnkJewoeUFrk4NxiA9ddqMXEybBE9bx3VDSrIjEISyar/JUb1J85srcQuROLKqqvsxTa
         1itboZZju6UxwUSnmx1eUhdTDkF/MJiqw6Dg1V8BjbD6RC7jZCI+0ggbB5Co+6YcFzfW
         weBzqiXJfDttgxoaZDK6VuCsux0Czhgknf0Nw2jClilG8F+xdpK80e0IPNaJg4CMnjB3
         ydCePDzb35RwjO1CARyRMZz1dWWf54uI8XaeG9UmBkhesRYV7BW9zTk1RyPVhBvvv/9m
         jeSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qlg/2HGX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae5aa087si12534361cf.627.2025.05.15.22.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 22:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qlg/2HGX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFncy-0002BB-IT; Fri, 16 May 2025 01:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFncv-00025g-Sq
 for qemu-arm@nongnu.org; Fri, 16 May 2025 01:28:58 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFnct-0001Rh-Sk
 for qemu-arm@nongnu.org; Fri, 16 May 2025 01:28:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22e09f57ed4so30761105ad.0
 for <qemu-arm@nongnu.org>; Thu, 15 May 2025 22:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747373334; x=1747978134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0vZXAWGTdmcCiYm91a24aahiWHhOHG8aHh1fzG/CfWI=;
 b=Qlg/2HGXgd6InG9ueoGd1ZUW1GVJa3KzDxAAJwl8qmT1nsriv0qPUV3xyVfXlc797m
 4aaULw+Ymc139IvhUlkzQFddMxGz3qlSlJpTzFjM5O4mf9vUCJb7N0qhE7uXxZXFtkCT
 UxUXrS0iDWG8ycBvJv4cRGfTpSZ4zvMkcNi7oUdAGvOr8JVOeYwhLUe1RRduH7dJeYu4
 4USYZ3jUH0FXlQQ4JW3aR4X3qATA10ov/A64div0ikcUBzz7EHczrTBzeUl2IBNo+aah
 3YsDCkvpG7C5HAjPBLKAJ/+Q33KicC7AZqY0sIk0gPSP/wCBdk/xY9hpwLA7VF1gg6/K
 553g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747373334; x=1747978134;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0vZXAWGTdmcCiYm91a24aahiWHhOHG8aHh1fzG/CfWI=;
 b=Zo4vHdlI562YzZmwdAMFffp6bWC0pmhQ9vDoCqf5+8tjk7FN3vxFezrUAYSE95cvNM
 +T1iuKDEYI9Zoh1VAbFi3cl6dviohxj1tp9HqT+iFanx1HoGk1M+1EU8mWnQaCCQNZ7C
 wgEWShKD7vxsJPOoF6FzaKUki2FdBZb/cQc9JedQDEcifyl0NKrtA9H2XoHssKjg1dFT
 nfGjjleo7Sji9vP5hZvzi7zJSzxpuOVbdw4A1a4Y/rW1vD8fr6ESMcDpw5O6ZafDJqYN
 Ht1zKZnxt0K3q42hbEJ+Ws362BG/w7J1DP/fctjkF8tAymnYqcAhi+CNWQOjPrnCM1r1
 1DEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJBLpB+UBGYRQBjTAnDgaJpGpA24+4EKrbHqMj2Ws+D9tgTfJMyBbm59n30zbCDCDYvwnXfFXZyg==@nongnu.org
X-Gm-Message-State: AOJu0YzYs8yg7OOPkNlUg0IGa5e7yuKgVBb/BYsk6AsGWO737BUFODnV
 HCXKqiqkvKjo6pxKshZm0GxKZKOpWRJAlrYWw00Ca/LyWV2QOzT9xVICjVRR701hrswzI2K4bW5
 FY9Xc
X-Gm-Gg: ASbGncsUYlK6JHjz9kBWCPKpus7PTRHUVlIwdtv3j/tSIrT8E7WBKo1PF6lgidLGFV5
 ADGs7YdZQnrMsExdy/Bgta4AOciThaQYvicpabfWhjWuTq/HwDRh2/ajjEeJyE/35g/UZm5pXvw
 NJBJR2mnsMHA2fdDV+apkUZGHJY+9lLG1ZdpkDn5JkL+Z1yemB8jSe6egkhp9zBBz0KuZwIYMnV
 KYpagY9KQC/TOjN9z1u7UkmJjHvh8SPD/JaW3xNl4ptqSQISScxPRTaosDxsdg5G61cejQzZe+L
 IUYdCJfXgn3Aa+/6QJhjvO52nM3N95jfeDR354ElO2elU8cRVoBhtG20nqjUMurV
X-Received: by 2002:a17:902:f68f:b0:224:3994:8a8c with SMTP id
 d9443c01a7336-231b3959febmr87205085ad.8.1747373334309; 
 Thu, 15 May 2025 22:28:54 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4edb0d0sm6511775ad.254.2025.05.15.22.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 22:28:53 -0700 (PDT)
Message-ID: <63e18089-44df-411e-b413-be0cacebb74d@linaro.org>
Date: Thu, 15 May 2025 22:28:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meson.build: Compile hw_common_arch_libs files with
 right header include paths
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>
References: <20250513115637.184940-1-thuth@redhat.com>
 <d1bf2e99-7320-4a20-a5cb-2e7ce70036b8@linaro.org>
 <1a89a793-1db7-4b3e-926f-fbd390d2f714@linaro.org>
In-Reply-To: <1a89a793-1db7-4b3e-926f-fbd390d2f714@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: rYqQpjZzLSDG

On 5/15/25 5:35 PM, Pierrick Bouvier wrote:
> On 5/13/25 4:20 PM, Pierrick Bouvier wrote:
>> Hi Thomas,
>>
>> On 5/13/25 4:56 AM, Thomas Huth wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> Since commit 6f4e8a92bbd ("hw/arm: make most of the compilation units
>>> common"), compilation of some arm machines (like musicpal) fails on
>>> certain host systems like OpenBSD 7.6/7.7 since headers like <epoxy/gl.h>
>>> don't reside in /usr/include and we currently don't add the right
>>> CFLAGS for the common files to include the additional header search
>>> paths. Add a loop similar to what we already did in commit 727bb5b477e6
>>> to fix it.
>>>
>>> With this fix applied, we can now also drop the explicit dependency
>>> on pixman for the arm musicpal machine.
>>>
>>> Fixes: 6f4e8a92bbd ("hw/arm: make most of the compilation units common")
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> [thuth: Add commit message + changes in hw/arm/meson.build]
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>     v2: Change the subject of the patch according to Paolo's suggestion
>>>
>>>     meson.build        | 27 ++++++++++++++++-----------
>>>     hw/arm/meson.build |  2 +-
>>>     2 files changed, 17 insertions(+), 12 deletions(-)
>>
>>
>> Thanks for the patch.
>> I didn't run into any issue when building for {linux, macos, windows,
>> freebsd}, so I assumed it was safe to do things this way and specific
>> dependencies could just be listed with associated sources.
>> It seems like there are cracks in this approach, so adding all the
>> dependencies per base arch is a good idea.
>>
>> Any chance you could base it on this commit [1] (and add it for new
>> libraries as well)?
>>
>> This is going to be pulled very shortly (as part of a wider series), and
>> the same fix will be needed.
>   > [1] 20250512180502.2395029-4-pierrick.bouvier@linaro.org
>>
> 
> [1] was merged.
> I'm working on a series integrating your work, and doing further
> cleanups on meson side, so you can leave it for now.
> 

Posted here:
https://lore.kernel.org/qemu-devel/20250516052708.930928-1-pierrick.bouvier@linaro.org

Regards,
Pierrick
