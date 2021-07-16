Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1695585lfc;
        Fri, 16 Jul 2021 15:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOjb6pgRvUS80lTuFmC4eNziWzvOGgJLacFMhHMhPt3MkONHArr3GsaNR6wiCGOlzWFMia
X-Received: by 2002:a5d:6481:: with SMTP id o1mr15479079wri.164.1626473811992;
        Fri, 16 Jul 2021 15:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626473811; cv=none;
        d=google.com; s=arc-20160816;
        b=ldtvrmsf+5Jc/cbq+DT5a5ozLvLDzMYaT5S2s5KdkVsdZgD+QE5olsUsR2l3Yddgly
         CXFeApFAvBwOemtfQ68bLmRF2EphcDgpid1xa/fEA156oy3qIgg5q+ICc59MqSeqeU+M
         H9YOsadUSDThnCKLJtyxyBUbpgAUzHDL0d6NG77AsVHFhf1TqjzSD4uqlOoT9PR65hL0
         nbUJbWt8hB+jlSqYE6QEPavEaZHdYdJuqIkoxwFmAyhAcrNW9WNUpApYiflOsqM208V/
         pkiSfevy5oOd5UFIBtyGudvZGPZykF+0HtdZFZGjIUqv7ItPuhX8nfVugq1D2jz4uhai
         VmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bJiQ45SiiK0OqstmNia0IqGgvf1Ecv+BqHwehxKkVLY=;
        b=G3uWeiCiN2gl2SuBFyurOmKhZzqYGSF2HBdcdjMFFxLXlhBeG8TYaL5wf8SkqSf98N
         aKCug2ogmdNOh5yfutqMblK1odude8LlY7yqvhQWxzjPv6flK/8d+kF4n9CzfIxupM6C
         AK5Jhe6SsUays9bXgOepovvbJA3XszEgcXSFtDWVEc3Uy4qQ0Cs9oUdTtzCp48S0StFY
         6bqPoga4mRPvCyVFQZlPndQkoEn0bDOt7GRSNvDSHxJhw4/XMv+trsNSDkMKAHicFwsN
         +eY94/uF/qOyR8dvsv7WWs/4Ma1V+nQ2JTBFY/rSW8kTRlrV+WTeEyWcMtmX7a53dV1+
         fhow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkePkqBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si8830547wmk.123.2021.07.16.15.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 15:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkePkqBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4W8Z-00011C-5t
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 18:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W8N-0000zk-IB
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:16:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W8L-0006NJ-EJ
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:16:39 -0400
Received: by mail-pg1-x52c.google.com with SMTP id y4so11296083pgl.10
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bJiQ45SiiK0OqstmNia0IqGgvf1Ecv+BqHwehxKkVLY=;
 b=JkePkqBdmGMWqMII19fYnjI+AQsRLqlgx8V0mbOB6UohpyCp97nd/m9A/hgPLIKryc
 Imp6vyI9Hkb6i0/LcVk35eTBpHSsRuKj5Ni/WQRbi2e+OkdHnlmxRmgq+qMY6NL5H0Yc
 2Xl/+kU5WGraPAGJ23pMfhDiDvx0dgH1dcJ5z3f0vuCry03QbwMq7vH5STN7lbrY8xPY
 rL5qI3LnTg9+kT2YSMu8DeHjdTei/z2qtdKEXza5xRhbLJUBs9DlMjRAS0YxIdOismXa
 uVD4FPQ2SmKvbJjfqtkHIGRHXaiX92s3SIOlWpCPFeY7+mImecdov2wrgyYsYANesrN1
 mj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bJiQ45SiiK0OqstmNia0IqGgvf1Ecv+BqHwehxKkVLY=;
 b=P0xtwcP0LRCZK6F7ECE2o4aZCzIxcvpLiPIdaDHTYfqTiYqw696aTHIAr6lKRbYOrW
 aeN6EDVr/CwddxH1eaMXTp+mjZB52HiXL4GGblWnO3d7OrcZqxVPMvVmmWwOPW6LXhRR
 GFEcaBWUaETVRijvlsGoWdS2rm0w6FzX0T8PqOI0MOufUfphEWz9TpfT2W7SNvdnH2eS
 X2J13/tO83K+936mqilAAFQl+Tokte1Pu1DpwQX1KtSadVjDploIVG20TtzqaSxlHfit
 NKQ9rMNTDdKmwKeWJ/zdUM6XpIKbZq3ZU5HAQptsxLCpNCO69S1RgNklpN/PqRqoTHa8
 fAGQ==
X-Gm-Message-State: AOAM533Ml19GWx93/6Kv9kOBKfSiiHvSX217OYjhF4IEtGJo2kHzSQPw
 KK8ptJ7gGH0izhGIcOkoVN8/zxeczuzlOg==
X-Received: by 2002:a62:bd05:0:b029:30a:dc6:88b7 with SMTP id
 a5-20020a62bd050000b029030a0dc688b7mr12728240pff.51.1626473796073; 
 Fri, 16 Jul 2021 15:16:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm12148161pgh.34.2021.07.16.15.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:16:35 -0700 (PDT)
Subject: Re: [PATCH for-6.2 19/34] target/arm: Move 'x' and 'a' bit
 definitions into vmlaldav formats
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <251a93a1-0bfa-66f8-3115-c0f59ed90a62@linaro.org>
Date: Fri, 16 Jul 2021 15:16:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: oYXqpBFk7gHQ

On 7/13/21 6:37 AM, Peter Maydell wrote:
> All the users of the vmlaldav formats have an 'x bit in bit 12 and an
> 'a' bit in bit 5; move these to the format rather than specifying them
> in each insn pattern.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not sure why I didn't write it this way in the first place;
> when I came to implement VMLADAV I noticed the oddity and
> preferred to fix it rather than either copying it for VMLADAV
> or having VMLADAV different.
> ---
>   target/arm/mve.decode | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
