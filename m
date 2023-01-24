Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4015109ejc;
        Tue, 24 Jan 2023 15:44:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/S5NKq56etAylRsgM8l4UJmeZJ3Y3u38izyLT/W8ClONojHvcVRFxAzdzL0LvdoYHmGz9m
X-Received: by 2002:a05:622a:11c1:b0:3a7:f552:fd60 with SMTP id n1-20020a05622a11c100b003a7f552fd60mr449631qtk.41.1674603897843;
        Tue, 24 Jan 2023 15:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674603897; cv=none;
        d=google.com; s=arc-20160816;
        b=zePTpk+b01FGf9ST3oMRq+2cGvpDVz+vXoad0GBeXl+c6A1MXV0tMNxKEYAAObX5sH
         5Q8FV9PN91qwinLsSyBaVrz/nhR002tKpnCJIM6uhhj1HyLFhK0wgKt/dPV719fGrWAB
         4wDgaO5yq1lTZlCewHyiyluwhir3W8OXq91+H5gP9v45sCnvVCJcNA2xib4a++CYc+D4
         Nojow2tWuGSQtaxYIrJsn81CNbIjMsXnHHwEmPDccdEu6lVX6VUTtiq5ehnVKLgUCbbm
         pgjEeUu/tX6ZmIN9XeSEXMOCz8scOPLnhXHBiy9bHXm4+WU1nfCuisSjFEZ/f3nVwnDy
         NS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
        b=BJ/hWwq4qXkKlgcOltZDo0s7/QZPNsgHi4Yw24u44FGvGvdPEe0sglVDX2osutSQJW
         r9ptTixQzhLWrvqNukbZsPGDDjjdBg7oBJFsOyGKzpDBsQRaAa23ffgyiFYgHf8Eq95s
         Qf8AIgTSRYaVHfEC3Ka6ES6/NE5PpgtfueQ9kv87U7uJXAWHHJ2j5SjxgkuJD21WwiIe
         ipVCdZcY9i7WZOE1Pxt4zi7g5Xg7P0WtdkgfD+A5Z0ag1vSscKT/pwP3pFvxk2u1geyE
         oMom0KNt08ey/A9VxYZSaRXG+e5DMnOFES0nQ8i+Oz7vRnp0ccnTERgOi5SsQ8mF2T21
         nxMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUu1VPf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a05622a114700b003a7e10b564dsi2345600qty.329.2023.01.24.15.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 15:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUu1VPf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKSxr-0006f8-El; Tue, 24 Jan 2023 18:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxp-0006eT-Ol
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:44:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxo-0003Pr-5b
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 18:44:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id d14so11759215wrr.9
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=RUu1VPf4E1kgQXcemkfBYdNuJPB0p2OQdXgyP9u24UEsRqByLirhIUEf3/P/2BS2c+
 a2jBOvEZzQCKGsDmcSDXnXdxVqjC7s0I7c2+i7qqUlu6uRJlZgBGHZFoxmK/N+R4Mlu1
 wG2UYT2CMlbq0te/HLgdKrv+IyVarJKkCfonh2LJFwKqk1xOr28c00GqVws4OGydl6tt
 wGunJb0CBG/9KB88luRhQf8ZlPnyXRTFEDl9CtTgGZWi/2OoeBdfkN77BQSn3bDCdoqi
 uaCeqLyKaTEYKhnOVrRMTBgH2aiKa+kdD66IQ62GkZpJmxgrbUZk8FJmZuifQOIT/0oR
 UTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=5/RtFpLOt3ZqbEjtNMzrSLQfORtOu5hA2y06fLx+jUDJTPOwnRovIBbgLRFOQAWIGO
 3bq54SKfOnbs5EBXs52Bqcok+uvnVmNLRSJ5m9Tbn/tv1MLPMpTMyDVv9qI0yduyKc37
 Mxv0HFI5O2u7uWiUnwNj4fhvnR32YEl7hpuW9FfnEj5x5oIlZrFmfkcSHjvHyPFdkxT6
 ocMFnAAzfltrhJ+Z4kjzTVaM2YhHE/b79VwDBEwbshkjTcpnNwlR03povH8gKAnxUQox
 9gh7cCfL2+w2zNpUWh5FIXhbilxevM+MKB0fK5J+mnq2QUO8Q1gyZLJhxu+7awv2xGJI
 W13w==
X-Gm-Message-State: AFqh2kqcggCUcZsL4h+UR7ckXUFGjF4wW2M51hPMOP2ixoBjRSJVt0Ie
 mWfRm4lvp09zl/97k4L7OGIivw==
X-Received: by 2002:a05:6000:a03:b0:2b9:9e7b:be6b with SMTP id
 co3-20020a0560000a0300b002b99e7bbe6bmr28455429wrb.45.1674603866538; 
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b002bfae43109fsm2793612wrr.93.2023.01.24.15.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Message-ID: <4add4fd6-3996-8e5a-e75d-3eb262a251ed@linaro.org>
Date: Wed, 25 Jan 2023 00:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aNYArzRvjCqz

On 8/1/23 03:36, Richard Henderson wrote:
> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
> 
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/helper-head.h |  7 +++++++
>   include/tcg/tcg.h          | 17 ++++++++++-------
>   2 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

