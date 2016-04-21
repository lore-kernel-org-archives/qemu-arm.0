Received: by 10.25.208.194 with SMTP id h185csp142570lfg;
        Thu, 21 Apr 2016 05:14:46 -0700 (PDT)
X-Received: by 10.140.30.247 with SMTP id d110mr16583994qgd.43.1461240886197;
        Thu, 21 Apr 2016 05:14:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si204228qks.215.2016.04.21.05.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 05:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atDVN-0001yA-Le
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 08:14:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDVJ-0001qy-Qo
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:14:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDVI-0002tp-MS
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:14:41 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDVI-0002tY-4y
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:14:40 -0400
Received: by mail-vk0-x230.google.com with SMTP id t129so95574464vkg.2
	for <qemu-arm@nongnu.org>; Thu, 21 Apr 2016 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttjuGs1zB7ayy4n8jJjjvtB9QtsxCQ2//0f3m0iL6Ys=;
	b=U44IzJ1NFjCGMSmZ0cRdhPox0qXO+C476SgcT5NziNcL2jt/d0CY9OLGH7pfTpKsuX
	CVQPalbXuEkNtJIP+3Qd3khD9fC+j9hg11L7o5YVHAkeVEltdR+H9UpZoQcTWtpyJots
	snOLq11j3uZ8x9KEI8Ev5uQe4fUafFp9GDKOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttjuGs1zB7ayy4n8jJjjvtB9QtsxCQ2//0f3m0iL6Ys=;
	b=H3zlFW2qQhWwtDTeCOJFfk75pWiHh3flTR9st8kFvSNdRtnppBBw+cmNm3tJdju7my
	aI7e1h4Y0m/yKsr4YGBE3b39hCSbKQSzD0XnXzeTD+Ff+IigF3aQ6A6aIIXLcXG4ot5s
	QgR3jiB2iMPYv683Up0qY+pisDGUMzcysokiPH+0FjVpW/PLEMtvVyxJDUT5Xz0vGXcd
	shyauLz13EAiZky+xKR2Q61FwYSV89IQbMeSaKlaU3B5KagfwYfG3fiuUPIyNkB/g4IA
	NDSZDmCrB0F7aGuCNCB5g2q4NdY/gsoOtAvOvatX4we/pqOKnVJkHvoJZjHUj6MjxCUw
	e+PA==
X-Gm-Message-State: AOPr4FXmqgqikulyHupk2VSqk7QB1EYGDzwsfdEDOiK+pR6qRdykQo/59lyzYmB2yB0N3F5QwuWBm9mfzvh9/Vxg
X-Received: by 10.176.0.204 with SMTP id 70mr7880801uaj.4.1461240879527; Thu,
	21 Apr 2016 05:14:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 21 Apr 2016 05:14:20 -0700 (PDT)
In-Reply-To: <1461188128-1107-1-git-send-email-sylvain@sylvaingarrigues.com>
References: <1461188128-1107-1-git-send-email-sylvain@sylvaingarrigues.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 13:14:20 +0100
Message-ID: <CAFEAcA-Dzrdr-WbbHk06v3GJAe6Ah2hFTn8C=YX0M_q+ScBh7A@mail.gmail.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH] Fix the ARM bootloader so that r0 is always
 0 before jumping to the kernel entry point
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +91tTEclwnyi

On 20 April 2016 at 22:35, Sylvain Garrigues
<sylvain@sylvaingarrigues.com> wrote:
> Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 5975fbf..5876945 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -68,7 +68,7 @@ static const ARMInsnFixup bootloader_aarch64[] = {
>   */
>
>  static const ARMInsnFixup bootloader[] = {
> -    { 0xe28fe008 }, /* add     lr, pc, #8 */
> +    { 0xe28fe004 }, /* add     lr, pc, #4 */
>      { 0xe51ff004 }, /* ldr     pc, [pc, #-4] */
>      { 0, FIXUP_BOARD_SETUP },
>  #define BOOTLOADER_NO_BOARD_SETUP_OFFSET 3

Applied, to master, thanks. (I expanded the commit message a bit.)

-- PMM
