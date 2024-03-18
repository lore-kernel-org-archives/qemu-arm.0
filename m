Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp762071ejb;
        Mon, 18 Mar 2024 09:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIwmuE8wplRt0e7a0uuN19p/aUfcbpwT0E9y/Idx1agjEYmtIzPFJbPOiWjny+GXhvhuhJBvY/KbbnV/rPHQWOfqr+1lhD
X-Google-Smtp-Source: AGHT+IFS8jQq4xL848VfBhWhifE29THH7yMeBseVcd002g1PRiz76+DaFVKRAibBIJ/T5CR39jv9
X-Received: by 2002:a05:620a:4917:b0:788:1652:b192 with SMTP id vy23-20020a05620a491700b007881652b192mr12017428qkn.25.1710779748799;
        Mon, 18 Mar 2024 09:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710779748; cv=none;
        d=google.com; s=arc-20160816;
        b=yrOECHcRHC6cLIUjz4Ged2xPMOZt9niQgcYBgTP81L67/dkUbrZOFRnXi+pt45xO6q
         F+hdu4dSW5Pw1x7wXhPtcYP/JAqGUE3ur5RGJVfZgMfjL42WEs1/bHvsADWMwsCLBqT5
         Pqb4bUbtkxoA1uUPTEGsRkO3kzz0ddoF/xI+Id2lYd4jvcRkA8vrmtgqHpSqbhCgmLNX
         /gaPCBvnnuW6uMtuwdRHdBRRK9qSdhH3w9ASeWB0lsOn47kZZ5f//qdvHoYDLe+2cqI7
         jtFJkfjSAH5MkWqf32vHeYYuuScktDAeXPSl4uU394fcn9xq5kG8nUxx+wj7EeKC61bx
         H3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VWxrXzjZ+6wi5AGBZhXYkgtdBUbxMT0Pmi1L1yNtdSk=;
        fh=bgmYMUw5B4MaPYabpxEXX5nTG2QkSDUoIUsKf4LV2h0=;
        b=jv0ejikQR3pipogyq5l+ouBSZvB5kUqE+zvADfypQCamODeH/USNqqS63junPhBJZs
         p+/o2iBQjm3KGZ+m84E4BqdzdYTPI/bn6MVTd5J9TZw/WIv32H92J0JlRumdqwQBzRhl
         b3AVEjQ4z1jvRvQWaJOhQvLhFG4TkI/p1ksXdaGN2x7MGr3wJ1tHOg+UL2CTDg20Y1Yw
         LJ7nX4Gp1feFR3ct0VPswugiGfE0IuCW+ckF0dLJY6yUqTwQy7v8MNkbYhmBEANB/np9
         nfsm69lsN9q/teAfe3pJtEEUS62Op27r1cfsa2hxqsuDCkdV5FYVmdJ1me0UBZRCdx6/
         aXQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whx4cfc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi7-20020a05620a318700b00789e99d58cdsi6772662qkb.501.2024.03.18.09.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 09:35:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whx4cfc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmFxb-0007x8-N4; Mon, 18 Mar 2024 12:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFxa-0007wQ-JX
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:35:38 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFxZ-0008PK-2S
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:35:38 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-513dd2d2415so3105390e87.3
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710779735; x=1711384535; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VWxrXzjZ+6wi5AGBZhXYkgtdBUbxMT0Pmi1L1yNtdSk=;
 b=Whx4cfc8JpBh1JbJtHqmtMUa/AoJy2NPwNF45rgPYY6YYx8zKjuz+u4ayFJrxeQges
 tDVS1lg+X8Nl+B4h4EtEEcGOmxheXg3Sw1hF2oChz3L/Dwjvz+R4gTccPjI5a39DMIOs
 mh1R2IM06JFIaX7By3nxxzjbBUhAGwToK+taE6N3Uq7Qt5FdhEK8WB9l7uun1N2MjTgl
 q76NhiXr/u9PYXymNfUYUEeA7jDJtBi2H6KxBiWwhL+Sn55QCaG3Ora+y2sWvH9HP9++
 yVnzw33FPRwdugJzeb02GVjJ425fFbhq/aZreXrXO3OAdZqdwYhoBQN93dpBHQm7XkFT
 x7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710779735; x=1711384535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWxrXzjZ+6wi5AGBZhXYkgtdBUbxMT0Pmi1L1yNtdSk=;
 b=dH0fgCADEWdROxjXcZIMB1IbKddVfNGU2srm3jw9ZYutq5zBjzMtGAR2O6abABzWbI
 BKkm5NdyQX9cpq9NUxAfkSqxaaqamnG9tlBxftx3T5m3Spioivzi5/shYVlR8Aw1QSIg
 isRJ96Wi5+dthhYh1PZ6xu94NAeE3AN7Kva63XcRXJKdfxSeioRl4AC+WqWpQExbC0vR
 +1Z1xXtnJHWsMPhv8SADD7SNw/MGZxoZ0HBRMJBQndt6d7q1woN9tFaCYoKexZksfTE+
 yUrGeS976uqcuOnPi1nL692oqFoIjR4DT13FM77nSOQ0NJJkIbICjNvhImragH7VTQ6V
 C7oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDcHeMZ90MjFLUwLy6Sm121+RbstP4l23iDiZmXO9B7S6yx5ONG2lENjPdmnw+xhXjB1XYBP7LrtT2XUVbcWI11PVp
