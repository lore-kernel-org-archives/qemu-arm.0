Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp620906ejc;
        Thu, 19 Jan 2023 13:06:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt+ssrZMd/2HZxMzrddl4OD2OWu9MEHNEmAYTEK02X2vY600zsiSUXPapdUhLND48apQUlD
X-Received: by 2002:a05:6214:419a:b0:52f:48a2:7ef8 with SMTP id ld26-20020a056214419a00b0052f48a27ef8mr18639699qvb.32.1674162362733;
        Thu, 19 Jan 2023 13:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162362; cv=none;
        d=google.com; s=arc-20160816;
        b=a9BT94zXeyvMMWaTaOmkFBc2gMkrkfMZcxBbgkbn3Ao2gsJwAdjMcTeAlv0UQu7sNn
         hCl+8rk8ltK3zYDWwAMy2P8HZgpsQO+6/Fu/sjMlm7mApkkTze3HUCN3hbFAlGwBG811
         h0VecOkyXh7golfeEASq+X0DjUabCmEjhMmy6MaPCEZSLuXpXSsQzEsD1zV4Kc27GBJB
         Xk7KFbI+evplllGNOOpODKRQywjQPDGAVEpJO/uSnlN3bUlizImD8CIisii83cFs6ik4
         eGxpx+ftLeK6MJRZDP0OSUu7J6eaNwizA3mQjzC48lIBeq0r80832+oCGjBj7IR4zLC1
         n+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R+A+ToDqdrLLIkCZV6dyl192/NKyDk2ESHbKo37rSRY=;
        b=e2xr2FOkVuWAABhu/ac1U56S5JU0230dlUwLMvAVH8c1hqfW3Bdj2hKO0uKWo0XjWn
         7K7bIFEmOXptjvDjtoP6Inv9pfSLJa3sWjV49/TmengNpGsVwRqxGfSVQC8DB4vzKBXg
         AGM9qxKpCvyBrzfGPhB/saFpOwYi8ZwpzpO7EY5GSwITg/6ZCYyYeUQUj2vA1swx+bih
         E4lKmKPSoT5GMadxOAT0ITtvoRCBpONo140cYLIGuNcfUNPIZM7Sm9NgqoqkHYupe+l+
         QXzgijw4/3rujkl5d9/zLIsTgN7OILV5saKWrJWE8KuxshwuDLA23ZhMQl3H0Wc0utXY
         5tZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FlETjA1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ad45762000000b00535182acf7csi7710003qvx.260.2023.01.19.13.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:06:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FlETjA1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIc6R-0001kC-R5; Thu, 19 Jan 2023 16:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc6P-0001iM-Uk
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:05:41 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc6L-0004a5-7Q
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:05:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id z20so1505689plc.2
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+A+ToDqdrLLIkCZV6dyl192/NKyDk2ESHbKo37rSRY=;
 b=FlETjA1zjD6oj9tMBzi/biACl+u9if5lJPXzGP5DDfu1w3caYb4k9OQl4cWWZTIymY
 iso2A09o1espBRwDr6AK/MlHW0iXbem4oQf/hKoiouyXEcY6lfNQokMCz6N4zr6Xvig6
 xp0/Cv5lLsHOR4ZLVaDUuPAytA7NzVIvvUEIiBuh/FEiE3fGZjrVvZlJoTgV3nMPagmO
 wodD1lzvBmONtCKuBq4t52iAOK0x+Lu7xv9s0xNh0EuJ3PJUBdCRdBOB5tPpN8K2jyg8
 HA5Wd2DSw37ET9cQifwVi+LgFN7nCa+zcThZ4NBauTluAtMkAl/DR+IFGomHSg4lLXPS
 JLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+A+ToDqdrLLIkCZV6dyl192/NKyDk2ESHbKo37rSRY=;
 b=6ii2/gY3yfrvaS3yZLXw8e2bXRtV6eLspFwc6Irzj3ueo7rp1V5+HrdtLdKLH6M3cd
 A+CgMusVhem8nNrDaph2EH0u5seXKc4Lqapfd3edIdNxntTJOCGPwupsITZ+xZ392dO/
 JRM344Q2OQpxI8I6NUx06uZWuY62j3oEZg7KjIrSUxVw4Hkwov2eyTLAIVMcEiVudKeX
 R5sU3K15ig5smxWKU3a1dvAYzvDMWD58CxgPdFBbtFCi0uaGXNQdXyyzyxnkt1LJ+lhX
 jD5D+rAsJCeHeTtzyC4C1Mlm3+iBJqEGtm3qnrZ+D1imY1B9byBn2r7s0l6i4I0hDi4A
 oS3g==
X-Gm-Message-State: AFqh2krommjzCj1JJ73It67M/j3VgUIdmoJ9JFv/G2ZV3pMOCBiw+69K
 Vbr3pcZim67CRyiLfTyGKZFa8w==
X-Received: by 2002:a17:902:988f:b0:194:9b5d:2887 with SMTP id
 s15-20020a170902988f00b001949b5d2887mr11396546plp.64.1674162334511; 
 Thu, 19 Jan 2023 13:05:34 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x3-20020a170902a38300b0018997f6fc88sm25501242pla.34.2023.01.19.13.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:05:33 -0800 (PST)
Message-ID: <b95394fc-0763-2e8c-3e53-88dd7cfc3001@linaro.org>
Date: Thu, 19 Jan 2023 11:05:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 04/11] tests/qtest/boot-serial-test: Only use available
 accelerators
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: NjsAxNmvBcwt

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> For example, avoid when TCG is disabled:
> 
>    $ make check-qtest-aarch64
>    ...
>    18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
>    qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
