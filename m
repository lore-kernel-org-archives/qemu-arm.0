Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3084371ejb;
        Mon, 5 Jun 2023 15:29:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZHxzXForx+2QA9KdmGHqKUVFJ5KkVNtfH90/wOMHVqpH7Z6/xIab3d/nLOSkR5V+3Hwuu
X-Received: by 2002:a37:68c1:0:b0:75d:46b5:b788 with SMTP id d184-20020a3768c1000000b0075d46b5b788mr18752qkc.61.1686004145887;
        Mon, 05 Jun 2023 15:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686004145; cv=none;
        d=google.com; s=arc-20160816;
        b=JWD2HhUqIM+XgUKeWLMOtGO1rrWFv/jyJCzVdkwwhiibtVeAKdaTN5V5IxXgILIKUK
         FVBXxIH5GBm2T6LuoHy5w2bTkqBJ7cJb27a1KTv36lCxrLZfN0J2/rKw8T17SVkzbaI+
         SMp1oQ69wZaqyjf2n7KVrfiWW1MQ0XffFlANeo9pm2e6wqx7Kp49Wn/+W/oqvhOJQx5R
         cinYFSlnjyuPlHuDDogm8KG1qnyZ2ptMA+Zg6RKJChRmNia8yCTKU0DEwd1C6e2hdhKT
         UJJZWjPC4F2LEaL87xuUFUHsolEzw13/+OmvJf7ZdTjVOGFRB2toucsjopS1l/zjJy4R
         qhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=i9pFYJoabf9+fG2XLOa4UB/cKAfcHS9SyuF2Jty0mfY=;
        b=KbNuu/mPjvsOnsfTNdpTaowop2jblG4shU50dbhoj9AMz7HOSj6RDcEHBFADcy8Ltv
         Q7f5FFJV/rPB0DsG7p7ES1qNUWJaZiCVmawmxyovIX9S9sQ9bC1+uz2vbGSCyU9uQUXX
         XZnOOiIILSPIlseHRJ4sg6PtOVYb0R3Ve9x+5nDvfolRCjSa0rXT11aey7k3jNwedr//
         OM7vydgbxsHNehIlLI8H/4m+mG+E8DunzdR5S8+28t3fZ6576/NzdOL/S1gHUGs3dh4g
         HdMb06p99wW4IjcQJrfeOOG+ksLeXc9CFmnt9ImhSipb2xopNH8t/F9Rbwk2qEiAPZs/
         65DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svUfHWDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020ae9f701000000b0075b125ba4acsi5033934qkg.411.2023.06.05.15.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 15:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svUfHWDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Ih5-0001kF-Gv; Mon, 05 Jun 2023 18:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ih4-0001jc-28
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:28:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ih2-0000Du-Do
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:28:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so55613545e9.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jun 2023 15:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686004131; x=1688596131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i9pFYJoabf9+fG2XLOa4UB/cKAfcHS9SyuF2Jty0mfY=;
 b=svUfHWDj9uBtBnlrgLIQ3h1vKBcULXD445XN+eXje5BLzbScAe4Tu0QcdvY2GRUNXG
 cNLaWNc+q05kNjET3DVid8E8cHq8Jo/QE6yNqTHnNgCjsLM7hoKBK9uTlnsmYNv9LMqz
 C/yoDzKsnZbXw7d8VSxKNRqwIpGcJ/LzVJ7nJB52f/vRW4n5UHn/n40u4OOft1lcc/GL
 Mkoz0A8t3zr83sKZ5Ef5Ik+W4Mc++9Xi1o1qYHwv+OKrrMED5nH2uAEcyEl7PGzpvJZI
 82QRCsQQHApa1vtkBnBP6NK0ENDI8f4aH//vBlmE7O6b2rrL/O3uQ3CUTOpjBCc2Wpr2
 Xo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686004131; x=1688596131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i9pFYJoabf9+fG2XLOa4UB/cKAfcHS9SyuF2Jty0mfY=;
 b=T+jtYvnrdn9Y1sve6GWmCCopQ1ZiR0ilraCKLAhzCS8/dMwlyty9YFDl11tm5jRIt2
 xpJ39/ZtivMrzm6cIwgozebcLqi8sZu94nxcZ3FuIlJnSg3HhzMxrKXjzBmnhNmA+GMM
 Y4vesz8Ffgrd3+pX+9KUDyYMd2q2mg0nr+IHmnjyCsNquXyRH6q0JQYZxp4ZlDF1i+mx
 niMojOsqDwE8U5318sUdKN1A3w96YQq5eMaTbA6eAWrpL+dR3OYow9zcRFnWkF/3Ys8x
 mFlZkG7sE+qAwry0xiJqbwKus3O25qS00iTpKhgxr60X19zamyskTGV3gmZjPIz+WwxW
 j6ww==
X-Gm-Message-State: AC+VfDxLZh4okBQBjJTS9yO2Bpp12pMS2tWobY+aDIOlWJZb9m75X/l4
 tnAoHmKwSpalyYpUtR9T8iuXJTneSbX/gj4PXLo=
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id
 k5-20020a05600c0b4500b003f4d18fb2fbmr437916wmr.8.1686004130804; 
 Mon, 05 Jun 2023 15:28:50 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003f7e60622f0sm3185158wma.6.2023.06.05.15.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 15:28:50 -0700 (PDT)
Message-ID: <84a4cf50-547a-a384-ce18-069b0f34762b@linaro.org>
Date: Tue, 6 Jun 2023 00:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [RFC PATCH v2 0/9] bulk: Replace CONFIG_SOFTMMU by
 !CONFIG_USER_ONLY/CONFIG_SYSTEM_ONLY
Content-Language: en-US
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H67D4TGNm7SI

On 6/6/23 00:24, Philippe Mathieu-Daudé wrote:
> Richard clarified my confusion with CONFIG_SOFTMMU from v1:
> https://lore.kernel.org/qemu-devel/7913570a-8bf6-2ac9-6869-fab87273742c@linaro.org/
> 
> This series tries to make it a bit more explicit by removing
> mentions of CONFIG_SOFTMMU in non-TCG code.
> 
> We replace CONFIG_SOFTMMU by !CONFIG_USER_ONLY in C code and
> by CONFIG_SYSTEM_ONLY in meson config files.

Now we could poison CONFIG_SOFTMMU on non-TCG files (to force the
use of CONFIG_USER_ONLY), as the definition is only used here:

- accel/tcg/
- include/tcg/tcg.h
- plugins/api.c
- tcg/
