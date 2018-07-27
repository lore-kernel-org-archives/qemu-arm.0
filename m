Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp942493wru;
        Fri, 27 Jul 2018 10:13:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdB7u7S/SMuP3YI23zaepG7k+chyCrykcqnSvrbklK4dhmxfsJkxsTo6z2PzwrOKwMOg81d
X-Received: by 2002:a37:b506:: with SMTP id e6-v6mr6838252qkf.255.1532711625290;
        Fri, 27 Jul 2018 10:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532711625; cv=none;
        d=google.com; s=arc-20160816;
        b=PLeEI9qEJ6cNnG/+Ew49faQCoiOrul1/BG4CX4wFtveUMZaWEr12zjfpODt/b4UJpp
         bfY9w+pu5gCZP5kooECBST0ZBRtIV0rnqESgLAIa/IcGzmOgZsC+mwaFAktLqH2dhqU2
         K7PAdZaNNyWIP2DiWBdEO90S7Fjj5kaCFkJOpfsBwTH9IZfQfFIUhbnjm02NEEk4NGda
         WlZ+4u3eUKG7SSlP+8bdC4FoszPzfkY6oTVgpRPindQDHOOa6LtLAvnO05Q8iTvsj1GA
         vS5TUwbptw+cvzBkQpYMAasbmu/EiqiOqLUbzi+X925EGDPEvYQaU7P9wuhEgsMGoMmW
         Ol+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=spKdhYG77kN2DboYXnFHMFCe6fzrmJ5rgzhOQlHMORk=;
        b=vH3ryIgdyA45opHL1c4NF9BexlLJj5Aq3+l6Aceu8SF8ZAcWXedPkaUDArtenEmtOV
         SfY37zJhJ+HnMPMxDrcbVe4lDkpbpGzblkQp24WnPagSvWAVp5f6NUTW4o1g8j+Yah4O
         ROFyRqStVfcXXCyJNZZO2Zwmzmg6/KNaePSO02HgV1Tcufo50ZtMr92FtSa6tB5cazhP
         ImF2OxCyTPjtc1KJk+iJw+/W8vQVMGPzHNh5FAJ1hnvTuMWlx+jltxZFw+/tMrk4A2U/
         hUNDu2cm2VWJc2qUgEwKtf1fkcN8RGQB/9un7jCnBNPoJmtc9RHSvsLl4GKIWAVmbL/V
         napA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ng/49Hau";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24-v6si547450qtp.120.2018.07.27.10.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 10:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ng/49Hau";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj6JE-0005ED-QY
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 13:13:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj6J5-0005D1-LK
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 13:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj6J2-00071h-6G
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 13:13:35 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:43832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj6J2-00071V-02; Fri, 27 Jul 2018 13:13:32 -0400
Received: by mail-vk0-x242.google.com with SMTP id s17-v6so2782365vke.10;
	Fri, 27 Jul 2018 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=spKdhYG77kN2DboYXnFHMFCe6fzrmJ5rgzhOQlHMORk=;
	b=Ng/49Hau3m6593MpQjxb+8sR1NTk5SfIdcUP0KwTVK6ysu8B/E1SMhrvk7oCbunsHk
	ey2NMuZVPrDvzCMMxRizYHVvSvA8l1T/3dCpjeqepZYt3n2eEOKE0KK0XFRyl/erGugt
	30lZ2npXtbFAGztgS3yiVZBFvsO8RAxQEHZ+XNnM6OBAunMla0w7/VQ/qAtIpvMxTlWv
	uv2ml8MsWifpkbfXTg5xLymBgEajEGT7oVog4DlfS8P12aHsiFAjbn8goMs1YowOrdW4
	D9qeDHzU8wN4JQ9rXYYYgl9/7QlF/5gZ8p5YP1aU9327XOgdBQlWIthj6NcguEKR0oI7
	6yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=spKdhYG77kN2DboYXnFHMFCe6fzrmJ5rgzhOQlHMORk=;
	b=G814+SJ0ucS5OhAULt06iAwQIOz30rdXht4ki78N3UVoaQkZCHrcpD0NrDUzgQX9Tn
	w+HVgcjUgo8VPdY78dkt4CXIvYcPWUGMyngorb54Pv7JI0XELbHcY8RooefcirkPmW/A
	jlgC5GLGiwKq3CjwmMsJncpc6SsEn+OH96uOM+W+4FCs+m8wMHLqyx6YdPxc9TQlR6Gu
	5+eiPk61KfT/6Grv5ed/IYPjUc3tQyRDVHtXWSr3FapdOKwTtFGCFe3fpU6dTXN2MKo/
	pnOmnG1247SzH8zxyXsEppPSutzRIg/NCkXT5OW7dPhPq0/qk/UNj/2kORtMDzxM3pKN
	GtVw==
