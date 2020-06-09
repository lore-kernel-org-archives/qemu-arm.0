Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp748206lfc;
        Tue, 9 Jun 2020 11:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtUFyLVjs7ycdB5M6H+NV0kUHJ06SqcpOU7sOd3ghkcUaKSmQb4HpZBW0Kl2TUPzcuXFhA
X-Received: by 2002:a25:804b:: with SMTP id a11mr9106460ybn.84.1591727223759;
        Tue, 09 Jun 2020 11:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591727223; cv=none;
        d=google.com; s=arc-20160816;
        b=U9FrSkhDlmX4jHgeFJdEtZETufcPqsfB9hwmafR8OmyPDmtmemcgOc8WEFEnZ47XsX
         KP6NQyz9GYAGU8HzeOlifCe2lOyvXSq8Pe8IBxnyvnWVLiO4yWNZyRm531hxBx/127KH
         6oV/S8ii24vJ2i/nsea+7tbPE+hbGaodlXhVIZDv1kvAorV6Q0a7F5DhHLAdnVFZWJ61
         atAl/83hOGnS8M1jidRRl6zNEBVj/IqLbhRA9Jhi2CKAFCQk4AxAjl6wAiATIZH7E5oh
         2XKe5cOmETeNzUVFuqOuNdqLWJuqqjV3SexksF6VFWBfV1Z16onpZ023e3gX/POWKM9t
         3BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r8Vu9Tm93Dmrk+zHQCQGIKrzaytIj2BW9FR72UMQBn8=;
        b=Vz7oWKEXIloMjocR8PsxhdTgQX3U1Jpy4gElK1/z2uYJeFgoAfi/4X0yV+u5wJSU73
         qJ/MHt8Nnz5d/dyzjzSWnGKu9pmKG7mJw56b3LdXEfJ8Poyrv+Y6NX+o9grh56DS1KZR
         OJquP7i4/zLHwNOGaQ+7O7vtsFR7Xt3WLXiOem6yNSKeJk8huJHHtqlks+ACMHwpP6tu
         /xmnv+ojIliu2CiFyaWO1iJP/9KRHGkgcBfYmNnJHy4+fp6BYX7k1b8dZAHC8zVgC9tM
         oTFXBrabtJxW4bagkjEJ54fpsNLzR8HxflxYeL88XxuN3EOFJl5zIsSZJcePMV3vb/Gz
         wgOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6IWGOOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si3075966ybk.265.2020.06.09.11.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 11:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6IWGOOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiixj-0007ST-5q
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 14:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiixd-0007SJ-0w
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:26:57 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiixc-0006Yc-2z
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:26:56 -0400
Received: by mail-pj1-x1044.google.com with SMTP id d6so1764417pjs.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r8Vu9Tm93Dmrk+zHQCQGIKrzaytIj2BW9FR72UMQBn8=;
 b=S6IWGOOwYAGIvWKNeeuabL7Gy9SsPXKCekqmH2xnUV7uGApfl4J+LwJ8Vnm+UltGnN
 J0I8sKatyJqYsgsNcNiHaIgJpLMz/R18jRgME0TGQOKSsJHf08bhOdqjGPToBHxTkD01
 S+8QPYg2fCHE6/kVvNnluBlnLGrUGB260Qnk6kf7jxegOuoXN5d1U4CSfNzV1QoM9qtM
 opZPCPy+ZovTcgyxG4AEkBFaD8/vih8hXAoNYt31n+Y3etshS6LlJk+o+6p9J66LeVEQ
 5ipV9ieM7aLuSS9c4myrLlsatLMQZ9Ms1W1Tts8OBJF9P0HLZzCYoYPsS87lmMMKtnvX
 7knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8Vu9Tm93Dmrk+zHQCQGIKrzaytIj2BW9FR72UMQBn8=;
 b=Oe5oSSSGEOdvKnkL0yhaffUTgh9VR93JCHDDieGZea+i5iZxrdx9sTTu7WHwnoHWUu
 YuMtC8j019tCpafjDAC+uEJ9KW5AdEdFH4yZmURdRiO9UnptZtsDAafnUYPCdRj+RrUP
 mep+o+ufLFw2z/W/RGf8Z2ar8ciJL3EbVIa18fV+I9+PlVrSyd3MYKs19HrM9dAk/MX6
 LY8OnXKz6LehK0NGUUiwelXOWp86JTQXOnwQKrwDP8Oov9NgupxYCsYwQ9qDiKoOZklH
 vPe0e5afDerB+zfESj7HuIZAVd3EKSMKuCryrXp5ogJbmjoPsD1/dRtRVm75hC02WeMW
 qAeA==
X-Gm-Message-State: AOAM532t3/UcI5xLg3PE/UILRoKy63qSgGVCy+Fec7dE+qy+wKa85O1l
 fu4DooFKo34K8krXJSj1ZSCqMg==
X-Received: by 2002:a17:902:7785:: with SMTP id
 o5mr4535291pll.288.1591727214107; 
 Tue, 09 Jun 2020 11:26:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o20sm3089465pjw.19.2020.06.09.11.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 11:26:53 -0700 (PDT)
Subject: Re: [PATCH 5/7] target/arm: Convert Neon 3-reg-diff long multiplies
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4491ecd5-43c1-4ee2-c7a7-7a337813a5f5@linaro.org>
Date: Tue, 9 Jun 2020 11:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: KmpocgAYh0io

On 6/9/20 9:02 AM, Peter Maydell wrote:
> +static bool trans_VMULL_S_3d(DisasContext *s, arg_3diff *a)
> +{
> +    NeonGenTwoOpWidenFn *opfn[] = {

static const again, 4 instances.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
