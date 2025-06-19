Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3533088njc;
        Wed, 18 Jun 2025 17:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhrd/Wyc1UMuCYj+j4ku6uuAZAwyB6s/Hg4h24yjK4BP/tY9iQaCB+gSUWJzRxzigwQYBo0V7JoVl9TQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGBmKqh55I0nTRLuKhDas/W35DRQG9RT/Iyo7HUVQB7JauacuaUselQq5bG5/rctqV+Sw3g
X-Received: by 2002:ac8:57c2:0:b0:4a7:6839:d095 with SMTP id d75a77b69052e-4a76839da43mr52543581cf.3.1750292393299;
        Wed, 18 Jun 2025 17:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750292393; cv=none;
        d=google.com; s=arc-20240605;
        b=BpmawaxaD6j8K9eiU90RlxJ6lHQlPFzB8VM0LnWildaNhO3sgqGQeZlFsN0Rh7JBKo
         ADlYtm8KeSVmLbl70f7lqtfzvxKID0Erh8UMksh6uhnADxDZrJVulsAx1UH9r6LG4sAO
         3mwnPMXD9BSH4vfiwC7rwz6o+7vOcYsNhInKzIec9yCpxMBfKphMYZPIfbQl22Ew2hpA
         siUFnbR1WvBGcH2QEp3SAAmEUoxRG0D5NJ153MyNRpznaGJ10i6qCNagVUAHYl1zHvu8
         oV2snQOlaDIcBSALQnefqheozDfBe4LHRqTTeYXJ5LRtcpJhh3PkY/B8VWFR1y+7kZ4K
         TV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0ioIL4mlGLuVtD9rvtFpJNNDDnS0C6VPMIJP/hs2SPY=;
        fh=vDFZv2XFdQpWVtPwI/Fb394Zxf/O9WsfSExcdSgGNFE=;
        b=KBwYqlQMFcw+PAtNAaknLd7wPNazAtCZAh0gzdeynBynf/wdvPm+TUnBJbbdE5jUI8
         xyFG9Y/1zYYw1ci3EfH/YtORCviWLPZN9HTksse+tKy0mmHkDKhybFXC/NOtzMqWZFBH
         l3gw6CxrGR5HkM9cw0hGIxHbuhrq6q6uM+uX9IOThzgQjc7F8xW6th5MwkXN9QfSrRHH
         QgHi7ZAWhJdZAupurQez7CSPYbSixR1Gszz1PCygKMs6dQx3xTlh+JYtxgU0dEghlcgv
         hlyea+Vc9+iFPXv+B1EHKHhq+sKnJFrZvRF77V88HbFaNr56pzRCz7LBWRZTAB7BbEas
         7xgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zsehog5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a552cd1si160121071cf.657.2025.06.18.17.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 17:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zsehog5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uS300-0001RU-QB; Wed, 18 Jun 2025 20:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uS2zw-0001Ql-9Z
 for qemu-arm@nongnu.org; Wed, 18 Jun 2025 20:19:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uS2zu-00077W-E4
 for qemu-arm@nongnu.org; Wed, 18 Jun 2025 20:19:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-234b440afa7so3028925ad.0
 for <qemu-arm@nongnu.org>; Wed, 18 Jun 2025 17:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750292356; x=1750897156; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ioIL4mlGLuVtD9rvtFpJNNDDnS0C6VPMIJP/hs2SPY=;
 b=zsehog5QwW8yIB8tOp9KZn6obPAirKne149iqvUvKpkLteiJj6WVhbfltcXU7gMzEn
 h8H/R9y2Og78L/5uE5/tFICljSqptJps8V4oQGlCOotZDeRHmnZx1ecWwMnkop7k5EB0
 ZY0wq5sR9+O0HZTbe3W84UWCVM0WhFoymCZF6PEU3tn5mV4p9M9F2OeAjwezVXoPLSHc
 +dc4Ki1nX0VD6Ch/EpYlaaAi5vmbQHheRgdbwvCEprRHMouq2xo7DnKvw+7Lgzo8DJRt
 7Kwcjw7OZMhgV8K1YxjxMXNMY8PWATgBsmOZJILIaD3vd6HVjYf40L1LbH5ictBkqQzZ
 KCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750292356; x=1750897156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ioIL4mlGLuVtD9rvtFpJNNDDnS0C6VPMIJP/hs2SPY=;
 b=aW9avvUQudNv6HTmcd0y1A3dJD0DKSvCO91rsyIzNQ9SwrWlrYE91+3+H5895s+iuL
 Q+7axsQREadcdfVvMQQK1MLrCyfKxkFh1LdyKD49UkzcfQIJg3VretO+u6Z+Toa2jcsz
 EaTDTiMOsM+nsTnP+XSrM8ZrVHoRJfBzpW1gNIrHhbE0DrabOVp56l9QAS/CYRVC/+15
 Y2daffVYKMns+i7LLBAqdC7dDbKOyi3No4U9CWp4TwFwItlGgPTif8VPJDrenpd2T+ho
 rkOWj4UKPuH6wQdetfdZXMNqNRURKiQV3YUSTADBJJXe+czir7gzDffwdZSoEle79Nt3
 4VWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwOsWkBWSK4TGKzfOBqjx1wE304bb1VWGtV3+vzzU3dotbAcbnukXO8Xx2g3YL3AQCxWFrMk8BFQ==@nongnu.org
