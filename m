Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2197536ejc;
        Tue, 1 Nov 2022 14:16:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46FJJbAE//IIN1m3kNnK6xUIHAl7S6rQIT2zJHKm1HfEy0/1QI9+cJySo9up4LXMZkiN8k
X-Received: by 2002:ac8:5d49:0:b0:39a:4f7:e0b2 with SMTP id g9-20020ac85d49000000b0039a04f7e0b2mr16530189qtx.119.1667337405147;
        Tue, 01 Nov 2022 14:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667337405; cv=none;
        d=google.com; s=arc-20160816;
        b=JpSaX2JO1cBsmIk1Iceqy1wRCpq1tzm1JUZLxhjccWA0QFq4kSlrGD5qI11ZGAykQF
         eRrexPDTIBhZ/zsC7T+JQMFuOBdcDNfE0wmnvvkgL9OIV8i6f4+LYm6hhvG4eRlHieIw
         4xro8eybjuxj7PwovhXNzOE4Wk1PfDL2gcZ3u3cNy3XwnpqM9my059ZlZzOn/2T0pSHI
         7Ul1FdZCP/JH8bQ8i5kSVl7QB8bzodutTXRgXuJ3RG3amoX1Hxe3zjp1DjLvaNUhvvsc
         8wvJcFuRmZ11po+UDo8YKoY5y1NtP37UlcqoVknAvwrVM7kX1Phtdas/mTO3y5XwUijS
         yZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sIk/M9Hu2mriPwWO8PYS25cQio1VYc77rPyIWKZ93UY=;
        b=TkcXa725OGLN4W6maMw/Ep2BV4gtoYtyBnFLNHf6aRv2SAvYVuH8TKaogcyY+JN668
         OjPZjQLN51NC86BKU7Ty/1jT7fRX0Od0sIYwNcN599KRFElwBzXZIIruR2yNdJlspWEF
         BRmfLO05zZpM9V3OvsbdLDRWEDh8v9PHqXE7Sr7EKtjn3XidU2Kp03OWC6RUUiu4kzsR
         /GeUISfl//LYyYvHBsOMcuwLHhA5X5jNxkP9OeC9WMPuGdFCTVWl+Wfgvw2ZU9vHUQ1v
         1MMaz9TUZfkd+SKRsV+tpe1T94O/+KBUiwTsNALCeCtBx7oIgHXyJxMHtglcoho1GpI7
         EnsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=I1yDkZh4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br18-20020a05620a461200b006f59e79466dsi6874182qkb.675.2022.11.01.14.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 14:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=I1yDkZh4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opybJ-0001qs-97; Tue, 01 Nov 2022 17:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1opybH-0001q2-Og; Tue, 01 Nov 2022 17:15:11 -0400
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1opybE-0008Oi-SZ; Tue, 01 Nov 2022 17:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667337304; bh=sIk/M9Hu2mriPwWO8PYS25cQio1VYc77rPyIWKZ93UY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=I1yDkZh4grX6NM75Y2R4fPRsLJMroSnQJFRU6aynV89v5dVni6nF/LbkDyr2gl609
 wGj2oZejA6TXCfgYOJ++TDNMvca1DCTf2PJEjXgV8PEV3t25Yvn2eR+EyyvfG/N5vw
 ufG2dTiIMiTOqG8OaW8iYaoHO6RBp1L2cAnm3Pxo8JDDH5vZXzqMEAYhmzXF4OaMQr
 QXSKvB6TpqgPQW9IojTJ+g/4jBelQiPzttRMWWL9exFUV6pbWeMroMbykpUroSFb0g
 UZP1x/mZ36a+YkDugBhm39XpDIOhWB/ifyCZNNSh4IGWuHRE9ndYDbh7YnnVy8kyT1
 jD2PHoC5uWzEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([95.115.113.189]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1oszP32JO1-003ehJ; Tue, 01
 Nov 2022 22:15:04 +0100
Message-ID: <ae6a8bc8-91c3-678b-a2e3-c23be657d065@gmx.de>
Date: Tue, 1 Nov 2022 22:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH qemu.git 04/11] hw/timer/imx_epit: remove explicit fields
 cnt and freq
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <166718254546.5893.5075929684621857903-4@git.sr.ht>
 <7f03ab9a-5f00-684a-f644-dc16b1cca7cf@linaro.org>
