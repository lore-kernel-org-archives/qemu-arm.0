Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp251899ejb;
        Thu, 5 Jan 2023 04:04:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuEUTGEcXtQ2Q7v3moMS4L3/jWdVie/lOKQGfXIrdECAFir9hb3AUrJrfZFmDVUwV2sX2dp
X-Received: by 2002:ad4:4819:0:b0:532:ae2:9059 with SMTP id qd25-20020ad44819000000b005320ae29059mr7528457qvb.33.1672920269668;
        Thu, 05 Jan 2023 04:04:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920269; cv=none;
        d=google.com; s=arc-20160816;
        b=fG/Tl+UOKjZB/59PrVvPUZEceUVMPL4Sm59CswIHYZ1jM0vy1AX3uIYKhX/w0+1xyY
         XLghE9GvUKhl+/tqKZRVfJbMokz9TbbxXUU9+fhB+h8UZpqevHRUgen7lUb0BB5ZMcj+
         WhWmNQCF294bLfL02MVDBP0fzNV0tPU3FCDO4DzXnkUmp+BC3hY4NSnoIJLFR3d08A2S
         wpqtZCv9B1WRgtkPNLaf0ivn8JaiUBE9+dUgG+K1SyvVKRo9J75Rh1ZBeWUO0IarhwsO
         BLMeTyeja8skvwH9ThQ1F4vlFlLgHiO4VbYG0mizyuT5mXp2FixMHNfsCBNEUKcPJ6Jb
         n2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8HaL0nOf7xsQRBvzxe685FoKKacHw+aq6HvggY0WJ8A=;
        b=o0oFRLM0nrVwt3w+ozac/KffCNhTeK1IjgYZ290pASTaLKPzgYmiYlDM1yRiCiMNRZ
         9f+bjkYxsTtpEQvpUBmc3XM2ytpygzZtWmeojJ75L+o7lNEqYtFAFG9LMwD9GhiFY9t+
         E38ExjOZ+noaJttyG0oQ1Pp0FtYq03uWQPtbHLoYUB8l388sAscfkTBjpgzdgg2OtBzY
         gyLy6mjI/IhFVb+Dah3BXS8Z1KCJyl37gykVrXR0PeLHUgH4epmfH6dtNG3l1zNf34jS
         D5P+EuJRMj1NaNxegLNZtISP9vc3cZnY1WLFyK+awClna3I+AjcjA+9soLzjv4KkU1we
         evRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjiWGaFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kf10-20020a056214524a00b004bb60c76ffcsi17635716qvb.189.2023.01.05.04.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:04:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjiWGaFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOyr-0002Oc-8r; Thu, 05 Jan 2023 07:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyq-0002LW-18
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:04:20 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyo-0001ia-D3
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:04:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id jn22so39095624plb.13
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8HaL0nOf7xsQRBvzxe685FoKKacHw+aq6HvggY0WJ8A=;
 b=SjiWGaFG2Urm+Cfb/BVW35quRkC8ZEIUDeZ5m9KmlrzIds3Kf4hCrqTkpif3Gw4ySF
 lVnkB9XN77D/RBSeTZdg7nJysQObtEGbWI9KS4D1zd0WXQtcz3NX/zQ288coSjowwimF
 QtV8/Qp3dMSWazy01i7JKe9b5PqvcFFiBNGsX9ns3DNCascv+IfYlEUNkZawct9ry+NZ
 RKDVkiy7N3dY4jkhUgGhu9KPSQxNvqom7mJ3AKRbXrm9+KkuP4wvTZ1hAQjV1psVfjNu
 Y+WE1zAwFAjzLWtUDACjqIrEuijEMpz0uV1QRimKE/D92B8FKq6whBeMQu4dPpubuIyX
 7cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HaL0nOf7xsQRBvzxe685FoKKacHw+aq6HvggY0WJ8A=;
 b=Ihpljd/hTHKly3le3lW5grq+iO8wsBI1LYhevNDfSGAJ1Uf372xKMqq/WRBJaYxYXn
 aDo4QpJbuDohm9Ip/8glDOiL503IPKckro2gJRBXCDP+pzX7OlrguQYwg2L5BnNFz5Jt
 vC6N0vhqH2/zSk7XVfZOndgIWT59DE0zOXSkm75lIjXi37XQvlUjQFkWg5EkAApi+fHK
 ba+mfhubqbIHMnwDdTEm7mr53pIZLazgZiAU/8E0wHw1DbBBfh2lSrF3F87C85CWXapY
 eo4NL85+X1U44D5mvOZ7JPTED9GnEEFO+WQttEvuB908Q4REY7TGq9lUjPMJn9VRWXi2
 /qpA==
X-Gm-Message-State: AFqh2kp1vVUfD3xS9H4rx0u2CS3a4QWuJirEId6Inl+S7mMShmUCJV3E
 WyVdTt2yDafe2o8Kl5xokMyvZjR6wQtOrYtFIieCyYuYWwLZdQ==
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2339100plp.60.1672920256922; Thu, 05
 Jan 2023 04:04:16 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-5@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-5@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:04:05 +0000
Message-ID: <CAFEAcA-CamVauNm0g1tx134k-_m5yxaTm4a91xL8_bt8Pe_2wg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 5/8] hw/timer/imx_epit: hard reset initializes
 CR with 0
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7cEup+KdPwug

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
