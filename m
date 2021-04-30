Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp275043lfg;
        Fri, 30 Apr 2021 09:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG7alES6S84oBnLZ2szpvT/qrnOsMvFsTNCqUmGvT1BjuRP/7cRtRSXi2uAyC8B3AE5ewL
X-Received: by 2002:a05:6e02:12e7:: with SMTP id l7mr4522353iln.51.1619800100634;
        Fri, 30 Apr 2021 09:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619800100; cv=none;
        d=google.com; s=arc-20160816;
        b=OtnqUuqhvx4dSO4iNP1qlzZ5pIC+GUhv5oLpA8cEGpsLqPjIsgbIfe5IoTUD7MXuIB
         DixbJqPrYTjy4sDHJsEiJPUqF4VDg3q0hWX/wfFXeR2JrWgSnmL6QSPsw1oE21Ia98Xh
         zTwY1deym1kMU8uCddlAuZYb9j9gyGypLnbahtjud0T3+XvqvocB+7q2aO6xLI9a9m5p
         /bxbR/KgtlcZ7RF00LfFd6Sh3VSh0YO91zXapLiwlUHhSMfMBWu9nAVXfYj+C0TeweyB
         tMVPCdDZi9pSsfNDsOUmoKNwN3h+9lfN+mBRIaFS78TaCBAXhD3T2KgZiSEMSMwYmAOB
         Tnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=9BFQgYv/nYMyrB4Wk/4pcoBgjtfuekvwdidHiEPDl/o=;
        b=vjOirOuEn1Kwic733ugzkBZW1x2vJHcgVJJ11pVm2rFMbNKMVW2w1xCzfzPBxQdwOI
         7RRpSFloy+f2OQ7RnmWlAu7YKMuruCN4uGTVUhd82oi2LjXRIuPEl29sqxtbuQSsfCJ8
         Y6d9sYPMY5pWhHoeWwFoDloxlegRusY0BIEMIQqMW1O9Lj/34j0RJ970WNXdVAajX+rE
         BGTdBEQwBkNkKUH857dW+sOvkE8BX2xaPQBW7N9UMDlpRgClgoYn5X/qL3IGOKHj3a0I
         sVY7PeCYrkojx7nZt3wzve3pnDiCP//o0Rciue7Jq49WmoODTziKXMcm9k4ZXWaiwBdZ
         65Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si2860471jah.59.2021.04.30.09.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcW03-0004CH-UP
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVrd-0003uU-Ip; Fri, 30 Apr 2021 12:19:37 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVrb-0002AV-Kf; Fri, 30 Apr 2021 12:19:37 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlwBf-1lD2gG3fff-00j0Mc; Fri, 30 Apr 2021 18:19:28 +0200
Subject: Re: [PATCH 3/3] hw/usb: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <20210313171150.2122409-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <18f64916-def8-b38d-8e7b-a91f6d5664f9@vivier.eu>
Date: Fri, 30 Apr 2021 18:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qQu/Y0esOoO9Q55tXrywxXxN0lmJGIEZY1W96qfTCdNjjWHgDXK
 Qp3rS2F1V/MQJb+bn5nACTFIpjwc8H7cy4dZC6qO9j8uAAg9ydvnR7xuUSqU+vfu1sOjZR1
 b4j2YNHjR9pUUT+Wa5+/nE83LZFVv8x22+Xkk8gJs+gJArUfl/PCSGNhLqZhiSWamP85VGb
 6Lu9GIoeDIVABeKFqHwmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GjL9shTvAOo=:03D5yetYTZGAm0QxODnHEB
 XMVRQpa9Ztp+DEXnrehHwP96gweZlpeRiZ1o/u4tREp7mpnKYKx+MXTaMm4XzG4f7tnwUGjza
 oyhzgfdblPoadeLlRTtMOfdhdk6L5rtUX+GmFWYXu1f0QCdI6OiwxKGgg1ens2jonCEQQi0cw
 hbgEkn4jb/YTwRjtpPwc6OlVW9nu6Hd/ndCZJdCtxDSL+raWXvB4QmztCEGg51poI9TR4TyKW
 nP2/ZeAkd/d9ueHUnM3XVuXBxxE3jJBNad0WtBKUnEECSycarUGnhY5RElAWXUFAuWg/XXBU8
 vx+nFASSYlEQlXbY8YetrE5+ydMfg+3r4eQstYHWQZKjMNWxfpyWrOhjhKXxUfy1ec0Q165Oz
 spanax7SIZI/lO5wuBWuaTCEEidkDi5/Wv3QJFZla8+L46laKoOJEgtQQwNuV2Pl3pwj5+dGG
 41tKv5K6q8Us0oSKhN2JiAJDQ3igMYfrON8lxeFMasnVPDqZwxa3vtdsLH9+43AUD+IDkzkn+
 FCYVrAv5d1vJV5iO+rNYlY=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0UDgy2epf94

Le 13/03/2021 à 18:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/usb/ccid-card-passthru.c   | 2 +-
>  hw/usb/dev-smartcard-reader.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
> index c1a90fcc7a5..7212d0d7fb5 100644
> --- a/hw/usb/ccid-card-passthru.c
> +++ b/hw/usb/ccid-card-passthru.c
> @@ -374,7 +374,7 @@ static void passthru_realize(CCIDCardState *base, Error **errp)
>      card->atr_length = sizeof(DEFAULT_ATR);
>  }
>  
> -static VMStateDescription passthru_vmstate = {
> +static const VMStateDescription passthru_vmstate = {
>      .name = "ccid-card-passthru",
>      .version_id = 1,
>      .minimum_version_id = 1,
> diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
> index 80109fa5516..b3845ccdc14 100644
> --- a/hw/usb/dev-smartcard-reader.c
> +++ b/hw/usb/dev-smartcard-reader.c
> @@ -1365,7 +1365,7 @@ static int ccid_pre_save(void *opaque)
>      return 0;
>  }
>  
> -static VMStateDescription bulk_in_vmstate = {
> +static const VMStateDescription bulk_in_vmstate = {
>      .name = "CCID BulkIn state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> @@ -1377,7 +1377,7 @@ static VMStateDescription bulk_in_vmstate = {
>      }
>  };
>  
> -static VMStateDescription answer_vmstate = {
> +static const VMStateDescription answer_vmstate = {
>      .name = "CCID Answer state",
>      .version_id = 1,
>      .minimum_version_id = 1,
> @@ -1388,7 +1388,7 @@ static VMStateDescription answer_vmstate = {
>      }
>  };
>  
> -static VMStateDescription usb_device_vmstate = {
> +static const VMStateDescription usb_device_vmstate = {
>      .name = "usb_device",
>      .version_id = 1,
>      .minimum_version_id = 1,
> @@ -1400,7 +1400,7 @@ static VMStateDescription usb_device_vmstate = {
>      }
>  };
>  
> -static VMStateDescription ccid_vmstate = {
> +static const VMStateDescription ccid_vmstate = {
>      .name = "usb-ccid",
>      .version_id = 1,
>      .minimum_version_id = 1,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

