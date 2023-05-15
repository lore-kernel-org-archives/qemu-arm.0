Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6643694ejq;
        Mon, 15 May 2023 09:49:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64zyWKOOVRqtdVl4r5TcGIgZYBa548+7uJX+HinoXMWXtbERfc5K4ttdPlpVV3Wk6IdCti
X-Received: by 2002:a05:6214:301e:b0:5c2:6493:f631 with SMTP id ke30-20020a056214301e00b005c26493f631mr48446768qvb.51.1684169388919;
        Mon, 15 May 2023 09:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684169388; cv=none;
        d=google.com; s=arc-20160816;
        b=A2c/X19zgohz5GgnTkYwzxp9a7aJb1GS1LU36H/Ew6gt3S3eHHKiBEQzSjMwB/+GZ2
         jRCMvZsSRBIyWIHc5Tmy4EB9BkybfYPz+A6DlbSs/V9VbMMPLe1DneSdMzC/nFNc6IWw
         h9FN/mlG9iPzYjtIH/pb4A501nrtDVhU6QionD1XImF+KpDnPvwMZKMDmPOTAozrzUKP
         piGH8eEEyIN1ERquqcaJyluadicBLxB8K8uZ+bcVec2aqw/iVnAiBxe7u05C0b9obATc
         xd88rD6LocWTHYI9/+iPbCp/qdeyMlCxuhh9PV2wPBoJQMCrrhv/wtb7E3ZTUNMaFDoM
         +vEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jg6bM4ztTQjpSg/eFbvzy6w9qFybXzN2Ynr+LYIPO0c=;
        b=ifTEPtx3nm72JoNW4nepzjX54uQjvOA7iLcWBkQPZGUE3IN9OrJs3YUyzDLuTKlWvT
         2X2MPBj6JkuNt6aVzoXy3GnRf3g8NFEmPoC7SrMdH7v84Cx2myosLuXFFOGpqRlDbWCk
         qjvlvo6glUz6NY0RzzZGSKxB/sWawUfDhzTlj2x13NXBQJCxWJ+X9MBoFV2bu/rmxTNl
         P+hBoC3kccxkSMvKBtw/k0bCtzF1+ZokOMUkHrxVwnYHU0mbQZOQ5fI1KxJmrXByvkMT
         OdQvWLfxmQTiQsGdtcO2/a184+m9MazTezURsPrjtFCiNzxuFDtKrV/btOtEeMl4zjYL
         Dc6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjEdJXud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a0562140c8400b0061b9143f540si9835530qvr.289.2023.05.15.09.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 09:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjEdJXud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybO3-0004et-OE; Mon, 15 May 2023 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybO1-0004dr-TQ
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:49:25 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybNo-0002xN-A5
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:49:25 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96b4ed40d97so164738266b.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684169350; x=1686761350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jg6bM4ztTQjpSg/eFbvzy6w9qFybXzN2Ynr+LYIPO0c=;
 b=qjEdJXudTpGSPmFqH8QQLqKSR6zokIdMasMiB1Ui/87CMLeC9OLPWrTzvNgEHNa2Hv
 dnzTrwfeGvKee1sj+rrIwhOk74UgL+G+xJ2vSyTij7gDvpmXWXmkDubeeFJMB35ELvZu
 4nEJClZ1K0MY+MqurKvJgLSYy2ckDDoqX6CE48Qq4U1jvJpm2+5j8+wgPgV5Ct1Pt8G5
 z6bVMLLSTXtl92lL7FRcEicUrQp0a6zhwZUY4XQo76Tgb3GCm36PZWKnQgcW3RB6g48t
 yMbSUIHasIcxZ17Uy3dgXXp0ITRn3oTYKaUDKV2mlaGzFFv8pW0SzKOX7wRsKa/8jXYb
 xMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684169350; x=1686761350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jg6bM4ztTQjpSg/eFbvzy6w9qFybXzN2Ynr+LYIPO0c=;
 b=b1YggOW0DjsdJlR43UQjn2X3EdpGjS+zbdB+k7bVcZZlK2TTU2RpbB+hhEcLsglibi
 fgd7kx3Ghd8vqsjOMUcOuyl3c57j/F4c01yVllSYdYbI7cAOxcY9xQyCRFJEvFeBorw2
 z6xb76+/S6pQ0eQq8WG/Dc+Zc73MxEfLTWHdUf+1J1UM5ZgrrQf3861/F8E+YaO2eiqX
 d+BvbxmM0QRQdOLtD2VJhC5PDjcBYx45A9PCoOcrgf2d7J0hxBGKiX/VAAlsddzrde7R
 DK1D67WNtjzIXehg20h3OyGPO436z5QjsX/I+8FBwDVenVjZNRorjxbM1Gezdk/rxdhn
 55Bw==
X-Gm-Message-State: AC+VfDx/DZy1PohiM0yw18XKFoyEyklHipdkWoUE0ymEQKyEQjcyg6+3
 D+QCkLfWoI//rBOuq3vX/Il0fJ0FpXWt9Gcpa5tepQ==
X-Received: by 2002:a17:907:6d11:b0:969:93f2:2593 with SMTP id
 sa17-20020a1709076d1100b0096993f22593mr21607526ejc.27.1684169350604; Mon, 15
 May 2023 09:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-4-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 17:48:59 +0100
Message-ID: <CAFEAcA9TeEWiqxQsMvbGsX2ctUSZD8OabFf52QkTuv0XtSL3rQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/54] accel/tcg: Honor atomicity of stores
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DkIFXSa0fRW2

On Mon, 15 May 2023 at 15:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Dropped r-b because of MO_ATOM_* reorg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
