Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3867021dye;
        Wed, 2 Jul 2025 07:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhyk/BX7CqbpnWF84KB2ogFUtGL5VwSx7QCUsnT4dYwZ3Lk1J8yUewWD+U4de2i9NzN+rpZ5xwRSHbxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJ2+uLaKJmA/u6TkoWlgRmMoK5Bl0XgZoTp3h48Ca6Kg02yU065tHPak0LdsidATZsasCG
X-Received: by 2002:a05:622a:98b:b0:4a7:c4d:1a51 with SMTP id d75a77b69052e-4a976913b28mr67889901cf.13.1751468016087;
        Wed, 02 Jul 2025 07:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751468016; cv=none;
        d=google.com; s=arc-20240605;
        b=MII5aj2ggVaJJBsf0hn5nh0GFuDc4PYkxVm48RRU9Za120cQI5ZAZGytUvRmHRMtO2
         ecpR2xH0C6SWn2ngGDAq0P1JXHtF34qhqn6QikC0b41XyI2HgB40WwhuACiO1R4taNzS
         QHhLr2H0dbOXZO62m4eQYz7wJBG/hJSDi3c8fwQXuI9Tlo/SyKi/6Fnume80ZxPfG3hu
         hyVeBJmx/I8wBYE2TZ7nnbbYUeNGn8/buppRe2u2Uv+powc2VOQP5p4N7QZ0xedeDJHS
         kjr1yLGLhbOrykoTFRBwo5NU0lEuvuEhunuLo/EyA3bdM/ObkdGXqI2NPDimwVz82ZLI
         3cWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kwWpTNjg5xC74r+Bbkg5UnuBhFFvSK+AVJZR1e1fL7M=;
        fh=qzncoh899YCO2RwJ4eOkQUSQ2cIKhAj7MCgz1Qe0cU4=;
        b=VQq371qti0zPPiPNyYFhy1tRvQSLitazjqSlXs3GWfeGpdAhEhwQChtZotXA67eIki
         SLimbZxeJNV51bm97xg5/hvti35YMDp4z0y5Kltocq917PKlsweFw+CFGeexG6Ji/6rS
         QUkKPi8gNWdsuvqH2r5aTQ532Sewper9yer/KfX+BuD54QfMEvz57mtzfv1SMhc7FKZ9
         GRxzheAavFl+JxD6RMuxw/qVa491pKllMX/qi+TQesgwhGvBgmCHtGzylmzpsSzMUq+B
         xdezidK62uh2yKr4nuN671i7tq/H9Kh2jr1ZL6g+dGu/gQaC/jJoypF11YrT5Mo0MiCC
         sU9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qa0LweD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc24030fsi135245651cf.408.2025.07.02.07.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qa0LweD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWypy-0002Ai-Gp; Wed, 02 Jul 2025 10:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWypr-00023e-Bc
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:53:19 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWypl-0001bS-HP
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:53:19 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-610d87553b6so2761067eaf.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467989; x=1752072789; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kwWpTNjg5xC74r+Bbkg5UnuBhFFvSK+AVJZR1e1fL7M=;
 b=qa0LweD/CPX6Y1lHAL2feLOpzoq66+z39hDF+/EnFf1VCSTwYfp0vKnDZOD+KKdi/6
 DThjM6riz3Fhk90wRtggCISL5jCMV3YHkQWb5mmW6813aWEq4c3eISAaZUsKZVPRz2mE
 mHb5KOSZRUHw+9rGclTNl1lDvRnC3CtzZGaShwB/MdPuDqvuM3Rp9L6VO7+RpuKdWzxJ
 Rc5avcwug1yKlBmwen814M3vbXDz2KIeaPdEPmRrspVUfSO5pzAYj/3qYUq9BzRA7j8X
 kPbWTUbNYAnLX9SkxhDk8dGje+ulGeonpICejw7vinomXq8IA373r/sCpHps4K88Aw0y
 BXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467989; x=1752072789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kwWpTNjg5xC74r+Bbkg5UnuBhFFvSK+AVJZR1e1fL7M=;
 b=LLc7aFxFsuVzEB+Av4fAOzTfCx5jBtaMdiDBrNhh6/tuYnJgnsrR8A8yCaOeq29sgJ
 tahHrnj2hdPZTvSvji3nQxXh8G74aSBfMAzKdBScuodcgeTNsCh/27JnPsrE2phuciNK
 t0vWfFyX/UFTVrshWjM+GyhDRVUF2OqAewcbOiEIM7Y9ET6I8kUis0CsOVpLKBSDcmmP
 CgAci49+5TqhJhA6NtOgze0I2hDegmuVNuT050Fg0PJhSkZvD4aX45fNbcuboxbAS+y5
 /85djAB1BReePqtz0RLYYPHLmT5217AQQsCJP3ZEJwRfwMUM516fE40jdF/5ORSnYn5p
 oJDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNmNJe7IW8heLEgqYoRpFlZc85PSgvhmX7dZ9hT88fCaWqtQvgk4neGODcx4/30VmHrSCSmjcQ5Q==@nongnu.org
X-Gm-Message-State: AOJu0YzBZ/K2X/+xhrWzMb5ej3OHvSrXSIFv95i1bmFsTxGFcsOSqFsZ
 ZNLA01BAYRM+8MuN96S3vmmFt4hb1JMUyosGbQxLOlT0h5r2vGkNyCE9Y1TU53bmtMw=
X-Gm-Gg: ASbGncv99DLU+3yzsdNh2++PmHt7tYVlmyseyh2gv5jKiIlJC/LKk6+Rq37aVqrNuk7
 lJ90gHtk9x67PTHBLeSymYYmjHpzBtyAAR1hHqtK5UFFFS5wcbXGDTkykWVsX3UiaRcHJkmtMtY
 wbOzDSgsdHXXHKUvVQCRdVpeagS/WKuOr1oDHZpc/zKkKfLjs1YEpQhpJlO5B/ReptUlK++n21X
 rVliUMTyiMYcxhbwzySi4K1J7sDbz6UYklJSmMOAkxh24A2V5FB7md+fto3ouO1lKyzlwNTFc9e
 gl82N4Bg/kCe/KdAA2Iggj2W8FCmeWQmORWT8BO5h9TWPx3qEEg/qUgJkuJDZFgaNwG8sFek4RL
 C
X-Received: by 2002:a05:6820:a09:b0:611:ab35:8025 with SMTP id
 006d021491bc7-61200e1610fmr2203009eaf.0.1751467989058; 
 Wed, 02 Jul 2025 07:53:09 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-611b859fb13sm1694908eaf.29.2025.07.02.07.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:53:08 -0700 (PDT)
Message-ID: <7847dd0b-271c-4e1d-93ba-605630464ef7@linaro.org>
Date: Wed, 2 Jul 2025 08:53:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] target/arm: Fix helper macros indentation in
 mve_helper.c
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-13-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-13-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: e4Uwn/V93a//

On 7/2/25 05:19, William Kosasih wrote:
> Recent helper function load and store alignment fix caused the continuation
> backslashes in those macro definitions to shift out of alignment.
> This patch restores a uniform indentation for those trailing backslashes,
> making them consistent.
> 
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 268 ++++++++++++++++++------------------
>   1 file changed, 134 insertions(+), 134 deletions(-)

I'd fix these within the patch that breaks the alignment or not at all.


r~
