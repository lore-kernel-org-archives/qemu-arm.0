Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2731912ejt;
        Mon, 19 Jun 2023 03:29:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4v9uH2KCOnoiOyHtPZOSEHUqUawDrF11coLkmCmE3Oab0/YztCiUSUB/PMu1z0LawgrkoZ
X-Received: by 2002:a05:620a:1a1f:b0:763:969e:fbe with SMTP id bk31-20020a05620a1a1f00b00763969e0fbemr2516513qkb.2.1687170567517;
        Mon, 19 Jun 2023 03:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687170567; cv=none;
        d=google.com; s=arc-20160816;
        b=H35Ts+dPz1ekttrZjjAHj3t2vDc/Rku9TnuX+lm7WbCS2tC8b/++LH29eRGJPrwry7
         c18AkUjFB3VvLWM0QloFbafrGgyukJ9MIFnKKGouMEfObNyzURhmbVnuUDCdeTAsdku2
         P/T0H46VDPG9wwsy6+qRSMYxeQpzbIKwf6wjauu/wKCMbsPSXg9CH/ucmaedY7xn1Vq5
         VyrvQWQb2ewy+TX4XBnzhclp9D6HsuVZkRTK5OMMBKCoQyZamYE8LCN2N54PypYW6aQ2
         ek7g/dt7AtSZpCzrWsa0eVpMTGErTLl4GvZZz6hfatrxDjjO13SNl6BmhAhzOsqvfbiB
         KqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fZ3xrAPWUmuyygoUMGu33jLRMZx7RPtR3KeMjJcAvHM=;
        b=O2e10vi/e7mKna8ubDHBwRnyRI2Ta88vN9EV0Y+VvPUREZ5wQ6eodtl1lbN3mMKKoq
         VDt3Tq7A0mTeJpMz7EqYmZGW8DxOWXa9Dteql1ukVp5DSwAFVQW3MtqRNH45IwWCAjwh
         CGk59OATvWIvC5mGjWV3D3wd8cc1LV/0lpZbe45fIjW2kWTXTP48mGAaVZooOliZccy9
         bMjrchomOpXVohXqLlg5Zdfp3aZliMP7bVvhA6jf4LbJInHskXCQqRlNgg9QWJ1Wnebc
         /mCqD0KbvqiyirHX/AncsRzOwXvYDEYoc4SgpE+juDVyCGYARSWbaRU8hEEBAYfneMY0
         CA8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXSf6nrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a20c100b007621d425fbesi3888555qka.509.2023.06.19.03.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXSf6nrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBC8J-0003Ff-UT; Mon, 19 Jun 2023 06:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBC8I-0003F3-Ez
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:29:14 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBC8F-0000kx-Q2
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:29:14 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b45a71c9caso38697191fa.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687170549; x=1689762549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fZ3xrAPWUmuyygoUMGu33jLRMZx7RPtR3KeMjJcAvHM=;
 b=GXSf6nrXPqFf04qy0Ux0Hog2/AnLi6oTPzyC0osXQCMjjeBr3uy4Zbdatwx9c/wlDn
 2vJTTFFLmMP2SXROjv5FUXQj5Bl4qUbfVod5ay7eLtKsU9o3/Vv1yccB7VyaJSCNTEkz
 fjXZslZUwZjxtGxHjSSuqx8TWlmK/puOxyJnTmtkh6OM5qIVxW9YVAeqnYqbyKoW5EsS
 f2Mj9UTWf0ubIdYhsl8XMQgsrgb1rgzIUbaf8bOSmEcQdxIKqCqTJ85RuZailmn6gDxA
 z+gHQVrNgX/q6s/0uUeynT7BaN7b/WUVAmdEti3PkYuiywb8XPnGYypeadizSLCbsYSZ
 xVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687170549; x=1689762549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZ3xrAPWUmuyygoUMGu33jLRMZx7RPtR3KeMjJcAvHM=;
 b=jqCtHP32k1tSO+4XfcQ3buiEU2cpBdnqGZBxg16X5bX3iQxV0iiWffovMaMuEY0jn/
 NIDpbOgyDzPov42kR65KAEow9MOZdWh5kYYTau0URgatk29csdrOPSbfDKARaTPJLZAF
 MFcS0iND32GQs5Vka5n4biEScIaMMxsDgQ+n7NnSEUc54rXRhJUl4KdysnXMEiQYQeUT
 csMwJYea6zdfIu7v2uUUvO+g+qfZ0N+vsHHG3mZ52dscWApA6Wq4S8al6nPJ3Ki2pCEH
 YUFI0n+II/Tmp2r1BuvtICMk8gePGJIywkC9LNH/CpRFHQWFSaeYnSnTNwQ33rghLeKy
 TQoA==
X-Gm-Message-State: AC+VfDzjX0FZknfbdtqNK+Upbgh2xYa8mzQ/PMG4OleT/UzsWDlClieq
 nqPQopfqY8pqGKJA2dJjeZSDWpnyhqOK/qzIFyNn8w==
X-Received: by 2002:a2e:7e0e:0:b0:2b4:49e7:d443 with SMTP id
 z14-20020a2e7e0e000000b002b449e7d443mr4819152ljc.3.1687170549345; Mon, 19 Jun
 2023 03:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
 <A317ED6E-AD4B-475C-A889-0BD4E6A4D1B5@phytium.com.cn>
In-Reply-To: <A317ED6E-AD4B-475C-A889-0BD4E6A4D1B5@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 11:28:58 +0100
Message-ID: <CAFEAcA-sv5R0RTp5z-i70dYj0GM88xVOOQ8ktp4k2adD-BRJQw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 pbonzini@redhat.com, 
 marcin.juszkiewicz@linaro.org, quic_llindhol@quicinc.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jweuIp5ih4Oo

On Wed, 7 Jun 2023 at 08:25, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
>
> > On Jun 7, 2023, at 10:33, Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:
> >
> > The current sbsa-ref cannot use EHCI controller which is only
> > able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> > Hence, this uses system bus XHCI to provide a usb controller with
> > 64-bit DMA capablity instead of EHCI.
> >
> > Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn <mailto:chenbaozi@phytium.com.cn>>

Hi; why have you added yourself as a Signed-off-by: here?
Did you do the work jointly with Yuquan? Or did you intend
to provide some other tag (like a reviewed-by or a tested-by?)

thanks
-- PMM
