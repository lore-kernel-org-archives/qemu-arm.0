Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp712141wrt;
        Fri, 4 Jan 2019 07:20:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6peHJvRDGVqxebtoXtJ36j4ggJuXbqxlUwV71gK60W1K/fLRv8Ezqf7e4903j3XiontfnJ
X-Received: by 2002:a37:6584:: with SMTP id z126mr46202243qkb.295.1546615229007;
        Fri, 04 Jan 2019 07:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546615229; cv=none;
        d=google.com; s=arc-20160816;
        b=GFkYsLuhK65azp741a+FDHEgIuym1/bjhxtCoVtxzPHnh16/Y75RBoVRSPsdZiiwuf
         yUrhy+hAz8kZhrzG4A2T9heEcMup4dW8V6rj5KlOBqQpQ2nQpkwR8W848b0RmClogZFH
         d9nG4m4CYPuT+r1CZVKzafYgC36KMS8IE3I6JQWBvCGl3eAfbQwm5DoVKNBLX+pPDPCS
         us6HyWKJXS1OqJ4aPvH6Ip8sDBEEtt6IM1AcudT0qXPshPeWwCqZmxUGbe/Q2AKi5b7b
         LVpnMRnZnqAZ/CZNQsgpvLPRcjh6foh0hxcQqJaKiwgIu9xg9aaXRH8IkrwXJ5hoAPuC
         u8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IOxVdg6C0gGbEe1IeCt1xuR4HKxSyqPvzjfsDKLvnA0=;
        b=jfQHyefXHdJ3nD43ZG/r218uaR9Izb/JVPYDX2p/K2CYzWw+slYNoY+QciPsRwFH6/
         cN7Xi36mywmKg3NMJZHlqbUt3VLpGUgD+xH0lXanyqYFl08zuhYbGuPIng9sawlaCxrp
         jq68OMChuoBIgpMtyAas+OdfT9soTNwbR/aer7xR6RPFwjju2WjxbE/m4rg2dQNXi44H
         likWZFN00VoosJOHNBaAPRR7PHahOX0942Mkr57eX1C1AHkutysODfnMXNaU82ryBxT7
         S401abtHdEvmHeK1JJmjHJuxFLBpyVNLuc7ZWg4WjUjXNBRH/onaWACcEsiABsK/O1v3
         QsSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iWW+J094;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t38si5184113qth.297.2019.01.04.07.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 07:20:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iWW+J094;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfRGu-0000n3-Eb
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 10:20:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfRFy-0008OM-Ob
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:19:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfRFx-0000c6-Di
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:19:30 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gfRFt-0000Xw-5i
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:19:25 -0500
Received: by mail-oi1-x244.google.com with SMTP id a77so30590120oii.5
	for <qemu-arm@nongnu.org>; Fri, 04 Jan 2019 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IOxVdg6C0gGbEe1IeCt1xuR4HKxSyqPvzjfsDKLvnA0=;
	b=iWW+J0944r1OfrUBsR2knpNc45+f2BpOSjUceSNww5B1kFCxl5Ycsx8cRJVQfkSB3d
	48Gy1AYd06tCT7vMS1d9rl7fuinBbeFf5TV9j5ESo2DOgCZ1nzdxUyRGEmlb1IDcPyJ7
	FDt+f4oAK+2FbDe+MDHDoWWxxzjC+aCKrgNtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IOxVdg6C0gGbEe1IeCt1xuR4HKxSyqPvzjfsDKLvnA0=;
	b=Cte3sIq59jGrAVXAzNA0Hqc8J2LaM2DCSxKkQ2wH6LxTFMn5aclz26D1XpEFJ9WZhn
	A7eYvi8X3Qy8fE60axkjpuiZqPI7RFfpBIKnwMmkeSNysFjaYB0Lt82gy+K90947nPPe
	9aImXW8Z7TqLjDfj2D60ZfjusiWkxjs7h//f7D5m+yDq4hFB0o+UDrlXE2G0PnKah0Zo
	N91MpM8BoeaT28/9nRdBVOYb8PhTZpNcsk19rj4xfv4NCZXD9Qi7ciqzNXZMAfYAm8QU
	OuKeYMkUVZs+B94yWC4swo5PbRJ8n/F0S3EjmA/0E44og8iWAXSqR4NoXdd9XWPvWTjp
	7HFw==
X-Gm-Message-State: AJcUukcqVkJp7TntmHKWsI8et5WMAEZiXxG5H30+mCaQiZN8/Jp9MidU
	/W9dTt+AZwHshbWJyyci5mZavIsAHnjjUVosLDu+py0N
X-Received: by 2002:aca:5c05:: with SMTP id q5mr1290998oib.146.1546615161292; 
	Fri, 04 Jan 2019 07:19:21 -0800 (PST)
MIME-Version: 1.0
References: <1546433583-18397-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1546433583-18397-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 15:19:09 +0000
Message-ID: <CAFEAcA9wbunFqSobxU49dtOm=ajgcraxHV5NqKHeNtHsiccgYw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add ARM-related files for
 hw/[misc|input|timer]/
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPNT4C9P4+WC

On Wed, 2 Jan 2019 at 12:53, Thomas Huth <thuth@redhat.com> wrote:
>
> Some of the files in hw/input/, hw/misc/ and hw/timer/ are only
> used by one of the ARM machines, so we can assign these files to
> the corresponding boards.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>


Applied to target-arm.next, thanks.

-- PMM
