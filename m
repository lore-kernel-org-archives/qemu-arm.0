Received: by 10.25.208.211 with SMTP id h202csp1227160lfg;
        Wed, 16 Mar 2016 07:36:34 -0700 (PDT)
X-Received: by 10.55.76.11 with SMTP id z11mr5620554qka.83.1458138994129;
        Wed, 16 Mar 2016 07:36:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si3510633qkb.34.2016.03.16.07.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 07:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agCYr-0001Xt-Kz
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 10:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCYp-0001X9-6v
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 10:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCYo-00031G-9t
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 10:36:31 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agCYo-00030r-5u
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 10:36:30 -0400
Received: by mail-vk0-x22d.google.com with SMTP id k1so64158646vkb.0
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dDMPRcF71Nb6Uy16O2UuDSsRjYBhUzzwugP2d3Ex0ec=;
	b=LTL5l8JSGMd5DKrbNYUF6xiBhslpLcISwteGzYgsvbUPwtiowDfMOztYZuMb2jgaKL
	hyN+KWsPAsHxTpOgz8E+MZaSa26JHqLvHGzJFYISABjvBG8CewFG8ZMDuNp+lb6nQjRn
	Se4nWfkaXKYhu+MZ20x4dmGgIZFaYLFoc2C54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dDMPRcF71Nb6Uy16O2UuDSsRjYBhUzzwugP2d3Ex0ec=;
	b=eimHoBxe89OvnNkk588bnZ9DBt5YERpIZ47EGIhzvgzveUiClZUDfRcmOaOJ1qDN0a
	hP9Pj0zJVT5cyRxSoEIjf9S3QBnW+75Tc2ll5pnM38jg+aZWM2P01lODXdgTrmcGaZJm
	3wfiZINwJhb2qY/MEtdEdpz76kdbIcyKnou/X/EbHqJIg9Mq1HteANHQJtDzx/oIxfyk
	1iionooZKqqXXiIgeeIdnD5OUWq62oEbvmEngrm+jQWTNWToHfjzksPLcS+O20vn4v48
	W2CcjqRO2rXgd67BvxGDYA9KYuaALDsinvii+lMlg3UTovo1qiKz/Do9yTIIjeMOIhUL
	hscQ==
X-Gm-Message-State: AD7BkJLlz9Np+XnPt9F+zc8/4hMMicWGm3zfuDF+fElJhm2bM9nj93b2o57s5+Xs2X4SAHFeleKB4dDRrxNBb50X
X-Received: by 10.31.52.147 with SMTP id b141mr4837199vka.82.1458138988633;
	Wed, 16 Mar 2016 07:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 07:36:09 -0700 (PDT)
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 14:36:09 +0000
Message-ID: <CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 0/9] PTimer fixes/features and ARM
	MPTimer conversion
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uVqhnFhsDFFy

On 30 January 2016 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
> Changelog for ARM MPTimer QEMUTimer to ptimer conversion:

So, where are we with this series? It looked from the mailing list
threads as if there were still a few things Peter C hadn't got
closure on, but we're rapidly running out of time before hard
freeze :-(  I'd really rather not have to push it out by yet
another release, especially since it got posted back in January..

thanks
-- PMM
