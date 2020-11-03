Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5102890lfa;
        Tue, 3 Nov 2020 12:15:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuId6DczW69/pX7rEPDyDCEOaj5plf7zHWO2RGFOysPF+RtfZ/r5dInlBN/JUYlUlBGVBK
X-Received: by 2002:a37:315:: with SMTP id 21mr21912675qkd.330.1604434535759;
        Tue, 03 Nov 2020 12:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604434535; cv=none;
        d=google.com; s=arc-20160816;
        b=vkEXf7ik00kfSwsLHrO36ZuM+ZZ4AdVk1sB+CPxbVSs0UQItVpDUbfzCfTlmE0py+c
         ErYdM9kn/5v0e5JCWaPMBHJDVVlc0/omMHY/LGiEGUK6WSlmJ3MOcwb0T3/VOo3XYjpj
         O+yaeg93K+JoPVAhvy1k023c0KcwnTGntTKaC3ZkkAn20EBNJDmVw9EwEf43s6oVCYU0
         gNpKdyzRQhckA1Ev0lJAr8fkUsP4Cu8QSGYUaatckOK981WtDE+IisKcpDeHcsRHh2v/
         nI399tILeezYhOCci0tbLzL/v048lCz3IBzuk5rI9AazxpSPxsPXMc6j3VpPC6vAPdlJ
         JVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/H3P24xTLvUSobqQcbkvu8fPIHywjAl5a+Jyiu45cJs=;
        b=WhikodESB+p4OS3ScgLC3Y75M5nQB3vYYVpeNqR+VSv0nMeys8uFm4fOCjjR/V8zaT
         aWp0RmWSM5P7pKmSKvlgejHvQvE/0rGpxz/Lgcp+L+cIjmrj2X0SY8GDQPxElN4FpSGG
         /1HxVewvx4kY/MTqK1fM+GI5gNxJ0gcaqUjRcZalFELUnhxqCpoqgKOD0miYs6PEYAcE
         kbGnLcbBMmBEMSCvp6JKHHE9Elptv2zlbCY4cHN8QUHYnzdnXEAZxsuzJ5OBVB+slAJH
         ZpJFwEbHCt1BMxUvE1/VNtyppD8zfCDy6TnyCRb+Penz/5+imDJpcSkgL9/80+ItnMIU
         dTgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKIYrmur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si11572315qvl.1.2020.11.03.12.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 12:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UKIYrmur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka2iN-0006Ra-72
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 15:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2i9-0006OL-3E
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 15:15:22 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2i6-0004IG-QQ
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 15:15:20 -0500
Received: by mail-pl1-x644.google.com with SMTP id f21so9099047plr.5
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 12:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/H3P24xTLvUSobqQcbkvu8fPIHywjAl5a+Jyiu45cJs=;
 b=UKIYrmurCbz7Vr2HUA00wOtVkCiZ4IYlOuPttc1dKD+3R5nqjtPfQowt4WkrSjxaJ7
 PqKEWEb5fo6s4li3wvJU5KisOfZJOzPE1orj3htfQ1NQvN33Jyippv/xX53vJV24SaKn
 s3DBcj9y2waM3TOXM2rYSYYRbe/RS7taQJpGHJgdRZUS+AY2i+nZWLr6Jor7E4LfJZrW
 DJXBviQbsft7Abs8IDz9gu4dxRpsn1LobMAZ+ES3JmRoqTJmzclIlEppU+5KBGJXPzWB
 8TsetU0Ahd42LdnWhDMfA8bXetcCCJbdAgMnBQZRxkruOlABU0+epzbZ7HinOIqBLlbt
 Io8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/H3P24xTLvUSobqQcbkvu8fPIHywjAl5a+Jyiu45cJs=;
 b=CD1Ig3qbSSJWbQ78kdLO3lKnMD0aXaJxovY9d3iUq2TCZOWZI+5aa7oTBJ/KfVb30E
 0VY8QfaLNH2O09XmUSUGV93dolI9Z3Yjs6nR+SV/ARQHQ43ZbmjOUgVsBo8Iul2reHOv
 H3rj0Nbb7A7OCjRJpusHJMJcOov4+3Prvy+o22+HOsQ2QPkUgbdwadclviCqcMwE6BBP
 DhbZ5hNvxVeRAsyos4nkfMoIr/kdRtsnCahGkIb/SmhBDcL6cB+QoacKT2a4/m4QEEhl
 WrFT3fTJg30tcCUzEaHt3xG+Te1hNidbCGgwFGGw29amSgxbXBnuk7mDz5B60HKlVCRd
 M2Wg==
X-Gm-Message-State: AOAM5335P5Qtmp7/zCsTIrXk1bXFrq07XZLODsvy3T6bjknAv4ncNw9b
 8MP98wdq2l+y0+YT70/3X5X1bw==
X-Received: by 2002:a17:902:c084:b029:d6:b04a:b091 with SMTP id
 j4-20020a170902c084b02900d6b04ab091mr17883194pld.14.1604434517277; 
 Tue, 03 Nov 2020 12:15:17 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id l7sm172310pjg.29.2020.11.03.12.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:15:16 -0800 (PST)
Subject: Re: [PATCH 14/14] target/arm: enable Secure EL2 in max CPU
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f70812bc-fe9b-fed9-d91d-bf359d35fcf5@linaro.org>
Date: Tue, 3 Nov 2020 12:15:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-14-remi.denis.courmont@huawei.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WX9ysfvQeEOi

On 11/2/20 2:58 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

