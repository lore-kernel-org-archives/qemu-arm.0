Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3289018lft;
        Mon, 4 Jul 2022 08:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPiA/pWMrYZ+H//p6YsiivxJmQih+vLn51xPSz7UCAHDfXxY5S6APQUvyssXRXzWXdQVXo
X-Received: by 2002:ac8:5884:0:b0:31d:36a9:b946 with SMTP id t4-20020ac85884000000b0031d36a9b946mr14628999qta.636.1656946920117;
        Mon, 04 Jul 2022 08:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656946920; cv=none;
        d=google.com; s=arc-20160816;
        b=kGd49fT633LfXZpBjCmyGSQdzhaNlOF+e4ZbignKT4wXWmyIEx2EUPT4A4ApX0biew
         i/6/WrNedQfUeW3bNVE9WbiozvHQV1uSBti3q7mn45h0aBqS05XzDEDJ3xeyXXGuMMKy
         SHcCJ5HXT7YHy3qilVNOMNV2yHlLgLVnGaxOZEcRSVY1ELsGzOTk41pkNIyFa1kDELFf
         fG8Q3pKr27AMiuynV+iks+2dyIc9IDAfvZllyy9imP+2OkjXXkPjD9V5DoQydWNGUYT7
         FW31qBIYJ4GtXJsvNMXyJNf37Ju8uCKJf7Kux9AMvM+EYA1R07ccldk1QSBTVR5ZjNWu
         P6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AT3uIpCfQBKhJIUnzcoq8PZHFPauEZWMl9qtzo1S/UQ=;
        b=UffNvEiRrZ3bgl+9HDqFDYSJvtbYNyzkLwE/FuO0iHkqCjt/Ul6i1D7kdha44izpF0
         iRG7Xd/PsOJARcv+FZGBznjGI1mdEAXSgNaD/UP48xarUYV5NBHU0CjgF9RMkEujt1Sx
         S00iYu6ni2YO6o4B8n8OEQxG+wyPbJd7SLMCuGW8baOxN04lpz4RFVJy/9hisugbL3tQ
         pU7FUwMPZl8p7BowLVimwegnbgTCAK8HqgRuJfLPjRCgDcUhedCcDFqiG/Cf2ggrpMds
         ORBQbco8zidlPKW5V7YY7s1WZfgiMr/6Ih+3OYRt05xIKysZOKR6OsElg/ZvvXM0QG7K
         k9SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpIgDNR8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020a67d795000000b003545cb70302si7116632vsj.371.2022.07.04.08.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 08:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpIgDNR8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8NaJ-0007EP-D6
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 11:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8NX7-0003PO-1f
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:58:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8NX3-0004KD-8B
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:58:40 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so5764664pjo.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AT3uIpCfQBKhJIUnzcoq8PZHFPauEZWMl9qtzo1S/UQ=;
 b=xpIgDNR8aQHqq3vR8PPd0d75cUgFgv6YPf2FXYpkOcnw3PKhuNNsPgVW65q+rmo2J+
 vBq2XFNOxVyu2zzCjliLqD2nw5h+opqSuLfxiZ1+hYAxb0homWPJuwoqW9DsJBYsGmBK
 aYzKbO7p7Hy/P4ZQk7DP3WM1lL2cw/9KvxONJqMxfh37LVtv4mLPh7qQ1BdpD6kcKlqv
 8AeUifAMxLiqLTv62OYwV+9EZCHlXHLlXQqIYG4tTU6p/7bF8nxVGQ2ODQLAvsIW5IFa
 qjDACqsKBlLL9xWaPY/bypu2zF8gwd3cScdoyW9up+e5ISeYqMVz/RIpGY9+vPx1csH7
 NdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AT3uIpCfQBKhJIUnzcoq8PZHFPauEZWMl9qtzo1S/UQ=;
 b=PmTHtmFAh+5Kcdjx8PFwsgeiue/t2+Tqk60IVoCiyPJYP4ggAcE2LtW/RKoz9kTuIv
 xehRUdPC9QMJF5RF771g60PyySxoByMhjUW/hgihIw+0+CiquU+khmQR1+5JaV8Jgen1
 pPJyMbtQKToajvhTzV8Ysn7z22EVAlHgF7bCuaZljI9ybxzlTz822yVA9uD45U3dRRlk
 a7g+gI+bBb/h0Equqb4PO9Gc5hUYF2wcIEmU4Qo0PjSH1UpV8LooS9KXNuWFh6Uh7qVR
 6FGO/TXGD8HqDk+lNfQZNfJHpIinf29r3p1jkl1CCgKhtOIUUxyes+8b+Sk2yuZZ1Z4o
 SFrw==
X-Gm-Message-State: AJIora/U7apF4E3TgOX1bA4Dfrcf8Hv+1cbrR8FvyPKO9a6eyn+b0q2A
 uSEdZjPCimx9roDBxYJtokTUWQ==
X-Received: by 2002:a17:903:248:b0:168:cf03:eefe with SMTP id
 j8-20020a170903024800b00168cf03eefemr35461764plh.124.1656946714697; 
 Mon, 04 Jul 2022 07:58:34 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 e7-20020aa79807000000b0052845174ef6sm3696028pfl.118.2022.07.04.07.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:58:34 -0700 (PDT)
Message-ID: <6bad14a8-a6dd-4bbe-7808-d51e6c3f777b@linaro.org>
Date: Mon, 4 Jul 2022 20:28:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1rlNldRwugO

On 7/4/22 20:24, Peter Maydell wrote:
>> Previously, we had A-profile allocate separate mmu_idx for secure
>> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
>> when SCR_EL3.NS is changed.  I did not see how we could reasonably
>> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
>> Trusted Firmware, at the code paths used to change between Secure
>> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
>> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
>> to keep them live at the same time within qemu.
> 
> Is there no SMC/interrupt/etc at all which is handled as a "just do the
> thing at EL3" without dropping down to secure EL2/EL1 ?

I'm sure there is, but it's only swapping between S EL[012] and NS EL[012] that concerned 
me.  Is there something that I'm missing?


r~
