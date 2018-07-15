Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp136968wru;
        Sat, 14 Jul 2018 17:37:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpevfVnDxxirLQAaEJ15/HMY/PTqw8ce+hDgyo8hfhAuN9Wd8ThzS6W7f1BW93YWtTs7uR/Q
X-Received: by 2002:a0c:c602:: with SMTP id v2-v6mr12958052qvi.31.1531615050038;
        Sat, 14 Jul 2018 17:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531615050; cv=none;
        d=google.com; s=arc-20160816;
        b=YduzpnfpvxbUlofCEZ26186si6D6dJbuyxONdy2eSvCAS3y94fCTMx7fzXsYdfK7t7
         59sK3haCGIddBbar7U1q6Xg4hDI4h2HhlQqZe1eVwCug7eUmein0V77ot7uzCoQ5pmVh
         MZ7OZd/tIWKYOBwaAESW4+qEooRPR1nTjXjAQVR2fOZ/RZ/FaLG7TRRy7BkFDbUEPWPz
         lVpdARWiRwZRCbY6uXBkrJaFhOvttY/xtxWXABkys8A4wzomVrMr6sl7pMGoImCEFNUR
         uHRGOj3mtgl7YrraheS3OsFFoUgFTutF8w3pst1OkPvtej5iggwxCAcP61lbD2FVa369
         YNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=sZgKmcwktBeaPWsMA9PlqdRIkEytD6Wv2V3aB9sCt6A=;
        b=d4fcNg/idoMbX8P/WFUHNRkYz9L13IJREtD2v5tEMs4SGWQCd3nfaoqQbAV9LzkWww
         Wr+QCgqVR8Ntmb4Gsqy49w090s+bc6nOGm8GYIuUqLQPlNI3iTGeQ4kMVTu0M6k8tnAo
         nQ+x0Q6MCHFkNqJuqcsAiY9PZg1l2mjXATYazLBgwHrJ9O3FQlY1bbi/hh5+b1NZJ1Xc
         dKjZzXkjg8x8VKW+Uw73elanwXRbqxzjp5k1duniDPCqelAc5ekJFzipgl49LUcc47H5
         PHZ7pSLiDa/YfBYPqpi/qgQnwqem8lnXtdx1GD+jdQyVUwArb73uBVx8rLStepbQkwY+
         LkDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u7OgiSYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v50-v6si2149874qtb.311.2018.07.14.17.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 17:37:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u7OgiSYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feV2X-0003cq-Ih
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 20:37:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1feV2L-0003cB-EK
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 20:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1feV2K-0002y3-Hz
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 20:37:17 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:36479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1feV2F-0002m6-QU; Sat, 14 Jul 2018 20:37:11 -0400
Received: by mail-io0-x241.google.com with SMTP id k3-v6so34539165iog.3;
	Sat, 14 Jul 2018 17:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sZgKmcwktBeaPWsMA9PlqdRIkEytD6Wv2V3aB9sCt6A=;
	b=u7OgiSYRn3FVcUoGeYkEV5yl+n3PTg3uxu59b6br/eB5d5kFpV4L1dxng58oYGqGFo
	7nS+6LzjnhPDxr/eVAWzp9PvjOyesM3pwyIxAPluR/23bUUn+y1v8fmpb1S2R6oHdwpb
	02ONosD0FDhGbikQXtBC3PPs6aVeYU61zDUEJjQZEW4FdfEuKwFdouBQaTkENzjPUA28
	U/VlDpB5M8VIESUCLy2Bxq97WrwspN7UpAY/fzOQd3WP0R9M7puYi8+xjj5HYPoLwc0G
	HXvucGdB6+jso1jYkjfP5soxPt5lYhHMWD9sY3CbPMtn8wmtWiyxxPtBLRfHEkZybPJ7
	dqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=sZgKmcwktBeaPWsMA9PlqdRIkEytD6Wv2V3aB9sCt6A=;
	b=BPmW4P2/0u294kcJ+01PR8WiHj2EGkSOdIEOcXDYmCldpc3Ksua7NiGz6BPbgtllx/
	0okIHrJ5uazcZYFSSuGGo1BigrL74VJjyPO2NX6OfdtM7S2vU7Vi/eMBst8yPXzEWlpe
	YznRc14ITyHdODTDrRx1LAtcBDEU3RK4RWXXX6dY0qRGPu2E1bCQ5P4C0u4x9sskApmK
	3RSno+5+rRUsVew3eqOknB02tDzxsvTwBOoK7L7ZdK6/KO2D9TQ4m52KtJUhk8X3lCxp
	9aiRUBQlUY7r7122YZuatK5x5kk47O5Qvr6pT8AvKiCQDoQepFvgvjl7nnhClr5dTqs0
	U+IA==
X-Gm-Message-State: AOUpUlG8fmIQRLyxbTKEXcO7EPG+7eQoAVViLZYaGsqeiV3hTUqMod+a
	N7wUn9hgWayXOX3sU0lI6z0=
X-Received: by 2002:a6b:28c2:: with SMTP id
	o185-v6mr3298655ioo.109.1531615030725; 
	Sat, 14 Jul 2018 17:37:10 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.12.170])
	by smtp.googlemail.com with ESMTPSA id
	w5-v6sm5749738ioc.58.2018.07.14.17.37.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jul 2018 17:37:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180713150945.12348-1-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
Date: Sat, 14 Jul 2018 19:37:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713150945.12348-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [PATCH] accel/tcg: Check whether TLB entry is RAM
 consistently with how we set it up
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRCibneZNxGS

On 07/13/2018 10:09 AM, Peter Maydell wrote:
> @@ -939,29 +935,21 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>          }
>          assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>      }
> +    assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));

Don't duplicate the assert; just move it.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
