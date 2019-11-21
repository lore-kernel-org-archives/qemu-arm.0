Received: by 2002:a0c:88c5:0:0:0:0:0 with SMTP id 5csp1233631qvo;
        Thu, 21 Nov 2019 09:19:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIbL6vyRHWbzaPoKrfcZmJ+r5wv4bDH+fAcILHjMruhXHZNlPvtfRzPgy9CK7mwv0wN/fK
X-Received: by 2002:ad4:5550:: with SMTP id v16mr9206950qvy.18.1574356780464;
        Thu, 21 Nov 2019 09:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574356780; cv=none;
        d=google.com; s=arc-20160816;
        b=T0lym2BByjJWYDMK8T/97OjLXqXvZ0/q14YIt0cORkSI8RQ9lsUQPagAIZwrjKi9BS
         W+Q1ozd/9Qr90MHaSrjGSJSErie+TZ+vzsejnEAnqCxvQQrQFaoR2aUs1hbmbNzCzFxC
         DZnFWBhwj14FXkS7ckBzKv+3Rhj/W6C3OUv3qCnutqQxU27Rdwfz8LJkkdzfE83f/llM
         i0ptEo5ykRvz/ANGIk50O/EoG2crS9yZgrU2PBBwFJuXcbUy5jP/CBl1jtPF4JLelheI
         HLq+gpNvMKVzjeh5XeewUwhfGND6taon8pPdXjtXIhKJV4Bs0qKAKzBM3eiQ+lA+y4K0
         i2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OVXXP0wLgTz576g1HpDgCS/1OMSPZgDUbSjyFfL4k44=;
        b=UInM0ZApTT380qfnvDrfpwne0PWzWCtdKu81NzuQUFMSpoKCMkT2IzuLr6oxuSLI+x
         xJhQ+Gkkt1+LFrUzoOYEXaVYAvzVEhiF1IXdgAM3y97CHe3tuuiSX7RCDb9Zn3mpKThC
         yczBpS7/KuTWfvO7X+k8yMKGoDJ90MiTIXA2uR5vMnV/GG2THerMfiEmV9uCYpDD/4aN
         3MsvPIIwBhgMg6Rn4kh82P6ri7A2F6ouuX6BnG6Q5UY7hOz5VHIjrzME8tAnZfzQq7FM
         86Q4hkKRBTTY5/zgXJtn0iyGpyujWWFqtQYEq/UwFYlIH1G3yJ7dRnkHp4iq3YssB7Q8
         pGrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Il5S6a07;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si107343qte.44.2019.11.21.09.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 09:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Il5S6a07;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXq7H-0003Ns-KV
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 12:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXq6J-0003Jv-K6
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 12:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXq6I-000629-Dw
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 12:18:39 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:45333)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXq6I-00060f-5m
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 12:18:38 -0500
Received: by mail-ot1-x333.google.com with SMTP id r24so3579920otk.12
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 09:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OVXXP0wLgTz576g1HpDgCS/1OMSPZgDUbSjyFfL4k44=;
 b=Il5S6a07gJSImpMiUdgQ22spmmdJCXaPmDrVAQB+CNm94jfMpLRbVmyy6yeLMMWduU
 +gu+dRHQvBZ7OcbBX0BHiwohSD4w9RrJJwFVoEoqOE8BY6gekKWlqW2LZW2uJhBLvmLT
 h2rlXpniEyHY17k4FjYgA1AaoSKsN8uQBHcXd0R7Sr7m/9dGEdCK89anETC5P1TV2HhV
 9VHk5M27/itZfboY0WY1HmP5QRzDzIHNwV3rbC1VqNBjo3hqF+psR6LMEJVRsxibQHq3
 8m48JNCeTYqSgiRFyi8IF+oc4t/jZPtGPFKdASkS9fzOghJQHj5vluupM98+kecIv+wb
 TlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OVXXP0wLgTz576g1HpDgCS/1OMSPZgDUbSjyFfL4k44=;
 b=p978MAXzdI5hKV5YV3xNqvnw9iej2xiFi0wEqUIcDe6ebX1Z46nHtnJzYhdu/RExhj
 BjSpeQr57S41hnh4rwPvk24jKjng+92Jo9gL5UNDbcfaILh7I8onPVM98Ef0su7lD6uF
 FGOsK51G0uRS55TKbdiPvL+H2Yp2tzugowpczNQ26o/1qFxnAjIT51+nqw005DvE6IUe
 Q0wiR7RH0SshHfR1L3M9j8Lx+/8hyeFf6uevfn1yBXzx8XRqqr/QQHsnJNQnCUQSOK82
 r/IhY78lOBf7Mso4vumJn1sBrRq0onOn5Wag3hyJkhaJgHz8jtKjYsVeA97m161MKaLl
 jnyQ==
X-Gm-Message-State: APjAAAXKmkvHnZYq+RsVAVdMruxU2gCb9f/P5QqZenGGUGRWT0nyvVl3
 nPQVRQ8hYek2I0Ws5aJQ+6cOMgykpwvoeH28DIVGRQ==
X-Received: by 2002:a9d:6357:: with SMTP id y23mr7444476otk.91.1574356714147; 
 Thu, 21 Nov 2019 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20191121101618.29289-1-kraxel@redhat.com>
In-Reply-To: <20191121101618.29289-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 17:18:23 +0000
Message-ID: <CAFEAcA9Uokwo1tufxZ4iNZkjv6MB3Vtazyd3DV=OKqyt7jer_A@mail.gmail.com>
Subject: Re: [PULL 0/3] Fixes 20191121 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kr/CZqe+Lw94

On Thu, 21 Nov 2019 at 10:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 39e2821077e6dcf788b7c2a9ef50970ec7995437:
>
>   Update version for v4.2.0-rc2 release (2019-11-19 19:34:10 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20191121-pull-request
>
> for you to fetch changes up to c55c974486b0dadf97fe47e2e789d5dba9b77138:
>
>   ui/gtk: fix gettext message's charset. (2019-11-21 09:42:30 +0100)
>
> ----------------------------------------------------------------
> two audio fixes and one gtk message fix.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM
