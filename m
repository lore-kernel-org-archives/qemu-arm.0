Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1480389lfy;
        Sat, 25 Jul 2020 12:31:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9eu0tEj3BzGB1hoexLp8AtcL+NyV0F0dkiYewk7PiLzTD/uPhGWXRMno+os55hFGQ/lYm
X-Received: by 2002:a25:2ad3:: with SMTP id q202mr1010096ybq.27.1595705475660;
        Sat, 25 Jul 2020 12:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595705475; cv=none;
        d=google.com; s=arc-20160816;
        b=Cu7ZTebd7T7hreqa5iNNfI/zBE9CKSkP6cHn5VKEbU9TJ2bD2Jda6JLfrctZs3jBHc
         dO6GHsRQdP/nQX53UlbXTQNJG2OtuT1bI7rmJPvnc49RC+v61+VQnoQAOdNxTHt+B6wx
         C7TYRA/ESDoGByxJ4ngh/0L3TJ6ngRQaPUP8xJ5SzEOfEF37kbkOmBNlJx2U/xdwbPZN
         Qv6RutETiZ3uJiF3ra1b9cQ1nToxqB47gdVeiTiUxVbT34OyoPFj0xFoG07YV3xhfk5h
         KFPF34YiV5A0i26uhcHUENGa/L3KDiAZ+UI4ruI0iuoTflzQhSSwR1zFzBQzYUceGaAx
         7k1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5SvYSseLzFzfeOfav1aBIEEejp//4PJOzpkdi432WM=;
        b=P1PPZskfDU5jiOD9VV0W8x1t/67sggOtUFaLtSrCwZM5YSdhEhUkiC48f7Hu3Nd+bb
         fMKhj40lS/pr5lx2B63txSM+cSAbkVOYtdYIQ4PgUpMlIUbC2t6xq7ZQcMYtgeniVhP1
         7buBCgf22A7avoe60+P209z9COcO+joRrCLYCwB9srt2o0k852cHKLl+vzB7rV154Nce
         8PuzVA6iz6mYaDVAE/33IbPE+I2FU09fa44EjPhwi9U5Tat+0Dlap+ZO+jf4LhtbHmij
         dW9Tef8LNGUilcFwKyyZ9NvuvWdH3jm7fhU18aYskgq4LOMGH2nuhNN3mwWUzFJUweyc
         CkIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhL1f1zH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s194si5504473ybc.288.2020.07.25.12.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jul 2020 12:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhL1f1zH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jzPt4-0002eO-W1
	for alex.bennee@linaro.org; Sat, 25 Jul 2020 15:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jzPsp-0002eC-B5
 for qemu-arm@nongnu.org; Sat, 25 Jul 2020 15:30:59 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jzPsm-0003CJ-J1
 for qemu-arm@nongnu.org; Sat, 25 Jul 2020 15:30:59 -0400
Received: by mail-ot1-x32f.google.com with SMTP id a26so731675otf.1
 for <qemu-arm@nongnu.org>; Sat, 25 Jul 2020 12:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n5SvYSseLzFzfeOfav1aBIEEejp//4PJOzpkdi432WM=;
 b=VhL1f1zHE8aQQzjN1CgwnfBl/EoyvIta2zMjDwctIygDuk4iCjtJT/X0vvs/r/nnbE
 Y/86a6bsgGeEOSVYamQ7Vsk+SVzBM+YVLOU+gG7XcfiCl2y8xmpA5Jmovh5ycc/xfs2w
 HGCjPM3VhgXL9q3Dv7V06F+cH7hgnbKfEt90bw+ZiljmCWWFvJUvSeC6H8ZYaVRd8kV7
 +ODZ3shW8Ba6oSiTwqxG6LnNJQ7QD7+V4XKOI7MRNIvMTyKgCZphyeMep7VWZHnAmqVC
 KVa6EuJKXC1UjpMEFZuKkiNqOOXOQvDjZsmTv5MEgTSE7r/8v5MVvT4tWd+iOYhvlYNc
 1ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5SvYSseLzFzfeOfav1aBIEEejp//4PJOzpkdi432WM=;
 b=kf2+XmHk86R9G8/ilXCRYgabgE4ZH5kSUcqxbNi6WWC9o1QEZIMqr0nYdT9Od6nE20
 IplbDibXrjYRhOOa12Ml5ZLpwmJr+gmzI8pJ0LDWzdCYbUcsb4X0TwtPDscnolqP+RX3
 Dg+jtPdOnFmK1+MPf0HvChbETTdKkHj8j73xlhZefLkkhkUTlQaK4HiD2dhyQ0OKa2Pp
 0BcuONy9/zUyoDEDlbCoMf0v2TPNOETrN/LQ73c7sEGIXd/SlRfQHsvLhuCPU7NGFRL7
 gfwwXkX0gipmqxzVkCAN5rdOoolgOYA+A9COd4lLNOr0QWGFvWA5ujX48dVaAvIwA6zy
 o9HQ==
X-Gm-Message-State: AOAM533bAipRx7LPrqrz1laidzGd7eqqS1HA8/dw0qp2dr8PPxXrgO40
 4G4PKgxYpaGNbG+BnbZS5hYEryNkQG1GWhmrM2rd6Q==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr13636726otk.221.1595705455145; 
 Sat, 25 Jul 2020 12:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200724164258.24886-1-kraxel@redhat.com>
In-Reply-To: <20200724164258.24886-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Jul 2020 20:30:44 +0100
Message-ID: <CAFEAcA_VFgmzxW9q1qD5cgaqW5ifQmGH4jgL-xkfgMe7Y1rZiA@mail.gmail.com>
Subject: Re: [PULL 0/3] Fixes 20200724 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qrJFDC7FBOdX

On Fri, 24 Jul 2020 at 17:43, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 09e0cd773723219d21655587954da2769f64ba01:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20200722-1' into staging (2020-07-23 19:00:42 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20200724-pull-request
>
> for you to fetch changes up to 9b52b17ba5e96cec182537715e87308108b47117:
>
>   configure: Allow to build tools without pixman (2020-07-24 17:36:03 +0200)
>
> ----------------------------------------------------------------
> bugfixes: virtio-input, usb-dwc2, pixman.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM
