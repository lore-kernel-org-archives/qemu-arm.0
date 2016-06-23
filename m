Received: by 10.25.21.96 with SMTP id l93csp641608lfi;
        Thu, 23 Jun 2016 10:38:31 -0700 (PDT)
X-Received: by 10.200.45.178 with SMTP id p47mr45403233qta.27.1466703511704;
        Thu, 23 Jun 2016 10:38:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si1169877qka.76.2016.06.23.10.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8aF-00069Q-3v
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:38:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8aB-00067T-Ks
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:38:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8a9-0001rS-PM
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:38:26 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8a9-0001rH-LW
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:38:25 -0400
Received: by mail-vk0-x22e.google.com with SMTP id d185so116659948vkg.0
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AvkUPU/P2zwpQi8fe5+bme5+gN6zT2hwvxrs5O//h5g=;
	b=SOq21R9ptdNp09OrmQh9MqC+AtrZHKEiOaIpD+/bYSeKgoHJT7b4nVVXdJqKuZLkIM
	kWmfLnzYwTcuuHXFMYtG9uzRRsr9NuPBs/cn0fH7dlz1oOIdEoJSBkZuOk+ndOWB6Beg
	//zo0QzvA1QT3p7EjHMjWjv7XerB/3NaFSy+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AvkUPU/P2zwpQi8fe5+bme5+gN6zT2hwvxrs5O//h5g=;
	b=OqBxhVFGHhkSpckXOa4irl54G6jRHqtizauV+upnBZ5mNLfkrDAPVd+7/06a5t1Hsj
	Hg/uLgB/pLyyClzmW7DmdghnV0b1J1qNBQlbEV1uAnPBAomfv5z9VSDx2jOkKh4RTQaO
	/2lR5csQdn2okY33AWMkxKJUEcQtH20LnuCA4gewtgZi/SLzx1o7XlytOh77RSUTiG3u
	Hxrxy9kXTn0bmayJVVvhIEp/d9dA2OOZRopGLQ8olSh4trlCzF7kfPEs+sCLmaSv5PaV
	2BUWLa+i4DshKZV+54zTovZzh9MpzM/oDUi12kJkOD14GJLloTlhpK83mU2fBzwih+2a
	YqYA==
X-Gm-Message-State: ALyK8tK9wI9P0VRno4ZiGj61dYtGIG19O7K9J42tryc0pX3VaQ4nNicqh9CQR36m+ikzz0aXuxg3IF07JfJJ6yOe
X-Received: by 10.31.76.132 with SMTP id z126mr16134320vka.108.1466703505073; 
	Thu, 23 Jun 2016 10:38:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 10:38:05 -0700 (PDT)
In-Reply-To: <1466648115-17015-3-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-3-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 18:38:05 +0100
Message-ID: <CAFEAcA9tY4qNmj-K4ooyn8GZ_p-nnX1Y995u-PNz6wFEpQqXjw@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH v2 2/3] ast2400: Integrate the SCU model and
 set silicon revision
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6N/rG0ISznvp

On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> By specifying the silicon revision we select the appropriate reset
> values for the SoC.
>
> Additionally, expose hardware strapping properties aliasing those
> provided by the SCU for board-specific configuration.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
