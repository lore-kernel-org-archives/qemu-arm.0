Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp209596lfy;
        Tue, 4 Aug 2020 19:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc0bu9qh6ITC2i/sx05hbKbwOg80hFgxiPHHYKJS5Pphcofu/P1l7I2arFrkQGIQ169vdE
X-Received: by 2002:a25:c2c7:: with SMTP id s190mr1606097ybf.161.1596596242304;
        Tue, 04 Aug 2020 19:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596596242; cv=none;
        d=google.com; s=arc-20160816;
        b=vuEPQ+/MWCwuD4f2CS5ruE9IsIqmgGJmkcueXfq99q9yKlbbpjvZT4pTvemclJI1+a
         lKK2o2epp9xATPVvy/CNYmz/VCtqk8Y6b2t88J0f6f4P7kkmTzuyB+dqYyG7vB99nWry
         46O1BfhbnkswX6tFYaBDaCr59E/NWZLhgeoFnmb0/XB4QKqrmCm+sBQ1KviMz3c8WyXG
         +9zfcrN3BsjYykWpiKnqeR+Iq6oPV/LTFDdKvAJpldN4JibMQR45EcM3DdEsd6VBuZ8w
         rUe5B6+lbCmjLcmSEPvcjpObk+tpIvPYCAXKWcIHQygHU36/zl9HZBtRIdFVjt9bGCUY
         lszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UqDtWc2Pu2KpzdLmwzBc+Akg/AMn557XKQdX16SGZq0=;
        b=mYy3O6ne7e9Q4247JH7qTsJ0UDLiu91lzxGHfZZmg9QkXWcq9mlmvnllhC1nrbmEg0
         35x/q9+oUV4gPmpzh3gzP/U1tgYlVzvACkKBP+pwud2H0u+D+7Zj0fvntCoOh7g6eApr
         6Na2+I8WwTI2qZxTNM3+WvZQd+bPKsvtZfZXo6to8rshTpHAD0bhJw0pwVIw4IWP+rcU
         zZTPVOpVOtC00SlKR50zuqDONPQWH3BNwK8DEvQYh59MJtOGSRnhBEIhVg9ufq/TKFn7
         7IfY3hlxKpXfEh0onLwzhoUeelYc9cl3yDJZXgaHwR6UrTEvAKk2wG4cv6ttgoww8yCF
         8SHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LulsBrzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w138si779466ybe.14.2020.08.04.19.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 19:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LulsBrzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k39cH-0003hJ-Lh
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 22:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39cA-0003gA-4u
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 22:57:14 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39c5-0002Kk-KX
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 22:57:13 -0400
Received: by mail-pl1-x642.google.com with SMTP id r4so13822831pls.2
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 19:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UqDtWc2Pu2KpzdLmwzBc+Akg/AMn557XKQdX16SGZq0=;
 b=LulsBrzhka3kHQQ12+z1mTJB2OQQnVrRtaTpCMjfZBS6Wxv0KEt/oDorc6tNL8hI/E
 lFpp7FXCtwJ6SWueQ+H+arVbyQ8F+Xr3s2XtKcGcy1KcA+YW/xC2n3GLdDzTjspaNSNE
 xbT0qqQE1CMIhETMTex+Y8Pps3vUyO13xRX2ezqO+z8PuD7pAhdgJ91y9qa+vJZ5G7HO
 Aw3n41tqF4VJ5g3W2z2U7TAyyFZ9cKJftRsMHSDg2Vy1XCuCs6bRL2pVo8C6q5NDt3Kg
 r9lnt3MQNHDaxgf8uwUUUve5/7Tv/ae5F81N3S+5KshvNwg4dRY8yx2Z/s/DUkbAKyEC
 VV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UqDtWc2Pu2KpzdLmwzBc+Akg/AMn557XKQdX16SGZq0=;
 b=cCa51s4WpOWIduud+pyQy0IzVr9XlB0rRpY5sT/JBiIuNlw3s3GnzcEyV63a+nrqyW
 HS+DkaJliEmW5rrNSJvCf6s60OqtbfNAr2vMq1XOVgA/uHBtpY/H+FfLMJRLBn7jw2/E
 asFwD1McaooYZQwF4EkgIPD3r6+1+14otqMtO6KR5yGeH7oFmWA8Ick6qsNqX6hspJ1f
 wemMqZWb7FT2qLm32f+npYmBNoaUxDW4jiroxvLgnDX8mp5PTIwZgYjmHjPShd3VpME4
 B39HKiMBLWoe0jaz1Zpg09EruIJ38z9XVB+Bn5eUjJ1b89dP1ISyge6w+1XRtIIBXds1
 n3zg==
X-Gm-Message-State: AOAM532O/ia2Qi1Lgo8EcI7ywkuDUOd/7UPmSu5WNO9RpVAjK9KKiVWA
 +pj/cYNkxXwuIPyH7AOnXfIhvr5qM3M=
X-Received: by 2002:a17:90b:378d:: with SMTP id
 mz13mr1129769pjb.98.1596596227845; 
 Tue, 04 Aug 2020 19:57:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j130sm753977pgc.76.2020.08.04.19.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 19:57:07 -0700 (PDT)
Subject: Re: [PATCH 4/7] target/arm: Tidy up disas_arm_insn()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <595b55e4-23c4-d546-3423-b3213ad2ff8a@linaro.org>
Date: Tue, 4 Aug 2020 19:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCC4e5wQVYcS

On 8/3/20 4:18 AM, Peter Maydell wrote:
> The only thing left in the "legacy decoder" is the handling
> of disas_xscale_insn(), and we can simplify the code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
