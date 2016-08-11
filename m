Received: by 10.25.21.156 with SMTP id 28csp58661lfv;
        Thu, 11 Aug 2016 03:51:10 -0700 (PDT)
X-Received: by 10.237.37.99 with SMTP id w32mr9857874qtc.59.1470912670869;
        Thu, 11 Aug 2016 03:51:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si1216466qtr.34.2016.08.11.03.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnZu-0000YW-BB
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnZr-0000YK-Ee
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnZp-0006mA-FT
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:51:06 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:36454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnZo-0006lr-Io
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:51:05 -0400
Received: by mail-ua0-x22d.google.com with SMTP id 97so113503212uav.3
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QdJvzvvioklk14X4d5BP1k28fBVEOy7ji5VOWh0B9Lc=;
	b=RaAbHtKg+NwXhrUNb1T0jP5upPrSH1De8imW/XocyLfz+GpQIu4cnFNkoEDZX5wSxg
	CahYETEO6/3yl0c8fhorjlcLBK+opYyTCh12tg4WTYsABUu4MoVOtTGzkWSc1HwPU3WP
	5xMgPKgy6sZlFIo22Ch7yaZLPgWTSuLdCOCuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QdJvzvvioklk14X4d5BP1k28fBVEOy7ji5VOWh0B9Lc=;
	b=KF6fXl86Illa/T1iDp6OIIbQzrh2VvXkvPJWl60WtQszPo+vjtINOXNC3mKz2PVKMl
	C/FBkUlVE9OotT56zx6YLPAuDlBUNE/Bne5dL6BD9KK/785OG7RKG26hxzJmEsnjpoin
	wn3GSErKL/GU1qVnpjacLLtflIaLPcwLnAWfEUkdJy4zP7RC1+ZRrW29OHlDU77xDHc4
	5/zzi6vBcKDodV7+6Pgx7U47cXN37BYlNwJnSKuBaWuH/a1Wp4qyWtH89fiIdDwz7xvx
	WJP453Z+a/ZA1MFILI0/lP6RhA3afIK8ThmjUDWlrDSwul4nsXkVxwY2mLiAcAKy8qmf
	9zmQ==
X-Gm-Message-State: AEkoout3rqdWhzmKGI7pXqI6jDN7DQxq823j2cCXh6qqagumvbzC2guhL7oP0bly7nlrtz65iycp6Zi+3Q0wGjF7
X-Received: by 10.31.81.199 with SMTP id f190mr3554792vkb.139.1470912664138;
	Thu, 11 Aug 2016 03:51:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:50:43 -0700 (PDT)
In-Reply-To: <20160809190229.27871-5-bobby.prani@gmail.com>
References: <20160809190229.27871-1-bobby.prani@gmail.com>
	<20160809190229.27871-5-bobby.prani@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:50:43 +0100
Message-ID: <CAFEAcA8HiOvUjK46NdDuUJd4hqzXMuF+M6XHhk_XDCw-5E+fgQ@mail.gmail.com>
To: Pranith Kumar <bobby.prani@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [PATCH 5/5] target-arm: Fix warn about implicit
 conversion
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfA760/uI4tt

On 9 August 2016 at 20:02, Pranith Kumar <bobby.prani@gmail.com> wrote:
> Clang warns about an implicit conversion as follows:
>
> /mnt/devops/code/qemu/target-arm/neon_helper.c:1075:1: warning: implicit conversion from 'int' to 'int8_t' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
> NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/devops/code/qemu/target-arm/neon_helper.c:116:83: note: expanded from macro 'NEON_VOP_ENV'
> uint32_t HELPER(glue(neon_,name))(CPUARMState *env, uint32_t arg1, uint32_t arg2) \
>                                                                                   ^
> /mnt/devops/code/qemu/target-arm/neon_helper.c:106:5: note: expanded from macro '\
> NEON_VOP_BODY'
>     NEON_DO##n; \
>     ^~~~~~~~~~
> <scratch space>:21:1: note: expanded from here
> NEON_DO4
> ^~~~~~~~
> /mnt/devops/code/qemu/target-arm/neon_helper.c:93:5: note: expanded from macro 'NEON_DO4'
>     NEON_FN(vdest.v1, vsrc1.v1, vsrc2.v1); \
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /mnt/devops/code/qemu/target-arm/neon_helper.c:1054:23: note: expanded from macro 'NEON_FN'
>             dest = (1 << (sizeof(src1) * 8 - 1)); \
>                  ~  ~~^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix it by casting to appropriate type.
>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  target-arm/neon_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
> index 1f1844f..ebdf7c9 100644
> --- a/target-arm/neon_helper.c
> +++ b/target-arm/neon_helper.c
> @@ -1051,7 +1051,7 @@ uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop
>      if (tmp >= (ssize_t)sizeof(src1) * 8) { \
>          if (src1) { \
>              SET_QC(); \
> -            dest = (1 << (sizeof(src1) * 8 - 1)); \
> +            dest = (typeof(dest))(1 << (sizeof(src1) * 8 - 1)); \
>              if (src1 > 0) { \
>                  dest--; \
>              } \

A bit ugly but I guess it works. (The code is
deliberately setting dest to "most negative integer
that fits into src1 type".)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
