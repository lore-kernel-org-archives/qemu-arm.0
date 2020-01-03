Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp19631933lff;
        Thu, 2 Jan 2020 17:20:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmBDH9c8ScxOy3WKsplBkpZBIaYYyXYH0KOH28XjE7Mic9czTawuUrQQkBBuTdPvU9wAWz
X-Received: by 2002:aed:256d:: with SMTP id w42mr61456075qtc.385.1578014442583;
        Thu, 02 Jan 2020 17:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578014442; cv=none;
        d=google.com; s=arc-20160816;
        b=qf42KpMRW/afH4SLT6Y3ip0UlpevY1ic23s5PUNCc8cQrwo1P9XqKoEVEo9PNi7KEh
         Clq58ARcGDAI1Kk6VkyRioQA/IRxqTKYSNL+Meh/6T20cdYu4zRoWl2AZY2d6rm5xaJY
         tZF4hTKxBZ3KqmKwQx2XwnVvPPJeSHthscJMEckmbrEDNSegw/mC11sIP5PIER94RKUs
         MaAd2aaTNmp2OH14N2ptGX3xTu64hMRu9togaS2Mwzza+fXnlGDsgyI7Fmc14kT6iDtU
         OTS6FyXqPzijtnFq16pc9aN2oQLICsgK2hRDArJJ9+HBq6sbQD0sUah0ypRIFcsflMtC
         OQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=GD40s/tUbUanspRuAIelM3ult2DJvl9iASATBW5QYYU=;
        b=nwhGrcx7FBP4MBrjPc7r8K+eMSz8cACKxPpommmjOlHKClSJa4dsOamssIwfmA0PGb
         6IFpbm+m7bG08LAqcztD53yQqHnAJT36MKwcWSfcHs2iFpJD6CF3xgTbcdjjk9ZzlbgH
         PftXSuJgT2Rl34qQwQaU0fWNdpUveEs2cx8WkO2zqi4csRpWUSSLPRWUWMq4p5GGvA97
         TOPhwEifASE/OoM7c5fEnjtXV8wqbbOVbEu0ZDIcY4zTYORvzNmkWj4/eepyjcxtty1r
         HlUXaXbSEv9zF+8/tnvelVLV6gXRbf/QsbRY/G4rygE4GHpSRPm6p40wBNdvEBnH3tyg
         v6xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A7NS7d65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si23234751qtn.359.2020.01.02.17.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2020 17:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A7NS7d65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1inBdp-0006bR-KZ
	for alex.bennee@linaro.org; Thu, 02 Jan 2020 20:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rth7680@gmail.com>) id 1inBdW-0006YR-Q4
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 20:20:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rth7680@gmail.com>) id 1inBdV-00048Z-Kh
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 20:20:22 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rth7680@gmail.com>)
 id 1inBdQ-0003zl-Qf; Thu, 02 Jan 2020 20:20:16 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so22826972pfn.4;
 Thu, 02 Jan 2020 17:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GD40s/tUbUanspRuAIelM3ult2DJvl9iASATBW5QYYU=;
 b=A7NS7d65+KO8/AXqM5iy7u1L6JLo7WvBT8ZnNh5dl+axIPPv2VFPaKnwrqy58lgcc6
 IrJ9JQfxteR8Ip7kklMCodxf0PPZnDMr11NaUGvoAMmjCMUELa3k+zyL74U4w4ZAzpeb
 K6IV9xHpUzVCo0oq3TCJUEtCsJ9i+YPt9xgj05FZwaIUfRM5pHEOrba/2Ms0O83QbPgO
 hElZVZswZUT+fF38zFu2CrXaTnDvepU6rwQjQ+QO8JSNRioe7f2aVNP/HJSP/Qm8cD2y
 JkhiWCBB+E3pvdO6WfZElTMhT1fZiU3p59QiJWGmO203qRvjvpAmb2Sv7ti5Ij+BQ5HB
 Nl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GD40s/tUbUanspRuAIelM3ult2DJvl9iASATBW5QYYU=;
 b=LHutVAeq3ricvmXq3i1S46ORWEsKRTdlWEyH9vPpCSDyeMKQJlat3U7yvgBf+TGaSl
 YF/SUhyAQLxfpckOdmedpa8RosxmZPGaWQ1GDgPOiToj+4sFUzDdMYgc2ijVAKzFOXOp
 GwBRTjgn49/j8nyR6FXFap58G1rQKelHSmOJ8MurRwyP3aGZJciLlKucpFqu2a/LDkep
 7XVL3EWCDoB3L8vW2zwAtlaVPTn+DOQcM+U+up0kJ0IULrm19Gg6iXIStnec6D3vy8ok
 yKqqAqFfWihDlc74iampnZIst/0lQuG+XSry5jWobjecuU8TBWuXge3hUzmYQTweyaSd
 nyWw==
