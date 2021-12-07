Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4621029lfk;
        Tue, 7 Dec 2021 07:25:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlP3BnYav9jRKXjsc2Bmw3ii1xCDeT67bgJJsSG585Wus6YgZW1rTnf4VMSSg8cW2rgY8u
X-Received: by 2002:a67:d28b:: with SMTP id z11mr44956351vsi.49.1638890702285;
        Tue, 07 Dec 2021 07:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638890702; cv=none;
        d=google.com; s=arc-20160816;
        b=DdtisLW7SFjO5gpEleHt63bq+1eIuJ+ft9aufZcO6DQaxChlZJzP2FwdO1GAeqefD1
         QuzSfJWSnqjE/X29eok+LXgjfyS1wyZwx8hIIMsQbRS8iE9GmgVHArgXc6S9BgFdgV47
         mKv+zBffd41W5zMiWxL+Q9+qJbfeG4IDQ4a4CRGydrsMs7X1A6w+7a09mYA4cVqo92A7
         R4vzMqEDl1gEC6GNDUitpIbiam6lNKBQcS+cOidJBCUFuM3bR8gmIM4/cky0zcRK6zqd
         YCwH6QK5hnBXLlACRzLucZNFs37IYC1sgFaNznGH7SNKT/8QvUzrGnGBw8hgr3YPhkIO
         tgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Wj/CUL6QPWm9ZM72JjgJCyemakkMWGTJi3KA9fKpRPo=;
        b=nVpVNd+y44VNdlFCr+36lJlJWCZ2dbueflpy/ngQFbm7bqcjkHqf9tb65+jwVm0Pg4
         mqofhYykddU3/mpyduAOeeNRbWXHwONPpNpUh6vb2jhEE8JRxKDm/s7HQyJMTY3TW7sx
         kpZ1vvL0riC0BeH4UIAwGEAtAYzIy4DlDdhdXuOTqd7Zdkhj+gVVK+C/CBhGagn8RaTE
         isguyOkdPJgEWvWC2pTEphRpY3YI4gwpFtwtKaSKpRKYEyxug6yOGl8aVAPVyCZfL/8R
         woIxqb/xvOyhA1sVoLcPr1TxZkRs1vujDVazpqsoktq6AAIo07mZVMNtueLLAk8cFt8+
         WmDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cf0aLpCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si15522143vss.703.2021.12.07.07.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 07:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cf0aLpCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mucKz-0002jq-Ku
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 10:25:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucKY-0002OZ-AO
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 10:24:34 -0500
Received: from [2a00:1450:4864:20::431] (port=43913
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucKT-0004rv-87
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 10:24:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id v11so30199402wrw.10
 for <qemu-arm@nongnu.org>; Tue, 07 Dec 2021 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wj/CUL6QPWm9ZM72JjgJCyemakkMWGTJi3KA9fKpRPo=;
 b=Cf0aLpCDD7rtqwMCqJtYUcMWjk7n/XhYArs470746Ku/jMZP3DdJdAG5+JBPo5SeEp
 VIOkhV2xAAUSqVUqmeJQOth9v1T9PC2WVDfTUJGw92BZ1HsH67R5HFtKFzQsuHfdxjzD
 bBY1qgTRmCDQslz4+MUVHQ84/BIngU9D+Ofhav7JpcO/qQjNn5+Jc8UvUgrBX7xV29rS
 NXobwEuvYVR9AUuglYTYakOBACucq0P+GaDqNrr0BrLPdzmNVFFW5KaIoPB87KMo4xrF
 KYAQGhGLo4WM3pxzyz09kGI9RM1WXAA9a03rK1yTZxqeZtQUcS0MDDGOa4yyh4dsdTII
 dAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wj/CUL6QPWm9ZM72JjgJCyemakkMWGTJi3KA9fKpRPo=;
 b=V++3RQpQAeaMab8RPehaK9Wy40h2T3cBa4HU7+Q0z2k51TW0nE6RPNzUfXXetcAmMv
 vIoU5ojSndrRZxApFA98P5p5XjM/6fFnwmNipVFvY9TfTjhaDP0o4WlPNNTza/+Np2YZ
 omhSFchYsBPv84zz9fJVAtxb+z6g9HPLpV6Y1unDUkcD7aZa+ZZDNxLA5vGrmyzzTKNH
 WIVhpEywU7KoGc1R7aREwQzhwN0N87fs1J6gwLQ8Dv5ATLaB6FkQ7OE0JTAQMXjRQE5b
 E8zkg0r02KEjbGYQywGAivZhQA6Pi3yKmmDh+T4eOwYnIt004/iATTKkRfGUHl0vDsia
 lJ7A==
X-Gm-Message-State: AOAM531+tQ56QgK6woGEFsh9uxbXtcI/ia+BVPWGkQF4/Gg4sPhLJWlo
 6/wnCJkK/I6RFVJsCeLTfUkI0BwNB6GoqKiPTbQe4Q==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr52799817wrp.4.1638890666745; 
 Tue, 07 Dec 2021 07:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 15:24:15 +0000
Message-ID: <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Brian Cain <bcain@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Sid Manning <sidneym@quicinc.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LmpK6ViZZ2ZP

On Tue, 7 Dec 2021 at 15:18, Brian Cain <bcain@quicinc.com> wrote:
> Peter Maydell wrote:
> > I won't try to put this into 6.2 unless you have a common guest
> > that runs into this bug.

> I know that Qualcomm encounters this issue with its hypervisor (https://g=
ithub.com/quic/gunyah-hypervisor).  Apologies for not being familiar -- "co=
mmon guest" means multiple guest systems/OSs that encounter the issue?  Doe=
s that mean that it would not suffice to demonstrate the issue for the one =
known case?

It means "if you see this with a Linux, BSD etc guest that's
more important than if you see this with some oddball thing
nobody else is using and whose users aren't as likely to be
using release versions of QEMU rather than mainline".

The bug is a bug in any case and we'll fix it, it's just a
question of whether it meets the bar to go into 6.2, which is
hopefully going to have its final RC tagged today. If this
patch had arrived a week ago then the bar would have been
lower and it would definitely have gone in. As it is I have
to weigh up the chances of this change causing a regression
for eg KVM running on emulated QEMU.

thanks
-- PMM
