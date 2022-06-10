Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1031618lfb;
        Fri, 10 Jun 2022 03:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6Tj/YUUd+V+FKcsMhkQRRS2mWvrTfyPCo3iJXfSvfSdeEw3LueMx5jo+0zZVg7pGBakFS
X-Received: by 2002:ac8:5dc6:0:b0:304:fd1b:3368 with SMTP id e6-20020ac85dc6000000b00304fd1b3368mr14210084qtx.320.1654856253107;
        Fri, 10 Jun 2022 03:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654856253; cv=none;
        d=google.com; s=arc-20160816;
        b=iBvktHrA4qm/WCUCGLsatKgmcMcPmgYljAfie+cN8ip0m6PnTk3AlOiGrHi+Gj45/D
         6F6pz2780iD2UiPpwJCgsEgQybQ31CrLF6a9W2akPyGZUjzf6cVAuPVv74JzD5lRDmQi
         OoVAxzyU9nrW/C81x+4Gc3ZZn+xB5pTD8CdTZq12rLDOX1jd8NtxI89qgYRrAJx0rGlI
         xXfqZnIT81nn9F2zWFQJOAmRaJ2sBHLQhS+0O7oM3fnBuVnNWtbTVP5xYHn68+8RQVsc
         iP/454pXEkLo9sj2585bX7C5sIolGSBpgu40nHkrahAs7Ik7ileKj79LK0+VwfiGKI5m
         bNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=13sAxX7GKXkIZ4REPY1Y+0Kxy1FvjqnfyQedx/44MBw=;
        b=F76nCJ0vvUiDZvO3xPnbJ+BiYLzCp3LY14gH35Rhn7tUPnRuuMt0LxGkNR04ouLssU
         MlYjIYJxhjoyufArxesCK2+UmWklbkuSsM2dpvJrXmX4zceQHb2YEABHGEIE9BxvtkHi
         vL6YIhiI0xzjbmxJMiEGtvLO23zKEV2O1vaMBkAGKMzjFTUh57z30fpx6MFooanJjXL5
         Wc117KrBFuDHi2mMHPPGLq95Nw8eynhzQNunqZPz5IUPG2ReY1cnOeVAwWwCJBBezLuw
         Z3CLs7TP1nHfjc8xMgYahaciWdXew1FxTrKjt02bo99RtBGx8FbyOtfRolyYhkCUT0Wm
         wBkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OceuNUIq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d70-20020a379b49000000b006a69fc1b437si10547208qke.680.2022.06.10.03.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 03:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OceuNUIq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzbhs-0002kP-IB
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaX1-0004WR-SC
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:02:16 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaWz-0007CO-6R
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:02:15 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id l204so45931425ybf.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13sAxX7GKXkIZ4REPY1Y+0Kxy1FvjqnfyQedx/44MBw=;
 b=OceuNUIqGHX/JagenohmhkvriQdKUILMGPV6b2Mv0q3fW8xtL9jW07tUS6lUbiS0V4
 4Tx6HjDfgE+0ayUzEBOvBIkNZyFEhYyeRAAZ0RqxVBAy35Pe57LK3e2wORR36U9nOlNP
 RzRZBks8g/wL8kQ0UqIaWt/x4g8vztvUDhrcpKOhKmIL+09vHjg4ynwJhRhlwN/XoSt0
 PUJcs3+MqG5M25DS3LxzN28taiaSrMBQUZMI73ldWawPUc/xOKst+4h+ijsWygwbABJS
 sh9/jdHWSCe/JqFuwNYHjFZ7ZT7dHAuaQsI5XsSHVFuWuAg21pxSjSMJO5abaESnqbyL
 4f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13sAxX7GKXkIZ4REPY1Y+0Kxy1FvjqnfyQedx/44MBw=;
 b=cKEMhdamCYZPCQoHCAU7Qz5UkhzPUAxuJGd9a5G/I2ekG1FRYGdxO1WmJtEzrnYU+4
 A3LN5L1aQtGbBHshwoJ8uSWgRsl+EXkaEV4eFsbQWB4QUhgCeL10zcIkbCUeC3Ob+6y1
 0CE3jiWhHLQK5iNACNRF7SUcJ9Aqf+kaAtWHGi0CElNZgWjbRbVFxHQMvp6itWdctObt
 h31+rg3xFfBuNpwPsMg4C92CnoQ3/nbMVzbGLttxyCxZC57TVxyIYhbyynzsHTcHHedy
 xJcbObHpqkJR9icWFXityG6s0guI4fGFEnfe1zkGupREEj8exAuTQdjB4htU2qKOGMD0
 jP7A==
X-Gm-Message-State: AOAM531ssf26xhbTY+LQvg6ztaDxJCvWWuMZxB/VjKq1kfVY8lfidCnu
 3jXlgSSFeEQh//HVKU3xNF9VWctO9APc9C2XbnF6bA==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr43692466yba.39.1654851731057; Fri, 10
 Jun 2022 02:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-42-richard.henderson@linaro.org>
 <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
 <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
In-Reply-To: <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 10:02:00 +0100
Message-ID: <CAFEAcA-dEzHA+GEaGRdgPBBZbA0m5K+HqceshywnhYiotzdSaA@mail.gmail.com>
Subject: Re: [PATCH v2 41/71] target/arm: Add infrastructure for disas_sme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4rLYUrchjcIh

On Thu, 9 Jun 2022 at 23:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/9/22 08:35, Peter Maydell wrote:
> >> +        if (!disas_sme(s, insn)) {
> >> +            unallocated_encoding(s);
> >> +        }
> >> +        break;
> >
> > I still think we should check bit 31 here.
>
> We don't do anything similar over in a32, where we've done the full conversion:
>
>          if (disas_a32_uncond(s, insn) ||
>
>              disas_vfp_uncond(s, insn) ||
>
>              disas_neon_dp(s, insn) ||
>
>              disas_neon_ls(s, insn) ||
>
>              disas_neon_shared(s, insn)) {
>
>              return;
>
>          }

The difference there is that we've basically completed the decodetree
conversion. Here we're putting one decodetree disas call inside a
legacy decode, so we should put it at the right point in the
legacy structure, I think.

> and there's nothing else within major opcode 0 to conflict.

Yet :-)

-- PMM
