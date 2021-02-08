Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1390060lfc;
        Mon, 8 Feb 2021 10:23:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8+rBToHVnX5MgfJJxPzECDrYAzLY4PetbaVviUc3E9yUd0+MihbRNOGrcq1knREUsljDo
X-Received: by 2002:a25:b94a:: with SMTP id s10mr26829139ybm.374.1612808586255;
        Mon, 08 Feb 2021 10:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612808586; cv=none;
        d=google.com; s=arc-20160816;
        b=gdavKJixmENx/bHOGx5riN6wjhMH3N5yBMm2lgSKT3UMyvvPlQ4r8f8P4rsUROwIup
         Mxwowr30oTzjlywnAuT/yOXZcHmOIKDjZVkyAIG3YkPnS1vhIUWyNSAvWDryObxJxppN
         +FSMfdwFu/gTksShyXLRy5PY/DhVar5wQljBx2OMMqvUc/+rmJvNfdqPXg+5fvMtK3oc
         0Ke4uaGJwFdSmEPk3xTmrU8uRbDgri7EX79vLKMSKjWxnRwKhLnneXXXieSMHiq2WMit
         FPZF772MxbW5vWNLJB0NCsVabym97J1+G7RChvkA50bT0cHdVUkHu/76sBNrEQFN631s
         tSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYOWA8dQvqkeRrTYpwF33uSv/dUMb31Yav+spbXIWpc=;
        b=ev39k+ciwKsea0TIEoMPn39XQYPUvwD99GTpEUmHVlCsZjKP22zwlitkuuF6NIqmqM
         iXCaFHUYuK+a1EOcZhX/p9iLAJpGL8HEU3nprbWbedF1SxP1qepLhvsQc4ZxB7ZilKpn
         I9gRp7gHt5wNU4d6DymIZ2jIgxKIt0do+7PrrWfB6stWs5lzsZlZejDSgNsY8PWDRKT+
         e2NDQtk3DYulwApSyuiOWqUBzIT6YDMDypEtEi/9eTEy9VedETujrSz9zNKjpG1hW4NC
         p3EamXn4Q5SYA4WeRkpVXrW0ceMYqZGHpPo9xLE9FsLJcrTCdBeQn+yHUweD0COqDvDg
         sgng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rdSPQvQI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si19252942yba.421.2021.02.08.10.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 10:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rdSPQvQI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9BBh-00013C-Js
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 13:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96zI-0004zR-6e
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:54:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96yw-0000UU-2Q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:53:53 -0500
Received: by mail-ed1-x534.google.com with SMTP id s26so12384077edt.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYOWA8dQvqkeRrTYpwF33uSv/dUMb31Yav+spbXIWpc=;
 b=rdSPQvQI6WNspc4y+hQx/g7QDc2SRyhGfFfjnhRAh0oPxe15SzopFEpP+8PtmuD9nX
 Fz3GlM3DkGIqKPaCDv6uFfrfp/ThVteD9oB+xy/d5gLqPYYlFOu7X5agNhCM7F/VDWgm
 a0Oqjy+mglXqIF+n70mI0BU/8JOrfVywBxLzcPVZsQh8uTkrN8qZsctA5CZfDdled0zc
 qXeIr4YJqJKg2sp5NWg0YMnoH+CKBzPvcDU3dISegeOsqu/kg+YvTtNX6Brald5m79lT
 41Bq/PK5sm00TpCoOzJQEq8nyOSKLOXC6qNC+lmsFAbergSVLFjK5bCdzUzbVS5gqxfy
 IVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYOWA8dQvqkeRrTYpwF33uSv/dUMb31Yav+spbXIWpc=;
 b=msPKMhxTpvEV2YQVFl7POZR6XsR5CWmXHoKDBM1JfIad3hFmOtCf+F1HLcg1Ons4By
 GIdN0rABAP++jijkDYs2Ij1Z9fllKR+CBJq0Exz5k9vlrMQI0qAHyKthrKQqelCDFIeh
 qMJ/VpE05EnDN/GftuFDXX/9uBpG1cBqG3blBKsgDC/ArZ4pTlRvSUKeCL+seLXO8nUF
 hAg3nDqTlUAwifc00AkTP7r6+asGbuxBPC3v/tDk07q2T9DUpyvw1senL5Lzd9JivPHV
 yzBNnxuDI16YQ4cl0wJL+PFMBNsKOFFMkJ5ZCFv3vm3IfY6G1/pQ9TVBmcRhTIezT1YZ
 QfDQ==
X-Gm-Message-State: AOAM5328o5XjNgNBCiI0CkWHsY4EraEmx7CvQCemzUSXXTtwc5cBPRHG
 Rjdeu38i5AcoutZGToBz2JUBhc7MMsfEzxAgLgDnCA==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr16918912edn.251.1612792412331; 
 Mon, 08 Feb 2021 05:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-19-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:53:21 +0000
Message-ID: <CAFEAcA_kG91qoz4GNo38+Fsn6SseJh12cyOfAFh50mZkY=ezzg@mail.gmail.com>
Subject: Re: [PATCH v5 18/31] linux-user: Fix types in uaccess.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9xtaKPKfAnnW

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
> to involve abi_long.  Use size_t for lengths.  Use bool for the
> lock_user copy argument.  Use ssize_t for target_strlen, because
> we can't overflow the host memory space.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
