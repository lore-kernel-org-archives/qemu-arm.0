Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp2369dll;
        Thu, 14 Nov 2024 10:12:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWzEKEj4FPCavvDl8T3ePrzXMROQ5GjJZbLciQUpmOeFtoMmllSTqKL8pXl53fVVxRgCWfrGFvqSy5lAg==@linaro.org
X-Google-Smtp-Source: AGHT+IFvbXNZ/5aeHshQtbXOfUeEpkcMqZEnNPUXxQVIldyCESmUulfb3J1FxNKUAKTZxQWNN2OU
X-Received: by 2002:a05:622a:a13:b0:461:6054:52c with SMTP id d75a77b69052e-46358f46910mr39016361cf.29.1731607946678;
        Thu, 14 Nov 2024 10:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731607946; cv=none;
        d=google.com; s=arc-20240605;
        b=RfLKyB3JPa57OTlrzHySlhc/rHAIFogjt2UBSIGTy2zRr6WLZEHTnhLfeOhS7wSvvc
         EgHR77NveRX20EPYtG0xk/aZffH2f8EUusqrMN3ViMGBDw5mkZQu0AAwlMe+B2UZVbN3
         6NvU3jarwcInu5yVW+OU8bBsROQnFy2mq1Gu6hrptrIHS8FYg4RXcE+PDWUYAbTTCy/j
         DZuwbaZHmR69Gi31mixnbBdElI2Rp2KCmFzAFp05tKdjiM66WiSYapDr9FUOEWpfgXrU
         /wFfhCOFgVzCM/jsw7BBFWIPJzxUPURQ1kn8RSqrf8E1d46utp8o8OSAq4m4auL+Jj4F
         KGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kyrNIdWJL/Zjb3SHq6P1iz2SKOYW7mBnEocbSBbuRAw=;
        fh=25tvXt7KraX+0kBSoT6dyoLI30dsHXR9iDfNCIXIvwQ=;
        b=VfkXyTn8SS+7Htp4Z06zMdbxtQiP82hjXa9xjWwz3A+N37wT51IxB+NhjkxFyao+uD
         O5LEvG2xe7Veje59DTVDytKOCK+2l2m7DU8/oMjjasO+8g44UBB8HPt5j6KKUSEk1TVQ
         GeNcnKvshrRVucMDsKzjQUHYkxH4cBdOGNJxKj1lLU6ZFCqMuVOGlN6fnUSdQE78S6Ft
         +obDiXRIMHJTk0NLId2Mrc++j7gdpaCjov2vPz7kW8QFqwCcPQ4XNwc80oQtkhHt74HY
         OvVWyLlwuxtDFxr5kXBCy7v2Q/FadpO8jt051WGdgXQjO9W3PjVJwKg/14T5bM6i223V
         PPNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W9kg1U0s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa97288si15549041cf.229.2024.11.14.10.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 10:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W9kg1U0s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBeK4-000246-J4; Thu, 14 Nov 2024 13:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeK1-0001va-Tn
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 13:12:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeJz-0004LG-8y
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 13:12:01 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20c767a9c50so10718735ad.1
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731607917; x=1732212717; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kyrNIdWJL/Zjb3SHq6P1iz2SKOYW7mBnEocbSBbuRAw=;
 b=W9kg1U0skZ2WnhSDA0CpdkXl5Xd6BsjrKvN+geli2Kxc9kU1iAY/71gX3q3ol77eUJ
 3alXOtDWmOXtLwP2RUaeH60NAbd5k4bHc5t/ZsNJPvmno9WMFUjgE+yCSB/zS3Si9h7V
 CWlmryUkQ6eFVNHUEMBeKKWFX1hhapz+z6m9z+TekUJvuZAC6J4CjozzNAeDSXNcsObK
 qwxbFiPZKlMcgpgoyMOyJrKTtAUFypn4GCKyJ5u840U2fupWODVQZwRvCvW5H6F5vqs1
 gr3q2LZ1gmxrLY2Vqr3K0PS2DhmYoTKcALLJ5SpkIZFOFuoO7ll+ku5qaRse65x7I2ab
 Ll1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731607917; x=1732212717;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kyrNIdWJL/Zjb3SHq6P1iz2SKOYW7mBnEocbSBbuRAw=;
 b=rL3tB1IsHVBrkQjCHqsgM8N8+EOUWMWoEWlc4aHM6PRaw8UMecnjf70L+1SABd4Knc
 r3nhAat67KH0MncgvBy1vKknIIB0Jb9OAzc/83oVS93rx2tfedmImdnNxsMnMHwxcUwH
 8Ypa0oVQ0LUZM3XwztBvDknNZ94U9XXUOqf1TAqumA7STjDyX11dBX8cqgaPKlw38fmh
 h1sfQ4gOyXM4AwlVNZhxjLv082eekzoIO97SaRfQVUrNq81ablcQ27cZ8UBdgaE7sgwR
 ECcl2bnM6xEFvn5B8qofKuXc1YmpykdvAGOTgcvMFGiuAMUrj+NSbVhB4jHYc2Q/TGzq
 +oZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUenuBKPaCQi8MlTtA9xRl8Nb1WiZhKxFLrzcF19OPhbPsDFaTzwauajLJiDoBnhgrXgSRtnMJFnMJK@nongnu.org
X-Gm-Message-State: AOJu0Yw1zHWna1bGDtbPdhoZxIcYpK6kEErO2Yyi8e3ETh3JCCn5VmkM
 Q7E5CByFse+MeUhYT0BaoaB8cHN58AL//pmDJp2uKPYw0Pb9vpZOnaFQLxyJg5Y=
X-Received: by 2002:a17:903:1788:b0:20c:ce9c:bbb0 with SMTP id
 d9443c01a7336-211c43a6624mr42529485ad.0.1731607917647; 
 Thu, 14 Nov 2024 10:11:57 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7d1dfa1sm13614185ad.215.2024.11.14.10.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:11:57 -0800 (PST)
Message-ID: <85ecf123-0d3a-4d00-a961-afd6f8681608@linaro.org>
Date: Thu, 14 Nov 2024 10:11:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h'
 header
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-2-philmd@linaro.org>
 <e2792708-d2d1-4d13-8b43-103cabdb279e@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e2792708-d2d1-4d13-8b43-103cabdb279e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UparmZjQOj6Y

On 11/14/24 00:29, Thomas Huth wrote:
> On 14/11/2024 02.12, Philippe Mathieu-Daudé wrote:
>> TARGET_PAGE_BITS is defined in "exec/cpu-defs.h".
> 
> Actually, it's rather defined in cpu-param.h, but that header gets included from cpu- 
> defs.h, so the patch is fine. But maybe adjust the commit message to avoid confusion?

+1.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
