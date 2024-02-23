Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp463843ejf;
        Fri, 23 Feb 2024 02:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVP/Sra2xXXpby90Euz8DDWVBHSGSEF7Y/brKQNhuwkogCGdpLGmb3srojByEGRZDrFvGBONQpzNUsroKRbvdhjWbjoGNjA
X-Google-Smtp-Source: AGHT+IGGFQePvOwUfTdHnK0J2R6VwAx0CKDfB2KDnKlJEUM9UwoK/cXG8/ZxonyhLAMelY5VqDj+
X-Received: by 2002:a05:622a:11:b0:42d:bf56:89b5 with SMTP id x17-20020a05622a001100b0042dbf5689b5mr2309613qtw.2.1708682785895;
        Fri, 23 Feb 2024 02:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708682785; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5xVCrveRKK4C5YyCxyoBmMtSXzCAyb3+CqNXeoPE8c9PLUIgepmavpPdNDMckYzy7
         4knLD6AYIk4v0e2xM4Dh8rVO5fILZjDqQW3o2mCUoG3WdJdSfqB6fHi4+m663uJVOMp4
         N0WSwKPUhYWTPVfZ/lu6nOUyIEdDxOeX5g4bv+Hn7wHv0SizjjDhqpbZYC+u7u2QrNIm
         +CjolQJo7PBGqlLRNS12BtUv6RF/AQK0Znbyk4K7dF+sJXw9SL4BY2onmOlKqBDk1Xgv
         A3bM8ISBPQIRVDZFaSBZrnP6RUrEHOii/mre9XCTBGKM50UygmtYgaNRkTKMDrVPqZ0V
         d9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rp52SdDT6BnjPWI6muRKRuIN+xMSCEAFJDu9wfrhvcw=;
        fh=sZQi+kTLqUbRiQuU3sxzwKxslq6CpWEP12sRuLZlebg=;
        b=XApDkhfldrIUwnX0hN1varaAo0r78CC+NUz/bc9mnCxyCgAf+XdJ3J6adFNJjms2KA
         HPLQwZkXH2n/dI6a0vOk4N8NV+kZGaLsDSqhLpmj8BAGX4Q+WTM+86VKk35uoz1s/haY
         WkF9P82l+vBpqMDqDeMN66z8We/7uM/8gUXORgyBN0xleN2sOv1u9TYmjMrhYiFz9ljI
         HNJZ9OZTZgWKbFvOPKbxoD/GNa3bFHCxEvUK/rkK3VFNXB6/mOTvTqLfP5v2cVA0Zyc4
         B8vkb6pKjzxu2awwugdvusNRbF04fJyl53qeuG79ELd6e0SNJ2BinubWFOkc7osi+RWu
         y70Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNwdYhKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020ac84a85000000b0042c5c06ddd8si2561712qtq.556.2024.02.23.02.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNwdYhKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSRh-0004UI-5L; Fri, 23 Feb 2024 05:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSRd-0004PV-6l
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 05:06:18 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSRb-00060E-D1
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 05:06:16 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so196662a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 02:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708682774; x=1709287574; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rp52SdDT6BnjPWI6muRKRuIN+xMSCEAFJDu9wfrhvcw=;
 b=dNwdYhKhBSqogs+md/S/E9ZPbeblgcfrSDu/KkyZqv5MSjVw44fJgWlwCJZhewXKbT
 1tmssbYd7JhH05g9devjz+5dWTRgVYtoHZxzismRs6/IIE1FxqAJwrwAj8Rn7+RoP18u
 ySELssxTHbvA+rNlqYKMHBALDJn2AOfZGR+vFGpKqF4/KcKrGGMy1lZusf3E7BQ2TgdD
 C89QO/poVPVpV5XkplomK/vR/Eje5vLB/IZhPctjWvz1LXBZV+6iKMgf8nMTw916Enoi
 TUvTKKAY96ln1NUIZLQHwkJEd6+bMhssbWyI/O7Tz8niCiTQBWH3pgxXWKGNqGlDu1LS
 9NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708682774; x=1709287574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rp52SdDT6BnjPWI6muRKRuIN+xMSCEAFJDu9wfrhvcw=;
 b=l6t2Y+1usQKKsvDSzi0s9+fz75TEeWqo4YdJOFu2HT0UAX4EKO7eNsbE9lfaYYPUKL
 SZUdkUx+3iOHeO22B0hYzkN9N1oRPzkUJEJMWBv1ybCmfuvmWxhT7f0BJ70byT9IrWq3
 odmBD5bfDCpVfwJieYBfu43hp3B5vShpQ7w+QHU2bdKc1YXd3y7dEGpg7p6KCukBjY8U
 dr7D90b7vPoM7ysJeSwvElBiRoObN7H826SxHdSAf1zKN32bGH6+e3nYE2GM/FfA6mQQ
 CqFqc6J9gnxyFddC5kpdGXB+UfGG/zEPS79pYhFj/6PT46LC8JUQXtAx54ZzUyNTzIZt
 HuVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzIT5zoreNGv1klrLp+2BOMeZIljRyE+QWp7L9UN69H+6TA1DTVnTTtlEZNC3n8e/BVN/TTAOR0h6+Iz7fZVOaJ1Zn
X-Gm-Message-State: AOJu0YwlKpx5sfLrMIUJL4i9MsZswLdJ7ca0SXS0EU7ku5kO8790sk8m
 3DZNhHCj+B1IlyzzitFl4tRhXrgTaw/vD0RPLOkZr45JDrHwvH6hhlv7BM5qO0Z43/6iuGj5Pv1
 z2WPyiX3d9RxKfYfj0pbljcbYZ9wsS78AZKud/Q==
X-Received: by 2002:a05:6402:b39:b0:565:2468:7394 with SMTP id
 bo25-20020a0564020b3900b0056524687394mr884100edb.1.1708682773910; Fri, 23 Feb
 2024 02:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
 <20240220134120.2961059-4-rayhan.faizel@gmail.com>
In-Reply-To: <20240220134120.2961059-4-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 10:06:03 +0000
Message-ID: <CAFEAcA8oHuiYJnJkg9KXWiZvGmW7=xbrVK4CFg6dGec03ziZTA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] tests/qtest: Add testcase for BCM2835 BSC
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com, 
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: g6Uxqiv5cZzV

On Tue, 20 Feb 2024 at 13:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> Simple testcase for validating proper operation of read and write for all
> three BSC controllers.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
