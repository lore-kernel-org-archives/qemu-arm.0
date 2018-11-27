Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1159267wrt;
        Tue, 27 Nov 2018 03:48:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UlC4HWihSvbu/elboxRTTXB793h6NoanmA0SQZlYyr8bDbiwkAIg3QDqTpsT2AvzGlfTx6
X-Received: by 2002:a5b:7c6:: with SMTP id t6-v6mr18990758ybq.406.1543319299029;
        Tue, 27 Nov 2018 03:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543319299; cv=none;
        d=google.com; s=arc-20160816;
        b=I5ENSYE3mkomZzMkdxtdl6Gv0JIWpo2B3NR8L2Xajye5en4l52n6bBPlGziN5ErCOL
         fqUIr1ia48sQTN/gZClZ7ANm/HzEAp9/UoJVjK3t7UROsQYxDtPUi1W+6ScckGl/hH3Q
         2ovN9dblLpAfys9klA4u0tTeGbkEM650ZpUN7GeKPYQ6SXRMkRNfafC/F9h3zsnlpx0v
         gkGGM2TC3b0dOuez9ul4zX3+PYQp2OdbLWptqagRAZq7SyZphQUvtWgcenj1/cC4N0yI
         80Oq6gA6Ldzx9yOgQFTL6Uk/Bvespv93Gg6GI0vVlz+cHdij16WHeWb9EjztAZkcouTB
         gqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=XHAvkIHwLNuCYft8EEfQSq+loguQNdgpRRmyu8rdLko=;
        b=b5fAaSS3QXLovj1IfwMrkMkf5wG9jkhwFrXkB4dX8f74/YUcd5iKWu7X1PjToCrWW/
         2YyiUuOfjU7lZthF4Y8CsKehCVLlGqEkR7zrNlXmkXkY3CZzk8PwY+0vmJWSz8fVwQOn
         ukTHQQ7LxhULsuoUl8DSDTyiI6x+rtN2+T1MIVaCp7lBLoHOZ3XrG+hpMGtOenkIGdhO
         ulVpk9pskhqAggfhgYGd3MHJ3PZcnYtiDHoayYmfrM5R6vskYRfbjOmrm05kBjnuA42c
         3cNeAcqTR3rnbsLfe/7Iq07ZJG5XAEz/SZbQ6n2+KAXPBpldWIBKBxpinB5PJeuxAcwD
         6OKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g127-v6si2533662ybf.30.2018.11.27.03.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRbqk-000394-FE
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:48:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRboz-00023Q-TH
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:46:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRboz-0002lh-5n
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:46:29 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:55045)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbou-0002et-1R; Tue, 27 Nov 2018 06:46:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mofst-1fcqjy1aLR-00p2AK; Tue, 27 Nov 2018 12:46:19 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-17-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <8f9d5d00-eac3-55a6-9b42-1c6fea3c1dcc@vivier.eu>
Date: Tue, 27 Nov 2018 12:46:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-17-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AtJ6qlHlTBxrjXC/svFLLZhdNYnGHKScOylyDO+VuNOBdRAhsS/
	dvdykvhImo4UvsGTXg3+K2QzS07vCgPdSdvXYUk/4XRZCZhgNvBYwv0T2j4qo4cA8muF0Vz
	fI0JbjWXFTrw9U2/yGmoQyWoJhDXpqonrmfPY8Ads8LwhAb3f3EhgVk/W5+DAls86ihIOG1
	yNO7UTcdLtYyCM6CHdpGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MaLLDNhrlmc=:KW4rv3KEzyoPJn6oxAeo4B
	In83SgDGtytg4WUtygsiuu07TrPFYfGwxrDiHEGUKAH3iZ7XreCrnysAIju3OL34PP1JL4CKH
	qE0gf9QPpxT1SX5K/3+pgtG56LDWaPVQEylcj3lq+PUkUpDxswBqRKeR6lOKGC9D52aYfbSNA
	dDWs/roVa+dBW0CRA5G8cmD2D3BTUlTburzWnKoMqs4r8e6xDjOcMeGxzWGvGHZmd99Y7U7rt
	M5Wcr1009DDSHjomtQpTweWVfJa8uuTwfjAZiorG7QRfW5xkDvSdPoFgULu0XBSyD/EmXAZpb
	ffU2FW40GfFGRTq6KJNZXWD91SnlaCQ5lx32OH3BiILvOy3jEo8VnWpI9kzBcVuT0DSL00CDr
	79KXkE2n8PHcC9NoddXT0voz8yIGIDLDOMcs2TF4thuc1nh18U/W31Ifs0cMTht209lg9DGYH
	RsNVEv0Rn1faFGJS1MZxiR1mhEojvfHp9M9N2lSfmllztObub29DYwSODD3OxdKxlMkvkz/Eq
	wzZDBta7HQwq1Ah04V7BZ13bhUGil+dgfzn8KsWeJZd9ByrBzNcDNxd3PrG6Hd2IGUZ5RKv1G
	hFpZHos8SjUkTlLmz+BMB4pkcKOIWvIOXFcwPo2XhYTLF+UCmK4SQ2nnGctsE/EQAVab7tK8G
	wm5lwVJxNij9xmGSYYRE1b8im69ctyKbF1L4MCsSqi1T8ET+WKwrwv4fpb6ihIua6cGLMT6gg
	BxNmsjZdHhi5qIZFsIaU+kLWZK9hIVlSNZ1ZqDoPB6kcC7vzdQbrNfqLqJycPScOXb1XB4cIe
	BR1VLLC4KV3s6P7sxlssyQTCGjjoZEmg7vGqUf2SLjquLFL1keFfNW38hjcU58zN6ixgNE1bG
	ot61weDaeAW7ZF01BhXl9Y9C488u8kvr2l+vQAlm8jcJ6as88Hk+qGuYcBPDaf6MRm94Gq5nO
	RgUSaEbKfBRsupwc8xqdbEX5BHQVjCF0QWDoGQ4db/QBut+LW0Y1473HcgMOi34zi07Xkqfjr
	Lg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH for-3.1 16/25] MAINTAINERS:
 Add missing entries for the MPS2 machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+Ul6JjZ9nYV

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Missed in de343bb632a.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e04f2f1a44..2795135a09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -587,6 +587,8 @@ F: hw/misc/mps2-*.c
>  F: include/hw/misc/mps2-*.h
>  F: hw/arm/iotkit.c
>  F: include/hw/arm/iotkit.h
> +F: hw/misc/iotkit-secctl.c
> +F: include/hw/misc/iotkit-secctl.h
>  F: hw/misc/iotkit-sysctl.c
>  F: include/hw/misc/iotkit-sysctl.h
>  F: hw/misc/iotkit-sysinfo.c
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
