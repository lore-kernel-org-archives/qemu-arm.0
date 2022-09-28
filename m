Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp637787ocs;
        Wed, 28 Sep 2022 16:31:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7AlqAquV8U/1PHsWh9Vshr7YEQ9m7MV9h6IkLXptfahPFHkOJpGwYE3pEwinWgEwzEY/c4
X-Received: by 2002:a05:620a:2a0b:b0:6ce:afaa:b87c with SMTP id o11-20020a05620a2a0b00b006ceafaab87cmr351459qkp.665.1664407909884;
        Wed, 28 Sep 2022 16:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664407909; cv=none;
        d=google.com; s=arc-20160816;
        b=JGSkPeYxakw0KSL7D5ZmCAD15+5st8ohlz35zrLHaBYvprxDTuAoWwwp/kKNTWlL0a
         HbKNlI0c8jHdH8GU7fsJWDja7k4ujl1bxm7jxouv7+ebBOVtLnav1nZJ9ld/Rxv4KiS1
         3fuQGqT8JAh8XgAAOYWzyD8+eeOnw6s3obYYaA32b1iiiDCkHlpT4KQyKjf3ly9vnkxe
         XiOwNvQnF1kKqg5ZV4CI1ldfaVTQQtXp05BQV0cOSbEPYt6nBku1Badtsi2RN2e01Kam
         hGxXdL2eJG3iobsu5bb7/EH4jGzGFvPLnIWpcjWB1+3AYMPFo0WmdmdDe0Ih34AfnBUt
         Pz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p73f+dUM9zbnPz2lB1WH1PhONOp+nBueo+BM9gEHX70=;
        b=oQ7WPHh62WdLfqaVo0n9cI9yM++z0xEZDxe18OWtCvF06IOxCQq53XchSxx/SU5G36
         57AA6ME9lCCtGb0uTVy3csBZuL4PhROWG7ryj9lDcvi2ix4oj/pDSEwd1dvg2qgCLIcN
         LFVZFpAWOdYooY9lD2SyiuX4Parpj2AVn3VbLunoVULZU2ZGOaIIE8qDyqSnUhz6+r8L
         0MPiETqt10b4+i+jETo1c9+Hxh/hlBh1j6ki0SnAPvosm9vGdBej4V06+Rm/yq6Ga84p
         70zoI0VsJfnk8AALjwUGwIYG2fUg0L/yoGJA4oEV4XXzLCPhs7pvGXbE94KcareyqAO5
         w7QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjrqbhK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp20-20020a05620a459400b006cfc1e935b9si407571qkb.185.2022.09.28.16.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 16:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjrqbhK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odgWr-0006ZR-FR
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 19:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odgWD-0006Yh-3p
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:31:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odgW8-0002WZ-Ez
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:31:08 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u59-20020a17090a51c100b00205d3c44162so4276093pjh.2
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=p73f+dUM9zbnPz2lB1WH1PhONOp+nBueo+BM9gEHX70=;
 b=hjrqbhK4Nwh0SrnDEmFdXtXq1FWq8OTAMp5E49ok7A0+meNfe6Dv9A7UlwIu1neoiy
 DZw135q67oOaq9Diydt0LItULiYhlfyj57J1SgRsa/DvVhO2f/borhOTjXSdsl98OKJr
 j/PzsW2rhR18SCOftKr3B4lX9aAqJaHANgIyVo3oL7qBF8PXs/TWxYZmjCeZIRuMQmao
 +VBbCTFTEQ5UCSRJYIQi3CICx4UMD5KqeUSaYORODlVEW1EtH8cROe/z5ztrq1HBAdnw
 Bt9e2GkcrX6aI57IKrR9CltFJVC5HNrqixqOVjExJTV02YRFNY7a4qttQmuHutTS95LG
 SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=p73f+dUM9zbnPz2lB1WH1PhONOp+nBueo+BM9gEHX70=;
 b=sbd9bL5joBmgh5J9HUBnkarW64DWtlzUEJOG2fN9DMiP3x2CeNejJwwNVkfcz/Qd+g
 Uf0LCNM6oogLszTWdqvRXNLTNeKSXUTZmbUgPo+XA6V7UuZUaIIp3dg3A0F2LfchuVxP
 LhTYLFQdF6F0BVHuuAFsmSmgDmSLHBitgGW8Jr9Il2HMzGs+EROy20wfhdu1kRdWBVeO
 MiP8e6JZMVI7wMe1apSdXoXIjjBxvCe0FzlMktDAdtsOqgSup7Ecl/iKLMT4O9b3vnJR
 q/FBP0ij5GdsKZzxEmy/ADYppTy2G2Kq5qBuacIvoBhhdppTpSZzDU7iWobFH8zKXtXV
 rLOw==
X-Gm-Message-State: ACrzQf3cHLE2Vx74kzCBSDtnNszM/M/hbYI7gvP7dKhEsmalD6QyvJ7I
 h4xg5Y77ew9QFNDEZwHOuBKipA==
X-Received: by 2002:a17:903:2445:b0:178:38ee:70f with SMTP id
 l5-20020a170903244500b0017838ee070fmr428071pls.164.1664407862951; 
 Wed, 28 Sep 2022 16:31:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a621d12000000b0054d1a2ee8cfsm4543363pfd.103.2022.09.28.16.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:31:02 -0700 (PDT)
Message-ID: <2fcc2d02-16ee-9a2b-04ba-10f36aa20ab6@linaro.org>
Date: Wed, 28 Sep 2022 16:31:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 31/66] target/arm: Fix S2 disabled check in
 S1_ptw_translate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-32-richard.henderson@linaro.org>
 <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xh8pUBa7Pmhc

On 9/20/22 09:01, Peter Maydell wrote:
> This doesn't actually change the behaviour, though, right?
> regime_translation_disabled() at this point in the patchset doesn't
> do anything that makes a distinction between Stage2_S and Stage2 AFAICT.
> So this is just making the code clearer; we fixed the actual bug in patch 19.
> 
> With a tweaked commit message,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Alternatively, pull this patch earlier so it's before patch 19 and
> is the one fixing the bug; then patch 19 is only adding the
> is_secure argument to regime_translation_disabled() and doesn't
> fix the bug in passing. That would be neater but maybe the
> patchset reshuffle is too painful so I don't insist on it.

It wasn't too bad to reshuffle.

r~
