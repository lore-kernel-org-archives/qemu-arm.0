Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp219880lff;
        Tue, 17 Dec 2019 19:46:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMHp7S8bZDHZ2epvZTF3XZQDBucxotOHGNs6l/VRNFUvw7V3X6FXHXC5Ga509WNh4AWnDL
X-Received: by 2002:ae9:e707:: with SMTP id m7mr406043qka.320.1576640784165;
        Tue, 17 Dec 2019 19:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576640784; cv=none;
        d=google.com; s=arc-20160816;
        b=smQUrsPDgmhNjv1qPYH/FDKeagylAEGjk43K9Plm4RdK6M6H2s67RiW/hiIzgRoPyX
         gkUUl9Y7LrQmI92YMEWIhlVc54id4SQJT7mv7OAAY0v1DVC8eIIh1eBnEwaKkPhDxrPp
         yVPTjfE+oqz6D4bxAsHutL4BlnPxftg7miV61Vw9cA3akpOXNnZQZHlbI0tv6Lyr/06y
         J/dsPd7Bo+CmBgkk9jmULirDAPp86u8MCddksTC1G0zYEmnVOIZ7kE6yubXUtrFPOiyw
         GYCFQJLapm7giwjrJhrgGc0P6k4qgl366d0IxXLPKU0Z44cjAJaWd/MCaHy6AdH4UEA9
         6UTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bGfARsdCLz5Bkj4bxAAz0ZLKVs1p1DoNYlG/3BcpDrQ=;
        b=guIgFQuhK/IM57QvZWKkDDZ+tKd/AnWehn9ND812cuTv/Ysb7gxB4gGtKy5QpX2qWN
         UgcodmaF0jC61dcl6LV2M/veAhMs3VoR3ugK4pbJxsC6YLfTOJWC1rT34GxcdnDW0z7M
         MXMcnIi2lFjvYi2rgPwZzfB95V+LipKq8XW0r87b2yT4lHCSSFmW6zqQ7jtAtLk5r3ug
         8fdO+zmjz+XCzpS2uuya+dIBPPrKY1/QiLgaibjWcPfB1oxtZauP2nzkEyoJF/2+nYJL
         ve4h4eEmn0++xtkVXbI6X57rY10shYg4M7PJ1/aYn8ddZd4/RmPGWevc9r7XAwf0Yk3l
         +QOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=blXkoP5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 59si520842qtb.331.2019.12.17.19.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 19:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=blXkoP5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihQI3-0001VJ-4M
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 22:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQHX-0001SM-BX
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 22:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQHW-0003jo-7H
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 22:45:51 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihQHW-0003hu-0d
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 22:45:50 -0500
Received: by mail-pg1-x543.google.com with SMTP id b9so463699pgk.12
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 19:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bGfARsdCLz5Bkj4bxAAz0ZLKVs1p1DoNYlG/3BcpDrQ=;
 b=blXkoP5I8XVTLn9OHLlMkkqo+8h9Wd+G48X2meg7HYdfqneVVvsLgXlto7tKLCWxam
 QBoKsS+S12w7avHTOwV5PWm66kx1KK/ka02jJM26+kZvrDoa8WJLvEmZkYlesH/TJvJW
 UsaIG2MRihbh7tt7b0khHpbBPO40Zv/sHhm+rT3JgjH65Z8n71PWy5XGY8woGsvG+is0
 khzX/866sULBnSrrbiUwic36PI0c+L1Q54RSZqDu5kZ151HBjGaM8a85IGwJg0ZcBgCn
 QIAleerw/dy8GM4soIzjikNYOPrd3gQaouQkmGFWHnIdFBa5m+UIJt4OJ7v8JOg0vJg9
 oAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bGfARsdCLz5Bkj4bxAAz0ZLKVs1p1DoNYlG/3BcpDrQ=;
 b=E9ieRmVg/jvssrga9mnrRi57wqNDuLkUIpxVEqRBywhjJKinWl6eJFvQYFgt1kidrW
 aqQAyhcl8zkWpZNp34BQ8pk4nqse3dtDMYzhRdubOFVrNUvIBzEpQGTFYJDVZhRETuj8
 QOdH1x2urDsuAq/O+TUzoJSpsvVvcl45Bq3EfU3J/LcdB1FPsRUNlSmVLy30to3eQ3Av
 ljGjybhdpj4tYRzGH+yx4LUxXRPqQxqRC2FWKoHvjBte0Da8hqqu30ngxg3SqKaRXE6E
 ESRB2vLCgjkpAkDFdhFQuUfGDmVYwb0JNfChsSWTR814ige+UedErZHhF1jQxjLSatSK
 gUdw==
X-Gm-Message-State: APjAAAWY4yqlGaqoPxPBvUVK3afd5LdC1cv0ctWH97BxE30BK79mCKAy
 ILvawpXbmYupV8LwQ3xtLuggSA==
X-Received: by 2002:a63:e80d:: with SMTP id s13mr475383pgh.134.1576640748924; 
 Tue, 17 Dec 2019 19:45:48 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id a6sm567390pgg.25.2019.12.17.19.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 19:45:48 -0800 (PST)
Subject: Re: [PATCH 3/6] hw/net/imx_fec: Rewrite fall through comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5f87b5f-b1be-9d7e-b57e-a8d9f4ac0127@linaro.org>
Date: Tue, 17 Dec 2019 17:45:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMENUpg7svuo

On 12/17/19 7:34 AM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=2:
> 
>   hw/net/imx_fec.c: In function ‘imx_eth_write’:
>   hw/net/imx_fec.c:906:12: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     906 |         if (unlikely(single_tx_ring)) {
>         |            ^
>   hw/net/imx_fec.c:912:5: note: here
>     912 |     case ENET_TDAR:     /* FALLTHROUGH */
>         |     ^~~~
>   cc1: all warnings being treated as errors
> 
> Rewrite the comments in the correct place,  using 'fall through'
> which is recognized by GCC and static analyzers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
