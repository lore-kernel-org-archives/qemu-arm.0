Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1249440lfm;
        Thu, 25 Jun 2020 05:37:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLBG91zW/N+yxnKMKy9cYZK0NIr8Qi91o77S8Tv11DVtFOm1h6w7VE83mzBKxjCQEzF/EF
X-Received: by 2002:a25:2fc5:: with SMTP id v188mr50514601ybv.130.1593088666393;
        Thu, 25 Jun 2020 05:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593088666; cv=none;
        d=google.com; s=arc-20160816;
        b=Fgv3abGVOA05yJJVFqgHjDxe5DrvcAPC6fn42ctgP5KxxnUf+aJ5vPgqzOQQifIesF
         2uakUvYuGQMZIL3HIr+49bS3zRxgq/2W1ROZ4foCw/mAsdrFJrrUEGzp6zvWK7rRgKsb
         B6jYrSMNnT6h4YthuLD445McdVJufNFVDRdfCQqJcmQNfkWyy7nEthy8nqtfPvG6UIpr
         ybP32oyrF4rW7dcXuNlAMeawuyNHd4zIzMNZG/FIWpSNoETfpukKZEh0TKX20i4F4HfB
         PYtLYcX3gnNyCFX1EA/Mfyn+ze/UB73eKWRVRI6SoMJIy6JmBhtXIbQ0As3OYlRCFVeL
         t5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZFHpMOYtCIzEJVrMkx6YgojfrBC/z+eBsvCmd/37V8=;
        b=TpDMQfLtb752P3s5RCGaJ4l3jlIcuO5689Vo9GH52y9ELdJDdFk+d0c1XbkJxe7vgH
         2XBefWroj/691RsZa+YZEp6aAkgu0r2e/aG2kch31Ja37UEMjIjFxEjLT0fBf+dZJA6G
         Le7gCP/sR1pORLWmVS8EFV3+28/+arEdpb289/EJCaZnfK/9SeUF+XO81bavDO1foTte
         Kxt8wMEFlIxj9YhK66bCdiTzy2sWI+4GBQU3e0wlSOoDy3IYWZ11HjhQGvkLZ5HlV8f/
         7arNARp5kSshtV7jCU12yUwIXXU8MZuYNajX721pjLCB5J0tut61znz37GLv1o6QfAHw
         /yqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CNQtlz4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si20550009ybt.420.2020.06.25.05.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CNQtlz4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joR8T-0005bL-PB
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR8L-0005YO-7n
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:37:37 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR8J-0004CS-N9
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:37:36 -0400
Received: by mail-ot1-x344.google.com with SMTP id v13so5087393otp.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ZFHpMOYtCIzEJVrMkx6YgojfrBC/z+eBsvCmd/37V8=;
 b=CNQtlz4NVl0V/rfr8id1Ogk5TAw4BWUfPwcDP1PTKGVvb1Ua3Bdp8QHQk4delh6e00
 mDUAAKu00kh2ZmJ2V+nYIvJ+GtQz2k3OdO1C6Oosjm2ZGJY7f0Kce+FBX1b7V86b2wnc
 a8BAuOnXB3pdvgD6NJ3HEbhb6kzmMkPHO9ogl07VxlBqL9/qdEoEeWEckIvQxISzjgxn
 IEnbbqA+WX2rdISFskQtLbHh2Em9Y1xCpHOgTa/xucTZVReTEZ/OeGNT0vhxxpK12XgR
 oTgOjMMXfEmTeo3X3YoTbXE9YQGMzIbCj3JyayZ2AowFOwwqAk2xL0Y7SHNHPNQGP4vS
 iUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ZFHpMOYtCIzEJVrMkx6YgojfrBC/z+eBsvCmd/37V8=;
 b=CLrg8ZPRfN3FFrcpB6U87SpudevMsyw//sjX/2yGely0CKJTutKlaI9au36EPugBhG
 w0jFjFOfE5RiJxa9iaRPQcgNn8nvxZCFXXLdU/6B2nnl51p+rrOcHebqLqFmaD5sfcaz
 paKi4i7SUq8KoT179pwgpjzzIM40aqVjWUSU/+ucftDip9sPv4HdbEJW1dE5lzDM+3mM
 1Su2WfFIa/nkZ3iXPlqL2UY3zuVRw1FVMZC4AMnYquBa29v0cMAIPDuXL92+cDNwVxXF
 dbVxAEc2d9LM5AU8sEFo4JhajP2uuPeTSJLKRfZloj2o2hLG2rjTp5xdMiYgT7doRlGN
 erDA==
X-Gm-Message-State: AOAM5312G65jw3mmGyrCdbIDZjAHlj6a3BmB4ht3WJfKUw2MSYCcb1rE
 ZfhfD0ySIOAS2S9Th69cJFJlFj9LawxZWrqCrBURKQ==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25337868otn.221.1593088654570; 
 Thu, 25 Jun 2020 05:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-35-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:37:23 +0100
Message-ID: <CAFEAcA8rv1HEuExEKpfCYbpYium9XNDXdQDS97VUHq-dadJypQ@mail.gmail.com>
Subject: Re: [PATCH v8 34/45] target/arm: Add mte helpers for sve scalar + int
 stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3bkqUdLpHxWE

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because the elements are sequential, we can eliminate many tests all
> at once when the tag hits TCMA, or if the page(s) are not Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
