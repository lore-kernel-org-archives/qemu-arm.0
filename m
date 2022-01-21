Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp339233lfk;
        Fri, 21 Jan 2022 15:44:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf7oZTNGNsb4OW9qSKC3RVjxtzZ3pmUpVWwIlyNWH7XGztaJDoXP7OSJYHLxPEdx7Ob3nz
X-Received: by 2002:a25:b747:: with SMTP id e7mr9306023ybm.38.1642808699565;
        Fri, 21 Jan 2022 15:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642808699; cv=none;
        d=google.com; s=arc-20160816;
        b=lzXdmb1TItDpa9dJlmxgSbPT5L6e419GXdMCsMwYvwFdmlpYR6JJjdbP+Bcnb0Rekt
         9FhjJzD31gO6WcrYnWRbj+sTp0ihj731LrXcbLi7fki9t3e1mYkIxrXb6AL9QMQE8WBl
         mYWbQhog2i+bKVwMqOtPUk3nsd0xlNkec4fT47E2hE4apO6cNYbCvqifSg75kxNosfcM
         8DAEtOIa8sSV4OhEzppTqvZh9z6HGB9t7CUZN16R1nNydwwks+9vU8pWVfBdSM24Zlug
         AMJDerHtI0bPeZDwCspKcJc+UaNZzuK3XKkPhIkVTpsnifZr+SD2s6IuderatDPpozUb
         JfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1qE6iy7Mfl4Pc2W1cHzdtWYBwybt8reM0xmG+mSC7aE=;
        b=i3Sfm+4MOdVtsi8EHG4oVmtBIPlNH/DfiFpOD9iBwibCjjHriXSpJdGwSowX6/tG3D
         7Y93gfidK31SaUIIYwTsUl2rOT+wLO1+lHijg0JMSKs+YJ1yCRLNVMWdJJty1rxAosR2
         rX9TdAiXeqtQA35wFnam06mQPllmjS711n+56zXcL9PJizpnmAGLuVDJhGs1VdmTho1g
         zSmf/pvBfJu85aK6ZxbgJw1HaRpdX4BujjI6GpEqv1WZb1aH6c65hkRatGZ2q2BT28mU
         s58NGRtGIGcNWrcwe6VRe3eFXIiJBfDn9ccsrdnAHriuIy30HJ0O2TzmaLaGFV+qmqct
         ij4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mWY2QxQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d191si7459776ybh.285.2022.01.21.15.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jan 2022 15:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mWY2QxQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nB3aU-0000dX-PB
	for alex.bennee@linaro.org; Fri, 21 Jan 2022 18:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3aD-0000dE-43; Fri, 21 Jan 2022 18:44:41 -0500
Received: from [2607:f8b0:4864:20::634] (port=46820
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3a9-0006yM-FQ; Fri, 21 Jan 2022 18:44:40 -0500
Received: by mail-pl1-x634.google.com with SMTP id u11so10059534plh.13;
 Fri, 21 Jan 2022 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1qE6iy7Mfl4Pc2W1cHzdtWYBwybt8reM0xmG+mSC7aE=;
 b=mWY2QxQMW+lQRf6ZVWfOGme6AooQcxN3PIbycwp8fc+DFSmsw2GE6b5beA4dVTwtSp
 bUXo9XsyYjq7dufmshcPrd0Kycym6TTNVmvLGEcdewgg2hTRTXVgoYyU7vOeZfUktPaY
 +738ltJFmLZcjCiVXvoq9SJMu3ssevXiB6+NjYz9D0qEQaP1zcuAY/yGoE2R5H2WaFej
 D+E9BWOlM10lu169VwQS8RmXuDcEpmi6y3NMX1T8ZtRSwSFNRiejLLalnYYueoUiQoqX
 nyWFEqHd7hrS12SBQ3m1xVsEZ2kBJ/V9lXpHgjZEtQuDzz5UJgJdOJjBG09KgfMCcTaE
 ndiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1qE6iy7Mfl4Pc2W1cHzdtWYBwybt8reM0xmG+mSC7aE=;
 b=SuP0hvnFY5OcolpMkPiHTYiQB0SvHV3GBC3+IDBQajiCbcL6ZZ8pcHlHvuf+y0wcrC
 Zn71U1RXxdLttwIj8KgMam+Sxk5+x4AB7AOXb44fbZmZAnpf7RABV/x56P5Q3fjwTldi
 RnmaWZ1XLmoIpd20HSIg0z+4Q6rn3U+gzYwE7mOS+1RohQEoKA2fuLCqWGamqlzpSK6e
 xpUZS4r/jhlNnRGhBgTjCLw0AAZ3kvMgbvggjNnbpjNJ7+rhkOjiXxINFjB0zfl2ZD7K
 cPU4I4D7gmoZVn8CvmiI8H/gMwHVIHalk3tQP4wgvm+fFnNUWQU0DVYodKdcCl14JxPk
 rCjg==
X-Gm-Message-State: AOAM531XDcngy3CrOlEWn/Iz/lBOp5aN7FjlkrKE4QSi2/9a6kAXM5Vb
 hPkH6F5y4renthABeQjpJMo=
X-Received: by 2002:a17:903:124c:b0:149:b16d:917e with SMTP id
 u12-20020a170903124c00b00149b16d917emr5789536plh.91.1642808673085; 
 Fri, 21 Jan 2022 15:44:33 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id pj6sm13289617pjb.21.2022.01.21.15.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 15:44:32 -0800 (PST)
Message-ID: <818baf3c-6ac2-4e64-6fa0-dbf77bdad67a@amsat.org>
Date: Sat, 22 Jan 2022 00:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/armv7m: Fix broken VMStateDescription
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220120151609.433555-1-peter.maydell@linaro.org>
In-Reply-To: <20220120151609.433555-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: Wky/JwyaP0+E

On 20/1/22 16:16, Peter Maydell wrote:
> In commit d5093d961585f02 we added a VMStateDescription to
> the TYPE_ARMV7M object, to handle migration of its Clocks.
> However a cut-and-paste error meant we used the wrong struct
> name in the VMSTATE_CLOCK() macro arguments. The result was
> that attempting a 'savevm' might result in an assertion
> failure.
> 
> Cc: qemu-stable@nongnu.org
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
> Fixes: d5093d961585f02
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> It's a shame there's no way to type-check that the struct
> name used in the VMSTATE macros is correct...
> ---
>   hw/arm/armv7m.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
