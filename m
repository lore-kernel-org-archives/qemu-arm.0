Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1081345lfp;
        Thu, 16 Sep 2021 05:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP0Lfa/7f2X61IwwILs2+qcVeSR+W50gs71I8bTLMHPlp6DyfPVzPCNZRwULDoM7WT47DL
X-Received: by 2002:a37:a253:: with SMTP id l80mr1439236qke.314.1631795758009;
        Thu, 16 Sep 2021 05:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631795758; cv=none;
        d=google.com; s=arc-20160816;
        b=wqPpiLw437t6VDd5yiS4+b11xtVfsIexZaa05Vpc0jhKrCo/puXfc/tvN/mEX/CVvf
         QBME2+RSZCl6gcwF3XwyP4RBJvQiuGMvBuuWCgCMPFPFT6axCD+KgwssgBUl39JwzFoG
         wGqqAJkchFe/IuvInEsAYPucZd83SI3D4h5Yv990PrHivhzctR+ZDT3DbDaA9H4pHYc8
         IAn4mIkIBe24RSXHvJXMvkc5GEbyBMVJpYit9M1gldltMn/73CSf4WivzZS0UBlV19Hw
         O7AhUFndxR1oqrx+v5JAvu63lieoZDQ2bnyDkp09QW81zCepc0lH3I4p8lurYnK7qRCJ
         ehew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+w6bQRhYv1iXdxNOi3ANdb6Gu9cEs1/yX9+bjyd0Pew=;
        b=EP0kAyfoNhkPAACwCvDJWrXynWaHOS+K+H51TJjl9a6jejCXxdTBFAhQj6uuuXV/Em
         m6Pt4uhMUM5a6kIE83rjjYUHrjV48ZT/tbaA7a7nUkW4JlS6Hcz7HsxHm88SCgDMGVId
         T7khF40LvB/1L9ZPYYgdO+3XkfujBkK2S4UfEYU/Osf9bnGM/GA7pUUOIjtzUcEVsegE
         FYFXGbB0kriUcr6nunod0/0OJfW7NT0OyQwh7T9LqX264EDb8BpmcFOyP44JFcDjWR+Y
         H5e+D0hMLfH+XBw2ZrAJdkO9UXfyxwwpecxA+mxQQ0zAxxfVAszbyJhzq3AH6Wfw79t/
         Nt3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wTmmvb+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si1655618qku.374.2021.09.16.05.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wTmmvb+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqcP-0007VC-FO
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:35:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqa8-0005En-6I
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:33:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqa4-00022C-MI
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:33:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d6so9175510wrc.11
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+w6bQRhYv1iXdxNOi3ANdb6Gu9cEs1/yX9+bjyd0Pew=;
 b=wTmmvb+1oWGx6K+VPaeLoEqPWZK3CJ2IS7QNMjYcP1gkWRVD6JGmouMUvaQ13+5zVm
 NR3I118mV80rboTbldh6y7BHvwXMBajG/ZdzIFRFxpXDYBmQ48867i9CcojZMGpT9SsV
 suTE3l3Rern9QyT2oUvPoPWHp75bN/hGyc7CnRM/+0zQMzx7uNLxmS4pCNcIsI4Miwx1
 cudSjLkU+8pwrNJpyN5PYDIhAufvKqjuIJwkak4gOYyzvOc82ETsxYy31IZLoBkKtT4H
 7ig/A9uGxCCIHQDRQKKEZwI3MYYuCM/0mdzC5zqbBCRAOFDZiK5mcRxbFNPSr5kupmHx
 A06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+w6bQRhYv1iXdxNOi3ANdb6Gu9cEs1/yX9+bjyd0Pew=;
 b=MwdKNsWVQhppJd3Vz6fP+IfgxJgf6xpErSXYlqN/MYjcJJYgCpTAga146Hh5AGfHa8
 Fx49eIHTPVNKlGle20SWAeaugJVAy6nvQZkgg54sSoZ4ka9g5xbGVQReezPm+Ixodyla
 PrJ7VTE5bTHDsou8lQJewnTD/nyjzhCIaCIigRzM9ZNs7dZhsdr0J88Xty/Ck2g4aqd4
 EMsbJhoKCMkjiEXMxfGZKEgChDDu2iuaFDRIq0yCU5edQhLk7CitUSAVbmtnEiBVK5QN
 Gf538jmgHnETpcwc+gT/NAazCHMyn7gHhTUAc1J0xxjmhVCquHUJ1mtGyReUajVWbjo9
 na2w==
X-Gm-Message-State: AOAM533HslevXkndOKFZb/zKmHMKjVi6k6iBTFDFKxpJ3oQGqHrhUrf9
 noc5x1e5FrSn/+TjUWcCQCJoOhfrA7igdc2QPtv+mA==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5896735wro.302.1631795611054; 
 Thu, 16 Sep 2021 05:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-10-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-10-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:32:39 +0100
Message-ID: <CAFEAcA_=_0xfN8Tk8RqE7JacrSCLPZeqLJJgVapn6GuPeV6E4A@mail.gmail.com>
Subject: Re: [PATCH v11 09/10] hvf: arm: Add rudimentary PMC support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3gEkzrL+Hz8

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We can expose cycle counters on the PMU easily. To be as compatible as
> possible, let's do so, but make sure we don't expose any other architectural
> counters that we can not model yet.
>
> This allows OSs to work that require PMU support.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 179 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
