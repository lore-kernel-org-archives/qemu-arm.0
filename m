Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp286007eju;
        Thu, 4 Apr 2024 07:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdrxsAZ9a1Gc/C1vA9lHu2Rx5x04ZJ1oAA8YBnW0Gzf22UGY+a08mD/6r9RppZ/QcHOIt0agxE1B7c/0PCYRVITY40HQ1Y
X-Google-Smtp-Source: AGHT+IE60CXeU9uKqjYHsh0tle+JGXXZyXEfqg6/eYXmRIqXEzWZwoK+0WdqWpOCvz2Y41He+mfA
X-Received: by 2002:a05:622a:1d4:b0:432:dcf1:398b with SMTP id t20-20020a05622a01d400b00432dcf1398bmr9635335qtw.33.1712240046008;
        Thu, 04 Apr 2024 07:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240045; cv=none;
        d=google.com; s=arc-20160816;
        b=N9mpYD6Idy+pVIDmscsKKrg+KFRaNyy2FNbMHVR3dPsSVJf0kB6cGL5IsPoXHaKU1p
         dKOTYSGN8O/sr/MAtYLfXsajiTdCTvGT6p4g+ch0Dy46KUJA5y5sLP1m8MZ3oR54ny4t
         V4sk293sVSE4Uj/TVK6/9w6Ypwj0l2GnYfumaTgD981/5Dl8r/5J5M/yfvQyugkaFLl6
         Zh/h5YuCzf9LOj2Ln0g1LPG4tWFqBNxRj2tnGsYCcZsIk/GBqsvh2ZGaE+unuMVRmL7w
         ytBxwB07aWlltaOo1lWwFspzrakdQ7zsFQfHNgHdB0zCJS5dP8D/IG/YUB63+T6IadaZ
         pQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Lh6SM8nqZCY9MV4kGQNtUNP4KSdgoAYMzY3mL7jQHR0=;
        fh=OrHW4lumgJFAmotoo5zOckINSJYJJQ1NaY7X/41TzKU=;
        b=Pn6vWB1cjgaqYsMcmUYN0ZnSEORLv4xqgebW21jxNOVkw+vu5h8fOssediUTpS9van
         9hDAXNKVxjAi4EbMxPMECwHYnDZ+dn8HIaphf+SJd/OBjq4d19KAICp11VeU8BHCJuWH
         WV1PEsPhtJf41cMviuYo0W43trP/My7q+9k2FA47KOXoxwdTjBAAWawQ4czxF8A3Ko48
         ym6MGBVnyxJ9nl5KLmXN5rdrykSLa+xlsS66tA1mTSLLKxax/romcADpgVWlEFIyIblX
         YpTq5ZHFdSFtvsYnLJrtyUytxpbBDOImGe55e5Ka2fp9HvzpwXARnjnJlREosPD4Hjlm
         TPCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FK4U5ODK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a05622a00c100b0043439b932bdsi2213171qtw.776.2024.04.04.07.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FK4U5ODK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNqo-0003GT-LF; Thu, 04 Apr 2024 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNqh-0003EH-T9
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:13:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNqe-0007jT-51
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:13:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e1a1c0ec9so910578a12.3
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240025; x=1712844825; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lh6SM8nqZCY9MV4kGQNtUNP4KSdgoAYMzY3mL7jQHR0=;
 b=FK4U5ODKJK7CBotS2nbhL9FY72Cpo4Yb5E5kT2GchYl1scZitPIC/qIOGMJvUHt9na
 yDfR7ACN9PiZCTLi/sVKDSgVTNzpS1eW6V1DTTeDM7cwZjCsxRPBJx4aZclT8AVtB2/r
 fIcCsUnV8WIyIZncS6VUOZBWpMzZhL5tU+PlYF7AYtw409c5nWx/eR6g1fFcENIIbe1Y
 SxiAbhnKQhhDoQuhCmyboYkiYtPJy4rqGT4IxQ64yc5F6T5vYgndYrvHNnAcj7T6sDVA
 pfuqCtKGVmD2kf2KBU9e+uR7xEQo/4ebGi4IssrjdT5B2offlXQQ6Yc0NaPK+P3CW1bX
 1RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240025; x=1712844825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lh6SM8nqZCY9MV4kGQNtUNP4KSdgoAYMzY3mL7jQHR0=;
 b=aRMPE5tEaLWxK/IKVIEpowjGkRc/i6lY+26xmVOyTjIMbYWMspBG2aiV9EjwY2HIeQ
 20FErfw5T4CyVk6Me6e6X/HJho8Bp86HyIc3P9XDxsXG2j+T+JlY5MIc2PACr51vNMiO
 7zHWtIYi/0jAgl+cUaOXVp0nOJhDBxmHB/ba8x7r1RczEqOFo8PPRB+UehC/3nV58SPx
 PjknfAhuZ2c2G2dJSgN8Xrk5AuyjwScAhhaJmMDT+iHbELPLd4zl9HbWUGShoi9oxsWw
 mdcOdPsyXSZVhzQ/NKMTy5xT5VsUJZsFmLLOfaUObmy6fDJV3/tBKWVuXTXrPmgQ2eut
 xX7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9AawlcVnE18vYQZY88PEOD1/dEqWQ49B8ni2+W6TqA0K/juEgBBkJrUTDt8JZnYSLVv6PTesjiNcZfkFHw5HuUKrS
X-Gm-Message-State: AOJu0YyRpmiF9dPIPgvoUOWcnv2LcJ/Ct6A1oFqgmDR0FNWMSMiJzfC0
 KfYvf/fMzZgtk+lTp/VML3Ic5sx5dd4H4HhebWOdQJV4vXxtwVs8vGvJTzubY3S3tGSQpQcmNOe
 Kvg8+HW4CqyTh13enc6hikMouR+xO7yYqJx55nQ==
X-Received: by 2002:a50:cddd:0:b0:56b:8153:54f7 with SMTP id
 h29-20020a50cddd000000b0056b815354f7mr1990213edj.30.1712240024751; Thu, 04
 Apr 2024 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-2-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-2-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:13:33 +0100
Message-ID: <CAFEAcA9qhpvGmNKYGO6j2+j20mZo2P1ug86SFiN051m0dt9bDQ@mail.gmail.com>
Subject: Re: [PATCH v12 01/23] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RGbT0leppAXz

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
> HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
> HCRX_EL2.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
