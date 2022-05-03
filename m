Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1518715lfj;
        Tue, 3 May 2022 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1ZrSn4UF2m/qE56xkvj859BhRqFQVKNTVxA3juhw7yXJaasRu7O3UbBziAGVTx0ohXj6u
X-Received: by 2002:a05:6214:248c:b0:441:2a61:659d with SMTP id gi12-20020a056214248c00b004412a61659dmr14156557qvb.59.1651594275254;
        Tue, 03 May 2022 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651594275; cv=none;
        d=google.com; s=arc-20160816;
        b=sbvK4FB2XNEjg9tYO+lZz21Hv0WYR20xCBPhuUipbE0m6fqfDmDOR01XNQBFKGSnUy
         CfObgdXII5FQWSRw7/8fJ3TBYiGrCNEHCk406Na5iOFmjZoytx/vaIJRn5GtYTYr/W2e
         P29t0a4gzyy3Vm5bfsuLqVXRgzq8MFNamhEVVj5NtmKFYJdaTC3ACd+59Df2KAY30tKd
         CPmLV5qk44Az4gpplqC3yYOjdKx/FWDXd88CSddQdDovhenX+9Q42jwaZCHusPe+0cUh
         VmzCTLOBP6EWkEseoatapvPNU2vu6EbagOGuhTHWvbCPkcs9j0eb2AACzol++l+0jiR4
         1cUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NUfaEa2keNLK+OHuF8tjYDm/pNXCbqGn/NigOG8BKwI=;
        b=NJIsicBvqmA0uZYqbhaZE9a5v45VtTSBVniVg0tYhOLuojhOBxyFJUXSgdq4qArszR
         Y/dgawQO4+v0T5lvmT3I8shh9W3VhiDWb53oEzW4nLHEUWLRoiIgei2RaItYQGiFamrQ
         pdV2dvKR0d8qohZBNEgeGAaeG2yJNUgZNV740MRrumAHODMv7nGaTO5nVG+Dup5jfdWa
         VwzWDaEU8f2hUGAaTKVsQ8eGn3+qAUGWUX3ClopH7c/ri1uPc2kEGg9jPLpI92P/HxEE
         E31Ef8p13hLiAP9wros0xnYWAw9VGJr+VYdT+OMCLbOLwosLrtOsRTXIqFrFMeKzsd45
         AEog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck2EJOeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp8-20020a05620a458800b006a004644edcsi709766qkb.23.2022.05.03.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ck2EJOeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlv7K-0006Gz-LX
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluz2-0007IG-BL
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:02:40 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:42308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluyz-0002RU-F2
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:02:39 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ef5380669cso184757387b3.9
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUfaEa2keNLK+OHuF8tjYDm/pNXCbqGn/NigOG8BKwI=;
 b=ck2EJOeBp7X5K/bidTlayveOtu7M+/ozGX1vdro707Soikkov3R7rq9eJqAfZUbXU/
 NVGuYTBhmQjWkUymsfbdxVBTPWByqPHvTcKA9f1ylpDTiu7ykiacYjW95ydEKycYgtSw
 4clDEwb54okiuSNc4on12MNSX5fuTEh7Io4oz03hYWhp5FiMhKEGfahAPpEnj5CI9ZQs
 FuCvOT9HJIgnjwD4VdeZ8rSessOzXgQy9k+AHDK+JDl4sM0H2hzBxHOQ1vH7Zc42BTM6
 Wy++p2FSmX3FPUMiZpviklduK7M6GVMZysFM6HF9TtZNw0m/HzkudS0lK0Yvpb3RDwEE
 YvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUfaEa2keNLK+OHuF8tjYDm/pNXCbqGn/NigOG8BKwI=;
 b=VyIUfOF+5iyFZGDw8VZbAmXj+gGomh4F8tFfE13i+FQvA+n/h0otKCZuuVwIyIA4W0
 bDriBo23NaU9e3ge/HJo4i8/ZijLN9GT/O+Tr4Uy/6x9QCvzVtKJfek7pIJSGi0HnED6
 vwqASby5JOFx8e/uev/8lv+0g6D7R1sj4YBYYIPsUZxj0VR8UBMoSN/eXe+LpZNfvcIV
 tIkU3xiHWt02neAp6N9QWCQ9YlLLMdOUDjjEiTFNXs+HyjE67exRzwAYFBpov54Hty8R
 RoMXgk7zVPwsh0rO0gOye/Ja37+6ulNUconX6yPhKW8jCwCcxoO+hYBdlU/UQn2CCgC3
 bcNA==
X-Gm-Message-State: AOAM530VCtgVlYJaWBPl/Qg9MF533bBQizgKU3oWrPeE/nWRCB0xr3gK
 gHBVlNtz1HjfmdtPdPnrv4nQ9wYpq97hbvoNK1KqoQ==
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr15382454ywc.64.1651593756468; Tue, 03
 May 2022 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-12-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:02:25 +0100
Message-ID: <CAFEAcA8n1WXdoFaiGytxdoSP0S3MTFjrRaG=qRRfW6_u=M97Ag@mail.gmail.com>
Subject: Re: [PATCH v4 11/45] target/arm: Store cpregs key in the hash table
 directly
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZoQrAIH60uT

On Sun, 1 May 2022 at 07:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cast the uint32_t key into a gpointer directly, which
> allows us to avoid allocating storage for each key.
>
> Use g_hash_table_lookup when we already have a gpointer
> (e.g. for callbacks like count_cpreg), or when using
> get_arm_cp_reginfo would require casting away const.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Adjust usage of functions to match new note above.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
