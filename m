Received: by 10.25.21.96 with SMTP id l93csp1132796lfi;
        Fri, 24 Jun 2016 09:29:53 -0700 (PDT)
X-Received: by 10.237.44.165 with SMTP id g34mr5971606qtd.17.1466785793058;
        Fri, 24 Jun 2016 09:29:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c28si1475270qkh.112.2016.06.24.09.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTzM-0006vB-EI
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:29:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bGTfY-00089f-38
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bGTfV-0001bA-Uf
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:09:23 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1bGTfS-0001aK-CS; Fri, 24 Jun 2016 12:09:18 -0400
Received: by mail-oi0-x242.google.com with SMTP id s17so19118392oih.1;
	Fri, 24 Jun 2016 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZBM4JvZgbxcL98g10UNw3K2HMP/uHSM1dYApwU5mMho=;
	b=x1me465gRSecyH+0y8DT5A0NRmzEV81b4Ud/fIyi15LddNt1UUab1dfKATwa7xYjDP
	qF5LYeyBbUGTCmbGAIDRsUQtq/Dxq9izChJ7x1oA7BGuVsXjq54FQSBN/GyTgQu6eoly
	aSKWrHJZieq8iQM8CL2N0zobxktNQYbPy/DirAgfBbsb2rDvF0owhL+MkAMRE2InuWSW
	P7hypOxDPnjuoiDPyxEqbqmzRgeNJfJt5lQdIz/DlvLYnP8s3rES06cEogTL6qTFLtDW
	XQNldWeoztJh1eXfCSpfUpxyZ5UmQW5Gt92ICMjHE6fJhj7L2u6GYNnrZla0dpGcwv7H
	VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZBM4JvZgbxcL98g10UNw3K2HMP/uHSM1dYApwU5mMho=;
	b=C2OoAOmhUbyN2ixFP3mgrtw1xJ9fgxohdDdR1HNJgzUTVbnAmYNV+8FyzlPNpEUmSi
	SXZgU223KR9fHMflw9i8i/1pgijO1PaieX9sv/knmKf/TvQWoaYBfjKzhjdal5Ksf3bm
	zITSYi6LY/WHQ3CFZ9yd7k7WLUpvOPfbMGRlxEaMsDWyidTGtAZiBcADL/2UiiZTk+re
	M/i2qq10zRYhWp5HeIQqtY2B6DKAh5/d8h3V6pKeo0QcLyEM1FkZ+NNaVQu5N2XYdh5c
	rX/v5+chAyyP53Q9my4BH14HVVsSaCNvlsxDuRgRY+4q4yHH4EFR62qMgiJERJJXI94j
	mskA==
X-Gm-Message-State: ALyK8tI+7g3fPtCMBpweA0RGp1fx275SenownHNW4nOsJFe7Ku6CdO+qWOQdTAa1djVyUUJc9jtmx3Qnbntw2Q==
X-Received: by 10.157.29.236 with SMTP id w41mr3296855otw.44.1466784557835;
	Fri, 24 Jun 2016 09:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.161 with HTTP; Fri, 24 Jun 2016 09:09:17 -0700 (PDT)
In-Reply-To: <1466783381-29506-3-git-send-email-peter.maydell@linaro.org>
References: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
	<1466783381-29506-3-git-send-email-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Fri, 24 Jun 2016 18:09:17 +0200
Message-ID: <CABoDooN=17nBE0oMVmi_KN2RGN-jC6LGrRyp2s0hT4ed-tbgKg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 2/2] target-arm/arm-semi.c: Fix
 SYS_HEAPINFO for 64-bit guests
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
Cc: Tsung-Han Lin <tsunghan.tw@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bua9gyEd1lCR

On Fri, Jun 24, 2016 at 5:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> SYS_HEAPINFO is one of the few semihosting calls which has to write
> values back into a parameter block in memory.  When we added
> support for 64-bit semihosting we updated the code which reads from
> the parameter block to read 64-bit words but forgot to change the
> code that writes back into the block. Update it to treat the
> block as a set of words of the appropriate width for the guest.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/arm-semi.c | 47 ++++++++++++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
> index 8be0645..d50726f 100644
> --- a/target-arm/arm-semi.c
> +++ b/target-arm/arm-semi.c
> @@ -564,8 +564,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>          }
>      case TARGET_SYS_HEAPINFO:
>          {
> -            uint32_t *ptr;
> +            target_ulong retvals[4];
>              uint32_t limit;

I think limit should also be converted to target_ulong.

Thanks,

Laurent

> +            int i;
> +
>              GET_ARG(0);
>
>  #ifdef CONFIG_USER_ONLY
> @@ -587,30 +589,33 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>                  ts->heap_limit = limit;
>              }
>
> -            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
> -            if (!ptr) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> -            }
> -            ptr[0] = tswap32(ts->heap_base);
> -            ptr[1] = tswap32(ts->heap_limit);
> -            ptr[2] = tswap32(ts->stack_base);
> -            ptr[3] = tswap32(0); /* Stack limit.  */
> -            unlock_user(ptr, arg0, 16);
> +            retvals[0] = ts->heap_base;
> +            retvals[1] = ts->heap_limit;
> +            retvals[2] = ts->stack_base;
> +            retvals[3] = 0; /* Stack limit.  */
>  #else
>              limit = ram_size;
> -            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
> -            if (!ptr) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> -            }
>              /* TODO: Make this use the limit of the loaded application.  */
> -            ptr[0] = tswap32(limit / 2);
> -            ptr[1] = tswap32(limit);
> -            ptr[2] = tswap32(limit); /* Stack base */
> -            ptr[3] = tswap32(0); /* Stack limit.  */
> -            unlock_user(ptr, arg0, 16);
> +            retvals[0] = limit / 2;
> +            retvals[1] = limit;
> +            retvals[2] = limit; /* Stack base */
> +            retvals[3] = 0; /* Stack limit.  */
>  #endif
> +
> +            for (i = 0; i < ARRAY_SIZE(retvals); i++) {
> +                bool fail;
> +
> +                if (is_a64(env)) {
> +                    fail = put_user_u64(retvals[i], arg0 + i * 8);
> +                } else {
> +                    fail = put_user_u32(retvals[i], arg0 + i * 4);
> +                }
> +
> +                if (fail) {
> +                    /* Couldn't write back to argument block */
> +                    return -1;
> +                }
> +            }
>              return 0;
>          }
>      case TARGET_SYS_EXIT:
> --
> 1.9.1
>
