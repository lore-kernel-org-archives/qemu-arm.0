Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF27CCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9vo-000257-7E; Wed, 29 Apr 2026 14:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9vl-000247-97
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:46:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9vi-0002h1-Nk
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:46:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso885525e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488397; x=1778093197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sqHTyY/eV9Yj5rxUMndxPsZOPP1mlFXeaa4s1Vhq0OE=;
 b=K4D7lz0xLclab1RorC6E3c75l6/YPumutPZKYhk4WadQQRl4Tlbysdg932Nlh+sUU3
 YNVpARs0uvIL0nzBTUSiN1vx4fucmRHjeB0qon2Vb3QjbZo9TmUPNprTrekZerj+VTjR
 S5K4NFJOYt0TNaIuNgWCd/fEjKWLsMuyYvSDHKYJ6+ikjdgwUnYpxEHwLxqQm03qs9OF
 HVbMT2S+hr7FwFw2E8PBdX3+yCv7qMZUabYzXYuAeNI6micSgjDlKXXvFSGFFsJI+Sb7
 58Ksa/5WiR5juAG6NLE9p2sXphK27pNvdf+wsAzIAB5khjNOdqqD38ATOZeIP56MejMG
 TNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488397; x=1778093197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sqHTyY/eV9Yj5rxUMndxPsZOPP1mlFXeaa4s1Vhq0OE=;
 b=TkohFyXJ42dR4vY1KZ+jXJtuA0tIxE63vhuN9UJudcryPGdYM+jA79NZ/1LG8NIdeX
 NMz7f4qp5/A+zeb65SSAo8ezKJLsDvgG3fvzifzgRNAeQdQOIPjZPy19bmWMHNnkQE4L
 dVaYDRE40PBfKs2sefFRneICLns9n1B/Sh8RwAzCt99LIlFfICPTapT81lNZeyb8yGHV
 O2weAZBBNLYozz1vkGwaZMQZ6FAa1lAjTo/QpF+MdZqjNoj8ZkAk+amvg9VMcrnXNGtd
 SNAlju+V45v3f/eDn3Ogzd9hzQByHfHF0MES/nqHFBltUXtXzNjq4aWGISSFMB8FyVqk
 xUBQ==
X-Gm-Message-State: AOJu0YwKspi1x/2KnqkkZ/KB+FmQDbHytPm8taoEHFW+v/IMGL3iyICG
 bLgwPjIJ8XRgZTg19FitmPHDYy40DGPSVV/XTkUGBTxS415bWQ9fRBijhr/DjEMaa/8=
X-Gm-Gg: AeBDieu2GRDPuas5CAZPXEo++SZyaNXr4r0loMP/SU2R03s9ICeXPUAwoNCXBWx9xjJ
 OGDIitjqyHgz33aopxOx1yVFmyIBL7kZGTKQtAgeXr2i6vYjlOfbsadVftZLyxzE4D3PqWKBJLP
 cdWNzjIi2y2VD/WHcVTwB8N9ThsWcbeb1YeDJLiDlKSCAfTeXLbmVK55gEP7sGQED7Tx9k6B0/j
 O1fgjNDou6PyVbEfHKt8Ay5LT03H/g1biO+RchAilfSWWdAReHXBb+DOJlg+VfXxG/NSvHvtHKB
 9Pncv/GAkQjs2r1MTxij4hHDJNDQNMYeF3qv5bVSMRDfDssTM0GTAo7nImEgYVOHjdW7mGcj2Fs
 WcOV6l8YbgQ9hWuHInBjUIcfagO9fVIMn2QwNYL3hnhm4IJfYJMQt381JF6hXdoKrznRRNz0e/4
 W2h7QoKpm1nXKa+FDSj+3CEom43s1BuQDkeDQUgZi6Z+2EF8fmniy0+NrVAs6UUw+irjYOkNYYq
 Krc
X-Received: by 2002:a05:600c:1f13:b0:48a:7772:c26b with SMTP id
 5b1f17b1804b1-48a7b546cf4mr85058565e9.26.1777488396699; 
 Wed, 29 Apr 2026 11:46:36 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822d4b3csm8940585e9.13.2026.04.29.11.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:46:36 -0700 (PDT)
Message-ID: <4d641c86-96e4-402b-9247-b96fcaf852ab@linaro.org>
Date: Wed, 29 Apr 2026 20:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 46/84] fpu: Return struct from float128_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 105 +++++++++++++++++-------------------------------
>   1 file changed, 37 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

