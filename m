Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp892312ejc;
        Thu, 23 Feb 2023 08:36:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/uPRyJBQrUezC6YbY1eJub/R3XdkwgvaTb7ilxvz1tZjLiV67S0SU0X3G2v4QThU0vARod
X-Received: by 2002:a05:6214:763:b0:570:bf45:d6f7 with SMTP id f3-20020a056214076300b00570bf45d6f7mr28673407qvz.45.1677170202341;
        Thu, 23 Feb 2023 08:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677170202; cv=none;
        d=google.com; s=arc-20160816;
        b=OaNt+N5HN7CKgeS3d50BAn7pxLqMiSqHKO4Oow7GrOX2qXz8+wtsUgTVIf6I6V1h5N
         DXizFiBRBbj2lEXu6CaKpihTs3wCwJOHiN3vZ9bE8GwExaaq/9NfUIaeq+zfKzz9cYBm
         96Ij/p0FkYu9vOOL+sjTpuSMpty/YCrAxpUAiBRNppKDwrSnWBLRpQgT/pJw9/bi6NB5
         auhsJZ88g3I3ZMzrWbsKz+b5UNdqtfFQp+aOfeKfj4O+7dLPGRQsv6Y8WnN7QBOF3/yq
         VnbaUDvvlqE4Yl/Dz3boibrusvlYKRPLUu3VleeYDdUMZXumPYOtOQhjP+HH8v3fO6id
         dYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sa7PV2nXBXdAlCvEmxHvm2m/RDngqt4wtmZrWM+E0z4=;
        b=dOIYjlGrAX+RHWS2ql2SZSZZ7C3M6fumcgBAW93O5oPnZlX3+eMKlPJfU8UytPNPU7
         bU3IOxMy2KUioYhJsB4MKAjoVsnDhVU9IiGei0Fv9WQX9/WhNsALk6NCcxiqzhhVLx7t
         3uPNClIyLQdZgJZjJqCJRu9getX4y1Pbcu+gB/0nSK0PedWowgp4EFn97sysGgyxTMW+
         EHGEFfufVWq1Q2c7D4Pf670cT7pTlnCHHLIHQAl2qqGHfAdfysde/sHPk/c4pqxfxwOt
         yYIz4NxL9Vs1SlsL0AZsw4tHhoxpQQ4cIjKjVAVCz4FUspVOqDPZovcsw0wKYY9Cb8G3
         QJgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDnBO6Xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt42-20020a05620a47aa00b0073ba88f6edbsi7633893qkb.80.2023.02.23.08.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDnBO6Xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEZw-0000VD-6c; Thu, 23 Feb 2023 11:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEZu-0000Px-FU
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:36:18 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEZs-0000Jt-VD
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:36:18 -0500
Received: by mail-pf1-x432.google.com with SMTP id n2so504576pfo.12
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa7PV2nXBXdAlCvEmxHvm2m/RDngqt4wtmZrWM+E0z4=;
 b=aDnBO6XnnR0wHCaY2toi/fDPPbIkv1MTuNDOizX8UG4kDrS+M5a339+wO4KGvk9k08
 3QTOlRzthqyXFXflGAB3kJJO8wKR0qMQSSf/OOiNM7KFggTVqUUmUxa5QPuRbLAb5518
 H9dd4yc7OdVvDRea3+uaCQ4Gk/pLOItRrFAfA1PdnMbh8EhliPlI/c4KkPmFSkGgcQCc
 EaW3oBjFXLgEWsbexgUAokxcflMmaYFd8hRuZ1eOn+Qe3P4CwKKo3QcW90zPTdJa0Brx
 vRgtyGnP82xGuQsAZBDMzqhqSWypQkUL4GzYNI5ofEyvOI4o0jW623NMXV0huB5QqGum
 Q6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sa7PV2nXBXdAlCvEmxHvm2m/RDngqt4wtmZrWM+E0z4=;
 b=O0r1DMBSZfIyixtefRWflOoH/ZnwaGeDDJMlkIpAfAjU9wZ9EV32HiR2JpRN8prIAL
 l4LaFAqwHtn1UFrye1AQ1eQKb6btE8iYywKUy8Hx7CfoxI62IG095wb1qep7i1uepcmZ
 54GEcuAsbp/BduAK1Atas5jIb2q8iviNhgX2L7RlOGaC46659dYaaBZNtzF9aJM9v8OF
 VQ5YeAgNyPDrAauRUKV5E+DzAyVXeEeP8UiiD4Abn7E9BnAGiWaEC26wVDGL2e2aw9DQ
 G3cS2CWpb0SjS490zn+Tx7VFW5GGNxV95FWDiwxN/6PccRukZMeeelCNas8Yx9R3PEMj
 h6IA==
X-Gm-Message-State: AO0yUKVMXuOfqLA59eVNkYwtWFWd8mQsAsH9/P+VFNGvrVJYbTHSG2WH
 v8X0VFVr2egVOFR8b+GLQWxnY+SSGilROwrWLclLsQ==
X-Received: by 2002:a63:6dc8:0:b0:4fb:b556:c9fc with SMTP id
 i191-20020a636dc8000000b004fbb556c9fcmr1813494pgc.9.1677170175518; Thu, 23
 Feb 2023 08:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-18-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:36:04 +0000
Message-ID: <CAFEAcA_AOd=swPveyTs=icGN1Hrbhr7vwgrpA0Bebme_UWxq1Q@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] target/arm: Move mte check for store-exclusive
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: 6dltSl9/9ZSI

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Push the mte check behind the exclusive_addr check.
> Document the several ways that we are still out of spec
> with this implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
