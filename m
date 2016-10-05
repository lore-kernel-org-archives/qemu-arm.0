Received: by 10.80.163.71 with SMTP id 65csp2697766edn;
        Wed, 5 Oct 2016 07:24:26 -0700 (PDT)
X-Received: by 10.159.33.241 with SMTP id 104mr6678153uac.75.1475677465890;
        Wed, 05 Oct 2016 07:24:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si11939426uas.61.2016.10.05.07.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 07:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brn7Q-000232-P1
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 10:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1brmqt-0005ox-CP
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 10:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1brmqp-0000Ew-6L
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 10:07:18 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1brmqo-0000EQ-Vi; Wed, 05 Oct 2016 10:07:15 -0400
Received: by mail-wm0-x243.google.com with SMTP id b184so24770694wma.3;
	Wed, 05 Oct 2016 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QeeWpe+mXorWVzkwOLaOY8EFF/JX407Ue/3SxSUPx44=;
	b=VOYcyFd72vIRT3dHa8OiB0Vyd8rrTWJCJfD5mgslCS/C2dxTlWP+VjmTCE/cT6zJlB
	fkkkT/2zMU4//EbLJCHQ1GGfPUzaOAfYXY/+SLfNSFnpjGi6J5qUWwh21ed/uTLsLwlb
	HovHQhU3KnK3KJP9+BCqKdFOj8XiICakOlPnFHwsfVJj7bV+Xy55n2rmAzFgpbxybKGv
	vUt5gX9c23YE7D5yz8hACgpTCtRJQCrwdwQKUFeU4Y0gZNrLGIntGodcGOjYbNaFHH4m
	lHg4U5vPRc6Jja9/Zsnqeobz7kCJoTXXDIW/takJ/WvnIZLuDCTUjBw/fL3/0ncvgMT+
	YBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QeeWpe+mXorWVzkwOLaOY8EFF/JX407Ue/3SxSUPx44=;
	b=VsHoanstPR1Ct5yIHXYs6og9uZf2Zm5t4Et31PebzAaIP1zFSuiVlB2DFD1SKGuN0y
	BUUgJbUDAF9Xv8YCd1arYyyH8/YkhDRnwVQ3rMBSz6FjJfHIDOZyOpCYHaE5KOB2cykC
	dyTjC7lEN+V77yT5bv488NU+jj1/FtwklAV1JpVAn3Wp9qSmO5Pgv/hSIfxzZ5XlJyPD
	OpHlZKTIu9qzJb5W+znLlT7LNeyGGPzDXrcC4851OFE4iTUgQlqAD08LfqPry9K+2ovf
	iK/OCUqI9HB8sVlECZ9w0qZ1L2dmcbbCBCa0mtJAdPfVMAUMYcPhmRVIVDWAco/yILIJ
	wszQ==
X-Gm-Message-State: AA6/9RnDGTXCUQbktu17gIR9fXTiuCDkvackrSs41hWluCfQr0xLwJ/SSALTr5ASo/19TQ==
X-Received: by 10.194.84.199 with SMTP id b7mr7986594wjz.147.1475676434229;
	Wed, 05 Oct 2016 07:07:14 -0700 (PDT)
Received: from localhost (host81-154-58-16.range81-154.btcentralplus.com.
	[81.154.58.16])
	by smtp.gmail.com with ESMTPSA id y2sm9180858wji.42.2016.10.05.07.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Oct 2016 07:07:12 -0700 (PDT)
Date: Wed, 5 Oct 2016 15:07:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: rutu.shah.26@gmail.com
Message-ID: <20161005140711.GI863@stefanha-x1.localdomain>
References: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dCSxeJc5W8HZXZrD"
Content-Disposition: inline
In-Reply-To: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCHv2] Reducing stack frame size in
 stream_process_mem2s()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikBnf2JF2x6B


--dCSxeJc5W8HZXZrD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 11:41:42PM +0530, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
>=20
> Hi,
> This patch allocates memory for txbuf in struct Stream rather than the st=
ack.
> As a result, the stack frame size is reduced of stream_process_mem2s().
> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> ---
>  hw/dma/xilinx_axidma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks for your contribution!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dCSxeJc5W8HZXZrD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJX9QkPAAoJEJykq7OBq3PIfREH/jJg7h92mEAwl0Ks/XlVnT0R
hjidIabYCrI79LukdnagCC2mNjRcsp0EWNJQkrk7Gm4vRVfDmAJMHN7g6uVVE+mB
kUUqHZBv8vbORDF9gbsClU84zAROtIRPjjcFo0dMdrstpkmBOEAaxhNkhI2JYxyD
jJzhoQi6wIYQzVQZxNNR+l8KWQJn/JqQXreBkLzFkplfz0WRwXRO61IVTM4y0NQS
BbVC2DZo8MO2DtxLF/HJ6/+9r3UODV+m83fa2RQZ8FhTvOxe/l6z3mzTzXWFxzQS
mONRNrh4WJeQg9P2NrJkTzDuLcxMhQgHncmG0NKxBo6sUdFUSyBUygXmJQePVL8=
=1aYZ
-----END PGP SIGNATURE-----

--dCSxeJc5W8HZXZrD--
