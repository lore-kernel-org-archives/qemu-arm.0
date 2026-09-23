Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB6C98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 19:04:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9SGU-0004q7-QL; Wed, 23 Sep 2026 15:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SGT-0004pQ-No
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 15:04:21 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SGQ-00049B-Uj
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 15:04:21 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2d9004a1ac0so6061975ad.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790190257; x=1790795057; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z4iz8g9gkDH2MeIuSZb0TKtLzIczJIHBt8h33oQcbxo=;
 b=GiAH752HYLfAdQTw9XVeIZ1OP/hbYx4nom0wXHs50cdUe8WQBnZ9BzsvEk9VoR4ANh
 mBIjsrrVZGpyp9zYxzdFXdSNc3u7k0yXbFU+ctOeACkFz2rSyPm5lxZExZ6ooUi34pMt
 +0XhOrUIZcGfvx3zWVGrpohT6+U4WuWFIUJDiJaVSnV3HjhuH0E+nkBbFgd7rEWRd9Yx
 eUgK+LKh+blEjbHfvXoHXPxZiyLdM28PLoo4ypjdBJuy6cGT9K+NFaj7AAVocz0LPi7L
 8FCAbXBcaNUyMvvxk/Ty210kmqhvTh1jY3CXUSeb+LSGXL+mElZfXyfz8ZGNj7kI5+0X
 V3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790190257; x=1790795057;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z4iz8g9gkDH2MeIuSZb0TKtLzIczJIHBt8h33oQcbxo=;
 b=onXWcXfhLMQ1SLjU3TTYHhqGo2aeTm5/FuCWNdGmbQiUMTihVadh6NQlBn/QZCETWS
 fQws6/+PciBLF/qPSd6kvj8wgPP/tIM0viY71SbX1GfSZgNv/nGtv7xFc4pQzsdx96GD
 jHVxj1EkttkTSI+xZKIz6GyMHWoQUuUG4pwN6/TfNnIfvvaGKGl2lw8qILctfbbQmZdS
 Rug7Y058G+bCy2cpi4Fiuf70PSPw5q2alrwAl0Vt9MX8aHFT4zpPNOIC/5Z8pekfQgCn
 IH20LK9Ygy03tfu4ZTMPvyZtn99cOcuYFkOToI1GuvS8uFJRlg7vuzgHo51hV5uSZVSS
 ne/A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzFn2AIa4HP24Sdyh4srMcVRGBZPfhArqTGEVy6JoHq5EGg5ITK7ZHlCx4trzImDMl/RlQNalbmQ==@nongnu.org
X-Gm-Message-State: AFuF++n0/wwjI2qUkAfQsvCcUVm9+rZidWRPuXh8RK7DSnpXRYCK1EAC
 n9AkRsleKCuJAez1OncgcQg9zNA67aTuTKlg5myfb4N6cxWW45iR5Fd6PENwW98FIfs=
X-Gm-Gg: AYBFou0jMSMQxy8ujW/uauXpNd0q/faFvtDgPwAQ33MNVV1oOPvdjEvKywkFcs0MJpU
 rB/4608GpLuvCh3Ld0mO88+k5RB8WG6MCxzRAD09mAsc4MEliyJd8Z9LU7ZCPHXsKCZ1bpgHo7C
 bqhj9pwGALn+y3YLVFySkf5+Y3jYghiubkCIq15U9DdRvBcDScZF5Mm9wp+TPiLhrAHr/JLbd0H
 dqBAzSJ76vRm+dzE6yTF6AM+vAwZ6olX3zc677lIrmOLPtxIHVXcdeSPn7zrqLQWDSiBHKEL4ky
 3SoTzIpdHZAq/7efd3hIp0qOseAUwEZBoBHIXsPGq5xAcCfwyDIuWPP8mVv6uG6W2DaZfaKu+/4
 +Q/HYsJ4klv6bNcMG2UfUCh3P1IbxQPDkipHe5bYAu+oKBXqy9BfsJgKs/aIiOTUAOvIuGQvpzF
 y6iaghwxGuBwHMyDQyQtFMlH/Cb56jjM6wPGY9MVS52j98GDmhswyMSYON07kJ1eVObMooLCqqx
 8+ljBgYhs8qzWrTjlkFIzlwoO77n+FYlqrbgypM98hbD6g9kKf3hrUZPKoaMA==
X-Received: by 2002:a17:903:15c8:b0:2d9:1dee:43e3 with SMTP id
 d9443c01a7336-2df7e28a7b5mr511765ad.18.1790190257292; 
 Wed, 23 Sep 2026 12:04:17 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5a6d35sm15637055ad.19.2026.09.23.12.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 12:04:16 -0700 (PDT)
Message-ID: <63722207-a94d-4035-9d01-b9cdc47423c1@linaro.org>
Date: Wed, 23 Sep 2026 12:04:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/21] target/riscv: Add riscv_cpu_get_mip()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-12-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-12-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> @@ -554,6 +559,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
>   {
>       uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
>       CPUState *cs = env_cpu(env);
> +    uint64_t mip = riscv_cpu_get_mip(env);
>   
>       BQL_LOCK_GUARD();
>   

You don't want to move any reads outside the lock.


r~

