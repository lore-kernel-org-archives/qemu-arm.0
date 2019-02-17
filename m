Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1527366wrx;
        Sun, 17 Feb 2019 10:09:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY4NPtfviAZy8xzeg1n0tSIAMmvG3bA8XqTDo5wo8X1aduh5M6o5y24Mzfaz5s+uRt/hGMK
X-Received: by 2002:a81:1e13:: with SMTP id e19mr16494267ywe.234.1550426964698;
        Sun, 17 Feb 2019 10:09:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426964; cv=none;
        d=google.com; s=arc-20160816;
        b=VsduWCILXRrrhSAta0WqZQFHf7/mE4e0M5HBGru2CnHQQ5qrD+rhN+kipaChMyGlhE
         vCXx0Bqac8J/Ou3rTAzPXqsTSYw8YurF11gPFFZ9a5jwDHKKGyqH+U7eYQwEgGSqvnv3
         lYEuQAlhSh13k1RIIAyy4V+C6HrJdTaiCTqwIleZ9PWW53tgUHwTiu7UUcBxt7huCuTR
         psAxnqnhrHw7TNcIgrlYly3aBVGPMPymwg5O0sJxyC3IH0/NGMc+dRxLlm9Cmrgw4lix
         U1J/CQfC3vZidc+/zUPW0efhPk4cxZojFh1s8pbXLAJq1FIjfGE47KF1kv3Yb8MS+Jky
         VLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=DIdTpmCS+qk1ZwGd1Y+/a91lKw9BJopyWVg9S7MPqpE=;
        b=cYrCZmqw/2WKpg6/AyN/fHZebsvdGPMI8nx7WqVVku/zivDmAo1TWlSo6otL9a25tl
         DD90BzjS2+kyqY5sDRt/Tkmrw/ki+84VtvLmriJ4gF08xgGGikvb7JGxFjCwQgNk45mZ
         RGSv7XLXyutb6pvJC9/sORu5EkPvWBLVBTNy+WYtqPtwgi4ic8cID+elpTOzFXl2wMY7
         Q5kW4bJ2XROvg7LASAnSvBziEojwFLPr7ARxC0Vp+1cHPM1g7rAXLb4fZet/Hum0xWjl
         0wRNSetVlnmUdc8SHfkBZPAp8Zo1hmg1EmkvM/A48nlkHmq1alTBR3JaWZFbpXA4kPpb
         hppw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B3qu5c88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c203si239466ywb.249.2019.02.17.10.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:09:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B3qu5c88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQsW-0003h0-5U
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQsL-0003fd-8U
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQsK-0001cS-KE
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:09:13 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQsK-0001c7-EG
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:09:12 -0500
Received: by mail-pf1-x441.google.com with SMTP id n22so7362295pfa.3
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DIdTpmCS+qk1ZwGd1Y+/a91lKw9BJopyWVg9S7MPqpE=;
	b=B3qu5c88HZJL0bGtISk2e3s/XWlTbQAPPT6nOMOHd7enW/Noe6fc/xYvkQmLltEqUQ
	7x184TAcGvdJDJ7WKqZ89zBZ7+zNxFKxumQYirrxxRJFVjKDOSqowmXYKMQiGXqGIPma
	JZZUBgbViZi7KJqEIDxOXc9rKgjYwNSIN2TsyyX0hca0fhn4ti1xnGAWfBvVj9tj0lyA
	JCTzgWeXYVaGnrx95bD4aD7+tshMsv1Fgn+XV2lCUCTZeYPbDnKfdAYlvNhlnv27IRBz
	p2lEhsydWQQolH0D+DTCE6qO78ggnby7FICCNVOSWAucp6KZLCKMrAJFPh+ycyZVDBYl
	D7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DIdTpmCS+qk1ZwGd1Y+/a91lKw9BJopyWVg9S7MPqpE=;
	b=s7vKvcO2tBAtSjAlotGwBYWWm3Fs2KYh6G7HQ+/JxFVLfWGLRWOz7dv8ujkOE2AR9q
	mV0Ot4JA7ehaaFEacupUPsOjpFXwQb6M/EQIuVgmNNEU2p8is09xA8j7ObiSxZZ25Qs9
	ltFX2QTHjqzQsVbTfRpAG7sWBJeJN+/ugtmXME2t/hwoqiCVNJ93IlIY6kZDN+42MS1i
	XNKMFXcMMF3r7UNeKAV13pCG5X8ynkQTCFMaudgmX4lpqbYnwb35WJ1EG5IExMq7+xtX
	Z+Bu68PDp9w1qAh0nHdZBPy4fMeptHHjHgupzDElwzXwe/UZUtA7t33WqbKWwkF+96PJ
	TRoA==
X-Gm-Message-State: AHQUAuZbB8CRyjYmhV+L+lpR7yrj+ZTnAV/uTHMTNPp2gi9iw6oYM80f
	F1NrjPxymh2FaUizB2T30i5zXg==
X-Received: by 2002:aa7:8286:: with SMTP id s6mr19896192pfm.63.1550426951203; 
	Sun, 17 Feb 2019 10:09:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	b15sm21448313pfj.44.2019.02.17.10.09.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:09:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <42a585ac-5766-7042-13bd-7a50a8253460@linaro.org>
Date: Sun, 17 Feb 2019 10:09:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/14] hw/arm/musca.c: Implement
 models of the Musca-A and -B1 boards
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aduaK20/zMB4

On 2/14/19 4:51 AM, Peter Maydell wrote:
> The Musca-A and Musca-B1 development boards are based on the
> SSE-200 subsystem for embedded. Implement an initial skeleton
> model of these boards, which are similar but not identical.
> 
> This commit creates the board model with the SSE and the IRQ
> splitters to wire IRQs up to its two CPUs. As yet there
> are no devices and no memory: these will be added later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/musca.c                  | 197 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   6 +
>  default-configs/arm-softmmu.mak |   1 +
>  4 files changed, 205 insertions(+)
>  create mode 100644 hw/arm/musca.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

