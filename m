Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp388383lfo;
        Thu, 28 Jan 2021 09:01:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1K9ww3qNBzy0SxvdP8jXr3gJ+wVBdJBG5WODJNHDAWBLIJQpacGHeHIHmfV+lkASk5eJy
X-Received: by 2002:a25:357:: with SMTP id 84mr239633ybd.256.1611853293450;
        Thu, 28 Jan 2021 09:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611853293; cv=none;
        d=google.com; s=arc-20160816;
        b=FlbRWR4vhy8z65HJbpHgqLrFkSS7/QrkpI7j8DomDObr7G+rkmQTcVHs+BUFYeQVPY
         0JdrAtKVeclaKdSr25ic+PWNjjmD1SS2NRGEw+X/rrXKxEw+uXXtwJqQE6A0TsaftX6B
         jdbIhNUuOTJDTZQnInzNdoqg/ts0I0PSUgXjcjYCA05ziUOGt/Bf8uSUkn2O8rzXiAJ7
         VOz6mnxa0ZTmOsO1TB6dDnKiojX7GPvGysfdS9tF7SJ0I3Y4Pl1Iy5EJ9x16lb+3kCT1
         KwVV0SQFlZPJMJgAFAKkLbaTMWw/+ADO9PVrVw3mz3+fBKPXU5bEhv7Cg4QrfCFqNe32
         WcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2DQUMMTaz23XsXyQ++1AimIsHVC3+5hkRsDqtniRNM=;
        b=iWLOp863iXyxxZ+wNtUpne3yE/swmJacX99sUmZmxm11oDt5vHHsKYi5faekjfEYdm
         zfKzx/+GvsgRCD//z/uGtPe9nfrbG8tu2IEqL9b1GQVF+vgozyRguVB2SNIHQGu2CYIj
         KDT5IKOIeo/G5KMl8/A1GRll1ySCSxrmrvXfEshlh1IeSlGf7kSxyPhtGOck8yfjx5TI
         FBWFwNtKyVzdCTPP7Qa5cjTBTtsvC5Kampe6KrwOOsTyy/50bRzF0wUFJzEmxZYRyfHh
         7kCAwlj4ZePok8kuhxtOdoL7zBJPR0lREJWp4FBhGsKnDjjreRZh5OBdX7I+vCwIyJ4K
         mHSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xooC7pTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si6061463ybe.108.2021.01.28.09.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 09:01:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xooC7pTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Afk-0005G1-Q7
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 12:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AeK-0005BB-Kb
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 12:00:04 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5AeG-0001PZ-TP
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 12:00:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id d2so7457558edz.3
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2DQUMMTaz23XsXyQ++1AimIsHVC3+5hkRsDqtniRNM=;
 b=xooC7pTa1gnoR3gIQCdcmhbmoWSLDAC+XPNnM+HZzyIlgau7h/5gTHOK1PvjxEgdnh
 YO8bdvvX8C2iBdwbvGMCXVnSrYqpXvRuJ1D8lm5dl1706d+zv5wZ1Hz27dGv56YOfwlC
 MmOcbn++vHiYJDBOOulVd2eDdxFyyntxJeMIyXD5eSMkWsZEShvngJ5emSG7fcg9YwXl
 b0HX/V2GXUp+cZ6cdnL5epZrIi7hR8xTnqEP1TLwpXBdXsZ6HGc3piOdE3Wgsl5L0vSf
 bps60/YK37ALRh5nbc/9kW06zIj1S/vKv1eMxAKAePRhEYjyb99ZHQdBhP8uG6rrXI3T
 x7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2DQUMMTaz23XsXyQ++1AimIsHVC3+5hkRsDqtniRNM=;
 b=uD15xdi1/K8uKDIRJ3aqOSC+djACT4C7hSgIHZ/uxL55i0L/Chd3hUK5JkUF7oVP9o
 jksQEzxVsgHQpy03ObGpRNrhDhsOnpqmtLcSM9kRJ838P4UnTkFcaa2R8qipQg8JaBj4
 1kW5WHllXaTu0dW9MTUQqoDaHml9lSKGzMCcLRPPsw6kAPcyO9moqNlAqREskC3RvjuN
 kMcW9LlbzpZl8glq/oqcrw21MJ0oIM7+W3h7rn3TcpsfR9muB1Fqrud9575ezvQ83CjF
 erXpxempdLxwvWhpTJhyovr2bnOiG8N9odSwYSTCrMSiVr3x2sSHfMA4T6ixlWGaPzjF
 XTJw==
X-Gm-Message-State: AOAM531wyV5v6VGD6OdbvZSFg1qjaJVucr4vbLINfNoCg4LKlR98jUFG
 VswBafkQ9y5vKEv1u7h4+rlo5dQjMb9Jx738i2JHcg==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr551948edb.44.1611853199481; 
 Thu, 28 Jan 2021 08:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:59:47 +0000
Message-ID: <CAFEAcA_jAWPO09K_O2SceAmcbNDSaNvL3yp3D_=tsY6QeaKMZw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WyBAFv3Ca7ZL

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>   - Live migration / savevm
>   - gdbstub debugging (SP register)
>

I've gone through making code review comments.

Since patch 1 is also required for Big Sur support on x86 Macs,
I'll take that via target-arm.next now (unless anybody would rather
it went in via a different route).

thanks
-- PMM
