Received: by 10.25.30.65 with SMTP id e62csp824421lfe;
        Tue, 24 May 2016 09:31:22 -0700 (PDT)
X-Received: by 10.200.33.231 with SMTP id 36mr5022249qtz.81.1464107481997;
        Tue, 24 May 2016 09:31:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n50si3263327qta.12.2016.05.24.09.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FEn-0004IQ-8c
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FEi-0004GU-3s
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FEg-000548-2b
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:31:15 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FEf-00053i-Sh
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:31:13 -0400
Received: by mail-vk0-x22a.google.com with SMTP id r140so29115481vkf.0
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LpKD5kdbl0fyB0OtDvwAaeAV1aJUJuOBR608vVaBmUE=;
	b=eCvZYSk2dn5q3xDmCQLYE3pD+D5Kz7oIFoxHQDMcXvNPnJr05QkvnDqKyx1IQkl3LA
	zy/FIr6r/M8HQ3UzZolpPXnHqRlkinW5+oI4+SHggebQJzxULdbI90sqdeFPzVyG85+/
	gE1GFL/UPZBMmLin0NPa5PLgngGJQUHNfQF0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LpKD5kdbl0fyB0OtDvwAaeAV1aJUJuOBR608vVaBmUE=;
	b=DcpK6DK0tRBj+CvhDH2NZ+pjQHYcPWcKUtGH7FTyVtLUCYsPQ/NzxcAyzzMj6GGTO1
	016AX9guH3KBDdU8Fd8TVg6cd//5yduPFN2cBa2cAcQc3cHGYkR2yJ85e8Dk4gsJMnrZ
	uIq2IeF+Q+g8BCUYAUP4m5X8GHU7tz2lwH7TYuaZBnW8P/xvJsAk2M760trfh3dP/+gt
	5/4/696XL4+gJzMVo3mirxs0bm5cQ3nM1M8L/3h28lrlVsLsjcR6c/zwi9ABQjyKU6qy
	B67/dx60rAmE7IhjhxgtKbZrnhGyCIQh1RaDxpab3kPGd5jZW8g0Ye1LnHj2PSHKxQIN
	Rmqw==
X-Gm-Message-State: ALyK8tK0EH5ds6btOWeH4CS0m0lEg+wAr4E8j0mXkwPaFv3f6bFRVR0vx5bd/SNkrmxw+CKjGNupmxvoE4TTXv7B
X-Received: by 10.31.88.196 with SMTP id m187mr3036828vkb.37.1464107473477;
	Tue, 24 May 2016 09:31:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:30:54 -0700 (PDT)
In-Reply-To: <1463698459-31312-2-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-2-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:30:54 +0100
Message-ID: <CAFEAcA-mBjS2tuQD1irUnaWD7qa1nrgMRL8LS66DdaTJmtEBHA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH v1 1/5] xlnx-zynqmp: Add a secure prop to
 en/disable ARM Security Extensions
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pk5KJ/w4CbLj

On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a secure prop to en/disable ARM Security Extensions.
> This is particulary useful for KVM runs.

"particularly"

> Default to disabled to match the behavior of KVM.

This is a change in behaviour, though, right? Is that OK?

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 3 +++
>  include/hw/arm/xlnx-zynqmp.h | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 4d504da..965a250 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -238,6 +238,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          }
>          g_free(name);
>
> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
> +                                 s->secure, "has_el3", NULL);
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
>                                  "reset-cbar", &error_abort);
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
> @@ -370,6 +372,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>
>  static Property xlnx_zynqmp_props[] = {
>      DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
> +    DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 2332596..38d4c8c 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -84,6 +84,9 @@ typedef struct XlnxZynqMPState {
>
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> +
> +    /* Has the ARM Security extensions?  */
> +    bool secure;
>  }  XlnxZynqMPState;

thanks
-- PMM