Content-Language: de-DE, en-US
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <7f03ab9a-5f00-684a-f644-dc16b1cca7cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gTfkvrreBphlpImiDbZR/ZRNqev83HH9pmDNP+n+JPzdfsq0ciu
 2X7sTCIkjlGS1N0oew9cXnTmPkbQ7vnhYAUJPIh21eHkr9ptVreqLoZxSw92VQvLoaXqya3
 7k7IIBXj0wVGzcQi6umHxK56qx5Y530+9csF4BBcmvj8qIZoTfMbRUfxU4UUhxH7v/Tk/91
 8JBOZjDNavqxRD3lcu0GQ==
UI-OutboundReport: notjunk:1;M01:P0:LsJOzTYBbIQ=;ZfYKzXdoeaEwOAYjjNNfLGWjkIi
 RpPsq7NyC0QFmM90QjyE0jMAVZKxLLuEvveMpEAdPj1NacT5k729F9YHm8ztNvRRebYdBCdq9
 LPEtEAMN+uiZMk4T+KBiwY78udBJmfP3/wi3ZSPmFGG/KvrPlshJOCtTJMQ9mzNXDm5QPcvhs
 OHsB0NPRSjCnzVqylWyA1KKk8hpTdMyVAZ5EI0dNvduG/q5zkxPzoQj3jjKaOL1Kgzc7fqxP2
 e4sCCOGLlVnVVdtqoNgbrMEGNM7w+JCbrA0ShClyPqUCE4kLjdArMYK4Rbb4X0SD+LvdRTrCV
 xoHHTh53C4WUqsCSUS+ES1gIb+8pVCaALcOHhQmtdrFhcxu8U1wNFzaeDWI8dpfmcBjXkI65c
 R7VyKaDiXQBV9dB1+RSs0dvwTdcSfbcFL/gLK4YKfgZ/61hCQjrKkQ5mG0hhYXSKuYEcwBkkx
 hzR3KzebBKxKl5UYYkQdROTpXQ4eVG3+kg7v9hfdue19uY08vcEAouOb4NQMn0D4+r8YBCHEu
 xjMqBuiGl3GhwbcHMRcKFGMgnZOqcOpWfq8MTtKn08SjuwmzqcjhyivkayM+RnArrsARj7rns
 CtM/MWzFBk1d45yreXxFs23wA2wcmHf0dJnRtY0Aw7BwZJ7Ot+dV3fAIDLmdY7nBqX1iprnwi
 CuGfBclP7MPDxknKLgnVrWfKIn0McVrGN1cFph+9K7PbFGfq5/dR7nTIh+t0IGsqU7KEfBu1B
 p32oLgDjgMSPcjhEDgOYoyLxwZlzPPYUpnDNnDgY0LIMDxm+eIVcR9BbajHiCMi0ZQqQwcsqB
 ck6fz1nttuoOmxneYm7lmpB7+OhOzqdprEwhL9a5dItq0PVouusoBXv8Lg+qXbnbIcw2hipwi
 zZKG7EHzNPR/kmEdbbF1jYa1uaXAv1z7TPaakVS7bcuPHZnkeEnzHxNuqdmGLnRwxxWkFFl9O
 DGqO6h6GImxGVNrUwC4zpLL0LiQ=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3J+cD5qmMoAU



=2D------- Original Message --------
> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@linaro.org]> diff --git=
 a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c>
> index a79f58c963..37b04a1b53 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -77,23 +77,25 @@ static void imx_epit_update_int(IMXEPITState *s)
> =C2=A0=C2=A0 * Must be called from within a ptimer_transaction_begin/com=
mit block
> =C2=A0=C2=A0 * for both s->timer_cmp and s->timer_reload.
> =C2=A0=C2=A0 */
> -static void imx_epit_set_freq(IMXEPITState *s)
> +static uint32_t imx_epit_set_freq(IMXEPITState *s)
>
> Maybe rename as imx_epit_get_freq() or simply imx_epit_freq(),
>

There will be an update of the whole patchset, so I will change
the name to imx_epit_freq(). That makes the name and signature in
sync. Note that the next commit in this patchset does more
refactoring anyway, so this is just a intermediate change that
is not really visible.


Axel



