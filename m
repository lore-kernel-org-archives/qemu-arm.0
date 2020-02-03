Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3978483lfp;
        Mon, 3 Feb 2020 05:55:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqydodsXkPPsZ38MQdBZMWAfp80eISEB8pt7ftJcp/ykxLCcYTuZmjtB4E3CJYxGsAyWCxln
X-Received: by 2002:ad4:5a52:: with SMTP id ej18mr22099783qvb.172.1580738112848;
        Mon, 03 Feb 2020 05:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580738112; cv=none;
        d=google.com; s=arc-20160816;
        b=sM67TVehX6enUC/VXe2wucdb/5BfiSyzQTi6btsjI5Utk8V6j7wOGhls+P+lIEWZgD
         J4K+4UUdf/VbCDecqQvXY8HZ5pa3zUB9HtWvtAn+cVMQL746SxnCNlkmzDIAMBpvtRcO
         RarMeGCixCUiJKnab9daPKMQ5jP1v5e+5wLH5+fzcxM7Lj+TwEBBZkPvdnps/vViKSYm
         Bp7UCXYcQS998HG0pqIcASG5yM/Vsk5xlEShQyKvO3Ay7A0WfvrTTZhV8GitBE45YdXc
         NAumdulUXzFhmA+TY5jYXuANs4FsUBG54m1ALyXfUBeyFz/cB3WrgZd81kec09B5lma/
         ugJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
        b=in47ImcWgISmG7mx1moT1Jy3qyxWWAkiGg5lx5Njiy2apl4LCOVdmqO3VdUT1KBRbY
         8xNiBpJv5cHPJ54uRlEFHqekUX/F5kgERQIiG96zcRf0VGJ60DMQFJjCaMfArXWdp46R
         wvlJ6jlEBYivx5DRewMPFeH9qlD64y1Dzdcg5vrK7oMiwLna1Wynh9wZhHAQZf6JNqdD
         j+NmTmFRzTO3LAF6lJDwerNfAFI4DsaWmGENGwavU5i4azY0N3GHFAujDg30BAtaL204
         tyjaAGWOBF6y1X4K6Ivj0jkmUH8aJSql2GMsG2iRTXMWmhmJrw0oQx3SyeEAz+0Hj1Xg
         DqEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I6OvhEtT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si11969582qvk.110.2020.02.03.05.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I6OvhEtT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iycC0-0006Zn-9e
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBq-0006YT-KJ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBp-0007zv-Hg
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:02 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iycBp-0007xv-AK
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:01 -0500
Received: by mail-oi1-x243.google.com with SMTP id a142so14781257oii.7
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=I6OvhEtTBXf/k/urycen3rNiNJkDhm7QZYr/60K9fI8oWjqbBmByxTo5bXmY23u34G
 EiexG9EwpjmtpV7l8mARfZGflh3XGxpLKAl3Ll6JTsRYlcyP+x35PecapqE+klps34eO
 7xXr0RPCdRWBCITTcrlhDJZAlQVxyCbTkINaBXde8fNkiZJssezaQgdXHP2pXO4CSKce
 vLxHvE6XVADOPsOgyy1ez2xofvEMrQX8/Fs5Ni++prqLM6r6Bc84yOSTKl22UiRxGvxK
 l+JOM1Vgl4EkWZbiOvTf5pyd6GOfGZBIIp4ZSoY5ezMmXeHtBc2GkLKLtChRB+rsjnsz
 MJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=VVsXwPLpFfqHLtIK+6pt+vvo/Qxc9Zwo1YIq+Cl8vsoA2OO7UV6QNfHlSlqFaAeEw1
 QoT5UwFXjnwSVHtOQWQpoiMjhxnjWGEQ6y6vZIYp54NcXOB5tNWH/PWZfBTKFpkz3DB7
 9iLpiUyJsjurO9eUa9Dlsbp3Dv5Bpthh9yuDvOMGRuvHskqJGGY1CgzosDsP/axtqiJs
 GUFPkBE6f4bSBCi7D/UNjmZkQvhMfDjJUH3zQHRVWxRmaLjqB3Worgm3qGlNnxFNgJJI
 t/nxlCtAd97Bi39DQAmuWhDvnaMeZqxd+WmgGEkP8UR+wLMStpoavW+PIlfQxOD1KlWO
 B73g==
X-Gm-Message-State: APjAAAXoJUAtL6JtdVdOsTujwWkjAt/Rq/c+1oiU3gSQTKuSp/tkgies
 ljoHwVZLYcuGz/OV+3HZSvdjLegtFCebqZ8/SETFeA==
X-Received: by 2002:aca:b2c5:: with SMTP id
 b188mr14899401oif.163.1580738100327; 
 Mon, 03 Feb 2020 05:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20200203134251.12986-1-lyan@suse.com>
In-Reply-To: <20200203134251.12986-1-lyan@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 13:54:49 +0000
Message-ID: <CAFEAcA-CcNwozBBFWenjnBpRPYhxe_sDiKffwO+SZk38xtY4VA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm/monitor: query-cpu-model-expansion crashed
 qemu when using machine type none
To: Liang Yan <lyan@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W+ra2zLzbF3/

On Mon, 3 Feb 2020 at 13:44, Liang Yan <lyan@suse.com> wrote:
>
> Commit e19afd566781 mentioned that target-arm only supports queryable
> cpu models 'max', 'host', and the current type when KVM is in use.
> The logic works well until using machine type none.
>
> For machine type none, cpu_type will be null if cpu option is not
> set by command line, strlen(cpu_type) will terminate process.
> So We add a check above it.
>
> This won't affect i386 and s390x since they do not use current_cpu.
>
> Signed-off-by: Liang Yan <lyan@suse.com>
> ---
>  v4: change code style based on the review from Andrew Jones
>  v3: change git commit message
>  v2: fix code style issue

If a reviewer says "with these changes, reviewed-by:", or
"otherwise, reviewed-by...", then you should add those tags to
your commit message, assuming you've only made the changes
they asked for. That saves them having to look at and reply
to the patchset again.

In this case I'll just add them as I add this patch to
target-arm.next, but if you could handle tags across versions
for future patchset submissions it makes life a little
easier for us.

Applied to target-arm.next, thanks.

thanks
-- PMM
