Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp239713njb;
        Thu, 8 May 2025 00:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/9OL+XHWpwgUuFt5goSNn4zmTkEaskH8wlQCehAWbh6MXOXs4GJ3zz+FBO3Trzl+tjYWQVX1eo0nhjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGwRS1tvbWRjBuJ6EEa1QVkgzmrSTn22KuiLHCfjBtFnPLVGbjbSckDIFvX14VmZVGB0BAe
X-Received: by 2002:a05:6214:dae:b0:6eb:1c23:63c3 with SMTP id 6a1803df08f44-6f54b891708mr41522346d6.0.1746688528742;
        Thu, 08 May 2025 00:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746688528; cv=none;
        d=google.com; s=arc-20240605;
        b=K6338GTMM03+4+CDFWIpIEFKMf0iISBFDPdq7M3qblIa1SlThqps433Rh064Adq2s1
         zdgQVMLYjMJR2KgZHiq6TFMqJvQxyCQXDOMgUofuyFAFcwEomfRNE0X3mKs8GKQ5/1FN
         5USGmuUT/vPR9SntdP1fUK+8tjO+ZU9BXyUeUgzhvnF2xj/oQRz5mQHx4xLh65grRyoV
         JFXKeDjMuAdSPq5gbbcA/f9O45k1peofDXUtoJOMJz2pLoMZ4Nn1jlaU4dC+PRBGUiPO
         kgQsye8DuFer+LDWGQQL1GUV+VoKqaJ1BgWFgs9WBXgE9NOreuIaCKp3mzM7K617T8MV
         to6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DY2BsFM/3DBKgU4gKEpYF7v/eZG1r/5Fy8FJcoo0eTI=;
        fh=AzG6QSJssOvFmbLeXOGw+/AodWaNQkZ0XpUh+HDq7Hw=;
        b=WtlQ3kT1R+zTgMBLDT3DVhd/PFT0uJqEC4z1xElajGU195giMsRPjljn7pA9NVvcn7
         eEn69MSOBZtWGzSpnhTPnw9HJa59x0EfDe+7YGK4LUwebVP5/q8+QJYcIHLPA0hjTYRD
         PGC89LFwvqWv+Cz8jvJqtutYSspQU26V56qaQJtDwn873iC5Vu4CilePQgJGfoEQNIFM
         W9aCW+6lOGH4zM0gMF4Bax5hOe3nUlWkkLdL/6dB6s7bIexsrIbqdqLYexHIGQRUZG2M
         T5hwJCFMPomHT/kKLEI8z1jB4q7V16iOGqi9J8BPmGjFFkPymeTUXLrEaqR4CcO3TdJ4
         58Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAAWj+cR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf752a2f1si385450085a.138.2025.05.08.00.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 00:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAAWj+cR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCvTA-0004zN-LR; Thu, 08 May 2025 03:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCvT8-0004ya-LN
 for qemu-arm@nongnu.org; Thu, 08 May 2025 03:14:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCvT6-000774-Vp
 for qemu-arm@nongnu.org; Thu, 08 May 2025 03:14:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-30a9cd61159so666130a91.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746688495; x=1747293295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DY2BsFM/3DBKgU4gKEpYF7v/eZG1r/5Fy8FJcoo0eTI=;
 b=QAAWj+cRbSP5NPDyEjYqyJM4TVkVTH30lTuhVPVsNaIYFhIFK/IKP8LlhlbZsAzZcn
 BNrzYdFwJ6NhK4SeQkwpXsOv9U806EHLviG3guVISpTkojoeSu+NAwlAdJEn4oUxrzfq
 3G5T2uZZypVj7wK5+WVU4f6c/G0yfkTGYCUWezIeaYGHxb207xuF9FJjSAEOPbTjuYCT
 ATgVsswrKrqC4XW0WHjI5RkCl+TY2uqjVPusEJO4h44ZcumI8K2oFXkgcnPcn4b3l7fs
 Ao+eebpllIzs/aAW+g5ZO4uB/kbOlEe/Zxq+12LPYBlDHSen8DD6zj1MWrBtcARBjRin
 b4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746688495; x=1747293295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DY2BsFM/3DBKgU4gKEpYF7v/eZG1r/5Fy8FJcoo0eTI=;
 b=ePYpeKChO8af6fhwow4Vw8JfBBvJK9SOztoOnUStNWrLemGdrw3TXoGOE2yEVfGNnx
 9mz4XAyTQuI72OCynhynhTY3rDqecWVXonSQUsBiJO2T/FDHDRqyJugDKan5hLKhrWgL
 dEqmFJNmoEyjDG1ANAdLceW/grJFM5nNslZcSOBDLRFR5YytFd8aKEDgQxrvdcylZgMC
 gRt0T4ujmDG3RBh85Tggvch1wkO79Kdzl6LtU34OzgZ7O3mBFHQSPBxuQdRvkhb0c2y3
 P/gqd5tpwQoHps2/yxAcUZiSwTjDybJtrRm6l4PZmdxg4qR80Wy620SE9lHym+ERXkEP
 zrYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEzxaKA76jlttiHW3q9ppFlOlhJaCRt/W+HB1DuPO6cAnJiVWEoxA0q/wdgL+4WY6jnnKytmu4TQ==@nongnu.org
