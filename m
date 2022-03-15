Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3061333lfo;
        Tue, 15 Mar 2022 11:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx6EkrDzLybVLde2bxoezyeZTGTuohtWhqyvdbQsQDdpCgOYqBViJXXhT8ezgPTSHRmIvc
X-Received: by 2002:a5b:94d:0:b0:629:31c4:232d with SMTP id x13-20020a5b094d000000b0062931c4232dmr24507688ybq.455.1647367491991;
        Tue, 15 Mar 2022 11:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647367491; cv=none;
        d=google.com; s=arc-20160816;
        b=sS2Vre2EvSqgP5zWyPxE6Zl67rfVdFPLrGaj0YT1j0lrrM1dL2uoutSmZdpAmeOawA
         keMh7Qz23GshKmaebl5mn7ZtdvJ6OJTUnW+8I6d52SjoVp5PvagvebPGsIKLlQODxkmd
         sq14Jjv7/nHKs5pnVYb6QEjUhSZDK263aNz79h5D9PIzILDItQnpQXE7Di6raIA41m7R
         tmeXhOM+doATWzVCAYEj2PGdHN9unpQTJDdicVn18fWLAJxFFY0FBOb2qaMvn9V1xEuF
         7dayQOGEmV8+fZVQdb5oFhd5CzULwq0Taj1sGrE01OSpW32Vusja+EhWVPCtFLWENZij
         OOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOMr+XdYiP5/I68wcT4SaN1Qr9IFxn1qG8JehcCtBN0=;
        b=amIgW8396t7BlN7n1HM13Y9o0asvjXo09k7AdhVnHXWQnRtoJqxHM2anP7Zef2s07v
         XKULfpbhKs0BBE4QHPbbafIwLMQ6hlZgjozZSVFV8UpSv3b3dpFMDt1GQb+yIthsbilf
         9IkV3BTDo1eNsYoSB8Rm57rbO59C+GMGfudUkN/ed6/MkVyRatR2eAeyt4B9a+e23DuN
         h6QwylNIaovB08bmb+X1htt/O75u8FyTor61x+IGaBn7uTUNXdqm5CvBsiQRTcZpz3Ul
         51X9JeuXqVGPmf8XwcQr727v6ZqL65G4s4x9OfqsjXUPEkk80o8YvcWdpACU4SjPxAq6
         gtSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vt4yU6Ov;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 137-20020a81038f000000b002d0697e5700si11153397ywd.306.2022.03.15.11.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 11:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vt4yU6Ov;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUBXP-0001gJ-Ck
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 14:04:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBXI-0001fF-2g
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:04:44 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=40795
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBXF-00084S-E9
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:04:43 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id z8so66414ybh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOMr+XdYiP5/I68wcT4SaN1Qr9IFxn1qG8JehcCtBN0=;
 b=vt4yU6OvwR+fbnbLwYTcpgOaJqle9xKGpYke075A3R/SG2jTMPadpGRnVzUSupsd5L
 IyAhzJNrVwYirC8SU/qj7v9nuaRlaDcneu7PkKvYI0Num2hZKEIkEquyPZFyhTi5f2Dn
 PLCMbrEZ+5YhYUSP+b+3dyVtWaUfFPgKEbGgM3KB1BxUOeOoIScPJ5OFLvYEEy4LQVSf
 XlZVoY2/LqUUlSJ4EOHs2d8YlWFqGHWMqvKmR7OxG4ly5mejP6UoPeYrjX0sGBF7nJIi
 DgJpLvUop9YCCPA0yImMvmgthDLNgB5HKrQGfhBVWMGEBN2wtrExkGRC5fOjL97F0WeA
 jX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOMr+XdYiP5/I68wcT4SaN1Qr9IFxn1qG8JehcCtBN0=;
 b=isA0O8bq70M8jDMz4IvD62jtuxr0xzWezRboW+U1ql5ManM/GuMm91PmeThPuwUg89
 MBUTaSijlWmGgRN+Xug2PP8LFDM2O+74NB0CwkNP34wtk1n7WesQtRPV+c0etVAYmPW/
 MYTW4xJkAQSmmTCSwH27KMLsre57DVMFLB12oRvpQcAL9N0gNVp57vM8wEZqeNDDM/S4
 hWaLtpoZjgG2E78JhnvCIsQFoYdO8iCKf8r+vOZ+BR7NIBfAACsUyvKKndqZM8mAPiLe
 K008IuRXSjrB5WJnkVbTfNbEGTYXBXm9SNztDOZP5ApFQ8VedDhv601YhZO0VZQIhuGm
 lunA==
X-Gm-Message-State: AOAM530NGwSHBENrklHnQ7zo2emB7VoAcZXjQ599JECMVTduZnjDwsUw
 +JJj2LnYFMj1IQplvVvvimqCdM6nR/mYqa/pn5By1A==
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr24875421ybq.479.1647367479921; Tue, 15
 Mar 2022 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220315021205.342768-1-richard.henderson@linaro.org>
In-Reply-To: <20220315021205.342768-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:04:28 +0000
Message-ID: <CAFEAcA8dbf7PwgH0Wg=HR6DU5jpUOBeMneNGNdMwaWG893sfOw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E1PrdLv6SJBd

On Tue, 15 Mar 2022 at 02:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When arm_is_el2_enabled was introduced, we missed
> updating pauth_check_trap.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
> Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where applicable")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
