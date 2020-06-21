Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2545055lfm;
        Sun, 21 Jun 2020 12:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRs6AwFfoApAzBr2E7WmWib6YNgUR11OoNaBH4UyzWQuuA9eYAIlaj7JeKq3/79sNmCguX
X-Received: by 2002:a25:3295:: with SMTP id y143mr21807635yby.321.1592767400621;
        Sun, 21 Jun 2020 12:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592767400; cv=none;
        d=google.com; s=arc-20160816;
        b=g0jhmF4+SkjTUy2VuzKTLfHuf2/9apso5n79GQqNWdWUVbXekiywztQAWL/ZNq7WO6
         mBfafoZRgvwRKc9KtvbVWdnGr9lxOF9peuoZ/7SRKA8vM/rzlHuzWBD4x5fyyxbBp3Wm
         fW+HsT1OWrydYWUHtMjd6X4dfiKpmLvcu/s7JlgupT970Hrifqlol8XAR/0hyno2ZnB+
         cV8zcbFzCgmTe1X1g7+oq53Z473s3v2FuivmPEjN1Yx92vcEvyhJqZmY1Y83ArsTrDqb
         Ax2fa8rZCf4MC5ekt88yvk/DQ5T7p0R9paQxpiCs+3Al6A+jFCzofY7G172Jv39smUsU
         HD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YHE/jaU21Fb5bQ7ZfHntr+xzvvFVHxN+La52awWcvb0=;
        b=fZjS8M3zufeaZvnbfJLuP0qHe3pB+9h5G/BuDyuHloVsr9FoH5D4yt2TDcicY6iuTi
         Q3guoGULbzIblQ6tf1fhkRqwuyckOu4IF0+UppglZ969eeYWosmFtTmoF4dseRh5DGoT
         xW2KH4JyadxZST0zmwm5HAS9kGR1AmEzB9L4wWUr+TlSOyjU7dEui10psnv+5zQf4COY
         ZG5KbU4GkcyJYlDh6b603/Tr+aZVvJAzNVfG78uR6lvGg1be7FqWZmfj16GWIsKOCRZF
         O6sq4j3+i1WGVrOGUaqSoCv8OEc+T1WH2fFlep9P4bEsdozPOnEl10whNtEkmG4VAnsL
         6Ujg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3oMXUJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si14247168ybt.55.2020.06.21.12.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 12:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3oMXUJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn5Ym-0007na-14
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 15:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn5Yb-0007m3-Eh
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 15:23:09 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn5YZ-0007jL-34
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 15:23:09 -0400
Received: by mail-pj1-x1043.google.com with SMTP id ga6so6993196pjb.1
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 12:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YHE/jaU21Fb5bQ7ZfHntr+xzvvFVHxN+La52awWcvb0=;
 b=M3oMXUJIIJ5RFy7fn4LaUm4tdpow4Jd3fTDcQuMlCm9xXBvZsoPIJsegrFTXscnUtP
 9JUCz7483vJPGOLlSG7x4xL79GF6+QNCRPToHO1OSUz4kcjLW/hOggXZ7XT5bJwruiUq
 bFuldQTzMe+SFE0xEezCTrRp5o6dXO6tO2vUgbv5ckp/q0AH+preNuSMX8rMvUG58A7X
 3rgZ1Ut6Vp0wJNB4/Qw9d1SUHQ42HZG4mxH1npco0KX0MguLwImOOCkyVjUlEFOqv/PA
 ekUzRyOr5J1KsIxqlXo6AJ+wTGsS3eoFNnuGufPWsivyBj71UJm9fAlov1+OTmd/obp3
 yKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YHE/jaU21Fb5bQ7ZfHntr+xzvvFVHxN+La52awWcvb0=;
 b=KkMiL47ozSIvva4k6oDaitkbAHkYJjjhcgwFmuIVJ7mOVg/qrvru8zx06Y9ycfG8qN
 2vnR4K7y2s/LepqmyOjmWJpCh/KelT2FnOmugYdgtpPhuhl8WOMa2ql6vx2P38Zk09MD
 m4GyRv+vdu0YbK+eCxkz1chPMxfEAelWmh9ENRPeD0fFU/nW8GlJSmdSFuZRqHurxW4d
 Z/e+Bj3XDdc1z2cvCqQnHIBnDMMy7SY0zDZPsr2ERxn+x6fsAKfi8jGLZD3vtzCoYUHt
 7HfyoyySdSZugyc6twGTl3f3JrfXAIlMUqCqysTLbmkHkIm309Z9IkAX1r+UuPlDVzhZ
 mTsQ==
X-Gm-Message-State: AOAM532d9YuVMWTCUWdi4UtD89yqcIy7itw8V4s5GAicTEPUNzOrVvbK
 OgfPG4cVw0PuUosM39PTykpiPg==
X-Received: by 2002:a17:90a:cf17:: with SMTP id
 h23mr14806026pju.139.1592767385285; 
 Sun, 21 Jun 2020 12:23:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p16sm9219770pgj.53.2020.06.21.12.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 12:23:04 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] hw/misc/led: Emit a trace event when LED intensity
 has changed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae4a7411-7042-3530-3faf-e25368080820@linaro.org>
Date: Sun, 21 Jun 2020 12:23:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZwvGbPy0Rdop

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> Track the LED intensity, and emit a trace event when it changes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h | 1 +
>  hw/misc/led.c         | 5 +++++
>  hw/misc/trace-events  | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
> index 883006bb8f..df5b32a2db 100644
> --- a/include/hw/misc/led.h
> +++ b/include/hw/misc/led.h
> @@ -35,6 +35,7 @@ typedef struct LEDState {
>      DeviceState parent_obj;
>      /* Public */
>  
> +    uint16_t current_intensity;
>      qemu_irq irq;

Why not sort this new field next to the other uint16_t and (partially) fill the
hole?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
