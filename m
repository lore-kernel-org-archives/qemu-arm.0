Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp287695lfm;
        Tue, 18 May 2021 03:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDzCInKvO4qjRKhrp9BJWQkX5DZ2yzyKa0N9jMdeYsiolAIoYyRQRnrX0/JpQKNvUccg7C
X-Received: by 2002:ad4:57c4:: with SMTP id y4mr5171129qvx.33.1621334769947;
        Tue, 18 May 2021 03:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621334769; cv=none;
        d=google.com; s=arc-20160816;
        b=mlm3r73x/M3K+AC3b0bJqCAAYTRWsm6m00Vj+CQ9cgsHXk5IcZ+3sOaZMWXM2rfRL/
         Tb3VBTj+MdoOW9uUelpqM9gEkLg8+sqdwPsjMdJHtZQAFM/IUsBjh+81WNNb/e1Dut0I
         wBlpRK08exXedmcFLlSv3QT46/+pymV7vburT7t1luKbn16yEOxUy2fifmoXRZfbyLyD
         75/Dv37aetoZV7X2JZW1ZQlaC5R6ueHx+l1J2nsdC6fTCA5y7iZ+wuiH8Fhv3gPbPEfv
         f6JrjpNHNJfxKNPLUJls6eONFUg6ttSkRkPboaw+q37+obmkcXM2MJq/LFTuOq9hq90+
         hB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FtHMu7bHz9n7X6gZPOCuaHwO+3dMSCUeiHZvdP5dsIc=;
        b=E2J5OssIVDfgU53r2walseZl98zhNFyxcIKyPV3/6VCE+wVeeuLfSpHB0D9//HO8k9
         ABYC3MC/aZmzOnwKAr/0bVAHWofT3+Jywf5dXDccrHgD5cItD7/YNlilSYoqNgxdxXiY
         c6AtrK5sEUlozES5B5PEZUMFc8rbgnGDRUZK0yjyrVO4aKvuLFEFkzCgBPCV0SEPp/qa
         rhREWijY/oygp9fVGrXk7zIC3JkJBU7/G072qPdiISLy5JdQMLmsQR68Hs+wivOCyucT
         PMe5gk6EltHpzX07m2MA5tvgbCfS9Smr02i/acDyTbxwIfkFbpq6V/ZhOOZY0SB8gp1I
         viCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jGT+FpwM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si12963171qkk.229.2021.05.18.03.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 03:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jGT+FpwM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lixEn-0002jI-79
	for alex.bennee@linaro.org; Tue, 18 May 2021 06:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCA-00006i-82
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:43:26 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixC8-0003GT-H0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:43:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so13791087ejc.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtHMu7bHz9n7X6gZPOCuaHwO+3dMSCUeiHZvdP5dsIc=;
 b=jGT+FpwMJwS0i8c1qItTT+t0IuHp/oBmzMGHXmsRB+RXF2yMTVa2McbWlxd0kl0DZs
 lz8FCgH//or20QWW2h0I6VBSP5iKVQULYUXcS1h7za6kD2apVHX3TdmqJroeA9TCtAz5
 kgWwPkITd40sT6MkrH+skoTQUg2HAD9zTV0zoIPCaMSsUWMtbkkZf/iGqWQFlpusYKvR
 x2F8Fl0di6SCK0bO/KzFBC3TTc5odHFHtPjOZrmh9cR9ibaDgViD/4mNmbqeKdXa0w4P
 ItZwhbvCkwyEEccJneBj+7PTQE1VKs4qTywSvNg6qAaTJ+T0U1KYtkJjDqHfdJSkeUHr
 292w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtHMu7bHz9n7X6gZPOCuaHwO+3dMSCUeiHZvdP5dsIc=;
 b=q4dRRTm/ATY6HJ1KZRVdzXOhl4rTwVqDOVr27kbT5m2PPlcRKvhmGKMQnv82ptp7Dz
 yJ4+NsxCsA5wgA9nUh3Y1sEUD6JdD1hgvG2oGvRVtOx3dsctdfrNJoOQlHgShWIpFbAz
 DPK4WqipQnxTBPwwZJ7blcGhJMCR2GCWWvIpVmklAOK7UoweLYAZvH9g0P5hszMjyT30
 TFsVVuPBIkWdapLHYjveUf6gCK5ga8l5ijZ1vrX9iIAP4PUzLhMO9qTSSqx/L+YyOKPS
 P120a3/eDaU1v/4Bg9+cGmXDPVa1DxlkGTZWVCdw5WVqOqzNleKAF0jCX5Bjgs8OnLxu
 bxmg==
X-Gm-Message-State: AOAM531nWaWU1TvcC9Ugn0MUbcHyBXoxs7jwy33X6kr0gFfXqWbxTEzW
 ezw3iH+s3d4dbi2MNJgfX9UAqy4Wahi+3b3ZV79cJw==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5260058ejb.407.1621334602860; 
 Tue, 18 May 2021 03:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-2-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:43:06 +0100
Message-ID: <CAFEAcA-dkve2515fQfm4nOsSWEO3JDG1VkF2jWQmVOVTNu1v7Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /atAQOn1EBa9

On Sat, 17 Apr 2021 at 00:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that the SVE BFLOAT16 support does not require SVE2,
> it is an independent extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
