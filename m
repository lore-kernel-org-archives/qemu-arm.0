Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6D6C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:36:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojqp-0001W1-74; Tue, 28 Jul 2026 11:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojqn-0001Il-Jm
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:36:13 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojql-0002JP-Ot
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:36:13 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c1c26d7e951so571823766b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252970; cv=none;
 d=google.com; s=arc-20260327;
 b=skKz//38H0yXcW4ljRljPt7hYg+CLxxfIKi1ncb2xI7BhJ0HeZvBS8nBM0baGI105b
 opdnNXkCrw2SvYnbpTWd+jw5j8Xq4LSv3krfs7H0MLl7GwDh+w6Yua+6johJveK9xDfH
 gb7pGdTszAxREi8NNq8BtmMCljYrBjLJFmFl0WwWQzpqyX1WBkOG7OT4c/56UMISBShb
 0Hd6cgzpZ0AREcqFOGnHGwEWdOszRQdglyAgPvk/ccTt+WusiD7RBh0VAFMOJ1nh2mAO
 GnfIlz+jZuH3en1D6Qr1kpGM4ERbZS+iN1kBfmZid6uOHWQcq6B27IKLEcIw03fYIxd8
 j0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dLcCLcTgzyeo8IoOvGz4mAtND1LVtYwj/xRC8TLH5Qw=;
 fh=APLzH7ENN5WIaOfO5A64yAV8lZbGcTqeIjw02U9kat4=;
 b=eiPOnno0PJAalKjMU+AgLPbxKAKKscBhpGw2Y9z3B+Uc7YBxDLTZzKqsn47sZxeXJd
 pOkZHqLHnaZ3/aJrSfxY2S8NilDUVQxrmnAHC6hce2qlKLRES7+kzbpoVnT7xnj4ZoQf
 kkk7RT9yoiatgjuuoti1cR68xg6kh9eqVN74Hx5gFfgsuxkJNlWXfp7MEpXMQysURyl3
 0xR00TKk0ylfYtoJCstPuGG5eFw7Cmy8m0p+azY3DzZke1uddE4d/AysDjNr0oBqNK2o
 oj7tnwzE7cINMJ5K4G8X/XOzxiZnyGTdoeLiijG8+3hG3YXWZpfFVlB9NI3H6iN3fO8P
 86Uw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252970; x=1785857770; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dLcCLcTgzyeo8IoOvGz4mAtND1LVtYwj/xRC8TLH5Qw=;
 b=qBP3xVbRjjJnKhaYTWPj5zXKSmVyWkAls3CZU/lF1PqZRhxSmtZpyTGmhvfy2ttp/Q
 fjz6/xHDlF2d2/m/1YjADdMwzz1YN2zMj3N9OynscNd6i0zZyCIzIHqXW0GSKBk9rMa/
 LwLaRIlw+wLQU8Jaz5uK0yjT+fcTs/4L+uvzdKy+FyAYabcW48ZeGoY4wlUxzpaWF3Rq
 F4SiPD9X4psBiif/ay7i8XerAIuFm/kZgBPn1lSV0shyOxFqNFRRGm/RymtOhgEnS3Jn
 qsaNFWjzdBSTGO1/rN+PUNbCC/gDtMWVBSzwjNWdTINAtikex/xKnOzON17rvmE+b7a0
 MiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252970; x=1785857770;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dLcCLcTgzyeo8IoOvGz4mAtND1LVtYwj/xRC8TLH5Qw=;
 b=fXG9crMMBMbHCMgbFvgl+14VnOt8iIMG86upPw1htwUa1Hgz5vEp7BGUw4Up6mLPhP
 r2gvUbHAb0o5pvj0WPsAqk+uPJwA1b1nayEJGGwFh/TlttrGmVv/AtcVrDmgR6wcxgDn
 uKmlScaXTwTh04hMaerVzDqs3zF4TwTHteXd7Yjt/KpbixiylB5buLPHbU2YU7uJYdjl
 99vsx+S33p/b0hkP8MlC0rbPMgmba1kkDhscuy6lOM5OekaIo/OYCAB7TScYSfa7po+3
 21gW3mu7qJESF6b36YRIVhsE6eWF663WBofUc04Lin84sEgIyzNty2MM/ygCNFw8r315
 pV3w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrlGP79MKtfIaJC+oebPC7zfSi20LmOBITzV7pSyBqL6A1obZWbTTTNDIupZ8N/VLlGarNwgkvpg==@nongnu.org
X-Gm-Message-State: AOJu0YzUS+nCd7VjIJzVXIgsiOUgwdkVaznZXE+Y+eJrusdE+iwChQce
 roJ0y+o3Pd7l9hiZA1EjXRiuZBHqY9SOL49JLNolL25sItFQw8UGzYvx8asYRdfXy6ZoSEvj9w4
 /neQs8IvyMO4ce2tRKvg58ydxKjGG157uOzNHk49qE/rw0pKLdXQ3
X-Gm-Gg: AR+sD13gdpdCYr7opuM5uquTUtdD9Vvnl0fDwJoioJaWPwuPEelrk9DdTc6iDHbOac2
 RX3s1cdawZpiyUbEEbn06uWTQS2HxV0TixHxVwroWfEvaLtA7TpJAAafUwhs7p7MqMnT4AV4jX5
 aLSgPuKyDBmw6A2YehLGZ7wdGH67VtAImyogOwWn+H//ijSc0kX7ccI03HKGoE4gPXWUD1qGcA3
 MzGupLSyzflSXgxOaZBZzIIhLJqNtUKuPT2y0SSmZmJ8nIpXgAPrrT1yFu0heU/GLoh/I/0IUp1
 dukmJNxGgSLQPfbuxwI5AyOscyx4e5mXR9nQgBVeK4Drbg==
X-Received: by 2002:a17:907:9309:b0:c15:ca27:5818 with SMTP id
 a640c23a62f3a-c1f72115255mr181469666b.28.1785252969896; Tue, 28 Jul 2026
 08:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-14-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:35:46 +0100
X-Gm-Features: AUfX_my6W4ZypxGPWeKkoZqYvLEUovUQVTHXjAizzFrVXoUXEdu1PUNf5S6c-qM
Message-ID: <CAFEAcA-RZ1MzFUCuP5G3gPMdU_VBeRNTscUDo626UXCoUYyBOw@mail.gmail.com>
Subject: Re: [PATCH 13/20] target/arm: Rename isar_feature_aa64_sve_sm4
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from isar_feature_aa64_sve2_sm4 to match
> the feature name: FEAT_SVE_SM4.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

