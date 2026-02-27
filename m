Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2199EFEFB54
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 14:49:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvz9e-00007d-Bm; Fri, 27 Feb 2026 09:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz9a-00006U-Ug
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:49:19 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vvz9Z-0000dG-Es
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 09:49:18 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so73825e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772203755; x=1772808555; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EMytu01jL5efHCJb/FWsaKOhAjnP/YXQLGi72/gI6no=;
 b=RU9hZCih0oiUB4h/ZNNUnqC4KelrlJJQE4ajcuIlBcuC9UBGgbOUlFPEYUOsKgFF2A
 tN8hP5tpS20xJ8ow4xAKlyIvMAFspVSOG/MIZMHBxG3PLi1aJTKtG/pgWg/5y02Wr9JT
 P+ryO4CGlEmkEx2zsQCEXzGAT/f78yyWg7xaNyGl10rJG/GRecC97ev2rCrBiuCJrvBD
 gOOb8CnQWo/SQVM21h9Q07cYeDWwKIWF7AIe/BSLbFlT4z6BM1GLQGToeNAL89Gw2UWA
 SH27rSCEf0gIQbrWK3GNpQGbBdcloXRNFVSqfAjPg+EefTyO7q+/MdRcqnfCePhq8pJH
 lCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772203755; x=1772808555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMytu01jL5efHCJb/FWsaKOhAjnP/YXQLGi72/gI6no=;
 b=fVbaki70zX6L+Z75vOBiR+scNjx1waqAnL2g/8y4f0rlLAvQB9Tf7tYufz2WEsh12Q
 LSN8jrluNRnmetY2Lgril9zMn/UYQR9oHtHAYzZAmF4Wnvo7ebvavZZq8h6y8+c2rtSk
 9gVyDzEi5wRU965DX/RUYo/lnhVqfkGzjGMR1dPqUkK6ung1yH99Zm4w83llc0TzrBSD
 bU7K8QBSNj0MdIzPATH+K6swJlwTAZeAbzNomKikX8oLews/jGqXRk0DKrBx1qkug57Z
 nloOABTdW5Zxvzdc/oEmf27e83SYpoSSYuAR1WDZ7xMRIOyqj5Pv2Ieoi+e6hKq1EXVi
 CG6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3aPhs8+mHcbspWV5+Lf3gOd/kWmTqSS1PHFbaRMOvocqD6u2X9PYsMLjUOTvFWc7KD6kSFFLntw==@nongnu.org
X-Gm-Message-State: AOJu0Yxet8A/b9xS7xuWWxHPtMjgw4W7b/KnD3aYQ24UjdBOkL//53xR
 vK85d3ON0ZOj80u2jBREPOP9ut+3D1T+RTDtityHq3QalX2CxugqooqjsVFCCb/icQ==
X-Gm-Gg: ATEYQzxGXK2Q/7fpR/Dc3nFoYoqHcf0/ItVO7uSgpevEUuOkPZtORw50OJuEZdN7Xwv
 ZQ2LbDSowFi/C9bRrXCwup4ye1j92aD+hOg2/sk/YFSAfVe9udFfe3l78x22bytEG514yOrMs7F
 3vuc8xkCa/m2rIEhULWDVhd7PpaDM3UIYCd8g7GawHpK5nHsp+9BQa6CxaiTum6qHTBUYK49n+t
 v6id5oFv2S03+MVtoJEeoTKLLIoM9+mVNEC7W1oxvOhN5VO1ztSMFVhZ59t/HowDODFV7kLzwn7
 Xtw926M9CCSl9VsxfnXXcianFZBat4Yt3XPWE5L1wFxCr0cz1WgkfuSmtYUodT1VDKblonEk5Vr
 otHC1uOKkjXYDLoSfwQ8MHI4UZ/EbVFoCT/VOSAxewp2MthMvyRD5vFkaYxdG4/jOV+DzBOLZlG
 9Ur5HnqjUORmu+ivn4tywDM0HkFNny5WALRbQ3dHpK+T/LVVL6pbvtlWm4GgceZrnb
X-Received: by 2002:a05:600d:9:b0:47d:1e65:e841 with SMTP id
 5b1f17b1804b1-483c39ee08fmr1489425e9.9.1772203754670; 
 Fri, 27 Feb 2026 06:49:14 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c6100b8sm8556456f8f.2.2026.02.27.06.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:49:13 -0800 (PST)
Date: Fri, 27 Feb 2026 14:49:10 +0000
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
Subject: Re: [RFC v4 19/31] hw/arm/smmuv3: Fix CFGI_CD handling when stage-1
 is unsupported
Message-ID: <aaGu5v0To65M5LkB@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Sat, Feb 21, 2026 at 06:17:33PM +0800, Tao Tang wrote:
> Add a STAGE1_SUPPORTED check in the CMD_CFGI_CD and CMD_CFGI_CD_ALL path
> and return CERROR_ILL when stage-1 translation is not implemented,
> matching the architecture requirement (IHI 0070G.b, page 176).
> 
> Fixes: 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>

This is a separate fix, it can be sent standalone to make this series
smaller, similarly the first patch.
Also the "Fixes" comment is not accurate, that was probably broken from
the stage-2 implementation which was added later.

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  hw/arm/smmuv3.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index fa09099a09a..d4c58c0c724 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1461,6 +1461,15 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>                  break;
>              }
>  
> +            /*
> +             * This command raises CERROR_ILL when stage 1 is not implemented
> +             * according to (IHI 0070G.b) Page 176.
> +             */
> +            if (!STAGE1_SUPPORTED(s)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
>              trace_smmuv3_cmdq_cfgi_cd(sid);
>              smmuv3_flush_config(sdev);
>              if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, errp)) {
> -- 
> 2.34.1
> 

