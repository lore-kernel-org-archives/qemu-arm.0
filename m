Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C0FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 14:39:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wISXy-0002bd-Am; Thu, 30 Apr 2026 10:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISXp-0002Uk-8Q
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:39:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISXl-000383-8c
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:39:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so13125975e9.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777559947; x=1778164747; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OjMn/mb8ojGsmuC+TVNzUwCgCzyFSL24LMWiHkmQcS0=;
 b=tg2xwsrtod2P81CKu7/BgkJqhICzI0r7TlSVrPn9Z3tFTnia1PmwFaNoqiVfVqYKoN
 XP2V3mLP5/kzwhFxZws6QSMmlv6scGpE2ISZ5gcYTfFsEasT0xEO84lvI1A2abmPDnjo
 fRq6IIwhFBvi1TZWODcP3Mj+reRm0WZeG43ku7ROyq1mDlhoBMbwY7JD9UtH9cenDum9
 TqU2F6USAHf7nd+J4vpxZGYWPKtXhqjOvoD5d5/DPoLU/48goK5rJDtcUKzBs8f05ZhI
 Ny8aYNumpb+9/jpT2JfRUq4QC8jmVVYrFB7avMFyj/+oT88ZimJB66QUD2AX4n+cTiFu
 XKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777559947; x=1778164747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OjMn/mb8ojGsmuC+TVNzUwCgCzyFSL24LMWiHkmQcS0=;
 b=HwKmyQnPKAM59+YFy97l4FrVUzEhzNygLNKHxuok9D9PJnAsrcx3069iJgxOL9Kegd
 hkIINCdoTVB0ysnOH2Xn2uQPTDe+WPRObD+taeZJk4d2qb5iTpHT/ibn7VYGfxxjmXRf
 FDzQjyI99TjjWPhFdJDcq6FXMKRp9J7ahIeZm26pGYehWNrSg1M65hvST8+iUYD5oP7q
 jQMbONKyONyJHuqjZAOyY8Ka48DPuQNu2boapMXp1xqIPwl/X49/1vFBc5DlRKEs0hcf
 L2zmXJLDStz64fJBjSJz6U0cCT1ds589yRdSRJ/qcvzgMF60Dnz+lwEc50whZd+eIYHE
 vQWw==
X-Gm-Message-State: AOJu0YwyQRXN9K4PNsjPx+DuzVGZDVvg4S5F2y2lnnpp4NVP/2yk0PVD
 HFCm6keT1rAll4//ujLgrsXmjg60kgMIWhaxT4r3sUHNEqG0XHdzY6Cjo8diR9g8eqw=
X-Gm-Gg: AeBDievb3zqs5L7fhj0r97HiBUKQz+ISBfaN9feztqNwRxVQqjtoMvPcEQ1uZlBVJUa
 rZQQJwgqE5o3k2L4XULoYtX2vM8eIxbV2KYrb5Uo0zCgxFodiEUuO1rqto+eOcxGFdo6XD6cn8I
 nUerUylAdMyVfgepQNfzn8mIM/QAWGTFLjEHuyujAMtTX7oqp13wabbqm+SBgR3EJRx/kzP3u8X
 Rf7ddhsK608RwlkDbVIo/zhO4yq+zKp8wg7xDKn//kUUDzObO4zATR2WOHK5lKxLMmjHqkq1KWb
 qcgVWSs1289u8hknN4pmlj/H67kC3IfC9cmveISWMnLLMRFd0j+ZDp2Tc/gAfDyhijDpJ1Jc3eu
 c4eJj3jT981pbuzUIKdqhlBp8spKr9ltBIBfxFeGrpL+dgvwD0kqzdWE7GbPPhbaQo44iBNv0Cp
 VRTauvzlFZDxc9CkyUFVmwVtn+EylkJSgdcIF3DnopHrdgm/tBzALz2M+tZ3XrWqPOIgCOWQGWw
 H2Q
X-Received: by 2002:a05:600c:4b1a:b0:488:aa33:dc8f with SMTP id
 5b1f17b1804b1-48a85dc37c2mr27192005e9.0.1777559947022; 
 Thu, 30 Apr 2026 07:39:07 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822d4b57sm177135985e9.15.2026.04.30.07.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 07:39:06 -0700 (PDT)
Message-ID: <e5655674-ed63-4f1b-a6ea-28992db38a8f@linaro.org>
Date: Thu, 30 Apr 2026 16:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] monitor/hmp-cmds: Use cpu_translate_for_debug()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-24-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260430093810.2762539-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 30/4/26 11:38, Peter Maydell wrote:
> We want to remove the cpu_get_phys_addr_debug() function; update the
> HMP gva2gpa command implementation to use cpu_translate_for_debug()
> instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   monitor/hmp-cmds.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

