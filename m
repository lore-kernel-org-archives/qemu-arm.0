Received: by 10.25.208.211 with SMTP id h202csp1440775lfg;
        Mon, 7 Mar 2016 07:21:09 -0800 (PST)
X-Received: by 10.55.76.84 with SMTP id z81mr28551641qka.17.1457364069299;
        Mon, 07 Mar 2016 07:21:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76si17246067qki.38.2016.03.07.07.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:56380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acwy4-000795-OW
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:21:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1acwy1-00074k-Ki
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1acwxv-00069r-Nl
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:21:05 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1acwxv-00069h-Hj; Mon, 07 Mar 2016 10:20:59 -0500
Received: by mail-wm0-x241.google.com with SMTP id p65so11344302wmp.1;
	Mon, 07 Mar 2016 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=NziuqWow5SClXUJemqvX5BpWJkdQXo3xwgN0aQk8EAE=;
	b=ac/LHpBdFPATyEe6yyPqYk1uImFQUOlyy8Tmm9Am8HeVL19CwZ/vOHEEzUlPmOgYoh
	7Fsk7/PRa/MEFRBAz8G3l5BuESDjjSyHph+rn8iZeO6YvIUFrzVVVg6Woe37kYwiMtSv
	zzisqMxzmi8aGspCPGRAKcB/reYBnytCq3Vl0GwRgYb2Pb0jEQx6qBgu9W3dSl1F8mnF
	41/cD9llkk6Qydh2+uZPxtWuYitNDZTikzeCx29ZwhcUXJV8qNcRFaayYLkNTopCH3fb
	cioQFe/LGpzVJTh3oz4Zop8Z6Q/cwqfTlJ7EhP5/AVKw/I+xdR3W5hD0XBJpulHma08R
	gNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NziuqWow5SClXUJemqvX5BpWJkdQXo3xwgN0aQk8EAE=;
	b=XlWuMgsV15GXy9pNakxFKCiLLbfRxg6GoAGsHBda7gJ2LOFahXdQ3eYie7Jibt2eAS
	XPF5nlkBhRwuyz5QBtsERMWPJ7MK4h/EXOLqbTUcnPZesDhS9fLbkVjRSMRA+FjaeJHa
	W+K2a2q2JKbSMJnyenlJ2IRlqT053BV7RPmkapclGZB2Lbz2lMKs1IS75y3U47mpGjOH
	tv62I/6U/V7i7oXwBa9Sh6RrRZvAf5wvFdVml2NNNzXZx1BK65RxXWj0C6+vfIh2Rpdi
	MmAbO14MMGzqQOppflhFPT8VISIp9N2/u/ZN+LJKOKP4//nt5AcSGHOOrliTNsmENWJJ
	XpvA==
X-Gm-Message-State: AD7BkJJqZuKhtExdzsRtGwf/7go6+IBeb968ZV8fi0RRDKC3SO3RyRxale6tdzfR9u6m8Q==
X-Received: by 10.194.63.75 with SMTP id e11mr23326953wjs.79.1457364058786;
	Mon, 07 Mar 2016 07:20:58 -0800 (PST)
Received: from [192.168.10.165] (94-39-138-146.adsl-ull.clienti.tiscali.it.
	[94.39.138.146]) by smtp.googlemail.com with ESMTPSA id
	v1sm18421867wjf.49.2016.03.07.07.20.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 07:20:57 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56DD9C58.7050306@redhat.com>
Date: Mon, 7 Mar 2016 16:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MnVe9fK/7JYR



On 12/02/2016 15:45, Peter Maydell wrote:
> This patchset adds some more secure-only devices to the virt board:
>  (1) a 16MB secure-only RAM
>  (2) the first flash device is secure-only
> 
> The second of these is strictly speaking a breaking change, but I don't
> expect it in practice to break anybody:
>  (a) there's not much use of the secure support in virt yet
>  (b) anything booting a rom image from that flash if TZ is enabled
>   will be booting it in Secure mode anyway so will be able to access
>   the code -- the only thing that would stop working would be if the
>   guest flipped to NS and still expected to be able to access the flash
> 
> The second flash device remains NS-accessible (with the expectation that
> it will be used for NS UEFI environment variable storage).

I think that, if UEFI secure boot is in use, the UEFI environment
variables should also be only accessible from TrustZone, because they
store the key database.  At least that's how it works on x86, where both
pflash devices have the secure=on flag.

Paolo
