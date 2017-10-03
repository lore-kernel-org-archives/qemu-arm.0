Received: by 10.223.197.9 with SMTP id q9csp4662589wrf;
        Tue, 3 Oct 2017 09:25:15 -0700 (PDT)
X-Received: by 10.55.137.199 with SMTP id l190mr13037893qkd.156.1507047915183;
        Tue, 03 Oct 2017 09:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507047915; cv=none;
        d=google.com; s=arc-20160816;
        b=hSWJrlA0JLDLCknPCT2rEkt2pGkDp2NQta5Cw8Us5rqYjwqSjiqWdsoAYf/eM6IeTb
         NwQPwWJK/UHyRXPkIJ6A5tVwaYw59/PoW26xY7JCc6mec5Ie2ObEhGs3+zfaKx+QkKSp
         oAnW7Jw+3Sihnsuzfcy9x82mmI2An9Ea5hpWhhjKWE/3H8LumYIn/OdoZj8bmzW6pPwL
         GGGvi9a1O0FrgX76HrdKfoV8sQsCZYmgmgdLHyekoUzXaf0SnBzg+H7VLmD1KUutIVEp
         +9lkDmA4muZ5V0BraXNxvX3QQdGGJnhz9YLW4PeQiQZJSYaNi8BCgn8CcRes9CKaZGPI
         R6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZTFyFjfO8lpbSBWQg33ZnxiZldPp4gpNOdEkG+0e3/g=;
        b=04JjWxfD7D/7jEfC8y85pLvcSRHJfjuibRNDhk0/XPPNM4J73l/ShMKW6+ULwIWj7C
         znrQa2RzK0sJAQGDv9oGwRuP0nNcIB6Dvy+LC7apPmOejfRN+aAMRTHIJUfcYrAAXvNh
         rqzsjdt+YvnH2VWy6XRUCdgfW/bwHp36Y/nyH75yYiP6DGpGDzm/4jNoG+zlba7P38r+
         Nq8ioSQva1kXmax+8Dgn4opzDULfQ4a74Y02iiAc7iRvRMdl+54TqUEZeYFSKMwy/ajn
         G8plqZSGbW4yHz/ckalYN8MLCtcuu8r+qxZYoYMnaIJpwlbAQrgUoifaQjcHymybkbWl
         BbvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvAXzVBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si267155qkd.350.2017.10.03.09.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Oct 2017 09:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvAXzVBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzQ0Q-00031a-LV
	for alex.bennee@linaro.org; Tue, 03 Oct 2017 12:25:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzQ0J-00031Q-86
	for qemu-arm@nongnu.org; Tue, 03 Oct 2017 12:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzQ0I-0003li-6a
	for qemu-arm@nongnu.org; Tue, 03 Oct 2017 12:25:07 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:53118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dzQ0H-0003kx-Uu
	for qemu-arm@nongnu.org; Tue, 03 Oct 2017 12:25:06 -0400
Received: by mail-wr0-x233.google.com with SMTP id k62so6757113wrc.9
	for <qemu-arm@nongnu.org>; Tue, 03 Oct 2017 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZTFyFjfO8lpbSBWQg33ZnxiZldPp4gpNOdEkG+0e3/g=;
	b=CvAXzVBCcp2D71vGmH7+TZVIBfjmvkSnddqmASuaTnAgoobkhVIhMhvwQkMdy3tpyC
	aDL3mAw0cL23G7nE+VND3SUWWKede20qzUrj0ywsvb/xqVCa7uilbbzcW2QDfmeEPtuc
	y++CWOkxhC0YvkCJ/p4OuRAm6e2/1pJkmDLf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZTFyFjfO8lpbSBWQg33ZnxiZldPp4gpNOdEkG+0e3/g=;
	b=bmPkV+YxoSsVjmk0rF2jbKPTUhcKBYMoNLE+9P/yc1x4/Fy9+4OITBGp/bkWgAWyoC
	Xa3d8JXkjcIP9AjtqvDINtockO6OkZ7zGdskJ6d3pX4cv5GK/ViocLA7jPQvui8oE4qe
	8SZpPtoWZsL+/2cEgEPi+ua04qM8KvYzbKRal34DDBqUVbHF8/4wEj2prWEbzO/5FsyI
	OSNiyRRrQrtW8JXyPKCokYAgsfchOXXlRC1vXxeiav4wdqzhqa8S/ZGK+LNKrE2pB4L7
	TaEbbrDVrpSRsCTy5JwA5okhgDbzufrXnoahuqlv/E73X6hBpu/M+97WNMmKdw2XgYkU
	FMlw==
X-Gm-Message-State: AMCzsaWapD3vCdk+QGjYRyCGYNsE+yjooZTDnBzq/auV37pJpfQfSCf/
	ojYHCcwU1ynU8cdpSTaxqBZNfLiwkS/vj3liXDz1Fw==
X-Google-Smtp-Source: AOwi7QBrp/QcMUAFwQh09y7qIpo27C04d6OqfxBWhTzoim19FuA5RMD0kELEaKn5TCXuCwAybSNkgKAyiUFDUfOQPJM=
X-Received: by 10.223.195.194 with SMTP id d2mr966018wrg.173.1507047904778;
	Tue, 03 Oct 2017 09:25:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 3 Oct 2017 09:24:44 -0700 (PDT)
In-Reply-To: <20170708025030.15845-3-rth@twiddle.net>
References: <20170708025030.15845-1-rth@twiddle.net>
	<20170708025030.15845-3-rth@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Oct 2017 17:24:44 +0100
Message-ID: <CAFEAcA9mSQnJCDzPOvf4PsBHx0kPB7CFCLC3AdDv9G0EHrEXXg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] linux-user: Tidy and
 enforce reserved_va initialization
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtWHdo3QVzEY

On 8 July 2017 at 03:50, Richard Henderson <rth@twiddle.net> wrote:
> We had a check using TARGET_VIRT_ADDR_SPACE_BITS to make sure
> that the allocation coming in from the command-line option was
> not too large, but that didn't include target-specific knowledge
> about other restrictions on user-space.
>
> Remove several target-specific hacks in linux-user/main.c.
>
> For MIPS and Nios, we can replace them with proper adjustments
> to the respective target's TARGET_VIRT_ADDR_SPACE_BITS definition.
>
> For ARM, we had no existing ifdef but I suspect that the current
> default value of 0xf7000000 was chosen with this in mind.  Define
> a workable value in linux-user/arm/, and also document why the
> special case is required.
>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  linux-user/arm/target_cpu.h |  4 ++++
>  target/mips/mips-defs.h     |  6 +++++-
>  target/nios2/cpu.h          |  6 +++++-
>  linux-user/main.c           | 38 +++++++++++++++++++++++++-------------
>  4 files changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
> index d888219..c4f79eb 100644
> --- a/linux-user/arm/target_cpu.h
> +++ b/linux-user/arm/target_cpu.h
> @@ -19,6 +19,10 @@
>  #ifndef ARM_TARGET_CPU_H
>  #define ARM_TARGET_CPU_H
>
> +/* We need to be able to map the commpage.
> +   See validate_guest_space in linux-user/elfload.c.  */
> +#define MAX_RESERVED_VA  0xfff00000ul
> +

This should be 0xffff0000, but you'll need the bugfix patch I just sent
out first.

(Why "UL" ? That's usually a wrong choice compared to either U or ULL.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
