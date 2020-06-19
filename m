Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp614530lfm;
        Fri, 19 Jun 2020 06:59:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmLaEQkycwuLjoJG0DU5aPCNUoN6TpMC08mtvCIxQtzKeO4jcyfVHIKuuLRZSFKFdYuWS/
X-Received: by 2002:a5b:98b:: with SMTP id c11mr5966907ybq.247.1592575151592;
        Fri, 19 Jun 2020 06:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575151; cv=none;
        d=google.com; s=arc-20160816;
        b=SuHum6dD3+u4jSaS76rAF4eOGMG1D9rXTBuaaw2CiJq81ZkYBEO75tfn9cyGLdfm1r
         /BsU3QbTeniuj9+0tygO1VSj7MqOzZgvkjNlWIVUuT38a19KU6xQOEgkjb0eaDN8uGAl
         mnKkvRNxArsHJUE59ln3qZhuFqeT1MoQyH4mp03593zka4LSP14rosqFzFVF776oFNsU
         DQG85K7iq8cCdQCYN7wgU11KsBgV7QMf+qflFS4hkRWWEUk2jsItTZMBhhFsh0o78IrR
         b7v0WLVmxr6D9jOxxTst1wbPfdazic8wqu4FUZecrJEFZ0O8UgqSOuQH4jzglzv77qVw
         YDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wu1YLiwwCFElbX/aw3sZKz/7Ig1T3KZntvRMG52vCYg=;
        b=VF/21mb9OzhClonEvjA8f3u+3bvip3RJvqPONqNlPe/oElLPArhHkckzxrV48fHBa+
         F+YBjicmVfIwWRPCBu1teEdrmcIPwYOLUTgwwf9ywNrlqcMLe4GXoMf7WLteuZeKmmeu
         SSj32HedJa2ThA1zPaJVS+4XjPt3TBp0fDnbJkpUFW4rr5LfVnBlArV8Xg0TVNb8MGKn
         GWd0FIR+H6B3sGV2ZCGCKy0brTTfUmCxhKLO/brcN7Oq90eUnkTuklwcskZWBFGaTaW4
         bQkCAropVHp1lt8oKC9Ic62RS1aQoijcXHG03ZRwZnxwITb6ERiofWEDWqArjiMRWVCH
         8q3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+wgvJk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si4766972ybl.23.2020.06.19.06.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 06:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j+wgvJk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHXy-0005Pi-VO
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 09:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHXq-0005Nc-Mi
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:59:02 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:40124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHXp-0001zB-3S
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:59:02 -0400
Received: by mail-oo1-xc43.google.com with SMTP id v26so1908181oof.7
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wu1YLiwwCFElbX/aw3sZKz/7Ig1T3KZntvRMG52vCYg=;
 b=j+wgvJk7sbwgCtV/iMgsvoftk9pTkr+GwN8VkZ2cN017wCT+abKEiRr43qftxJhHYU
 KX3OPsqsv0ZB7RbIKFZisflWvQqvH1iMzOp8Ajd7+yBNoys9Z4mEORlaiQUUrsjgrYKn
 4NUWV4rDaYoOF8T2TAiC8SwwwmWT1etVvyN6pv2OMMXcP8rfJgJzoIn6K/ZxkvH6dKwn
 ohhe50rACyvjhkTFi6qYyorch+l7vzH8HtyxUZZeC4XfyICwkGXTJeG6qGevp9nxy23o
 OnLgUK002NfANwyN7thgAhy6rjYjPZiWATs6QySCj3m08T18IqMHooxrfxTnpqFUtGvr
 zWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wu1YLiwwCFElbX/aw3sZKz/7Ig1T3KZntvRMG52vCYg=;
 b=W55S9hTsUHKca3TVoT7nePadKfMzMzOOzDTsoqHpD5WKGM21Jh9uwb16SHXiVDcbTL
 hu4QBHMnPDI4M9VOFd8kka7oUvWgwUiYra7x3loaTQvQl/EbpEllnr5VZS7ay7LGvNqb
 YcHa/jtHencwhod5joJ1LeI62xLoA77PLfSf1G8YhL1Kiu2zJGopLDqTpu7DZW6pGnim
 lTJD3fBkcabfEZsAQbHyb5hEHb2/6CDzFJkubUfgq1ns7xkX4TX2ivqULRGUnPjk9CFQ
 kDwTVqPMYSTM5b5i3F4gmCsOqzDBLjxOLroEzCumzZeOz3la/EIynywKpZ/d2eCwRfZX
 /AZQ==
X-Gm-Message-State: AOAM5312q+IIpxwL5kVUXpiep0pEiuI5rSPttUJ6fCQXTqkkTSsFcQDH
 S0TAcsywTSzjRbtC/cQiq7YyvVKCAQiaSidhDpo0hw==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr3383543ool.20.1592575139746; 
 Fri, 19 Jun 2020 06:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-29-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 14:58:48 +0100
Message-ID: <CAFEAcA8ZYhqbO-A=FkVzgKkcTm1tVVZSB0C9HOFAnYG7jaFPpA@mail.gmail.com>
Subject: Re: [PATCH v7 28/42] target/arm: Use mte_checkN for sve unpredicated
 loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MYKYAYIVZZqL

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Commit message suggests we should be just adding an MTE check
but patch contents appear to be moving insn implementation from
inline codegen to a helper function? If you want to do that
it would probably be easier to review done separately from
adding the MTE check.

thanks
-- PMM