X-Gm-Message-State: AOJu0YyM5xwsjK8oJp70E2IQ1mRdAu/c0pFGnvbEg2L+3ciYJJQ59GNt
 MloIgD7CKlHJgdK9HSGbbmuZyENvqS5ISW8QMKrSdhirJcGWDfJ7aECbUOCCeMA=
X-Gm-Gg: ASbGncsYZSAaA8mu4DZu8+afQpyS2U/LArEm7GKF9b1NHa87Wh0clNXH4ecX64+jx52
 AEZ83g7sSoahNLDC41y7Ctb0UwxTRxvlBkhJSHrh2L3Yj1G2Xq5ZzbXw6aYcjrfG7AM8fMWDOxs
 mFjqEKjh+3LD3DfO9XLpcJBfIT8JoozH6QwXvGdOlN4b76ucFpuDZ7spoEsbhuZ7W+N6LjNAIUq
 ERsXpA+z3tCBEmShgMLx7AEIJS3I2NgUoAmmxuj4qPL20Fs9SZh3xwydZcRWtoGiPt3e++NF2Vv
 gPA6sWH3hial4+KdZBNlqMjBqMBM0mvBS0IXeg7OQByEaYgUrXr6v82r/lILNaw2etDyyYSYtUR
 rSWpp4nAV
X-Received: by 2002:a17:90b:2b4d:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-30adbf1163emr3634786a91.7.1746688494934; 
 Thu, 08 May 2025 00:14:54 -0700 (PDT)
Received: from [192.168.69.243] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad39d66b8sm1487673a91.0.2025.05.08.00.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 00:14:54 -0700 (PDT)
Message-ID: <8a5893be-7217-4c58-838c-01370db5d6bf@linaro.org>
Date: Thu, 8 May 2025 09:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/imx_i2c: Always set interrupt status bit if
 interrupt condition occurs
To: corey@minyard.net, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250507124040.425773-1-shentey@gmail.com>
 <aBtavpDt1yfoavj7@mail.minyard.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aBtavpDt1yfoavj7@mail.minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philmd@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: 7hY22KXfhE6m

On 7/5/25 15:06, Corey Minyard wrote:
> On Wed, May 07, 2025 at 02:40:40PM +0200, Bernhard Beschow wrote:
>> According to the i.MX 8M Plus reference manual, the status flag I2C_I2SR[IIF]
>> continues to be set when an interrupt condition occurs even when I2C interrupts
>> are disabled (I2C_I2CR[IIEN] is clear). However, the device model only sets the
>> flag when I2C interrupts are enabled which causes U-Boot to loop forever. Fix
>> the device model by always setting the flag and let I2C_I2CR[IIEN] guard I2C
>> interrupts only.
>>
>> Also remove the comment in the code since it merely stated the obvious and would
>> be outdated now.
> 
> This looks good to me.  I can give you an:
> 
> Acked-by: Corey Minyard <cminyard@mvista.com>
> 
> or I can take it into my tree.

I have to respin my hw-misc PR so I'll squeeze this.

Thanks!

Phil.
