Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4832885ejc;
        Mon, 6 Mar 2023 08:11:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+pSr3lUd/b2HVeih1aV+gM7tEJqc+AGA8YZY2CXlhagCqmSR/ICqxUjg5qRT1GmMk1BRQ6
X-Received: by 2002:a05:6214:29ec:b0:574:d6d:a317 with SMTP id jv12-20020a05621429ec00b005740d6da317mr19410626qvb.39.1678119110634;
        Mon, 06 Mar 2023 08:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678119110; cv=none;
        d=google.com; s=arc-20160816;
        b=PO6BQCudnT0bU59DT0iYqDdSjgBE2stougrel2quFfWV8Xj4RXCovP6wiit0GlKJeE
         LHG0i9uP8Ny7E9H/ibMpTU24ov+Lu4pn5p5exvTj0R2xMOa0x8B5Xb9WCXkQZ4uz65Sv
         r8fGvFjtkltJoAgXMo/I2efdFnULLH4V/Peo+I5hRgAh/2IwYupPYLDZDtK1fy94VJo4
         Q8QfDrHUCjP82umnAburM64FFqtO1VMCNaWBdbmrkA5CNQSq1SFg6DUZN1xDYh0Bnyq8
         J1vlcWAD68QIs5MHWqSHXycAsMjD7aw434TjmMkfUQbRcDpTwgOcu3Gi9PY5I+wAHp+x
         XeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w6czE5q2H3AYFx7L6nJUjFSBh4C7IkqQ4dBPgic2+gQ=;
        b=AgylEVQCFw+O3vFVI1/BKTH/la71c3ZbRFLIInQVRX1pskwsd5/uI4JpyynGCL1pdS
         MVcnuvVed7gNKy+cVu5ooDkg4yZscUbp6c8k5HuijwddXyZhALkyGLXRVM3BR+JRD7ub
         QBbdygswJQkOUdgtce7BLHhoY0iCDUHCtnN0W4PufjJs5p7I0IFwC7hiDHgWP4ZAdfWz
         /HS3E7+EMJeUGd3JL/q4q3TO1F5+zcydrLUP+yX/rpeFHDrn1qjyijVgAEG0so9q9n5c
         5bpvz+uPvxeE2nK+dPI0IZCxCpkdmwmlXN0vfDsVaKN6go5hF/n8Z4A/H0hFUPnWWN86
         yEgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmpwDCfl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a0cf589000000b0056eff66f66csi7333740qvm.248.2023.03.06.08.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 08:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmpwDCfl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCtB-0001y7-JL; Mon, 06 Mar 2023 10:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCt7-0001c3-64
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCt5-0002km-Hd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:32 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h11so9264399wrm.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w6czE5q2H3AYFx7L6nJUjFSBh4C7IkqQ4dBPgic2+gQ=;
 b=NmpwDCflp2ic5tt1sRNcZWSoXWpSWA7eXB3qMP0s7lWwth2vRenhcxN5y7VLW9Ef/V
 rn0zzAT2WqOz/Ns8hnv3FTNVDzSOMs9JiP9Z+c+homljan6v4qNfcz/1pndVH+kn/m0Y
 bMX4k/NH8RQeV3CRs3TjBz7wgg8CZHnUyXUgLlLI7I+CclpinkC7+Bzwe6xj1cnQG7yJ
 Rf1DcTwq2lvjoK5xhlCyQGea0zr0W3GeBxJJ/eTjkd9+xSE6r990KYePBbJdyRs2N4lx
 k1/53mb4u5phoo7v1LhfTI5PWU1PQlHSzhwbAxLgLH+48N9prdFonzXpwHBuHrQkUDpU
 mxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6czE5q2H3AYFx7L6nJUjFSBh4C7IkqQ4dBPgic2+gQ=;
 b=ssOSdJkHtbhKsUAygUhzzGV35K0piSrhgOvs9vCAM0pp7Ee5vmiWKwwIhaVFXERvdD
 IreQY9Sd3dklTGMochlklVlk20wTEQ9gmGFwz9yq428yHiG02TilaL9tCZ7MKnrcqvaW
 qx/8PwZ5exWpnBLcUXdaUzJTuJ1bdH9Qgcegl+s5FmTVjMJ3xi56nV5jTKobQsjO0/ur
 qjFnSDZeLDxEwLfFHNzKxVyBNsmrzYe+8SmDBZjKL8dARfcuOCWWs87CT3/1y01vis7M
 S8ZysCc496ZGvvfnmdvufTmmzkWXif8wIrcmFsbx9iPjyoh30Z1k7S+9deH0jAYeC6RC
 MRqw==
X-Gm-Message-State: AO0yUKWC+Kyfit/QN6u9GnbsQ06vObGwEeUYUUvzGqXUjfA6ROWeRgzA
 UeEBve8h5vuym2EgiRJXwpf4HA==
X-Received: by 2002:a05:6000:52:b0:2c7:15a5:439d with SMTP id
 k18-20020a056000005200b002c715a5439dmr7276682wrx.8.1678116990112; 
 Mon, 06 Mar 2023 07:36:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm9978536wrt.91.2023.03.06.07.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:36:29 -0800 (PST)
Message-ID: <cdc16f04-7216-fb1b-72f6-bd737c11f47f@linaro.org>
Date: Mon, 6 Mar 2023 16:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 54/70] tcg/sparc: Avoid tcg_const_tl in gen_edge
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-55-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-55-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oF/ns0kP3U2Z

On 27/2/23 06:42, Richard Henderson wrote:
> Push tcg_constant_tl into the shift argument directly.
> Since t1 no longer exists as a temp, replace with lo1,
> whose last use was just above.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

