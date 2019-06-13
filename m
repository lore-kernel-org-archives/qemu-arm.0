Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp213439wrg;
        Thu, 13 Jun 2019 14:32:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnn3W6epPrItazzr0He6kUr/DeJOr9Q9rbG3+VkfFSHqAq5ESt8BJQV7CsT/dqQjWOFgDt
X-Received: by 2002:aed:378a:: with SMTP id j10mr78621745qtb.6.1560461575590;
        Thu, 13 Jun 2019 14:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461575; cv=none;
        d=google.com; s=arc-20160816;
        b=lZ1mwJ9Rm6g1Z72oSzb8sB4KRhGphLypJQ017Q300lF5BDHXdCsb7yCOr3MNYk4N6r
         iTgThupJYz1JTfFQTYX3tRc7OMt6tRoSfyJ02n7PTOVaaLk75E3lEn0z50k2+qx3fiKv
         T1YXjOEH++PdH8tbyPRq2pJAtd884T08PF6spk69C6ttyHOt9L+mE8yM9OQ0NxvTUizV
         umn5SlNdiOyAHx3skqYnMCGolU3sjoy7KxScTXXIJR7f23DKhPWequcKWIT2y7LeYO/k
         QjdpLgwTkuQ9PiYjUlaXpNDQLrN/FEPNhVojK+JlKQvNjvcYngAiwbviet9QQ1oD2oMg
         T3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Ca3pu0Ed3//IeabkA1dLGA2V9ofR5NB2wPhnVn1euhU=;
        b=GPs2na/HT40REmrLpMSinCN0DezZkThd/iy9ikTvF3nNN2/FMBYKGRZp+InTwMYPgA
         OSgUfoxsi6Gb9yPmPE8jXMs1zEpKkPPEW9bJdipyC9kXlGvs3d6uS34U5bot6CWwDqwF
         T6RXbA8c7GJTiSMOQepO0c9cCDOPBEcumI1ME7hs7UZw2xJ6gyzkAzSntyBWCaUcBLBi
         SPl/ivU2DLJ4mGA7CEBgAeJprST2sfDDZ3buPmniUgU1wUsIb9S89zumCX3vfrKz75y0
         cx1SSsqy/Wx8Bq+vLNV3mK/YHcSA5CqwCP9sMx8PaK+nICvQMNaQjcFy7KUwhaG1JkUI
         ELQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n392FVQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k51si451215qtf.356.2019.06.13.14.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n392FVQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXL5-0007XW-3S
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50625)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXJl-0006K5-EP
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXJh-0001rZ-Ph
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:31:31 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43196)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXJh-0001rI-HN
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:31:29 -0400
Received: by mail-pf1-x441.google.com with SMTP id i189so49374pfg.10
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ca3pu0Ed3//IeabkA1dLGA2V9ofR5NB2wPhnVn1euhU=;
 b=n392FVQD4R6g8PuCixFWef83AoPpHz8+UeroTdUf8+baihqgvXSoV8MVk50UeSVhCT
 ckqQ57hoJI0kUJImpTi1wUf4UTG1JUlFTAagPBxz6HIRy7BtsYLtma8ld0oTBf8ySRL2
 reg8jIs2VWH/kMePrAFWeaTWwJNYhBJ/Qd9cpQcdUN8/G67sQMDlXVbOn3dIZeIeceCd
 aVmw1SSwyqNSJptY2VhuzGoeRMWKysMPer1min9UIEd/eLEarlOjycmTIh14g1wKnmbJ
 c1tDTDUYprnITx6fA5Lf+XPleFV3S2eGCbJBpfDAnMVGY5ZOjaJnjywGgCcEvWDZoEcd
 goNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ca3pu0Ed3//IeabkA1dLGA2V9ofR5NB2wPhnVn1euhU=;
 b=pq9f5Rll2rUDN8B3esBlxg/n2b76J5XS5J+jM4S/zsQiC8YxApI0g417q/tYfaMFC+
 CS4VRfxC6x1mArPhF6DH3rZr+dhdLNbaj05FqzOmS3sZmfOXXXkfSWYQWT4p9wB8FinR
 aFmX2ZvKnTxj/NWhQlDH3QvQ865nrnTnz4wvA8KD+x/P+z2VxpuVjuo+rgVFQfO7dEd0
 lw4II1KUcEeUNloX8ErwdsXld6s+6tZwaf4XhQge6WRhleEzdg5eP7olGpBjRizFKn1T
 zCkgdC/OaFrcyoln68B5gwsV8GsjuMiEZdtvrnyfDdTSo6wjG333BfExHiXC/TzAivm2
 zkMA==
X-Gm-Message-State: APjAAAUXtwGVlNJGQgtjedDsvQ2qLaWmJHKfiX+vZXuiM1wB0ZyWA/rh
 qu0szxHLF7BG0aIoBy3z6PcK1g==
X-Received: by 2002:a62:1c91:: with SMTP id c139mr87924136pfc.25.1560461488264; 
 Thu, 13 Jun 2019 14:31:28 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id n66sm612410pfn.52.2019.06.13.14.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:31:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dad9bbe4-a445-3718-dfae-8e121126a5ce@linaro.org>
Date: Thu, 13 Jun 2019 14:31:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [PATCH 09/12] target/arm: Stop using cpu_F0s in Neon
 VCVT fixed-point ops
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
X-TUID: 3q5r5VVY3mYJ

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Stop using cpu_F0s in the Neon VCVT fixed-point operations.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 62 +++++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

