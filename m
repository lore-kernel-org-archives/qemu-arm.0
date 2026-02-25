Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40053FD45F7
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 21:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMcF-0002h2-RU; Wed, 25 Feb 2026 16:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMcE-0002gl-DV
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:40:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMcC-0004OX-Fl
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:40:18 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ad4d639db3so539725ad.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772055614; x=1772660414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JC3GKdsB/67HjMM0x+xM5DPdiXVg4HvrguWrnUX/u2M=;
 b=Kmy14jtPyywq6dwChmiwPD74tkSPZbvTk703DYEggRrbJ+0bFv4EhSqbZ3i9uIzuOD
 jGpgQZhEU2rzeserNPA178I6bKqfoE0Jym3N3cRxYH3rr1qpOf5LjSu8DCQ1FwIuqjy6
 3VFmkzKXj24KJjlqx9B4Da4k/QYH2ukOoZNChfCyGyiqWuuJzJlMkNb1sDUDAf6at4cC
 FduMF6vUQRBnDWdZugNsSecxb0+wGlVHslNr+9qynABZ6a2A2c1p/s+I2YtKCqr+AUvr
 xJbbRP5gohTxNg1iObx5/0ampVTq1MwYJYM4vtFbt2Z2IE5fDrNtSc1gu3o+FVj64k63
 wiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772055614; x=1772660414;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JC3GKdsB/67HjMM0x+xM5DPdiXVg4HvrguWrnUX/u2M=;
 b=mqFwWey74JPHIaJeWzJwarMcp9eSA9bSMSq4TjW9B0OBHF7ArnyTObNgkEZw7fDTUB
 f1mp70Wo9i+cu3vmCUm+Y1TOlSZ9wMgzST9B4v0NGhKYJYdOcrYJHQk3DC9oat61qTlJ
 /fykKR3CHc5+bl0KGkvYfmaK+yl5jm7DYTQfCIoaz+W0hRzEQVfm3UNNIKEMoLXuJPdx
 t1I2nkkMeCx1luT9gaxn1KOupz6NbWtkgrKoLp1VskLlCPW992pLW8EC1siLOP6VSlS7
 v4Q1brfkEqbq2mM88n5mipZ0sdOBXPxZtqBMtcd7jzrF6d9P2XKv51Mr7scEyzTiR9x6
 InMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFpDdCX/uNObqoCrzbg2U/li43NJcJC8tJ/X0ZdSlEvK8FCwSv54Ve+m8O5YP+WS92kCJKYLm2tA==@nongnu.org
X-Gm-Message-State: AOJu0Yy+sYP/IkaYJ1UjXPycxjf3aBqIlgOYNKK0PdyeoSDSOVzmpiRz
 7foqeZNstZ7mxK5r1iiadmqlSbnGxzBUDDkDSemaD1cR3NP45OvV2cvHH84EcKn/VmQ=
X-Gm-Gg: ATEYQzxm8OiZhK3BuXkzbe1qAVnyPec8Ap54QcS81VPOoapIFmnv+H50Y1afHbbIhb+
 GO+O9kbYrbhBnRhjhu1D4OccXmBWitkRJ3bFwy8VgkDPklmS7/5qB8ze+WlSF2+duo9Lxv+AGSf
 43a4JHqzritA18+d1UiTz8hQO/jGYQb2NookzVH76HQ9m3VT1vc7LX566OpqzVIA4T8BTjCU6qS
 YLPqEADZTts2quHQkCNE22bkBinYEKxaf7OfS2pHNjxWXG/AqQ8leZdcBzSftby3So+4UfRhuir
 fFm61E7yxNeUH5kKQFEK+MYEUlOBCG1eS5Uk3rOzEDJxNJ/QjifXDQOWpPfiDcFk1FEfav2YB86
 rKWzazoHHa9efRIG+VIYXcRec/HySfusuqXg0BcVmvMztzqCWQdmF4G5Nxvk/eZLv/QHcviWk9p
 kKzw1Oq1QS54uFuMxBHuhgozXtAZ0m2wT7XHo+LpDLYJdzmyZ3IcIhvYv5AtNrXscDjW7Ed2C+l
 DbmftE=
X-Received: by 2002:a17:902:eccd:b0:2a9:5c0b:e5e9 with SMTP id
 d9443c01a7336-2ade9a60f18mr14010365ad.35.1772055614468; 
 Wed, 25 Feb 2026 13:40:14 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22e7sm1921625ad.3.2026.02.25.13.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 13:40:13 -0800 (PST)
Message-ID: <d09ecbc1-3ded-4e75-9488-617dab41e69b@linaro.org>
Date: Wed, 25 Feb 2026 13:40:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 18/31] hw/arm/smmuv3: Make evtq producer use SEC_SID
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101723.2994751-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101723.2994751-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

On 2/21/26 2:17 AM, Tao Tang wrote:
> The event queue producer path wrote entries through address_space_memory
> with MEMTXATTRS_UNSPECIFIED, so produced entries did not use the
> sec_sid-selected DMA context.
> 
> Pass AddressSpace and MemTxAttrs to queue_write() from sec_sid, and
> assert that the selected AddressSpace exists before producing entries.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

