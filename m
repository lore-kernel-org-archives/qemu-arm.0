Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1576325lfc;
        Thu, 11 Jun 2020 09:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQbbU0HU3UQDZdZNg/4YwNNJTET1tC0rW1rlmsHLXkpqozevFS3L//MU5WiZC+IP/xU2TJ
X-Received: by 2002:a25:e087:: with SMTP id x129mr14651265ybg.73.1591892793090;
        Thu, 11 Jun 2020 09:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591892793; cv=none;
        d=google.com; s=arc-20160816;
        b=wmkPWQTm4reEClibh7LBipH4VVlpRJrCpdxXjxyESdiHjAdf7D/CAwfqzib+IxNzCU
         7eemFu6RTps26KHUHQoqvUOB5fD2j/UlF9hJJDAhVTiXHnjb5iF6/OnSB64EFeOfVz+L
         p3mDBgrCMaHzr/+nwLi1alt0gqb8pUgQCszT/MXZwL6NtyLAYG2oI6peTQEQbmG+fQJs
         3FdD4eMSX9K0lZF2aq2KBJeC7ogKOZ8FLogfzHtSaWZsRv9VWqZM55VxfxtKmfc1BAnX
         3zwHVYuOj3jXwlp4K69oL1JCtxqF9JxT6YGykA90b3xDxVbrcLuu93XeSzT+A7ou9QJQ
         DPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JMgVZBpQsVqjjzrt3FEEL2BmvL+TKkXC5putLbsRUi4=;
        b=XJlhA2PHbGG+wcE7CjDPBbslao1wHi13Btv9hSBwpKPigJD+v+TDLzR2mjKqK72XC9
         MIUjvkqBWMWEINjv6THAU5M3lTCQQUtdp4VjkDSu/TFjtAD1HNvxFrCrdDo6Zd0WEaW/
         QTWCAOLF//NzJbkbEK5vyaZRSfw3e7N/5to02l71uT+MlyTcIZeyTP4D+ZK4+DYha14R
         R4jUn0UrNrjHBA+7TN+VwCfqxoKLdMYcyaa6V0CaTUPGcDj+P6OagaAVNd2x7fQ7E0ua
         LTzC38wClJQc1VHevXEOesG13Ajy41VfZDPYHUxXUV67tw5pgIDJJ0UIUyM8eIuOe27o
         mxSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9hwL2W4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si3142318ybk.399.2020.06.11.09.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9hwL2W4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjQ2C-0000EX-DK
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPvF-0005xE-A7
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:19:21 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42665)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPvD-0004rl-It
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:19:20 -0400
Received: by mail-pl1-x643.google.com with SMTP id x11so2498370plv.9
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JMgVZBpQsVqjjzrt3FEEL2BmvL+TKkXC5putLbsRUi4=;
 b=l9hwL2W4iL4gJVwrG94/i8KResUW30BysvX4u8zlFqzopqI9lQ+/UfYxLYNM4ncvOW
 fAFKvIysZxRcMjgPl+kHKldpm6PkrmTmScRGAwxOfLU3vcpQbexPvZ+NwsMnReEc5hG3
 dXkEIcJViHdmGMBaekT/fvuuAKv2gCkP9nCl5G7lcNuRv3QLDXEvs0CLqTMeNRtw5yAh
 Osff4txd+vZA2shXMo8wQukVm0aRiU0VZDny75U6m6oyUuQ+toOlCCoP60HqqXwlL2hi
 4Pv9aP8ea34rmRIJOBKqt8qoEMmGs2jbZ+l+Ya7K1PYLhBxjya+L000j7TwSq0jAOH0l
 BBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMgVZBpQsVqjjzrt3FEEL2BmvL+TKkXC5putLbsRUi4=;
 b=tADIqRrCLdj6JzD9ARb7Hdbjoj5+kUpr4BTYdID5ca9VhhZbiC4uKtQxAxar/G81qg
 cxZZHWCMWDaJnnN7ONPxX76XdUfnO0KSqOaVHLW0iKnjX/RhWXVsiff1ZArKTxHZuugC
 nfBqeUHantHQ1z0SYoFNGQUVlk/Ub9b8Zyi3CZCiQ9BPRTgU1Dpsb1SEslpiaB5mLoZH
 11i3Annj76h5GSQ0Rh/jPThzJ6YYVdzIowZKV+EG/xvpV5QFYrO86WzfZFfOrpnNyb87
 vQhrAbbmJObd60phaEqtDmDwWTFpeLVqtYIem/DX3N6GCvpSxk9A69GEkz0hbcErj7Ns
 nQ2A==
X-Gm-Message-State: AOAM530EKvoFIsSq6RdEQtgDKk2u4aT87yOb4PwKm4fdlW+oPzjjoi07
 SNSrjdWnGkCW9OCKwBXCLYLV6aVd3Bs=
X-Received: by 2002:a17:902:8681:: with SMTP id
 g1mr7626176plo.161.1591892350833; 
 Thu, 11 Jun 2020 09:19:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c9sm3620563pfp.100.2020.06.11.09.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:19:10 -0700 (PDT)
Subject: Re: [PATCH 06/10] target/arm: Convert Neon 2-reg-scalar VQRDMLAH,
 VQRDMLSH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df607881-4573-68bf-d70a-6cdebd232ae6@linaro.org>
Date: Thu, 11 Jun 2020 09:19:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 6Tviyt9hUg9F

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Convert the VQRDMLAH and VQRDMLSH insns in the 2-reg-scalar
> group to decodetree.
...
> +static bool do_vqrdmlah_2sc(DisasContext *s, arg_2scalar *a,
> +                            NeonGenThreeOpEnvFn *opfn)
> +{
> +    /*
> +     * VQRDMLAH/VQRDMLSH: this is like do_2scalar, but the opfn
> +     * performs a kind of fused op-then-accumulate using a helper
> +     * function that takes all of rd, rn and the scalar at once.
> +     */
> +    TCGv_i32 scalar;
> +    int pass;
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
> +        return false;
> +    }
> +
> +    if (!dc_isar_feature(aa32_rdm, s)) {
> +        return 1;
> +    }

return false;

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
