Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp989281wrq;
        Wed, 6 Jun 2018 08:52:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLohxafvxoQBZJtFH4/5W3/tpU1NRuIDANUOx3xCTA5aOJk60NERS1/k5XW9zCxKwlPPE+U
X-Received: by 2002:ac8:2acb:: with SMTP id c11-v6mr3395602qta.147.1528300374487;
        Wed, 06 Jun 2018 08:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528300374; cv=none;
        d=google.com; s=arc-20160816;
        b=toRcaz3s2mio4t+dmXxPthqZr4N67MHoF3yB7mWPhrG7lWzDupII/Vf9uZZIqqoZKC
         2My1HpDfAThYc0awauT5iqIOf5wHHB/kvLgZ9yZ+b/yUyxh6FYFmOmZJ8UHnjCGylB+m
         jSxj4kWo872bye0agCxeSTF5mt0etJNEjSsTvAl0AC44VEZAWRrWyy0p3/D380u7eO0U
         ZSHyiKY3eNoZQL1jVzY+9ZbPl2ivu9FxaA/psGnzlxcL1RwaJ34w4SFZSesU99K93Bne
         telyXGDkLVW7QJyhDsU75Cv2mxBtj0ByQcf1iUtQPpai/NGDEP9qgOIMHlxdbm11GtCF
         neSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=djtq03BYDUnp0FbuehN8KxCo94JB77KVpo98vpFuo8k=;
        b=RBl5p7CMJt4Fjd5sCjA02nZbir94qo91gapEmm8iAcVwhDzHZ1mbq3Pa0VlMZcFoAj
         kFnb+VCgmjTVDyzVwH47y0xPvqDR24sHXhdrdsHggGdPrACNDXtnc+nF0oF9WUbniQXN
         Ys1zcLbNcE145VaJJGVSMhzgB7MGF8/Z9XLhWZIeY0IjrGJ583iSkzVt5cQUUu9WfJy8
         1gMv/CvIIl1aK+ithfpQV9R1SlsEpuR1gYdTu5kIPYKWqLFcS1CkzzBRmQvX3s7P+ZYa
         RMCbowhWhPcgD5uvhkjTDqIovSQ42cH2LNOxQBhxV3PcuUhroS+rA88ZOLh0b+bYOktr
         s4dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tj6tTi6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9-v6si6383477qtj.168.2018.06.06.08.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tj6tTi6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQak1-00038d-Vq
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajS-0002qN-N4
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajP-0005ZN-Pj
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:52:16 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:45722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fQajE-0005RA-FS; Wed, 06 Jun 2018 11:52:04 -0400
Received: by mail-lf0-x242.google.com with SMTP id n3-v6so9858523lfe.12;
	Wed, 06 Jun 2018 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=djtq03BYDUnp0FbuehN8KxCo94JB77KVpo98vpFuo8k=;
	b=Tj6tTi6OHWOW2sdPRNsEGnNr6BgaKeeRjvNMIarl5PowjT1E0Vu+nvz+cUmy2YA0FN
	F0zPL17bz/T+9w5BPOtvMntcpFDMM/fimTK73NJa+3o+j42Kb94D8UXR1UjDc9RaBBmj
	YrQ//XUyLdQlMzkTQK8NF/PQDoIuzKIo6j5tLuw6JPs+2+ro8iDBUb61yJnE7QIH5wvL
	T5Ss8cyCUa94HCv5mNGWmxshSrzQK16YMBMFzCZrLDeK3xGAg15f5+tu40URwSsLOszk
	9XPvNS/iUSc3cf6mOW4ncS+wqCQZmWxx4xubb7FUgBIKy5hqsHiDcyllVEm/B6UKWiZ1
	xo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=djtq03BYDUnp0FbuehN8KxCo94JB77KVpo98vpFuo8k=;
	b=OpiaXc5E0/U2X57lzu0MXlmKK2dN66QEHHO+URyd0wGmpJi1pVdky4nZTmFTia1r1E
	/LZHuInfCuGtmNJRPOBOf5hiPKj1gaIXRS/pkUgKwu77RRzrZ6xSseCGYXZvscrZLpcj
	9+wd+92bTcJINmEhuRXxd3QVpbEYQr4/sgl67vpmes1+66QFuK2LBHcpIqzBkBDJQY8P
	giqi1aupa9wxQWMIG9qtk5lHfM5+hlzj+ao1UWBwNiTebViRrGTDiiiGnFgYjNZt6cOg
	uQgnoGc0gW2nIjVT9tBhFPtr1XYf/fmDcW38AINUHqb5WBArtW12aXzbpKQ1q3o1qvPS
	do4w==
X-Gm-Message-State: APt69E1pWYSms10ajpSVgunAIp6zxe5nZjSMuAI91bP5RhVAsPTEYRH+
	bRTtZIfUQ5zvVp9VqA8QZ9yEC/UPGU61iaDUV7A=
X-Received: by 2002:a19:5011:: with SMTP id
	e17-v6mr2212067lfb.71.1528300322697; 
	Wed, 06 Jun 2018 08:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:20e2:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 08:51:32 -0700 (PDT)
In-Reply-To: <20180606152128.449-4-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Jun 2018 08:51:32 -0700
Message-ID: <CAKmqyKNXV3bTx3nJq5=7daUZP5_eF5ePDazv=-B5poN5JnX0iA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/11] xilinx-dp: Add trailing
 '\n' to qemu_log() call
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WAeR61++JZQ6

On Wed, Jun 6, 2018 at 8:21 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 6715b9cc2b..c32ab083f8 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1074,7 +1074,9 @@ static void xlnx_dp_avbufm_write(void *opaque, hwad=
dr offset, uint64_t value,
>      case AV_BUF_STC_SNAPSHOT1:
>      case AV_BUF_HCOUNT_VCOUNT_INT0:
>      case AV_BUF_HCOUNT_VCOUNT_INT1:
> -        qemu_log_mask(LOG_UNIMP, "avbufm: unimplmented");
> +        qemu_log_mask(LOG_UNIMP, "avbufm: unimplemented register 0x%04"
> +                                 PRIx64 "\n",
> +                      offset << 2);
>          break;
>      default:
>          s->avbufm_registers[offset] =3D value;
> --
> 2.17.1
>
>
