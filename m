Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3549195lfb;
        Mon, 13 Sep 2021 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF/+/4GEB+HLMtgOp0aMpTTik5CT+SBIxbOk+xmxkCkF6PBzTyBO92xQqD4zosNKu9PIMN
X-Received: by 2002:a25:49c3:: with SMTP id w186mr14028035yba.383.1631530412957;
        Mon, 13 Sep 2021 03:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631530412; cv=none;
        d=google.com; s=arc-20160816;
        b=iErx5dfpfQhLaruFmYmJibDhLY0fnUfr/HkJo4hC505zXxgSi5VGLMH8rK7lL+2A/p
         cDpVkEZR+4DYA/nYf16ve6r8odViZTRK9usyo+Kk++iOdiXFDXkxMmBNVUpYfzVlPqOl
         FjZATRCMTAA99lVCUza2rBD60acrhAuOVX8/gpuztsoFt+sVgTwNmtgEW0xtWVWnt9Gm
         0A6k1zLH2hAkFjvL9jUC/1GZt2XZP6YhGLtxtCp1Uxj7xLcFc76/q880aknurscos3kI
         6IriTvxnbdiXrn68hQldVf2gvWFfcZ30aJlXnAKtcx9PPf1We5xUGebtMjA73MKk7J4R
         XeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23CQT8JHOlj1uTBsgIsUVOu8S+bFha+sGbNUIz59m4c=;
        b=Qf0W4tBADgZqXbz3GP8aaRJ57CpYNSPPKoHaeF/KUI+wFaIbif1E7uRtnFJGWH0Aap
         Hxu89HOiOKe2J3JPZHTH+UZZWh9jk6WmRiDjr+I2hC8wxeSSGNNjjlVON25uPBh8aYW8
         Cbdu3QOktWq7CvYphxC3WXH5NBhgYlBHb7LdWfZJ5JPYQ3CWtrUgC9jRYsLhwTwEZdSO
         5Li66VOgXn2evIsY0BADsBrulLTlxClpvpl9FuxGh9ymk4iVBSH9d5iAkYfmB6+dtZkS
         WeurbZKU3Jq3XaeoDzFOtVpjhDuGKwWt8utimV0MvSqXkXS4pfig5jZnSmksR7inADyX
         HxeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CXV4x9cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si7242884ybk.342.2021.09.13.03.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CXV4x9cm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPjae-0001CC-AG
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjaS-0001Af-Mw
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 06:53:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjaQ-0000XM-CQ
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 06:53:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id q26so13953339wrc.7
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23CQT8JHOlj1uTBsgIsUVOu8S+bFha+sGbNUIz59m4c=;
 b=CXV4x9cmXFUJnxnzWTPd1r1YiQ5NLHH0YD3C2tYjthDp9Ure2a1sQHinHBpVMIPAcB
 mkh+gInDJgwHbJFWl8ZYY5NRR5VfWPNxQe8Rd8hkERTAI3BBf+gco0Zo3ckZLYUBD0+9
 bw2QkfS2B4aAKc+rWnZ+Rm8myL8DVxDswz61jqCR0ekpInPL8g8Am8PHZMnk3YlDpz+Z
 m7L5n9qgf7QbVpwH2j7irRhwh4KSqqERr1fRoviA3qPTdybsaCRAHVaWapqZMZQ3O9wb
 HeKFHILIE2KmYbzgllsZtQH5w+AGM+sgC8QS+kgjvqDDHceVT+06sQ9xKkfjPjg1D8qc
 azag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23CQT8JHOlj1uTBsgIsUVOu8S+bFha+sGbNUIz59m4c=;
 b=O+ghsUkI1RZjedjIYQZC2E8CZye0Hec4WK40Qn40qmlUrVACvazLtjKQ62X8MfhDNp
 fLFj/xc7e3F1CFgl8xrurGD5Gfk8zjixemPIlZNoObCDXgLkZeFOO0zMbSEdcMw6F053
 BdwE4uL42a0/pjJthSPlrAxWRUXnt2Zigq8ja8ouBj9ztRE7gDbIP6szUg0zJeGmpw1W
 4p4HwqK71NPBXI3qasXFzQiTPsO6ZGwW5b6l5vi+Cjc/UhhK1OHvQRnAVwmidBaizEIm
 wCmHtKFDKJbYbDY81vUZEH7bPzqMLbVUtim4dm4sQYMB1ixQhYja7oRyCKFNYAX8IR1N
 mXog==
X-Gm-Message-State: AOAM531KP+lYbygxh+R5Jf2d0aFNJUgP2sdtCS43+kCaF/5IuNCXf886
 I9f1GM40Dfdf0QoCWzo8MHkOw46GXXn7a1aVho3Lig==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7730796wrr.275.1631530396691; 
 Mon, 13 Sep 2021 03:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
 <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
In-Reply-To: <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 11:52:26 +0100
Message-ID: <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FrOgZqywxYDo

On Mon, 13 Sept 2021 at 11:46, Alexander Graf <agraf@csgraf.de> wrote:
> Why? You only get to this code path if you already selected -accel hvf.
> If even a simple "create scratch vcpu" syscall failed then, pretty
> failure when you define -cpu host is the last thing you care about. Any
> CPU creation would fail.

General design principle -- low level functions should report
errors upwards, not barf and exit.

-- PMM
