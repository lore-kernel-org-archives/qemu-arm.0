Received: by 10.25.159.19 with SMTP id i19csp488345lfe;
        Fri, 15 Jan 2016 06:11:51 -0800 (PST)
X-Received: by 10.55.78.198 with SMTP id c189mr13389292qkb.95.1452867111641;
        Fri, 15 Jan 2016 06:11:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si13470567qhc.34.2016.01.15.06.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK56U-0000gE-L7
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:11:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK566-0000N6-Os
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 09:11:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK565-00062E-Mj
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 09:11:26 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK565-00060u-Hw
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 09:11:25 -0500
Received: by mail-vk0-x231.google.com with SMTP id a123so268963493vkh.1
	for <qemu-devel@nongnu.org>; Fri, 15 Jan 2016 06:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VrRmVfRKz/DGK8JL0LvcY5VSUdCmLmQ9aws8ojUe9wE=;
	b=as8ZRVNdP0KYzoSUkMqW3gxrSUd/WxlmlkxXETU1VucyxW7Nfu6Lf3ItzsgbLMx5gj
	gwAquY/HLqQaSV3CxNgr0rPwBaZGVg1nUPXhNTOzQZlf6+EuSTdeMjNXKtUINcbGKEvV
	6VSmcigX61tbUt59q1RUAGS1NADIwcqz2H5aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VrRmVfRKz/DGK8JL0LvcY5VSUdCmLmQ9aws8ojUe9wE=;
	b=RXkF2KC/kIy+zm0/I0H2Yz72n9Mx/USdF9xCaHCgxx23pha6qv4F95PcNyjj6B7asb
	CJ415rxGgv4LSYmrrYytfWgeceEPa7G3G9WnMZEMTb/CKiZaaflsZ8qg10o8cIeQjvut
	hXins9fRD9dXYDYZZjKurb4WU328ACNgLy9fIVKdybkofDkPvpgtunPCZnpdYz0/RJ3W
	8RrGO1FTPhIVivDJvlotE7usV2cyK2bUAFzjQY5ArFBba/isw2xOe+TH5qT4rtsrsMYx
	KCXtojjsvpSzH4R5EjUg8nWgHd4cjnDvgDNBX17H4FvvKBc3ciUnDbPxSrSnkH+RzIc+
	I8Bg==
X-Gm-Message-State: ALoCoQm0ERBQWfw1YcJZfQ1tgENfmXIqXPLOCxSlyWok4hmaMlIusnFbLxg48LpW6HDegNxccjZDYQhCC7GBqe450bo8Skr8P3FsS+ERpN6N3nCEYNklXWo=
X-Received: by 10.31.107.138 with SMTP id k10mr7109387vki.27.1452867083966;
	Fri, 15 Jan 2016 06:11:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:11:04 -0800 (PST)
In-Reply-To: <1452854262-19550-1-git-send-email-a.rigo@virtualopensystems.com>
References: <1452854262-19550-1-git-send-email-a.rigo@virtualopensystems.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:11:04 +0000
Message-ID: <CAFEAcA8SYr8SXt-dWOC78PpXNMryp0jWf70YAyaThNxGk8m8kg@mail.gmail.com>
To: Alvise Rigo <a.rigo@virtualopensystems.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: "tech@virtualopensystems.com" <tech@virtualopensystems.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2] target-arm: Use the right MMU index in
	arm_regime_using_lpae_format
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QD1aOcQfKFXX

On 15 January 2016 at 10:37, Alvise Rigo <a.rigo@virtualopensystems.com> wrote:
> arm_regime_using_lpae_format checks whether the LPAE extension is used
> for stage 1 translation regimes. MMU indexes not exclusively of a stage 1
> regime won't work with this method.
>
> In case of ARMMMUIdx_S12NSE0 or ARMMMUIdx_S12NSE1, offset these values
> by ARMMMUIdx_S1NSE0 to get the right index indicating a stage 1
> translation regime.
>
> Rename also the function to arm_s1_regime_using_lpae_format and update
> the comments to reflect the change.
>
> Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>



Applied to target-arm.next, thanks.

-- PMM
