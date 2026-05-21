Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53ACD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3iY-0005zy-2m; Thu, 21 May 2026 09:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3iK-0005mA-Rv
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:45:29 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3iJ-0001ar-85
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:45:28 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso530482d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779371126; cv=none;
 d=google.com; s=arc-20240605;
 b=giieXaQnkJ8XMXBPSDcpCkSAMRJcW4cc7kT0YS89gUrWlcPWWVX6ZUK3rxU1EMOJSI
 X58WaFo0Ibv59sp9z81hYnc5xytFtnfmD3TY4PAms91N0gzlmwPcgTZqbNYaYyswycdH
 8OqenErRGZXiapsH62X06MGHJQPcjGUcjuToBpkj134CSIcRW9hOM0WzLrTCQhdPWv2i
 wfRB0VlRlighYMF6FxOBdqljoGIKNN4Mw19zc/0MTtnQxELTYIc52uqui5briaIW0LmM
 Q0iyBehQ3yBmmmUndFsIJ/UMTwPlM8pUreGvH4PFhfFQQR8xs/6IuRnicGLgdHsZl2H+
 62gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hR6Kgi/hPq20tUIiVCeUY55XQJ4DT1x75IeZjfiM8RY=;
 fh=zF5XallEtD1Ao/8pY/pCMvqcNKIqt+mQtZz3/xk3p54=;
 b=LgNBS4+a/BnKaxqmZuctRZArRbH0dKbSxrEZM51WIprZz/mTIYtXcLtr+hMkcZrOFo
 H1ZGBYvIEG5N64XMmyQLUeBYlxrrX6FlOM0I7ursLQtwH2UMHxguWnhFSCu6rbnrQOwI
 WLzDqGRorUdQcxIuEmwOIioKoSOzMa/dK55jEuTqdP7sIaR1eJox70AiVC+QLGoC3yTU
 T1BSNcg2C9U6Vh1md7IHnaMI309WNhfz6XUIXoP9k8Wgcbx8yZBNnFbDNNUqpub8BYDq
 MahM2rZlTOvRYvHSm/2qjHNQ7a6nszf+AYszA8wzwtrCuMYe4HUyx/CIL4mPQhKSsYxx
 pmiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779371126; x=1779975926; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hR6Kgi/hPq20tUIiVCeUY55XQJ4DT1x75IeZjfiM8RY=;
 b=oGN8lR5fUf+fXszCXU/p7PMB+kgqs7LORCfYm5iIZ+LKr0jt40oeZ/kRAMr7pqCpym
 b5zWZvgtpitq23AG43g4PLpMxZZlFAvPosioaOhyLf6GQI2IKRltoUtsX0XWItE8QID4
 i9R7IPwaN0bgQX5DevQmSSctl5KuAHH4zR1/TRzzuIlaCXNmWE93Lo62vlKS132ExVMD
 HxEk/mkHPZ6zye0kYv0BL+LGb+iuSTRtEMxZnSxjoloBM0tHrVBcvqY5w0YuLFPNuHwc
 NseWEWKclmREWMWyr7Sxd1jLQzrbwqdxJf9LOAB4qY+JwSv56i/ObPC8sqaQdaDbqiv/
 a2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779371126; x=1779975926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hR6Kgi/hPq20tUIiVCeUY55XQJ4DT1x75IeZjfiM8RY=;
 b=FgBucrXLTEMtPT5dUqX3Fmheazb1F4dz8aUVS9VPmOqdBqxocey6v2NjtWmdSa5Xfz
 Kra3GDoAhDWJGPOQVIDYxRZ4hDfLRgnyz8apZYMjVwQbjCHw9JV+TpFkiUJKSYNOENcX
 1cBJyJh8CyVjNcQjiR8/IQb2LARXE4DeJUOtgOlRE7aqX2RclsyTiKx6nJUcmTNQL/ut
 3b777LNeznEC+x+nkFPawaLVZjB+XxgcTsbR0yBnWxzw/KD30JvCoIdhRYzZ/wregJ56
 6bukDpYrjOyanXUtvb/ALNSxTsqggmj/kTsGYYeuWYHEsZlzbt1nMyc3AxIm1EuO5Yyn
 D9ig==
X-Forwarded-Encrypted: i=1;
 AFNElJ/+QcDNr3hvfP0+K4b58kZAmd5hgrnNCM/N8NNCkdaFpHQfnNEmTp1+XiWAvzAtmDikCBF+VF5afQ==@nongnu.org
X-Gm-Message-State: AOJu0YzIlzj5Ju/aGNH1ai8jqH6tyneU0D8si3i1d1vhHCxj/8hSiS8s
 TcyCVCHdq3mthsRaxp1XWcaTX5fVSSttrdVoSR3u9meOC4t8qKxxGKzTG5q8oeWHfdvPB/mz67k
 j/DR1Q8I9nhhR0m5yqIfTL+X9pDkiLW7vV4DBDj7CxQ==
X-Gm-Gg: Acq92OG0kDUXPqdUvpTh/OBjT5XAiZHefv0g6Ba5IBt0R2MQKjXJhWyovTR+aafqZSz
 gaVrHkm9Q9gvXfan1yYAvJS91THDup056qh49lDZ5VHixSC9kKeqd8utCjJYcDQ4+jcLmeOba7f
 X1gbbF+VxjIPMA9vLS/MJOc8+ZXLp2V1LMRN6aQDg6Svqz5iR1fm2X4TKsN5ogL7RTvOtH6XuKT
 b4tk4Lr2n8r2cVfK25NkNd6LzO30pU7kfxEdQwwqNFuPdCoKrt2aKnViH/TijIPHi8mCct/lVuj
 TMF8aeBNCQHzXsyumYd1Vl+N/2Xs7cV4F0j4/2pwRZlHTkK5t/F9piUoP87NbS9tvjc=
X-Received: by 2002:a05:690e:1389:b0:65c:4889:30b3 with SMTP id
 956f58d0204a3-65eae34d005mr2784093d50.60.1779371121089; Thu, 21 May 2026
 06:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-4-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:45:09 +0100
X-Gm-Features: AVHnY4L4G-rgDvgBniwFTS5dMDZcDiGNffYcdFBarwI7CgK7pXt-c_o2Shvg06c
Message-ID: <CAFEAcA8z5d0=HcMSJB0iQRbmVgTSTFQhXHszqZef6dw9JyzV7g@mail.gmail.com>
Subject: Re: [PATCH v6 03/64] target/arm: Implement FEAT_FAMINMAX for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 20 May 2026 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since there is no bfloat16 variant of FAMINMAX,
> check for missing function pointer in do_z2z_nn_fpst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

