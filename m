Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp528191lfb;
        Thu, 9 Jun 2022 08:47:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTXCAlvzkgr32A6Z7DaSMpYM/l7Wji9Qj1+ijTLHxMmH/ERBX7unE6Z8xvtP8da9jPU+pW
X-Received: by 2002:ac8:5d88:0:b0:304:b422:8bd1 with SMTP id d8-20020ac85d88000000b00304b4228bd1mr32405708qtx.383.1654789632653;
        Thu, 09 Jun 2022 08:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654789632; cv=none;
        d=google.com; s=arc-20160816;
        b=PIZnv6wcs5RtXJ5OvABBGgGQHVw0ru46MKKVZ0MG6JjjKFpzxTV2BpC0qPkFXSu6tu
         sbGh+VoWDAOS3RV+px46J+7DZ/Vq0+iArEKDBh4M4vPs/gNgePzDbB3i+wV2okg6vYvr
         nQJipBcsFoAIBjHvfRvMYWRmwTTKH6ttaVvDiY+MD0imAJ30Y33+sGVbyoE55arhowRi
         892PaJ1XDrZuIW5FGxlDbW5NK09wKwsbkvQHMWBj5FsPK0u3vsrFzwy7aDik6QAxXPvN
         jlBKdodDQD0n5VNbiWwi3vLlqQtR17jL0Kld6qrR0znZ4Y150CtQXApsaqvWiMNMmiAc
         5NEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zmPUYdTWnNMVRWu4HERPhSv6OjQlfkMOhzOq5BVuPtI=;
        b=CiFlrULFDMDhVWYibqbZuo7qvmdFH+16VITWOBr5VaAXXmDMXxtHhAANOk82fzZ09x
         QM1ARHotN6hjp19l91TAoNI/5iUq6Ibo+Df02jmmRKh0L1mkLMKbqFxvxUSxlJ4/UWg1
         gi/LFJaEsBEy8Ddt7OtxJw7N9oZmM4qGf298n5QAcwbN9T3lUm7R/Izp9zx9OGmReN5Y
         PmAUVWvD6fnGe7TnZooJb4f0zj8IZX5Qwnl8p9HETLPwHDHSGHYt/WhP3tzgzkYebTCi
         n0cqC/E4v4n4ITlnT/DmxTGTDQqDWO6sSpDm3I4fP2KmBzj/05dOvJQGBpyxDShCKCJ6
         VeRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GjbkcKhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u63-20020a372e42000000b0069ee4d0ca72si11782172qkh.747.2022.06.09.08.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GjbkcKhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKNM-0000fy-3v
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK83-0005Bc-ER
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:31:23 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK82-0001rX-0p
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:31:23 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k2so2999044ybj.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zmPUYdTWnNMVRWu4HERPhSv6OjQlfkMOhzOq5BVuPtI=;
 b=GjbkcKhWcYGvy4Tau65/PXJ5s74cYamEz94WKJLYcTZRMEPxyrXdY9Le6En0IcOLPo
 ltQtYtfa+OgWHWbafk9EeW+OZj6ZA3Tk4afLF/A0dqFRvVRXucTupgGuhvZqDsQMBd8+
 34bHhUA/E6rGrDLx0DN5y9WXwi2s1HZaFqEJne/9SBpVc/zSb3JbPes6oClMRzzQMGG3
 1RQ0a2NlGxGOzfNRrNircFEhWQZB96nBfijpLN76mOnHm1YkoIOmQYtw7GixlseTn/P+
 3Ogslya3IdAmF/KTU8m17dT+VgEdE9DQ5/rgYkmf0f/bzzPx4VRTYZ/dftPDZcXsmmwB
 t+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zmPUYdTWnNMVRWu4HERPhSv6OjQlfkMOhzOq5BVuPtI=;
 b=ED/6xbHrc9l1lvFXEdcWa9p+hk89AkwWyexBetsKrxsyt3lVPRyrbjUtKXdOxOUBy6
 I32n2jHGNemKbGHufV3thpLJnqZfiqv0fA4eB784Xw8mKXqk8v6d7A9x0yFRbrAjRCPr
 fGTZl4X2PuIRiyWBItuA1p4TO2r7Iln+gcbxlqIk4r98SVJfRV9YSls8FlTS8LNEKVfd
 1v49G7mGfaX9ulDZzZj8FG530vUR/hSpWWTLVUa1NcvZaKVWBU3fkIqdgt254uha287E
 FKTDIT8YsIEiyAAqK9yMUi40eGAz4TF8Rk3bHjFVrCzf0OY/SwTBg8d2lTQPNw6BdYqo
 fUEw==
X-Gm-Message-State: AOAM532hPU0M0Gy1hCUDtdTb+NhQJR0gd+/0FKK6Ozqi3x/d0s3uHpro
 g6He9Hg024TbbZiWKzDyZq8iAdVWYWHasrvsI/NJvQ==
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr40037305ybr.193.1654788681004; 
 Thu, 09 Jun 2022 08:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-35-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:31:10 +0100
Message-ID: <CAFEAcA94UFe2rb-esZmVA3i5p4MJ2xM5Q-TXHV=Z9MM5=nKrqQ@mail.gmail.com>
Subject: Re: [PATCH v2 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: lhwGAgob023i

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_default_vec_len,
> and take the pointer to default_vq from opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
