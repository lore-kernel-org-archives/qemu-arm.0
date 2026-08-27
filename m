Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB74EC61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 14:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzaxo-0004gV-Lk; Thu, 27 Aug 2026 10:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzaxn-0004fy-HM
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 10:20:19 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzaxk-00082a-UL
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 10:20:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso220263866b.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 07:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787840414; cv=none;
 d=google.com; s=arc-20260327;
 b=JBQg4bXi6JvDbATqBZ5U/7EMXI2ZZobISovI0or//HK0Qumz6rmSrCJ3bsd3Ssc+hF
 9R9aNIXbEUlOj1ssxoB/40/9sRKAyhStvSOw1xa21a69pnOz3kEygca8iNTHCJ1HmJZj
 IKySXllzOtGmfEwkeNMRRylwRWoV6u5+rfM0poJl6hCEG3Wb6DDLRCjZkkX73X3Khxtq
 SQZvnV2E53rwRncmTZKSaWFT4UPZt2ld2L/tyQZkytAqy28DXdCyLA92y1HrUdSS52op
 Jy2j9bOTLAqyDU9IT5UPgRSkpPtjEPWYawTFwgLK2eXNye8k2fH25FivQDiv6IiwHUrY
 p47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jo5QvHdCL1a8NnANUDEcncw8+Elfzj8WFiScGEWgQFk=;
 fh=9beSpFyCNLt4Dl9QMIwWiM/VQuT3rOz/ezwnisy249o=;
 b=AwHm430s5n/BL2QfdvzZ2FWTKFDPRaiktH2qqgnMSXRfkqYXlupkQVFstl++9HKT12
 5qzxR+bMiY57SglBg0fmuESaLjPd1qbwNAATMW/rjuy+O0a3bftgCtaiCwnEPgasJNuZ
 ZXPJpp4kJLGMSnRoWgkMhczSLx8TPSzfNmWDr6LzksbwS0LfS9BU3JIo4iAQmsO7TU/6
 3YWBFZZcsf8vhMeuavG19Ouox8mmHDN/8j61MMNxQXs2CpiL6d3lhhQlXDhBiwpkY6H8
 n7RdGLoj/ZX4MjRmrVfn30QmuvSLHr7GgwKVf406Nc5ad3ETbQsc3MF6+qqXCxSFkrq6
 jOTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787840414; x=1788445214; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jo5QvHdCL1a8NnANUDEcncw8+Elfzj8WFiScGEWgQFk=;
 b=jpQBGpvpj4b+AKiooW9OXIadCoezKEK4zweuBLeox2Fq/tPnZ5cPJcdbYjyYhau+1p
 tohMYsYr6M0pWv7FODuN7oo5eYXTI9hcCyZFiSw/GHh6gDfqlWN2BkI080u3X9pL5o1J
 0hU0vpAUYNNdWSyp+KQWRLbuTvb6NIRSModREtPK1scVcXIlgHMMn9rga0dXwqYoH4H6
 MpJGVF63sfj+4uP5au1VGFayqb1NPwzzZKN9Qk+CPmdCxHd60W5dE+6c+c9oaHgiXA4Z
 /UI4/yGxphMaSzP1wf6W72NDxZOkPdGUnd8WLz4SXJ+o5Hastke31kzDrrJpago7UUdF
 I4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787840414; x=1788445214;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jo5QvHdCL1a8NnANUDEcncw8+Elfzj8WFiScGEWgQFk=;
 b=Wp/k9HDY9IDm692fGfgZE1WMhoXB1FGGUUfoRK+GhlJkL1nXSWx6ZKWBQyj3YrG7Ss
 ZPGR00EaBJ87aMd+Lq/3CZ6tOfOxww6YqY9+xzfTMFtXUddErf/T+jyyTwZ1j6n9BM5g
 l9EHldk8tNJQlGf8KF2eXuSKqCriGfe4Ze/NlYZRFny3YBBUZfM2HxZ57fkVJpvVflqD
 V7+TqbFfiqnW6mGhs/3r1As1d5l+VzqRZkLbdv7l3nHjBaPPD+3wTP7Gt3704gjwMfQN
 4dd28aYo6jYHYn9OO2mIaeegWD+FFeDnCLue/VbtEEkJRzIhRdJe9u1MMiYov6LJak7w
 HSgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7ZedTB3ITvCMFJZucz3KWrDKL11qcr6nexccGjmWJ1PoKN8RVkA8I5zrnqMhOJyCmmIOHEuWmxA==@nongnu.org
X-Gm-Message-State: AFuF++kZpsg6yYEVYXe0jDD9DPOZvY07roaVn0qpKtNomoGNy/wl5sf9
 OIR65etO/nTzsLpTU8KmV9px33V+EKtE/F98nbuMjGIUgNTPiQdfk2uRq+dtVI/cUe4hRSr3iGf
 8RHHSgxgUGBFOlALLjjNx2Z3tCh19UyWR+oSlV/uDHA==
X-Gm-Gg: AR+sD12m02yxKtoOj49P2NDX58qVwGLioqBaIyeVDx5M+p8YAwABVz1TciqXuhN7K0H
 yEGZMwkj/fXCGIR3VU2cqBZ1HMa/4D847+EHnJcRI8Jz3TaiaspMPqqdt70Bt3jXj7AvCOuP1fr
 6GXkSc6PtVSnVv4d7JcRw2hYxM3KvMwl8a5iTlK4tGxbavo54xEhOJ/Q/M4g8dLPgwb30lSaCFP
 b2limKfrlKLTNFMKEX6IU4iXdOiqxJTd0wgnFzZ5wJzONdNxHjVVmy/5k5nnOf/yrPicVGSCZt8
 d6wZsmxGJpx9ZUKRcO98JACTkxODUaIhVTmo7W0ehjMg7aBrfwsLTTNmXUTO2MImHRIkXnIaT6T
 YW3bK6CbghYSl5G0+n/sYq3W06OsE
X-Received: by 2002:a17:907:3ea8:b0:c25:35cd:fdb2 with SMTP id
 a640c23a62f3a-c253602a2bfmr582938666b.7.1787840413382; Thu, 27 Aug 2026
 07:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260821213536.433273-1-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260821213536.433273-1-pierrick.bouvier@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 15:20:00 +0100
X-Gm-Features: AcwNN1W-CDmOnrz8puj-d53M2XjGvXbnyFRB6QxQbp8bjPZiwY25hBg7XfbY3IE
Message-ID: <CAFEAcA-gqJb-1k3viJng4V3uKFs+j4L5-_x=6Cgz_GP4crpzPA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/tcg/cpu32: make compilation unit common
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 21 Aug 2026 at 22:35, Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> We just need to remove TARGET_AARCH64. Simply expose all the code and
> conditionnally register types.
> This fixes single-binary with arm + aarch64 targets.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

RTH has proposed an alternative in
https://patchew.org/QEMU/20260827041557.775080-1-richard.henderson@linaro.org/20260827041557.775080-3-richard.henderson@linaro.org/
 -- are you OK with that approach instead, or do you prefer this patch?

thanks
-- PMM

