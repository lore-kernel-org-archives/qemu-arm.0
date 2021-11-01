Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2314782lfv;
        Mon, 1 Nov 2021 10:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0/KvceNVJqZ8OQ4OclFp0elLkzqaU2FiteqrOdHAE4OESv4MsrdhPz6aexmLCc/W1UWNd
X-Received: by 2002:a05:6808:14c5:: with SMTP id f5mr204661oiw.53.1635787108082;
        Mon, 01 Nov 2021 10:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635787108; cv=none;
        d=google.com; s=arc-20160816;
        b=Xn/sYNO9Z/yrU8DcWCKYF/ULujYrCUGq2pTeYd7PKeLJKvtFWnnCoaGC+XKEv9UW8d
         fhEk75vCFCXxgx47ckS6gnuaHU5W8pg+3qOnquBaa94RS01bC8gKhOXzDLh7xd+ezmKc
         ANj6SSk3G0jVBaOAE+1zxfTErsfSUbLIZkJDkCxDdaCzoUPOBP8X+Mmge+Jp8aA91DSo
         LhmYi5WR+cQbEOh32cprFtCmAlCk1GeGOZdbMdlaRQpuYeTpsace+rwh5Rd1VjGOiS/N
         HgfR/i9FcOQ4TIFMkwt15UOmYxe7hFxuNxYA1PnmuDvTTdEDKLjeHmWI9xwYitWHlbDV
         Wdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
        b=xtJXBpzVa9BUBE+8qR3zjxEHLI1oMGo5dU/DwnHZh6IEMryNaT9sRBdpof77BxlJ61
         PfNZSk2/6unEQCo5SGwSCd5GQGZuyFT+jPGV+sudq/YxlTjw/L0QZrIlD3jOMyrnCsbj
         HsY+KBv/tPjaYUjLbL54R7iu49Yo/ltNYAo+BolrSffxchzmjhOCB8DK2EbH6jiF7N9w
         cNvN5raauKBVaaJ0t1Vdl2PF3+BN2b860+/ZWRhvdALVb9irY0Hvs5eq02rHwWTbYuVQ
         FEV1/mZuN89YvqgP/hDYoP4B5fVLUxKLPmFaU3ufZOktpfQoSmYXiocKPnwMnbyUW8CL
         a6yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQne79Cy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si16631854ots.49.2021.11.01.10.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 10:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MQne79Cy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhax1-0000Xp-Dz
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 13:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhauh-0005cQ-KU
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:16:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaue-0006oZ-Mo
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:16:02 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d3so29088887wrh.8
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=MQne79CyTjrNtV8iZk5w4JoylwxeBnwdJMqhTeLZA2q/McYOrL1ue+INOhXDLhD0zw
 1ZMyWtvKzGIDz2kUcqsb1V4MNsn7nssl/Xof47WT+pok4Aq2gZ6kUxzrv3ppH5pGYw/u
 dRWc64+RYeiaZY/nimrfF0elz4/bCHkKm90BxU9F5l83rSqxvr01+cmFU30xHnpQk6sx
 DntT4ZhNcknANQycPai5sY6QH0nqK19x13qPCOuGucvl1V+yD5bCoLyOeDsmE5KOyyWW
 sXCs86L2sjD+HLq/wIqceKMVXf9P5aw1oudixnyI3oSQlps3cbQJA845Gv/QZsE+w5aZ
 r54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=JHXTtwZDbinDxEHb5CMj/C/7KnkNW9/LkyglSN8/mH1p+bMU2CK0tV+lmXLtEUN+Uy
 HraYHtOidabNDR9h0kfMUEdr9/dPda3Q8v0EBdRKoQaMpB35MLDip4kKauZotpgYAPn5
 L7OdK3F0tR0pl8kcqI7jWJ1OWvymU3YyxF6A6xW70VuuPYIAvgep0h3S1N02W1ME28hn
 /XBoDA52avZvV/mWI36DqABsPaAaNMj6lCM7tq4bQJkWWYeMYf8xNcuSY/nuRHCHIUyl
 vXiQg/0HEk5X7Nh4TIlWevQ8CAU7++Njir+3EwrKj/+pVwrRzZYjlkf/9AjTE7Z32fhd
 wBUw==
X-Gm-Message-State: AOAM531RcKqjhdEa5I18XgxkuKPTahxvGJNiyEYdZegrJWSlKtf+3GMy
 PYDt/hhbLnD7vg/8xapvdhbYPU9AiLpdXJS6xzUHrQ==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr29968881wrf.302.1635786958861; 
 Mon, 01 Nov 2021 10:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-3-wuhaotsh@google.com>
In-Reply-To: <20211008002628.1958285-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:15:47 +0000
Message-ID: <CAFEAcA8NRJQDcfXf8DTOL=XXQWUrn1Ud1mY_WVNRCBhsLHWXnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/arm: Add Nuvoton SD module to board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8aOWuLXUuEGj

On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
