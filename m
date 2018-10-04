Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1172873wrt;
        Thu, 4 Oct 2018 10:37:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61ZfXmj1eEm9013VqOzIHkdyrNAtXb+bsvPKMkTtIj9/DGfKCmJna8GEd9ds2Smn0HWjjmX
X-Received: by 2002:a37:a650:: with SMTP id p77-v6mr5965672qke.126.1538674648665;
        Thu, 04 Oct 2018 10:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538674648; cv=none;
        d=google.com; s=arc-20160816;
        b=LKGokVO0J+BdOatNn813J2iPUScQ2sAOuJk+U4pz4c2Af+u0RJohyN5eXabP7vxLKO
         JpLoFap5tZemZS0QthDiV8ZFMr1t97du7oJGG4gMUbrfhhPfgHa0MApd7S31NuQUCyPe
         C48l2MiwIX4S7bkBOKAB3lVnlX2VP86lGwuPJmxCskd5/ku3JetcEqRQwk+fhaDxnh2k
         sRNOyf3xV/TwIkG0fJaZKZEPefaE15UYTRNDI2o+1ME1mt+PWHE9xfYdV1OOLvaE4Gza
         o3ihbQdHe9BSzFV7JsvgqC4TBD94QD9D1z/aQ71v5XzBaQFrqVxmpmtZQBIBa/Q/47wL
         aS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ajkM76D0M2PM17axf5TuSlcJWWiPTF8Kjlthn49NLig=;
        b=LiJh5vKp+cClX7SCQv4Fo0ncB9ulFaYLCeyRXsNu5OFiyHsUD7oX1MOkvGCVbtJPy0
         U4EkM0y4Vhw9XPdkewPbZkFvpvPJQdxsXtyzgK4BQ7Ql8x3jtoSXlAWSu4/Tekp2jQOc
         dBmigHWz6un8HAPUu738sOlSbY8biE147N+vijMFK7G0fm9dwFvNRDGgm2CWKmLq5W06
         dNr4a+z9fd0RQnMRxj6Dy8SMBiENZJqCv6RO7QjRwXWqiPOhso4HDCfCBoDE3eSJzfRy
         i9VgwKWlwJOoIl5HM0CjG7zIxD/8YQxTCLlHYv79TP36jtblIBpIrc0hqKzgjtn9rTsi
         e2/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="I/Yi0Jhs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b187-v6si3624377qke.115.2018.10.04.10.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 10:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="I/Yi0Jhs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g87Z2-0005tU-7c
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 13:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87Ys-0005sK-Mv
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87Yr-0005jc-Va
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:37:18 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:43903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g87Yq-0005hR-6q; Thu, 04 Oct 2018 13:37:16 -0400
Received: by mail-lj1-x244.google.com with SMTP id r8-v6so9118181ljc.10;
	Thu, 04 Oct 2018 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ajkM76D0M2PM17axf5TuSlcJWWiPTF8Kjlthn49NLig=;
	b=I/Yi0JhsvbcGYObdVy9vdPfQwy9cvImX9nusufq3D+AkmT0TraJ1ZjNTF3fv0DhxcN
	uOgKKSXhbYyprFADbmd5F36zXOJJeiiCB4DA1mzLcOBh2PkiyQA8uf35uLc6blN9j01i
	HGtYe+a2DTWIQaGhqhziCyGdCTpbLq8pFJbR43uMdKEOzbkZS671MEIF0AKF8vmSotBW
	up7M3u0UlPzX2oGXrkJllGfp+x4px0JblhWtwRzmtwPC7bEc3Jr+GzFpnU5SRQ8QfzTi
	besJJRIHK6/eBOeRn9bp1JyZLhZVbPLSixwaYtS/6c7yVuCgLaDvJB2o8cUBd2AaLHEa
	Alig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ajkM76D0M2PM17axf5TuSlcJWWiPTF8Kjlthn49NLig=;
	b=d/Gl6QQEw+CgoTvm3VL+IYse9/5nzzFW/MxsCl2vBogQvfRtfp++TzOGHa/bBctZOm
	3X3QLRaR+UVfogy9M95A2/PfguVMcKnLJNJvB71xtRNmtPp2uHNCqPsLJdriCRKSekWN
	kGRCl0lqv6Et2UvsnxeXnafLoVhhRfd4oKXuxuLMoHpw1Bos5ZdTZ19Q0kMy2+9MMDCx
	qVVxHynoERgyYe27sQ4wNGnisn3jGdjJHeyycIbGfkZen9PPqqW0dTFyumkIXX9aB9aN
	xGHiKUaNg/4c5goFuk2CHyKZ+qJT/PPNLLbAP1HHTd9jOkMTo2GB92v0aPc1hj1UH484
	c8/Q==
X-Gm-Message-State: ABuFfoi9W3jQB4Hz2YDvbtmF9VjaGyty++0+PIpl55nSArez8rLXLzB+
	iUEA8tDK0K8nzogZqp5q94zNjQyIH5/JFrMVIt8=
X-Received: by 2002:a2e:6d0a:: with SMTP id
	i10-v6mr4831019ljc.145.1538674634801; 
	Thu, 04 Oct 2018 10:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-2-git-send-email-edgar.iglesias@gmail.com>
In-Reply-To: <1538579266-8389-2-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Oct 2018 10:36:47 -0700
Message-ID: <CAKmqyKPh+mQFSOWdZHCmusn86vd5aMgACZAsCa8d=uaSYUdsFQ@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 01/12] net: cadence_gem:
 Disable TSU feature bit
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
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNPr4+uxfXb8

On Wed, Oct 3, 2018 at 8:11 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Disable the Timestamping Unit feature bit since QEMU does not
> yet support it. This allows guest SW to correctly probe for
> its existance.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/cadence_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 0fa4b0d..e560b7a 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1228,7 +1228,7 @@ static void gem_reset(DeviceState *d)
>      s->regs[GEM_MODID] = s->revision;
>      s->regs[GEM_DESCONF] = 0x02500111;
>      s->regs[GEM_DESCONF2] = 0x2ab13fff;
> -    s->regs[GEM_DESCONF5] = 0x002f2145;
> +    s->regs[GEM_DESCONF5] = 0x002f2045;
>      s->regs[GEM_DESCONF6] = 0x00000200;
>
>      /* Set MAC address */
> --
> 2.7.4
>
>
