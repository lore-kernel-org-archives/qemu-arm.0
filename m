Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2923897wrt;
        Thu, 29 Nov 2018 15:10:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VkOa6Fdkwpih+pfnmxla90gVv/KbN4Ma55AF5c3RfkfmSxoRgyujXloiymd6iVqFKo4ABC
X-Received: by 2002:a25:445:: with SMTP id 66-v6mr3388583ybe.372.1543533041278;
        Thu, 29 Nov 2018 15:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543533041; cv=none;
        d=google.com; s=arc-20160816;
        b=lwcj2+G55WvS7zQpCnLIuDPzGEZCS2jJrVqgItEhqVi8pOQVGUZqklZa89f99F0r28
         nvLahyiaAl0rhTwx5H+IN/IZfe+aVgakSsFTwJw6g8V7Sj0YWKLvjY2dsZ0O1AiprGWR
         OiwwnVwSTvgShpmlWqzzK3JlvrquYH6zDXMGbKBHtP8wVuOSB88kdTGi4QAqS0KqZTiG
         yHQA3rhmVgRVzkrNu6VPO8mGd43sdh8D8OjPiV1D94v8soaVk+OPTkyurBqUlsPUXVBx
         Lm66AMeyepvAxjXC2INbvRr8DUsRHVetsI/lA9wtBwMPIqgqY1VbT3oMuZfcNBf6TVno
         J+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YS4+RYV1o4kCePwodWska7IpCK1I9ayo5KuBjbocmyM=;
        b=aVPH+2cmVnvIYxTOhfrLqDgRB+0ZdxhJmcj3TE3GtUN0Xrt/7ZXfhw3etDpQaqtE8g
         RBwECv0TzmCZAIfytIVeph0plN7AYCrszWeXT1vm83ztj43rR4yepk9yTeuPbZA+zSiB
         X/q2/NTKWf+GsI9HG54UU3/zohpWexbxMy68m7M2AHvhZJ42B7yk6OLDtxwLoYznRExl
         dfPhlmiFUk6Sa06MQ4OcflFPZTagdtZDnaHLSbA/ngPcYcO39LgZ7zVxDVh4vOiLDKgI
         alVHoT3NKaXSa1y+Qw4NXwaYSCkW8Gf9xrP23HsdW9kH/gZ5+iIQ3pxaiVa/IfsV9NDs
         BA+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TZb1ygbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15-v6si2021560ybj.4.2018.11.29.15.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 15:10:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TZb1ygbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSVSC-0001eW-NU
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 18:10:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSVS3-0001dU-8T
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 18:10:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSVS2-00011a-J5
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 18:10:31 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gSVS0-0000zp-PS; Thu, 29 Nov 2018 18:10:28 -0500
Received: by mail-lj1-x241.google.com with SMTP id l15-v6so3289480lja.9;
	Thu, 29 Nov 2018 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YS4+RYV1o4kCePwodWska7IpCK1I9ayo5KuBjbocmyM=;
	b=TZb1ygbBLVDWqPO9PDQpyiOOTX40dZKU+FnOaYKwcl9Ta8SGBUDGzk75ApYwuZAwx5
	n8UZc5/SnulwMY9oxtetm9am8ZEg+fmEu0E1V3bhJvRMAdwrKf43b9xjwXb/C9WO7VA3
	W7V7JyPpTJCN5Hv6xZoRB2JSZg9snGQ4t9kAdS0whcJdD6rxjvx6uReuKBmbpDr+cED6
	dZ03zZ86woQSPB+/6CKDb9o+7ZKBW3kfBqkwX97B91sX0t++YX393TS9Vo69k5F8Bf06
	N4At5yo1W3AP+CW0aCBzdz5Llew90zh0+Y16YMIH/SYD2GSoiqpfx9AK050MaybmA5yB
	Q8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YS4+RYV1o4kCePwodWska7IpCK1I9ayo5KuBjbocmyM=;
	b=Bk+tCoBa31W3E/hcnoN0eYgn2tsH4xxWp5tb/19ZsB4YiSeBDaMdOxFWrEYIjiB5xV
	2fGQsDxOkvAHWquqrgW928FTfuJvIrfjFOP6fYChnGGQb3Y4M2mQw7/t1ryPPWueWl3e
	QQKH+0GCELLCriVXG2wQYSbsRNpvOX1xhsBQxOCm9r26/4LGPfTMd7s6iBXw4JztjbpM
	3h9skVHmUsVywaULapfImCLdTFPowdMna/EgQAES91G+j4xYa8EMn3Kqrir//7FpFo9g
	eR+r2rrVx+lL9m5CdkmXCN3VEkuaVVnwBMu6SLH1rQQqX8hSf4JVidr7sASU+6uvJXlU
	k7pQ==
X-Gm-Message-State: AA+aEWZJHO38+u6ZhcsCnMmwnpeyb01vhg9TL+i4N7b3nHDF0RMTjYIL
	1vKXKwNl/7R9YiT9PVyUc1fiHw8foGSfyzQUXWI=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr2318087lji.145.1543533027323; 
	Thu, 29 Nov 2018 15:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
	<20181129163655.20370-5-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-5-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Nov 2018 15:10:00 -0800
Message-ID: <CAKmqyKOKwuBpdq-xWwmpGK0eTapX2QR8mYcWw09ESgTtZO1sQA@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 4/4] hw/arm: versal: Correct
 the nr of IRQs to 192
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>, muhammad_bilal@mentor.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQAL4WyfaasX

On Thu, Nov 29, 2018 at 8:40 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Correct the nr of IRQs to 192.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/xlnx-versal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 76fb9de391..ec7c859d08 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -22,7 +22,7 @@
>  #define XLNX_VERSAL_NR_ACPUS   2
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
> -#define XLNX_VERSAL_NR_IRQS    256
> +#define XLNX_VERSAL_NR_IRQS    192
>
>  typedef struct Versal {
>      /*< private >*/
> --
> 2.17.1
>
>
