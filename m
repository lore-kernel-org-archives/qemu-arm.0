Received: by 10.28.71.27 with SMTP id u27csp2104829wma;
        Thu, 22 Feb 2018 07:47:46 -0800 (PST)
X-Google-Smtp-Source: AH8x226g2uHmhtJYzraqW2wtNyip1Ay1HBPiRlcebyVjoJOOeosdwHa1lfJCqS+K67fzMeV/qij+
X-Received: by 10.129.112.6 with SMTP id l6mr950913ywc.230.1519314466313;
        Thu, 22 Feb 2018 07:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519314466; cv=none;
        d=google.com; s=arc-20160816;
        b=wHelbDdTJKBuqCzKjL8HeraK6TtENgqrKpsQuiWsv+u5itV1+X7lcGY3TYMx/WZY+Q
         7TZk6jK24pBjMIU+tcmYMTedCrrjG9ynVJMVIvlAtxHQlltZRSBqLZJaQZq/sReAeGba
         AaMEaiOi+tlJgnq0fG24IH06DFm7focaZkKQIPcgSckolvD77fRMBtJDHWWw4KNDfY0C
         6NiEZ0O8JNFoUjLT/Ajf6bkBY+xrHpeAwV2Xl4/xbobunjo9M2NrUN5k3V0b/BLGwsH8
         9frvqPhTj2KLy52FTS++tI7Mk5Plf0TtYZs+OhaJJKvVKUlvHQ++gNYtQsdIWzEO1wAS
         jc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=h6qJigr7/BsOGsxwFLI+ZHTgkfqbuMe1BJptM90/T/k=;
        b=jA1syyE2ZQXAdWrhefe6m7ZABbO2jtzhEmhlaluN7iMTdG4lBpFc1U3b+XE1OUd5uJ
         dGn1qzl3MozU1xL7VEZLcjCbF6LC2e1xltDYLJPdcRTnLNeskQT2eHzkipLiAqem4VNQ
         qQICXFPgWtupmu2JmMr8e064oUcSt/8nsgDrhhyjeTy3qaZ76qcSdLcoZoP2Groo7bG5
         CS98zn+Zm7fC3BCn/6YuXfmzdWOQUeNelyUI6d/Ql3Zj6hYRJod56BXHxCA5TiqWycQb
         ckmZVuqSdT98ViwOzl/SmjVhno2sKOf2nqXlBElQrhanYwrFOZyHqddnSi7COxz/X0me
         tA9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bo1jcpXo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si55076ywb.158.2018.02.22.07.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 07:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bo1jcpXo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eot61-0000w1-MK
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 10:47:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eosxt-0002SM-4X
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eosxs-0007QL-AS
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:39:21 -0500
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:34333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eosxs-0007Ph-64
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:39:20 -0500
Received: by mail-io0-x241.google.com with SMTP id e7so6456608ioj.1
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 07:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h6qJigr7/BsOGsxwFLI+ZHTgkfqbuMe1BJptM90/T/k=;
	b=Bo1jcpXo22mwo2EmjqddNM+3dFYq+gpgBwgPAP6T/0YfRcvAW2hjzbvOj9z6dhBwr5
	Mdj9Fli4Fj9Gm1sgPuIPTUoSf7hgq92ogYhC51XlBdk0f0Yt3cBqjgH36R9JoyJ64XZe
	4K8cnEjn8csQkCAfO1kKB/iDEOFCnRDGLo60w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h6qJigr7/BsOGsxwFLI+ZHTgkfqbuMe1BJptM90/T/k=;
	b=dm4Fy1fKE6s7k8lH8kSv7X8VahmnavmBOyUSEJWTMTzwfWSjgV6BMwFoMQ/mSK4l/w
	pfaML0GHJKYOQE2h/LKJjloozA67TemXw73dy2qyJQVcKOsYatsu22KPdZOLGAAGbEDS
	hC5mB01tVFMao2pp0JXP20czqiL7PrQC17ifsuHwMb3nziCzThXL9wpp84Ln7afGpcTP
	wBoESLFa/0htnMrbr7i1EHlRIE2VNWAYq0LR8AySjN6AZei8GZf8kONpNWC6Hx2IVRJG
	k9sXxcSYt3U1T8NOeiR+uznflV20kCtMmkGKEHSzgRGnP+A4thWpThP+Eylh3cjDe5oA
	7YVw==
X-Gm-Message-State: APf1xPARvz1K5m5kU6+x+QuwyHOHNGf8KqxSEWXDWB8iKqYw5XQx/XSb
	mLanmFEuh3qFby4wgVFurZHD20i+IkpTO6RubIPnhg==
X-Received: by 10.107.130.201 with SMTP id m70mr9069043ioi.304.1519313959512; 
	Thu, 22 Feb 2018 07:39:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Thu, 22 Feb 2018 07:39:19 -0800 (PST)
In-Reply-To: <03f96a6b-3a52-0d72-e634-8b8f167f2992@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
	<CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
	<03f96a6b-3a52-0d72-e634-8b8f167f2992@acm.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:39:19 +0100
Message-ID: <CACRpkdYMTojtHnafK+kMnm1G7j+9Nj=p65WLZGbrN8MJv+4psQ@mail.gmail.com>
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to i2c.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ToYUsYbMv7A

On Tue, Feb 20, 2018 at 2:06 PM, Corey Minyard <minyard@acm.org> wrote:
> On 02/19/2018 09:25 AM, Peter Maydell wrote:
>>
>> On 19 February 2018 at 15:20,  <minyard@acm.org> wrote:
>>>
>>> From: Corey Minyard <cminyard@mvista.com>
>>>
>>> Some devices need access to it.
>>>
>>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>>> ---
>>>   hw/i2c/core.c        | 17 -----------------
>>>   include/hw/i2c/i2c.h | 17 +++++++++++++++++
>>>   2 files changed, 17 insertions(+), 17 deletions(-)
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Linus, Philippe, do you want me to submit this, or do you want
> to take it?  You can pull it from:
>
> https://github.com/cminyard/qemu.git tags/i2c-bus-move

I don't have any commit rights, if you can push this to the
QEMU master I will happily rebase my stuff and resubmit :)

Yours,
Linus Walleij
