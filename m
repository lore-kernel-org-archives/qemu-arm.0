Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3014424ejb;
        Mon, 20 Feb 2023 23:32:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+Bn4OrUkRdYx2HnIaptdMqoDaxKE/oTfLtUWv3yWT34lr8CcNocqhOlsqGHaH7JFzVZ/WL
X-Received: by 2002:a05:622a:1046:b0:3bf:a501:678f with SMTP id f6-20020a05622a104600b003bfa501678fmr532698qte.27.1676964773803;
        Mon, 20 Feb 2023 23:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676964773; cv=none;
        d=google.com; s=arc-20160816;
        b=EA7tMRZFHvCYOxe1YYXvZNGv7vtAYaa4/ar0VIDCJVFw6wrhBKAOIHNDUHcOCSqDAE
         O7RqXGyz/mgrULfc/0i9GpFc68WVRPF/hV45FOTYxf4HH/gtC3b2wIFSbzrvyImmJbxM
         xPYUnsy4TkZXn5CFUDjcRjUwiLTyQAwoGtWZml2HV4HAsvMlZoOxTYkBDSmv586sNcel
         R0/4LhjkDXWB2D2tGUUwrEk2IbbD1AKNO58geKP9bnFIE+T/6MWy2JHc3+7Ui3J38+yb
         qdeWkUbsHOgI4S+DWkmKhWIllz/tD5viauP6wulCkex/5mDw/IBmNGEEC8ysCc+uYo7N
         7ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XgSGtZbh2k1KwRIHkfuUtZPlXezV7+nPmyuan0+JkYo=;
        b=cGjijZqYe7LhFRySrAYhynz5V0eGiNfFHbqfh9z3HNMdK3HDugdHY35usq6QpY5Bzn
         jp2gOeKCP+N5SLNkb3RIvzBZrcDD3GN55HgWw+aECbapa318ItH4KjTlfUhJhhZaP25R
         urCPk1bwfZoQQ6HSrPmugVAcErGAeyxFsRJc2ykje3sCL8IKGWQP/Wd6pTwaoCagZRQ6
         1z3utFFz3ATAq5Bv6yPk5m/byWHn96zL0Ix313ZTmkHnXg2rl5J6RLuy+JWw+/g+g8Ex
         3M68u3aHBCz6a2fR+EFgXq4DgoqN0Ntk5cXKDM6JmTkPulSHJsVIORm1PNBDVLT9OR0d
         aHcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QHKQ0kf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05622a045100b003b69dcd4f9asi11784555qtx.672.2023.02.20.23.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QHKQ0kf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUN8h-0004Ti-SY; Tue, 21 Feb 2023 02:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN8f-0004T9-1z
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:32:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN8d-0005iJ-9C
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:32:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id t15so3437271wrz.7
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XgSGtZbh2k1KwRIHkfuUtZPlXezV7+nPmyuan0+JkYo=;
 b=QHKQ0kf8JKmT/8yy/PAUtukX473core8pwXGllxAFMTlZa6YbmDa08qp4aMhWFJbGN
 fgxl8AxIAtDX/babEZLPdcqzDcK2dOa8zjzi4ft8dqXVvx5A2wNGy01F3FUjpENnw1ff
 VDEFJE4fHvAxIsTs5RLIa5LBz97Ssx05c0D7F4EZD62PEptEvOt0V+TB6wetIlgRHfG6
 qq/Bpkg9MGPbJ7o6f0Fy9kYkAxyx+9Au7SHrzcH6bWR6+6qH+aTFvxEfInvx0zyijySL
 /woTdCe+HKVLlAoP/FBldUAbhOV8yB8qNPYXoxLMIvp20MKAtbEhsLGXpUBwOCehFe9w
 LjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgSGtZbh2k1KwRIHkfuUtZPlXezV7+nPmyuan0+JkYo=;
 b=fn2ZB981na013AXmAOA+YXPvJdBFf5RnXVBy7c6/UOSnOAt6Ct4Xi72yvLpe6om/A4
 8JLoUWFtYyicpqCq6ejdtG+oxGCQ+7oBrIEfLYeP+kVN0LHDfctJzfrxPtILA5ER2QJY
 wkMfB8fw7lfdarNX15aKdsZX5S8vfnsHW8PDSxlZo4lUYUKoIvkWOMocY+Sxpcr/i04T
 cPK8Gm8ltHrhHWQuPIBEzdRPHpHveIq4OgE4E4Z+0DFfe7qaIm73PB6D0eaptVpckc+J
 B8pgYgDniDeSq3Q9zrFg33LgqF3ZFXO1zra/nGPW6B7Da5QNni1L0FQPrmM8HmXbA4E6
 IN8g==
X-Gm-Message-State: AO0yUKVu9zV7x3r7k3oxL2gMt8tnxFz+l3xbO1fJTQnA4myCb6k6Sx1G
 XQvOCRBJLkD1q82gsT/fvHQWLw==
X-Received: by 2002:a5d:5489:0:b0:2c6:d392:5579 with SMTP id
 h9-20020a5d5489000000b002c6d3925579mr2482110wrv.16.1676964753437; 
 Mon, 20 Feb 2023 23:32:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm3082787wmn.14.2023.02.20.23.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:32:33 -0800 (PST)
Message-ID: <d60bf2f2-99b9-cc14-513f-53e9a007c932@linaro.org>
Date: Tue, 21 Feb 2023 08:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: ZOFLvnkvDyfp

On 21/2/23 03:19, Richard Henderson wrote:
> The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
> go ahead and implement the other system registers as well.
> 
> Since there is significant overlap between the two, implement
> them with common code.  The only exception is the systemreg
> view of CONTROL, which merges the banked bits as per MRS.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Substatial rewrite using enumerator and shared code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h     |   2 +
>   target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 196 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

