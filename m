Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2711708njk;
        Mon, 27 Jan 2025 13:03:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSpmb2qfI4V/+Hh/spwjtl4TfK8XtoLiI8DXuDFOzKRRnIlTHVszbVgHhSR6AvpJm/w3LjQ+86yrvbwA==@linaro.org
X-Google-Smtp-Source: AGHT+IFCqElHB8G+Kc6r5E4b8gUIEJEvG1v5hie8EgaDi9qw9zyG4rPhni98o5bf6F9vRHxKzXFO
X-Received: by 2002:ad4:5968:0:b0:6d8:aea3:e27 with SMTP id 6a1803df08f44-6e1b223ad2amr525160046d6.44.1738011805018;
        Mon, 27 Jan 2025 13:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738011805; cv=none;
        d=google.com; s=arc-20240605;
        b=AvkEjd+/Xrp2IYlNattuyn37ferc7h2PYPLzpKi88a87TzbEydbekcY8bCpxo56q5M
         oYr49Yc1Z9tAjr+1ekR0qh+2KBeShbKN3gfT1hGnk1SyNfWBskidfWh/BTx0tVyBB5Pm
         yjcE+/XFihZULJQAQvA7UiX01tD924ekvZH7dxaE+U6JEsX5jVJpHvZ4oBu82v3SGUyO
         oCUlpcxfyN2DRAXbAQdT1h1MSxmEqtuma3Fn/KPMETrL11dggxx5Rg1s/sV0poRkjLoo
         VX9Y1sCYDcAt1AoXr/q/2b/6DcAFwoMA5hqgXaQIyHOFksiPuy2pD70zPfZFbxKY6Ffr
         npSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YtP6v629R9AhTit9oytNBZMXV51Or2oSLikgU2s5c74=;
        fh=V8ZSHUyeXaJEF53fMvX69IqnPlbLQvKh4CnbFVc038s=;
        b=B02yLoxJrtDLEPLuk1Z8vy43f29TtskU//oBz4XCbz4YXRI7XBb2fhqbLMJ7eOC4a0
         qikLsIXjvD828TegGPj065KQY74K2Oaad40jclSchK/pO5plB5HnjMxdk69Se1NnejF9
         OBPo6ccLykNGVd8H37w/x2cMboFlwux/sxW6dgdjglEa3sN+50QfTqNgmADTOsEI38/S
         J0GnG5qzpLeHUZyflBi6L43N30X/KkkxhS5YxE8nKTYHIHwiyfAyi+7nKTqjq0At1u0I
         1Pgc88aTxuwyRSBCwFA256a+B1zs0jaYthXCroz4z6yelqKkxGU5Zfa00iKOw58NFhPX
         TRTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHsKyitm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206128eb6si118509306d6.441.2025.01.27.13.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:03:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHsKyitm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcWG6-0001CJ-Ne; Mon, 27 Jan 2025 16:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWG5-0001Be-Au
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:03:01 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWG3-0007UD-RM
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:03:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-215770613dbso61290985ad.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 13:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738011778; x=1738616578; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YtP6v629R9AhTit9oytNBZMXV51Or2oSLikgU2s5c74=;
 b=oHsKyitmTYX4686IBZvnsOgEykitk7M3GEVryrETlc1uAtQYKUNzg2yzHKcZL2NdfR
 2GvHMYZwwjeCd73ZKMlJDpU4rgfPrbeFPWQ9yENb9vTJoVdVQowzd7zfdvhJsFIuSgyf
 cZCxAzgjLX3yOBRzGYpcM9iZoi9+SlRKPWSxm4TWqI09aCkdH/ik3FysJpShEu4n3/l5
 YGcFNxM0uwOAz+MwyDKjqXD71N8255nNM+5lfv2YzZUlYQzD788GC7isebIKLZz4ir13
 Ji4jFw3xeTPoVJKpIW+4dOqOT03/cFhUCCcVXW54vlOKZuCzW6KaHr+BEju7JyqOCeKR
 UWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738011778; x=1738616578;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YtP6v629R9AhTit9oytNBZMXV51Or2oSLikgU2s5c74=;
 b=nAtLEKomfiBvzu/TlnZq4XyxwgF01jmhcxkQXgMAqplpf1eYfSJO4L4RXxO4N+m9D3
 oSTUo+bOaHxNq33yke4BOwZKyLAY6MgpY474kgP3pvGysKCOSu6ra5sePlngvfocT1ZU
 zEHp5O5XaQV0nc2TMNtGAYsbSj1pt/BfwmpY6fdbSOGU45kQo5TDFN1vuD+o8rFtvpap
 Scy70VOKkN/WPKHv4KtXyHql9GjGPKh5IkgrD5GlULX7AiGUszcYu9vqIoURQD0GbAn2
 4+IDeuonnxw7KV0e7wbSZ2w4wiDn68IzuNEcM/pveZBeihM7N9f6mFmb7/38yiO6tgbR
 pcOA==
