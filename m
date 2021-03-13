Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2314336lfg;
        Sat, 13 Mar 2021 11:03:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx88InkTYKa05Fm112KVKXQ/IG5jsqveMz47gMUAmJIZvpXOqON6TK0Waeu+imZ/sFNIJax
X-Received: by 2002:a02:74a:: with SMTP id f71mr4089305jaf.30.1615662226789;
        Sat, 13 Mar 2021 11:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615662226; cv=none;
        d=google.com; s=arc-20160816;
        b=bO1+Xe29RDt7Ad8AtO1QU/JFhuBxTNEgawMkMf/wbkYWnG9eJAPMoCBj4Txrl0N3mK
         3RlSud0YUWF+ZFyFeJaL8nTmr2ElWdAuuRAYNmixStRqd84fc47fF0J/DkOJ244BL/KK
         1quoI07sQnL3RMknBzolxnvjlUmQRMIpQR7yS+6ZByOCdgIgIpabVUkzXE7Zn8ugoPLW
         8hM/NMHlLj4uljT3sIy/ig2bz5UH5pWTWkCZoxDKcjB/7f9sSBoKTTVrV3cQoAwsYO6C
         3BwVRChxUvN/g/pZu35bLDWyfiwGgal9GjTbU88fQIMPAeWdHJJ47DFgPIZ7eu+IgW1I
         lLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BtrUSNey5yYk32ASsnH8jpLrBGqw39LoEt+S5CSmbuE=;
        b=oTMxtC8qBLC2mk4eGFj+s+CkLOUiYBzMV6aOb3T23usrplNErBgj6peDWWpdBFicT+
         A5XmkvGjrYdoZH/6ExobmgBDBayxokzz6mHO56qKKQ0y1/TCPgeP8REazopq5xXGPvx+
         xf7yRwIVuOU/fLSKWYgeUWTX1eA3FsPbgH3WDjKp3dGk9eFunVB8Sn0MONebtg6F5u0Q
         D/ThPvpFjXFmzQrL0jvCyDdUBJZhnpTFlV9juxlQLxzNAAzyuieaUHJ7653woXqeyUTj
         Ju15TBd5pw4p8H0PItf0D8rEzCa2Jv7net8CeCrfxbNeMzioKRbymyixJUUgXtzlWSbX
         JCwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQaMXc9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si7970834jat.62.2021.03.13.11.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 11:03:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQaMXc9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL9YA-0000F3-4F
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 14:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Xw-0000Eg-Ue
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:03:32 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Xv-0001dQ-Cg
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:03:32 -0500
Received: by mail-qt1-x82b.google.com with SMTP id s2so6439471qtx.10
 for <qemu-arm@nongnu.org>; Sat, 13 Mar 2021 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BtrUSNey5yYk32ASsnH8jpLrBGqw39LoEt+S5CSmbuE=;
 b=XQaMXc9U1SxHWTYgMxms02j8GHmUnSj18UDOtGwcbCBvQAlBxYn0nmi7skV7FilGMd
 fnchIE2kuekx8uWAI8S8MA25Hp7kKH+oNObraY0WslfLEzQo4eb2nxYp7rEzNw2BzfTv
 T5WP09WWmDssN6CRC9IWi++5E8tjexIzYaIApSr/2dW+fb0gkuvWuxIi60/XAioUj0mH
 9JKkgTM90wBroNQvtl5XuxWAk4zcXP7y5HdW7BgFb+Ms5tZwH3A1/Tb2EFcgK1nUiRuU
 AWUUallAT5qKDV65qdgDkJRpZf/r8aVNRKfm3IJFhluYfYZODl9I9weW7agepWmO8I09
 rlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtrUSNey5yYk32ASsnH8jpLrBGqw39LoEt+S5CSmbuE=;
 b=mxRfi4lY1K2mFdC0wKr+kjC2AGj30MmGCjga9vrXOanzt8OYcE5ajJUDCmdqYawyEb
 Ahx3zWhKsGDSnQaVggslXkrL0LV24CojYg9tuTrU+LIwJL7BW8m+cHijPV5cKg1iCbz/
 t4iwyqMZxJ5K5//QEaiyuZIbT2cvhIpAxafGfc/aVvNSnLrYYuTZxJHrP46GcASmrVDX
 5iYd+8JBhGfq//f3ncR1sfYes4n4oJNhklkCoqRYnidCpa6WPXMghdiZDZbWwXsjxx+j
 8EqkjUqq7gwTnt3L+vVnZQKPhMar77AvooS8VV5wGtnyroU1IuX++roakWbHB8Hw1g3U
 tVww==
X-Gm-Message-State: AOAM5337Hw7fSZdfkBMwg23SogoIUU+luELZcHZzoorC6LCI0H3uec2O
 rl6FfV6DuEirqFkvYoxzSfjU6Q==
X-Received: by 2002:ac8:6b85:: with SMTP id z5mr15521280qts.296.1615662210395; 
 Sat, 13 Mar 2021 11:03:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e2sm6526486qto.50.2021.03.13.11.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:03:29 -0800 (PST)
Subject: Re: [PATCH for-6.0 2/2] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <20210312172939.695-3-peter.maydell@linaro.org>
 <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92fc3ab0-5897-0c96-eebd-8b27951265c7@linaro.org>
Date: Sat, 13 Mar 2021 13:03:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ts7B/S9F98UQ

On 3/12/21 2:17 PM, Philippe Mathieu-Daudé wrote:
>> +static int find_rom_cb(Int128 start, Int128 len, const MemoryRegion *mr,
>> +                       hwaddr offset_in_region, void *opaque)
> Return bool maybe?
> 

Yes, it might be worth changing with the first patch, while we're changing all 
(one) user of flatview_for_each_range().

But he can't simply change it here -- must match flatview_cb type.


r~
