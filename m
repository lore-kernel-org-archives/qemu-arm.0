Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1097958wrm;
        Wed, 9 Oct 2019 08:48:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+Pulkjra7p6msgWao0VEzFV7W6mA1YY/cWa4Ekdv5PMoHktzc2IImc6M5BeiJqXBdcIzG
X-Received: by 2002:a37:4146:: with SMTP id o67mr4014846qka.23.1570636095627;
        Wed, 09 Oct 2019 08:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570636095; cv=none;
        d=google.com; s=arc-20160816;
        b=bveUhAVS2C+NxCOVg+vdSZaGf7Md2ibilLT0bvATW1du2yCRdG5Ny1p/hP2bU5RFZ9
         GKP9lbFaokGcpFkeBLTEJOkLOTCLiMGB6B974F50O0ew7bFquCir/NGvUafu5FAnZVnL
         6WxAzsTHz3+dqg/p1AVv7XDYC77sihbSuC3BEqc6KDSaXl39Gn+52cP+H5254a89a71e
         4ENqd85rW89tKOzllkHzrTKZk9nwN4xGTG3nJrHg4g24pMfXRfbRGe8IRxREJLT1C6Xb
         NKrbR10ChJaiaMQ7r75hgX+XpH9pCS0zBW/nEnY9/suktyJOkaGXEKJkx34O7Z0Qw1Lz
         gpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=BFCCKE5ASZGFfjr8QJ8YZ/4YPUpMGrMmDgk5WxUiwek=;
        b=RU44SKwbOXK1nxlihdNUmCzPX/IA+m1x+jbB6uiJEDvUpfuXcrspbt9zj8ZkoPcl3/
         BFRwS6p0uguCa/LvpvEWgVYVFA0BfbMY14LFz6AqDSYGJhRoxww86Fw17wBhB58s7iTe
         5M6ZpIsfGcQz9DMiovdEv3gwrWco61KxxDnQ2CC9BEPACIQ3BJWCE9psIM/yT1y70YM6
         lZZuPskyhO37Ytjzki3oW5xgpXOXyDYSKxKwxE13xSAaJqB4rjnz6SbI7MAvtna5PoLg
         c7N+N7hYqd9rlrM/TGgjVIkVrmxL/eWBcz8CUrShZsk0QxCPln6XVuRckXFEfZ0c5pTp
         kGow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cOqFYwGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si2336396qvr.46.2019.10.09.08.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 08:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cOqFYwGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIECE-0002jI-Q2
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 11:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI16e-0000mk-Cn
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI16d-0007x1-1c
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:49:36 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:43455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI16c-0007wk-PN
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:49:34 -0400
Received: by mail-yw1-xc42.google.com with SMTP id q7so220606ywe.10
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BFCCKE5ASZGFfjr8QJ8YZ/4YPUpMGrMmDgk5WxUiwek=;
 b=cOqFYwGrMecaLsWI3IYiA2T1FLiUB8JmnlewdxW23L2xfnL3FMnIkr6mH1Jb2ZwYrM
 ygy1tgAeXxqZqCa3PXMG6J2nKtYtZ+HBgOW8mctJEPlVSANwkK46mawKx6iwxq9NJVBV
 mHRjGONAPLtMEMPN3dsqRiX6ingR83FugC7QGnC+o075tn/j8QnJOt5dFXdDmy4XHWq2
 JXd1cIar0AEo1OQYSqYH8qvt8RSgqK6d86iHpVbExQsaVxuzI3NgxQ/czCWHwyM56/Un
 HeaU1amAUwUEVtOmY6aZnYPy/TgcGIQf0e32vfpa7Jw6ytQT5Ga0M2j6Wx8TO9FJDLPP
 mC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BFCCKE5ASZGFfjr8QJ8YZ/4YPUpMGrMmDgk5WxUiwek=;
 b=pH/EA5Fs9PqOZO5F/Z8sX1ble2wppf4n4nh9qeEmyLltuvMIRn9Z7UO26JWlInfssU
 y8eUdYcicQLoFK++UV+BdKiD7Vn33SeJgDoPWEvbf+AT3zn3aOjhhDeziRf8Rhy7Hi60
 RAkhA270Nxg4sD/ytUxrojGK1yXxsaE/SLWcO6XNUKj8h+y+JQCCSG/h8qn+SO4bKEM8
 m4b3xV72akez6GvTfU24NkeJ7bTetLHKLdGqUQestmpZCW8H0oC5tTfPTpVhTAXP4hb9
 0e7a5wfdZK4nCWEd/L4Kqb8QyD4Esnhj1osp+XFG8Hks4sHq+V1DP2kB2NKe7OUt21ov
 CzFw==
X-Gm-Message-State: APjAAAWxBgUvUN3J19QUVazG365DgK0+4a6bjudPpuge+5CPeyFf6ZkC
 4An9PV35ZQUSBfz2YUSkHN5Z8w==
X-Received: by 2002:a81:7c0b:: with SMTP id x11mr948443ywc.385.1570585773994; 
 Tue, 08 Oct 2019 18:49:33 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id e142sm209382ywe.101.2019.10.08.18.49.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:49:33 -0700 (PDT)
Subject: Re: [PATCH v2 06/21] hw/timer/allwinner-a10-pit.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <039314b0-62e4-e119-1bd7-c4ecb76c7616@linaro.org>
Date: Tue, 8 Oct 2019 21:49:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qz98KovTC0Vm

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the allwinner-a10-pit code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/allwinner-a10-pit.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
