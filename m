Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2834697lff;
        Tue, 15 Jun 2021 04:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwduli08tqRV21eZluGxSsT6JFOcqmyAoMNras4Frk4WubXqqIvgrl3692wXFEEHy4cFflh
X-Received: by 2002:a05:600c:499a:: with SMTP id h26mr22549426wmp.32.1623755004438;
        Tue, 15 Jun 2021 04:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623755004; cv=none;
        d=google.com; s=arc-20160816;
        b=eE29XOTvPHVbOtmp0Sin4VOUZaAAQywVW1z7S0+2Ij+1qsGGPyTdgnjyEdTzsQPGo2
         NcXzOMfuwWZlJgxFHmr4R6VdOSj+t0jJ8dbHnqrp0vBGghBdDDDYdizHP7g+owsVFCDj
         Em0qSoil+eF/26JBEPUvjX4lk7wOJosuPAkB+x7c0kOXWLNM9sv6l+dt+YA4RLsa53CB
         ifRsqmaWYuuttKF49bXQG075QIMC//7N3PORv5yjCfzehyE6UweqNp0qMzO6+WWCKmE2
         gw0/SCPBPysIPT9zkJdrzp7OKO7/KK+CJ0f/QziPdFkJMHPobakxLQ2zceJVl9LL/o/n
         f9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=djBlKwioWVzQDGT311lG8sXwZQ13ZtcbvYrvrLZ/zZw=;
        b=ELCSwDlJKCdZ6q8bTI1RdfpBPSNw7+EyiQ+OkxOZFzFl/NDnkDXcz6iUC2ywNlNo8o
         W7Urkz+XwC54xBJwkbOaBykdyVLlWmxy3h6GJsTb77I6nwRJbJpHgLa+Yy6fBeX0DNCo
         CUHGF8+zRk/tuxJktxIkz8U6L6PBnvv8n6u0UZnPmYe/0Y0WgeoGDllaMGMvebkko0rC
         oe0WliEvX/WJNSMIGXPNRJf4zzWg+Se3gdUWTWZQkNQh6AIRNTnTnr5rQc7xftTtN8eI
         zLQyE8m4w8H+FBdGBUhq1p3b++0Adzsc2qFeQ9GgMnOTxpoIhny8z4RTbf2726QYJzPn
         wTwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJaxDjO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si19346901wrs.268.2021.06.15.04.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 04:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJaxDjO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt6qp-0006gN-H2
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 07:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6qX-0006g6-NQ
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 07:03:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6qQ-0003vL-RJ
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 07:03:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so50550646edc.7
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djBlKwioWVzQDGT311lG8sXwZQ13ZtcbvYrvrLZ/zZw=;
 b=LJaxDjO3oZ9dYwLSTgq5n/f9jWcM8msQ77DKmO7p43EudZpLD90ontAeB+AvFF7NUG
 xJu9Y/ALL/0aeNQ2CSEmIZUnRwK/uisN7LgaOhKlIPXhwYaG1k1Ol6TtqWsAyhqfdo2k
 lga11aei8FGJe9vrq7ZDy8z23Zj52ZeHvJrGjoecEYhmd4EE1yQ+cCKGv5WmIzXlJt01
 jzUt/DNjmfjbO/1gGYQ3N5d33Qo2P/j4pRHQFqfKdqctshhvi626+SU8hzf2ltpPhfB8
 vSv4xCcK6+UtJAHh95/c8MTCktXsgvoiC19c6tinjpA/BDNNSniOvvXJUyHl5J5GT4sn
 TPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djBlKwioWVzQDGT311lG8sXwZQ13ZtcbvYrvrLZ/zZw=;
 b=kBXnuLEa7pFEjHPqptmHE0eVaSJ+Bh6DSx0rAUMMJyP4SSjXsb2OIS1wrlOUl+UmSp
 vqW9cNPRw2ka8MOTfNnWRsqcI4KMQTDYvlG1lHlgOEkV7U1EMCYD2/bpI06EE+996aHA
 PxlU+DKc6ecLe4BL4mEPEjvvhE9AUFCFd5v1EpK94q/7+LZ7s5S5ioLdQFYr0W8Qm9vz
 y+h17pyKvvk/P29p3XMw1G9e5GvI/QZoRK8fiDtmM5K5MQWJi8XyMxmj8Y9b44ucCdx8
 1tYCm5urkc4BFzgoMLU0aaR0eNaQBST1tKgy3E0NBVJefgtKOAhfpmsj02jYDvFFoQ7z
 K+wg==
X-Gm-Message-State: AOAM530a+IodNH3zitDCom0W/l1foVFe214zTUuKvmC+hF7kWfQjAnK6
 ZPnjW8f7EygxL8+M7bNIlOp71MMwcN14tW71Stu+Yg==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr22210125edt.100.1623754977331; 
 Tue, 15 Jun 2021 04:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-19-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-19-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 12:02:22 +0100
Message-ID: <CAFEAcA825LDibg_4rnBQ8TmE8fZNauDkKzKBMGbnfY+j7bSjWg@mail.gmail.com>
Subject: Re: [PATCH v8 18/19] arm: Enable Windows 10 trusted SMCCC boot call
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXaOaha7axoX

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>
> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
> including this one. However, Windows breaks on boot when we do this. Instead,
> let's return an error code.
>
> With this and -M virt,virtualization=on I can successfully boot the current
> Windows 10 Insider Preview in TCG.


Same comments apply here and for patch 19.

Either we can:
 * find a spec for whatever this SMC ABI is and implement it
   consistently across TCG, KVM and HVF
 * find whether we're misimplementing whatever the SMCCC spec says
   should happen for unknown SMC calls, and fix that bug

But we're not adding random hacky workarounds for specific guest OSes.

-- PMM
