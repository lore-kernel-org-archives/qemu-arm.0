Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1285960lfp;
        Thu, 16 Sep 2021 09:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKPcVALK/ytARi5gSnzEtQ4bZyqyHW5AU81H+d38aiegytU3x/nk4riqofiAhXsaZfA/kn
X-Received: by 2002:a05:6102:398:: with SMTP id m24mr4829827vsq.53.1631810042272;
        Thu, 16 Sep 2021 09:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631810042; cv=none;
        d=google.com; s=arc-20160816;
        b=orPxtIpLlkvHJDtQBbls8qQx/O6YDR8qhwQmy23DI4ppP6PuK9OWknUMqUzDcbfKkn
         0MqvIS8lse+Whk+VO+qYErQtrSYlOlPO6wfNwjdUx4M6VH1gYOfRBBJjhmVo4SQ4LzSD
         hOt5HsP6ScDUzQ+P4ZzszyCB0Wb4nOnFktLrhmBex17llOSu9D2A4LrbFQBUzZG9jA0d
         nBw4TKKtxwAWDU6mwn1QGOwdF7k1kJhD3X07dI81VzFDP17C2EtZXiT1KcWgfh8QSlnQ
         d73YcKI6zyqYe3zcEMtre1XTizoGS2wSKrqhxy6tEx01Da3sLYGejOlxWcnjsI1xORzS
         3LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G9e37GKaNlkYtZtDgiKzMfOUnlcd5GqVlCxKHQkZtLY=;
        b=KM405nEP5NRtVwrijrgY2VvOE8IwgcCsZ+hXm1JqW76dIVZE/btclq2iRU6M/yjJmO
         RGdluyPmX+Ny1Go8bW1/6p79Jxi90hrO5FsoH2PB2Tu7ycTi6P113DmbKhhpzyFKjtN5
         0tLqaE7HQ2TIAfwOeUyK1w3qgfHQ81/d7RPZvblBPDym63Sbm4ZkB2XBaZLG8rM5Dp+0
         p0YHU8MxIliYppCDFIHaIEyG2VHYNXobZnmy2cOHqJo4PqbAx8YzGesHBcyQy21mJJYX
         uO4Pvl+nJFKv7WN3Twuy74YOKKs7ivpe8Ev5PqDRCkyCY4kKZj4JBAOnVNEe7T/ZSc+W
         OyZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gb5MRQJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x136si1644382vkc.39.2021.09.16.09.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gb5MRQJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQuKn-0003bo-L1
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQu4r-0003cS-W6
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 12:17:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQu4q-0007VW-B3
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 12:17:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so10387961wrr.9
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9e37GKaNlkYtZtDgiKzMfOUnlcd5GqVlCxKHQkZtLY=;
 b=Gb5MRQJNm63Lul/+v8EPT/it1pyAhlfnC1gYNeXa+7cAsObXzoeTpXMjG2ZLMsWFD3
 u7sNWIsUPCekfsjNct3GD/MusEIXyfXClYLaKk48UntDlBF070K8JfAsMLh1KRL0sOCr
 6TJJFfbI5sKNbf1vZY1EfbI4qvkj457ixX3WdUVcOpW2sIwO2MgF681OW9crhTlyYlKU
 Ll/BErTK+bXXeGOicrxxGhtcwHmqVksRhm9Bt0iMfulqsb8eYI02QGobmZj+EEnLMLuW
 zk7/btJuONrZtTeXMPfbYTuk0NSsrcUPgmzHnnNZP1da8OsLLAhWhY+dwsSHRxd4CU3O
 1z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9e37GKaNlkYtZtDgiKzMfOUnlcd5GqVlCxKHQkZtLY=;
 b=Kgc7sc/MCFTmlKie1NIhHQHlu1W97ZBhSLA5XUSZGCw86sCVf2va8TRyydPue/q9hG
 mxnXRq1OCKfyJUdDl4vzqw5qPjPq42AtCrib9Ycej02DumSB5k0e8+y9yFDmtr5MdMt8
 NtMbHDv77oumR9zpjlAKVVeGAsUwzY3xkPcpX8xkbDRiaTgj4syjI12RnMQ2ZieJDXyc
 RDikdQE4ea1OVUGZ3ZlyWwVjy+QYehrdQZcZ18hedX25pf5siI7ID3+to1bbaqmZuod3
 LjCEsL64i79WSzWuu0D/TEN6Oup4++WLYA1ZkbWuZnJnScA9lxCNAPNmIeVyOxKhPnwT
 CBoA==
X-Gm-Message-State: AOAM532fEoviNfiwKv88FqLPd4J/qG7aFWVm7nMQUkGHerLIHZiHAlrZ
 o5CBlW8Hh8VSEGuS9762GjPuvIxWXl0PS6EnFSk4lg==
X-Received: by 2002:adf:f185:: with SMTP id h5mr7174234wro.302.1631809049350; 
 Thu, 16 Sep 2021 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
In-Reply-To: <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 17:16:38 +0100
Message-ID: <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45t/+0msIl4e

On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> I'd argue that compliance with the architecture means that the
> software should not clear RES1 bits

Architecturally, RES1 means that "software
 * Must not rely on the bit reading as 1.
 * Must use an SBOP policy to write to the bit."
(SBOP=="should be 1 or preserved", ie you can preserve the existing value,
as in "read register, change some bits, write back", or you can write a 1.)

> but I don't think we can blame it
> for not touching bits that were in in invalid state upon entry.

SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
PAN feature. It's just not the value OVMF wants, so OVMF should
be setting it to what it does want. Also, as the first thing to
run after reset (ie firmware) OVMF absolutely is responsible for
dealing with system registers which have UNKNOWN values out of
reset.

Put another way, if you want to argue that this is an "invalid
state" you need to point to the specification that defines
the valid state that OVMF should see when it is handed control.

-- PMM
