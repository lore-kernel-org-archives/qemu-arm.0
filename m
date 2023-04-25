Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3725968ejm;
        Tue, 25 Apr 2023 12:55:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrWsrwikMyEIiKQBrYOeLuyMIPWo9SJJdNnEWFGn4D9PaIGob5bGDQF+DbDjUP01AieZ/X
X-Received: by 2002:a05:622a:289:b0:3ef:27d0:b155 with SMTP id z9-20020a05622a028900b003ef27d0b155mr28729605qtw.64.1682452512992;
        Tue, 25 Apr 2023 12:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452512; cv=none;
        d=google.com; s=arc-20160816;
        b=hEOf5ibYT0jR+a1O00xR4VqxUIbpLwYT8Qz6C67+E2+PRI3h2PaXFCdcQyOyl9gbUL
         kLtWezAfUhUb3Oofjk3/dej0dugmCon6rvrK6nc7uTlKedGpCt/WoDxvPmP5PK6/fm+n
         ten8TrL8gzxzRmcVKtzMAwVPCNhT5kN5anpKC6HP2NAp6gFSfkgcO1TjWt7Km/iNzRap
         ORkXq/7vP161X06wXl7PuQNE7oF6b/sZtf4LTFBs6RDUkb1nIslblWY5DPCSyUKEg7Wj
         LoofAHTFnQoP7dQ6dXedC7XIqEjeZ3M2pXr6gPKCZohU5kOU4ukxzv7heZvEv4vKkiG1
         kWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Twrs3JJMsbClXutVpqw3Ckm8hqSgZ2PpEoQJuu2lhfk=;
        b=mM0Q7eg0NRtYN6MTLGuKyyjc9U6podBQhdc0o43mhcXgJq8ucMsNZAvij4tWQ06Ynm
         Dnt2wn2eQ6QKK9kx8BHVtYMOHOvRaycQOp62611PsjmSruqxILv4ZKVjsfhssn6oxhz0
         v2yZQUtVG4UZ0XfSLwLU+CR01U+pNGlSFk4k8fTd1AaGLbGKaBthELYak818thjTPsgN
         3oCs3zY3h0MHP5OwT5TnSf/p6HJOaoJjoTYwrhcgF/q4HsXPrjk96Cv1ckB5XUxmzlaD
         TI8Mn6EMEvDxU6FaxE//ZFBwV2pCGISiuoE6WpIgg0AIyheNjYlkM1DTf49XeN4HWykY
         cpjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kD8v0bbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c80-20020ae9ed53000000b0074e1e25a3c1si9011627qkg.617.2023.04.25.12.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kD8v0bbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOkP-00043d-HT; Tue, 25 Apr 2023 15:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOkN-00042U-Jm
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:54:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOkL-0002L2-MS
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:54:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso95288355e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452479; x=1685044479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Twrs3JJMsbClXutVpqw3Ckm8hqSgZ2PpEoQJuu2lhfk=;
 b=kD8v0bbrPJTOw6zDlm/HoUZXNT0AJvvsr50iOe2qX5Q/I8p+LW02vZOTUJLW2Q0TC1
 WttgqZZHlVEA9MOZ3ppzfXPay5ZKmvMDS4VjvzR6MIhu+IkDY1RnESgLzSlbobw7M4K9
 PyUB3rhXw3EAB86BZInYcxeJ2ldEJX35yQNm63FLKygd3flDZCoIByxbPgpao8OV3/iw
 V9nL4Z2/p6ZITyBa28mRLOg4TfXhKRePfeYAl74bpNNHnwtmeGToQ8VOukY23GDdZf/2
 PrqmQoPhIdFBrgnW1qzpFb2HQnGYukagbjEpu6elJwBR8qLwWHvAlTvcAnyVcr+a335x
 SBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452479; x=1685044479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Twrs3JJMsbClXutVpqw3Ckm8hqSgZ2PpEoQJuu2lhfk=;
 b=FgaFVjhf+MljLHbJRao2KA3JBAuiO5ziOUD7Ts6yd3sdCJFbwjuUKT0/t2YywwI4N3
 rctdkdR9sDmHa+iKKs2ssyuuLMtOZvzv6l0S5lmmjdfxKZi9CK5m3UkNMxtBwmax9xVV
 +Vk3Nfnhyo4tDHHjg6yYzl1rFLA9RL/7gbmk5ncZFV+wNelYqw2m8lZ27ZxQK+TR6ZMQ
 hKtX9OvKfkdYOxLR2U8gmUkB906Nsd8hasMX727KgEUWLxrL+Qz/nJc07Jvvd/C0Mhp1
 dGE50050IwX0sWptMGKCUwRfnCF8yofQffhuSqbwMVjOnB0uXioFutFYtRY2aNayKg4g
 RKqA==
X-Gm-Message-State: AC+VfDxYuvivGs/lgSNvLbYJ66JksVkBACra9lxjzo47dxnofF/bxEXS
 qQ+mpTdNLKphDvPaQyosc6C7JQ==
X-Received: by 2002:adf:f2d1:0:b0:2cf:efa5:5322 with SMTP id
 d17-20020adff2d1000000b002cfefa55322mr34012wrp.14.1682452479045; 
 Tue, 25 Apr 2023 12:54:39 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm19069147wmk.27.2023.04.25.12.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:54:38 -0700 (PDT)
Message-ID: <d58a9776-d64c-3221-4296-c28f3991813b@linaro.org>
Date: Tue, 25 Apr 2023 20:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 07/57] tcg/i386: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-TUID: H0SvmDgx4b3B

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 4 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> Reorg guest_base handling to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 165 +++++++++++++++++++++-----------------
>   1 file changed, 90 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

