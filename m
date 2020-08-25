Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp80219lfc;
        Tue, 25 Aug 2020 11:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyBW5hX1aLOalgI7JB79XrR7D/uSocbdQUlBYdvMFvsK8uKI9zdJclUU7Np8T+l9K3k5w8
X-Received: by 2002:a25:ca0f:: with SMTP id a15mr16153406ybg.256.1598379777156;
        Tue, 25 Aug 2020 11:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379777; cv=none;
        d=google.com; s=arc-20160816;
        b=znY+kR+Ui5D6nm5m4viWDMS6p4Nou35/y0C0BB8NaV50euumyI/lXXwj/Fr6IXSuxy
         sSAge4e33pfDZPyjPC+24cIZ3AHMkTAl21J0yWBjsIL0/asfR7cOxQVVpQzzHq3CwihG
         Ez5XCdNjIlnogajc9ePgE8p2p1rOlXjp19MGswbYDrUiUE8usDudMJ1dJSo4f9Uxbuts
         /cJy262NuciXDGW4HxCzRQsfvGGXV52aXmw/1/qtOMDgox3uYFrErSp8gdkxEWB71QtY
         u5aQABfqwlKRXAlwAd3UtlBdtjieywYbMulJZ7IZkRt+4pb38eNlnb3N9ElUqF2Rw4zJ
         OE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aFDCwZmNhs5+cnnNn2vq4fmaRA2Pz1zbjkvEmGCy9uE=;
        b=sd+RUBv+k7EZm12mBUtWn2m/mZoPeptXtiWwQQf6MN0lyBDUSnshTKerrmSu7ziGNF
         Y1Lb4cz9MtSZ/RbDEb5NU2d7+rF5ipIbc6UUgWSDoFxsCn/6nJfd+Cn4Zvwzm8N7LuoH
         EsDc2Ad2hlb+KB7GbGYMRQae89uNjwUIfKxz+2iyG399cHQ70OAMUDiDrImUGvvAOJdo
         VWTBkY+mG01gi28ws/66iBIUKBqsuLbYiFD4DN3MAqH0HRlhMJCijqWIqLIHHmI6IePD
         wvuuDUwhCfwS/0OKhT6drQeIdZWleuRfhdMXXKN4m1x/Tq6ot3Ff41KziWDJ8HIEPoq4
         t79w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndU3Mmvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d136si15315224ybh.36.2020.08.25.11.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndU3Mmvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAday-0008Ck-K5
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdaq-0008AN-JS
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:22:48 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdap-0006w7-6W
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:22:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id 17so7987472pfw.9
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=aFDCwZmNhs5+cnnNn2vq4fmaRA2Pz1zbjkvEmGCy9uE=;
 b=ndU3MmvfhlDn+R2aNg989faH79FgYDylfMGIi/gemclZEQX2035qCPpqnQk7mGpLGx
 FNq0dt7hYrEu2MxGwXz0/Sji2A2CDiSxyNEYQqnZiNiO/JMRUpK0AwRisb1uwlbrVvRC
 EyENzyKKhFNlvQIowPBlLCWzjojymFlGLtcOtbYj2iVsA5511ASLBA3eYCrbH+6aRGN2
 UzoNhxaHb5mwPB4K4sInjNnlGzqYFKkAUXt1e5WYi0nZRknzLB1BORJV9RCC6A/kgORG
 haS32TWLDvRy1uT2Odnmb5W9pa3MZSKa2ZM1LNajTN/k/u06B+6PViHwU/RYsKmJNzTG
 g6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aFDCwZmNhs5+cnnNn2vq4fmaRA2Pz1zbjkvEmGCy9uE=;
 b=Hrp/Kb4/91PwlJImb8Zg78Q2yWlvgHm1SvtCHCWIXTlguj79+4uEWu71yq/HwQDJV0
 gbbOoFsJoGZHONOmAXRbMWAs9YmnTMZ1nD2MH9sWd2nK0xbjkBso7ELfu3G2IcqOLNVR
 Lh7CDWRgNmflvm2SKzR0yG+U8p2bTlBTe7nyp95O/hEzM+gwvzz5+oq2DON/S70L+uja
 emo3PeCiSKdLn/EH/Ifr80ilZXA7u5IFEwBndD0Ttm1OyRywDPo9PgbygO4+vxUfezGu
 tsevRtHx++JEFrmAn811C0rvfSX7K0LkU9vFy8SkIxIPKaP5fvaymSbG4dr0Et4wfUSv
 mmHA==
X-Gm-Message-State: AOAM53082ifPNlfxZ6baAN2A7XW7JuYwKK2lAXJJ5eBZ7NWpw8CU9dMS
 zstbytTnV2p57qcj3m2dIyX3TQ==
X-Received: by 2002:a63:9c1:: with SMTP id 184mr7405427pgj.265.1598379765659; 
 Tue, 25 Aug 2020 11:22:45 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id d23sm13567613pgm.11.2020.08.25.11.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:22:45 -0700 (PDT)
Subject: Re: [PATCH 07/22] target/arm: Macroify uses of do_vfp_2op_sp() and
 do_vfp_2op_dp()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67580ead-e223-51a7-93c6-491678bc50c2@linaro.org>
Date: Tue, 25 Aug 2020 11:22:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: WYFZxyCPZ6zo

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Macroify the uses of do_vfp_2op_sp() and do_vfp_2op_dp(); this will
> make it easier to add the halfprec support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 49 ++++++++++------------------------
>  1 file changed, 14 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
