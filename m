Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1138492njf;
        Fri, 16 Aug 2024 02:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUmX5rAfHqobTd63kjgJsRkZcXno/r8OKjFAOY+JATAvcSpNbCNrNABlAea77J1lSLDnabkZkjButsU0MCPrxHGBlYY/y6
X-Google-Smtp-Source: AGHT+IG7PmfGRGr7mvGNgy4qxmcuUYRiqz8+Ets5zjJf4T885G6/cblkFxDZUtwKBo24fjpULR7Y
X-Received: by 2002:a05:6214:448d:b0:6b0:77fb:8f24 with SMTP id 6a1803df08f44-6bf7cdbeca2mr22846056d6.17.1723799969801;
        Fri, 16 Aug 2024 02:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723799969; cv=none;
        d=google.com; s=arc-20160816;
        b=kc987P6tWuqRAUHDIJJvBgeZuLz0oW1RE1vDjYeJ7RHatDSQ9B1dIn7uraprbWWkpw
         3dE+Ejbq+gLU97qyCpeG5rzyAMPNu83p/lRp6KQEbU6Fq9NGmp5VUYWYlLfn02rucE+u
         pgvnIwTQtNY9iXqJ0hrTbPjbDtvSzd/YGKQLqSIt74b4SVTP7GI7n2mshSpq4blQ2OLq
         mEBTXrN1uozIF1sfT8fe3KML0wVZcDJ7E1JRyPvnrMdBZihJRe5KNlIe10k6UxGEh8qW
         v3hxxydQ/oKPlhBFmEFHkeGFloKWKfgTmY4OlNkfY8vZjSIqxnHx1jzIkW9qwhDTk6Av
         K11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R+6q90f+Bxv9eyWqMeEAynySV6PRqJeAyEpIbAk5224=;
        fh=YhT1vmj8iGuv40h6CWxr1whMgeUhqC2z0lUd6PT1m5E=;
        b=oiBiZNPPhU10brCCh2xoCfwNVRed2GygYig1Q9ZTZrpyQYTjti0jINSHxmyzL60/z+
         DCwi6CtIaRGydgTZbWqxeFb5Dsp4PGbnw09t2WqKaPEbj3VaEnM/sT1ow7rEbAS4QKu7
         dt8ANP1CIkdzfyBwumMZ35M4k6fzzdTxJXJMk2QKW/Vkkvv5FU58JPC2fJpSN1M/cfGW
         JPapNnIkKQZ87pb4L79vLLwxE4MI2VF3FXTITpbPphRkBYJbfa2mcTqTNpjhTL29f3cW
         l148UMZAygaeQ9918LVDm1pSY2VimbRg3sC09d4t5/GPNjm9k3CqWRpVfSKbnmD8lOu5
         hh2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j67Ipw/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fec3f04si36962536d6.296.2024.08.16.02.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 02:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j67Ipw/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1set76-0004gh-3X; Fri, 16 Aug 2024 05:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1set73-0004eK-19
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 05:19:13 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1set6w-0003RF-Fn
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 05:19:10 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f035ae0fd1so19882061fa.2
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2024 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723799938; x=1724404738; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+6q90f+Bxv9eyWqMeEAynySV6PRqJeAyEpIbAk5224=;
 b=j67Ipw/+CPxJ8FvdhPr8dNm0f9kt72TYfEEtVp3RQYIWUWNjL8YjoKSyWPB4vp/P21
 qf8xvtr8GkAPr7VuAgWCjNk9HVIdkhAFeJ2r3B/Kd6608blZUKl/Qn5IxmeaVaZafTAI
 KsdMXSTPOf8EU/vRvzvX9zcoZs3FbL0m7kG37EvEgibCkluwQ9z20M2PbQQ/phov5Xoi
 MzzGOzdwIZu4YkYuyGlpMfpB6Ln0d443IykR02cjQzcqggNT8EuDjX5N+wSIoPL7u9jD
 hRAixYzWMpbtnvWdUiT7LRNeg4bXCUB/Ne3RUM7eoDx5zrfp414Tjm2JWW++WjJbMB9X
 zDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723799938; x=1724404738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+6q90f+Bxv9eyWqMeEAynySV6PRqJeAyEpIbAk5224=;
 b=cnpyGljTUu5toTekZ1hLj4dsqE6toKPCMqTt2kwyNSZDf6xgpiWD0kC8o8TYbc3I57
 q79NWzn4HRqs1KXd3hnJ6pxnSEp7cCV1GTI8gbWZVV6SUWoAW6iAqRSkuk/sRhq4z628
 yTqfWXHo23cyNWLJW2AuIAZSqsQ/8KuwjXRf0H1uvK8wJCksnRJeHWwf2XsjyTwCQbrU
 qzmV3dADtVIV2uMz1+AI1Dc9+/Pc1SFoV6hZIWYpfiXNllwjnbSzXXPKFEzuw0Q1Wta/
 ++oae7QC4TYMQQ3r51gkV2/W7DUSSpXiV50GXx+kFTUBUKx+UjcFHoRcbJ3Jb7iJnOU5
 tc6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQB1ELq4yjtszGWzH90nVJEdIdeeN2MPyILDzKia3mX//P03CsRUgNxXfK7DtB0qbyrAunqRU76UL0Ng69XStTme3r
X-Gm-Message-State: AOJu0Yw6psmcPaTICOyZAJnDNhP+CCdOMkEIvSNZcN1rMCa3oi0z3WTg
 tPDbhggLcB7D8QjK8mdVD68uLW8Ew2HqPMMPGfgYnUdh728UWNYPB9GdZbQ1KQI=
X-Received: by 2002:a05:651c:198e:b0:2ef:2525:be90 with SMTP id
 38308e7fff4ca-2f3be5f7818mr18181421fa.31.1723799937707; 
 Fri, 16 Aug 2024 02:18:57 -0700 (PDT)
Received: from [192.168.220.175] (143.red-88-28-5.dynamicip.rima-tde.net.
 [88.28.5.143]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabdesm3190305f8f.99.2024.08.16.02.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 02:18:56 -0700 (PDT)
Message-ID: <2455bf3b-aa93-4505-aa5d-eab42d4620e4@linaro.org>
Date: Fri, 16 Aug 2024 11:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/ppc/Kconfig: Add missing SERIAL_ISA dependency to
 POWERNV machine
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>,
 Sergio Lopez <slp@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Jia Liu <proljc@gmail.com>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20240814181534.218964-1-shentey@gmail.com>
 <20240814181534.218964-4-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240814181534.218964-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: jzX+vGjHz0MA

On 14/8/24 20:15, Bernhard Beschow wrote:
> The machine calls serial_hds_isa_init() which is provided by serial-isa.c,
> guarded by SERIAL_ISA.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

