Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1645505lfu;
        Thu, 28 Apr 2022 04:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydHwRm11vm0Lyj69YCt0gbeHddfHUPHJMEIOW4SyIQDwokdVNJT1dANptr1/fHoIc8lxMT
X-Received: by 2002:a0c:c38d:0:b0:42c:1a57:24d2 with SMTP id o13-20020a0cc38d000000b0042c1a5724d2mr23020628qvi.1.1651144310450;
        Thu, 28 Apr 2022 04:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144310; cv=none;
        d=google.com; s=arc-20160816;
        b=pbEOQLTDPgFuijg68E+YHMh7V93wA73JVLxSuH4Zs2VXqGm6F3qFu3MSsnxjewzBF0
         Krf3CUZc//MGwLDlbR35MOwKIEGMjf4yAczOn1sr7YTek4dRhVOd/uoFgCJICyXX0J9G
         owzQvgxrJfgV5VXsTB2EK6uCnJw5JObtMhK6NzkkWfzCWosS7xFlhBuiIC6mRzF6q+k/
         rSftYALW37uutA0pRUuU2vZpD0KF54g8Cp3wRwB2eKhPLohgUccbkn2dhr0S8X/4CL66
         7Bxaw5E/dzVn2q5gjDSKVOD++RIMJYoKW5P80emjvGqtKyIMShunAYpZOgtFTLUNnT5I
         T9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJj8YaKhJUq+07L3vh9lecA+8B8VlGTOVFfMPOQ4w+E=;
        b=Ad3hgoIiVHygBFxy57mUCEjZLTwdbS95OjHGV2s1/2piy5e4p4vgkknXEdBKo4WcA9
         CJbdylSVqRN6FmboH9jrCN+AowrVPO5AlwFR7BYLBF+Wdrh9iD8MCMMwq1Cpztx47ExD
         ffg7tSCC1SN/wpUfXPWClSukNMTblGII3kahyTFc1/PDQlkeFFoPA+jW4ICndr5MlSGe
         /mQa0b18wYdPylH6hb55Nijk1FTPPIIfn7RPT4uR5uSO2NSjP5r0xAfWOP6qRTXh0AMn
         zoqUTDlQS3lqoebKgBNMMH3OuwaZ1RmpsTzioRcxPtIrZTKeWrL1SJd4OX7Aw29yma6p
         EAjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IikTqJ5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey8-20020a0562140b6800b004442d23d13esi1890725qvb.311.2022.04.28.04.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IikTqJ5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk23p-0006i4-VN
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1YW-0000ju-Ei
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:39:28 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1YV-0000Vq-1L
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:39:28 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id w17so8210739ybh.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJj8YaKhJUq+07L3vh9lecA+8B8VlGTOVFfMPOQ4w+E=;
 b=IikTqJ5cocVcEdxfrZd/iOtnwu2L7PsDUFdimwI4Mg1sORB+gVsKBl2kG4TZApStVz
 vq+M2jt4bqg9K4GrO/2MBCKvToFTLA8PE0IU9eFKreMr8ZDymszdr+3RUdGKHCdqqBv5
 ddvdfda5w7XwuLmtzs8RYofvm0wKGwU/buvPit0rh6Etf8m1EOC2yf7ndMkfOK0BNEe8
 zC13SFz+lzmzpeMiXNJEZlnSAP7YJ5DFIiPJgeOTqJ6mwUN3suKFFO7ZT8z/CAR8yvvo
 FplbMSgu0/oVGPX2137coYAf91P2xaVv79orG25FA5dPAf9DDRIANK9hN+3j6j9kIs+Q
 YiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJj8YaKhJUq+07L3vh9lecA+8B8VlGTOVFfMPOQ4w+E=;
 b=zFAWhCUlr9zqrwe8XnPlFA2dbVomWnDasgHfgoqjU689OAJv4w3+cYImduE6wOacIB
 C5Z+7AD4Indqw4ERnaLhCLnJ50KN8wCTRpKUb8SM0Rsq06hMWj5EAXIum01X+hNDBm8G
 xXLl7EKSAK+TeBXjo0Z4CKI2/kSK3CrLomFmblv7/RbJ0ES9Taxu+FxGBSiGVuPZmkQ6
 gc5FeMU9JtxWb1kUYcoz1hv9tV5T2+2pCNaR+3Fsrp5jV/0RGbKsy59MGrPZnuMoEslA
 6AUYYdQ2ZQOyULKRUPA/M7FyepxQR4JrlR9ZvqQXWKKa3HhL2UBs+hOJVSgrfOeDihPD
 2NYg==
X-Gm-Message-State: AOAM531jaWB+JoXs0XITNv8omXTO8H2NsyuvmNsgYq9oygBCEyrik2sl
 EJqq6oZ2230sybW0KYfKK7hg2uZcKiclrSHY3bz8rQ==
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr23630454ybv.288.1651142365967; Thu, 28
 Apr 2022 03:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-35-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:39:14 +0100
Message-ID: <CAFEAcA-4f5ugG37+fCcL5mgNVY1Yb93KkEFgKbj6DqdDAh-5Wg@mail.gmail.com>
Subject: Re: [PATCH 34/47] target/arm: Use tcg_constant in trans_CPS_v7m
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tc8DAZkj9P3c

On Tue, 26 Apr 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
