Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D826C83F22
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 19:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ublh2-0007vv-SL; Tue, 15 Jul 2025 15:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ublHv-0006uD-1L
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 15:26:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ublHs-0007RD-Bh
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 15:26:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso67009435e9.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752607557; x=1753212357; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZKhCPr5YjI/Ci5CHnyjBRTjG0SEjgGthCbWh+QDUAuw=;
 b=WYAMtr0wWYwYtkEV//EosIv4+2v+9xfcx8Va3lzldXOBs815QdyK4OKU/0Ln+UBnA9
 NEDmwZ1hwHp0GuGt9CYJucMllSwnmuPCJtFnQ/kYhfyCR33GtyAvF/sLgOEDZic6TXdq
 iKNI1PWI6mWH9bf/Qlc7tuSPSz7/j5Z0+dspW94qsy5MpZi5HLtT5lMO9TE2QSK+x/XR
 2o6Bl9z1kbU/9OyUsAVRZTLHABGNipXsRJKNKDOrwvxGvJXe8E+S4cHSk6Xdchnr/mpF
 RBHTiI5vly4SX4FkPUWeevFTmjoUTlSjXqXD+M+a5I6ys7qo9Ozw5fX03z2V0HP1fT/R
 AZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752607557; x=1753212357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKhCPr5YjI/Ci5CHnyjBRTjG0SEjgGthCbWh+QDUAuw=;
 b=XZ1Dc1B9XgJvbT1D8wRlkNwDT1hkb28huKhCzbhN3XNcDK/IdejzaWAEkIq35TEbVH
 9QRo8L1co23r9WnwnWw3guXT1KWJXB08x7uQgQQkiNKr+K/QJF198JPnPL3G+NUGRhkf
 b+2bONHtfHFAdQecpvd0E89NMWGzoxM4v39wm7UGV2A+UuVgUGt2uanh9asGWrUd6F4B
 atYtjm3t+9goSC35ARCXieRCMOTpIReYmRa/Rn2nJCO7EPWH83kq9qZwex+VyxpVzOgt
 Y7T+rcVlM9y6DjJWq4t2BlketWHxVCd6TXG7O5Vrj5ymBMS3g8ndMuKGk8LKrkCKqqgV
 pjFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHjGotc+ONdr29sOaNNfCX7/wMMitCCo8xwPRAKDJgijnvEgN5a9zZoSCNlacMtDw1hbMPyHfcJg==@nongnu.org
X-Gm-Message-State: AOJu0YzWBa1ZbIFn1TcqsrdTpvwZUjjqaCo73aQIuqmGCb0jrCwCsS1+
 v8aHepp1EOf9uMW3jH9eOWwDfVTijpMhoU6cccKUC7BkCInEX0AQAwrKxAPlVCwegHM=
X-Gm-Gg: ASbGncu+OYEY756qTUNP4pHxaMrRcW+LM7AodimpuCJDgz+MtaaPlLyJYbnF8W6H4Kf
 uOeS7GNBpar0yeOebW1O/WTEHYwGWO6mVaQg/kByUQ3Bqiya2Q/yqu9wUCDxbexzRwvQc3ygABL
 LeBPVgiqGq7xT7azaEix1yZZSpLWLQEeUVfXAb3EzMFHpTwbz6IZYfYnBEJaxFSgTNLiBbIblk2
 xt5Cu3jw6VQnFPl71+K9yGUCRkMrb7Cnfl9t0Wjj8L68jNhKshJHjGJaVcDUZFuOa5Xs7PZQcUx
 dubvgU6ZfHQDlbpZR5+Paie3RIA5NYg54R6OJLVBU6/7htBcJHsc58QiSCGBYonsIU/hAuxfFrJ
 jUrWEdQpGYNdkcgrSGJu6JCWFJzeFLfH5bVtY2rPhhq48Nz1WHI/Ssw8zwmm1fMDdECw7ha4=
X-Google-Smtp-Source: AGHT+IGv53aFY/smpgFXW/oCSTDYePapi7m1QyfIY3Vehuu2Sb23CG8TNHwz9smozWCA7Gl/gnLoeQ==
X-Received: by 2002:a05:600c:3b94:b0:456:1611:cea5 with SMTP id
 5b1f17b1804b1-4562e3b9a23mr134365e9.18.1752607557447; 
 Tue, 15 Jul 2025 12:25:57 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560d019f1esm106171085e9.10.2025.07.15.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 12:25:56 -0700 (PDT)
Message-ID: <d384b96e-c705-41c1-9990-81755d2f850f@linaro.org>
Date: Tue, 15 Jul 2025 21:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h'
 header
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Maydell
 <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>
References: <20250715071528.46196-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250715071528.46196-1-philmd@linaro.org>
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

On 15/7/25 09:15, Philippe Mathieu-Daudé wrote:
> "hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
> arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
> Remove the unnecessary header inclusion.
> 
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20250513171737.74386-1-philmd@linaro.org>
> ---
>   hw/arm/xen-pvh.c | 1 -
>   1 file changed, 1 deletion(-)

Queued, thanks.

