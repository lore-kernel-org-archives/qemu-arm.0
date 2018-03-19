Received: by 10.28.91.67 with SMTP id p64csp2807974wmb;
        Mon, 19 Mar 2018 09:35:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuL8AlrOg76Gn/D8uEZTaYSIGL8LBhsjncjKXI7dETtC3t8JzPADaH798hIRNpykwp/11vN
X-Received: by 10.200.65.17 with SMTP id q17mr11413395qtl.122.1521477315020;
        Mon, 19 Mar 2018 09:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521477315; cv=none;
        d=google.com; s=arc-20160816;
        b=M+CvTdwE/sTO3D5Okkw7r6iSdTFvfk/BgBstwTTtJIqrd6eK/O2k9IdFa5jcLFk5o5
         8ZxExbqx7mq7LX4Kkj0iMBxPkBaDQKZ7lDc3QHj3U2DmJwq/4yxyZrNM01Jk3fman2fi
         Bta+qKvZr7yS4TMxzQ08xDvNFlfQV6ri6WOsOV48TydZK1nGgeJ3+ZJ5Txln3DJ3jVCH
         eLyiSS+z72yDf1qRHFsiCumAhMmNMwzEDmU9q1pdcDXXMmRBuw2lf/0eLumpLGfhOho6
         9gibYDrFZjLws+wHodUiA7zIRroSpsYAyVAHzYOmzMYOz5vHIAUKS3JXVKtZCApwjYFK
         78RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bz5OJkfVcEa8ZuBkkDwMutnYpysAWPvFEuEdJH8ic+Q=;
        b=rAdjQM/K8vj2t0pELsTKNpTCSvzla14b9CRhXUulGnNrIkLtaE/ajmmbupd7EsfHdv
         UNZxZkvDjtmn1CxB9h6uMKfbDAFm+u2NJgbKh5ntOAAfhlQ5ornNoUuMDvjfVcYGQTQT
         4hLmuvlCK1tfQpJ4stS3D3T5zzKxuNaBn+j22OkVxCKmIdlBwifuzXhCp8kXDev1GOmb
         q5q+ziZWcRFTP3HJn76WLDa3vRx1/rJoYDesVvM+RzHDBcd2M0fYRlUmIlN2IqYhJL5f
         +9fVws4nkRVmS30u3DlgFZotZebfLZuDD39w6hK8iEATOj4hL/W/T5vVMYca0fmG+8mW
         byHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gZj/vopJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d3si381870qtd.470.2018.03.19.09.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 09:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gZj/vopJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exxkg-0001Bm-F9
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 12:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxkW-0001AG-5I
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exxkV-0006YA-87
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:35:04 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exxkV-0006Xp-3d
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 12:35:03 -0400
Received: by mail-oi0-x243.google.com with SMTP id a189so7864830oii.2
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bz5OJkfVcEa8ZuBkkDwMutnYpysAWPvFEuEdJH8ic+Q=;
	b=gZj/vopJYGQftxPmYXHbj9Kd4AxmvmBdJ/TajrziCPLXFZEGaSqjzszn7AnZ/r7FP2
	JRkih7mRsRon4NqWO93A9Jrjv/yOm4VO8CLhAW+MjbRNbXfGe4RlGRkCl38MUxprBhiE
	4S+vYb4vollsWpEQVCyqEh5mw1zokKzW1Xdng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bz5OJkfVcEa8ZuBkkDwMutnYpysAWPvFEuEdJH8ic+Q=;
	b=iS8GSkrXtnn64gA54jIeyE+xi/yVhj67en/oykmAR36hUtOGltW+k4FRV6emPYC7fo
	D7Gg4jm9wBLNj628dbQ/2YjdVtVaGJAFTYXsBkRctCO+UsR0Va3RfqV16vBKB0zjucCy
	4UBrAc3V6Q+xlJLWr6KGBTS/Vwe6mQgyIhdp5OqkT3eS+pqNj3tp4DCLtunDqPPp+YaS
	BF9ARUhFzckZm10qeE9bjG4S+0XtKKna+/sIts1iIYTnG/I3SNbdBe7u8HyYOEsylByz
	TymMC7P6kgikpNkrHOof9JFpUpxQsFA4dNapVXeLBsIrh0IkBiI39C91Twc/WtlD4Wln
	en4w==
X-Gm-Message-State: AElRT7FjTV0E/3m+n9l+Ag/E0SOW7udzEbJDEbB8V5k9SmsRQcjLYZJu
	9RJtU1TF2EMDiKG0UmCDRP0bNEWoCq+MjC139aPS4j+P
X-Received: by 10.202.1.199 with SMTP id 190mr7837944oib.80.1521477302262;
	Mon, 19 Mar 2018 09:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 09:34:41
	-0700 (PDT)
In-Reply-To: <20180319161556.16446-3-peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 16:34:41 +0000
Message-ID: <CAFEAcA8=Akk685sVg8HsV3a014GK=THkGbDixoKFQkh_pss4PA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH for-2.12 2/2] hw/sd/bcm2835_sdhost: Don't
 raise spurious interrupts
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FYN8fcb9pipt

On 19 March 2018 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> The Linux bcm2835_sdhost driver doesn't work on QEMU, because our
> model raises spurious data interrupts.  Our function
> bcm2835_sdhost_fifo_run() will flag an interrupt any time it is
> called with s->datacnt == 0, even if the host hasn't actually issued
> a data read or write command yet.  This means that the driver gets a
> spurious data interrupt as soon as it enables IRQs and then does
> something else that causes us to call the fifo_run routine, like
> writing to SDHCFG, and before it does the write to SDCMD to issue the
> read.  The driver's IRQ handler then spins forever complaining that
> there's no data and the SD controller isn't in a state where there's
> going to be any data:
>
> [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
> (continues forever).
>
> Move the interrupt flag setting to more plausible places:
>  * for BUSY, raise this as soon as a BUSYWAIT command has executed
>  * for DATA, raise this when the FIFO has any space free (for a write)
>    or any data in it (for a read)
>  * for BLOCK, raise this when the data count is 0 and we've
>    actually done some reading or writing
>
> This is pure guesswork since the documentation for this hardware is
> not public, but it is sufficient to get the Linux bcm2835_sdhost
> driver to work.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/bcm2835_sdhost.c | 43 +++++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index 79f3c5ceeb..0fd0853fa3 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -137,6 +137,9 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
>          }
>  #undef RWORD
>      }
> +    if ((s->cmd & SDCMD_BUSYWAIT) && (s->config & SDHCFG_BUSY_IRPT_EN)) {
> +        s->status |= SDHSTS_BUSY_IRPT;
> +    }
>      return;
>
>  error:

Oops, I had a comment here that should go above this if() that I failed
to refresh into the patch before sending it:

+    /* We never really delay commands, so if this was a 'busywait' command
+     * then we've completed it now and can raise the interrupt.
+     */

thanks
-- PMM
