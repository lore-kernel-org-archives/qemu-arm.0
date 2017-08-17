Received: by 10.223.183.22 with SMTP id l22csp1958750wre;
        Thu, 17 Aug 2017 03:26:06 -0700 (PDT)
X-Received: by 10.237.39.68 with SMTP id n62mr6410718qtd.218.1502965566358;
        Thu, 17 Aug 2017 03:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502965566; cv=none;
        d=google.com; s=arc-20160816;
        b=s98Q1gF82dBkbY+h9IWKYvxMmujAh8UVbMVl246ygjeMR2myZ4J0a4HAD4meDSuVXp
         urSMiiS2I1gB/aapmfpNVuxA8fgW2gq5m+f9h4KvUNK6VxQg9R2NrCeQXDLH+TX6tTY2
         Vobk0IQASJiDmVN3OB+eRAlomErfpk2f3TZnx9uQoZnjTSw0Gfgm7unFRIsfkShk1azt
         QDMPwi/NIb7GveLjrcgUGRPvZxkWANZaFpj4oilTmtnRBbHnpFMIs5T96edY4mvZhuL/
         J0X3oYz+WEuGNO0vVZiurDPh2MqVpmxnLvVAzdm259hnP5bgSMrxEiPHimYD8Zev4WRU
         6BzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=H3QFlI++2TRFduytWBPAJelUj7cPt29yHZL6FfSY5t8=;
        b=DWy3923pwGZIhb/1ccKgdmqVmubclZypjvhohoORizJfLbOAZ34PJGRZRI+mdtanSN
         lv0kczPf0P6IZGyLnqfEmqzU32XPfbVXsh1oFiYCy4X8K5NiFVpOwR5NU24tcmQ0LKBH
         ousfJ1TwaOfIQoXMuyYklFh0qXZDuSdRRgXw9weBSYOdoTdtvvDr3DLuAVWRfh7mDlAi
         Nqw94DaLNfWTKgJuKovQEayArtnKX7xmewPqQAUYnYOpZOTFFfpod9sWIduXAs+SmZY7
         fLr/bQ+vM1OoiVxg4fYA720KrTjBOGp4sTaI81sjUPi9WIw97Qv1oJBd1efcfx19hV+Q
         AMWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W1aO8m0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h41si2985763qkh.78.2017.08.17.03.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 03:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W1aO8m0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diI03-0006UV-Su
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 06:26:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diHzz-0006TW-WA
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diHzy-0005GE-PM
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:25:59 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:33583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1diHzy-0005Fo-JK
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:25:58 -0400
Received: by mail-wr0-x234.google.com with SMTP id b65so39473699wrd.0
	for <qemu-arm@nongnu.org>; Thu, 17 Aug 2017 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H3QFlI++2TRFduytWBPAJelUj7cPt29yHZL6FfSY5t8=;
	b=W1aO8m0+ZVWI1bltZOWRaitdMrXv087SAE5xu3/9n4ZD9EqitUVMtK4fZaKQhLElK4
	quI9SmsGpP89d08Zfy0r+9suDexy5QCDCrJF6i7Tzf8Gh4gbMHJfzsnace8cOJXRMlWM
	ay2/x7/G7wUWprTxmvrbwdryti77wswxwZ/t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H3QFlI++2TRFduytWBPAJelUj7cPt29yHZL6FfSY5t8=;
	b=hXDHW6d8wmuBzeOLzhDXq7fLJCr4GLVJR6rA1YEGJyqVP+eKP7ZG5Wb0sDXB8Klk2D
	YZBsZIPsliLM0w7b0nJJd+hqZf/TVTyF652NnZn/ibXwsV/jy9SJlWuxMDwr4ZrFsU7/
	P5Ne2F841uS7nfsvCu5GvG+2+9wXR8eBiuiGVAMPKwzo5T6rPP0fyo9QYBLG6kEpioJM
	OmTfQ7Ux7WQog8aTo1EdSR7QPDAxn9nxtBiQhqGM+Ngh6vLEea6Cc2YqVPfU5TB8NOQj
	vJG6GKYmZlUKfCr73luipg7g9wQ+WTqRKwInp8FAQNxzF2OXi+jk9i07KZJVZh8uA8YW
	lLmg==
X-Gm-Message-State: AHYfb5h4CkAQ35VwHXJps/AxZUt5cZ3or8KFq0env6CWKgvRBDdOHGVF
	lq3iAQCRJHU7HgmUnBsXrA57BQfIi89z
X-Received: by 10.28.22.205 with SMTP id 196mr895874wmw.39.1502965557284; Thu,
	17 Aug 2017 03:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 17 Aug 2017 03:25:36 -0700 (PDT)
In-Reply-To: <CAFEAcA_nPya92Vatwt7RiZnhKTH4_GKypSrX_KgPj3GitxV0Tg@mail.gmail.com>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
	<c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
	<CAFEAcA_nPya92Vatwt7RiZnhKTH4_GKypSrX_KgPj3GitxV0Tg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Aug 2017 11:25:36 +0100
Message-ID: <CAFEAcA97eXYPABgaE8Y_+EkWscR7CCH2WUHoM7ttZ6gVWQrqxw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iGoNe/mQbEdq

On 5 August 2017 at 11:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 August 2017 at 20:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 08/04/2017 11:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Since create_unimplemented_device() register overlapped with low priori=
ty, why
>>> not register it as default device directly, over the whole address spac=
e?
>>
>> That's a good suggestion.  It makes more sense to me than adding a flag =
on the
>> MachineClass.
>
> Yeah, I did think about implementing it that way, but...
>
> That wouldn't handle the case of a device model directly
> returning a MEMTX_ERROR, or a transaction dispatched to
> a memory region whose MemoryRegionOps valid settings
> prohibit it (eg byte accesses to a word-access-only device),
> or accesses to a MemoryRegion that was created by passing
> a NULL MemoryRegionOps pointer to memory_region_init_io
> (I dunno why you'd do that but some code does).
>
> In short, there are lots of ways the memory subsystem might
> end up returning a transaction error -- this mechanism
> ensures that none of them start generating exceptions
> when they previously did not, and is (I hope) easy to
> review in the sense of being sure that it does what it
> intends to do without the need to audit a lot of corner
> cases.

So, this question (should we have a board flag to disable reporting
of tx failures to the CPU hook, or use unimplemented_device as a
sort of background region) seems to be the main unanswered question
for this series. I think (as outlined above) that the board flag
is simpler and safer; are people happy for me to put this series
in target-arm.next with that approach, or should I rethink this bit?

thanks
-- PMM
