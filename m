Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp506451eja;
        Sat, 27 Jan 2024 16:49:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUxaG+HpZYlcxNVuDX411ca4o5z0HMnKUoMHakb1WP0txGSwq4gkLKeHIZc1nYzOXi7YMK
X-Received: by 2002:ac8:5cc9:0:b0:42a:5194:60b with SMTP id s9-20020ac85cc9000000b0042a5194060bmr4281580qta.81.1706402982069;
        Sat, 27 Jan 2024 16:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706402982; cv=none;
        d=google.com; s=arc-20160816;
        b=g0pNJACt9O9/1dhtcxBm/+cApsYfGzWyNa5mn7CZxMo8AJylcv10fCPKDuuRcBr3pu
         vtShcAdZVzgrZlBhIdl6KZ4eMceFoSUIKk+E3/qHqihaccBMjX1SJgRVrEr72/O6v4cw
         Y1T4HnNMQaJq82BTVsGUzEDipDQr0laLJI84w/3E87WomM1YE42mrBEp6sve9sLsaPkS
         a3pIWf2ur3+J9g5s4eMtrMYU+gnXN6DNTrvU02ZI6I7MOcl51L5rnJ75KMINdshN8b5H
         4MRRB+PHy5eZ/VFn8sYO0tW+lG4Mtvn7ijlWepzoVQRXxYzfI8oVBlXC5aR8/j6XE1wl
         AeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/mO8ivv1PL2nQKZ8i4ZNMsyNV4+kRqs+/b+Ehz5bhXM=;
        fh=cQRfEpYtQ2OWXm32lwHQA/8Ey9aKL+vvRv75S/oyOqQ=;
        b=GqLmtROXVu5+bbVrnhYUPJ9mG4FunwpVPfuXoPAGxoreXwGspkkCd5x5mWLt4F3PzX
         oP8Zs1ro8fofCgbi4mW9FHg1uAE4OVTIlcIlbmUUi+zJxDDF7Dnwa+qYTZkXwri2YsIc
         M5PeqAs0oQ4S+2EqjPPfC0VRQyNLF1b+o4x8Yv4xj6wCLnoC7pKbDVcCu536M5igD6km
         OXAR12NZnIa79vg0x5iDxreRUTXZ0xw/PrdDYZF/XA/tUhC+7jGbLOwQYylvEzNr7lkp
         cEeN3VE8wJsKBOnHMSjSJ2i8WHqLiPeFJKlpfvV2ssE0ioUwIzBvQL1D/dE7zd1QG5Ii
         Q4Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AudYP2OX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05622a038600b0042a29b47d8csi4528070qtx.678.2024.01.27.16.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jan 2024 16:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AudYP2OX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTtMP-0006VN-36; Sat, 27 Jan 2024 19:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTtMN-0006Uy-M6
 for qemu-devel@nongnu.org; Sat, 27 Jan 2024 19:49:19 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTtML-0000Eh-QI
 for qemu-devel@nongnu.org; Sat, 27 Jan 2024 19:49:19 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-210dec2442eso915705fac.2
 for <qemu-devel@nongnu.org>; Sat, 27 Jan 2024 16:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706402956; x=1707007756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/mO8ivv1PL2nQKZ8i4ZNMsyNV4+kRqs+/b+Ehz5bhXM=;
 b=AudYP2OXAdSQqaNiZpx75ik0i9uYJFv7IImQ/c5K0i7ORzFt5Ws0zZ0PBWYdl0gFPf
 8DBKqzg4dA9RfGugTGmvQCaxMTRZJtE1sHTLgtQ0GLU0jt/4WldgPG+6Z7bwlX1misxa
 hrsRJ45NS5DRMPCpdRyz+IIkbFF9m2U02nive//uqrY7GZ6XyRPFG5VIPEmhCP3ReM/o
 kqhFIojfeXljcMqLGwC6eKGBWSEntvgp7FBsoM/PFauJSbgS+00q/cFjX99JmbYXf9Y8
 zUT0utLrdY7HFnPbCgLBN2J/wq6Ke++J5LnGVPrj+fpkZuK6TbgW7SOttGhRNC0GFjp/
 gHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706402956; x=1707007756;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/mO8ivv1PL2nQKZ8i4ZNMsyNV4+kRqs+/b+Ehz5bhXM=;
 b=T4YdpRfFLxi21m/r5+oNJxOKlIE4/M2gmhxp4+qGKsLkYGpN9GYdFkT0U1i+Cnpz4T
 JHnsvhOd7Ti3DF9DJXAkJG1l3MSDLu3s7Vw2vSlfqn5z6rE0lbEqlrGofeZSxM66mw9u
 sD1U+HTi2DhQEgNRrxuWp8WGMz9L+NL0FQlgllQhI9SBRV10BHpaya0ID83Xslu4+5u6
 DrVVz2viTuck2tnnCA7LDzH3IEnAMtfrQD9qyfVyOGprO4FV1kk5bhJyo8o6VHnBFV1k
 5C61hNFq12Z4D+ndMc15JQz52UATjE47oBrvlWINbU8Qsp3oiuQJsC7ZAEq98KBAvbN+
 PlkA==
X-Gm-Message-State: AOJu0YxXsdQoNmbOZFUkuIdPugLUl85iPMPKQ9XIifyQ+ZKss5RS8y1W
 7W6c+2V+QDScLVtPTePdRSfbgWWvvyQ7jTqryXFEbxO/i8Sy/OwStN0M7HQI0LvXu9+IXZkH+GZ
 Mk9Y=
X-Received: by 2002:a05:6870:6123:b0:214:cb4d:43df with SMTP id
 s35-20020a056870612300b00214cb4d43dfmr2568774oae.33.1706402956444; 
 Sat, 27 Jan 2024 16:49:16 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5c13:51aa:e666:7387?
 ([2001:44b8:2176:c800:5c13:51aa:e666:7387])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a63460c000000b005d24e5ae4e3sm3393046pga.2.2024.01.27.16.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jan 2024 16:49:16 -0800 (PST)
Message-ID: <340a5f2f-d5ec-4854-8776-6a25a39707f4@linaro.org>
Date: Sun, 28 Jan 2024 10:49:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix VNCR fault detection logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240116165605.2523055-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240116165605.2523055-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: b1X2Gw9n7H64

On 1/17/24 02:56, Peter Maydell wrote:
> In arm_deliver_fault() we check for whether the fault is caused
> by a data abort due to an access to a FEAT_NV2 sysreg in the
> memory pointed to by the VNCR. Unfortunately part of the
> condition checks the wrong argument to the function, meaning
> that it would spuriously trigger, resulting in some instruction
> aborts being taken to the wrong EL and reported incorrectly.
> 
> Use the right variable in the condition.
> 
> Fixes: 674e5345275d425 ("target/arm: Report VNCR_EL2 based faults correctly")
> Reported-by: Jonathan Cameron<Jonathan.Cameron@huawei.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> In less lax languages the compiler might have pointed out that
> the type of the LHS and the RHS in the comparison didn't match :-)
> ---
>   target/arm/tcg/tlb_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
