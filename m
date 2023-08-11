Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1262231ejc;
        Fri, 11 Aug 2023 03:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFM15EF1T5gmfyjEc4R+FMrRXte1pIn7bqWbnENPnmpahO0OD+kUh6aozQaW/3hyBkEgkv
X-Received: by 2002:ac8:7e81:0:b0:40f:f9c8:1b98 with SMTP id w1-20020ac87e81000000b0040ff9c81b98mr1911691qtj.10.1691749326119;
        Fri, 11 Aug 2023 03:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691749326; cv=none;
        d=google.com; s=arc-20160816;
        b=StXd6akD9e62RzmohmSDfWO7VY0GnHJCAsfcIh05gdycODTjjAGU1baqoJDnSORqV1
         a3fevd0B9Xz/m967bGzcNYqAoet8ntJvwgpuyf+eUgIL3iznUH/M+90ZNXDycKSV+2I1
         6gZsrbVDbqEKvVaEfRM+LopBBsXFRXEW5g2aKk09kPzwi4BrD5FjFducP3Zu6pRZmIYX
         vyJ1r2br/FGSVxXBXyQNkpwrJJefHd8Nr98px1OdFJEQjBvtHI0IGipKtMr6ph2b67qv
         KZfTGwOtPzNgeCIcGo/HovCrHguoR238Tvur+us3FdGGDPWfkNoDS0zzGEHOJvjAja8X
         B6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NmwxAMp3W2UEZSqZdCoo9QP1P3OTYhKESpa9lEB+X1w=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=q6vS3NTdi4YouKHz/IAIRrh1xQxQaqboOUkMRv93LPVAQejxi3mpD6w35wjUZPqc4N
         JwfAKbTsDNbLKIxvYpMRc2ZsPxXxiaTCONw0t37bsO26K4zIzq8JZFVJIxwzZ3ucej4L
         K7sIFx5reGx0cwEKclAXxYt7v9sm8DyYADLVn+EU2nSaXfodzxd3yhSnSWJyrgHRJa92
         CY2Cz9eFXXxAqEnRO0NQFxNNlwHrnyGlUFhlif4CjCIaST3NQKDEsxSQ3SUpVHoRqwkj
         j6z0X4j1wXTBeUBAeQ20q7MHin4eIx9Wo5G29sBrtVPQdghsuIFREgUsGWjszVdzbtzS
         rTDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yacE/EQf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020ac85c53000000b00403ae9e8b08si2078530qtj.369.2023.08.11.03.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yacE/EQf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPHF-0008Sp-Bi; Fri, 11 Aug 2023 06:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHD-0008QF-Lv
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:21:51 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHC-0006LK-9a
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:21:51 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe4762173bso2915154e87.3
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749308; x=1692354108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NmwxAMp3W2UEZSqZdCoo9QP1P3OTYhKESpa9lEB+X1w=;
 b=yacE/EQfyTKbDaTblA+ce8T+xQP40CQqYFeybiaZAeev6Agz6Xla6Eiw2HnpEbrhvA
 BtaWggjE9tTVBCJBXDZDGkm+3/eb2rBRKtUjWMaN3HHv2R6+SxwJ4MOB4Tfl5Gf/I8Ls
 NHaPPBBR93mARFLpCHtK1D2M0DXTMQb3wGmh+5+nDO7uKWHLnxth/B2rSwsb2MC4TfkM
 pR5MxXPFqjnq1LTBvZJDS/RGDyGxJqBPkGZKgkrnnyuWcLjQ4XE1l9MrDS7TfW+g2W3t
 Tg79ZqbXlHDmWBzVz0+knh+UhxId1XYT4i4+j1p1DWg4uK/YPXzFyZtmBbNy637Ymcur
 jk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749308; x=1692354108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmwxAMp3W2UEZSqZdCoo9QP1P3OTYhKESpa9lEB+X1w=;
 b=TVbXRgltEoalgLDsbIvBUQy2EqTVzXyWxB9E5clqsReRDf1AObkC1Hy0jCuVlPZdy7
 2fGcaO8sfFTwKTGqrn7cxska0jq8h1mE5N3p3jP8JpRKn9cs6Lwf8NWUGiRea+Scn4B2
 VCxVehYdyr6XPnuhLpl+OhKDq2lo7lfAVCMP3dugyvQB4+/YbqIjmWLMUNT0BNshL78p
 EGLQbGKNjEdOK4qzQ0YmhRFRn71F7dJ5CaBqBhL44/ZOoIoSwPgYSluAxhlSMwdvrc/Z
 z/jQg3aXGetG6Q6VR1wDrvUheCzMDYPxfgjh43NzK/OjS0Qh81XXZDZUjDnPSij7n9Dm
 BUtw==
X-Gm-Message-State: AOJu0YzsU1PpQjtBUxpawCclOZlCA5NOxjCErtwo6UU+exz+hb8BHsvQ
 MyC1yXM2YKEmVFTCeHrTWFuCZbkgXvYyxQYa09NjKw==
X-Received: by 2002:a05:6512:b88:b0:4f6:1b45:e8aa with SMTP id
 b8-20020a0565120b8800b004f61b45e8aamr1368266lfv.50.1691749308620; Fri, 11 Aug
 2023 03:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-19-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:21:37 +0100
Message-ID: <CAFEAcA9A7YEvDqLZ6SoGHn-TPjNhY=NmTanm5PU0efXXziCX6w@mail.gmail.com>
Subject: Re: [PATCH 18/24] tcg/i386: Merge tcg_out_setcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: uIrUqomNedid

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
