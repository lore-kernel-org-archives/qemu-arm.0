Received: by 10.25.77.65 with SMTP id a62csp326276lfb;
        Fri, 27 Jan 2017 08:53:24 -0800 (PST)
X-Received: by 10.200.54.86 with SMTP id n22mr9449415qtb.254.1485536004575;
        Fri, 27 Jan 2017 08:53:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q94si3908282qtd.118.2017.01.27.08.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 08:53:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX9m5-0002XF-S3
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 11:53:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9jp-0000Yn-3I
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9jo-0006Sw-86
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:01 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:35921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cX9jo-0006Sh-2c
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:00 -0500
Received: by mail-ua0-x236.google.com with SMTP id 96so208989697uaq.3
	for <qemu-arm@nongnu.org>; Fri, 27 Jan 2017 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8nT/YVgTm/znthGiXRlmQ4XOjTqfV07GtvuffpsaM0Y=;
	b=iIQG0fZJwclizVfy3y1PGZJSHvMTmWrrKxClplBdIKe/2S8KH8vbXVTpgGNwSsuWhs
	AudjzVAutwhJ10tKjwiG0MZteBF49iUDidQNJT1eyfQ18zpS9yKnSbV2w0iBNFVY88M/
	r7r4Z4sGVn2BR8/z+33N6LJJWIEwdDAjfoTt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8nT/YVgTm/znthGiXRlmQ4XOjTqfV07GtvuffpsaM0Y=;
	b=PSae/ZMFlHdqdYiAt05i2J1XRvXkpm9x4FKnET0eYFWaKC8pMhYaENo7IieD9y66sg
	oW/Nl33MDiL7cyrJWi2TxZL8p35B5jxYI/NgflzIhe+jQkLUt2XoXSKudRkayWif5i4n
	wMCD2QV89jhYtvjbbKfVlkIoFfNjxevFHXVtxAYq5isGSapMRtgHsitu23pM47XXPikw
	PGz45kufwO/PNGnIv6tqd86pjKs7G1bi/Lq7wmd5bvrgAPgbfNnsZwYAQW3RHA4q1NN8
	32/j7PQCb1NgeHS+zN4rL+I/SZX6mSQlxLqN2+eEcgcNSJrbitK11lLMT5AHrpwfR2ZA
	26Sg==
X-Gm-Message-State: AIkVDXLXo5JnmbfIoRZoKUBj4+7nVxxC93hzx93S4YTsQwXdioWwmSlz+YxOYxp7WZjMl0KvREegplGvXEcUMr53
X-Received: by 10.159.37.1 with SMTP id 1mr5014905uaz.2.1485535859260; Fri, 27
	Jan 2017 08:50:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 08:50:38 -0800 (PST)
In-Reply-To: <1485534415-20887-1-git-send-email-mst@redhat.com>
References: <1485534415-20887-1-git-send-email-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 16:50:38 +0000
Message-ID: <CAFEAcA8nM2LEz+MVv2sDkzOMW4k459CQFyxN=wiPc=at0XfUgA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [PATCH 1/3] arm: better stub version for
 MISMATCH_CHECK
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
X-TUID: xSx5WnRPW2ns

On 27 January 2017 at 16:27, Michael S. Tsirkin <mst@redhat.com> wrote:
> stub version of MISMATCH_CHECK is empty so it's easy to misuse for
> people not building kvm on arm.  Use QEMU_BUILD_BUG_ON similar to the
> non-stub version to make it easier to catch bugs.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  target/arm/kvm-consts.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
> index a2c9518..06b6c92 100644
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -21,7 +21,9 @@
>  #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(X != Y)
>
>  #else
> -#define MISMATCH_CHECK(X, Y)
> +
> +#define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(0)
> +
>  #endif
>
>  #define CP_REG_SIZE_SHIFT 52

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
