Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F5C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:28:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuUd-0007MU-RA; Fri, 01 Aug 2025 14:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uht2q-0006KF-Dx
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:56:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uht2o-00065F-Ce
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:55:47 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-24049d16515so10442845ad.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754067345; x=1754672145; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=igTYcD4woXv5oELF2muuSvmoerjndIGWZFTXS3apbbE=;
 b=NiJEhLkKF6v0p8Xf7bw1beyizu2qjcy1VEhnwA+qt/ckDflYJdZ3KIOlaedD569Vdf
 PsdGP9StVuQdIjbOBgCF9KwC9KkALD4B+EJrZQ2ouOEU0SQQgaA8BYvBR9+9mZddquyR
 G+R33NbicUELSv4xRAdD3ylWTGOB+x3fI4ms+7pocNYLbwXeO308vj5hQ2c+JerILV/g
 WLgfJoz+SOMKT9N2J3Oj7H+L2bFjT/w+b3WMFddwMP48nhec8vNbW036nZKLqPkgJc8s
 dJQlJGhQ9utS3/MMQ7tdx/lsnRgdDCOJrtVEejO7S05ZUPlmNJf0FNSnpVTuTnD926/d
 7LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754067345; x=1754672145;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igTYcD4woXv5oELF2muuSvmoerjndIGWZFTXS3apbbE=;
 b=oCG0nH3x1Lj9NcwZUnmPx2M5QtWZ2F1JVQ/4YJwGFQl/9GJZHpf3BLBr4GpJWLFP0l
 UOQQQUxL50VAhjueJUmX6zqRN1TWe89WC9Plgv/bQs4yqBLzgL4EhYv+2a96yDijESq6
 W5ai6Gplktv6w0jhS3LHiBo1fDO4ZFQ66x8e081Z1vDkR/2L1pB15ECBfmYZPBZEAKaW
 7E3YdVCVTR2RsXXaj20weR+fL81KQKiC2u7upwNuPc9+rU0YZ5A2ip4Mz5oJY1TURkCn
 quIQApX+b8Tr4lYRWX0rp0pHqUYnNMEXKR/nzfsQABE2QpMsttnTXlLacq5zTtpdlZi2
 A3mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUirGcM5zGkFk+5BfQ0XhnnGobXVbs+TKGYDJwrARQLYDZTq1LwvfQO4V82w2i0SzgKqGCZkUt+DA==@nongnu.org
X-Gm-Message-State: AOJu0Ywny/JAOe4PgaJY3YVx6LdQk61V4kmDEKtlAZ9GHceGWNfqDTeR
 +KHo1U4bEJL4Q1Q6jnw49cXe2K1plA7ArmcBZUUygW1drhYC6qJUlosbINhh3VSwxq0=
X-Gm-Gg: ASbGnct79ePGvf9fhS01jTKCC5JPo7R2M6AvuCjqSr/Oc07P0DmE4FJSFvtyc8Ctu3T
 P4kEgjYuY2ubEHjOjC0P02bhB/3maU9cBrInVbESxnFdnvxxQicdO0R7nUGv7L8jZ4lzVjUFBuO
 I5x89TIjvhzduUbR8VUW2pcDlcvuYwz42iJF2m9ru8JNA2BFc1dogUPpBJFN9k1zAquPJotdQ+f
 ARH4LR4enBSDqjobys/S8mvBcLQZZgdJoPCuWCMwOJ1s1km+XzRhv3CGTlnfcrUjd4qa/Gw6wKr
 xsedUrCgV50z/sVg5gCE5dyHGelTGgifPTy3Wm75PgAFI6Sxz3cSKR/qINBWFsnZkpEQ9gu6NdA
 ZY6Y5DcPZgoi5GqnZHtp1P+Xt3Im8eRG+Obg=
X-Google-Smtp-Source: AGHT+IHHuJKesoKdzmVk5LwNivEvdJnemizspWRhYNEW+opb27Da1DCPtPCHXg/Vdv1R02uztlvv1w==
X-Received: by 2002:a17:902:e84f:b0:240:58a7:8938 with SMTP id
 d9443c01a7336-24246f2e598mr2794735ad.7.1754067344664; 
 Fri, 01 Aug 2025 09:55:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaaf1bsm48291115ad.159.2025.08.01.09.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:55:44 -0700 (PDT)
Message-ID: <ea451ccf-1e18-4689-ab2b-89cb4b53d66d@linaro.org>
Date: Fri, 1 Aug 2025 09:55:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <CAFEAcA_9tkv1EoM33=G=zW6Pw0gBirvjs-SsDaC8ar8feyH_8g@mail.gmail.com>
 <2c337408-5caa-4e24-a8dd-d947203a1dc3@linaro.org>
 <CAFEAcA-LmS0dus5ZW6P+-VXkw=m4K3MaE6O+Qtj5i3H7ULJFFQ@mail.gmail.com>
 <cedc5b94-78e3-4d9a-bdd8-60c82673c136@linaro.org>
 <CAFEAcA8j7S6qVxmd8dairF=4kpn2=uBeFFxY22M5FgyTnjcJ+Q@mail.gmail.com>
 <cf097501-98b4-453e-9d89-e4af8d0e192a@linaro.org>
In-Reply-To: <cf097501-98b4-453e-9d89-e4af8d0e192a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/1/25 9:53 AM, Pierrick Bouvier wrote:
> On 8/1/25 9:44 AM, Peter Maydell wrote:
>> On Fri, 1 Aug 2025 at 17:41, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> On 8/1/25 9:37 AM, Peter Maydell wrote:
>>>> We do at least define the fields so you get a nice view of it:
>>>>
>>>> (gdb) print $cpsr
>>>> $4 = [ EL=0 BTYPE=0 Z ]
>>>>
>>>
>>> Do you have specific pretty printers installed? On my debian trixie (gdb
>>> 16.3), there is no pretty printer for cpsr by default.
>>
>> I'm not aware of having installed any. This is
>> GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git
>>
> 
> Trying with a ubuntu 24.04 container, I don't see it neither. Maybe
> something is missing in my gdbinit.
>

My fault, I was using my system wide qemu binary. Using master branch it 
works well indeed.

>> I was assuming that this was just plain gdb doing something
>> useful because the xml defines the field names and bitpositions
>> (at least if your QEMU has commit 63070ce368e1a where Manos
>> synced our xml to upstream gdb's to add these).
>>
>> -- PMM
> 


