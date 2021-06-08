Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4855148lfa;
        Tue, 8 Jun 2021 15:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcW4uXLw9F0Asufzl/WVoaQwqKuiTfDQibYu1VJ/Gr0jlNRQGnd9KCi4eg3D5re5JajfaE
X-Received: by 2002:a6b:7004:: with SMTP id l4mr955842ioc.68.1623191708289;
        Tue, 08 Jun 2021 15:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623191708; cv=none;
        d=google.com; s=arc-20160816;
        b=PIsxvgQF/QDnKZAB7N2tjI1bjq0PquaGWJFmgMIh+YK/Hrg/zuGWE/6cylLYBk0XdF
         UqA8qZ2PcLmxPllhfpQTyDO77qGm2tOdNaK2pTDIuyl87FDh9hd3MyJwmAS5yDWtlgo9
         Sxvydj1br0KSaSna07T8IkIQeUuyqsovHNWiIbPOMsYuK2siucbBHI5CHinevdtizSCY
         rwxNmmeYYf9SGssIYmKkLn2zXUZj9h9v9zfnjFtwwTPYg0oJICESvKtXB1AYthnDIQJo
         JniNj6hUnuuyvyOV3Av43t9hixv7bJMoyAsevb+WpvfS2SN4USHympdqygT92Q4aD261
         a5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vTNBmhqxmrz6IGGWvnPc7/mszzF+NPNqemICp1vAR88=;
        b=iH6FVJcvOArITWFF5AuPw1dPdIDC0C20KbivujozJrFHn9zfj2TBeMxq4eHOtAGqwp
         TiiBkru4VawQSP5p8AliaGuZdXYaB8nD8oOatg1dS6mWn9JXemljNFz32aJwTB+FPwlJ
         zlU/o6Z69f48cSpVhq/R8b7jjetEpKTu8TVYui04g6Of2oQHPZSGWOR17ZogbDKWJz4J
         M/2czmS2x+y0aOupkUKgHp37yl6CGEIhrXCJA4DMZ+YpMAbtmpWHQQ5xVcRH5rEuxDSC
         8jRQCVSmFD2BS+h7fH2QU8iuaGuCHrzSuYXkgzJDhdQOf+oIem0DjGve5UKpAjMAt1k6
         4QXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dl3hYyP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si1179001ilr.162.2021.06.08.15.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 15:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dl3hYyP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqkJP-0003wa-JQ
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 18:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkJG-0003sa-J5
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:34:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkJD-00061f-Sw
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 18:34:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id v12so11473423plo.10
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vTNBmhqxmrz6IGGWvnPc7/mszzF+NPNqemICp1vAR88=;
 b=dl3hYyP/SQie84pF858wXyCHbyTgJF804CvVwvFuJqs1bBoIZ6c1gwzJvNqg8c78em
 yH0I1WEsM9YG5l5a2Fx/Z0/5vWoAHin15GFo3E+hoDwlY3DfBc9nw2ZLqLifd8g42JKT
 WLyk4pRu8dlX76ob8cGptCyZ+PIdpSL22AzVtdrnMNjxTjSx4yRJFMfS06PEKholh7Q0
 DKDkYE1tHsX7Eg0hJFSnjLhh5m6pZr1zQ6qSdhHR5xuHTghHKGyJO4gbyD+7a3TSSFkG
 oj+Pk/cZZPGP0uSZdnhXDL9fW2//zIWQ6Tpd95qt8XeILB/5CISRtwU083sJn2N+TUZf
 3Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vTNBmhqxmrz6IGGWvnPc7/mszzF+NPNqemICp1vAR88=;
 b=hoxpYuGSvqtgXvQvAEGssn8BDXS8CqgNC9E02GiMZNbx69UsEf5ag8WhJcrx71bPfX
 jwwY/OHOpk9R9v4BBK8Dyy4eCmlvMwDUYITby++P364CuDRooRYKz0TFXJeRv5WLY/N1
 RSxF5gfJzGk+VzsyVVAcFj7zP69HGuX40q1rRlp+JxV2MUcpdkpspYJGeoGT5tRs4RJr
 oSIPzbatM/D2CglLn0nHMXEuOLINqHlFJrTaZPkAdio5h9/ymfLrctpVPUvkX8Lv5Ob4
 9yxpyZKnKL3OrXQ4t771UXWtZxwQ4mC+5Vuu580nXhykYDAnTiLhN+mazZqOfZ8/EtTu
 5Mng==
X-Gm-Message-State: AOAM530ktFlcvnUxfE5xgBdwiHwtt1LKqX35Aqo3/DBDN4AXivBqRiVM
 0rGm4BlpNXTQT6Z8rOC+3zshPQ==
X-Received: by 2002:a17:90a:f48c:: with SMTP id
 bx12mr7223310pjb.200.1623191694329; 
 Tue, 08 Jun 2021 15:34:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t19sm3273149pjq.44.2021.06.08.15.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:34:53 -0700 (PDT)
Subject: Re: [PATCH 18/55] target/arm: Implement MVE VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <443b690d-6aba-cbd2-ee42-fe44113df338@linaro.org>
Date: Tue, 8 Jun 2021 15:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: lRh3BWe8nRfj

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_1OP(vfabsh, 2, uint16_t, H2, DO_FABS)
> +DO_1OP(vfabss, 4, uint32_t, H4, DO_FABS)

Could just as plausibly be done on uint64_t.

#define DO_FABSH(N)  ((N) & dup_const(MO_16, 0x7fff))
#define DO_FABSS(N)  ((N) & dup_const(MO_32, 0x7fffffff))

> +    MVEGenOneOpFn *fns[] = {

static const


r~
