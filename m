Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp240427ejx;
        Wed, 22 Nov 2023 03:10:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjowvbDAq0HC03QqiJ9OnnYpFr1hzxthp5pa7J7Usu70P0J06NSu2hMD59UtPOBZXnw8Q+
X-Received: by 2002:a05:6214:2684:b0:679:e2cb:2a44 with SMTP id gm4-20020a056214268400b00679e2cb2a44mr2124906qvb.11.1700651457439;
        Wed, 22 Nov 2023 03:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700651457; cv=none;
        d=google.com; s=arc-20160816;
        b=BfspDvdvx+R84seDSUHnsD9ujDI+C60OsdNDJrBd3JQdTCtRAojeASTkh76htGtoSS
         rRMT05kJrYxJF4Az2HSOmJ7M4eb+gCZhg9H5Wh9AD0Mgah54mouZWpPqGn8QLEOp6XWj
         mMQIhoViofyFoQUkt6vB1oh0Y0IT62Xrbs6/xncH+2JRPFBQeVqe2xOa339Bnc8H6fDJ
         EDhHrK3sh/mgNA48Ryxjno+m06SOAnhFuX3DXrgwtvAKN7sqDHVNPEJHdNtqHaih8atS
         TKnb28TW1mY1a44POXUTvYMCxCBj6cNTX6fKx1bVzgUo8eRgRZkQxa6H5N3lWqFkG0sO
         b8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vQYdded+nNhrvOuaSIFjiUL+tKO6S6O0UnMYXjwEKd8=;
        fh=Kf7oqcr70PETmHq0F5VeCulZNPjy8y5Ta2afljuvLuM=;
        b=rBtE+STXkt5idkrtwgX3iIDiJEwOUJPxwNGSCov94dFvElkDHs5mKjyt+207KluyC+
         uA9E1lvHFRfHE5tYU3Mr1iQEztfWQwdsmcbLt8QZ8pkGz4grWEC4qQdD1lXSNoHLXhA/
         XjpF9arHhqKDD++4uqBIMfxfGPr8fPUbHB2Wo9LQAfAaS+u2V97XTdLRG4mwBFvdBCPF
         zp5VaP++/leBdC2/0ShmbXzPjuO3JZsCFJyk+yh2CuTr9aJDF0+JP4DxlLbuxwkzEQik
         5iIfP6g7qxJgyW2hnQ5DhLGLhtwG3GZ2VLQm+oEWdYCk/saBEIG/5SNyRuErry906P1l
         Xovg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+1IMpLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a056214020600b006563f18c948si11184425qvt.367.2023.11.22.03.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 03:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+1IMpLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5l7k-0001wU-KO; Wed, 22 Nov 2023 06:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5l7i-0001vz-VS
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 06:10:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5l7d-0001go-G1
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 06:10:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-332d2948170so346452f8f.2
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700651419; x=1701256219; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQYdded+nNhrvOuaSIFjiUL+tKO6S6O0UnMYXjwEKd8=;
 b=h+1IMpLbZj3snuacdwnQfju4h6LgivzjVpOOfDeQNZhsXPHtqpFsKt/vZ0x/YI0PxJ
 0S4BqJ6/nBnlYfBm2hkM6osxN/JziHawJ3AUJmjL12ypfqxpxQlxj6RjAtlObuOqOHqE
 dn8p4NeLA1FtFj3mJHNhRHrsayAq38GlkQnGUBiOUfjPx3H4/OgVZjdjBGjF72kboxWA
 Z90I2LnllMYS3P+f86Y5NmEU+wKJKh6h3A01RElUk7HO+GXVsXmIXKK8aUb1UqsMZ127
 8OnYWGLSxC2WJCz+KeM5HcW04+i7rd6JH2bL/TZvgxfLYDvYEVNAf4SgeUC5oDB3X1Se
 ko1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700651419; x=1701256219;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQYdded+nNhrvOuaSIFjiUL+tKO6S6O0UnMYXjwEKd8=;
 b=LCh+50FrqmbX1/IeP+wNt8lkLFhyiuTSwEb2+IEbphuO1/NjGOi9hnppN7arwgWjmH
 H4NHZKqFneGelBJhTOvAoSwAGFCwvLcLm47byQSbMDa3wuZErNpGsMv1911rNvdu8/x2
 y6wCesqcPoQU7MdbgZBJsef1/qaolVLY42fQNvPl/MctTeBJ2JlgOHqPpc2P69FuBItr
 zm6q2HB+JwRA6/+CFvETx8jpQ5q7iEwyBqR6cdatV5804MUzNVuNzAAJETDuo+aIMNb3
 2aN7GNbXQEuheJCPs9ETssNUepVscSu0HBE2BTef74U7ZgnPbbOBY5IUqD72PCXTePkb
 s6yg==
X-Gm-Message-State: AOJu0YyvLmMwmzKJITKhzt29Un6lURU0QvHN4w2FIsuUdCuBSOMZNKLu
 rspDcrsrU7elFLOOXAGikRPZKA==
X-Received: by 2002:a5d:6803:0:b0:32d:5cc0:2f0c with SMTP id
 w3-20020a5d6803000000b0032d5cc02f0cmr1281724wru.40.1700651419546; 
 Wed, 22 Nov 2023 03:10:19 -0800 (PST)
Received: from [192.168.69.100] (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr.
 [176.184.5.64]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b00332cb17f87csm7232590wrz.5.2023.11.22.03.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 03:10:19 -0800 (PST)
Message-ID: <3c095762-20b8-41eb-8027-854bdbb2affe@linaro.org>
Date: Wed, 22 Nov 2023 12:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen_arm: Set mc->max_cpus to GUEST_MAX_VCPUS in
 xen_arm_init()
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-6-volodymyr_babchuk@epam.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231121221023.419901-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hVVt7DrWkj34

On 21/11/23 23:10, Volodymyr Babchuk wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The number of vCPUs used for the IOREQ configuration (machine->smp.cpus)
> should really match the system value as for each vCPU we setup a dedicated
> evtchn for the communication with Xen at the runtime. This is needed
> for the IOREQ to be properly configured and work if the involved domain
> has more than one vCPU assigned.
> 
> Set the number of current supported guest vCPUs here (128) which is
> defined in public header arch-arm.h. And the toolstack should then
> pass max_vcpus using "-smp" arg.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   hw/arm/xen_arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


