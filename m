Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp418752dyc;
        Thu, 3 Jul 2025 02:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmtiJNi5wJia0Y2ePP3qGt1t9dcB0VFgGGUasKMdQvxsAsp39MORKfv+9F5op6R2Bjqfns+esM24scQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHJHc6GWS01S006XgFU4DYfSe5r/AMtkuFky7fkXRYvdganHZDJymurqpN6qCoAOXviUnzs
X-Received: by 2002:a05:620a:6884:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d5c46687e2mr995001885a.8.1751536229838;
        Thu, 03 Jul 2025 02:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536229; cv=none;
        d=google.com; s=arc-20240605;
        b=Irz025T36/nCkmj4fy/IiozfihLR7E9yciHayW38VFZnd3QV/3zSbxDuUOk9fjr8Cg
         /S3BrM38gH51BUxqJHtCH04n2iQbDZzOf1DHNnDLbNNUJ1UEMqYC1lNHYYnSf6TRjYhn
         z6UE8yT4zzFFy+5JnMO3Yp1AHWPIr+JS8lcmPJvt8pOSwpMoGDI2Ie1C9IJW7+LCpbHy
         WrtHAiKBJGypNjlcsjFMB9mJaJgRIkUcxs1KySy4PejgpE5ycvzlmFbwOLVj1s2CZiB+
         9XflZplFYa0xwCtKtWKplWuNw6+Rqvp0w4rBpR1y7J2yPMj05CP6G6Sa3fha7QOBAzSZ
         30tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=774daLD4EuUx7EjQ7j7tn33lXFslNY/Nw6XQxoMeuF0=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=EvA+XWs9ldXRlMbJrbEaaU162sjIKzHm5AwC7y90uZMUwFZD94sJzauV4ZmZWZ//9Z
         /RN5S4OLuzq62g/zu05Lqy1TtIZu7691TJq+0nwutgjKbhLJpQciJWGCmfrAnIhh0iGo
         CPDSg2QTfaMwjgLFEcRfquC86HMuaxwDR2gBcdnH8bYeSF8w+0LF7GVzvQElV44OCZie
         7KGwBeAk+ThzxNt/FP6OznuAJC0ngeDdbUX+bWbkfUB8oreoJECEIpGNuPndACf9QcCT
         nSgiqcBqZugECFMBNJqKgDMdvZ6dl4hNmWwgtOIrx4frcDT72ce8BOwVdLTQKcDEOvu7
         PSEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIS2cdqe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7686si141941241cf.209.2025.07.03.02.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIS2cdqe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGa9-0007R0-IW; Thu, 03 Jul 2025 05:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZg-0007HB-5B
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:49:48 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZb-0000Rg-0a
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:49:47 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-71101668dedso79661247b3.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536182; x=1752140982; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=774daLD4EuUx7EjQ7j7tn33lXFslNY/Nw6XQxoMeuF0=;
 b=ZIS2cdqerDziKB+HTG4yadx7CsvXcwfih5nZVlhuBbSaDGc+y5Wr+1t6BkBktyTNaC
 1UUdQP4WSdLNHGnJw4t9uZ/AGv3cWdZ3ExLz30cUBkVAm1o+g8QOihjebtJ0xgig7bQJ
 ivG1EuYgnGRODJH8mVMTR1BliCm/XCfc+ma8JgaFDz+mG1xjn4u24z87ClBLMsDfw+dL
 a2XB5nuBuwws9Rlk9fRMLUZHV1xpSBrDoCRSV8XONEcLCVz2BF1JEebw2K5AD75AwuVf
 NUWeG11cNeJVlUswYQZO1y8+YSl0E4ptcbmYqYAtbiXzTAix5RnB8g9QB9+EGLQLjmwj
 ksiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536182; x=1752140982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=774daLD4EuUx7EjQ7j7tn33lXFslNY/Nw6XQxoMeuF0=;
 b=gUQm72dprYlwwXN7UCN8IRRWGCyEpjj9cWWr3UXDiJYwPtVlIlYzzI6RkvL9Fy5d+c
 Ws5AmyH4PCSIcyQWaJfcFL+PLOTCXe2gNtWn7WFm6Cf1lsigLNaNcGVLZ4Eob3/cCnOY
 5lDZKjLnY3LbVFIJ8ZozTSZOB1gbh3qxawHXwOeT78LF9FjLAOj1A0Of4kmSwb8DYJN7
 ZqeqY4J2mhtYcMB4GahLoo2+x52Ls5EdD+fXcsDgHtBKQYFB9XNy4uLs79jRk3akM1hM
 ES6CEgYptR08mFl3d4B32ERb8IRLt6qTcXWB5oKgjc35dKEXeKExyIyzR4LacLhWfL5m
 RUhQ==
X-Gm-Message-State: AOJu0Yx1D1b3tY+ilEBNRAafXj5AmZ1lLuEEMcSdUJPzQ5GhyADuJINm
 pdqiCLxPi8xffeg4jVXw5fy3YnhIdEHOl1Ou4cfM95sIH9GDw/Og32OjVa/DAwlDTM8cOX8u+Q3
 B/JcgZ1geeU18KFiYHZRrZP+gExMG0jbD+BWdlVkeuw==
X-Gm-Gg: ASbGnctLTYWkAxB13Flu1E/MID0UcTMaP1XekQU6nKBI0UqpZN/FwbIJLMFmyALCKHg
 MzAYjs/qnrlcoIpYv/WLP3SyHtaCS12a+L1ijJCESRbb22hfGpUorQ1Qz+apmvzG1izpW6UtBA9
 jeW5+b6Jdjt5vXzA4STwA6sfshKFfHwj1ChSDXAkZlmQ+3
X-Received: by 2002:a05:690c:888:b0:70c:9364:2c62 with SMTP id
 00721157ae682-7164d523ab6mr81786677b3.25.1751536181939; Thu, 03 Jul 2025
 02:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-34-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:49:30 +0100
X-Gm-Features: Ac12FXxViCj3uXkfT-RUryE6O1_jry1TeT6ke-F8AJRp28sAC__uZ0wNVBwQHIQ
Message-ID: <CAFEAcA9i9HQvLTaN2nJJPZbQQUu6c7uM1DjsVd-k7vvNCeGKkA@mail.gmail.com>
Subject: Re: [PATCH v3 33/97] target/arm: Tighten USDOT (vectors) decode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jE6lb+s3BH8b

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to USDOT_zzzz_4s and force size=2 during decode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
