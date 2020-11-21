Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2289151lfb;
        Sat, 21 Nov 2020 09:09:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+ikSEhVFkRd1+OllRq30o9nlOVN+/0g1o3bRAphSo+7+B2mX34CX3z7kOGY9U9pOiSj/2
X-Received: by 2002:a25:a381:: with SMTP id e1mr12092951ybi.119.1605978591180;
        Sat, 21 Nov 2020 09:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605978591; cv=none;
        d=google.com; s=arc-20160816;
        b=mxrJfK9s13E66tso7shT/qOYz2bKQQJsQA1JKC1JJZ6M7SVZHT9zB6NA3cg0zEMbPN
         hL6GRzD6+dctE+hNW78Bgp6kx/VCcs8+ZheJ6JB7ggkDB8R9HvFxh4Ln8wy1b7w2J3Ye
         WHEYPKEpEmo8/Hbc9cq5h1dMaqlTzdk2c9VXkIIu+gUMpSqX0JWtvkAH+n6yh2im17TS
         GxoDZLzXQ9cPhhIUH4yT6AMemj3Smnji497mHfWHMBlChL6X8dU7lyPNIC5Vm3uY6AoU
         hufAd4NZASGOaETq6dU4TOBgBsR5zknJ0d+IMsTvZ7cX8Fr6AyKQqzdN6Vo8I9+JroLV
         oGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wbOlb+cY9Zc0n9Qtzvz1MvimAqm2rJv7ijzeCcV3nMo=;
        b=rx2OkrmOb0R/x4g12mD+8IwxYVP9SA17DtMQJb6LGeu3aWHLkRKwgIU9jN5KnKJ+M8
         eZqawuYrROP/KrwgEBx/y65Cn92MlxTKEkFsFGVA7UsY5yQBtW0+wI3lVHteeqcoXvab
         1yFzcLOrCzBUk3m3TyvqcqDKVgLlcYoUyn+ITp6+yFtCp2YpKYQRDlVtj3xcFQfYFghV
         cmIAdBJLylJOV249CFdc8EsAMBbxKmKOs54LHyd++QRobe9/GNay5a6/pa5wbXAhJ3Yo
         GmrcfzJ3ffYlb/wc7p8lWt2AK1Te+utFDntf3pek8h006m80dS5+2CXHntwS0Za0H8lI
         Gl6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHrK9Ja7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67si6354434ybc.47.2020.11.21.09.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Nov 2020 09:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHrK9Ja7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kgWOU-0004i1-Iy
	for alex.bennee@linaro.org; Sat, 21 Nov 2020 12:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgWOM-0004hl-HA
 for qemu-arm@nongnu.org; Sat, 21 Nov 2020 12:09:42 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgWOL-00007b-36
 for qemu-arm@nongnu.org; Sat, 21 Nov 2020 12:09:42 -0500
Received: by mail-pg1-x542.google.com with SMTP id f17so1700221pge.6
 for <qemu-arm@nongnu.org>; Sat, 21 Nov 2020 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wbOlb+cY9Zc0n9Qtzvz1MvimAqm2rJv7ijzeCcV3nMo=;
 b=MHrK9Ja7bzNzOFrvgS8TLtROkxZrzXCpANinlKYE0O66mxo4ofQ7T+Hpc7KRG5LGgF
 WTq3x06P9pf3SkUn1hNekGeEKSXpoQZxm/RT0mM7ML9DF7HdMWoOoMEdnvKzSkFdTqcx
 8rySNogz4zmh0+bpo2I5tIbn6Rd0acdaNrMA6t1m6dKoiRKPc0vkEKhCNk64q+3TFgFB
 q5frHPy0sMSf1pXDDdDKh46UanGTs6RnlkTVfx2Za5D7vRkY7OlMpaW0amXYE1FPI0th
 yb+ZEXKbHM8iVkICTH8MMxHQ47vb3SvbLdygTShxBK2VHln+sF+S+IMAk91tV7Bi4Zti
 8hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbOlb+cY9Zc0n9Qtzvz1MvimAqm2rJv7ijzeCcV3nMo=;
 b=uEhpn2rNZp1O0dhD3xWf1FEWa4CKDBWj4dOcZ1nvlrT2PjZ0ThC3jtfT1K56PgX+CB
 g6YYANS+0JwhuW8ZBzQLWbIfxV5TuuRzpxWKMnpn37urafxzFPHSmUmts1KviXMm3nvr
 4QuD4LKwf9WK2kM8km9KeaORq8QVpfa3tBqp/sd/BYe1LTIJOrdgLcJRY57VwbUow4G+
 ysefTgfixTCzJeobRKMcDm8XdP/LcJKxAf5/iyq9OOcXv9fzyHrxAC9SS+DLwUa9S1uW
 z2z2bijA41CBgDsuKG2vIInH6M+2SNe6KRegDb9sukZ+2W/tkNbLcWbKLcNodF1MjEK3
 ftvw==
X-Gm-Message-State: AOAM533yhKahnBpbU/BQRnqn7933YvUuIRXYYNyHWVxoZY8T55UfaJex
 VH6Pb91LrrqqAXx/Anv5PxR3Mw==
X-Received: by 2002:a17:90b:190c:: with SMTP id
 mp12mr16118797pjb.14.1605978578824; 
 Sat, 21 Nov 2020 09:09:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w66sm8427837pff.171.2020.11.21.09.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 09:09:37 -0800 (PST)
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
References: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
Date: Sat, 21 Nov 2020 09:09:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaoX0A7ZGr3v

On 11/20/20 6:17 AM, Marcin Juszkiewicz wrote:
> +static const char *valid_cpus[] = {

const char * const

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
