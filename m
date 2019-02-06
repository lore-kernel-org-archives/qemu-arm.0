Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5730560wrt;
        Wed, 6 Feb 2019 01:24:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYORhys6ICJdPvmBxmGXw8hUFju2f8+rhoiRKKo8aNWww9JGuk67J6z0u+ZLQYo1peLN59A
X-Received: by 2002:a5b:b85:: with SMTP id l5mr7680683ybq.123.1549445063428;
        Wed, 06 Feb 2019 01:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549445063; cv=none;
        d=google.com; s=arc-20160816;
        b=zLpA/r2yJ1ecUnWAxFtTq7Owj2jDA3PrTCiyR0jWIt7mD0IANP6vqtItCioxSoU6w7
         FlmnYE/pos6fCuLooUxr01r3HTD2vm2Pr0esraVdwLKrvvhQ/Dn9nad2aZrggDjcOuzP
         A25y9/ZRhav+sSegdDowUQquSi+8W4+MIZasOrkV/C1UEA0OxbjfU9WePiAMMdD6BGa+
         GAugF/ipk2P/4eYPfgdZ6fQwJmDEdvJjxdhqGgdeaZuUSUhfMuNKaML6GLE5Xu8kqzQQ
         s6+ui9i5qmOwM26a0R6qSL877pbVLl9bKwBLOfACwbYh10Xz6mIV3aAYGYpbqvMUCa5N
         b1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=YdkFrxEpxvp7ecup+57z7c6DVWm7mJPWTpHHSLuhFPA=;
        b=MtjMDWajle5wfPJ8sYrFmGy0tDEKJuN9tg8PGcZ3kWRas0iKZgVegN0gN9XXpqMVEd
         POGwiXhBxjxXTNzfcoIvoBjCataEw4znGOVQyfUMJxywPmAO8/ht//pXEL6chBliIcXg
         90I7AWYraHJplvZTXGaOJW3udwrLgDrrXmCTnGr19m5mKhEpLk12cd1LF/4xwcOA8aHp
         5/IPkuzh3iKnAeUroRAuQUvKkb0Hq108NMEuwntm6MH8AgH/oaCOwi+EwnqFeW9rFLfz
         sUV4vPGWY31azd2QMEpWPMN/lXQ4xpGqhMea3kvqVGe/u6ohlYroFjBMQHeddYwvbqIo
         yp4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si3388800ywq.401.2019.02.06.01.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 01:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grJRO-0002Cd-Ta
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 04:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1grJR6-00029x-Nv
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 04:24:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1grJR5-0006RA-HM
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 04:24:04 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1grJR5-0006Py-9z
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 04:24:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id v16so4818165wrn.11
	for <qemu-devel@nongnu.org>; Wed, 06 Feb 2019 01:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YdkFrxEpxvp7ecup+57z7c6DVWm7mJPWTpHHSLuhFPA=;
	b=tu5nFrWd7bWmhVDhcJ8d2z4J8oODPIniDb8su4gJ6UIqZ9A+74peo/KPE7iopfkhF4
	XS9fFRs/lCCD8u4ywOaSPwQk7fERi7ZswyW9hmsrb8NiLZgxxPWOPCxjgB7otbKaG4we
	ogaeat9Fg842i0v2Be4dI9oYcX86N5eQPtcneilqlnrB5kUhkyBY0rNe7qA906GtfZ4T
	gCHnuP9wAyZ6oDudkjsxZ/c/w8crvKXWQtyFlATl42Bz3uiW/t7Ai0N89+KDk1W8stTC
	PC2CkSdHsvTHDAx3dgy6fiHC6E1fgsw0DO859chJaX4NSPcyWQquliMca1vlUJUFwJjZ
	Hyyg==
X-Gm-Message-State: AHQUAub0lw0P1Dbbp/WWQaBeZPcwZItpmJ7wnkHnq0Qr69sRXIhOCS66
	zxFj/+lgYCV8i/KyKr5xRQkV1GNm3+o=
X-Received: by 2002:a5d:6b8b:: with SMTP id n11mr6894919wrx.216.1549445037380; 
	Wed, 06 Feb 2019 01:23:57 -0800 (PST)
Received: from steredhat (host68-1-static.63-82-b.business.telecomitalia.it.
	[82.63.1.68]) by smtp.gmail.com with ESMTPSA id
	q15sm6745973wmj.46.2019.02.06.01.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Feb 2019 01:23:56 -0800 (PST)
Date: Wed, 6 Feb 2019 10:23:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190206092353.7tfo56bqasgg6vvo@steredhat>
References: <20190204204517.23698-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH] hw/input/tsc210x: Fix building with no
 verbosity
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UuOLnbzQB9yD

On Mon, Feb 04, 2019 at 09:45:17PM +0100, Philippe Mathieu-Daudé wrote:
> When building with TSC_VERBOSE not defined, we get:
>       CC      arm-softmmu/hw/input/tsc210x.o
>     hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
>     hw/input/tsc210x.c:554:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
>     hw/input/tsc210x.c:638:5: error: label at end of compound statement
>          bad_reg:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
>     hw/input/tsc210x.c:766:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1
> 
> Fix this by replacing the culprit fprintf(stderr) calls by a more
> recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
> are left untouched.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/tsc210x.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
