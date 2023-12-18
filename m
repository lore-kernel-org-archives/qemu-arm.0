Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp890940eji;
        Mon, 18 Dec 2023 07:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP9ToF/vnptX9D/wXwBGdSFUP6MMnBJIApmXahtnhlOjbettCu0rx88a06VhM6daV42oR1
X-Received: by 2002:a05:622a:1014:b0:425:4043:41cf with SMTP id d20-20020a05622a101400b00425404341cfmr24043540qte.123.1702915169609;
        Mon, 18 Dec 2023 07:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702915169; cv=none;
        d=google.com; s=arc-20160816;
        b=UoY4dfRo2cOhXwilVAtXrFk208RR8NU3IKk+N8YyQiKhk8QqVU+9RFxah1+pR0VIM0
         X1hHZ0O2matyl8VSwfmrtd95rkJRrYB1+arNvbDJ7PNA7F1dDNz6RxqxlM2InU13Za3M
         rjq3d6VuGWJEYKa9DGWMQ6JxFBhi34z906EKKnJz+alDmmcb9ZxmqSmWHNSh7bEPVZkb
         0X2RknofWRi/OkZNmBPG8Tz7NkgLcunAaiN4buQlsz9LU7Dsy7KhAgbqWzG3gazZgKev
         Atxy8b58/jhI5iHHPspzRqCC6FsUZbM8e6QlKLjpzjhRfKwK4lKieONFAP09OwzO8R2z
         9epA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X5P0Jl9EojV6zkbTk6T42TOU9FQT8ET6kuhjbRWFLW8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=okSdyfp+wUgecJKHBGIUr3o0SZvX9RqrWZhAZdGCYBMtJamEyoscgfstlrfTKmHRqw
         g+2yzL+sGeLVIZT/KS2ACMv3djYDtjifBVKIbng2c1NUfZpSa2PhiJKq5v03Q76jnjpZ
         ega1tiSEsMoe3ZOhr5Xud0fKvwbq9DtGcZucUOTvbxQfZswmOfqVxP3H5qouKVZZS6yz
         yRlDWWInueXGmDIVcfo+vWVpBdGvoqv2Gcf4XhlRy2xsklQfbaWs9t8GqgoQ6J5vM+Of
         J9q4REeczumHBNARKtErJyd0PSjJWSqeNjuXHpAMjTNN79xHCC2f0ezBMSywPORJOaiY
         6OUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/KsMoK6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l28-20020ac84cdc000000b00423a0ce04e9si22017934qtv.164.2023.12.18.07.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/KsMoK6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFG1d-00060T-4z; Mon, 18 Dec 2023 10:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG1b-0005zp-Ie
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:59:23 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG1a-0001kT-3E
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:59:23 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54cd2281ccbso3861927a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702915160; x=1703519960; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X5P0Jl9EojV6zkbTk6T42TOU9FQT8ET6kuhjbRWFLW8=;
 b=P/KsMoK6Z/tggLC37bK9Ks7blUdRcbbqpDFUAEdmJs7hakhvHP2Xgn0YcEmWQgpI+9
 ptk+o1ptWBHQc0MCrgjj1e1IMSYS3sIkkN0yF6gSnnranjSVcJzCE/OzcO9pOKr9yov9
 aROZ1TqiRl2ur4+XTMdvgvGcwuL5w8jgStoZNVgfBABuU6LYExbwcGSFguiGEjCzaUaf
 /FNPv5p2/Vpsm1tdQbixKPgcPvbdav4ryK7I06tZxW5IGcT9yjuY+WqV2Avv3IDmyWI0
 9E/hXe8QcdmPhAlEeo8Jn3x7pJiOl0AdgmvrZtoHk0ap/DiULPj51PdrS0fgipvmiHkz
 IAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702915160; x=1703519960;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5P0Jl9EojV6zkbTk6T42TOU9FQT8ET6kuhjbRWFLW8=;
 b=QFUIQia8qwjN0NjpJmxmMPLMwyTh1VUDrpI25bifjHyOCEC9pXzJxSbBXCACCHZZBb
 soCIC/dmMJOzWgLbLJBiuGWMT6yKK/l/JL18So9yeTQK4Y8ippBFm23NdvIyt6Zpg3+G
 MW9/RqB5H8mSe8oimDtF7VB0nx/fItSqz5qceA7z4A/HGvO+pP4LP66K3Xl72kGIu9w4
 xHCy362gO8+k73HG+vTEHwgblV/EaQir+y0K+3G493JvpPmHfS/aBFgLZJy6/ZGfU6JG
 ZgvUQJIHyN2Epbp1UmLOgred24ycvWh4qRCXYxnDtJMx/iYgx3lbCF9cWGRghHQXVpoS
 47/w==
X-Gm-Message-State: AOJu0YxOEpmmLCpqcEmE8oZWld/eZ56uBvKyLp4e8gjvCk9ozam667l6
 aqqZFGsClQ+kMiADX+uAnyPsdSrK/j5vQ6d6Zc6j2A==
X-Received: by 2002:a50:9342:0:b0:552:33b9:f810 with SMTP id
 n2-20020a509342000000b0055233b9f810mr4437725eda.62.1702915160468; Mon, 18 Dec
 2023 07:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-4-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-4-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:59:09 +0000
Message-ID: <CAFEAcA8EOLXo0wV-uHMGFjKPx1BhvanEV8h7cThd1o4udaKHSg@mail.gmail.com>
Subject: Re: [PATCH v4 03/45] Split out raspi machine common part
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: VV1sR6XZm7Ou

On Fri, 8 Dec 2023 at 02:36, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre-setup for raspberry pi 4 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
