Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22878786lff;
        Sun, 5 Jan 2020 18:15:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLmBBykucd5zjQ/ypyFuEpQQypPzQJz9wpqVMyAmBduJkA6xg7PuDQ9w+1HMornDAcRMX9
X-Received: by 2002:a9d:ed5:: with SMTP id 79mr114141456otj.72.1578276952215;
        Sun, 05 Jan 2020 18:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578276952; cv=none;
        d=google.com; s=arc-20160816;
        b=A8yjC2ikFnKzNDyXPk24rA3nkSaf+yzhAoRrHD+Nv6M79lGrPxSjEXzvuCx/Xcb3f0
         ics0085SwrcWCE7ZBeG8Vb7IRhlZC7KSDZ4uOZkKcDxcBDHC+vXP82j63YA2OX67stGw
         yuttCCT0eCio/XUOZE+YgpV04NkMXKkxwC8adgrEhw4oU7TghhRntcqih2RjQHcSgFeh
         EMyZ8ch/XxUosZat7u8OfmX+/e+SmOymnMVSI3U1xrlY69b/3pa9Vs8wDIt0R1YI9DKj
         66SV8W7/MWrU1aoLwAdTBB6pHyJ9/vY6ubV1YNeKXUlSZxgV8TwvECfbEfhZ/Z9jYW3P
         0UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XP2hNmKzUX3IBbM3eIgKOH1z6Rf1aNz0lhFQuUULG28=;
        b=dYc/jf4lGt0VCH5V8pEzvzeF0veQgFsS8ilSE7+3ZLgDg5/DQCbwPtngsn8F3ISaiW
         D2F64yhczU2QS2MQ4rRA/vF2O6hwoL7dbMqLMtKKN9/NV7F6APQRfp+Pv7uOMxePRXbI
         chdGlHQ8+ZHn0aVFcQNZyzLimeYJ9co7X/4zEYEf+lXLLNav+bzTW148aNYK4kivVyl3
         HututuKnWGHlHTgP6l499GBzEtVOIeu4yBrAdfGgLeA5Hm23Ay+McZP0kil4Y9xuiIGA
         bQhipLRs4iLS39k9MgRAoPKGzzQPkDTer1SQX1T2rKr77FDpKfrkcvCzZT3+Atx33pyl
         hcOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L+5ViJE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si39355296otr.123.2020.01.05.18.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 18:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L+5ViJE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioHvr-0003gT-1g
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 21:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioHvY-0003g9-Jm
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 21:15:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioHvX-000431-8X
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 21:15:32 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38251)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioHvX-0003y3-0T
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 21:15:31 -0500
Received: by mail-pf1-x443.google.com with SMTP id x185so26239055pfc.5
 for <qemu-arm@nongnu.org>; Sun, 05 Jan 2020 18:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XP2hNmKzUX3IBbM3eIgKOH1z6Rf1aNz0lhFQuUULG28=;
 b=L+5ViJE/plrN7/Mb02cYU3on+MSMjvXFum9iBNLG4cSZVc98RsAx+t0+giOH/7vxnY
 Io2ZFBtPuUSXbxkjuzrZRNncANRyBvpp0mVHnu4duv2JSIelA1qhLc/4WnbJf87Krq06
 s3iXcDm4nLInqAbd3ZK24/2jVdeYpr5X//LrhliNCvurrUr4FMiAbRpBBoCWF30uknZn
 +i4HoE7zTRx0CEUX8RmzjV7obcpImGDRiYSJp/mDh/vSnl3DOKbF9cCOn+0SS61LgUmP
 bpcuNHcNv3yLIitYkqU3BSa+ssgQSbyH7E0M9y294F9n2sJ0ONmKfTnDXXg5a42tsymM
 5DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XP2hNmKzUX3IBbM3eIgKOH1z6Rf1aNz0lhFQuUULG28=;
 b=qyjMGea45hLgZ1Oc1WSG1RX98hXIMvYMXrvb8JZ32qQb/7nz1Kg7uWyr9CQYBTqlMZ
 jsulg7avLLIRyVgW6d9zMeh7TFGs341wpiLXTNlHoPsgKqg59b5JVuRgxHKu3ORSLloR
 x7ZUK15g32N4WlEqlvL5Z7Zyrs7v5Ak5KM3djrn55Yu3trRjGVyjKFB3xOv0mRfzS8hl
 CVKdzuROA+oPrYZat0XtkHyxZCWhpc+KfUoWtFgMqGrb8pgLaVIjjxd8FxvhLF5zUGn2
 ymx7hGcwQymsDNfIfEogLmIMzIy8MvtnJaiyhzYPY9EWt+M0lDP/eGNgA0C+ecVtThcz
 1ENw==
X-Gm-Message-State: APjAAAXkzJheuDIOS9ZteEO243G/yecutXHedKmSrmK5VsD5q2Ke9SQ7
 GDu7cjpjugCeCE4/94w1Y2bT8A==
X-Received: by 2002:a63:5b59:: with SMTP id
 l25mr110928350pgm.382.1578276929620; 
 Sun, 05 Jan 2020 18:15:29 -0800 (PST)
Received: from ?IPv6:2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd?
 (2001-44b8-2176-c800-f1c3-9f9c-2e9f-1ebd.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd])
 by smtp.gmail.com with ESMTPSA id z6sm60618257pfa.155.2020.01.05.18.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 18:15:28 -0800 (PST)
Subject: Re: [PATCH] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200106015700.52992-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
Date: Mon, 6 Jan 2020 12:15:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106015700.52992-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: qemu-trivial@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ifp4xEiSlJHS

On 1/6/20 11:57 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (!feature) {
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org> 

Are you compiling with reduced optimization?  The compiler should be able to
prove that these variables are initialized.  It certainly does with -O2, on all
known gcc versions.

Perhaps a better fix is to add a

    default:
        g_assert_not_reached();

entry to the o == 0 switch.  Though of course opcode must be in [0-3], based on
the extraction mask, so a default label isn't actually reachable.  But that's
the only path I can see for which incomplete optimization would fail to prove
initialization.


r~
