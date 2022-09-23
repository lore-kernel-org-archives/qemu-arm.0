Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp242505ejy;
        Fri, 23 Sep 2022 03:52:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NynmWNUKAmkv9rgesNbgQxVSTS/nGu4zKRMRXP22aKXubI3qwe4JTs+FIAQQjutP1DbpC
X-Received: by 2002:a05:622a:18a3:b0:35b:af14:401e with SMTP id v35-20020a05622a18a300b0035baf14401emr6404089qtc.200.1663930331057;
        Fri, 23 Sep 2022 03:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663930331; cv=none;
        d=google.com; s=arc-20160816;
        b=Ih+ZP36FmRfXpmEO23jjkt+Mvp/lAFnqG5CD7fP88dWl/LvCnSNBx0fcit6AX1CDRZ
         iGO2f8c68Zvv3w6DNHeDowIkbmKatIxWZmY9zAo/FtOecmstzC579acD5aYJ0rtl5qnK
         VKnCCU/Pzb+4BWIUJCWY113NKkbrcFu1feccujO4mmjJObXJWhJlbESZijJMjqJEKpjQ
         jVUvp6eoUoTAH6HvsEv7GblqPvKkS3dL+y+I9obTlrGRCDf+bspl3SmH0wM6JHCtsf+3
         bkOL7ylQ/+J25BJHL+nGx8lBznu7Ke9ErvV491mR8bppvOIb4n8GUE8N13+Xv5unzFgY
         spqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HrA/A36uykpV2o1YIBcGz6WK9raOspNo1tFKHfsshuE=;
        b=Ou67Ymgw1r9cJyW0L9t4+1mNTrW+qSgMFI01Bq8i5b0RbSrThN3E0uMTjo6W8AINY7
         YHmXhDhKXk9mP7Iir/dTmMPzdrLzcwqBCO5M7UH+h+XhQRblilx0gU0QKDlqutKKyx4n
         W59/87Hpo2rq6Sk16LPRqpGN0FkFXMr4eHb8v6pYBTTzZI+7r96Jo1ppwXZgbh2TLrhk
         wp+tW7Z6Y3Dfq7Q60C3OOptR5dITL5QHxP62ZG3TzdSl4odCTlxITQo9mpv8b2Z1Nok8
         5oWDtuCgpEw+O1ESyIgP0uReQcW5KeZHIQctqspcR8BTt47JxZaRRw14aLgrLYzME22I
         JK6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FgkueYY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05622a170200b0035baea88700si5027180qtk.395.2022.09.23.03.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Sep 2022 03:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FgkueYY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obgHw-0006Y4-QB
	for alex.bennee@linaro.org; Fri, 23 Sep 2022 06:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obgGA-0006W7-CB
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 06:50:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obgG8-00050i-N2
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 06:50:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dv25so26966874ejb.12
 for <qemu-arm@nongnu.org>; Fri, 23 Sep 2022 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HrA/A36uykpV2o1YIBcGz6WK9raOspNo1tFKHfsshuE=;
 b=FgkueYY+5iYygbIkgdcwIbMDW/V5lD/NNMa+UKyac55Msqm/Td2f4kiUIZ0JGIto/P
 ip4mvI6B6+rVXGbG8OYfYDg2qUmbuoY4o3t2QE0tBtVkvCmqQ+PF5F/YO0vmPwwfUhSG
 nKClMhh19fFekDjAYV5bkIHY22oHkh5mhMhlDd6qlzx8c8glx66CmIgZqpzNfmkBVSOI
 cUiKCC5PKDfvlznq/2ROyb/G5YGpXCAK901KN5y4ILnb9ZqeIL/2RvMQTJhqCkTVp5cr
 4wd2we9ZPxFq7gdENwnCPZc8juU00hZMQCnTPB3W2OTeuUuTDBMMhdxQvlRrm7t0o4e5
 DTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HrA/A36uykpV2o1YIBcGz6WK9raOspNo1tFKHfsshuE=;
 b=tT6i5+osyzLeUrHTAyNANwXhVSnzZug8iL1VJ/wsdUULOPRN9OdZfvnENtLGFSuftr
 VunoDRH/rNaK2CVwY2KHqwINmtbOQLNK5JXOYxov5D9GBQJ8wsqtoU3ag8C9jO02nuYn
 kIvl21mMu1e3c3ihxzLh+uLQw8lJJ0F8TCFpXxrn01+Pl2gjYSLz1eP/MvzaF71dJ6GD
 K597KjlPo5AnYecYzx5hGDtw40YFm93sHKVWEZConXas5cCzOqE599iTA7K7U6ituEuh
 Wg9K3qK/KhMwoV59EPlvZdgDFaadyM7pwGpo9R+yN6GH52gUoEUakrC8XyewRQHxQXq8
 94ow==
X-Gm-Message-State: ACrzQf1j29WbcShw7Z5kFCT4632QrWXmDOT21FdPSJEYr4n8yysejsV6
 3mqZfTSEmq3ncc8xZembCaVX9vIgCpi9or36H4TQFQ==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr6347391ejc.365.1663930213494; Fri, 23
 Sep 2022 03:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-13-richard.henderson@linaro.org>
 <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
In-Reply-To: <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Sep 2022 11:50:02 +0100
Message-ID: <CAFEAcA86kLJXstqA6_KeWmLkTaAcp32iEPTSqfbFkD9C3RAKyQ@mail.gmail.com>
Subject: Re: [PULL 11/20] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gR1ZU0d0LnKS

On Tue, 20 Sept 2022 at 17:45, Thomas Huth <thuth@redhat.com> wrote:
> this seems to break some Avocado based test(s) in our CI:
>
>   make check-venv
>   ./tests/venv/bin/avocado run tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
>
> ... fails with commit 01765386a88868ae993bcb but still passes
> with the preceeding commit. Could you please have a look?

Thanks for the report. I can reproduce it, it seems to happen
with all kinds of icount, not specifically with record-replay.
We hit the "Bad icount read" exit in icount_get_raw_locked().
I'll investigate further.

(Rather unhelpfully, the avocado framework has ignored the fact
that the QEMU process exited with an non-zero status, has
failed to log the "Bad icount read" message in the log, and
has only failed the test for hitting the 120s timeout :-( )

thanks
-- PMM
