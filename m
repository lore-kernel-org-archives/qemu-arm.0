Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4885094wrt;
        Tue, 5 Feb 2019 07:20:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZyG5mfGTbZpjPE7cmqHCtKXcWoPaLyYNghVuR5aZmZkqNauPkkZYM5JfLg8by0Wk6Vz4Kf
X-Received: by 2002:a0d:f881:: with SMTP id i123mr4346360ywf.453.1549380006107;
        Tue, 05 Feb 2019 07:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549380006; cv=none;
        d=google.com; s=arc-20160816;
        b=xkuFRHkSfYOZeK3hQbD2xHjJ9L3AFkKXE9vvfHqBKuqNmOLEX1TL4iFDhhwLIAi3Ko
         G3kcYjae/HQj0FAgmdXhgt60d2DWfexhlPbjnjlfYh8hjdavRYZBRWULcpOZfNho0TFc
         QiGK+CBTQbdFjsfiDAf+VNNiTs73RZSvY5qoqpGLEuPdQFxMJK8FkksNkRrqHUvNp43K
         tubBZO3cnwn3CbMm1IOxZt88iL81oGbYKy+nHUPEKIBHosp0aDnvt6grmQgv7nmd3XO0
         qehYla/FBSR6BF80xfNt0InekX9ecyQl6MSFwWrwDL/k3cKaz0td4zwzXU637Fxn1cOr
         zy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=+/T5NMpeztmmaqtBVAHSVqLjiwXtoSGGVi2yg+yIVCY=;
        b=BqxxnGT71o9hzKwdqYaSvE+1XEafby3hzBLSLjThXlm4eMb40qYbapcPUrE3mhXG6a
         iAdxdk0/B8RCiAG/8tgD9Qy6QlJSbmTeH34yk8DjphPBkPYEgiUYzMjYtvkp/K5kXyoc
         0Kjnl7L64kTbprw9hcC80LS9i/x3lKml8MkL3S9h3FBs43mbvwVnIYC/rzqpi5NTBYQy
         GUc5ddBhf5CmmKikyJvc5u8b7fAu7QLMezjVoJK6obp1r3VLu0ChbGk98o2JCLW6tai7
         GWTDVXYXaOTJ3tSJ5rJizk4pOl9DE6KYI2STsIUSEzG9e340WQy3yAkA5cUiaDKINalv
         ixQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si2071464ybl.84.2019.02.05.07.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 07:20:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr2W5-0004e6-Gt
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 10:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gr2Uz-00044k-8A
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:18:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gr2Uu-0007ZW-8X
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:18:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:6809)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gr2Ut-0007Bi-EQ; Tue, 05 Feb 2019 10:18:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C07F3C52;
	Tue,  5 Feb 2019 15:18:20 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-31.ams2.redhat.com
	[10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8676868D2A;
	Tue,  5 Feb 2019 15:18:18 +0000 (UTC)
Date: Tue, 5 Feb 2019 16:18:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190205161815.1182dc5c@Igors-MacBook-Pro.local>
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Feb 2019 15:18:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] hw/arm/boot: Support DTB
 autoload for firmware-only boots
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ifv+PbVmf/S7

On Thu, 31 Jan 2019 11:22:35 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> The arm_boot_info struct has a skip_dtb_autoload flag: if this is
> set to true by the board code then arm_load_kernel() will not
> load the DTB itself, but will leave this for the board code to
> do itself later. However, the check for this is done in a
> code path which is only executed for the case where we load
> a kernel image file. If we're taking the "boot via firmware"
> code path then the flag isn't honoured and the DTB is never
> loaded.
>     
> We didn't notice this because the only real user of "boot
> via firmware" that cares about the DTB is the virt board
> (for UEFI boot), and that always wants skip_dtb_autoload
> anyway. But the SBSA reference board model we're planning to
> add will want the flag to behave correctly.
> 
> The first four patches in this set are just refactoring,
> splitting the code in arm_load_kernel() out into a
> couple of sub-functions for "direct kernel boot" and
> "firmware boot". The last patch that fixes the issue is
> then just a one-liner. (Without the refactoring we'd
> need to use a goto, which is what I wanted to avoid.)
> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>   hw/arm/boot: Fix block comment style in arm_load_kernel()
>   hw/arm/boot: Factor out "direct kernel boot" code into its own
>     function
>   hw/arm/boot: Factor out "set up firmware boot" code
>   hw/arm/boot: Clarify why arm_setup_firmware_boot() doesn't set
>     env->boot_info
>   hw/arm/boot: Support DTB autoload for firmware-only boots
> 
>  hw/arm/boot.c | 166 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 96 insertions(+), 70 deletions(-)
> 

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
