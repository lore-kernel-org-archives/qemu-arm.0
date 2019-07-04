Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1717073wru;
        Thu, 4 Jul 2019 00:46:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgIzo7f5Vwxumt8ilI1IWiZtMRk5hqtj1Txs7/zkf2j16XCf1axjfDvJlISCFQf0quIxdU
X-Received: by 2002:a17:906:7f0f:: with SMTP id d15mr39039332ejr.39.1562226383293;
        Thu, 04 Jul 2019 00:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562226383; cv=none;
        d=google.com; s=arc-20160816;
        b=kf/9WteX0p/+x+AsHjWdWrazHf7dm8TefNugOFV5ICL5MsqXsoVQLDWjA7We6Jpigo
         +V4MTCBb4cDItLBvQ49XbcPJviC06j6Ga2YDH26gt/NgCRzWylyCwtMZwhy5ZqAOaD66
         SiTCPS+niIJiOIY63XsRxHVHh1AAHQdqeaTfQqUWTCWVgQg+zJD1N/lyEHBFLpt0v+++
         +tmCvk0BM/hiUepILigg6YeBG0HtVLwBA+qafaFg+H8SxQsIk89pjYfMCdqZjve0NS2X
         otDRdc8pCJbDut/Xr6lSqRsnw63LtsDBRotjL4q0sYVqiucIIZ5LTnZf6uKZdgs0Kih8
         /OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yj/wqOyMlGUJwp8JA4jIUocuQCeMk2Fc0Qfp9w7cHtM=;
        b=qldBJWGcK4JrCgdn5bf6zUYiuE+ayuBkRmGLqRJf1qH/iTzy3pcce8qYx0WXQBTAph
         9HIb7XxOH6VmqQFtYRZZqk+LhaixxLPQuDEdc+gZmeI+pQiBhGEsYvQFbvjQ9SNa5Tgz
         H+LF+zi9qEWHuGgZbmrUkoFAl2YCFyNU5cZNTWQV63ToNeXrWhwk8XGq9SAQHzEBEFIQ
         +5jJ8+O/vOEPbbBqq7xLq1MWjT1rvki1bmw9CxKXXCEUdtiEUOd3Tc1bdMiehnPdrINp
         1IgZvHfLRJJPtbuTQqa1AUrDPU1YU+WqPAKdp2qHHsMgyv8+RecsYtRKOZwAz+fWXp9a
         7dkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x2jg1Z3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si3221810ejv.125.2019.07.04.00.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 00:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x2jg1Z3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiwRi-0005Nm-E1
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 03:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiwR4-0005NE-4N
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 03:45:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiwQr-0003kU-Ne
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 03:45:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:47049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiwQf-0003Ym-HK
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 03:45:19 -0400
Received: by mail-oi1-x241.google.com with SMTP id 65so4217143oid.13
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 00:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yj/wqOyMlGUJwp8JA4jIUocuQCeMk2Fc0Qfp9w7cHtM=;
 b=x2jg1Z3vCK5Tm6J6v8ljuj8/JWPg+C1XNrhu7W+e8GnbM22MzxCV2D4e0kw2rLGsfo
 bwGytGFY2P2WONysFgDM9wR2CK45sCny7mGJvaN5GgSGXq7E1+bj2zQ7o5q3ziCz9FF8
 sBVrZwuMZnHmhfkDuir8MovFjmGb4MdmX66+jHjiPyapuLreDf5IPCoD6UhK5kHOqkL/
 2PefNw9DckphE+AuR3bxq6gWr27/Rx0SKyMskp/6U7L5hnds4Rp0qN5uAbEMWs2zgAl2
 BnVxURuXFt71X+tbJNEhcGRkn/3iR+MhpnEsB20A6/7jtjWgVGmNFu4IY3DK/eQ03aIV
 +8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yj/wqOyMlGUJwp8JA4jIUocuQCeMk2Fc0Qfp9w7cHtM=;
 b=jrXOdu5K3nuqMR113GSKV4kA+gXFwffq1KlIwsnr3w+K+Zw/P+GRyfGhRVRI2rjib+
 pQ1q96SybVj0xitx38/zVRGrxGTk89IKFr0WWrAOlEOiE71WPp9FgvMjMiOWTOtMrlqi
 W8X2t+/GLWaZ5lAuu0s4NON2JuUdK96BzAh0kqACYUiuQGewhQiXZbQWHNDlsJkKIiiC
 cXScUxf+BCm758USDDpE8CcSSAr8Q2/Tg2ZJs3+00OofNZ5uCXd7Xt6h1EH+x3w+yaXz
 8JOONgnyg0elPU0kf1mSzsKp5PKgOYFUy3vX3de6/1S71GcBMcALE53cwo7fh5vG4Oge
 nACA==
X-Gm-Message-State: APjAAAUT4KroMDfuvUMaeqQOXdb8a5uHtlNLPMALEsAlFmnWgvpqCaJ9
 oigEGiwBZJuihyXk0H1hNYNAkS4dOmDv8UNTuwVjJg==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr1047974oie.48.1562226314374; 
 Thu, 04 Jul 2019 00:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190703085416.21837-1-kraxel@redhat.com>
In-Reply-To: <20190703085416.21837-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 08:45:03 +0100
Message-ID: <CAFEAcA_Me140dWhdXrnroJdTRwKmtbZGSbcY_OPwP8N3ELU+7Q@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PULL 0/4] Vga 20190703 patches
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ki/IsKrWCgID

On Wed, 3 Jul 2019 at 09:54, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd43:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702' into staging (2019-07-02 18:56:44 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20190703-pull-request
>
> for you to fetch changes up to 0a87fd693d4e955a6877a2166b65bb7b7192aaaa:
>
>   Add ati vgabios to INSTALL_BLOBS. (2019-07-03 10:52:15 +0200)
>
> ----------------------------------------------------------------
> vga: virtio fixes, bitbang i2c asan fix, install ati vgabios.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM
