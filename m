Received: by 10.25.208.137 with SMTP id h131csp216281lfg;
        Fri, 6 May 2016 04:07:40 -0700 (PDT)
X-Received: by 10.194.88.201 with SMTP id bi9mr19069503wjb.147.1462532860287;
        Fri, 06 May 2016 04:07:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si17761758wjq.52.2016.05.06.04.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydbP-0004df-02
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:07:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aydaK-000375-4R
	for qemu-devel@nongnu.org; Fri, 06 May 2016 07:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayda6-0002oq-CQ
	for qemu-devel@nongnu.org; Fri, 06 May 2016 07:06:10 -0400
Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d]:36410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayda5-0002hs-0p
	for qemu-devel@nongnu.org; Fri, 06 May 2016 07:06:02 -0400
Received: by mail-yw0-x22d.google.com with SMTP id o66so198427268ywc.3
	for <qemu-devel@nongnu.org>; Fri, 06 May 2016 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hvUSkmArhpE2v72Bo8XXxkUFxczHJeUJZC9lcvW9/zI=;
	b=X8NpguK0w0SKNJ+5Pnq1UMUqH/wMvgowelSl9GmH9c4HsRZTFY1+YDa2AURZNQjSbj
	r3m/Wf4Xcf930Pu4IogT0TYXuvfuXTmA95iEkadWAw0yMs8BF1+9XS0+GLriNTfFGXy9
	vvMEqZ9n6fE6YYMIj5q78562cXZ4b97oT5j5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hvUSkmArhpE2v72Bo8XXxkUFxczHJeUJZC9lcvW9/zI=;
	b=DnFScIER0ffepQ6cmankix4mgz9C+Bpxgn5/r8rV+lQ70oYiiagz653LNlzAXAcnRB
	wXBLLcrw16AKxea/ai1Yo4X9aYTrkWSJgD7fcIoaGEmSBRu7nbC/JASWqkVQVIZUZ3Uy
	yqrRuYB570TNSJfhoFyTItnSYFOWg29cvjupcTW23hGIy8gmTwT0Srrs/OtpRBA4xQj/
	TbuAgqrKmErQiOrb0aZXeWaNh2kYDq1oeZst6K78XNIQmENZuAu/bdIFduq/RIYMb++V
	A76Nw/TFwKtNE7MZzpOTKkO+M7y3rmDRq9zWBpHq1q7nUObtX3WmzoH7GM6gBznb/Aky
	7qCA==
X-Gm-Message-State: AOPr4FVesH8ZfG3ykvLbnjqEUPwKKvJXslKGRHuMDDv5M3ZMzqGpYImsypA9rVFz0no4v5paaMrULHGcJiewJsmN
X-Received: by 10.176.7.35 with SMTP id h32mr12399585uah.17.1462532738953;
	Fri, 06 May 2016 04:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 6 May 2016 04:05:19 -0700 (PDT)
In-Reply-To: <1462532375-29264-3-git-send-email-zxq_yx_007@163.com>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
	<1462532375-29264-3-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2016 12:05:19 +0100
Message-ID: <CAFEAcA-rZL0S5kNFf0=--Xp2y9uJ8xPhGC4NmjRbuBkGs-8Y3A@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22d
Subject: Re: [Qemu-devel] [PATCH v2 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nw9u6vjMaOwl

On 6 May 2016 at 11:59, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the old SysBus init function and use instance_init
> * Move graphic_console_init into realize stage
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/display/jazz_led.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

I already reviewed this patch (and some others in this
series). Please *don't* resend patches without including any
Reviewed-by: tags you got for them, otherwise people won't
know if they need to look at them again, and information
about whether code has been reviewed gets lost.
For more info, see:
http://wiki.qemu.org/Contribute/SubmitAPatch#Proper_use_of_Reviewed-by:_tags_can_aid_review

thanks
-- PMM
