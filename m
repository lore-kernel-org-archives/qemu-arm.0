Received: by 10.28.4.212 with SMTP id 203csp220499wme;
        Fri, 4 May 2018 09:33:22 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo+DiAOiFKG+8bZhqnsRt/ZaVNgUMYnsZvOmPBzFlZaJ5OprIXm+XHQbl91xJ2Wl7c0B+pe
X-Received: by 10.55.72.79 with SMTP id v76mr23154168qka.193.1525451601909;
        Fri, 04 May 2018 09:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525451601; cv=none;
        d=google.com; s=arc-20160816;
        b=HtBE8B+nuwWRAEKGxUtkAJH4lAtPdlsP6hhpFvAFSxQgco2TCkrRB/sSZAJVreWgeO
         cWcoIcH81RN6wIGBnY8w31ioUaU2j+ja0roS0fE1z2BZsQSbJ/FOw51LfwBHd//7uclr
         ydzDDj6ilXHN/s0wHcwe/H3R0VPz9z8oGI5HxYzx5RLSRHXMYUGEfypgrzm1e07DlEeU
         sfTxhUN1jxDsSYGK0kdqBf9V++iD2we9R7Lv89TqP1jSjERWAagYfzjCN3qvw4Ry0nUi
         DXtrC1GCc7PSzdij/2jdnSKQyTJem5TH5bod1qEo0Kzn2L0SbVxt8Auyy7+5FcWM95IY
         MLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tRQQMinIOJpObttEGP6NdaSLwsIzyfdvWx1Bzo61wq0=;
        b=R7UfHtIApbeE/oUovU95CMTBwlH4vkxk4b6i+m3Y4sS3EHQlfgLLXhpI85rXD3iXQR
         zpehgkMNu07j2mzDd2RsFVRpeDf1bPLjVuR9lqT/E64kfhfGt0wCI+jvFfujm2ZkC5VY
         kLuh8Jj7P89ri+okLVk2E7XtYmqTOdwoVZqWdPkp3gcwBtaucjXOBBZxO1E57sf5NcGY
         by5IRbLf8nQPRA+OJcMOqKDELOdL4nbdrle9klXE6I2+R6MSQjpfJn6qY/pZAVPLlX7r
         C7rPiwwXakovy9v9wtfNP1d1r1jzyuQwKhQdv67uLwLCBsvxytXNsNuTov7fF5b6VznD
         PJSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NSXN+8rv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q33-v6si5306408qvc.14.2018.05.04.09.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NSXN+8rv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEde5-0005l8-Cv
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:33:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEddt-0005k3-9O
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdds-00015g-Ed
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:09 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:40517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEdds-00015K-9s
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:08 -0400
Received: by mail-ot0-x243.google.com with SMTP id n1-v6so25156698otf.7
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tRQQMinIOJpObttEGP6NdaSLwsIzyfdvWx1Bzo61wq0=;
	b=NSXN+8rvE3RDz0O5OHQStX1QywKMD8cAhp3Z9EeDcmLz6ymCTUi44bF/meK32wgrgb
	BBLLh2OiyMLWlLjIbRg57Sb6MK+jkEGS7v5Bj9GRAVfyb5T1HUzjeyW56Efpoqiv/X9b
	Kz/b01fy4xqw4YlqZ5rXW0xCGrUWhII8OS6BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tRQQMinIOJpObttEGP6NdaSLwsIzyfdvWx1Bzo61wq0=;
	b=dDmVj5YK6ohQQL0cHaDzB58eHr/DBBiOAw31JNXLSdoGihM4ykmwkGx4xlApJkP+2R
	SfhQq8DfrA7EwuHapb1JEJCHtFJf7bSvz+oUQUsnmjN7HjSsZvyNU5NsMfhIipyFa0yp
	0rg5whRQ3Zxcl5DpIpmHPkZNy6xNdS54JLWn0Is/pZYX8n37rM7VfOvaMniHcpNGuFPL
	E/VH6hwpOWwGE1D8u4Y5zNBFHrnqkBVAIy1TC0jf6tIK/e7lbbudRBV0JflXCZHpR+af
	tBWz33ISQlcInmgxRS4oWzJv9eLyn2dW14PdDUsx7/XmPH3Ng3XpSuF7YS4cOh9Powf/
	JRdw==
X-Gm-Message-State: ALKqPwfya5RRxnm/OrlCs2Tq8WmfzK67sajFZz9GntIsfIuRV1ELa/lX
	xVTh0zED2orw7I7h1T0CbRbLnaj/eAgjGge1xXcClw==
X-Received: by 2002:a9d:2842:: with SMTP id h2-v6mr389676otd.210.1525451587634;
	Fri, 04 May 2018 09:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 09:32:47 -0700 (PDT)
In-Reply-To: <1525326811-3233-1-git-send-email-thuth@redhat.com>
References: <1525326811-3233-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 17:32:47 +0100
Message-ID: <CAFEAcA-JF1aeT1tcmLnyayRaEtHM2bY=77kQ4pOO_wLgAKk1Sg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Don't fail qtest due to missing SD
 card in -nodefaults mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EgzBnyP9pmOr

On 3 May 2018 at 06:53, Thomas Huth <thuth@redhat.com> wrote:
> When running omap1/2 or pxa2xx based ARM machines with -nodefaults,
> they bail out immediately complaining about a "missing SecureDigital
> device". That's not how the "default" devices in vl.c are meant to
> work - it should be possible for a board to also start up without
> default devices. So let's turn the error message and exit() into
> a warning instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/omap1.c  |  8 ++++----
>  hw/arm/omap2.c  |  8 ++++----
>  hw/arm/pxa2xx.c | 15 +++++++--------
>  3 files changed, 15 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
