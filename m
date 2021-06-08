Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4824812lfa;
        Tue, 8 Jun 2021 14:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMqcvl2WvhecVNPaNrFlFKWZeF6XhwwHo1Cr1++ZlL6dxo1hmDzdccAkdx1/tlz2oMw1Yr
X-Received: by 2002:a25:3626:: with SMTP id d38mr36560615yba.338.1623188831650;
        Tue, 08 Jun 2021 14:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623188831; cv=none;
        d=google.com; s=arc-20160816;
        b=Uvo48QEjpdINgpbV+koclqQC7xC05ER06zh6lKhHLyV8Ec3hbMr34biW+AYYG5xOqb
         vpsvqcr1OY0wY1pYlDrSeR0H+f6Pd2rkAmUpgwaHik+5lmxDFVnje0hcWFIQs3MIG0W7
         qzN1Zr3/4iLpYE1GmfEwXOHSb8/9PxC3IyWzJGDTJGkk7v+wDPq7iGCXgrB8Bq7R25/D
         EBYv7Mikae064mxqeAUNpvyg3QSBWGjxYgoSQCnsnSXTTVOeVJUl6UIkdIR0rBR1Sm4X
         ATkdh+AdTj7kg+H8dTjz4TSKxYzMFemg9a+GQORHmHdR041vPXPEG/8ufcgYja3bxDWW
         EnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3+oc78g596RRtIkpQo8jMgxOX3x+FtFo3EtiEpvJKaQ=;
        b=GvBE8ZbWvZL8/6r+tvRTcisvriiUNReKbeb/qjl+g6+p6OAesaE7IO4JKpArao2oep
         5+ol6dSbmeP8ie8rm7S2uOPicvGtgy6mpBX1FzKmR+tEneIrGbN5zDhIZjiUzQUFqSbh
         GcqgKqCJztQK62OlrWzU4LmU4C6OZB3Z3hWmV1ABz1rGpwT9hAaB2FwXm7Gf0mwMuX2b
         3tHjbaL6NSgu17SN79m1ovel6mvpRpBZD7xrkQyI32+/iHQ0JQEo42vxxF/C5DlerRLo
         TVKPp5mllFf5k9vHAnqh2mIDTet5PwbYgB9LbnHDK8sWt7P5Ym46fQzPQQCjTwmpjGda
         hfwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niCeFLGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v201si15950566ybv.310.2021.06.08.14.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 14:47:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niCeFLGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqjZ1-0003GT-1l
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 17:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjYt-0003G9-9r
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:47:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjYr-0007OC-Qw
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:47:03 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b12so5451214plg.11
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3+oc78g596RRtIkpQo8jMgxOX3x+FtFo3EtiEpvJKaQ=;
 b=niCeFLGTT2p+n9B72RDthM7SRI60PZfhP4gnjWrBueijpQYRej45PJwh1dOBs92TnJ
 RzG/Ofn6WHAwAUGPSD4s+7q9317ipT7vPMabBd612cTM/H6mZcX+Zv/NVFnq8//q6D/d
 r5CLLhaSAeEOL34qO+qqtBCp7NtciTIfyQlw056bOhJ2l2hpj1MbAssjiUcIosugZ2Xy
 yylE+6mKQR7QDwKvMtoo+73L2yy9FeTYplRDOQUp3PdQ3+aw4KUy72E4fzN3tbzsQK/B
 HJqMP87Z88l+LWWRGcQ/lRYJJOrJzRimldrWvMIgEZ0J3W4hDlhN2i1M1XHhn7cSWWjy
 kHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+oc78g596RRtIkpQo8jMgxOX3x+FtFo3EtiEpvJKaQ=;
 b=BYMFzIS+uQHtC25PmpW50F37fJOhvhRh93lX2WkOgsWGXhx5vy/Z4RnZX+m37M0KL8
 5lFVKW1POXwjXn8+2ljLFp5muUtjljqcYEKBldmyKhielwgeZ3vtbuQn6v6OSIK4rst2
 OuSORcFVARpGHRAjG/Xrv29rnNp/Hp8suqRtxLz63z/TrA+zGew9jDxfR9i6WRP5TvHX
 6xn0nof1oVf7cbbGp2UO02snKYz+ovuqFxj1xrAXo6LRljF4/TIS5YPIebMdtSaXRzlr
 KjXMsFKHtY8CPYYIeCUtNbzRNWK7A+jD+8lHjS3uSni1lHLrX7S7dNwmX4enLinxaVBn
 WvOQ==
X-Gm-Message-State: AOAM533lsOhXK7i2/ELJfC2iDCTrTZvgp/P+Je0dQBbd/I4J2GQGaYOQ
 ndQZWz8x8+QnnlE77SPjHX17mII8TNLP4w==
X-Received: by 2002:a17:90a:d30a:: with SMTP id
 p10mr28739610pju.104.1623188820462; 
 Tue, 08 Jun 2021 14:47:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b15sm11658744pfi.100.2021.06.08.14.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:47:00 -0700 (PDT)
Subject: Re: [PATCH 12/55] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f5a25af-9a0e-a877-bbeb-c2a09a0a33f1@linaro.org>
Date: Tue, 8 Jun 2021 14:46:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F7ai3fEYN+hM

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                          \
> +    static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)           \
> +    {                                                                   \
> +        MVEGenLdStFn *ldfns[] = {                                       \
> +            gen_helper_mve_##SLD,                                       \
> +            gen_helper_mve_##ULD,                                       \
> +        };                                                              \
> +        MVEGenLdStFn *stfns[] = {                                       \
> +            gen_helper_mve_##ST,                                        \
> +            NULL,                                                       \
> +        };                                                              \
> +        return do_ldst(s, a, a->l ? ldfns[a->u] : stfns[a->u]);         \
> +    }

static const on the arrays, or array, as before.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
