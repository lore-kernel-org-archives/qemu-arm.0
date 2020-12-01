Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp225078lfb;
        Tue, 1 Dec 2020 06:50:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygzKfTI5ixquRATTZGQSjcmGTpyxmpO2IKIT8UKNtPhUIvWvSrympQzFbMxTDDBdN/CyhY
X-Received: by 2002:a25:bbc5:: with SMTP id c5mr4865457ybk.373.1606834211716;
        Tue, 01 Dec 2020 06:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606834211; cv=none;
        d=google.com; s=arc-20160816;
        b=aj4ybH5zD6CYndpgcMY1njYpoTEZK0o9e8stb8cHjsUz6xw/Oiu51Hcf4dBdY8iLR3
         BCW4qKRBx/dA7ecTb3p0fRv600lEStWCBZZVAlmwdeZFLZbuoq/hxCFlHQYIy5omAXuq
         /Hz3xq7LUOp6DG6O9sGu8X3mrdQPm0QFjbPZvOzS5mWhyVwq0fJyzHv4BtK3FH5yFQTE
         EOil/ycBXaISNNre5QJ7dDyi3bvYWiK8dm1j3BKyZgfNQx0h4tlgZjNyMSylee1MHY34
         ZYLetNSc1K69NRAEEXl8sbLfZ6VM8SRkOwZqizwK/6+GnSJaKbiKqa2dIxFn4P3F9yAL
         0h8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZfI39b/MhHgruLj54W4f8gxdfNCOgpb/s2TAouOGLbA=;
        b=K/EUh93LVbHJe7FuhWm0GrvqJ0PRi9QChlpcVCn6kUgeXrEuvLPyB4YSdFYo1kYBHz
         5Bn+owwXHMpnUzrggQcMUj9TVO3V4/ZeKJkumWsmKAKuwVibT2QvWkUN1vFMi2t8uJwJ
         iDeSWpvZkq2ae2tQBkvXVk89vdbeL082QykB9VAfjg7F6YWixFCGCUXp1TFxPKScBv7I
         IhTk0XUjENxpPs7do9ZX8g8py4lQMITMB+euMQF7wNFnJiwI71XZ4SEl3cbsfnmLQjGV
         WB5cg/2gPobDWhDvk9VtncVlu+6HZRa3CC0y0V0Xp3VypM3YHmc0mypcGmwkooM8pOoh
         MEjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynkfsoMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y205si3386yby.216.2020.12.01.06.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:50:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynkfsoMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6yp-0003dc-3M
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6yR-0003ck-I8
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:49:47 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6yP-0001Jr-V0
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:49:47 -0500
Received: by mail-ot1-x342.google.com with SMTP id k3so1837153otp.12
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZfI39b/MhHgruLj54W4f8gxdfNCOgpb/s2TAouOGLbA=;
 b=ynkfsoMCJ3fFNQkFlL2pvjkOeBNpazOKzXZdvzyI/55wsBVLtSYuS0a/5O3dL5zwGZ
 y89W3Q1pGon5i3HIOrz+v9Qq0Pp2Ni8x99nB2lvarcR6hxFvNbrZsA+pp43Mix/tRj+y
 vbKGiqP/Iqye1R/aopfqFN8WOnPg0xQSdRvpkW28vgB76a7NlnZioPMpYNpuoAxSE7IT
 eL/OKCavaH5U6cfJLEzotYZa6GJl3SxaHUpixisG3WkR7r6GIMJtfLEwKGgruEygdTag
 +ooQXRrnPXhhgknxK0h/4mrP9NohCxp9vipHFD6r2GaIco57TdNP03UBQ6P/bOKAgB8E
 HsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZfI39b/MhHgruLj54W4f8gxdfNCOgpb/s2TAouOGLbA=;
 b=BlbaHROfawhRyyK8pS+8gnQ7ZPaGgUQGiEAl8T6fGsCIO/+42/97GLQR0P8auo+zMi
 wraXkH24sweoqEudpKvrYNuLHqJV6QIgRsjxMMYlGgWeKOdkGadNOmI7iAcjz2wVRGpd
 Qz1EycYTHn7Opnr2Zf9TCrepPSl/9yP2lyTJhlqMAKoVqgmE3C6xup25BvNx3E65ezRw
 OIT6wmBk/dlQpBb6vf6lTEFb7mtR5A9/9I0WXBQdTcwbf4Fmc/Z1vG7inSKDReRFrbe1
 nT0ZJryDsun3UE1HtS189ZrfSDl5wpnCRXUqYrKvyva2KZczG+FG6yZTZz9JGG5xiKWb
 0eVg==
X-Gm-Message-State: AOAM530s7iTBrGAuOcPYOKQW/7oGulwHteNuiSfJ644a6r7rIfNtqhP9
 aGDjd+GGIuKDJDOrsaHz/9gFDA==
X-Received: by 2002:a9d:6847:: with SMTP id c7mr2008470oto.134.1606834184751; 
 Tue, 01 Dec 2020 06:49:44 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a20sm419583otp.54.2020.12.01.06.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:49:44 -0800 (PST)
Subject: Re: [PATCH v2 19/28] target/arm: Implement new v8.1M NOCP check for
 exception return
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57cfda82-0807-05c2-7b7a-56140becc0e5@linaro.org>
Date: Tue, 1 Dec 2020 08:49:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T63fHXqIVyMY

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.1M a new exception return check is added which may cause a NOCP
> UsageFault (see rule R_XLTP): before we clear s0..s15 and the FPSCR
> we must check whether access to CP10 from the Security state of the
> returning exception is disabled; if it is then we must take a fault.
> 
> (Note that for our implementation CPPWR is always RAZ/WI and so can
> never cause CP10 accesses to fail.)
> 
> The other v8.1M change to this register-clearing code is that if MVE
> is implemented VPR must also be cleared, so add a TODO comment to
> that effect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

