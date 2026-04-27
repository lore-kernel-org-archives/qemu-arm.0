Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED731FF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:51:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSuq-0005pr-Ui; Mon, 27 Apr 2026 16:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSuk-0005nd-IX
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:50:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSuj-0000FJ-24
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:50:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso88443625e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777323043; x=1777927843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nLBjKeevaWO4Kc5sT5HN7jwz2+BINbfgfm07ZBE+LZ4=;
 b=bA+XaqUdueLZkps1z3qDay1ITJ6c+FFnvSnau9NyyBeCJx/RBh7TJlfbWCVyEKMXt3
 IDu2qUm8WLK2uLlXOszLM9AHlj6sjhAO8P1o0+yZy8YAGepQelNfyXhvl47nLKNurUe/
 9taqPQoZ0xltTE4S7SerCHs4XjAYgk8cq5Ena9yW/FgeKpWSSZyDlZbNYjBuJgAROe5E
 FQd9R3IC6zUJZo9j46xCEowzpY3Bsr/pMWvNIuACzjW2mbhiKcFM0947k24dQwVqOG0x
 8oZl82tgmyvo482GrCNNw2YzVV4nTSJf0FvVBKeNkseATlAskJAH09qiJawGJuORiEc0
 Pibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777323043; x=1777927843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLBjKeevaWO4Kc5sT5HN7jwz2+BINbfgfm07ZBE+LZ4=;
 b=q2X8c17RpqrRQLJZ0WxbspY4+BYBg+U9GLbp59GsqBl1MiWebbo7vP6F8yPaLjUIYJ
 0jgnc10BhSwvU2Z6ibUyUJKyf6jndMENj0iz7pmnWiVYftzpsQYppkLBTYv/OK0EsTsh
 N3vlPVc/JVWXZSOMC9QRTrJzWsyNxXQvGy5DDQibucYTGFHLsUOS2BQs64tirqR5Zymh
 Eex87DmMn5y43bkryi0wtUT8xvp3OkBXNa7Pb/HDYZuDvJAt7zciKO3Qh4Fz/Qxks+Uf
 mFRdp8CqTa6FPrLhCufbznU+LFKEa5nYQk+d46zYmPeUVPZfwnJNywdmqlMWHrKxJifb
 U8DQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WJ8vPw9POLtbNGyka22UCtdbmN/+LyIZbFAtno2wDKYj6Lx6PtU5v7h8L2sltOMFpl8vVBe6+Yw==@nongnu.org
X-Gm-Message-State: AOJu0YzFLYUfv+qr7p7Pf9Rputj6jGDBQvjopTOGti8QaaDqQe+I8smD
 oIdlymY0EviwAHroSBHcEdXuDLX9vLbVRh2yEtPYFwtFGihZpXf1H419T3hrgtqThHY=
X-Gm-Gg: AeBDietgpfDenEkNzUBojastStgATWCZF6A6jA3wqFiFVEjcMfXyrJbmnlXwFoSeu37
 hKr3kZyrCFaODwGSxcBD9VLAjLtYF3zCUdanGzaBulOo+LcB1HHi4wTjOWs6taN1h6/djuotIPh
 l4bbZL/qjKnLviBFpniQUX2+jwl0fUbBZadpePezpkGZ/S0cQprEj2G0FrszEW2J1qjdIUncdGZ
 Q68P6/WKIBN4+5RNfoqoi3W78dPtxQrGX1L/dBRAORHPYrkXdpr8N79meP0mq8Nd57kK7eOGYHo
 98C6ukZ8HiRg6j5URMPp9cp65E8csa9JNiS4YGG1LOsAnAcp1K/DX8m2undQAoZpWAv2FXnioao
 O2o7Yxc6jH4D/I3K8Q0v1g3AbEMEmDcbrlSI3FGm38mpoGCgwo14BnZfK7+J9qf/dYfZyxcSWTt
 MWknQFklUay1sq0C2rCHrYlyuI1e/+adazMuTRNqeHm1J7TLgdxqwhlAYsSD+CbPrNReA/bK6vz
 kAt
X-Received: by 2002:a05:600c:4444:b0:488:aa33:dcbd with SMTP id
 5b1f17b1804b1-48a77b22e4dmr3777915e9.26.1777323043529; 
 Mon, 27 Apr 2026 13:50:43 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77aeb223sm4464845e9.3.2026.04.27.13.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:50:43 -0700 (PDT)
Message-ID: <ef21c07f-1a59-4b31-8ded-aaa997a6661d@linaro.org>
Date: Mon, 27 Apr 2026 22:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 27/4/26 21:42, Marc-André Lureau wrote:
> Flash devices created in instance_init via qdev_new() hold an extra
> reference that is only dropped on sysbus_realize_and_unref(). When the
> machine is destroyed before realization, the flash objects leak. Also,
> the oem_id and oem_table_id strings from g_strndup() are never freed.
> 
> Fixes: 602b458201ff ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/virt.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

