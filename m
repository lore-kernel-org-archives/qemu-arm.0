Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6356905lfp;
        Tue, 18 Feb 2020 09:33:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwo0ZAZ1bGy4aPD4hfIOe5X+m+Iwp4kXr8WdSdB4nphOp10dmXTHfHpSKmHEsHFEejOnfH/
X-Received: by 2002:a05:620a:10a6:: with SMTP id h6mr15126594qkk.492.1582047193034;
        Tue, 18 Feb 2020 09:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582047193; cv=none;
        d=google.com; s=arc-20160816;
        b=rgDHjL9lIUygIhUJrJ9vytUIJbxDET9Mr0hdyDZHoxOrRl+ACnqKwMK6I6qOOcEhOd
         nctnRagt4dvAxQLrunfyUdRJTyc2kE18Bwkgp5OA7xg42+Ci9lfVU/0Dq6Ka6zJdn7Is
         W1skJ7UdY24AUujOo6kLAFt/xCna6jxKRLxRmHO0MZbIdxfAaZcIU/rJs0HYmzSaSklx
         Wiap84Vcf8I66/bGeAoJr40OmowZmW2xtiWV9B3kU0+RsKpVULwWyVeQuFCOv+HzzdXk
         TvkpWMYJxNscDj/YIH51EU5RUbiIyXJ9XYsorp0egUInzL61kl3cDmyoo00R6Fw144/8
         nUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edIzC9gi9Dry5wuMYlBjdc9Ho8a1eVgA2bjxlKMlcIc=;
        b=Gh0Jw+bPYNpPRdWR/bzSK2wx3MXDD7ekSs8Uwe1ybk+VLhpa7BYvWvVtDIhlCvY8k7
         Q63gP7frmZwSBv+qHZOwZ3IUZWPQcuyvJjA1yOM1naMlTqotXpSUIDqh2kaBsUT2WDV3
         0VKNpzrFSpdi6qb6sIoV9xPDR5DqbJRguxJNhV5rrlKM0ZU1On2AY2a1mwS570gbjtat
         4bT6cQnlqqNU3O1VruDV+ZR4EscMMEBvhCPoZx9LSzrQVHe5xx2wUZongOBniVL5BhzQ
         PURV64PZsvpA7RlnXnbyx5SAaMRVdQ0Mej+wsGmBsI2JBPgYZxrOh9/ZyfTnEay0t1Sj
         Agbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ej0KOjyS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si2055687qtb.234.2020.02.18.09.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 09:33:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ej0KOjyS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j46kC-0002Mj-EY
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 12:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j46hi-0007jp-QU
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j46hh-00006P-SI
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:30:38 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j46hh-00005J-MT
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 12:30:37 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so20261879otc.8
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 09:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edIzC9gi9Dry5wuMYlBjdc9Ho8a1eVgA2bjxlKMlcIc=;
 b=ej0KOjySnTQOaLH6PUgr8Y1CHbSG7l3sMw7viwagoZ/ywDD+SGQ3D8qAR6akccW2CL
 QXt3TEKAIC53MVQJnh1pfWPrGCn+Z40kSORJUMtxY1lEr30X19NRdFOWQWLBeWLl7EU+
 vmBYrLElAg7gQ9vg4ust925WIPnTg7n8HSA5lQpzGoA2wuz0sacaRz5mrNi5ekkvJ2AV
 8kZuwQrqRO6IkqJF7MnKol0pzM0okUanq3aFS5BjkDERHiFUYI2TiiTzoWbEgdq4O2vF
 BiMU+aCajKuHMVGxegyso0BbT6Qt+CEfPMZqT31vW0QjXvhJAEDWmeUOFmo0/ydknapX
 u25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edIzC9gi9Dry5wuMYlBjdc9Ho8a1eVgA2bjxlKMlcIc=;
 b=uOtJ6tQGkWUKMKIuTbj7rTEBVyGMyNl5Es9gJTYp5E0UH2X4BM9kZFkiVkOvt4aOpK
 AzOhfiYtZC+HMZ+dGjoqGBBix42TbG436DytJqMRVlGBbckviIgQGT9yPfoL/53k/bh2
 JmGyJ2dQCe67f3TxYAsfp9FbkXDDb+oXpVXVvq9KLOxeRTzDZO+NQil7gfUddasOewGM
 MMjNoeiNoW2Y4xc/MSjwrJ8wSMHwermZWivQzFmd5clWnBlx0LHCFFzHcF5R0+KNLcM4
 fTNEfM1ljzf6ULhdEe2orMl6LOVTw1pVpC2STk5h3UKmJDEWeP4HZlKHFdjc4ke99dn/
 EXPw==
X-Gm-Message-State: APjAAAVPqxJcsqZt/ZTqaRUL74Ehuf/RD+Z7+IWdX/xYXIbHjSKifxuV
 0XP6yHJ1ViLbCwH8PubDGiIvUkREs5hSu4WIU4YWVw==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr15823107otq.221.1582047036824; 
 Tue, 18 Feb 2020 09:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20200216194343.21331-1-richard.henderson@linaro.org>
In-Reply-To: <20200216194343.21331-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 17:30:25 +0000
Message-ID: <CAFEAcA8AgYoLj7+K4GLhkReHFMzyJBM6qP1uLw=X-v1oN6hT8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] target/arm: Reduce aa64_va_parameter overhead
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: uIdQhb8rghvF

On Sun, 16 Feb 2020 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Something I noticed while developing and testing VHE.
>
> For v2, fix select as a separate patch.
> For v3, adjust pauth to use bit 55 explicitly, and remove a
> now duplicate test within get_phys_addr_lpae.
>



Applied to target-arm.next, thanks.

-- PMM
