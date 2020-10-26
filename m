Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3051054lfa;
        Mon, 26 Oct 2020 10:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTC80HOnYUsr/nPJPdvf1ZOsCb6o+aUInhsvCpT8DwKgJB1h/lWBpj3rNfDPO9uRT1SMiv
X-Received: by 2002:a37:9d0e:: with SMTP id g14mr15783471qke.226.1603732066078;
        Mon, 26 Oct 2020 10:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603732066; cv=none;
        d=google.com; s=arc-20160816;
        b=zlLR8cIRqVszNyXVM3T+YB4Nslvlgv1+/cNZIgk9YRZDYLOch9mVXigzEEtYO7it1q
         PzRyE7r75myGcsQqDo3kpv2PvrpeCFhmOyRFv4l8WfiWK1N66aoWjk7SGfdkib2XOZYa
         0HNGIHODfH3SZtuQ0CDoMlSZ3Aog1bVr4MgXf4o7vVlJuhl+cwsq16zDX3EI36CAHnp4
         LLt3hrjQ8Iyxb9mce833ccnpDqH9zq3hZDNx+NInE75Xowe/mhLaQF7qJPm1mwXYSlEw
         ap0KCyv/Xo5lTLuRQ9FQD9uBONY/mixmlAe8RllvDjEoimahH01k0VM5wvTg0V47b2Db
         RSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W74jO11sL6GXJK3TlAFoJoRz9TpGE9MwskoCF/al+BI=;
        b=IqQthqCAU5BLQzV25k7+1p2fmT3iZK8wW6ClNTAQX6GmXBReQ+vHU89r7xryPimti6
         F1w0ZsKSIP9nBBpbRtQzQ2ksl0sRQkpZsVHIti5elpGLnRwiygxduHT6yoROtFXDgJpa
         ZiUabjwZQl2PDe6ZN+BSR9Y3iX7pQtnYPO3x+oEmeYzVD5E4cIaVUxt+ZURrshAPi5Vm
         2fK/xKWT8ROGG3hLx+Ck1jmLqxDavWJJ2p35xJmnYxUIRK1pPEwqDjQG4S9FVh5XL8SW
         t5irCf/3k4yIXrkpF6k4M8+bQcn92ZCKWfjyPMROrxO8TpoLZ3vmcI+CtEarP7/dTf1S
         JdeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lf9aqAdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si6064118qkh.154.2020.10.26.10.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lf9aqAdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX5yD-0001tw-E9
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 13:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX5xs-0001qc-TE; Mon, 26 Oct 2020 13:07:25 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX5xr-0006lo-1a; Mon, 26 Oct 2020 13:07:24 -0400
Received: by mail-ej1-x643.google.com with SMTP id p9so14698896eji.4;
 Mon, 26 Oct 2020 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W74jO11sL6GXJK3TlAFoJoRz9TpGE9MwskoCF/al+BI=;
 b=Lf9aqAdXvOckYao+02WJGGxpPbE48kBE1cmcj8Ih/jgZihGj/TBEp7YIBmdsA2si25
 GBioLbb9RLfDtUY9Kj8e2i/5FoujsU0U5gSOVEvJqHHgn0k+APykJtbCehsxKLUZqjxz
 AOlnDzdoK1nIgrDdusXEauBHO9/ZyKA8Sjoh1PcHCLnVs/keD+Evp3ZwgesdkSnbJQrb
 Q2NB+k6ryhC7hib+jCpp9BmZUeFUNAtslM0Ek1DCjVscNyMS/uCtg18aUCzdrYfVk9WX
 TIBJnX2A9y5uE7PenrfXfyTugppBoFNMDaFfRxYvQUksN8SwTc9nD4ErpzfxMebBhgxx
 dofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W74jO11sL6GXJK3TlAFoJoRz9TpGE9MwskoCF/al+BI=;
 b=RZhR2L6aU13XQI+7R2XizFueKSHGGkLGL++B0y4OcptRzSOdjSkasY9mO43RXg/Bh9
 yxjotE1LgMbxm+6x7zTr1ZpmEL1DTH/rDmbjXboG1h28TmG6wUbn8Oov2vmaTilAhiej
 H2hk4QV4+X+cp0wtgt2kkqJdLG8TRK8OVYzyKgqT6US7afxSqyYSxcy73NkqLDo+sMWl
 sgzerzBneKt//G00BQ16pXujUMKshnGP1zxEMXc+lYgNuVIWhIi+z55zNec8qjc0Mc3S
 HvY68c3g4d0CH2tsmBlVfR1s+jv7XD/OL2EWc5b+5u6y5G0yu2Gb7tkU3srcRasFYGaf
 BMTg==
X-Gm-Message-State: AOAM531fEm6M//kX4uxssMT1n/5QXfXN7pMHmKpLfASp8qfFug4OI6E9
 dHFmrDqyJo9jCNLuphjiXtg=
X-Received: by 2002:a17:906:bc91:: with SMTP id
 lv17mr17147783ejb.249.1603732041200; 
 Mon, 26 Oct 2020 10:07:21 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id bw25sm6337943ejb.119.2020.10.26.10.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 10:07:20 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/intc/bcm283x: Trivial tracing cleanup
To: qemu-devel@nongnu.org
References: <20201017180731.1165871-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f87cc670-a1c4-62ea-c4f2-5706a9af1a18@amsat.org>
Date: Mon, 26 Oct 2020 18:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201017180731.1165871-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eabze66kYdIB

ping?

On 10/17/20 8:07 PM, Philippe Mathieu-Daudé wrote:
> Add trace event for IRQ from CPU/GPU,
> use definitions for IRQ numbers.
> 
> Philippe Mathieu-Daudé (2):
>    hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
>    hw/intc/bcm2836_control: Use IRQ definitions instead of magic numbers
> 
>   hw/intc/bcm2835_ic.c      | 4 +++-
>   hw/intc/bcm2836_control.c | 8 ++++----
>   hw/intc/trace-events      | 4 ++++
>   3 files changed, 11 insertions(+), 5 deletions(-)
> 
