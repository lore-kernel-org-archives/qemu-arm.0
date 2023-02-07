Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5417219ejb;
        Tue, 7 Feb 2023 06:32:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9QKsI31wnJ1VjfuUEprmPuAhdVRYcPjhpJsln1FtGeJvONMvfoQ1qjC2ruHCMFqNiTxqL/
X-Received: by 2002:a05:6102:f14:b0:3f9:945:ecc8 with SMTP id v20-20020a0561020f1400b003f90945ecc8mr3071426vss.28.1675780346531;
        Tue, 07 Feb 2023 06:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675780346; cv=none;
        d=google.com; s=arc-20160816;
        b=W5J0F0Hzhko8fMdOVh8ZrdaRpS3aZ+3xWsxNq0T3oie3hl5y92A24iZmkq8uVzqVdZ
         0ZEcP37DnbtHpuZAkDG2w52S5OhUQhgFKIwEYUn2Fd+bYBOaQYjedjFKvxfCwjmkVHII
         LAFjTueWp4177SNkcsoub24OuAIfnUx7KMMTEA6FKPumHWPKDgVZpSlxaP0Kj/TD9WJp
         pFoPzHVrLLwwo0S2oB70gsjzzZMOgo0B5TTX/v7m4K3bL+ymJ4OmP9tMjwWUI+KIdmpq
         3tvrM13yeZQX7zCB/JmEFEbUhDKa4ZEiqKjNoYncVgggBuOPSHaSkWMX/KkxQIcwd2zC
         om9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XyuUJQWcyA317robqzqS8Jqa83mjxA021KAvB6HguNM=;
        b=T0SXaaTxW81rCGMimeVGGRFe0eTPWGolmU62GuxhbqR8zRAQursN4LYB0ETfV+QapR
         TiOpHPzYLpOUUjaQo2cHiGrdORylDj85NPpWsqxRcbRuToEVBWsXekHaq8onBf0aYC5S
         DsBy4z+xevA76MhY86IveYcpzfKykgKh0BQv32WIhJZzpKoG64k6vMn/HIMMN+VtHI6A
         ofho6IyQldLQxd79we0j3yiPuQbvsgVmxrfBB6AIffk6wHLyEK/9yBcd1JImewLQ1u+X
         nBZR9z9fQ+guEikl1w4/g+LuJQyJm82wCAzQCaEOxOawFeUPNjgUrQqMpqBM3j2RtxL3
         4FUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=reu1gXvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az24-20020a056102285800b003ce9d34e94bsi4195876vsb.251.2023.02.07.06.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=reu1gXvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPP0q-0000Nq-Ld; Tue, 07 Feb 2023 09:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP0o-0000NP-FL
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:31:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPP0m-0007lR-Ng
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:31:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r8so15824059pls.2
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XyuUJQWcyA317robqzqS8Jqa83mjxA021KAvB6HguNM=;
 b=reu1gXvOW6QvQ9/sk10t5Z20Jviv/XUQKVQUp+tb+CGvgko9vDuTJNj07nCZrbbh5F
 2smBOdnzUjCs47C+SpT00NgU+MYXBi0s6ohRlmC/XXLzFNcm4hWQfAX9XJIk1HHZYpif
 zEJSEQjgStHEaBJ6PV670L694GOQC6JFGL0d4MpBkEsqowQyITzjgALZov6Tpllb+kmT
 yjlL74h5rpUD9CMzacFUFv+VA5Vscs2xZ1XlZlg0YyOCigm+srMoROehKbqCycXyNb9/
 AveBFcY4e8vahHvqfma8FeCuc1zctYZ6a6DKauMaF4Q5wjYrQcow3ac/Q/0/OMoCWKah
 4D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XyuUJQWcyA317robqzqS8Jqa83mjxA021KAvB6HguNM=;
 b=ufrAKnP545t2QHom3cGB4Q6yBgape7pD2Skpuu3cLtqCp7yaKf2i9NGe9GA9NGsUeX
 7aVqB8nBEPdFeIcvKY1XLWWV5XiHuVNIMuW5xUicY7nk43mOPZJlY4i/+Spxa6joavY6
 OdnMe11Rpvm9C96VlwhPqVvhZkAQ5N6yp18xhtMnwRrryJSnJfONQDOZG7RKKysB7p/S
 tFWtb/FvQDYbgX6tF5nkC7D3JRH2XFGVNi5zZ4r2mSsbzBliY/u09ulswCxp8bZyv2ZJ
 y/FwpXLqxk4aLwfuKdR1UXbe9DbzJ4NpRuLeEUOMROXow/SLYhRoyk27d/koHGk5TNfk
 WtNw==
X-Gm-Message-State: AO0yUKUujnnFapspFycu+oqdgHyJFhgOKDR393Rw3ovQJ77HS7SzTL/2
 YLIdcjz966188KOOuyi7HA5XMk8B0k2Ry5Agr3QaTQ==
X-Received: by 2002:a17:902:dac3:b0:199:f31:49fc with SMTP id
 q3-20020a170902dac300b001990f3149fcmr847810plx.9.1675780314930; Tue, 07 Feb
 2023 06:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-4-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:31:43 +0000
Message-ID: <CAFEAcA-01NKKQ511YcTwvjbLiBRe4d_V0-Tn3rw3D4CRxnsvTQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] target/arm: Add isar_feature_aa64_rme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: H7cgD5aR925u

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the missing field for ID_AA64PFR0, and the predicate.
> Disable it if EL3 is forced off by the board or command-line.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
