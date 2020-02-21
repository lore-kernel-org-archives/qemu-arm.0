Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1618756lfg;
        Fri, 21 Feb 2020 02:21:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUZ4FEkkt3TXmj60DqaApp8u+SaCW9f3Oc3bfybFRw81xPVB034QTDWX10U1Bqt5oKxuaG
X-Received: by 2002:a0c:c68a:: with SMTP id d10mr29892709qvj.126.1582280483796;
        Fri, 21 Feb 2020 02:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582280483; cv=none;
        d=google.com; s=arc-20160816;
        b=gQpXaRUbxt0WtLRgXSBEUXTAWeeme0TdvCqoitx+1jOwKGUVr/92Qkp75KLW6ufvbc
         mfEUt3aNBgNHfkMrTsemj9fFb0u712uuVUjf6DUvmYsikUV5LzkMXVg/HnBj7PL8DEef
         CVVx6D2ueij6yrmRpbF82bMKvIvD8P6X6SPBxoP8pp68vpD7UatFfIFwQcNRvrLViq+t
         m3ByjdcCD4shOimNfCIZRNjGCT4GvgdH+b8cKCMUe4vpMD6snhqAq7eVIGIouza8FPVq
         IMlt9Of3ou4QstWCppLP+x1/fWhetuoSt6+jX5uFF2eWt1pz0EwMnydTBpFbahKnF/M8
         +6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VkeHR2X7LWmDxA7o4sJuwqHGKBcc6KWoOwdHUepY2pM=;
        b=BvTMr3uC9duSLSlVEgImSUFQ2seecNNI4BI/x8UEq8IaMkesGQuuQHNwfHLNaSKUpj
         Kq2X9U5RXVOAXkx2luLRtIJWiTPilT8+jG7XEKhYCrr6zx8zW0lnhFb1ohm4meOUliQj
         8gnlf9ZROjumZMNvEjpFZFvif+t3QPtnyFxGaQcW8nIjrZ2fzNY5wMaMBbTEnLb6chlQ
         3ILjWH1zY9/AOwb+UZvu+Z6vI443xkBgY6Kzwg8u7O+kWnyMTaoeM+sLr7TFhRcP4JBY
         YxoNw/YsCUC9ladfnlWILRPs4Gqqp1ZKCgLdGdV4K4zPsbLXOVTYbkbCQATibAthkjcS
         QG4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHLZduUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si1135497qvn.127.2020.02.21.02.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 02:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHLZduUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j55Qx-0008Ty-8f
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 05:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j55Qp-0008RT-Bi
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 05:21:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j55Qn-0008M1-UI
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 05:21:15 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36615)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j55Qn-0008Jh-Gf
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 05:21:13 -0500
Received: by mail-oi1-x243.google.com with SMTP id c16so1107544oic.3
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 02:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkeHR2X7LWmDxA7o4sJuwqHGKBcc6KWoOwdHUepY2pM=;
 b=fHLZduUe22y1NVstwqWOpzckfi/QtH2t2pp0kHtfb4QAvFuDHQksUzFBFnqkjV2vPs
 cJnlaGSvLezoWxPrmHHM65deNpmt8vt78TsvGROl6rJXqNDdbFFCOO/vtE5/TT02x3oB
 v8vmI1UhZ0Sfjpue2neUY81XSm0U1IYnr8oT75U8O7e2BdMFJYxOFxO3fU9Tp+9fyNzW
 aLeQkbe2LDkWS0gDRRLaHRbY+GmhGg55De0Ix2Mb9aT3ner6CMbSIcE9fh7hSX+MM99w
 HWwc9O3JkJ4gcXhVDlMfe8NDfp8ffEnRr4YEDfrzf6i9HMKXeVqsXhzkBiVq7nxlIyGG
 6dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkeHR2X7LWmDxA7o4sJuwqHGKBcc6KWoOwdHUepY2pM=;
 b=Q6pLh6LznbZin3fhPKnqBAwfWr4LgUrI0l4v0T3CS0t/g+rPyfaCtmgOIvw6PM7ajo
 ydOUV2v0YeWlfrJxBNAJm1YWvpdKP2oMT9gvuZ65EeT7rXej15W2twf90g3RIZIrLVEz
 uPOwEwLwFkhS9LXHTYIUoZlVXG7HroylVcc2j9cij3Rd5nP4Bc7TPWnT+Y433dJwiXjG
 rnGwSJFL0LYUq5nygVwLihBipf0y/NjIVcOkMvcZ1XtedwW8hxJZcR59GElx4CkuerTb
 FaYGgw23JFEM4JO/lFRV2A67hkBfF8203jvtszGff6B2zGwm3yOYpIZARx5RzG7h3eoW
 jQIw==
X-Gm-Message-State: APjAAAW+m+rUc1L1nQMUXBavRW/OaF/qWavz0YTlbQNLG+KJ5V+iDUHo
 8L9ePd14CVrt2au9fCgG9YBKONozGzcMP1j0rZgxREuE
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr1347955oic.48.1582280471747; 
 Fri, 21 Feb 2020 02:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
In-Reply-To: <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 10:21:00 +0000
Message-ID: <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Gavin Shan <gshan@redhat.com>
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
Cc: Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7yVdmuK6DuN

On Fri, 21 Feb 2020 at 04:24, Gavin Shan <gshan@redhat.com> wrote:
> If above analysis is correct and the first approach doesn't work out. We have to
> consider the 2nd approach - adding option to backend to allow losing data. I'm
> going to add "allow-data-lost" option for TYPE_CHARDEV_SOCKET. With the option,
> a back-off algorithm in tcp_chr_write(): The channel is consider as broken if
> it fails to transmit data in last continuous 5 times. The transmission is still
> issued when the channel is in broken state and recovered to normal state if
> transmission succeeds for once.

Before you do that, I would suggest investigating:
 * is this a problem we've already had on x86 and that there is a
   standard solution for?
 * should this be applicable to more than just the socket chardev?
   What's special about the socket chardev?

I've added the chardev backend maintainers to the cc list.

thanks
-- PMM
