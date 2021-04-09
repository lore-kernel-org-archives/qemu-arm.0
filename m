Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1475605lfr;
        Fri, 9 Apr 2021 06:12:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq6R6Mf/k6kloMdHDpNjf7KnkLHUPY+6cpOlsgyiQTQzQI3XDaI58v4F8z/s+VuwbVIsTf
X-Received: by 2002:a50:eb92:: with SMTP id y18mr9622205edr.230.1617973937855;
        Fri, 09 Apr 2021 06:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617973937; cv=none;
        d=google.com; s=arc-20160816;
        b=OILUZf85RM+4WqP3VfT/1hHmdeBYlFgk/DSu0Wturt1g7N1zkYROZMhXtSKLOch0fJ
         8qSO0j3dipTDlP2tvIVVf9UmtrsS9KEzb+F102cLA12XQ2dDuJzD0hQRBVk097HC5z32
         OcV/QuF28pRjAM1i21z4BkEvBn9ijwsdGaIUaNSWpzlpdJ8G77YcVwohNBhDhP9t71Fv
         LVhd1TrINSskoJdlCei6nfgtDO6AbgqJbXJi5/iy5o0FLLoUBD5tPDQweiWwgktHo27l
         MeaWL5Bp0cPdRmUsxEpchaUE9hScVIyM47Uw1k9gMRDdf4UC6dmQQ7eA00YXx+1u7fWA
         Rbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vWFIXKcEBxh6L87kP1/H3Yx9SNZerDqwgMEtpKvSZgQ=;
        b=0VJo/qkpGOOGU3RBh9KFWYV5M7wyovEwzeXAATK3/9qhP7lU662yybYgIdvbmE0vev
         l1wJgjudwAZcPSH4DJ2wmOWZoeKvcUlDx02vnHJlEuT1B3JGNKXiw1zedr7Z0UQZXxPy
         xhA4rUeHpEPgIVWqtQhZ8yCSDup7LU4vchaKKNLkG0EhyNCb7KqPPjjATkp2bLjm14iA
         BiBn4pj7nyeeiBIzaX2QqMcof6vU8b/vksQF/TwjDpHUdX8prBPmQkg7O1K+e2fAK09c
         aZWeyQmi56L8xuOghKGD2hc2vR4miBlwkaZrpN1feIign6hoxAL5hOW8xwGTuT0fXFCv
         iCEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gGjz4M3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do13si1772341ejc.87.2021.04.09.06.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 06:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gGjz4M3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUqvo-0001Pb-Mq
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUqvg-0001Nr-8g; Fri, 09 Apr 2021 09:12:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUqve-0003vm-KV; Fri, 09 Apr 2021 09:12:08 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n2so8576605ejy.7;
 Fri, 09 Apr 2021 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vWFIXKcEBxh6L87kP1/H3Yx9SNZerDqwgMEtpKvSZgQ=;
 b=gGjz4M3f962pFQSmv8b31toQf6VAOMnj4NCHAGxbzC3MK7MBn0G7xaktH1vWhHL5KJ
 CDlxT0FhuOW5NfjdFUETwBc35Xw7scfRynVm1h3oy3cpbyyBq/4FKUHoZUUeJtWuHs9C
 mLAlA5TqzB95PS1CBA2ofAENBguni70ITAHqmkzXffM5eg/DR4n1QC/qUGgNLDr4JwrU
 GaQRyX3mrnk4V4kmlV+SkmWdoxNGEe2X9qKnt6Lrqguv73q3/NUO1ckVfvdY1cYCVvd9
 SGWxDE2Lylld3iRz7836B43rleYEaWPMv/TRhPXT8zvGQC65fuEQnt8byWFb2u+if9Ab
 V+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vWFIXKcEBxh6L87kP1/H3Yx9SNZerDqwgMEtpKvSZgQ=;
 b=Gw1eme4d551QJIvdxwghYEb5oCFvxeINBoZ3WY9EetsUTxlZiObAe+yU8mjf9j6PSV
 rY01BZtSSabodBwACvMbxi4HiAeoDsW93+mSte5m9vG9GCV7/WxZAaKgob+BNj4wYiBM
 /fmBh5EIVfItbBLgTfyk7MoBdwhiPNIQn/SH35J/yW2nIAtSj2LT2BJW258mEkzy918S
 2h0WanlThnvBSF9mM8DobzH683GiI7ncz/OCe+3FoF+dVmWa8IUyLWjwACaW2JDfVEkR
 RmKdIgz/fuC4rXkRASym5ojC384gOjtaSG/MhHhtHlNuGVcWLbEzCq20U78ubduEFcJL
 78BQ==
X-Gm-Message-State: AOAM533Ej7vlAC6F8hHKGMW58EaTTNL08tBTaVqGzGgJcOKptehwdUJv
 nDJPbK2nVzsakGtMANNqm6A=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr15943939eje.377.1617973924871; 
 Fri, 09 Apr 2021 06:12:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e5sm1407073edr.64.2021.04.09.06.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 06:12:03 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: qemu-devel@nongnu.org
References: <20210409062401.2350436-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <774acc32-2d5a-298e-f47b-df763f86ad2d@amsat.org>
Date: Fri, 9 Apr 2021 15:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TrBkqQFKvtum

On 4/9/21 8:23 AM, Philippe Mathieu-Daudé wrote:
> Hi Damian, Luc, Peter.
> 
> I've been debugging some odd issue with the clocks:
> a clock created in the machine (IOW, not a qdev clock) isn't
> always resetted, thus propagating its value.
> "not always" is the odd part. In the MPS2 board, the machine
> clock is propagated. Apparently because the peripherals are
> created directly in the machine_init() handler. When moving
> them out in a SoC QOM container, the clock isn't... I'm still
> having hard time to understand what is going on.
> 
> Alternatively I tried to strengthen the clock API by reducing
> the clock creation in 2 cases: machine/device. This way clocks
> aren't left dangling around alone. The qdev clocks are properly
> resetted, and for the machine clocks I register a generic reset
> handler. This way is safer, but I don't think we want to keep
> adding generic reset handlers, instead we'd like to remove them.
> 
> I'll keep debugging to understand. Meanwhile posting this series
> as RFC to get feedback on the approach and start discussing on
> this issue.

I wonder if this could be the culprit:

  commit 96250eab904261b31d9d1ac3abbdb36737635ffa
  Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
  Date:   Fri Aug 28 10:02:44 2020 +0100

      hw/clock: Only propagate clock changes if the clock is changed

      Avoid propagating the clock change when the clock does not change.

  diff --git a/include/hw/clock.h b/include/hw/clock.h
  index d85af45c967..9ecd78b2c30 100644
  --- a/include/hw/clock.h
  +++ b/include/hw/clock.h
  @@ -165,8 +165,9 @@ void clock_propagate(Clock *clk);
    */
   static inline void clock_update(Clock *clk, uint64_t value)
   {
  -    clock_set(clk, value);
  -    clock_propagate(clk);
  +    if (clock_set(clk, value)) {
  +        clock_propagate(clk);
  +    }
   }

I.e.:

- first use clock_set() to set the new period
- then call clock_update() with the same "new period"

-> the clock parent already has the new period, so the
   children are not updated.
