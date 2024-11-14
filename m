Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp298385njc;
        Thu, 14 Nov 2024 04:56:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU55rkTFuWsedeQpEveqBE6sOfWvSXw81RcItmkT+JWv4bYTNYUn20hSLtBjX6o0NSt2bL7iLrSKFGi/w==@linaro.org
X-Google-Smtp-Source: AGHT+IFRPQM8p0etFOd6kjGCreMbsN86Xa0Uf3mX2aUnffc3citaVKfPg4O/dtxpXihApazP+UDf
X-Received: by 2002:a05:620a:448e:b0:7b1:36b7:3fad with SMTP id af79cd13be357-7b35a4c5dc5mr547987185a.13.1731588989730;
        Thu, 14 Nov 2024 04:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731588989; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPg8ZGhiUSRyvWThGOimvLEUkdBG/WDZcEU0tOIGH5DvC2vA4S74W9FMIIgmTbZVMZ
         cqQGfTMo98lRxY4dC2dFQnHQnmue5aN+uBmPUkRc28S6ej+g1rLKeevw3gLyJU+1daUj
         cfHzjjtVj3wLbzYVHWOTOXXgFwFgec4n+zbf3MepPDyRW14rfjMh5U30jbgQQFbgVu7y
         3UUTLmL+cB6iRZiKxKitaQTxCEELjuVi5GxZNHhB5KX7M99xG2WReu9JBUyn3F/N2PQk
         p/zPWwNjA5rXIwxCnI+KT+bhfsJhr0kJhb5KxUfP4Zvp9/ejkXRwp2ws6pCML4A+dlFY
         5sYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5MvH3s2lSF0+0zasS3GpvyupzRWEqKzpJ6G1VW6KDyg=;
        fh=ogC767x6Sj/YnEY26AOoWoNiWqOAtuQ7b6vOwlEAkqQ=;
        b=AzdLGMCmXEZGdJPspRzCDKBtWytDqxpMdszJZQLUx14m5thlFCa7S0714iXk8c/5A+
         kJa7fFBeldb1Osckd7o2fvpPEjBsIPAq21s7uwjFnBx2frOTf4lxH9Ikr/l8nXlFQLOe
         4kalaCftek/6cgPKvKdl0YpbWvlnnN6nMybyU3O0Gjx1VjzfVVUS3EZmZkPAdu/dn00j
         w0NbnLD6I6p8U+1zksyxwZ2WY1amNHpfDrRtuPmGc1Sls2/BxT9rZ+m4TfUb1VAYEGyC
         dNWFrtyY2lEQIqRtppZLfWWtmJUO6vzvAEDLW/L8XLMnxBS28zg9qVjTu8POTEnxlRHZ
         NWrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGvR90Cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635ab78eedsi11120201cf.679.2024.11.14.04.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 04:56:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGvR90Cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBZO5-0006sS-Ib; Thu, 14 Nov 2024 07:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBZNx-0006qr-Om
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:55:46 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBZNw-0006US-4Z
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:55:45 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so735804a12.3
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 04:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731588935; x=1732193735; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5MvH3s2lSF0+0zasS3GpvyupzRWEqKzpJ6G1VW6KDyg=;
 b=LGvR90Cd4hdiAlJUnWk84FbPfu+1JbKZ7Dtz3lLxYwBK9sp3iUgmGcHtm3kNvLPNB8
 cJ62f3p2BfITQdoZ0mTnurx7RTQD/XbQbrbv9FkAzxGb7mFAqtH5LAHblnnhg7GyxxHq
 xlXDQQM4AzlSepc/zqQkYbF4c4zKCxAH9ko/25GJ0cZKWdf1e+oolLza2lL/Uzq1kwhv
 NHsOmJNqsF2zVkF77f0Ftv+D922kFM4d5uj1syUvx1dvb8Yv5RhMFBC9Idav4NHgcNIq
 j3STbdOtDTc0rUbv2eVDlmQvfQQQlEwUI526DZH7Us28UHHB59tvoboqfh8aJSqZ/91E
 X1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731588935; x=1732193735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5MvH3s2lSF0+0zasS3GpvyupzRWEqKzpJ6G1VW6KDyg=;
 b=NSOxwXp9YTxObRXNIuqH1KPlBkfTDt6LnTEcODp5xLlttRk/Q2r3vu6662zjd3Rrw7
 5UVgxSKr9PJtVed47FjMPwqRATQZdObfJ9Giy2rtXXTj+mxgk99UlH1Sh/y2veJnJ1Rx
 9bZDjTxnAxCyt6CRbntekET/dGz5dZEUhZ8qI8gh8FEM0rIurEmt5gRnivQ6egnxFnzA
 NUGcCSUjRtMYFsu4QZPpB0oM2MUDDXAsFK0aEBu4f4iQ8hAI/3JKj2inVXW6xXFKDN3k
 VSwsPP1ZU5Csqu1tUXWCC+9Z0M3800uRM2Ze0uyWbDTWX3DWnh/wGky/23PjZTvqQqJj
 dKIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKVxu3ns8ccQDXUYkcujVIv/bq5FoZnHfgGrBncBsqHVvkvqEwQJS8SgFFzEcvuv+jCr9CN3pwWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxKL16lUWPD01pIOpCUaM/4RRDM+3kVpfAcVJdja4NFyI7qHZm4
 DNrKIQxQ9AfFfcblFYemRKdiRj62C/VKrl4xUe7d636nURzrMVrgCEofJZJynaPFsL2a1bvlqh0
 0pZP1wujM6uJNtrpPk+ELit6frMc4rgabawF0gg==
X-Received: by 2002:a05:6402:5cb:b0:5cf:255e:1919 with SMTP id
 4fb4d7f45d1cf-5cf77ed46d1mr1626965a12.24.1731588934601; Thu, 14 Nov 2024
 04:55:34 -0800 (PST)
MIME-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
 <20241108191024.2931097-3-roqueh@google.com>
In-Reply-To: <20241108191024.2931097-3-roqueh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2024 12:55:23 +0000
Message-ID: <CAFEAcA8W2nfhmB8o3ECMwkj3_v7e0bz=Qxs=LCEui4LdBVHQNQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] tests/qtest/cmsdk-apb-watchdog-test: Parameterize
 tests
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: LXYBO4irWBFq

On Fri, 8 Nov 2024 at 19:10, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> Currently the CMSDK APB watchdog tests target an specialized version
> of the device (luminaris using the lm3s811evb machine) that prevents
> the development of tests for the more generic device documented in:
>
> https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model
>
> This patch allows the execution of the watchdog tests in an MPS2
> machine (when applicable) which uses the generic version of the CMSDK
> APB watchdog.
>
> Finally the rules for compiling the test have to change because it is
> possible not to have CONFIG_STELLARIS (required for the lm3s811evb
> machine) while still having CONFIG_CMSDK_APB_WATCHDOG and the test
> will fail. Due to the addition of the MPS2 machine CONFIG_MPS2
> becomes also a dependency for the test compilation.
>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> Reviewed-by: Stephen Longfield <slongfield@google.com>


This refactoring mostly looks good.

> @@ -116,16 +164,21 @@ int main(int argc, char **argv)
>      int r;
>
>      g_test_init(&argc, &argv, NULL);
> -
> -    qtest_start("-machine lm3s811evb");
> -
> -    qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
> -    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
> -                   test_clock_change);
> +    g_test_set_nonfatal_assertions();

But this addition of g_test_set_nonfatal_assertions() is
not related to the refactoring and not mentioned in the
commit message.

thanks
-- PMM
