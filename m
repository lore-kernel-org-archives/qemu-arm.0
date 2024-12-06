Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp977207njb;
        Fri, 6 Dec 2024 08:31:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWu9t9CTcFveLpKbYLfOlkqZGt85pzDLJKWw+SINY3La3AMGTE0AOqdtzlLOWkp5rc7DhgRlqGsCNOn5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGjmk5+WgYKE0Ndagu8UPzmk3D62xNU23xRQKMP60KZOBMabHSBY/jUOyICoBH88sI58+ze
X-Received: by 2002:a05:6214:1d0e:b0:6d8:960e:5786 with SMTP id 6a1803df08f44-6d8e70cfed5mr41200236d6.17.1733502717001;
        Fri, 06 Dec 2024 08:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502716; cv=none;
        d=google.com; s=arc-20240605;
        b=Bev+Qn8KSJwGB/v9aXZjO8mHtifGQSrYbcXzyFAjq/zRL2o2fVKuKdD4FfiNti1X58
         YrefQqOO/mpxD0ogmRsk6GD2OkViOETft1ZLFpWosRiMmMuuv0QfA9LONqYDrH6yRE7H
         +qm5N47Y5UJrYvmO5POI17seFFfIlLNHs8RCjDhQYUBJanBVFOYNpXB6WoFqsR/LOAgS
         Ch49A0iB+Z7avV4mXmG/m3ilj12dNLwTCC4CuPtqvMWpmqzNQA891l/oBqU2E/DSkhiL
         Kn+i7fUTGHfxGkY9+OLmqPpM68b0OXIVxRja2e60AgKNmFuUXy6sx21jAJoeh0KNdvZn
         128g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oSn/Ho6cPmBzGKUU/VJ5mduJ37o94cj6go9jaApyeNw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=XSGKgD0WB0lQ5JCp/QZU68Vp9UAfni9W/DiCq6qCxt6txxcPvJfR85DvD1P6RR0rzk
         1zAgAFd7sJklSYQa5dPy9cEcnCk16+xatY//JVfUx2Q+rHkZWFxkIFtSKReE3dH775fR
         GofjtSioP2rS5CTcAm+uFKuznnNUUgU4Q5jogKQSYdL3CgsQRphYKJ7HlHr/Q1/tqt78
         EMUYc3jzE5xcxUwbYW8OqSTwVg4ZcRoJstIVSSQK1PYjAR3roCZVj7hzZVOFBRc+lfe+
         iINPZxFZ/6ANSlk/DVyIFtQ3/oQXK0JaPjhKKQxYl/Uo/W+M9xGABuRD17vHEJD1hCjq
         2rgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZS1t4jt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e807c5absi21457826d6.550.2024.12.06.08.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZS1t4jt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJbF0-0006ap-2J; Fri, 06 Dec 2024 11:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbEe-0006Z6-8l
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:31:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJbEb-000642-K5
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 11:31:20 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3ab136815so1670846a12.1
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 08:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502676; x=1734107476; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oSn/Ho6cPmBzGKUU/VJ5mduJ37o94cj6go9jaApyeNw=;
 b=xZS1t4jtB5zew/v67IjsS1fcbDDBI+bdqrxQtG8GYmKe2hb3hVgqz7HlKjWqp1Zhmx
 77a8IrYrJPYVO+BUvvWszlL7LTUHt5f/Ay97QRJ3vWB3MNg9+SCgj7qAKq5WVLqGK4Ao
 l7MvJ97QhUSH5g6Qhzq94CRVvSvRuJbZnZ1NP15MMybjaM42jQQS7V9AvN9MslwlNXEf
 nZ/I6Y30TJ69NIFvkMiEVW2n8b/1ILWD6Ns0milAg5OuYaZiWAtmlwmF0+n2bdIlXTIA
 X5gbwHB/av80xCLSCgpR29wxTvjEjef8CU89FQDjQTYFcMV269nyXKqGa2+o0q2/wQJS
 sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502676; x=1734107476;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oSn/Ho6cPmBzGKUU/VJ5mduJ37o94cj6go9jaApyeNw=;
 b=NshDCZdihuDBJva7Eujqk79ubqtLCqllTf9SViHARqKTG1UuQJgcluUsUIXY+ax038
 OCEPDgfH0VK7LvgkW1Gu9vOcD5emvGsfXko6gk0wg6dpvHpikqH7HGVvMUj9lv8INuZ3
 wkHduZq/Zar+9F7uTwteJXhgJR2CyMuWqVhnuzHX2WqsWIsszcyxEIyEXFiNQqG76peY
 YrwRf+Am0dcwN9s3RZ6pSnCpxhdtCI7IHuncU92uiKmAoyFnaIDBRjzLaKGh/rwNL0FX
 GM2sb+YG8my2ZUpEMwRe1NvJQiSwZad2/2OFsICmxBdNTAL/a48DcPvwLFDk0i2m9eHP
 QJPQ==
X-Gm-Message-State: AOJu0YxnL8yxksb98u+Ltv217J6eQFyQYI55+EQf4LB3SSwyJtsk6v40
 uLsyzZTpoaJPVGbEaAu9P045E6EDiBhae+eFzFrC/gP3iNgt5ODpoHB1/INbB2zfU8z5SkivFUq
 vqhCOVLE+rXHs2vjR9pIvHvR/nbaOtkgN7nM+wA==
X-Gm-Gg: ASbGnctdYWCTXepmj0YFcjgo9bOIIzSHD+YvGR9soHRWa8YQsifLYfNXX1s8v8qS6Vp
 uczrYqBl/rtkE/YtsJa1i3FolOM/XM4GM
X-Received: by 2002:a05:6402:4487:b0:5d1:2631:b897 with SMTP id
 4fb4d7f45d1cf-5d3be6d7399mr2694411a12.14.1733502675990; Fri, 06 Dec 2024
 08:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-65-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:31:04 +0000
Message-ID: <CAFEAcA-SUVoBXX3WkG3O_1as4AQ6sr9wR9hyTVqxO05efZY72A@mail.gmail.com>
Subject: Re: [PATCH 64/67] target/arm: Convert FRECPE, FRECPX,
 FRSQRTE to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6zrJS4aXUYYF

On Sun, 1 Dec 2024 at 15:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove disas_simd_scalar_two_reg_misc and
> disas_simd_two_reg_misc_fp16 as these were the
> last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
