Received: by 10.223.197.9 with SMTP id q9csp4721176wrf;
        Tue, 17 Oct 2017 08:28:52 -0700 (PDT)
X-Received: by 10.55.18.165 with SMTP id 37mr18364123qks.352.1508254132898;
        Tue, 17 Oct 2017 08:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508254132; cv=none;
        d=google.com; s=arc-20160816;
        b=b1SmOfmzcDga4IvzCt3WYPxuo6HBu6nBqDShhaS9rxv6oQ/MJRL0Ho8s7Of+3HIKhX
         76oA1xUbBp5HtwHNAm46SPOdmNm8V6K4jKYqgWZ4Ae6GE+RrOhcjTHEfQOAkeEn3bmDo
         QM+J4B8C05EEzBG+26d8HIr7RZSE0n2c5wytQPAaN+nlWP2sCzMYcoy0HubYLwEa6IG/
         NExle3SRCP1Pb/4hyLHoJBlLh4L/NBCwkyQzibObVWELyTl7ZW5B8u8Qgea+iMmc2/sv
         RbfQBnrG1Jvz6YRbnz1uvP9obhO/tAcezYO8/ZJh/tf9VEk6nGzLPhAdgI0yZlBn0DKp
         F+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=z83FM0TB2pdrz4mKbxn8/kVR/dR6x0CLNpVDhkJlaLc=;
        b=Y6CVOaovn/EMFBHFgCZ/BSriFBKEGvRGOTy/pMr4GQfVSNNGYcsqHKCUfwnQnZyYqX
         YEcmVz7LY+O1V6zcmABWuWq04/06IAkkSgmis/84kC3gKGyA71mkydxOzmlgYrWj1JlX
         WWMb3Dw/yhGKWml3sK+lyjmwJEOun7r4oTdyFPVZ27b0ZcdZeCDlrQnUckFspaDJR3ns
         LHv583+h+imG9eapezaJO5AHr+ETpNvV6ghrsZlR+KQQ3MBMp7S1Vgy7fr8O0ikSEzjs
         PqnsabtQ87EonZROCunsHSzcRLb/ThL/x/Trkj5gkmMvjFzSj5dIHVzRX179T8c7ulUK
         1ZkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmw+pXS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e26si1937354qkj.323.2017.10.17.08.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmw+pXS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TnW-00012R-Jy
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:28:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TnK-00010f-Du
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TnJ-0001Le-H8
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:28:38 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:45693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4TnJ-0001LH-9R
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:28:37 -0400
Received: by mail-wm0-x22d.google.com with SMTP id q124so4675573wmb.0
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z83FM0TB2pdrz4mKbxn8/kVR/dR6x0CLNpVDhkJlaLc=;
	b=fmw+pXS+pBhWMe8hI6IQaKiMK9/N+LP+hjAW0Y+3wAK7kez9k6Fe6LkNiGxi6w7lU2
	ENTzYsDmPogAbZvEe+Wg4XH9zQz7JkC3RXB3cZbMYHpCBG3/Hsw4kDH2gCT02TMLys98
	Mm0qjsI0ewgn5zxEDu6J1rIU1qg/VqtPgthLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z83FM0TB2pdrz4mKbxn8/kVR/dR6x0CLNpVDhkJlaLc=;
	b=qfVcQiD7zPWpVsgJ353lxL8TmkdRXsm5KhExMXZCxZ8lgn9he6nyOEGl/4i2Di1YNT
	Wok88WwJ41FplbJkQwQbVuHg1z6BU6uSLqpzgrL7YkBt7enyiC3dei9Is0GSkjyVidHM
	sCi9FXgsV3TQbbF5MvhMvaK5Pd1l1/LGnxTMr+9XCmwOhCC7La0xaOeoL1g3jdxWSMoq
	TuNSQwLAmcV1o0hqLEz4O7UUL2foi3VYHmQ3UFXsH7B1z5YLI1lSstFBWJKcFxnxlS0P
	EU9UFFo4c+ZHKAiSe2ium1IafwgoyP6PfMBZYJoVzQrY4otfkSuW2HzJPGGFoW28o/dK
	rS+g==
X-Gm-Message-State: AMCzsaXXsCtxtbePURc87z9ewVUhv2zU3zRoLF6UOoYsurj15f4l8bSb
	vnDcczBk+QuVtcwFOeDgAgm/qaZjqXuyAL8iOPf6cA==
X-Google-Smtp-Source: ABhQp+QOAnn7yN12/9cX4FjlIqMwjKgwJW1mNbVDTxRmMRzL9BBS0hlOCJ/j89Uxo6ueTOilJtQ2Gj+gyiBbTo2zMSc=
X-Received: by 10.28.113.196 with SMTP id d65mr3612173wmi.151.1508254116117;
	Tue, 17 Oct 2017 08:28:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 08:28:15 -0700 (PDT)
In-Reply-To: <1508176489-9002-1-git-send-email-sundeep.lkml@gmail.com>
References: <1508176489-9002-1-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 16:28:15 +0100
Message-ID: <CAFEAcA-vg31x5q7f1poJfHfrwKTrHEZo2Btua6o9xREHUzd8hQ@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu devel PATCH] msf2: Remove dead code reported
 by Coverity
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ua/KwRX9RJJ/

On 16 October 2017 at 18:54, Subbaraya Sundeep <sundeep.lkml@gmail.com> wrote:
> Fixed incorrect frame size mask, validated maximum frame
> size in spi_write and removed dead code.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/ssi/mss-spi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> index 5a8e308..1e49cbc 100644
> --- a/hw/ssi/mss-spi.c
> +++ b/hw/ssi/mss-spi.c
> @@ -76,9 +76,10 @@
>  #define C_BIGFIFO            (1 << 29)
>  #define C_RESET              (1 << 31)
>
> -#define FRAMESZ_MASK         0x1F
> +#define FRAMESZ_MASK         0x3F
>  #define FMCOUNT_MASK         0x00FFFF00
>  #define FMCOUNT_SHIFT        8
> +#define FRAMESZ_MAX          32
>
>  static void txfifo_reset(MSSSpiState *s)
>  {
> @@ -106,8 +107,6 @@ static void set_fifodepth(MSSSpiState *s)
>          s->fifo_depth = 16;
>      } else if (size <= 32) {

Shouldn't this just be "} else {" now ?

>          s->fifo_depth = 8;
> -    } else {
> -        s->fifo_depth = 4;
>      }
>  }

thanks
-- PMM
