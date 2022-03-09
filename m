Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp548186lfo;
        Wed, 9 Mar 2022 11:57:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBJU7srZO9dvgWD7SziyuJAIv3JGP7K7R4OkzaqPZOy4Mi0ywWLDlqlWNeFaHiV7NpEwzm
X-Received: by 2002:a25:37c4:0:b0:628:97f7:178d with SMTP id e187-20020a2537c4000000b0062897f7178dmr1190585yba.11.1646855836168;
        Wed, 09 Mar 2022 11:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646855836; cv=none;
        d=google.com; s=arc-20160816;
        b=miUUd3s6NouN1p97FTNeh4dk75EVSSgKfWgncGNHnSAraCiHmgxZGGcI9qRdpqJC71
         7q1rqoa4n0g8PYUbLem0b3xvnGSQO+uwPUZ3s4FgXKMZmRCMGr+lhHBJ8ILYwMyaHC7p
         z7dnF8TP5To7/7G25mRjiZRkNKL+ab67nHQ6QdLMe9VjXRzgpYCN+AKM6YDXBfg5O7ai
         o6x2fJUva11b5aBcQQubvmlf/IcR6RLLckAkC4NKJMSshm4BnqQ9NE4oEhjyBjI7QKgv
         YriJiD9zeCS9kabhbXPbLZ0C/XnGmx29FxxC59cbB/ooE8P8kEz6JsKQXAi+o/UFSdJv
         XuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VYqvoSIqxbVHpewAp+40LB1dgKPZNBGLAzsonwDzxmg=;
        b=QFOwNsQKxK591bM9qH/iYuIhVlynAqxmrJqFSpYb9eYA7zqWfHoWzfw37CqfAuUMZJ
         /1dk2/QpRvt+0bbIiOVdt4IDU6/BeMP1ZXtmlHwiieoCHc74EEIpBTszKtTh2mPn7NiJ
         Mbu49bh3nCEN4jxX96KJGElg+3cCC9fE0NQ0dZ1oMJmrdB+6x9pOAQso8/3jxl6C59NS
         4yvvFpRFRhI7cwSCoDmjt+nS+l+fsDiLQZG+3U4wY2O7rkdUohKqGw6fzi132G6kOfNE
         cCipfGPahG5VnP3Bs39nX5wZ8H1/vCETkG2LctxujCNMKHs6mdjXW/3lLCPFIpNF9Qe3
         0r4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVK8Jg0c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m127-20020a257185000000b00629498f524fsi1698965ybc.81.2022.03.09.11.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Mar 2022 11:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVK8Jg0c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nS2Qt-000776-Hi
	for alex.bennee@linaro.org; Wed, 09 Mar 2022 14:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS2Qp-000764-Au
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:57:11 -0500
Received: from [2607:f8b0:4864:20::1133] (port=46095
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS2Qn-0003PM-Jy
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:57:10 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2dc585dbb02so35077337b3.13
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 11:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VYqvoSIqxbVHpewAp+40LB1dgKPZNBGLAzsonwDzxmg=;
 b=eVK8Jg0cYdPDQpqPieCBAN4lRYkwNj18V6S3Stn/S+CM4oWM8TrO0hFnA9vVXIgSgK
 Q3OqFw3HMqwowLBwAL+LuZHl7fdKmKpM9bPMGfw70tW7xXgNfaL3OU66hvVjTgifqb+l
 rgN0E0pjIvV/IkCeS+O6xVlbJrkoEULooqVvzJvdV7Rh62TBitDEcLqkIMfwtLnfyzVY
 dyh2LzTYoTW4hXe0a77Snyr9tiF39z+yZw2ftNAfvwiXsmhxlwgxlB8aLsSTIBTsOBPP
 8u1Z13FVSghZjBwj7nmcLdBk6xo0vio82dJr0pMt1eHOEObU7JK9lqBAjCEQYbHHf6bW
 h9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VYqvoSIqxbVHpewAp+40LB1dgKPZNBGLAzsonwDzxmg=;
 b=4HK33KThuc3vC5KHr02U/yvlD2eMzF/fpiyYl3pQFpsWvIHssqD7B34d+oNyRCB9FX
 4DaISQywouBbNYpayJSiiG2J7NbVc47dh8sHIjLtuv4b5AJDy7/euyOdOLQ5pAvW7+i1
 DHJTGxKDoztJYxUHzf0/eh1MiuVOcOUYuDGbyW8uu01HDuwSkUMj5DniNcEaXFso27cJ
 6L7N+7sReAmxupAEbmNafYEIr149wZHLT8vRqzsIskFWpJ5D+5HS9rRR8kATTGUlgnYn
 45QHzLmi6qr3EGAXcgAp3gktY7AFhJ6mpWlF3nptWGkCHQxpWYZvaCV/VxJz08cFQfhz
 W2XQ==
X-Gm-Message-State: AOAM530S8BUa1FKxJT80Oa/7RftDXB4b/g8mMguckRk3nhcF2HsJT9d3
 IX7Uu5QQNT9Rdd9gKNfCBIQZ8cOOSVlPEzfLwuVrLoNRu1EuCQ==
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr1233819yws.347.1646855828458; Wed, 09
 Mar 2022 11:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20220308122149.1602798-1-clg@kaod.org>
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 19:56:57 +0000
Message-ID: <CAFEAcA_47Y7zLdcQDt4CC1eA-ExQhtKD8UHJ4=k5nA-LkR+Auw@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xhIMCXGWaXbG

On Tue, 8 Mar 2022 at 12:22, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f=
33:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-202=
2-03-07' into staging (2022-03-07 17:14:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220308
>
> for you to fetch changes up to 46179776c292f83848df90de60da5ae1a965ce6a:
>
>   hw: aspeed_gpio: Cleanup stray semicolon after switch (2022-03-08 09:18=
:11 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Fix for a potential memory leak
> * Aspeed SMC cleanups on the definition of the number of flash devices
> * New bletchley-bmc machine, AST2600 based
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM
