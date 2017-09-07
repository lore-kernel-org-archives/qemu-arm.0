Received: by 10.223.172.38 with SMTP id v35csp462847wrc;
        Thu, 7 Sep 2017 09:49:41 -0700 (PDT)
X-Received: by 10.200.36.244 with SMTP id t49mr4592627qtt.190.1504802981052;
        Thu, 07 Sep 2017 09:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504802981; cv=none;
        d=google.com; s=arc-20160816;
        b=BQaKp7KhdfzslB7R5SgVGf5lAMIyBTnbC4DtJ10+KMJ6WrZBpyQ15xU/CwYGAenzIz
         HNqFlEwwq0ZJewZPntdpiKQOVaZuKePyEGHGRpRryyjPRDP9x/tdVf2fgOmAGmKm+8Ql
         +COTfUrBUaGiDeNh+rBcCrICkXmFGoTp/eKjMR1PuCt6TcxJjBQH4WX2yMPQiR1+btcj
         WZeJTRgRX/CsFIa2MsqIQumvf2+c2R2jnHysQb67MM11lgg+nHCwIOM6i+pxgl/Dg2ir
         LybPlZK6YYz1y3GAzvLJk91N7KcHjzjfs3aM5ySt9RJrCY+HsHPD7WjLGR7Le0lMtPEn
         t3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5Rl2RnnsivMaQverF3NiV3Qhd2aVEa4SfP9ZUcXJ2hg=;
        b=csjxywM45hFGF6Y+IRrmtMjhaNkAsMQadiu6wCAja42mlmMAKLR6kVfrq/FtPmjm4h
         z7pl0NQvq8+hoTqdqgJ506Ww1TJcrnFTdTTPQuKE5XT6f6glyoWAzK2uQ2p9VRsk8wMd
         qT5xB3gmKg65YaI7YjJqXgcdGKX5SLGjGepqtSaSBm1V2kwszFZPq5xrnBKfIaO4MSHj
         NMGzbNkD53DfOGpQxkPlelGEsVfSEQku3XYoyKxEQg8aaL8AkrfBDKKtoIOWWsLfTb9k
         cGPmNlzUQyrFWeC6PvdSVb6L4xco00FGR/Ye4kBTv2VrUKJxk0bf37GMQFTxrlsdMZNZ
         Xiig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ovE1uz9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10si90892qkc.472.2017.09.07.09.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ovE1uz9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzzm-0000f4-Or
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:49:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzzc-0000bD-7l
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzzX-0005rp-QG
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:49:28 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:37669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpzzX-0005rX-KJ; Thu, 07 Sep 2017 12:49:23 -0400
Received: by mail-wm0-x242.google.com with SMTP id f4so88814wmh.4;
	Thu, 07 Sep 2017 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5Rl2RnnsivMaQverF3NiV3Qhd2aVEa4SfP9ZUcXJ2hg=;
	b=ovE1uz9g+gi9siipKiyENsppL6Sras7TN426BFwjyK37v2kdKQyYdjdNrHi08JNfAx
	43FBZloOx4N7MMAGpVYo0NASNtMYneJVXIFvx+le8XkMzO0SWT3B5TuPeaIRpOijyKwX
	yNZf/2zM2t0rr85ms1Rx0ZdbXAryZdrzUBS6P3DUXRu3hrzRp6cOReQSNlpYhkX5MXbe
	zw/wIxL4qU0ahU0VPH0PdFFZk8LbPzC+PpkFbZmRYyLhBPLPExJ4NsPQkhdaXbe4ZTKk
	Eu0RsrPNM9Nwl24iOPauisjVznVkel9/T4TSewsVjD2QIxsrR8yq3jN2AqYo/u/I1HWF
	qMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=5Rl2RnnsivMaQverF3NiV3Qhd2aVEa4SfP9ZUcXJ2hg=;
	b=UwgeRrQiIBUsC3lApn079uDM3vArp0hpv6qqIWNJsDt0cyhBuDKAhBQ3AtIWvWDlYV
	dv4jI832uIELNdhpHwXK9x+kdBejAbYZl4UrqQXusTNosV4t92BnTwwtStiFXyx/0ujE
	LDrdtVbN1XQmPghdczBM2p9tfNuOz2JRfvePKxyumty6pxj9B5n8H9XEWSKreljy5TDc
	rSCwQMD4D1lNlmumMqvJNUvyd5iem9pTUWnNMfANWEEd0X2RT99IH5a61xjMYmM1Z5sw
	TOpjtglywb8EFFGh4gGEbLtbejv/8IeDYequ29Z6x7GNDZUhldN6SH3XpvAeI3Gg/ppr
	QULg==
X-Gm-Message-State: AHPjjUhs9S2Y/tnVeo/PCfR/oQ6QF8JhyL1zzRWuih4Odm4GU/r2LHsC
	7XgB8l7XRE7xo5LP5VrAvny+AsqNKQ==
X-Google-Smtp-Source: ADKCNb7W/539Dc9R3WUQt8MyIOCrg0qYoTA/g3ktyEacIH8NZ8C/4GQ3ezwzOrzOv2Pr2uFN3wWX5GwYupMX3gGCYHY=
X-Received: by 10.28.140.1 with SMTP id o1mr6242wmd.40.1504802962422; Thu, 07
	Sep 2017 09:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 09:48:51 -0700 (PDT)
In-Reply-To: <CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
	<CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
	<CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Sep 2017 09:48:51 -0700
X-Google-Sender-Auth: fwc81izsaNuD-GHxyyErQIVTPeE
Message-ID: <CAKmqyKOqOJJceCf-wMjZTMQCHDjHWGWT4JAdsqERVXeNtTP6dw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/5] Expose the secure and
 virt properties to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhdCJR9ukGG4

On Thu, Sep 7, 2017 at 9:33 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 September 2017 at 17:29, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> It looks like patch 1 and 3 still didn't make it through. I see them
>> leaving the corporate network and going through to my personal email.
>>
>> Can anyone see anything on the QEMU mail server side? Any logs might
>> help me push IT to investigate.
>
> Unfortunately we don't really have much visibility into what
> the mail server is doing, because it's run by nongnu.org.
> It does seem to have a habit of occasionally eating patches
> (maybe it thinks they're spam or something).

Hmmm... I'm not sure how to look into this then, as I can see the
patches going through to my personal email address, so it's hard to
place the blame on the Xilinx mail server.

Do you want me to try sending out patches 1 and 3 again?

Thanks,
Alistair

>
> thanks
> -- PMM
>
