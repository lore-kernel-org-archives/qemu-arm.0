Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02520E9B356
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 10:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx0Q5-00011K-MC; Mon, 02 Mar 2026 05:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Pr-0000Bq-5d
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:22:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Pn-0007cM-N4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:22:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so117145e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772446934; x=1773051734; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gz1hN0+eeBQAr6nQnx5mO33Aq5OmQ4jTmU6WU/KWcHk=;
 b=HWwCtrpLlGYCjKv5blMBeiqkEaHj98AgFU20Ox1YMt+OxgKWCtOFiwEaVRpkQbPepn
 yDnZyE8m1sBC1Jh8JrbH5n2kUD9ryySI6w8HsObawrV/+R8qwlmImR0pZcXtumgiZVqc
 A+cUP2amRmcn9TMpVHOHOYRRewFx62nRw9GZctnahwWoJ8ag2y8nAyigibMP5bt7PlZW
 WZXc58+bXvYZWDnqjuVTPc8P1+1UIYQlGn+/VX3aOvmrLSD9FP8fqfLlvJVlD5xB7mz2
 efBmeVZZ5uPMqsZc4MprAh4NYyXlvqFJC0R9LfKas2st/ckvshHTnJjkbmtF1iK55NLF
 TxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772446934; x=1773051734;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gz1hN0+eeBQAr6nQnx5mO33Aq5OmQ4jTmU6WU/KWcHk=;
 b=ehUD0kSrjQmqJ1FmwkGUYHUDxwrhmnxHZuIh301DMfRRayLDrro/WT3z5FGdmV8xXX
 XWEesvOl8IZqpAbSQicVz1CgbKMZ1v0bcs7h3JO8qwYhGg/OnZsw87oH+GFInFpK/mF9
 07QtoCzzftYQGKB4mZ76lStdVXv/HyDsGWqmeDXdWBN0NGYKSrsR6LGnHzrIHrY9SP7z
 9xLwFIERyHJ/XLVC/N4I/J7IzQ63zIr2YtW4tGYfBQJ3RqoBIA3gi6stk5+gKzto1hcW
 NGededwzGSmmdXL64ZA3NAzw+FumoaeQcXjn0oa/TTHjUJphjLhw1pbAxBehwLI+y3id
 fLtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx30pMaTRfsCVPQYq47LvB5zyoXl6v4kfdHWhhEtYYIj0e/KQSJXd4hNt5nhHeMPV3lc/YPiYMRQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzlt76eElRhbx7kE/lv3vMpq4UYvPX5k08qF1fdxqQCsStP3x0U
 5SbFzYiZC0Scq3fwVON2G9rktR7baVqR1+ige5fo5iLgrS7sPkAH87vFjMOc0UcSTg==
X-Gm-Gg: ATEYQzwPQoJoFIlMbcTEGn5z3b9Za1sBobPTqEO8SYklVWkzEYeRVXvLbH2mL3qMp9X
 2RVK+WmrZAPHWTHQXcyFdjaha6k3B+NfGycGpHc40Ek6SL2ylRLcrw/elPPQi4NvrwIubBSoHcc
 VQ8FMVesOmcz2170nVtJuCsr0w4ZbMleEJNDRXyerESYBe2iiBWU09YZjnlRTpW8Hw7H2IsD4tw
 iYS00FO3M78+bf3zdwwaXqLlW/u98eCP/qy+N5pDrjrY4GHk+O8HlJ3MUGcH6/ZZUIXZ+WuIHRl
 Zvi2QBrlg0wNmhIe6cclRTTBOD57VyzI4Lg21J9WU8z1ith2Lpg1FaTQg/FWrciz1Lltslnpmlc
 +rpnN+Hg9Nm0gfS8dniYjpcVjE7DY7NWY0WCyayFjQrypTSXytmGFHo7muFOojPjFx6yYBRUoKk
 A8MoSmKOqiwKiUhah/JpEis7ALRVBsZ6GN4WzYkJ7y4aa5HzV1qtYwfXy4jf81hbJ5
X-Received: by 2002:a05:600c:4b0a:b0:477:c5b3:7a9b with SMTP id
 5b1f17b1804b1-483ce5e98cbmr1374215e9.10.1772446933663; 
 Mon, 02 Mar 2026 02:22:13 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfeb932bsm123258085e9.28.2026.03.02.02.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 02:22:13 -0800 (PST)
Date: Mon, 2 Mar 2026 10:22:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: Re: [RFC v4 12/31] hw/arm/smmuv3: Store CD NSCFG in TT info
Message-ID: <aaVk0PuTAUkryPLb@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101632.2993305-1-tangtao1634@phytium.com.cn>
 <aaGtANCP87L-_gtp@google.com>
 <2c1c08fe-ddd2-47a9-9e9a-4a900df60bae@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c1c08fe-ddd2-47a9-9e9a-4a900df60bae@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=smostafa@google.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Sun, Mar 01, 2026 at 10:21:55PM +0800, Tao Tang wrote:
> Hi Mostafa,
> 
> On 2026/2/27 PM10:41, Mostafa Saleh wrote:
> > On Sat, Feb 21, 2026 at 06:16:32PM +0800, Tao Tang wrote:
> > > With NSCFG definitions in place, record the per-table NSCFG bits
> > > in SMMUTransTableInfo during CD decode for later use.
> > > 
> > > Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> > I feel this patch would be better squashed with how it’s used,
> > but no strong opinion.
> 
> 
> I split "definition" vs "usage" here because Eric suggested keeping plumbing
> changes separate in previous series.
> 

I don't have a strong opinion, you can keep it, if Eric is ok with it.
I was just looking for ways to keep this series shorter.

Thanks,
Mostafa

> 
> That said, I don’t mind squashing this into "hw/arm/smmu-common: Implement
> secure state handling in ptw" in V5, since it’s effectively a one-liner and
> will make the series smaller.
> 
> 
> > Thanks,
> > Mostafa
> 
> 
> Best regards,
> 
> Tao
> 

