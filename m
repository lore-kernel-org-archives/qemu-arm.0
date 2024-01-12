Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2539372ejs;
        Fri, 12 Jan 2024 10:12:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcU48r6n584Y9m/iLpddQ/dyOxq31zAlc68N/6o3WkeNJTBfhGM5nRNZ7UkD/a9Mt7ppQs
X-Received: by 2002:a05:620a:3d0:b0:783:1f80:f03a with SMTP id r16-20020a05620a03d000b007831f80f03amr1741398qkm.62.1705083134798;
        Fri, 12 Jan 2024 10:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705083134; cv=none;
        d=google.com; s=arc-20160816;
        b=UaKMTzxRLIadACK6VYlg3Gp2fPNWlinkyO5Cf4TdCI8GhtHDLgZzihy121Ta88zLAS
         GRDQYtVBi8Pyts8Hy0V0pkCh7B8HhqSF4l8gAGRpoM6J1rz6z7lb5lojtmHvDB9kxPMy
         xXaaf5nFA03KkLWz/MRcDmXzirl9L0uOPDVYnPEyAaTpNrkKk/IhNok+UViv7bg71OmO
         oAxN05pCmy+i2W42XWDKHlmUDAcnWrkQMLv8tp97rDYv/wqYRmQ0BtzFgb8edOBqz4VK
         nCoUbp91sKxR1uGgpMYaNY/ZBUZm/1f6kZoK84ajQmPnKo80/YENupL7znzIfZgEy4a+
         L4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LKtUr/7STRBwMZoeQOGBBYdccXoYytjWxVzBHAyGtAc=;
        fh=EXKfMn/GDar9E6/tLiSGS1zfpC+cdWJT6OMXKmH7auo=;
        b=CCuyx3L1wM0C8Pna2mmvfIXDN+R9lGT+C0D/brCcSxJhGhuLh+nEY+c5Mt8Vx1yKgO
         mZlrpK0HgxGRQErS+GMKHx3AZXI2tFAyPONIkSUYDdQlHSjgxOc3gEymt9hLvAnY5y+E
         elDYzBc22R7nbovqMN9ObSwmziR3bvmJruAxm1DuPLmLIQCTwh1VIDMxMAyK2CMmne7j
         9giideviSXrFSCwtsBDyUqtbkHh8DkoUMrACWnXeIrPiDAZMLopACVC3PWxR/jJEhZ/Y
         WzNq7QbYotB9+u30BX9SDu07lbO+1mJVlE/2pQPNUVugoGIkiw9JG2id91zIG4koTk4q
         ChpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DSDyKJBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a05620a448800b007830896c82csi3819479qkp.309.2024.01.12.10.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 10:12:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DSDyKJBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOM09-00077g-Tx; Fri, 12 Jan 2024 13:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM08-00076l-EV
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:11:28 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM02-00005k-CI
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:11:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5587af6ae5cso2531366a12.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jan 2024 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705083079; x=1705687879; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LKtUr/7STRBwMZoeQOGBBYdccXoYytjWxVzBHAyGtAc=;
 b=DSDyKJBXRBE8A2AD70PaVMX6jQ4JpvRmBZzK+SlwwB0+wK0aFCkwxSN/QqCQZe9EKI
 xAAMW/1jGHrTtWzxLgNNoQv85YLcRSPYXNVoIFK2NBSnLgw+M1mhMWIzD4OvbZlfDoW6
 32uNa/MPo5wVIY5q4rAwskCVo0jndKAw3vct/dEgB0WZ9irLMWXve2BFMKPz/+pcTZmq
 a2XaFZBXk/XVV9h53taYDqYRcIgFcjUflaXCDEEq0mAbyZXLgVKot2COPyUgUPl/R46X
 hFW7bKfuuI7MvMhqFZm9ucSO1ZlFS0e2BnyHJVVLNjFj8UdfHe7K8h07ZKAImZAIrR4Q
 /Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083079; x=1705687879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKtUr/7STRBwMZoeQOGBBYdccXoYytjWxVzBHAyGtAc=;
 b=V5iibkLzbiZzPYE+qigX8IVMPQB3ZLAu/YNRc0BrjLrcFtvbOiRdkyLryq0C5/EhqH
 778Q5+f5Ra26BeoYzUioSyCJYrbF4PzZnQKsxFClCwsmY85qZyQUFW0zTbybbwGavFds
 m5Bb4DC6w730wA8GhOcnFXqFjDefSXDLfJkILuve91c050chboMzlBOr/jc01dbh65ML
 X86dmY0tho74cJDOtPmuaO2ecOiUjwoAEcx+fsW5AOGhP/dGaq/SkR30bRst6f88Dg/9
 FBwGA/eoxzJHnT8VIZAseiI0OSqv2AhBfzqgoZFXOgbD9o9fNCjXbz0gomz2aCVyZal2
 pX3A==
X-Gm-Message-State: AOJu0Yx/ADBAZ6X13+Kn/DE3qCRLTq052uM2RAxiSc6F9QWMYSeiGrTv
 IjhY1RkzOhFhGJT8FbSg0uZczB34A4ooCePFRwIyhJP995to8Q==
X-Received: by 2002:a05:6402:64d:b0:558:b930:cbf1 with SMTP id
 u13-20020a056402064d00b00558b930cbf1mr1095814edx.51.1705083079181; Fri, 12
 Jan 2024 10:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20240109184508.3189599-1-sam@rfc1149.net>
In-Reply-To: <20240109184508.3189599-1-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 18:11:07 +0000
Message-ID: <CAFEAcA9sw9VW7Yw-KPrM=TRy2weTNsnyDxn8E6qcWgQagUVXdA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer: fix systick trace message
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: N97eSY0ulfXj

On Tue, 9 Jan 2024 at 18:45, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
> ---
>  hw/timer/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM
