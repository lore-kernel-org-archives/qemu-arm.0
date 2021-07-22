Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6242501lfc;
        Wed, 21 Jul 2021 17:37:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrIXVHBbhy3PbEpnaciVutSsdthG/oOGwPCTFrMYhUMjsrKnvseXD5ICRoj7+/c4HM8kZd
X-Received: by 2002:a25:8743:: with SMTP id e3mr47909787ybn.125.1626914225374;
        Wed, 21 Jul 2021 17:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626914225; cv=none;
        d=google.com; s=arc-20160816;
        b=VkBqkObgqFdY2sanU8JqXIRJ/gqQbrGA76S2BB5znRfx1uh9zIlQfw4CUYHHmAiuqL
         KeklfzcHl/5dmwv94I764DChz2Laitw32lCmqBbF0OeEUF6QkS0H7jVv9AdbGEt+tzPX
         Lx1RCuVaI59esGhaWDRZmVHtApWSF2TTppSxnii8slKT2incBE4YgTXBGHj08fgjUzEW
         opsh1jqVtYWtJrp+tQw6Iq4KzKofiEYO3OCHwiEU5B7PBRI03YgB5F9aGdHhxjm/B6F1
         6xsrgYvFVmN0DHesGtTzmV18HldPkneVUqGEtid+PV4M2f9DPoSOwDCHfxyqxE2ZHEBv
         J+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=e5SWj0rqVly4g+/a2oOMafoA6VwmntAPEou+1nWxqOc=;
        b=p0m6ba5pQY8XaZSgpheno1PjCXrRvLkTxpeYMKVtvghIHbtLd3HcSXssDfiIHxOwVe
         Ec+1EjCaW9LKZwGou5pzGJU0QW0KDA6jFgNw0dmsOpXrggYakCILsEM/2tn3s7J9e7M9
         3pKNupicS/oG9/Z7YkgthLw+tfAmH/QlmGQKFWJIdUoS1L+K1p5N4KC4NMMZJv+GBpZj
         k94IXm42oYmbAHjmx3soMOQPxtVHHbgn/CrD8OO096hjqNJkN1kq8puncmClE9mM4mub
         6sbLE3/gi0AVLnPwZXcEbyehTiHGHTRjvi5HHzskXTlxxvI+kwRCU1Svy98m8KWjN54n
         Sk2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhKtZ4TQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si20910548ybn.109.2021.07.21.17.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 17:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhKtZ4TQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6Mi0-0006RT-Om
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 20:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mho-0006QZ-Qr
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 20:36:52 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mhk-0007uo-M2
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 20:36:51 -0400
Received: by mail-pl1-x629.google.com with SMTP id y3so2548215plp.4
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e5SWj0rqVly4g+/a2oOMafoA6VwmntAPEou+1nWxqOc=;
 b=xhKtZ4TQO22EMy1RSR1CEsccBmdxuEDyfuaeewPg6k/yKYlS7EJtW1RNWbOS+PIehg
 Op/nIWnzglFMHsRr69uFrF62CBz+m5AyGbB+TgPSO6rRUNH0oKQ3W86Ay3bPW1p9zE5+
 HIvmVs7hki0+AEZj8wYQHe//CrfMJSYgEp9LjCylISdmRupzTsccyiWzLz8jpcnVydPa
 QC9PzhdDNwdfAIpF6wd11FlveGpeOWPMoqfvgb67QPRyOkaUVONFAF4ulvzXgNw/4P4+
 ncBiVayCYfPODjUJupZ/rZi3s/nNMDhq/6Fadp1cHzg5e0vQhhGodDbKZyzovPu4koKE
 nLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5SWj0rqVly4g+/a2oOMafoA6VwmntAPEou+1nWxqOc=;
 b=Qbga4ewUUvNLztUhSLqr+i2WiRJ+raIRu5vEvqzdJRwYxyd6SGrzHZ75Orfvt6XNUC
 SYiR+8S7UtMiazCqRJSwbngeYykCvogiPD4rzaUrlGSffH2YUcqBt9q1PwH1+lbHwA9N
 YTTfijO4uubx4Ic77ua3BVYmmWgLe/cZ+bcTfqlBuinv5ILx8U8bVfM+bh0lqdE0xvOp
 OuvqtctaJUsniU28j7I1gtuc7gbEMi3PwxKySaY2NJsZKdE+edcLPwFqfMj24J0HApDr
 rlrBpmn5lGDP/QbvFyevOOd/ThGkL8XRqswZsbGHIEmPosoaG5gWzhJHwykP1yWOrQOY
 MNKA==
X-Gm-Message-State: AOAM531TYllNNcFOQdbm6tgASk1eSrkHONqhkJbnlDIB+aBMW6kJFUyG
 x0+m2ziraf/sLf8WJ+Ul0Ibcyw==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id
 c10mr13270956pjs.59.1626914205881; 
 Wed, 21 Jul 2021 17:36:45 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id s36sm31625615pgk.64.2021.07.21.17.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 17:36:45 -0700 (PDT)
Subject: Re: [PATCH for-6.2 32/34] target/arm: Implement MVE scatter-gather
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3421f037-6aac-b91b-1fa4-806af98e5ece@linaro.org>
Date: Wed, 21 Jul 2021 14:36:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
X-TUID: pCTkBsZZhqPs

On 7/13/21 3:37 AM, Peter Maydell wrote:
> +static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
> +{
> +    TCGv_i32 addr;
> +    TCGv_ptr qd, qm;
> +
> +    if (!dc_isar_feature(aa32_mve, s) ||
> +        !mve_check_qreg_bank(s, a->qd | a->qm) ||
> +        !fn || a->rn == 15) {
> +        /* Rn case is UNPREDICTABLE */
> +        return false;
> +    }

No Qd != Qm check for loads?  Given that we know in advance that it simply won't work for 
VLDRD, it would be nice to diagnose the error.

> +static bool trans_VLDR_S_sg(DisasContext *s, arg_vldst_sg *a)
> +{
> +    static MVEGenLdStSGFn * const fns[2][4][4] = { {
> +            { NULL, F(vldrb_sg_sh), F(vldrb_sg_sw), NULL },
> +            { NULL, NULL,           F(vldrh_sg_sw), NULL },
> +            { NULL, NULL,           NULL,           NULL },
> +            { NULL, NULL,           NULL,           NULL }
> +        }, {
> +            { NULL, NULL,              NULL,              NULL },
> +            { NULL, NULL,              F(vldrh_sg_os_sw), NULL },
> +            { NULL, NULL,              NULL,              NULL },
> +            { NULL, NULL,              NULL,              NULL }
> +        }
> +    };

A little bit unfortunate with table density here, but whatever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
