Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp531464ejc;
        Thu, 10 Aug 2023 02:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMLa/yLpzTvmtPpD03ahu8ki+w0EWGxIczp0n0SMnHqBOBUctLy9J53kFPr6HcHppf8u9z
X-Received: by 2002:a05:622a:8e:b0:403:b02c:db8d with SMTP id o14-20020a05622a008e00b00403b02cdb8dmr2307230qtw.7.1691659129331;
        Thu, 10 Aug 2023 02:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691659129; cv=none;
        d=google.com; s=arc-20160816;
        b=zxsna55TDCTeK2UkShtrPEHYNNSAMfj8xuPBoiu5r1Jy/dE9mSZ/q6XT+0gMCUjsTj
         kgLljbNHKYld2tAM2M+PoFb6WvCZIEreVfm5FXB9coo84G+tU18xG1SkxWjglDmgco8M
         SMNIxPQnNPB6T0YUBcmKPtgRwa8s9RO2N24D8i3Zjh7hef99MSVyGmhE7S8JjUweJ1DZ
         g2jIQ0OQkceiekXzYOusYafMzRA6CPPS4Dv3Ze9ouK6Z/PFnmP1ubkq3SimtC2RcQoRg
         NdN5/0ZYY2DV5dxJlTpabTudkuJEjkuD5qC6+fYJ4OdNM5e9CSetp78F3a+vInkgaRT4
         KZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MBdVHirNXgRmSuVF99QvdHBq0xUrRZDq/GlpbFzl0yA=;
        fh=zlpASWiFX/cotIFAyrriCRJDmFpobIKVCGxuAsr+eCQ=;
        b=rQZN6Rt2N1BOBdQITHT7vf4Djszxa2k5IMzmMV5x9S7qwfqY44FFyA7yifZZ5/XgHO
         YunECpmrFc1HeIqOhiyJX2FEBgVbxutDtv8PsMCzZ5FspoKlq8l9YlS6oeT6SGxSXwg+
         0R0B47wMeSFD9M3zyE+QGvK/KqntsIyIEVi6mMirPfGFIZnv6rparQansAKXst79Cr7b
         BXHsfwupNpt4PdmH5LtUWXZabPBiV9MyVDRWYgwXkMITulQYdRWLTZeGqhxoUz5u3ria
         UF+17xO7DdyT6JGaRTmRkltNxA0RzEXK8WSTeUFa2yD7je+qjjCaeHh2naIxCtoiOzJG
         0qUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szSpctEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05622a1a0800b00403ae25401csi635016qtb.529.2023.08.10.02.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 02:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szSpctEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU1oI-00048O-Ef; Thu, 10 Aug 2023 05:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1oA-00042H-8R
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:18:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1o8-0000Of-6B
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:18:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso6289525e9.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691659093; x=1692263893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBdVHirNXgRmSuVF99QvdHBq0xUrRZDq/GlpbFzl0yA=;
 b=szSpctEef+yzg8vnVsIk+G7f4iPEkbBusXqJuwrqh9b03dTJymgcaOuMQUf7o5daai
 3mQJzk2eoV0p40LsbXT6ulnW6gh/xS2hRju4HEFszr62cXp7vL4m2C1l6ifBzQiXRQdk
 SSfpO1aKIHQhrzs6OsUFbwnMlqLMtKazH5OukZEeZuSrqkPuqNIU2c9kdZ74qutXy+6Y
 Mhr+elzS1ccBnnSmeiwc3SI34UN9eHNXnTP7qnvxgJ+eDbh9WIaneG5a4N0fCiiCfOTu
 BhUXH//U05ZkIC9oLyYkRqjZxa8T9FgESAAX0IjVN9mJbkPP5CVh9UgIfRZ3pXDmCYay
 EGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691659093; x=1692263893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBdVHirNXgRmSuVF99QvdHBq0xUrRZDq/GlpbFzl0yA=;
 b=cJsN6CnNycCVGBFzvOfANycDkMaobrzxZj2B/Cdxck/2HYxaREdQNAvYlFMAAS22os
 6VebA14P3kCQRwc7ivUfbfUfGgg5fYnoMtheUPa7ht45Gjx7f2EpGSw67EDNc9bWVdVa
 HV1qw5xCyoY2t6id86Dl6DVbnxIJyLszq7nUeGFokiJH7tK8Vm5oA5deKXngOEgSSLz6
 ykSYQrwy/nKkptXk4z5VY/IbkkEAuhgeMCXO1JTCcRGtu1P2KRHeZL9GAu4KWMyyAylM
 EUWpwbnkHTebsE4wluZoBcw7qqh2jvlFw32yk1T0kJYBOtDLpsVGDS2oid4wPqKSsfOw
 I/Pw==
X-Gm-Message-State: AOJu0Yyoyl5Fh9MgG8IIQeV8UnQamw2n+bsoZhrKImP6fO/mXyGIUZYC
 r83BucqXs1TJ65PIj4mAj3SPrg==
X-Received: by 2002:a1c:7714:0:b0:3fd:30cb:18bd with SMTP id
 t20-20020a1c7714000000b003fd30cb18bdmr1548286wmi.15.1691659093234; 
 Thu, 10 Aug 2023 02:18:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1c4c15000000b003fbfef555d2sm4341476wmf.23.2023.08.10.02.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 02:18:12 -0700 (PDT)
Message-ID: <5ecc9d84-bf6a-22f5-fc06-996dc5bec334@linaro.org>
Date: Thu, 10 Aug 2023 11:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/6] accel/kvm: Make kvm_dirty_ring_reaper_init() void
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
 <20230727073134.134102-7-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230727073134.134102-7-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ieUvUaIIK29i

On 27/7/23 09:31, Akihiko Odaki wrote:
> The returned value was always zero and had no meaning.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   accel/kvm/kvm-all.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

