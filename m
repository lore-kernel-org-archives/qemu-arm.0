Received: by 10.28.173.206 with SMTP id w197csp4171184wme;
        Tue, 9 Jan 2018 13:43:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBoti8H4NU9si4IzaVec1/iApcJCyND0AndUynrtqGdkX6djas8YMd/q/YMb8xmqhmgTFHSfu
X-Received: by 10.37.3.194 with SMTP id 185mr11686248ybd.379.1515534238861;
        Tue, 09 Jan 2018 13:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515534238; cv=none;
        d=google.com; s=arc-20160816;
        b=qph2IQKgjBUnpTGWucmQ6e/iuPGBcllgakKmp0R3K1Y6r+RI0oEBFnLPfT1nr2W1WA
         2bH1vFck5Rf4zmYD09QABzta61dA8YUcCG1wpU535SRHrK+3I5sq5evi39de3V9I40rA
         lXZdm2pLhX7yUb4q5eZukCuvrP+uyvDrV76qBEaIlYyvoqnbOtyZLtu6z8Epskmp5NRu
         +s99G1n4aytPVhD7zASugWELC4MduWtKvAlgqMn7lc6oYUSQBldCWlZLAgGgYOVA5OKR
         sy0kqm3xWNd6usqoZTkEpIXfQ9XdUpjzFxeAFhgrxpNkg3CcVR+BPXv6NDPSICtoK/q4
         YMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wgBKi1tW1t9xdXCDAdYySN7XCMMyrgJu+N6TROeJ9vY=;
        b=uXrDN4dMb/0v8vls0VSZKoufvDXMfBxqKPcr4O74btAtDKSqTZBinoXPpnJ9XFh6Dy
         PwdyF3jERC5Mi3p1ZLffthnqW6oddfrG8RMbq3cZYZF7fDsu+20DWm5QwEmZbm7bxN4D
         OSsI/P4Cio/PDujTjENmrV6NFJH27OzVrOk7jhnQIm/k0uJj8jVTem/Gjb8zdWfrb3Ws
         JR4L2DVX5L9TFkn/yHP9I+sJQXUGDXiGFSvmKqJaVU6L/uKvaf8fTaFGPT6FfoGt9Uur
         mEBAXMbVXAlQMM67gXHnbS0Ix3wWjcc0wohMAmQ+sh2JNxsX87hxjtYQZceRKntcGKjR
         nGtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LbnTLeCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si3207130ywa.295.2018.01.09.13.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 13:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LbnTLeCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ1gc-0007N3-BA
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 16:43:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1gU-0007Lr-8t
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1gT-00022U-5i
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:43:50 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ1gS-00021W-S5; Tue, 09 Jan 2018 16:43:49 -0500
Received: by mail-wr0-x242.google.com with SMTP id n9so5700825wrg.2;
	Tue, 09 Jan 2018 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wgBKi1tW1t9xdXCDAdYySN7XCMMyrgJu+N6TROeJ9vY=;
	b=LbnTLeCxzveps3VERm9131c5UYc9f55ci4IDUYc6QTno3WeJlRC5sXanbTi3mR1Xu6
	ftKpWL5REBxhGoSxy6ZJ5MAf3FeAaor7fH+wvkXNmgU7WsBPQH6fRRwnl8EyiOipp1OU
	fPACYAGVWTgk0HYC3PgPvq83cWCDrTh5DwwHHRm5i0+odrfE5UVKj530oD+k8z4VEryK
	aJjv9krvwiOT+wYQm4OUeGcUSBZhWoi1l5rMk80S7JL6GhmbPtrC4l4WDoocuqPbsHnK
	e6ZubuQN3uvWirEB2HlHBO/wqedO+CXLUYiMoiQWf8FU94DtKLoC/DWPdOHp2L7Nwx9U
	U5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wgBKi1tW1t9xdXCDAdYySN7XCMMyrgJu+N6TROeJ9vY=;
	b=AI6OvcJyB8kJE3etc9gGmWteLlZT5qQFxPOMOk9iB8ZOM1rCvXC3qH+GDFGzS4Fw4U
	GtARuMLCqPyMmwEAkwYHK7diWoEQkovqGuv4bqG6QbAJbfHn8C/819QM2nQacvj/8LFv
	Ja6dysthzrsppeiloJqyfbfjlW4iZtH1l4KnAkmJAtVF3afUX1Wx6y4nbGywuoQoDgIn
	8SmvqoinmgnFLC16KGETTryq1oow1g+c2YzzAAm3SaC6i+Ydoi0R9iwDvn/EcOMFeViX
	dTenmMyGkaYxBW9wvSx7nVrJlq8/nUlWXeu+JkEe4idPHh7fnXK4B+C+afGMqLLG+hjb
	ehGg==
X-Gm-Message-State: AKwxytf9aCBnhEWboOvWAnM185cA+Q0cy58Lv2t1gyPLpgD5C3nLYiAM
	pEFc7O/mF5xeabFHOlDeGTY3cTvtNdHooZHGrSk=
X-Received: by 10.223.176.79 with SMTP id g15mr2892430wra.34.1515534227716;
	Tue, 09 Jan 2018 13:43:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 13:43:17 -0800 (PST)
In-Reply-To: <1513183941-24300-2-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<1513183941-24300-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Jan 2018 13:43:17 -0800
Message-ID: <CAKmqyKOKZhNm5nYgam_0dU5z=nm76asbjg6PpCUDsCcGBSzscA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/intc/arm_gicv3: Make
 reserved register addresses RAZ/WI
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7bGxkPE6TXL

On Wed, Dec 13, 2017 at 8:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv3 specification says that reserved register addresses
> should RAZ/WI. This means we need to return MEMTX_OK, not MEMTX_ERROR,
> because now that we support generating external aborts the
> latter will cause an abort on new board models.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/intc/arm_gicv3_dist.c       | 13 +++++++++++++
>  hw/intc/arm_gicv3_its_common.c |  8 +++-----
>  hw/intc/arm_gicv3_redist.c     | 13 +++++++++++++
>  3 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index 3ea3dd0..93fe936 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -817,6 +817,13 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
>                        "%s: invalid guest read at offset " TARGET_FMT_plx
>                        "size %u\n", __func__, offset, size);
>          trace_gicv3_dist_badread(offset, size, attrs.secure);
> +        /* The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        r = MEMTX_OK;
> +        *data = 0;
>      } else {
>          trace_gicv3_dist_read(offset, *data, size, attrs.secure);
>      }
> @@ -852,6 +859,12 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
>                        "%s: invalid guest write at offset " TARGET_FMT_plx
>                        "size %u\n", __func__, offset, size);
>          trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
> +        /* The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        r = MEMTX_OK;
>      } else {
>          trace_gicv3_dist_write(offset, data, size, attrs.secure);
>      }
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 2bd2f0f..284c0a7 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -67,7 +67,8 @@ static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
>                                          MemTxAttrs attrs)
>  {
>      qemu_log_mask(LOG_GUEST_ERROR, "ITS read at offset 0x%"PRIx64"\n", offset);
> -    return MEMTX_ERROR;
> +    *data = 0;
> +    return MEMTX_OK;
>  }
>
>  static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
> @@ -82,15 +83,12 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
>          if (ret <= 0) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "ITS: Error sending MSI: %s\n", strerror(-ret));
> -            return MEMTX_DECODE_ERROR;
>          }
> -
> -        return MEMTX_OK;
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "ITS write at bad offset 0x%"PRIx64"\n", offset);
> -        return MEMTX_DECODE_ERROR;
>      }
> +    return MEMTX_OK;
>  }
>
>  static const MemoryRegionOps gicv3_its_trans_ops = {
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 77e5cfa..8a8684d 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -455,6 +455,13 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
>                        "size %u\n", __func__, offset, size);
>          trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
>                                     size, attrs.secure);
> +        /* The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        r = MEMTX_OK;
> +        *data = 0;
>      } else {
>          trace_gicv3_redist_read(gicv3_redist_affid(cs), offset, *data,
>                                  size, attrs.secure);
> @@ -505,6 +512,12 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>                        "size %u\n", __func__, offset, size);
>          trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
>                                      size, attrs.secure);
> +        /* The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        r = MEMTX_OK;
>      } else {
>          trace_gicv3_redist_write(gicv3_redist_affid(cs), offset, data,
>                                   size, attrs.secure);
> --
> 2.7.4
>
>
