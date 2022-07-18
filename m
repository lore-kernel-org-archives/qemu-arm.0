Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1265463lfp;
        Mon, 18 Jul 2022 05:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBo7zhcp8CP9DB1odsGPOc17mQvWOnFyF3QlBQzb0EK7EGSAZcLcyMZmuM+fdkmXyrrAaa
X-Received: by 2002:a05:620a:74e:b0:6b5:f0ec:edbe with SMTP id i14-20020a05620a074e00b006b5f0ecedbemr1376201qki.436.1658146283724;
        Mon, 18 Jul 2022 05:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658146283; cv=none;
        d=google.com; s=arc-20160816;
        b=DoQ/80mVipbeG6LE+0NzWKMOmXaHf83jl11MFP4V/w0pEcS2Xd29MKlXEhd9RIU7fB
         tqn6yqqGnI9jsaYZf2npUNYUj4py7QuYiCS4izCyZWFYu9wolOnNXaF6lbMFD3gA53PU
         nGC9rt+9GadC6wSAA2sKjpx1f+jGaDWp2Zy2TNZjtJVdoTtbX3kAty1x1xh67EhLG/2h
         1zGJfzzwjCVLAHp2TvY5FNyTk+pSuisW/TnMUztVeoU9D9Pmj47S+zdA+//j3Q9e8uSV
         jYORfIt2/vn6/7ros2B6SAluUL72EIIlS48Dyt4rVStHxmIyEVKDE3FVerbD8iPNWtzX
         g+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y+jtN7rT0EaZoZdnHOLnGiSX9H8NkkV135+5T8WZg/w=;
        b=TNWICGX20EMyrXIzKk21TWNJwmUBcAlf25Mojn971LW0Ni+80wVrcd1ST6O/0bH1Wn
         OC4DB1Zy9j4eMtIItwHp7YckEezXe2fEPv6uVMzGJj3ofkPWK2ol37+c5J+42b8M+Ynp
         Q5ZNypOTUuANUfDZ0uW3Lbj/nSVTpAHHzFl3vtWLY0vR8eJKbh+tTQqFBNLkMAFnYRsp
         S+0BhtSmoWop8fpo7T+EtNOsoTh4smuuQtwz1/Z8PgQ9EloIVcxkw0YI4poCbP3bXSe0
         J5LCj/s0zMKhcvbgPsoVi88aKA7IlVJKde/N9oLivFJU8sV1up31KQrNDKk0aUbUyVdd
         C0yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aP8xYJ0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v32-20020a05622a18a000b0031ef4c7f704si718523qtc.35.2022.07.18.05.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 05:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aP8xYJ0u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPat-0007rb-8R
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 08:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPYB-0004AA-Vo
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:08:36 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPYA-0008GX-FO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:08:35 -0400
Received: by mail-yb1-xb30.google.com with SMTP id f73so20265708yba.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+jtN7rT0EaZoZdnHOLnGiSX9H8NkkV135+5T8WZg/w=;
 b=aP8xYJ0uCgufw+aLprPmQOZCT4novSdICSxae5+R+zZsm9YVXfPm4ljfp3+WBK5fZv
 bhnlv7Jhg8ZPIGQ0KKoMvjcg3l3+CjMn+pbyX/ULIfy9x+EwhXQoZE5nKWyJ2svKhl4i
 8nh3cBoeb3zlv437JEuZxGZG/jj99EVKOHr5tnv8t2dXnoCzs0irn/xj10IoswA8XfpT
 1AYhk7AChYjgbhRMbP+HSmVJa+j9oxEmPtM8SNRpGlMPANwyrE14/RTUkyqEqXkl1KM5
 k0m8dvdR6IvST7G3zKDCnaEClFCe4KmgBhMU+319/ulLes9hYKuKJwbKaQ08bWAGA6be
 ffIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+jtN7rT0EaZoZdnHOLnGiSX9H8NkkV135+5T8WZg/w=;
 b=An83ln6ac19MJEHPqqp3bViWcqH2qAiZcIjOaR9WRA91SDvONFLvpbu8eLf2pFNwYP
 hDkt7MkudyeROmp7AVYcvj7WvtqQ/XI5OlRaLhsTDzRb6/PIToPo3SccvfTQeaRzJhUb
 CoiasgsZHNYTif0w6BdDDh3fsY5mjfEdaqHcq4XsEoHJ2b7knpndo10clSKcLTOstpUx
 5mts8SUnmCFMRfV/1O1ydVRUAU7ldb/JWLQ6q3RW8W4ZauJsEUNUU2Ok6gjVvcxC3TBR
 RRKdOigumCglXNUpcCzxXWI7Dzm9JjYt9WB7n0lBHdKf/uLhsdgFLErgkMSnoX9QNQpS
 fHXw==
X-Gm-Message-State: AJIora9N0vWeVGszfl++Kz/9FZxfqzQZCIx1wUKiCCthm/Xwwntnvpf8
 EdKTa9hCiMkoCy4Fv4u7aImY3N8gPlhJn+FNb8NsBA==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr28279090ybj.479.1658146113413; Mon, 18
 Jul 2022 05:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-28-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:08:22 +0100
Message-ID: <CAFEAcA_XZC=9h2uXanZQ03pxDdqNn1TuJCQTNOmeLo+Ns_k5og@mail.gmail.com>
Subject: Re: [RISU PATCH v4 27/29] aarch64: Tidy reginfo dumping ahead of ZA
 state
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: XQWhRR3K29mp

On Fri, 8 Jul 2022 at 17:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A misalignment for sve_vl, plus add a bit more space
> on the left for the ZA[n] field name.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