X-Gm-Message-State: AOJu0YytOW+udbuofUHUxW+NkcaTFNgHc3kRuwveObzgbAz9c76/gT2s
 xZs6suZWWlNZTvYeYaU+w5AkgqPx/rAEU1gJym+bU5o/NGcmGo40xcw+oi75GN4=
X-Received: by 2002:ac2:4db7:0:b0:513:d0e2:8a1e with SMTP id
 h23-20020ac24db7000000b00513d0e28a1emr7768732lfe.54.1710779734988; 
 Mon, 18 Mar 2024 09:35:34 -0700 (PDT)
Received: from [192.168.69.100] (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 bg28-20020a05600c3c9c00b0041330d49604sm18520814wmb.45.2024.03.18.09.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:35:34 -0700 (PDT)
Message-ID: <7fdd2a28-a9d3-4462-a688-0199d4dc96cf@linaro.org>
Date: Mon, 18 Mar 2024 17:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] tests/avocado: sbsa-ref: add Alpine tests for misc
 'max' setup
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
 <20240318-sbsa-ref-firmware-update-v3-3-1c33b995a538@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-3-1c33b995a538@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lzPtbqnQZef0

On 18/3/24 15:08, Marcin Juszkiewicz wrote:
> PAuth makes run timeout on CI so add tests using 'max' without it
> and with impdef one.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 259225f15f..cf8954d02e 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -140,18 +140,36 @@ def boot_alpine_linux(self, cpu):
>       def test_sbsaref_alpine_linux_cortex_a57(self):
>           """
>           :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=os:linux
>           """
>           self.boot_alpine_linux("cortex-a57")
>   
>       def test_sbsaref_alpine_linux_neoverse_n1(self):
>           """
>           :avocado: tags=cpu:neoverse-n1
> +        :avocado: tags=os:linux
>           """
>           self.boot_alpine_linux("neoverse-n1")
>   
> +    def test_sbsaref_alpine_linux_max_pauth_off(self):
> +        """
> +        :avocado: tags=cpu:max
> +        :avocado: tags=os:linux
> +        """
> +        self.boot_alpine_linux("max,pauth=off")
> +
> +    def test_sbsaref_alpine_linux_max_pauth_impdef(self):
> +        """
> +        :avocado: tags=cpu:max
> +        :avocado: tags=os:linux
> +        """
> +        self.boot_alpine_linux("max,pauth-impdef=on")
> +
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

Odd, this tag doesn't seem processed in my test. Anyhow,

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       def test_sbsaref_alpine_linux_max(self):
>           """
>           :avocado: tags=cpu:max
> +        :avocado: tags=os:linux
>           """
>           self.boot_alpine_linux("max")
>   
> 

