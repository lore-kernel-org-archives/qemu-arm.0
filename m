Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp446535lfm;
        Fri, 26 Jun 2020 06:28:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpmuZY5DdHLWv46zBuGB6CNj71iL9s/5qv18JfeyCiCa0fGBtdFd6+UVIrYpvDtg6j62u4
X-Received: by 2002:a25:bd47:: with SMTP id p7mr5057735ybm.39.1593178129610;
        Fri, 26 Jun 2020 06:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593178129; cv=none;
        d=google.com; s=arc-20160816;
        b=0mRM488R8x+PtXw+dQLl2MQv1IIk8nXNYCkXEZR4BZUolV/Dn3+g59Whr9wXFCW6N4
         5c0x8UwCcWQUHtj64t1Kzgmeiv2SA871QfFJYwgEZ0uh5B37ZuK9M5217/V3J2UeG6HE
         xY4XoP8kizQTll7WeMSzrZY8g1q3XGf9KVxVpbzU7th7uWlvhD9HJ43AT0TMsb+o/FUq
         1Ryc7B/oJ/CCqHrxT8L/TlTGaSfj1tXolCCkB3g5xhpsOGtYFiut+B2Xe26dUFqyb809
         vVS4JRZmlmIqgtz+pP1i9z/y7WnHOypjFOztYjmFXlwe5GmIrfH7HMz20ebFsdkp/gjJ
         IDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2QHeSHD9C3n4Syy5xXTjoAoH2PcRolR/kv/jb7C4q8=;
        b=XiXTO3L/fIFpTa1AvreLo2I6zO8n2mueIah+/Aw2s1C4us4KqadAsKT5ZEpR6JcdgS
         orxlwZ/MvQJozzRNo79jdWNRL5q0mTsFimpXZWGWpkpHZGZl/ddHz02a2oGPv6y60E0b
         vD+2gAJvMqX2b2mxAz0Sj6y97/iM/5pTcpc51XvvkLGbGdpjouuHieYRJD3/kFVVTC+4
         WtZIPh8opBvr3FKh62KOBDon+07Acq+SFYbM07uoOXTJCv2Ac/WBxxuLg5cW79eCNGQ2
         jL0yVZ7Ss5/c9eKCCweS/zQHXJzvTM4VHoHUzAsbeD+DUraIZaWDeXU0KQMX1WjaE9K9
         sZ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T6jJtroT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g204si24525609ybg.404.2020.06.26.06.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T6jJtroT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jooPR-0002bV-0q
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 09:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooPH-0002bG-CU
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:28:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooPF-0005NO-Mx
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 09:28:39 -0400
Received: by mail-ot1-x341.google.com with SMTP id t6so8571404otk.9
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2QHeSHD9C3n4Syy5xXTjoAoH2PcRolR/kv/jb7C4q8=;
 b=T6jJtroThTGfyQoRuN/FV73LPe3SVv7GUJ5B18yy1KaFKswDOiChXWliVXUDdlhR2N
 OBJcusyPML2j9g5xB2ge8szbaI7i3FCr0+TzxuStPNW1S2xy+gWDcyqTotyX8IwczRvj
 3r6Cg52h/bcayxtgznmHTqt+77ppriwerlVXp1q1XtrkmgoVx58f6wcQWqFGL9LFyCjz
 iTNwXPz1EffPtp71kJQBLq4f9/oQM2Yt5APljK7hacn8a51YYPJnzjwEVh78x2PEek02
 h4uLA1gOP5h7rl46BGL5aylYm6v3/rlXRLSXn2lu2UQ2Oc6rrE/VqblS6QhmGexGIpMm
 ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2QHeSHD9C3n4Syy5xXTjoAoH2PcRolR/kv/jb7C4q8=;
 b=MxBcTf1Wd5i0b4RN4HYAikNrUdxag/F0kVO28/I2VS4khkz2OE7SMqvkUfdI8PTZUV
 S0igdcnQ7DoD/AEKGHz1PqWlxwTrL05aChAHwJqcnZ4FP7+/RJCttmTMlaJrbjI5MWv8
 1uv0elVdvRoSOI8Mff08hZNOqkZ6bXv38seXmMoth/EyOe9VERWI48k4EpJ3+Lbp3M85
 Tq3ZL+2Ast9G//+Rh5IyMGd5ywW++5hdl2reXlM6Y4MmolCkOb2c706cbiDIoXzTcD1t
 CFNoGmt68lJIy/LeiV5m3yXlQl+JqQbFTaaJ5Y5s2bzqi/sYCHQ+xkrrSbRED1Gq/Iz7
 T+tw==
X-Gm-Message-State: AOAM533JpGZA4dXw0Jyvb0shJzbn1XWzrSlT2fRkl9fwLaHGD6UtrQH7
 RP3ay81Rz2I1Q/d3OxSCcgjTaojaEiiU9ep8viZZNw==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr2251363otn.221.1593178116317; 
 Fri, 26 Jun 2020 06:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200626033144.790098-1-richard.henderson@linaro.org>
 <20200626033144.790098-47-richard.henderson@linaro.org>
In-Reply-To: <20200626033144.790098-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 14:28:25 +0100
Message-ID: <CAFEAcA92JB5oV02qjdq-T4B3czfXAQw6HORX2V+jUFn4AMFbsw@mail.gmail.com>
Subject: Re: [PATCH v9 46/46] target/arm: Add arm,armv8.5-memtag to dtb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ef/iODE8xPL9

On Fri, 26 Jun 2020 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The mte-v4 linux arm kernel development branch requires these tags.
> It is still an open question as to whether they will be required
> for the final commit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v9: Split from patch creating the tag memory; sort to the end
>     since it's not yet certain that it's a requirement.

Not going to bother reviewing this one for now since I'm pretty
sure it's moot :-)

thanks
-- PMM
