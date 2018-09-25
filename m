Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp495439wrt;
        Tue, 25 Sep 2018 03:27:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60FJFUgae1s7si/dHHD7JXdbYqVSrG1swOEpiab7mGBsztTRbZAhPOd0kPi2i/5c6DT+I+D
X-Received: by 2002:a37:7a86:: with SMTP id v128-v6mr212556qkc.218.1537871250200;
        Tue, 25 Sep 2018 03:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871250; cv=none;
        d=google.com; s=arc-20160816;
        b=NuErqOMbPCE58ZqvbIOHkNh7P2TuG0Yky+ATUAwSW/lfIMsjZL2Zo1MyxYZ8pWKJS3
         60lYTiVUUMUaV61Xcq2JOAULlB4Y7q0X5LXkl/8WYLaRJs/PVQQFOeoT88UvYdCsOo7D
         5jFvxBnAIdcwACuP9EA2w+p/UcbQFumM3jX6J4OrXTkFi/JtJA3twpB0KpMNZ/Dd2m4N
         hmpHUaDJ8AxO3lClm2NjijroQzZvVXOAMH1MPo9/oNgCm+G12LIZ6q5Usf3qAECh2XmN
         0023RiAd69KNL+5gWjpUA+vStmcFF/cg0/Xll0LuS6NUdYhQpYFJs9KXGzltI2ci+7AY
         tiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=U2yisELh87c1f2pIUQWBlJKsqKE+eys2gxYMG3T8ah8=;
        b=zfxmtM56Gaxf7nHyicdFCEfL8OJXEG5IpiN6S+55wgc/CTA6F5Hi2Ee5HupWyqA9ii
         f94v9Nfpd1RyizceSu7QlLZOEiL4qoiXQOAFu2XDc3exUpVll6FBrzEed3XfGVQEA6TG
         iiZOMDwMnHfa83h/hCDlYxpSFqdHR2YB/hYNbWE0lyeNeMCpG4LiBxYPqD6rRUcBB5z9
         W5jIPwAhAiKtP25ld0NHHJKwZ9mRBHkuN7dYWZ1LaaxHKNr2dUpIhZui7+NKn1TDCmrt
         Aaubwq8tbQ4CrjUs6wCJP0dCgxD9OISDd78d2eupirkJXSJ44ESII6bBpBOW7RJo6Qam
         TmkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BtpmVHJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y22-v6si1453657qto.115.2018.09.25.03.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BtpmVHJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kYz-0003Nt-Jw
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:27:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kYi-0003Fl-SE
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kXp-0004WC-3M
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:26:17 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kXo-0004W1-Sk
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 06:26:16 -0400
Received: by mail-oi1-x242.google.com with SMTP id m11-v6so1020468oic.2
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U2yisELh87c1f2pIUQWBlJKsqKE+eys2gxYMG3T8ah8=;
	b=BtpmVHJWFIAtZ05jBVEuPH4A40HVxDIm6Sv7yVhq4RPZVAH8t62vJU6VAbVp3mSeCO
	IeeZY6W0wfEbTp94ey4mkS2mpqvldfLLo50/KWkp2PxYBGC8FgsmttmFY4A5V6RL7QK5
	vQxk2fV6JHiE2qgCXikcaBQqGyLhH+WzngEJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U2yisELh87c1f2pIUQWBlJKsqKE+eys2gxYMG3T8ah8=;
	b=ZYHPwYf6cjav1/5Qs2v/MtN3cgN0+eBiIvxX21HKqV5C/+9bYduIbbqq995yO5QLyO
	VhwipV9O2vxT3TSsvZhGbZMUM1zOJYNAFIcG3FgpKoV0pKa4MJ5nhNp9Wl9L3x5P/7/w
	7m87MI3mASP/hvst+LVhCIsjEz2l4l7lmXWK4pKlahbdI8RqSUH8re1Xnr20R/P0i/kJ
	iw6aVuqn/9P+sFu/ucva4kf0YbD95DBvQ5YhDQ/0xoJXSnYZ4f14xjsaiHiuJQfotG7t
	4d1HoLpx85Dve/x8ku4GRMImtBVMSf/FKqJ77h9T7BfoBXQ62Z/iDbnL6E0ympHjZCd/
	u6MQ==
X-Gm-Message-State: ABuFfoguIvcqwZEHVb6+IQEdbajg8BUXdtiP+fGJnfFPKAgVvj5NNsGP
	DThqBjIh2ZivIL52nXU1A+3aXVnSCwdvQPP4HmmJGg==
X-Received: by 2002:aca:40d6:: with SMTP id
	n205-v6mr175830oia.35.1537871176252; 
	Tue, 25 Sep 2018 03:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:25:55
	-0700 (PDT)
In-Reply-To: <20180921070138.10114-3-eric.auger@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:25:55 +0100
Message-ID: <CAFEAcA8nZLRtpb7E4bf_8QNBugerS=9Eja7AV51cfEmhDssXgQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/smmuv3: fix eventq recording and
 IRQ triggerring
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ZdxSQGi6d/U

On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
> The event queue management is broken today. Event records
> are not properly written as EVT_SET_* macro was not updating
> the actual event record. Also the event queue interrupt
> is not correctly triggered.
>
> Fixes: bb981004eaf4 ("hw/arm/smmuv3: Event queue recording helper")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h | 26 +++++++++++++-------------
>  hw/arm/smmuv3.c          |  2 +-
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index bab25d640e..19540f8f41 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -442,17 +442,17 @@ typedef struct SMMUEventInfo {
>
>  #define EVT_Q_OVERFLOW        (1 << 31)
>
> -#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 , v)
> -#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 , v)
> -#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
> -#define EVT_SET_SID(x, v)               ((x)->word[1] = v)
> -#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
> -#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
> -#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
> -#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
> -#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
> -#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
> -#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)
> +#define EVT_SET_TYPE(x, v)  ((x)->word[0] = deposit32((x)->word[0], 0 , 8 , v))
> +#define EVT_SET_SSV(x, v)   ((x)->word[0] = deposit32((x)->word[0], 11, 1 , v))
> +#define EVT_SET_SSID(x, v)  ((x)->word[0] = deposit32((x)->word[0], 12, 20, v))
> +#define EVT_SET_SID(x, v)   ((x)->word[1] = v)
> +#define EVT_SET_STAG(x, v)  ((x)->word[2] = deposit32((x)->word[2], 0 , 16, v))
> +#define EVT_SET_STALL(x, v) ((x)->word[2] = deposit32((x)->word[2], 31, 1 , v))
> +#define EVT_SET_PNU(x, v)   ((x)->word[3] = deposit32((x)->word[3], 1 , 1 , v))
> +#define EVT_SET_IND(x, v)   ((x)->word[3] = deposit32((x)->word[3], 2 , 1 , v))
> +#define EVT_SET_RNW(x, v)   ((x)->word[3] = deposit32((x)->word[3], 3 , 1 , v))
> +#define EVT_SET_S2(x, v)    ((x)->word[3] = deposit32((x)->word[3], 7 , 1 , v))
> +#define EVT_SET_CLASS(x, v) ((x)->word[3] = deposit32((x)->word[3], 8 , 2 , v))


Oops. I'm a bit embarrassed I didn't notice that in code review...

thanks
-- PMM
