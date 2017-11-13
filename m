Received: by 10.223.150.237 with SMTP id u100csp2340392wrb;
        Mon, 13 Nov 2017 03:27:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYybn9AFVWxHSsvNzJqhjpxC5gFlKF0WfdQ9Sx17Fha0nvCOf6tvrtpLFLG25FR1H6dKEAa
X-Received: by 10.129.120.67 with SMTP id t64mr2541924ywc.246.1510572432579;
        Mon, 13 Nov 2017 03:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510572432; cv=none;
        d=google.com; s=arc-20160816;
        b=vsbf1I1SybBbJgQIrqQBPDqA9Na4NFPJIM9ivytC4pUvYLfFU6ZdAa4InuUMH4zU2u
         C9be5IbRf5sGpLBObmM3WhO7UiTVrsHE/9izuuo3xI9aiEs4h9nrZMCleVmTd529FM+K
         cDthuieC8e+b8ZmqiOdNqrx2HkZiCgnvHdq3kIk0XUqO3SJWMAPytw8PwvKWXmOL8oFN
         9PqEVXbxLtl8jqNccjUo37v6LRdilA+5Mv846ZaD0Ia0njXqe7UApIy3do9VkDcZ8rWk
         mu7NxD53iPjlv87yEuPtMXkymgX8rz2jmAEmrEYfj9yGlksBRQp2r9efNmuVEpblZSbF
         V2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=yNhxVHZ66BEPoKhid0zfDRpdvrqJE1/qX/uHY6rb6Xs=;
        b=MH2qxu58LIHRGMq10FmHBxGLflDFbpH/QmOFCoOLcKIZSpup1Szm55HORWKEIjM91v
         0GVYVw8nAJ7lYzlTOgNL/QjSktApSHgHbZXdiU1TZob/LxR8jEaaKVsumBW5Z9ZknQwP
         5swQNQ8HhxoHvveGcKM3FnEZPlzBhPQamzNfnvg2v8LahZb80PIS9E4PMWBDeziXb5xa
         xF5FaMlMkSv3GwX8c163vjqPecOLxwFCfy6B+vloyVJDD+MpmQTyleNujgJ1xhiz9QLb
         eIoz9NCDTXUjvVxkaCE+Go4WYQqHLh5RCVidZL9mAULjCuQWfzBRaHvOLUeGSm+G6aoe
         b1zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DIWgQzl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si3870631ywi.223.2017.11.13.03.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 03:27:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DIWgQzl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eECtT-0002uK-Vh
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 06:27:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECtF-0002u9-I5
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECtE-0003N2-KA
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:26:57 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:50549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eECtE-0003Kl-7w
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:26:56 -0500
Received: by mail-wr0-x22e.google.com with SMTP id p96so14084749wrb.7
	for <qemu-arm@nongnu.org>; Mon, 13 Nov 2017 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yNhxVHZ66BEPoKhid0zfDRpdvrqJE1/qX/uHY6rb6Xs=;
	b=DIWgQzl1G7fzEvj4AzvAdBTmkC99Gt7yo3AIyqYLX0J8g23V1ezj7iJE0oU3QMe/kT
	JKo8UINvvd12nh2jO2T0gl1Lak0J8HWMOdWW5qXwWMhEOS+PCSPejXIbftbjSh43W1We
	5Sr3lt+LmO0PZ+URPfWmAFZA5U4Df5q2SEH0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yNhxVHZ66BEPoKhid0zfDRpdvrqJE1/qX/uHY6rb6Xs=;
	b=cSo/nV5bDtHNFAiyPKGkmmnnZJGHKEyVI6RecSZ4KxL/uMFgT9S3GtPSuthP/WmEO0
	FCMJtXvLJuKeaJ1GKL2oXECydxUV5zNUeqUhlfI/SGJL0B0MerWtSZ34RHU+SeR7qvfb
	BJFwejXeFyRSBbbq+tnjHv5aESM7WmkANH/CP/s1sALJMVZagvjQ0dLWn7TFMmAemdRn
	LWAnDvRpHoo69qzhsbDWOKTd4SM028RuH8Crmp6MZ9PEIWaHgW9UhCIoHHFpGAruYogs
	h64KwCd4nwcyLTkcyQLImOKG8pChkVHd8xr6OP4ukrm2z4hFiAwEDnxD5Wfd0cdyhqiN
	TMnA==
X-Gm-Message-State: AJaThX47p4Qv2B9Xwqh0GkE8sL/8+6O46tCmzsv3Igkby6UUbZqwMWGw
	VZoR8IgIR9aMY4Ymns9Q/QrpiHNJnzy/fZmnqGEFKA==
X-Received: by 10.223.171.161 with SMTP id s30mr6600555wrc.194.1510572415080; 
	Mon, 13 Nov 2017 03:26:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 03:26:34 -0800 (PST)
In-Reply-To: <49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
References: <1510087611-1851-1-git-send-email-cota@braap.org>
	<49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 11:26:34 +0000
Message-ID: <CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [PATCH] arm/translate-a64: mark path as unreachable
 to eliminate warning
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPnjnhSIzwY7

On 8 November 2017 at 12:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
>> Fixes the following warning when compiling with gcc 5.4.0 with -O1
>> optimizations and --enable-debug:
>>
>> target/arm/translate-a64.c: In function =E2=80=98aarch64_tr_translate_in=
sn=E2=80=99:
>> target/arm/translate-a64.c:2361:8: error: =E2=80=98post_index=E2=80=99 m=
ay be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>      if (!post_index) {
>>         ^
>> target/arm/translate-a64.c:2307:10: note: =E2=80=98post_index=E2=80=99 w=
as declared here
>>      bool post_index;
>>           ^
>> target/arm/translate-a64.c:2386:8: error: =E2=80=98writeback=E2=80=99 ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>      if (writeback) {
>>         ^
>> target/arm/translate-a64.c:2308:10: note: =E2=80=98writeback=E2=80=99 wa=
s declared here
>>      bool writeback;
>>           ^
>>
>> Note that idx comes from selecting 2 bits, and therefore its value
>> can be at most 3.
>>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied to target-arm.next, thanks. (It's a bit sad that
gcc can't figure out that the result of x & 3 is constrained
to [0,3], but there you go.)

> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

By the way, Philippe, what are you intending to convey with
an acked-by tag? Usually "acked-by" means "I'm the maintainer
for this area and I haven't actually reviewed this but I don't
object to it"...

thanks
-- PMM
