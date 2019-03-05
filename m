Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4767964wrx;
        Tue, 5 Mar 2019 05:58:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJ6TQw30j/k2bdyHNsfoHpfj+UKd2h31SBtvXFPcPgg2nxTKkSsINb2EXB0iKFr31JKjgM
X-Received: by 2002:a81:578e:: with SMTP id l136mr965836ywb.499.1551794317058;
        Tue, 05 Mar 2019 05:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551794317; cv=none;
        d=google.com; s=arc-20160816;
        b=qNcZzbBdK/IAZsvXjQjb4LrhuEIaRs8igmI4FSfQ7X/qjKywaGoy7mvlVHbQok0776
         ApAGnYvaSprj5bhjeE/qEGkKs6nBox0+fZ52yQuM0WhEvS7bLOdXo0C0dERK3lFvr2oi
         nScCeoT3SiKtWxjMDz6oeY2dl1HK6SLGgBxxe+e768dbYXgYYxaOicb+yIHse7eO16hE
         Euvj1Avtmno0dhX/sjug56/T17TxqLGHnsmZfCMl21gkcGV58LxaZijsQaAJ12Efc3x2
         ShjJxj670+CGutGKULpSIAg+dwMwJy5fnNrC0uG/wa/zrliXYndl8JmuwoVd3mazu+nQ
         qceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l9G+dct1VirSfqmvL/jlAigOiKQ350IMCKT1oFVBTV4=;
        b=fLUOFuQA0dDrA/DXDIe1kWoNFXHO47zSdPmj/aghu+ERxKd6aR8Gf1V2m4xw7/B2Mk
         m+SRi3I7FzJEOGBqlOjTyhMHZk/n0uVLbGXEVTCd7lltbTHmS+HRkGUX3Ci8c23cQ4vF
         +1vQY+VW3hBg/A/kpV8opaOzV2TXG9QDSrE+X9XkXtTxOxzkRcAf7/kYh9K2EmqeWspS
         rHN78WSTjt/VJj39uNpMMaNJpKKEV7DfVvRA9fwCTj1cje3mJQJMSGrFNoKiEvCa9NOw
         GpbAPY9GvwVWHOqXEuNa81UOIr+AeOxdZPf7h+CwAgCgFjZrJfXpxtqJLPZV1FUfePXt
         rKfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MhUe+PR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b81si5116029ywa.223.2019.03.05.05.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 05:58:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MhUe+PR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Aaa-0001jo-HL
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 08:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1AaS-0001je-52
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 08:58:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1AaR-0002iN-21
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 08:58:27 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46079)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h1AaQ-0002h8-TB
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 08:58:26 -0500
Received: by mail-ot1-x342.google.com with SMTP id i12so7460802otp.12
	for <qemu-arm@nongnu.org>; Tue, 05 Mar 2019 05:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l9G+dct1VirSfqmvL/jlAigOiKQ350IMCKT1oFVBTV4=;
	b=MhUe+PR5NBVQkwj20pjn9ULJFIdfcob1LSvuY7fqMa1fBcXKfsVCPWpKByi+DHg5Am
	WHscQ8eSaLfbzmOAT7N7Y4fVO5KlbL1c7mGVqwb8WKBt7SpzFxS3KFDOUugvfygzpsGn
	5cidfJYnQ+7E05rLCgL5VZyqDAtM5kb8b6uaEsJCtYWF6FloV4LHzDPNAmpq59nnIiXC
	E18LkLzvU3PUlT/psrfzOjz8zRn0phVIn7xUzINTgQvoHAIWa5LC+ea395iGJh7LR/Tg
	6vkG769bcg7reBaSqRg4y9LLOQG3+vzGdluvno3VtLEaspLSMsMIr2JZHVgGRVlpbq8O
	tWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l9G+dct1VirSfqmvL/jlAigOiKQ350IMCKT1oFVBTV4=;
	b=kIG5IDWhdZtanXBqtEpu3yLL7KFaVR+kBbRXppJs6+Af8zN0RiDzUGxhV81kisyJRL
	UdOLV9d5MdjAFxBSuPTvJnU6QJ+VxSvEa8wxq/7RWjA3CPGZVkz2h02tapL5nSrwrxsE
	TnvvRbQXEc0+4TR1QBym2mtuK9d6zB/TEPYw55dwZm5WDqmejWenZxZY2Jngo127I2ax
	T/JTk9fgnSioslPUN3I2OSB7NhfP3AbUEbHMVBAEOcAy1fUTnjdh8GP1XG/MaXdUhsIU
	NgbhjYtr9DymE2qJ6wfVF/BrWfZ+CJaNCR/uQCGYFgtUz9uLr1CtU3nxyxqUu0pxvkvi
	w/qA==
X-Gm-Message-State: APjAAAXezMfT5o2Kb6NH/mVMDFPFDpGXXYm8FxRQcHpnmGtpd6iTUZ/V
	TKQDCZUzIcpQp2ytjc+Upchxk2DxgukDsUatEq3UYg==
X-Received: by 2002:a9d:6406:: with SMTP id h6mr1006359otl.238.1551794305020; 
	Tue, 05 Mar 2019 05:58:25 -0800 (PST)
MIME-Version: 1.0
References: <1551741382-31691-1-git-send-email-michelheily@gmail.com>
In-Reply-To: <1551741382-31691-1-git-send-email-michelheily@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Mar 2019 13:58:09 +0000
Message-ID: <CAFEAcA9qCTOcxSG9VJn=LJRBvazr-StjWVdctOjMVw5R7meoWg@mail.gmail.com>
To: Michel Heily <michelheily@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v3] hw/arm/stellaris: Implement watchdog timer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q9sWn/E/RaTK

On Mon, 4 Mar 2019 at 23:16, <michelheily@gmail.com> wrote:
>
> From: Michel Heily <michelheily@gmail.com>
>
> I've added the stellaris watchdog functionality because I needed it for a home project.
> Documentation for the hardware can be found at http://www.ti.com/lit/ds/symlink/lm3s6965.pdf.
>
> Signed-off-by: Michel Heily <michelheily@gmail.com>

This patch looks good to me. I made a few minor tweaks:
 * rewrote the commit message to fit the way we normally
   describe changes
 * fixed a few minor nits found by scripts/checkpatch.pl
   (long lines, misplaced spaces, that kind of thing)
 * added a comment to the .c file with the docs URL

and I've applied it to my target-arm.next tree, so it should
get into master some time this week and will be in the
4.0 release.

Thanks for your contribution!

-- PMM