X-Gm-Message-State: APjAAAWsY/eLeG0pyLKyJttjvOo5Ey61T1hlgJj/yM6sTOGxuH/ZJCqO
 aqzHFHlERLJ8U2gdVFHSvrs=
X-Received: by 2002:a63:484b:: with SMTP id x11mr94312119pgk.148.1578014414825; 
 Thu, 02 Jan 2020 17:20:14 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22]) by smtp.googlemail.com with ESMTPSA id
 o134sm61034779pfg.137.2020.01.02.17.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 17:20:13 -0800 (PST)
Subject: Re: [PATCH v2 0/4] tcg: Include tcg files using tcg/ dirname, reduce
 cpp search path list
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200101112303.20724-1-philmd@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFYBBMBAgBCAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAIZARYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweUY
 BQkP1h/pAAoJEK0ScMxN0CebqDsH/0YyfnXk+Dc++H37VCEKgRet2i1ATFzxRnifkvmdxha0
 V+PVptQ2fwSe+w3KxoFecD8W75nysmUjrU/FicW9yU5YRlGONPZjruG02/KzmhA5PzWJdYO3
 i/t0qRayvWIcX2qA/flsXEbmb/BbAFM05LQIdcOu74eiBFe5CBCOWBDJeneE1urIE0hSYxoh
 nCcG60ULrNj13ohZ4zAEluoY32qIo7/OPWmtR88cPrEbZT8k+RqgZbsotzaPT1/RlL74fL8k
 ofYfTgKAFH7eEy6fF2nzDp2GThVn+3sA62xtpSXUf/X1m75B40KOcq1EQbHypNTmBc1wt13e
 ibhPNEVX2am5AQ0EUa4sLwEIALITHfH3gciRNfQIe7awDTDvn6H3C6gDyCAnv5LiuLTLZiyK
 NZp3lNO3rPowyKrGT2RIDlumlqPgdeHzqEEX91YK0yk2vdFvwU04rJ4D+qRgdUPoeICLD1zo
 PwOv2FaY6Tf8dKYas1RHF5QU5yQNey8j7IYYoE2yGPn2PtBmvtmK4iLataUEvx0U385Zr+jf
 HscqwTiToryeDC8Io/9BsMvAssE5Yf5URS2nJ7LFOvc4njsQJPF1i9egBXaIloqv7p2hVCKJ
 Hl5UWIxitQ9QQIl6iU4LCpz8mVYTXwv48IAVpbUf7+ak9V9Kk3jCeQnlxCJBUHjUhoIzinbS
 JHPHtkkAEQEAAYkBPAQYAQIAJgIbDBYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweVIBQkP
 1iAZAAoJEK0ScMxN0CebGHUH/RtouOlWl6To97tQsTJUq/2YwmRpFOsvV0/zCX4fKBGAbeZi
 VaELSt2+3UEErA+n8HwbQmjJ6IrdhA9GustOpOyCcbLVSMwql/OlAwBtDzCcC8dTU4zcuY2a
 rGG2A8i5krU85G9r1wowVcWZBsdmW7/dKiNoadLQiig4bHNiSaV4ograas5efyEjqTxiY+yG
 hzPw5DK2kbp2co8iDF1vW0LWPeLFBinCgItcI9LvgHWaB3rwjOfvNpMn5m64SoQYHB8wbnid
 erAjOzkBzmqnfS1tAUr8mtESStEwrEmNv0ZoA6S0Wt+c9pyTr+BpG4OFlhj7ZI+Eh7zOrr33
 q9OBIdA=
Message-ID: <ea560ebf-7ae5-a72d-2f03-e7097ab0ba8c@twiddle.net>
Date: Fri, 3 Jan 2020 12:19:55 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rBkS2Vjjm/9Y

On 1/1/20 10:22 PM, Philippe Mathieu-Daudé wrote:
> Noticed we could clean this while reviewing Richard patch last night:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg667606.html
> 
> Since v1:
> - moved headers to include/tcg/ (Paolo)
> - include in .inc.c relative to parent (Stefan)
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg05356.html
> 
> Philippe Mathieu-Daudé (4):
>   tcg: Search includes from the project root source directory
>   tcg: Search includes in the parent source directory
>   tcg: Move TCG headers to include/tcg/
>   configure: Remove tcg/ from the preprocessor include search list

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Will queue shortly.


r~