X-Gm-Message-State: AOJu0YyhCNiaw0znzzsmfBoP54XoBdKTs22VltyGndVsSsKO5jDYaz/3
 M7RVV7j2wX9NzAKbbWFEIxCgoGF+miBOgJ5oLv3GqGGjeNkIbRZtbCGVkUjby46Ox+g=
X-Gm-Gg: ASbGncvamiR86GGnZY4Qa3YsO1rNo32MgY7LA043jNOOvNLV59/SikkKW60IBuDB3sk
 4dsDeBzhoy3gldPYW03dwtEwaoLaaTt+YqzWB1Bt87lRhMqKmVA5azurim8k8w5zu2qG4enBMkb
 s5Jo3cx5SAW3lf6LUaSmh11T6NzmIuYeK8716xe2eW/8shKzPaa7DMWe4QpTEAsKLxX6IhyVO2V
 fzAr/yQahJOOcJX6PIaed3n4omzC3ohmbci6FGwQjjUhCYZ5YybB9cg0w5SzIwta1UvLl4jr/Kt
 qM+ZKGutDX0aoDl3TSQLfZKzq6oS+qULDd1oWcp6kTYjhyqxNk9GwOjgHLqQ27F5HF9cDsu3DVY
 =
X-Received: by 2002:a17:902:c94e:b0:234:8a16:d62b with SMTP id
 d9443c01a7336-2366b34ed67mr326418275ad.12.1750292356076; 
 Wed, 18 Jun 2025 17:19:16 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea7d98sm107649265ad.151.2025.06.18.17.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 17:19:15 -0700 (PDT)
Message-ID: <630d1dd3-410c-4693-89b5-554a171557ba@linaro.org>
Date: Wed, 18 Jun 2025 17:19:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: The current implementation status of ARM Secure SMMU in QEMU
To: GanDalf LeBron <lebrongandalf@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Mostafa Saleh <smostafa@google.com>
References: <CA+V5jYUjqDc-UWKvQrX24c+MKtm+zdx4YCWU036180A4rX4ybQ@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CA+V5jYUjqDc-UWKvQrX24c+MKtm+zdx4YCWU036180A4rX4ybQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: PWxy90neeEJO

Hi Gandalf,

On 5/7/25 8:39 AM, GanDalf LeBron wrote:
> 
> Hi there!
> 
> I am writing to inquire about the current implementation status of 
> Secure SMMU features in QEMU.
> 
> I understand that non-secure SMMU emulation for general peripheral DMA 
> (IOVA to PA translation and protection managed by the Normal World) is 
> well-established in QEMU. However, my current understanding is that 
> specific *Secure SMMU* functionality—where the SMMU's configuration and 
> page tables are managed by Secure World software (e.g., at *Secure EL2)* 
> to protect DMA for secure peripherals or confidential VMs—may not yet be 
> fully implemented.
> 
> Could you please confirm or clarify this? Specifically, I'm interested 
> in whether QEMU supports management of SMMU page tables and 
> configurations by software running in Secure EL2?
> 
> Any pointers to existing support, relevant discussions, patches, or 
> roadmap information regarding Secure SMMU capabilities would be greatly 
> appreciated.
> 
> Thank you for your time and efforts.
> 
> LeBronGanDalf
> 

I guess you are referring to SMMUv3.2-SecEL2. It is indeed not yet 
implemented, as only SMMU v3.1 is supported at this moment.

At Linaro, we are working on device assignment emulation (for Arm CCA), 
and this feature will be needed, but there is no specific roadmap at the 
moment.
 From the discussion I had with Mostafa, who worked on smmu emulation, 
this will not be trivial, as we need to duplicate the state of SMMU, 
which is not covered by existing design.

If this is an option, I was informed that the device assignment for 
confidential VM is working fine under FVP model, but I didn't try it myself.

Regards,
Pierrick
