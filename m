Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp982699lff;
        Sat, 7 Aug 2021 00:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLB6X+p6NCTeX9H5cZo28uaVSupjK0dRDRJ5k9RHQ7f6ucMg4/xrZt1dgC3BgCwYn73Y/u
X-Received: by 2002:a5d:9d93:: with SMTP id ay19mr573572iob.114.1628323195399;
        Sat, 07 Aug 2021 00:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628323195; cv=none;
        d=google.com; s=arc-20160816;
        b=pNXGd7CcwS17Z70ocaQm9eTklAtc9OW+7yP5yI4DXU/FLSDXA4GFzfqciqf5wcDjAA
         eLhxzwt/S6OmcGTIrKNwB8qBCPBG7DXG4UsIlF2tKxwLLeHPFJhpLSr1RrhtsJLZx+JR
         OEcLPQTXgzScQ9/ywft64eRWqCJSrXAoTF8IHh5+Qp/5N1DMraMoXml9Nu/KVMYdQSoe
         thziQ3mCKCbcKTYSru9jB9O0162dmO/T4K+F5y3EtIy95rwsckDFSSlNLcUOFt75ccNm
         pHnect27ECOkV2LUftDFQ9C+DlxsUk+vkUiHGVhM9Da2zRQCGCdc0PMl3hOQLHWWM0tt
         bZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QLiv8i5t0PRA2lFWUtHsI2WYPqf9Azi2kSZ1aVvvnDc=;
        b=JkKz34Ok+qQiV4BGYN8TcBwBhnmaVfSDRhIXgajxZ2ywkwXcGF7N8NE5v5VmWQLeFD
         Yb/xJ52kogJRmo7t3tnZ5dw9Zq7+tXCXQBEfo6b0jWi0QDRxjyeabuwxEmHvh4hzWjiF
         L/qZ2LvhbV75RNmsY3G/hinwfrZfYzNVRFl5NE8IRa+7C2GB/eqkvpLdJeyeux7VStak
         n5F7bdahpyRSdT/76j+N9n6jH208FdhsET2NvfHa3nVusnZ8x2oMTZhZhj46Gt4gUFBL
         Xqk2yCzCCtjdIJFyauVpJ4kOvIk1WT/GhIaqqv3Ahqkq2cSK16Gxj0I603E0nQX0bVFx
         hDxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LtUOeM9K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si11541116ilo.41.2021.08.07.00.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Aug 2021 00:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LtUOeM9K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mCHFK-0004SS-O2
	for alex.bennee@linaro.org; Sat, 07 Aug 2021 03:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHF9-0004SG-Q0; Sat, 07 Aug 2021 03:59:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHF8-0001yo-Be; Sat, 07 Aug 2021 03:59:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id h13so14075341wrp.1;
 Sat, 07 Aug 2021 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QLiv8i5t0PRA2lFWUtHsI2WYPqf9Azi2kSZ1aVvvnDc=;
 b=LtUOeM9K5Ul/gv3Z/Ao7rn1HRcRuxpbefjaBNk2JGTYQzDdK0/zU5fVLPDMdFnnm2r
 BTGOZpf3ds3XziH2m/PsHB71p5YLQ6fkpDTS6uWt4U2kLsIDP7elk1lgpBt05uYV7LHK
 bYLdbBkJAV49E4W6IqjKQz183DUThMuuVgWKV/uwRL5dMEJzTEbLW9IiLqVIdE4jeL4X
 rbVglor/CHAd0QJ+KbMRNhcJmNA8/mwZ40dgsbfWPHPdmB2gR9lz0mrGqF9RwJf4Smy5
 ZECTgtbBhv1Ka8r8v7v6PxLal7i5gFqUHE6APEHlSmv9q11U+1gZYYuqBbzmWkHAax3f
 rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QLiv8i5t0PRA2lFWUtHsI2WYPqf9Azi2kSZ1aVvvnDc=;
 b=Q5W5Z1elqylrxYxdgLp6UvFsfTkZqVdTYQGLtw1CFnwoiClzJwWq1lPRA1Ld2UuaY5
 x2HJccP9SQr4ziBRn1fGB2E/tZvOuKA9ppmSwKAkPJRRZ3YR8oy8TyMAndDb9pQ3VmcK
 yUpxFVq/YooAdmdLhAsEzIfJwMLh41tTJGNNyc/7DnItEaNZPKAh3/7yZf3WSV9jeffs
 4NicBdaCWiptYYzYEWfsbRD0omh+6NMKVJ/CtLFOIplys75SpHOP3mICxYdMBD50AIcK
 NPzjuISXb1ntUGGnjfwIm+gosNqM0hpj0Z8WiOqgHImay9BzpVSGC+LXfYuT1k1IcDcy
 G35w==
X-Gm-Message-State: AOAM531sU4FEf1japM0876PrNUKKbDApfqkFL3IWQ+kXB8KuT43yKm83
 bMuCQZXWrWpRS0XLu6Mh63E=
X-Received: by 2002:adf:d085:: with SMTP id y5mr14532341wrh.272.1628323180460; 
 Sat, 07 Aug 2021 00:59:40 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t17sm11833980wru.94.2021.08.07.00.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 00:59:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/12] npcm7xx_clk: Use DECLARE_INSTANCE_CHECKER
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-9-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e3a1c96-b85b-17e5-965f-e29405641809@amsat.org>
Date: Sat, 7 Aug 2021 09:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-9-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A0ntxHOmlapy

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Use DECLARE_INSTANCE_CHECKER instead of defining the
> NPCM7XX_CLOCK_PLL, NPCM7XX_CLOCK_SEL, and NPCM7XX_CLOCK_DIVIDER
> macros manually.
> 
> These changes had to be done manually because the codeconverter
> script isn't smart enough to figure out that the typedefs exist
> in a separate header.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/misc/npcm7xx_clk.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
