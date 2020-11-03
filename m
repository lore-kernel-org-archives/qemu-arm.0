Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4954178lfa;
        Tue, 3 Nov 2020 08:44:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKbAhktTn6Oe0T5fRCCaaFq4YG3NQPiR7iAK6gxRx994E3QPqMHjOdCoG5ObCf4aJId44a
X-Received: by 2002:a37:6812:: with SMTP id d18mr16527849qkc.359.1604421853289;
        Tue, 03 Nov 2020 08:44:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604421853; cv=none;
        d=google.com; s=arc-20160816;
        b=lI48IatMaQD9hjIlwm0ztsLdMl5YBdjBTu0ZSkHLPbMsGaIcqXzhKC9WwCf+uxrMIo
         LeF9J/htfEKExmdm00Y/PkOlnSxD0MN9P4/GT4EY2a3K0gZXgS4qML/TD0h98xCqKalR
         z4n/EJl7l02AWB3qLTPM462+mUFMP9mBjRUrk9HkgDyrMQAguc7B5BUO+nAXU6/3e7aF
         SvdhsjpV1uRBrazNnZcLjluzX4wYbl1/9DeW/E95alyiMePxqloUUaL9aapFT1zPSShN
         XRIwkmumoGHBsssdVY4D8pRpBi/xZni0htNzIwJb4Dv8IZHKFn09E/i6qRvI8jMHj8N6
         Gc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GtDxz4VHdqCjjsRzEBN7Ul/zlklUL2LXi+mieqcgLV4=;
        b=s60SoJSTcU7uSNvzw0TjPyaRe8vrBL/GfkmrZqIHg7+ZaRIZFZn+HpGT6Xgn5x+aNe
         lKyYthZ6Ax/sSM8PaLo43IXB//xsCmutj3SSLcLNT9n+Jq2djXqWKPkdfKQ5G1PM2tj4
         LPrZ5d4DfzetI4aeyPv/CATXeskAE2QAfMOtkPpxQdN+QB/qKJW6lFDFP1J6BlrdLg9q
         8AWomlwRB3g3iAzRVneyfSHrkhuldQd53Zo9vLKELWMX7qE07P5UpUCfCcDpENt5WnZX
         2GGotyqvop3743AvM7ykddaimrQ9mz5M1UdIFwKjAm2iOseuefg8eWVCMX4rUe1xsFRN
         azQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vigW2mrF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si10288833qtv.101.2020.11.03.08.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 08:44:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vigW2mrF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzPo-0007Mn-N0
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 11:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzOb-000668-MZ
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:42:58 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzOa-0001Jh-6O
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:42:57 -0500
Received: by mail-pl1-x644.google.com with SMTP id w11so8807156pll.8
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 08:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GtDxz4VHdqCjjsRzEBN7Ul/zlklUL2LXi+mieqcgLV4=;
 b=vigW2mrFcCtUCEeSw4d2V25mkdcIWEqs00hnixz9X0tiINgYBDfYQGdczV/GTcmg6o
 WvHgdhfMZYEZtrj/AnsAbl2qV+gNtUlhD8iYnxlHdYfvJuI3/F1MDnKaiLiarS2n3pzs
 lYADkWhDcPl6iezTRM8K7o/g0E6G+sVsZ/4uNy2ljOmnbaZRa5f1fxWj6KrJoj5DmiPO
 k/wQ/fAOOQqxLWuS2zNcrBjjixhgis9zpxapBeqDwATnjQaWWDgja4XfY4W7FlLDXrxB
 VvlmJ0Nb80qizG6/KlROFFzo39Q9GxnF6dyGCU3DP3rtVZmB2yJJr9uC8d8gKuwjuj90
 Js8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GtDxz4VHdqCjjsRzEBN7Ul/zlklUL2LXi+mieqcgLV4=;
 b=cUvCUVTZcTzhjK+JGKs52infvTuqJeHM0VbDHAq8f7p25Wl6T0y4HxRjrPPujXCeIN
 x6EEukCUgJLQL+GTAQ/VLsVnp/e2Pl9+PWWQkXkNDtutZq3V9KL48UTqAHUC+s5raUgZ
 D2IIMO1QHOIlUTxvam0ih6jGl7ON5RCwAd/GVrX6eOov8OFxV6AWQbRP8VBw8HfRM0lZ
 IMgT1vGeaK7Z+3COrJoWFO6IZjkLEJ+aBRunhDgcFFk2iZJOgW68rd0AvQ6bE840KPt5
 jZw9oM5ey8ocjeVpDr1AQf6XAVDgSeAeDWsfj0K4g18BEI7MW56g1Hwyxh85Vpe0x61y
 QjcQ==
X-Gm-Message-State: AOAM5335LIKtw01jqIX/97a5Rw3nOvrCLCmpmCJixM45z5pOlYQtxE3S
 EPVngSq/K2/u6ZMh1TRDf7t/+K+Q/xEbTw==
X-Received: by 2002:a17:902:820e:b029:d6:e802:75aa with SMTP id
 x14-20020a170902820eb02900d6e80275aamr1165414pln.51.1604421772979; 
 Tue, 03 Nov 2020 08:42:52 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id 136sm17764209pfa.132.2020.11.03.08.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 08:42:51 -0800 (PST)
Subject: Re: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c0bbd0b-f7b3-d93e-b0c7-d99822e19553@linaro.org>
Date: Tue, 3 Nov 2020 08:42:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1jynaXnRJ+fv

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This checks if EL2 is enabled (meaning EL2 registers take effects) in
> the current security context.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