X-Gm-Message-State: AOJu0Yxpj0kJr1njz/Aj9fTNXpPsbQPKvx03XCuyCB5r423OZycC21ib
 PLmv9lwYaC8WvBHQjgUJMMlgRRSX0D7umma/xMb2yt/59wOU5a4bi/sM1n1D1Mo=
X-Gm-Gg: ASbGncvpOmiyJWlQp/7w2Vh1BAmW/bfrzwS2KjVQHG98JyebcEYE5osibCnsk8Uf0cu
 FDhX/TS++nrDVJLQt6WtL4OW+Df427KpyI8xpONGn3MKKqcRGUO2+4MHBH6LfvlHtWCJ7gd3gHx
 RibYGsd1sMXPaVxNDjnNe52d4bLxtSonksJBdcegwwyNFrxpUirljRxMopULxysYb/pA8A0/+49
 Kdv4CAWFAf8/lQEGws2/JW0nYmDrrfu9z04IFhklHhrcc6HuMcsofygU1oSOvjDzK5DvmbQKZwC
 7Ysv3sytgXKhok9dES5V0zjfswtJTiSDfJDGW72/SLW34W4=
X-Received: by 2002:a05:6a20:914e:b0:1e1:70ab:b369 with SMTP id
 adf61e73a8af0-1eb214983dfmr65788520637.13.1738011777822; 
 Mon, 27 Jan 2025 13:02:57 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac496bbd9e7sm6764996a12.65.2025.01.27.13.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:02:57 -0800 (PST)
Message-ID: <27599be5-9669-466e-8e34-4ec0831c91cc@linaro.org>
Date: Mon, 27 Jan 2025 13:02:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Deprecate nwfpe emulation?
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250127112715.2936555-1-peter.maydell@linaro.org>
 <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org>
 <CAFEAcA_BF_b8r8cOJVsk13qEQZg0BS5F16s9M6NFLQVHZBfq4Q@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BF_b8r8cOJVsk13qEQZg0BS5F16s9M6NFLQVHZBfq4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jj1D14Fdw8A+

On 1/27/25 09:46, Peter Maydell wrote:
> On Mon, 27 Jan 2025 at 17:27, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> On 27/1/25 12:27, Peter Maydell wrote:
>>> We have one test case in check-tcg which purports to be checking
>>> iwMMXt. In fact it is doing no such thing: it runs the test without
>>> selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
>>> as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the test
>>> prints garbage and then succeeds anyway.
>>
>> Uh...
> 
> It had me confused for a while, because I'd convinced myself
> by code inspection that we only enabled iwMMXt if you
> manually asked for a pxa2xx CPU and not in the default 'max'
> CPU, and then I found this test case that we were running
> with the default CPU type and which was apparently passing :-)

Any chance we can deprecate the fpa11 stuff too?

I see it's still enabled by the kernel for some boards,
but it depends on really old configury:

config FPE_NWFPE
         bool "NWFPE math emulation"
         depends on (!AEABI || OABI_COMPAT) && !THUMB2_KERNEL
         help
           Say Y to include the NWFPE floating point emulator in the kernel.
           This is necessary to run most binaries. Linux does not currently
           support floating point hardware so you need to say Y here even if
           your machine has an FPA or floating point co-processor podule.

No thumb2, no eabi, and oabi_compat enabled.
I suspect that's a very rare configuration these days.

I'll note the help message is somewhat dated.  :-)


r~
