Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4803864lfc;
        Tue, 1 Sep 2020 10:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwso9AxVmkvP72c44LWWnjU8eYVi+32e9Ym4MJYiRlZeEXian5Lpxdr7BRYT3uP+TLjmK/o
X-Received: by 2002:a25:e0c9:: with SMTP id x192mr4100909ybg.300.1598982607905;
        Tue, 01 Sep 2020 10:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598982607; cv=none;
        d=google.com; s=arc-20160816;
        b=o3LorNSN3iwXEU9axi3Esc8oVeTuiICmKaQUZO0egaH1NKRLBg2ly2pV7yWZDwnSI1
         Uinsx+Q5NdxN76MOlqT2KuRXTz8tS49IqOszBAa+w/XX8xznuV9uozq1GnJbvubAsOLx
         UYXaHqQ0ZqG8vX3LS3AiOPSfuhDXec/tShTRxAYh1a5830+W7dZi0soGJ/M+ZBAt/HzF
         H/7sxpyhn3v6o36bEiu8x2vImgOW76c6gi1jThYER4eaHGcmureyk0FTGTSxtpIUyERa
         tYBatAmkbjfoBlRrIGsCA1mpFNUJrg/MfDc37v750lyJbU1+zmg2mYy9GLpS9By1EXeY
         KOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8ifEANnOFnkWKd9qry6HkZCR/efNySP3CF8YCipTVYs=;
        b=Mo0Fo5eHMLvP1FLqCbZjBW71exBPUdP1KgGAGvdyiFCh9a3lTvSwfDRXbVuFEw9SKV
         uLzr37GgOSAu59ig985c5zuyAF0V7WxtPpOiJhW4kVMwNXAwR0zHz+9O7/XRvvtaCeCU
         IevrQ+CuQ48evqe8AxZxH5EG8TlvyoOmL15LOHz3xeJpcVuG0L3PD9+eZIAfyyG16VyO
         erwFpfcGK0G++4nQk4o1fGcKCXt8CfsmXO5sizEoyjCJExr3kksn/CKjT0iofB26xQC0
         jkihakqt9CQdeZ1gqt0Sr+kfB10fVt6L5eR0zmSLa6XgVttU78bDezmb7pO/6DPg3A5I
         XiNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iu5Vbar7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i144si2042465ybg.60.2020.09.01.10.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 10:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iu5Vbar7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDAQ3-0002bQ-9Y
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 13:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAPu-0002ae-A3
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 13:49:58 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAPr-0002UX-F3
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 13:49:57 -0400
Received: by mail-pf1-x441.google.com with SMTP id c142so1228169pfb.7
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ifEANnOFnkWKd9qry6HkZCR/efNySP3CF8YCipTVYs=;
 b=Iu5Vbar7JGqjeN+ISEcpd0k4XXR/9X4mQKjrltOjAOeP8BcdErvVqocvTg9lAuhPTV
 fw7YZlXfHXDHnq4JBTx8PRjhYlFmk0/2hUHpxxlEuFfc5j7MxOhefqrvEmvLVB7PLusD
 ZNynTOp8qjDFSc2pLNTFlNI0KQNFAdhDKMjlvjg3sjXTdedkMczf571Y38jHn+q+hXuK
 vVmrB8I4s9FlCxOcnOM3yfQ0v4xQKuJZ9tIL949QwDrV8x1dn06r1QMjoz5487LffX77
 ij+1F4UsvfkstGqjAxTTAbDXmcpedwtkaytf7x3/g+gABeIInEDaIUY1CIGM7oVsSMbw
 55Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ifEANnOFnkWKd9qry6HkZCR/efNySP3CF8YCipTVYs=;
 b=eJ0Zavq13B7vhFWOwliWXaRP2su6VZ9bd5MY9WkmykXfSFAtm8G2aeIG/QDSPwwqes
 R46FpViM+1bc/a0e2pqYA5vI9H8a9wo8lGGhp2D1H0AHP8zY7jnaKi8/mU2+fF27w7tI
 +TM9s6gBuo6652HZQ3JhKGUEijzR6/1udaGWyrHm/onAK/J9tdNAQdxJSalRMCx8by0F
 KSkZ5AHDEGn7EAMfBQ7nyZBw94OymWSd/WgnKzH/84xNaGcptdqifSGI/e2OeVDojUmm
 rvxeqYmzJWdHiLhOrzFlq7w5lEk2kuU8bVGkWbLPHB+tmOm7x3b4y7Nx4QdrW3bPufG8
 cArw==
X-Gm-Message-State: AOAM532Xvai3ahUz0R+u21GiTRzA5PxUG2iOg+pn2UEypsMLT2/0MIPT
 ZPaqHqWMGxI3N01YY6O8SoeUgw==
X-Received: by 2002:a63:4a19:: with SMTP id x25mr2414236pga.56.1598982593787; 
 Tue, 01 Sep 2020 10:49:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a138sm228105pfd.19.2020.09.01.10.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:49:53 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/mips/fuloong2e: Convert pointless error message to
 an assert()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc79a73e-ee46-c8a5-3843-0f472b2680c9@linaro.org>
Date: Tue, 1 Sep 2020 10:49:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901104043.91383-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: igHAXcrdyWq1

On 9/1/20 3:40 AM, Philippe Mathieu-Daudé wrote:
> Displaying "vt82c686b_init error" doesn't give any hint about why
> this call failed. As this message targets developers and not users,
> replace the pointless error message by a call to assert() which
> will provide more useful information.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/fuloong2e.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


