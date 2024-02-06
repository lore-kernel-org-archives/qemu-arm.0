Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1923866ejb;
        Tue, 6 Feb 2024 08:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWx0QRWk1Msi+397Rake+dtSVvOaz6AbgHTAdhxd1dVcMLqrHUvBOs1julw7Qpk6lN+EMSdogb+PJyICHiXhZvHt8PYXGTy
X-Google-Smtp-Source: AGHT+IHYxXp6KrO+aFfaJUzx2aAn24yGelfncjiNKqXpbBgV70hapeub241jXqc6fgvH6E+RfM60
X-Received: by 2002:ac8:594b:0:b0:42c:2a20:97e1 with SMTP id 11-20020ac8594b000000b0042c2a2097e1mr3256621qtz.13.1707237881429;
        Tue, 06 Feb 2024 08:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707237881; cv=none;
        d=google.com; s=arc-20160816;
        b=KoiQB8otSyjYcejYzOwY5fgoFM5b3Brms8ZgPXaaszrWlvroCm9UmQy5Ooujk5qd7F
         EWKu9Il2/tlMVrqNMDHy5siW4hhPfEEVS3L7Dxx2nigJk8i5gn3tCOQFYWX0Jv097y+B
         KXMsPJ7rduDC3d06NAh5Hw3EvcywN4ECOE6dXGG5uzBLhQ/IHOVQnrqCZIiqIt9pcMXh
         8qNjmIoK0TQJJUVp5UzRba0SLQY3CFwFef6bM59oA0/x4LKdEtCQWzpIp8DzuW4SRQeh
         A+Y4ZqaXqcHYhSCoqXBKbMrwcQ1cBAXWCV0lfqsqAaSwfoPVsfDw5Glh35TQGJlM5PTx
         vlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kmYhWOA87klpr9DBDCRadep4Zjk7/4AqwmEj7sc4Wyc=;
        fh=GTtraexJmouFO6oyFbIb/tMCfI+qsPOQ7XYpdfO4rUw=;
        b=iSH7PL0O4mgOVov+vZ6NtYE1A/anofkbIDYruw320YzolFYrPI8zrpj4QP/qsXYTVK
         avnKq+hJuze7VZAEDjdNhrZCpFps6mdLyKaIdy55YU0DkGF5SoYHTxKd4bFqdWk3ui3E
         lUCICrVbPPLsrvJIHfm82fArjMfvmmkn65xjJEQ8ZoQR9NUDhuw5Ut8vcxhGev3VTyiG
         VCWL2CD4349E+MzKSUqvNF128rRWcUmx/rWMBRUK6Ok6BVfTGvsFF8KCf3dawK08kJQD
         +wpdlN0/kZm/kryX6L584vGK2HItsOr+TMgJ7t4BOZS5/Iy/4geXuwQLlbSoBjHbhdKl
         PWUQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J+LOA/Mw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUrvsdSHJOcsaPXaOrYRaajDeQyEHR8if1JUlbwsFljiA+vFCA+KfIh6xiuFRJe5Y9Ql0n8EwY5bnEOP6AlXcsygoNogkBx
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a044800b0042c363ac44csi1605766qtx.678.2024.02.06.08.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J+LOA/Mw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOYd-00026z-5Z; Tue, 06 Feb 2024 11:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOYc-00026d-EI
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:44:26 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOYa-0005o5-Ri
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:44:26 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-510faac8c57so702011e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707237863; x=1707842663; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kmYhWOA87klpr9DBDCRadep4Zjk7/4AqwmEj7sc4Wyc=;
 b=J+LOA/MwpKpyZqV9whp0EuAlYq//87uoag1HjpdFzIptxdKFR71KTWNXmwMTtIGwao
 SdhCurqXx+xdSh3HAUUIhRtbnsnql3d9Ej1NiTjtU/oPuhWUR/tNWr60E4i9hQQlCGoj
 8gDxdZQM5dW3IxVkqpNeg3TUIhzxaqxvx6ZV6nrcyKHaXyqHkgusKSTgytSFDiUgg/Ug
 HFq0z1mS5vuo5nUmH0QcUy1YW9VNsLzAzgJSsm6lzrF8S9rpdL+bBUm/1CivoXyLQkk0
 uXqLsESRWDSW7zMMJS6SuedaqCKl4ZQ8upTvSm5zi1hP6/uXTyNcvEpZQFhv6KBXT1dX
 mUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707237863; x=1707842663;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kmYhWOA87klpr9DBDCRadep4Zjk7/4AqwmEj7sc4Wyc=;
 b=hC1NAV6Ssid5i7z/wrH1f19CPY2pYICrCMUDr9S8vsNGoWOCgMLlbIoUM2jJXwNJB/
 3mWH8afuZvVfTGC0ZSNLn+1UFJyHFVsaBfhXXZ5C5bgVG14J0SehWhVh8DGooreD1lNo
 qScyuXNQWqjBIJHbTMxflCw/E1dQGT1Eao0z5CO2OYeJS5g4GzXG5gN9p+P7YvqkLbij
 Kd6uMxm/bIconr1dYB1GV/sIfYY8uc5yhe02oKW4qEYKUlsz7BVnO73y/UmI4X5BtV/C
 0TsznXq457eUCoGlr0eEduEEDogQWr7JE7uHan9uCXsg0RzNX/JFZJbFJtyiNwjImYUc
 OeKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx6TuYg25WZ8YnjclaKKKVg6agf9S0b7jqaWn6o5gwtRH5qYw58JQjl9wrA/BT6ZmDL03MVWD40opr0dKVuD6EBIaI
X-Gm-Message-State: AOJu0YyHPMoJ16DkG7b10/rYXA7ortFf3HkgDhy16dmcrM3noFIutYR5
 hUZeBKFmt53HHmqwFT951TR/5WqIyM0F9jeNRW94B6F5IZjHKVCn/C2g+redTTg=
X-Received: by 2002:a05:6512:71:b0:511:5936:c87a with SMTP id
 i17-20020a056512007100b005115936c87amr1179017lfo.24.1707237862907; 
 Tue, 06 Feb 2024 08:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV5jQ8Y5P0LGEZUyDih3KBpWbShTwsLFM69tV7EIHeBH0VpaNEg+akHHIft9e2Fl+ZAVYZg//Q3vrGFUh31/jWS3Ob+7W5ntlD6DBh26mSlU1+FJJXVmgHXTwY=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a056512109100b0051153069551sm280983lfg.214.2024.02.06.08.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:44:22 -0800 (PST)
Message-ID: <8a046117-f306-4128-a486-e1f29f168bb0@linaro.org>
Date: Tue, 6 Feb 2024 17:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] hw/arm/mps3r: Add UARTs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vhepscl7CLob

On 6/2/24 14:29, Peter Maydell wrote:
> This board has a lot of UARTs: there is one UART per CPU in the
> per-CPU peripheral part of the address map, whose interrupts are
> connected as per-CPU interrupt lines.  Then there are 4 UARTs in the
> normal part of the peripheral space, whose interrupts are shared
> peripheral interrupts.
> 
> Connect and wire them all up; this involves some OR gates where
> multiple overflow interrupts are wired into one GIC input.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/mps3r.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

