Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp531776lfb;
        Thu, 9 Jun 2022 08:53:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUXxmLgDCO8n/2is0DlyOs9VJ90TrBqL5LQN5oY02JU4Ppw4FSDttQTmodEyznQdz3ydsb
X-Received: by 2002:ac8:5f0a:0:b0:304:dffc:b657 with SMTP id x10-20020ac85f0a000000b00304dffcb657mr26865984qta.448.1654790028258;
        Thu, 09 Jun 2022 08:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654790028; cv=none;
        d=google.com; s=arc-20160816;
        b=fsrdsOTNpF2HGe3rTzE3Hn9HLFNfk3u+eZNiXdA/tVk1wj3ZSZqNCzrdSRvCaKCLiG
         xsxtKyg5iEfalgKYAMsA1sfauJtCUlYsxYlIm5YvUBMq5cpc7UOJOqa5RyFQuR4xTesT
         /yS8Fnr0GbsGtRzPiCK+aAfD20XDXl2qjShHik5cTxEV6nPOI5suOyZLVgquH+pYM7n9
         4tLThUeEQSINcvQoUUfq0A1cOjY17E62uYKUMBCBx/IYU2jccmZFtgzvK+cGLa4Yvby8
         sHEJLo0o/h9TNR7mP5ybZzpWtRhFlHkHLh67ZrSDDMUN0evnIabyXAowDrFeTHWBi09J
         +0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1UOHa/wejQ3FaWEV/vBxY71o1eiL4/rWgzKToTCZM1w=;
        b=oebDKD3HK2GpuXZ0cOpSDbTvppUgAv1Blikc5XKfLRNaZzH3+HIqTlopYh51hxleMM
         qMu3xw/q3aEgeE4a3SfraUPllPTUjolmMLQs8EsBEKmWzebdZ+Ae9YDMsOF1G1BuCn8H
         p/vwlI5gqkBOEr16YYVmfSfrTc1+T4VjUFUcZzUhZmjdYr9vLOIMc5+Y/UXCmZ4tdR3T
         QJ9xdzPt8jvcK4iEtsVfhOtL7looksFWj9qtUfTOq4e1tdGbBnp/HwpPpx45gqoZYfZ3
         C+Xk3VT+sR34DAmOjN/v+fruOqPdLsX+6c6zwyCj6AprF5LO4AAdY9NLYLP71B6l6QOk
         OyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndbGFbyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020ac85b53000000b00304d8301513si11350680qtw.58.2022.06.09.08.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndbGFbyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKTj-0002M6-NF
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJzu-0000DB-V3
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:22:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJzt-00087M-HY
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:22:58 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31332df12a6so96739717b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1UOHa/wejQ3FaWEV/vBxY71o1eiL4/rWgzKToTCZM1w=;
 b=ndbGFbydwc034AtwqzfArXpgMg9/EXK0ru3GzR3xgfeB9bz7oHybOc+pmxe0CPgcsF
 GDhoel5YBiU2LOFWQVIwbC53PyXqSgQZ68ViUuoFzNEPeDLof23B3YEdAFZ0I+SCZMP+
 FrM/Dj46PL/atmwNkXHPzRjxLJnMEh33SFODiwcIrfyrEVrMKr1x2JFcLvd7bpVUozkB
 GgRzeUgCMhSHk481wodTh0yw1Fl8DrWIY7Ce1wFmqxi3hJsSflktR+7F+UgIW1xEcjzI
 6pUm0TGFOqrqC/yS1vGMJ0Iq7r3C5nqkzrMTTy44r8yd8WmvrjIFOA1MkRD6Qk9RPRwH
 BXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1UOHa/wejQ3FaWEV/vBxY71o1eiL4/rWgzKToTCZM1w=;
 b=PQchG6gPJ4AqSFlQ06BAn3wPVLdbjbV08MORcOjOUVxRwsoYx5AfXOal1tDZhCAfVK
 c6XYo8qR9kgjeAbFX/PP9fWJovlmbwTHpr40ql9DacCq5n9CeN4Yz95a/VP9lY0yymWS
 WIxnpuxQIhf4diFR6lzkzzn1rtX2WSes46j9EG2Yz7zfPpX1bV/DnuIBoCb4uNXEuqvw
 p7tAnu4RMLCfkjbWXETJQhTjRpsYbPZCVk+QUXb3IesBObwmmY1Vrr9opRHPyLpZN0I1
 325aRPN+oE3OJ5NcTsjbH5D4i00jd2a0eMUIQ4VzP53yGPzlFB5jo0GbZlKm5p0QAkJV
 hmug==
X-Gm-Message-State: AOAM5335CxBOqCWTFopOfUCzgMQHynZH1Jn0nl/T5oP/tCwG4Hg4fBoy
 YCsPz5RFSlRimUod0pHAlEFNkZOWrKbIrayCcL8PaK+6DME=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr42008261ywb.64.1654788176224; Thu, 09
 Jun 2022 08:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:22:45 +0100
Message-ID: <CAFEAcA8FUb=uAbRDnWHR2i21RrCgGfBwbPOCJXqb9o2qCHjFsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/71] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: 0nzFeQIim1Eg

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:

I took the first 20 patches of this into target-arm.next to cut it down
to size a bit, but will continue to review the other two-thirds.

-- PMM