X-Gm-Message-State: AOUpUlHO84BK1XBksrY9S3kHjXfutZ776aN+ASQT8Ig6uqPKLUW4edFT
	ElKvAjM4oicnb6hsAUEbcbo=
X-Received: by 2002:a1f:ee85:: with SMTP id
	m127-v6mr4711253vkh.46.1532711611395; 
	Fri, 27 Jul 2018 10:13:31 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	q202-v6sm1053989vke.53.2018.07.27.10.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 10:13:30 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
	pbonzini@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<81e37f79d335d17d8802f127d59f89e263c50136.1532701430.git.damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <113b1329-fbc8-31f3-1d6a-274c56472d50@amsat.org>
Date: Fri, 27 Jul 2018 14:13:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <81e37f79d335d17d8802f127d59f89e263c50136.1532701430.git.damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 4/6] cadence_uart: add
 clock/power gating support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5tAmyknwrNE

On 07/27/2018 11:37 AM, Damien Hedde wrote:
> Only discard input characters when unpowered/unclocked.
> As it is a sysbus device, mmio are already disabled when unpowered
> or unclocked.

This is common to all Chardev frontends (also Ethernet/CAN devices, see
NetClientInfo).

Maybe qemu_chr_fe_accept_input() can take a boolean, so when we disable
a device (power/clock), the char-fe code can discard characters for all
frontends?

> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/char/cadence_uart.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fbdbd463bb..dd51d9a087 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -335,8 +335,14 @@ static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>  static void uart_receive(void *opaque, const uint8_t *buf, int size)
>  {
>      CadenceUARTState *s = opaque;
> +    DeviceState *dev = DEVICE(s);
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> +    /* ignore characters if unpowered or unclocked */
> +    if (!dev->powered || !dev->clocked) {
> +        return;
> +    }
> +
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> @@ -348,8 +354,14 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>  static void uart_event(void *opaque, int event)
>  {
>      CadenceUARTState *s = opaque;
> +    DeviceState *dev = DEVICE(s);
>      uint8_t buf = '\0';
>  
> +    /* ignore event if we're unpowered or unclocked */
> +    if (!dev->powered || !dev->clocked) {
> +        return;
> +    }
> +
>      if (event == CHR_EVENT_BREAK) {
>          uart_write_rx_fifo(opaque, &buf, 1);
>      }
> @@ -516,10 +528,19 @@ static int cadence_uart_post_load(void *opaque, int version_id)
>      return 0;
>  }
>  
> +static int cadence_uart_pre_load(void *opaque)
> +{
> +    DeviceState *s = opaque;
> +    s->clocked = true;
> +    s->powered = true;
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_cadence_uart = {
>      .name = "cadence_uart",
> -    .version_id = 2,
> +    .version_id = 3,
>      .minimum_version_id = 2,
> +    .pre_load = cadence_uart_pre_load,
>      .post_load = cadence_uart_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(r, CadenceUARTState, CADENCE_UART_R_MAX),
> @@ -531,6 +552,8 @@ static const VMStateDescription vmstate_cadence_uart = {
>          VMSTATE_UINT32(tx_count, CadenceUARTState),
>          VMSTATE_UINT32(rx_wpos, CadenceUARTState),
>          VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
> +        VMSTATE_BOOL_V(powered, DeviceState, 3),
> +        VMSTATE_BOOL_V(clocked, DeviceState, 3),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> 
